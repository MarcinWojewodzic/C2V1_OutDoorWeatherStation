/*
 * BSensor.h
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */

#ifndef INC_BSENSOR_H_
#define INC_BSENSOR_H_
#include "main.h"
typedef enum
{
	BS_SATTE_INITIALIZE,
	BS_STATE_IDLE,
	BS_STATE_RUNNING,
	BS_STATE_WAIT_FOR_RESPONSE
}BSState_TypeDef;
typedef enum
{
	BS_EVENT_NOTHING,
	BS_EVENT_START,
	BS_EVENT_START_MEASURMENT,
	BS_EVENT_OK
}BSEventTypeDef;
typedef struct
{
	BSState_TypeDef State;
	BSEventTypeDef NewEvent;
}BS_TypeDef;
#endif /* INC_BSENSOR_H_ */
