/*
 * HC12.c
 *
 *  Created on: 22 paź 2022
 *      Author: M
 */
#include "HC12.h"
#include "main.h"
#include "usart.h"
void HC12_EnterCommandMode(void)
{
	HAL_GPIO_WritePin(HC12_SET_GPIO_Port, HC12_SET_Pin, 0);
}
void HC12_ExitCommandMode(void)
{
	HAL_GPIO_WritePin(HC12_SET_GPIO_Port, HC12_SET_Pin, 1);
}
void HC12_TransmitData(uint8_t* Data, uint32_t Length)
{
	HAL_UART_Transmit(&huart1, Data, Length, 1000);
}
void HC12_ReciveToIdleDMA(uint8_t *Data, uint32_t Length)
{
	HAL_UARTEx_ReceiveToIdle_DMA(&huart1, Data, Length);
}
