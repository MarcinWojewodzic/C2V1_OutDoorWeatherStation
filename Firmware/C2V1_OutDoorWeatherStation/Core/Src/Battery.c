/*
 * Battery.c
 *
 *  Created on: Nov 11, 2022
 *      Author: M
 */
#include "adc.h"
#include "main.h"
float ODWS_CheckBatteryLevel(void)
{
   uint32_t Temp;
   HAL_ADC_Start(&hadc1);
   HAL_ADC_PollForConversion(&hadc1, 1000);
   Temp = HAL_ADC_GetValue(&hadc1);
   Temp = 0;
   for(int i = 0; i < 10; i++)
   {
      HAL_ADC_Start(&hadc1);
      HAL_ADC_PollForConversion(&hadc1, 1000);
      Temp += HAL_ADC_GetValue(&hadc1);
   }
   return (3.3 / 4095 * (Temp / 10));
}
