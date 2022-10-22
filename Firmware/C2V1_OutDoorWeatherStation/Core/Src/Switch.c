/*
 * Switch.c
 *
 *  Created on: 9 paź 2022
 *      Author: M
 */
#include "Switch.h"
#include "main.h"
#include "stdio.h"
static void SW_ChangeState(void);
static void SW_InitializeFunction(void);
static void SW_IdleFunction(void);
static void SW_DebounceFunction(void);
static void SW_TickFunction(void);
static void SW_PressFunction(void);
static void SW_ConfirmFunction(void);
static void SW_ReleaseFunction(void);
static SW_TypeDef *Sw;
SWTransitionTable_TypeDef SwTransitionTable[] = { { SW_STATE_INITIALIZE, SW_STATE_IDLE, SW_EVENT_END_INITIALIZE },
                                                  { SW_STATE_IDLE, SW_STATE_DEBOUNCE, SW_EVENT_DEBOUNCE },
                                                  { SW_STATE_DEBOUNCE, SW_STATE_TICK, SW_EVENT_PRESS },
                                                  { SW_STATE_TICK, SW_STATE_PRESS, SW_EVENT_RELEASE },
                                                  { SW_STATE_PRESS, SW_STATE_CONFIRM, SW_EVENT_CONFIRM },
                                                  { SW_STATE_PRESS, SW_STATE_RELEASE, SW_EVENT_RELEASE },
                                                  { SW_STATE_CONFIRM, SW_STATE_RELEASE, SW_EVENT_RELEASE },
                                                  { SW_STATE_RELEASE, SW_STATE_IDLE, SW_EVENT_NOTHING } };
SWFunctions_TypeDef SwFunctions[]             = { { SW_InitializeFunction }, { SW_IdleFunction },    { SW_DebounceFunction }, { SW_TickFunction },
                                                  { SW_PressFunction },      { SW_ConfirmFunction }, { SW_ReleaseFunction } };
void Switch_Handle(void)
{
   SW_ChangeState();
   if(SwFunctions[Sw->State].SwFunction != NULL)
   {
      SwFunctions[Sw->State].SwFunction();
   }
}
static void SW_ChangeState(void)
{
   for(int i = 0; i < SW_TRANSITION_TABLE_SIZE; i++)
   {
      if(Sw->State == SwTransitionTable[i].Source && Sw->NewEvent == SwTransitionTable[i].Event)
      {
         Sw->State = SwTransitionTable[i].Destination;
         Sw->NewEvent = SW_EVENT_NOTHING;
         return;
      }
   }
   Sw->NewEvent = SW_EVENT_NOTHING;
}
static void SW_InitializeFunction(void)
{
   Sw->NewEvent = SW_EVENT_END_INITIALIZE;
   //HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, 1);
}
static void SW_IdleFunction(void)
{
   Sw->NewEvent = SW_EVENT_DEBOUNCE;
   //HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 1);
}
static void SW_DebounceFunction(void)
{
   Sw->NewEvent = SW_EVENT_PRESS;
   //HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, 1);
}
static void SW_TickFunction(void)
{
   Sw->NewEvent = SW_EVENT_RELEASE;
   //HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, 1);
}
static void SW_PressFunction(void)
{
   Sw->NewEvent = SW_EVENT_CONFIRM;
   //HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, 0);
}
static void SW_ConfirmFunction(void)
{
   Sw->NewEvent = SW_EVENT_RELEASE;
   //HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, 0);
}
static void SW_ReleaseFunction(void)
{
   //HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, 0);
   //HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, 0);
   Sw->NewEvent = SW_EVENT_NOTHING;
}
void SW_Init(SW_TypeDef *Switch)
{
   Sw = Switch;
}
