/*
 * SM.c
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */
#include "SM.h"
#include "BSensor.h"
#include "Data.h"
#include "main.h"
#include "stdio.h"
static void SM_InitializeFunction(void);
static void SM_RunningFunction(void);
static void SM_SleepFunction(void);
static void SM_ChangeState(void);
// SM_TypeDef Sm                               = { 0 };
SMTransitionTable_TypeDef SmTransitionTable[] = { { SM_STATE_INITIALIZE, SM_STATE_RUNNING, SM_EVENT_END_INITIALIZE },
                                                { SM_STATE_RUNNING, SM_STATE_SLEEP, SM_EVENT_END_RUNNING },
                                                { SM_STATE_SLEEP, SM_STATE_RUNNING, SM_EVENT_END_SLEEP } };
SMFunctions_TypeDef SmFunctions[]           = { { SM_InitializeFunction }, { SM_RunningFunction }, { SM_SleepFunction } };
void SM_Handle(void)
{
   if(HAL_GetTick() - DATA_GetSmPtr()->LastTick > 1000)
   {
      DATA_GetSmPtr()->LastTick = HAL_GetTick();
      SM_ChangeState();
      if(SmFunctions[DATA_GetSmPtr()->State].SmFunction != NULL)
      {
         SmFunctions[DATA_GetSmPtr()->State].SmFunction();
      }
   }
}
static void SM_ChangeState(void)
{
   for(int i = 0; i < SM_TRANSITION_TABLE_SIZE; i++)
   {
      if(DATA_GetSmPtr()->State == SmTransitionTable[i].Source && DATA_GetSmPtr()->NewEvent == SmTransitionTable[i].Event)
      {
         DATA_GetSmPtr()->State = SmTransitionTable[i].Destination;
      }
   }
   DATA_GetSmPtr()->NewEvent = SM_EVENT_NOTHING;
}
static void SM_InitializeFunction(void)
{
   DATA_GetSmPtr()->Bs       = DATA_GetBsPtr();
   DATA_GetSmPtr()->Sw       = DATA_GetSwPtr();
   DATA_GetSmPtr()->NewEvent = SM_EVENT_END_INITIALIZE;
}
static void SM_RunningFunction(void)
{
   HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 1);
   DATA_GetSmPtr()->NewEvent = SM_EVENT_END_RUNNING;
}
static void SM_SleepFunction(void)
{
   HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 0);
   DATA_GetSmPtr()->NewEvent = SM_EVENT_END_SLEEP;
}
