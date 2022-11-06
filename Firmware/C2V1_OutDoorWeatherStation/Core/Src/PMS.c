/*
 * PMS.c
 *
 *  Created on: Nov 6, 2022
 *      Author: M
 */
#include "PMS.h"
#include "main.h"
#include "usart.h"
void PMS_Reset(void)
{
   HAL_GPIO_WritePin(PMS_RST_GPIO_Port, PMS_RST_Pin, 0);
   HAL_Delay(1000);
   HAL_GPIO_WritePin(PMS_RST_GPIO_Port, PMS_RST_Pin, 1);
}
void PMS_ReceiveToIdle(uint8_t *Data, uint32_t Length)
{
   HAL_UARTEx_ReceiveToIdle_DMA(&huart2, Data, Length);
}
void PMS_EnterSleepMode(void)
{
	HAL_GPIO_WritePin(PMS_SET_GPIO_Port, PMS_SET_Pin, 0);
}
void PMS_ExitSleepMode(void)
{
	HAL_GPIO_WritePin(PMS_SET_GPIO_Port, PMS_SET_Pin, 1);
}
