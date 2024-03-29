/*
 * SM.c
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */
#include "SM.h"
#include "AHT15.h"
#include "Battery.h"
#include "MAXProtocol.h"
#include "OneWire.h"
#include "PMS.h"
#include "i2c.h"
#include "main.h"
#include "rfp.h"
#include "rtc.h"
#include "stdio.h"
#include "tim.h"
#include "usart.h"
void RFP_CommadTestFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void RFP_CommandStartMeasurmentFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void RFP_CommandResetFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void RFP_CommandEnterDebugModeFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void RFP_CommandExitDebugModeFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void RFP_CommandEnterDeepSleepFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
void MAX_DataFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
static void SM_InitializeFunction(void);
static void SM_RunningFunction(void);
static void SM_WaitForSendFunction(void);
static void SM_SleepFunction(void);
static void SM_WakeUpFunctiomn(void);
static void SM_ChangeState(void);
static void SM_FillPayloadFunction(void);
SM_TypeDef Sm           = { 0 };
SW_TypeDef Sw           = { 0 };
RFP_TypeDef Rfp         = { 0 };
MAX_TypeDef MAX         = { 0 };
uint8_t PMSData[100]    = { 0 };
uint8_t DataSensor[100] = { 0 };
SMTransitionTable_TypeDef SmTransitionTable[]
    = { { SM_STATE_INITIALIZE, SM_STATE_RUNNING, SM_EVENT_END_INITIALIZE }, { SM_STATE_RUNNING, SM_STATE_SLEEP, SM_EVENT_END_RUNNING },
        { SM_STATE_SLEEP, SM_STATE_RUNNING, SM_EVENT_END_SLEEP },           { SM_STATE_RUNNING, SM_STATE_WAIT_FOR_SEND, SM_EVENT_WAIT_FOR_SEND },
        { SM_STATE_WAIT_FOR_SEND, SM_STATE_SLEEP, SM_EVENT_SEND_DATA },     { SM_STATE_SLEEP, SM_STATE_WAKEUP, SM_EVENT_WAKEUP },
        { SM_STATE_WAKEUP, SM_STATE_RUNNING, SM_EVENT_END_SLEEP } };
SMFunctions_TypeDef SmFunctions[]
    = { { SM_InitializeFunction }, { SM_RunningFunction }, { SM_WaitForSendFunction }, { SM_SleepFunction }, { SM_WakeUpFunctiomn } };
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
   RFP_RegisterCommandFunction(RFP_RESET, RFP_CommandResetFunction);
   RFP_RegisterCommandFunction(RFP_ENTER_DEBUG_MODE, RFP_CommandEnterDebugModeFunction);
   RFP_RegisterCommandFunction(RFP_GO_TO_DEEP_SLEEP, RFP_CommandEnterDeepSleepFunction);
   RFP_RegisterCommandFunction(RFP_EXIT_DEBUG_MODE, RFP_CommandExitDebugModeFunction);
   MAX_RegisterDataFunction(MAX_DataFunction);
   Sm.NewEvent = SM_EVENT_END_INITIALIZE;
    //Sm.SensorFlag = SENSOR_FLAG_SET;
   PMS_Reset();
   PMS_EnterSleepMode();
   // Sm.DeepSleepFlag     = SENSOR_FLAG_SET;
   // Sm.DurationDeepSleep = 10;
   // Sm.SensorFlag        = SENSOR_FLAG_SET;
}
static void SM_RunningFunction(void)
{
   Switch_Handle();
   Sm.CntMs++;
   Sm.BatteryVoltage = ODWS_CheckBatteryLevel();
   if(MAX.State == MAX_STATE_IDLE && Rfp.State == RFP_STATE_IDLE)
   {
      if(Sm.SensorFlag == SENSOR_FLAG_SET)
      {
         Sm.SensorFlag                    = SENSOR_FLAG_RESET;
         Sm.StartReadSensorMeasurmentFlag = SENSOR_FLAG_SET;
         uint8_t Temp                     = MAX_START_MEASURMENT;
         MAX_SendData(MAX_BS, MAX_COMMAND, &Temp, 1);
         PMS_ExitSleepMode();
         Sm.PMSFlag = SENSOR_FLAG_RESET;
         Sm.CntMs   = 0;
      }
      else if(Sm.StartReadSensorMeasurmentFlag == SENSOR_FLAG_SET)
      {
         if(Sm.CntMs >= ALL_SENSOR_DELAY)
         {
            AHT15_TriggerMeasurment();
#ifndef DEBUG_SWCLK
            HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, 1);
            HAL_UARTEx_ReceiveToIdle_DMA(&huart2, PMSData, 100);
            uint32_t Time = HAL_GetTick();
            while(Sm.PMSFlag == SENSOR_FLAG_RESET)
            {
               if(HAL_GetTick() - Time > PMS_MAX_TIMEOUT)
               {
                  break;
               }
            }
            HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, 0);
            if(HAL_GetTick() - Time < 500)
            {
               HAL_Delay(500);
            }
#else
            HAL_Delay(500);
#endif

            AHT15_ReadMesurmentFloat(&Sm.AHT15_Temperature, &Sm.AHT15_Humidity);
            __disable_irq();
            SM_FillPayloadFunction();
            __enable_irq();
            RFP_SendData(RFP_IDWS, RFP_DATA, DataSensor, 34);
            Sm.NewEvent                      = SM_EVENT_WAIT_FOR_SEND;
            Sm.CntMs                         = 0;
            Sm.StartReadSensorMeasurmentFlag = SENSOR_FLAG_RESET;
            RFP_Handle();
            PMS_EnterSleepMode();
         }
      }
      else
      {
         Sm.NewEvent = SM_EVENT_END_RUNNING;
      }
   }
}
static void SM_WaitForSendFunction(void)
{
   Sm.CntMs++;
   if(Rfp.State != RFP_STATE_IDLE)
   {
      if(Sm.CntMs > ALL_SENSOR_DELAY + 9000)
      {
         Sm.CntMs    = 0;
         Sm.NewEvent = SM_EVENT_SEND_DATA;
      }
   }
   else
   {
      Sm.NewEvent = SM_EVENT_SEND_DATA;
      Sm.CntMs    = 0;
   }
}
static void SM_SleepFunction(void)
{
   if(Sm.DeepSleepFlag == SENSOR_FLAG_SET)
   {
      Sm.DeepSleepFlag = SENSOR_FLAG_RESET;
      HAL_RTCEx_SetWakeUpTimer_IT(&hrtc, Sm.DurationDeepSleep, RTC_WAKEUPCLOCK_CK_SPRE_16BITS);
      HAL_SuspendTick();
      HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
      HAL_ResumeTick();
      SystemClock_Config();
      Sm.NewEvent = SM_EVENT_WAKEUP;
   }
   else
   {
      HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, 0);
      HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 0);
      HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, 0);
      HAL_SuspendTick();
      HAL_PWR_EnterSLEEPMode(PWR_MAINREGULATOR_ON, PWR_STOPENTRY_WFI);
      HAL_ResumeTick();
      Sm.NewEvent = SM_EVENT_END_SLEEP;
   }
}
static void SM_WakeUpFunctiomn(void)
{
   uint8_t Temp = RFP_EXIT_DEEP_SLEEP;
   RFP_SendData(RFP_IDWS, RFP_MESSAGE, &Temp, 1);
   RFP_Handle();
   Sm.NewEvent = SM_EVENT_END_SLEEP;
}
static void SM_FillPayloadFunction(void)
{
   uint8_t *TempPtr = NULL;
   TempPtr          = &Sm.AHT15_Humidity;
   DataSensor[0]    = RFP_HUMIDITI_AHT_15;
   DataSensor[1]    = *TempPtr;
   TempPtr++;
   DataSensor[2] = *TempPtr;
   TempPtr++;
   DataSensor[3] = *TempPtr;
   TempPtr++;
   DataSensor[4] = *TempPtr;
   TempPtr       = &Sm.AHT15_Temperature;
   DataSensor[5] = RFP_TEMPERATURE_AHT_15;
   DataSensor[6] = *TempPtr;
   TempPtr++;
   DataSensor[7] = *TempPtr;
   TempPtr++;
   DataSensor[8] = *TempPtr;
   TempPtr++;
   DataSensor[9]  = *TempPtr;
   TempPtr        = Sm.Brightness;
   DataSensor[10] = RFP_BRIGHTNESS;
   DataSensor[11] = ((Sm.Brightness >> 8));
   DataSensor[12] = (Sm.Brightness & 0xff);
   TempPtr        = &Sm.BatteryVoltage;
   DataSensor[13] = RFP_BATTERY_LEVEL;
   DataSensor[14] = *TempPtr;
   TempPtr++;
   DataSensor[15] = *TempPtr;
   TempPtr++;
   DataSensor[16] = *TempPtr;
   TempPtr++;
   DataSensor[17] = *TempPtr;
   DataSensor[18] = RFP_BATTERY_STATE;
   DataSensor[19] = GPIOA->IDR & 0x03;
   DataSensor[20] = RFP_AIR_POLLUTION_PM1;
   DataSensor[21] = PMSData[10];
   DataSensor[22] = PMSData[11];
   DataSensor[23] = RFP_AIR_POLLUTION_PM10;
   DataSensor[24] = PMSData[8];
   DataSensor[25] = PMSData[9];
   DataSensor[26] = RFP_AIR_POLLUTION_PM25;
   DataSensor[27] = PMSData[12];
   DataSensor[28] = PMSData[13];
   TempPtr        = &Sm.EXT_Temperature;
   DataSensor[29] = RFP_EXTERNAL_MODULE_TEMPERATURE;
   DataSensor[30] = *TempPtr;
   TempPtr++;
   DataSensor[31] = *TempPtr;
   TempPtr++;
   DataSensor[32] = *TempPtr;
   TempPtr++;
   DataSensor[33] = *TempPtr;
   TempPtr        = NULL;
}
void RFP_CommadTestFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, 1);
}
void RFP_CommandStartMeasurmentFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   Sm.SensorFlag = SENSOR_FLAG_SET;
}
void RFP_CommandResetFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_GPIO_TogglePin(LED0_GPIO_Port, LED0_Pin);
   HAL_Delay(1000);
   HAL_NVIC_SystemReset();
}
void RFP_CommandEnterDebugModeFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_TIM_Base_Start_IT(&htim17);
}
void RFP_CommandEnterDeepSleepFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   Sm.DeepSleepFlag = SENSOR_FLAG_SET;
}
void RFP_CommandExitDebugModeFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_TIM_Base_Stop_IT(&htim17);
}
void MAX_DataFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 1);
   Sm.Brightness = ((Data[DataStart] << 8) | Data[DataStart + 1]);
}
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size)
{
   if(huart->Instance == USART1)
   {
      Rfp.DataSize = Size;
      RFP_InterruptTask();
   }
   else if(huart->Instance == LPUART1)
   {
      HAL_GPIO_TogglePin(LED1_GPIO_Port, LED1_Pin);
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
      if(PMSData[0] == 0x42)
      {
         Sm.PMSFlag = SENSOR_FLAG_SET;
         HAL_GPIO_TogglePin(LED2_GPIO_Port, LED2_Pin);
      }
      else
      {
         HAL_UARTEx_ReceiveToIdle_DMA(&huart2, PMSData, 100);
      }
   }
}
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
   HAL_GPIO_TogglePin(LED0_GPIO_Port, LED0_Pin);
}
