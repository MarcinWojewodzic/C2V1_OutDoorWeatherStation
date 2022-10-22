/*
 * SM.c
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */
#include "SM.h"
#include "BSensor.h"
#include "main.h"
#include "rfp.h"
#include "stdio.h"
void SM_CommadTestFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart);
static void SM_InitializeFunction(void);
static void SM_RunningFunction(void);
static void SM_SleepFunction(void);
static void SM_ChangeState(void);
SM_TypeDef Sm                                 = { 0 };
SW_TypeDef Sw                                 = { 0 };
RFP_TypeDef Rfp                               = { 0 };
SMTransitionTable_TypeDef SmTransitionTable[] = { { SM_STATE_INITIALIZE, SM_STATE_RUNNING, SM_EVENT_END_INITIALIZE },
                                                  { SM_STATE_RUNNING, SM_STATE_SLEEP, SM_EVENT_END_RUNNING },
                                                  { SM_STATE_SLEEP, SM_STATE_RUNNING, SM_EVENT_END_SLEEP } };
SMFunctions_TypeDef SmFunctions[]             = { { SM_InitializeFunction }, { SM_RunningFunction }, { SM_SleepFunction } };
void SM_Handle(void)
{
   if(Rfp.Initialize == RFP_INITIALIZE)
   {
      RFP_Handle();
   }
   if(HAL_GetTick() - Sm.LastTick > 1000)
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
   // Sm.Bs       = DATA_GetBsPtr();
   Sm.Sw  = &Sw;
   Sm.Rfp = &Rfp;
   SW_Init(&Sw);
   RFP_Init(&Rfp, RFP_ODWS);
   RFP_RegisterCommandFunction(RFP_TEST, SM_CommadTestFunction);
   Sw.NewEvent = SW_EVENT_NOTHING;
   Sw.State    = SW_STATE_INITIALIZE;
   Sm.NewEvent = SM_EVENT_END_INITIALIZE;
}
static void SM_RunningFunction(void)
{
   Switch_Handle();
   Sm.NewEvent = SM_EVENT_END_RUNNING;
}
static void SM_SleepFunction(void)
{
   Sm.NewEvent = SM_EVENT_END_SLEEP;
}
void SM_CommadTestFunction(uint8_t *Data, uint32_t DataLength, uint32_t DataStart)
{
   HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, 1);
}
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size)
{
   HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 1);
   Rfp.DataSize = Size;
   RFP_InterruptTask();
}
