/*
 * SM.h
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */

#ifndef INC_SM_H_
#define INC_SM_H_
#include "BSensor.h"
#include "Switch.h"
#include "main.h"
#include "rfp.h"
#define SM_TRANSITION_TABLE_SIZE sizeof(SmTransitionTable) / sizeof(SMTransitionTable_TypeDef)
typedef enum
{
   SM_STATE_INITIALIZE,
   SM_STATE_RUNNING,
   SM_STATE_SLEEP
} SMState_TypeDef;
typedef enum
{
   SM_EVENT_NOTHING,
   SM_EVENT_END_INITIALIZE,
   SM_EVENT_END_RUNNING,
   SM_EVENT_END_SLEEP
} SMEvent_TypeDef;
typedef struct
{
   SMState_TypeDef Source;
   SMState_TypeDef Destination;
   SMEvent_TypeDef Event;
} SMTransitionTable_TypeDef;
typedef struct
{
   void (*SmFunction)(void);
} SMFunctions_TypeDef;
typedef struct
{
   SMState_TypeDef State;
   SMEvent_TypeDef NewEvent;
   BS_TypeDef *Bs;
   SW_TypeDef *Sw;
   RFP_TypeDef *Rfp;
   uint32_t LastTick;
} SM_TypeDef;
void SM_Handle(void);
#endif /* INC_SM_H_ */
