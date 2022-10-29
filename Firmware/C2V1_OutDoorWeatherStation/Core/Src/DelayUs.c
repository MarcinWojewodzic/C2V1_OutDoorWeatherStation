/*
 * DelayUs.c
 *
 *  Created on: Oct 23, 2022
 *      Author: M
 */

#ifndef SRC_DELAYUS_C_
#define SRC_DELAYUS_C_
#include "DelayUs.h"
#include "main.h"
#include "tim.h"
TIM_HandleTypeDef *TimUs;
void TIM_DelayUs(uint32_t DelayUs)
{
   TimUs->Instance->CNT = 0;
   while(TimUs->Instance->CNT < DelayUs)
   {
   }
}
void TIM_Init(TIM_HandleTypeDef *tim)
{
   TimUs = tim;
   HAL_TIM_Base_Start(TimUs);
}

#endif /* SRC_DELAYUS_C_ */
