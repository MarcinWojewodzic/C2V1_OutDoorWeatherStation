/*
 * Data.h
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */

#ifndef INC_DATA_H_
#define INC_DATA_H_
#include "BSensor.h"
#include "SM.h"
#include "Switch.h"
#include "main.h"
SM_TypeDef *DATA_GetSmPtr(void);
BS_TypeDef *DATA_GetBsPtr(void);
SW_TypeDef *DATA_GetSwPtr(void);
#endif /* INC_DATA_H_ */
