/*
 * HC12.h
 *
 *  Created on: 22 paź 2022
 *      Author: M
 */

#ifndef INC_HC12_H_
#define INC_HC12_H_
#include "main.h"
void HC12_EnterCommandMode(void);
void HC12_ExitCommandMode(void);
void HC12_TransmitData(uint8_t* Data, uint32_t Length);
void HC12_ReciveToIdleDMA(uint8_t *Data, uint32_t Length);
#endif /* INC_HC12_H_ */
