/*
 * Switch.h
 *
 *  Created on: 9 paź 2022
 *      Author: M
 */

#ifndef INC_SWITCH_H_
#define INC_SWITCH_H_
#include "main.h"
#define SW_TRANSITION_TABLE_SIZE sizeof(SwTransitionTable) / sizeof(SWTransitionTable_TypeDef)
typedef enum
{
   SW_STATE_INITIALIZE,
   SW_STATE_IDLE,
   SW_STATE_DEBOUNCE,
   SW_STATE_TICK,
   SW_STATE_PRESS,
   SW_STATE_CONFIRM,
   SW_STATE_RELEASE
} SWState_TypeDef;
typedef enum
{
   SW_EVENT_END_INITIALIZE,
   SW_EVENT_NOTHING,
   SW_EVENT_DEBOUNCE,
   SW_EVENT_PRESS,
   SW_EVENT_RELEASE,
   SW_EVENT_CONFIRM
} SWEvent_TypeDef;
typedef enum
{
   SW_NO_PRESS,
   SW_PRESS
} SWDefaultPinState_TypeDef;
typedef struct
{
   SWState_TypeDef State;
   SWEvent_TypeDef NewEvent;
   SWDefaultPinState_TypeDef DefaultPinState;
   uint32_t TimeOfPressing;
   uint32_t TimeOfRelease;
} SW_TypeDef;
typedef struct
{
   SWState_TypeDef Source;
   SWState_TypeDef Destination;
   SWEvent_TypeDef Event;
} SWTransitionTable_TypeDef;
typedef struct
{
   void (*SwFunction)(void);
} SWFunctions_TypeDef;
void Switch_Handle(void);
void SW_Init(SW_TypeDef *Switch);
#endif /* INC_SWITCH_H_ */
