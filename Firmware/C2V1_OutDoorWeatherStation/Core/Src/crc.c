/*
 * crc.c
 *
 *  Created on: 22 paź 2022
 *      Author: M
 */
#include "crc.h"
#include "main.h"
uint32_t Crc(uint32_t PreviousCRC, uint32_t DataLength, uint8_t *data)
{
   PreviousCRC ^= data[0];
   for(uint32_t i = 1; i < DataLength; i++)
   {
      uint32_t temp = data[i];
      PreviousCRC ^= ((uint32_t)temp * (256 * i));
      if(PreviousCRC & 0x80000000)
      {
         PreviousCRC ^= 0xABC245C2;
      }
      PreviousCRC <<= 1;
   }
   return PreviousCRC;
}
CRCStatus_TypeDef RepareMessage(uint32_t OryginalCRC, uint8_t *data, uint32_t DataLength)
{
   uint8_t temp = 1;
   for(int i = 0; i < DataLength; i++)
   {
      for(int j = 0; j < 8; j++)
      {
         data[i] ^= (temp << j);
         if(OryginalCRC == Crc(CRC_INITIAL_VALUE, DataLength, data))
         {
            return CRC_OK;
         }
         else
         {
            data[i] ^= (temp << j);
         }
      }
   }
   return CRC_ERROR;
}
