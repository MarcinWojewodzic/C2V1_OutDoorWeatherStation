/*
 * Data.c
 *
 *  Created on: Oct 9, 2022
 *      Author: M
 */
#include "Data.h"
#include "BSensor.h"
#include "SM.h"
#include "Switch.h"
#include "main.h"
SM_TypeDef SmPtr = { 0 };
BS_TypeDef BsPtr = { 0 };
SW_TypeDef SwPtr = { 0 };
SM_TypeDef *DATA_GetSmPtr(void)
{
   return &SmPtr;
}
BS_TypeDef *DATA_GetBsPtr(void)
{
   return &BsPtr;
}
SW_TypeDef *DATA_GetSwPtr(void)
{
   return &SwPtr;
}
