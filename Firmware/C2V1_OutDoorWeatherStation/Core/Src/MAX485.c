/*
 * MAX485.c
 *
 *  Created on: Oct 29, 2022
 *      Author: M
 */

#include "MAX485.h"
#include "main.h"
#include "usart.h"
static void MAX485_ListeningMode(void)
{
   HAL_GPIO_WritePin(MAX485_SEL_GPIO_Port, MAX485_SEL_Pin, 0);
}
static void MAX485_TransmitMode(void)
{
   HAL_GPIO_WritePin(MAX485_SEL_GPIO_Port, MAX485_SEL_Pin, 1);
}
void MAX485_ReciveToIdleDMA(uint8_t *Data, uint16_t Length)
{
   MAX485_ListeningMode();
   HAL_UARTEx_ReceiveToIdle_DMA(&hlpuart1, Data, Length);
}
void MAX485_TransmitData(uint8_t *Data, uint16_t Length)
{
   MAX485_TransmitMode();
   __disable_irq();
   HAL_UART_Transmit(&hlpuart1, Data, Length, 1000);
   __enable_irq();
   MAX485_ListeningMode();
}
