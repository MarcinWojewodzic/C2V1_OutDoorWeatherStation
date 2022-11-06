/*
 * SM.c
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */
#include "SM.h"
#include "AHT15.h"
#include "MAXProtocol.h"
#include "OneWire.h"
#include "PMS.h"
#include "i2c.h"
#include "main.h"
#include "rfp.h"
#include "stdio.h"
#include "tim.h"
#include "usart.h"
void RFP_CommadTestFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void RFP_CommandStartMeasurmentFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void MAX_DataFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
static void SM_InitializeFunction(void);
static void SM_RunningFunction(void);
static void SM_WaitForMeasurmentFunction(void);
static void SM_SleepFunction(void);
static void SM_ChangeState(void);
SM_TypeDef Sm                                 = { 0 };
SW_TypeDef Sw                                 = { 0 };
RFP_TypeDef Rfp                               = { 0 };
MAX_TypeDef MAX                               = { 0 };
uint8_t PMSData[100]                          = { 0 };
SMTransitionTable_TypeDef SmTransitionTable[] = { { SM_STATE_INITIALIZE, SM_STATE_RUNNING, SM_EVENT_END_INITIALIZE },
                                                  { SM_STATE_RUNNING, SM_STATE_SLEEP, SM_EVENT_END_RUNNING },
                                                  { SM_STATE_SLEEP, SM_STATE_RUNNING, SM_EVENT_END_SLEEP },
                                                  { SM_STATE_RUNNING, SM_STATE_WAIT_FOR_MEASURMENT, SM_EVENT_WAIT_FOR_MEASURMENT },
                                                  { SM_STATE_WAIT_FOR_MEASURMENT, SM_STATE_SLEEP, SM_EVENT_SEND_DATA } };
SMFunctions_TypeDef SmFunctions[] = { { SM_InitializeFunction }, { SM_RunningFunction }, { SM_WaitForMeasurmentFunction }, { SM_SleepFunction } };
void SM_Handle(void)
{
   if(Rfp.Initialize == RFP_INITIALIZE)
   {
      RFP_Handle();
   }
   if(MAX.Initialize == MAX_INITIALIZE)
   {
      MAX_Handle();
   }
   if(HAL_GetTick() - Sm.LastTick > 10)
   {
      Sm.LastTick = HAL_GetTick();
      SM_ChangeState();
      if(SmFunctions[Sm.State].SmFunction != NULL)
      {
         SmFunctions[Sm.State].SmFunction();
      }
   }
}
static void SM_ChangeState(void)
{
   for(int i = 0; i < SM_TRANSITION_TABLE_SIZE; i++)
   {
      if(Sm.State == SmTransitionTable[i].Source && Sm.NewEvent == SmTransitionTable[i].Event)
      {
         Sm.State = SmTransitionTable[i].Destination;
      }
   }
   Sm.NewEvent = SM_EVENT_NOTHING;
}
static void SM_InitializeFunction(void)
{
   Sm.Sw  = &Sw;
   Sm.Rfp = &Rfp;
   Sm.Max = &MAX;
   SW_Init(&Sw);
   RFP_Init(&Rfp, RFP_ODWS);
   MAX_Init(&MAX, MAX_ODWS);
   AHT15_InitFunction(&hi2c1);
   RFP_RegisterCommandFunction(RFP_TEST, RFP_CommadTestFunction);
   RFP_RegisterCommandFunction(RFP_START_MEASURMENT, RFP_CommandStartMeasurmentFunction);
   MAX_RegisterDataFunction(MAX_DataFunction);
   uint8_t Temp = MAX_START_MEASURMENT;
   MAX_SendData(MAX_BS, MAX_COMMAND, &Temp, 1);
   Sm.NewEvent = SM_EVENT_END_INITIALIZE;
   PMS_Reset();
   PMS_ExitSleepMode();
   HAL_UARTEx_ReceiveToIdle_DMA(&huart2, PMSData, 100);
}
static void SM_RunningFunction(void)
{
   Switch_Handle();
   if(Sw.State == SW_STATE_IDLE && MAX.State == MAX_STATE_IDLE && Rfp.State == RFP_STATE_IDLE)
   {
      if(Sm.SensorFlag == SENSOR_FLAG_SET)
      {
         Sm.SensorFlag = SENSOR_FLAG_RESET;
         Sm.NewEvent   = SM_EVENT_WAIT_FOR_MEASURMENT;
         AHT15_TriggerMeasurment();
         PMS_ExitSleepMode();
      }
      else
      {
         Sm.NewEvent = SM_EVENT_END_RUNNING;
      }
   }
}
static void SM_WaitForMeasurmentFunction(void)
{
   Sm.CntMs++;
   if(Sm.CntMs > ALL_SENSOR_DELAY)
   {
      float t, h;
      AHT15_ReadMesurmentFloat(&t, &h);
      Sm.CntMs = 0;
   }
}
static void SM_SleepFunction(void)
{
   Sm.NewEvent = SM_EVENT_END_SLEEP;
}
void RFP_CommadTestFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, 1);
}
void RFP_CommandStartMeasurmentFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   Sm.SensorFlag = SENSOR_FLAG_SET;
}
void MAX_DataFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 1);
}
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size)
{
   HAL_GPIO_TogglePin(LED2_GPIO_Port, LED2_Pin);
   if(huart->Instance == USART1)
   {
      Rfp.DataSize = Size;
      RFP_InterruptTask();
   }
   else if(huart->Instance == LPUART1)
   {
      if(Size > 4 && Size < 101)
      {
         MAX.DataSize = Size;
         MAX_InterruptTask();
      }
      else
      {
         MAX_InterruptErrorTask();
      }
   }
   else if(huart->Instance == USART2)
   {
      HAL_UARTEx_ReceiveToIdle_DMA(&huart2, PMSData, 100);
   }
}
