/*
 * SM.h
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */

#ifndef INC_SM_H_
#define INC_SM_H_
#include "MAXProtocol.h"
#include "Switch.h"
#include "main.h"
#include "rfp.h"
#define SM_TRANSITION_TABLE_SIZE sizeof(SmTransitionTable) / sizeof(SMTransitionTable_TypeDef)
#define ALL_SENSOR_DELAY         9000 // 90 s
typedef enum
{
   SM_STATE_INITIALIZE,
   SM_STATE_RUNNING,
   SM_STATE_WAIT_FOR_MEASURMENT,
   SM_STATE_SLEEP
} SMState_TypeDef;
typedef enum
{
   SM_EVENT_NOTHING,
   SM_EVENT_END_INITIALIZE,
   SM_EVENT_END_RUNNING,
   SM_EVENT_WAIT_FOR_MEASURMENT,
   SM_EVENT_SEND_DATA,
   SM_EVENT_END_SLEEP
} SMEvent_TypeDef;
typedef enum
{
   SENSOR_FLAG_RESET,
   SENSOR_FLAG_SET
} SensorFlag_TypeDef;
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
   SW_TypeDef *Sw;
   RFP_TypeDef *Rfp;
   MAX_TypeDef *Max;
   uint32_t LastTick;
   SensorFlag_TypeDef SensorFlag;
   SensorFlag_TypeDef PMSFlag;
   uint32_t CntMs;
} SM_TypeDef;
void SM_Handle(void);
#endif /* INC_SM_H_ */
