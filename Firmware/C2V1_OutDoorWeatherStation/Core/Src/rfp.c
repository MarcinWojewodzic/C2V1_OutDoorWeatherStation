/*
 * rfp.c
 *
 *  Created on: 22 paź 2022
 *      Author: M
 */
#include "rfp.h"
#include "HC12.h"
#include "crc.h"
#include "main.h"
#include "stdio.h"
uint8_t RfpData[20] = { 0 };
static RFP_TypeDef *Rfp;
static void RFP_ChangeState(void);
static void RFP_InitializeFunction(void);
static void RFP_IdleFunction(void);
static void RFP_ParseFunction(void);
static void RFP_RunningFunction(void);
static void RFP_SendResponseFunction(RFPMessageType_TypeDef Response);
void RFP_SendData(RFPDeviceID_TypeDef Destination, RFPMessageType_TypeDef Type, uint8_t *Data, uint32_t Length);
static RFPTransitionTable_TypeDef RfpTransitionTable[] = { { RFP_STATE_INITIALIZE, RFP_STATE_IDLE, RFP_EVENT_END_INITIALIZE },
                                                           { RFP_STATE_IDLE, RFP_STATE_PARSE, RFP_EVENT_NEW_DATA },
                                                           { RFP_STATE_PARSE, RFP_STATE_IDLE, RFP_EVENT_ERROR },
                                                           { RFP_STATE_PARSE, RFP_STATE_RUNNING, RFP_EVENT_DATA_OK },
                                                           { RFP_STATE_RUNNING, RFP_STATE_IDLE, RFP_EVENT_NOTHING },
                                                           { RFP_STATE_WAIT_FOR_RESPONSE, RFP_STATE_IDLE, RFP_EVENT_DATA_OK } };
RFPFunctions_TypeDef RfpFunction[] = { { RFP_InitializeFunction }, { RFP_IdleFunction }, { RFP_ParseFunction }, { RFP_RunningFunction } };
RFPCommandFunctions_TypeDef RfpCommandFunction[RFP_COMMAND_CNT];
RFPDataFunctions_TypeDef RfpDataFunction;
RFPMessageFunctions_TypeDef RfpMessageFunction[RFP_MESSAGE_CNT];
void RFP_Handle(void)
{
   RFP_ChangeState();
   if(RfpFunction[Rfp->State].RfpFunction != NULL)
   {
      RfpFunction[Rfp->State].RfpFunction();
   }
}
void RFP_Init(RFP_TypeDef *RadioProtocol, RFPDeviceID_TypeDef Device)
{
   Rfp             = RadioProtocol;
   Rfp->Initialize = RFP_INITIALIZE;
   Rfp->DeviceType = Device;
   for(int i = 0; i < RFP_COMMAND_CNT; i++)
   {
      RfpCommandFunction[i].RfpCommandFunction = NULL;
   }
   for(int i = 0; i < RFP_MESSAGE_CNT; i++)
   {
      RfpMessageFunction[i].RfpMessageFunction = NULL;
   }
   RfpDataFunction.RfpDataFunction = NULL;
}
static void RFP_ChangeState(void)
{
   for(int i = 0; i < RFP_TRANSITION_TABLE_SIZE; i++)
   {
      if(Rfp->State == RfpTransitionTable[i].Source && Rfp->NewEvent == RfpTransitionTable[i].Event)
      {
         Rfp->State    = RfpTransitionTable[i].Destination;
         Rfp->NewEvent = RFP_EVENT_NOTHING;
         return;
      }
   }
   Rfp->NewEvent = RFP_EVENT_NOTHING;
}
void RFP_RegisterCommandFunction(RFPCommands_TypeDef Command, void (*Callback)(uint8_t *, uint32_t, uint32_t))
{
   RfpCommandFunction[Command - 1].RfpCommandFunction = Callback;
}
void RFP_RegisterDataFunction(void (*Callback)(uint8_t *, uint32_t, uint32_t))
{
   RfpDataFunction.RfpDataFunction = Callback;
}
void RFP_RegisterMessageFunction(RFPMessage_TypeDef Message, void (*Callback)(uint8_t *, uint32_t, uint32_t))
{
   RfpMessageFunction[Message - 1].RfpMessageFunction = Callback;
}
void RFP_InterruptTask(void)
{
   Rfp->NewDataFlag = RFP_NEW_DATA_FLAG_SET;
}
void RFP_SendData(RFPDeviceID_TypeDef Destination, RFPMessageType_TypeDef Type, uint8_t *Data, uint32_t Length)
{
   RfpData[0] = Destination;
   RfpData[1] = Rfp->DeviceType;
   RfpData[2] = Type;
   for(int i = 0; i < Length; i++)
   {
      RfpData[i + 3] = Data[i];
   }
   Rfp->SendFlag = RFP_SEND_FLAG_SET;
}
static void RFP_SendResponseFunction(RFPMessageType_TypeDef Response)
{
   RfpData[0]   = Rfp->SourceMessage;
   RfpData[1]   = Rfp->DeviceType;
   RfpData[2]   = RFP_MESSAGE;
   RfpData[3]   = Response;
   uint32_t crc = Crc(CRC_INITIAL_VALUE, 4, RfpData);
   RfpData[4]   = ((crc >> 24) & 0xff);
   RfpData[5]   = ((crc >> 16) & 0xff);
   RfpData[6]   = ((crc >> 8) & 0xff);
   RfpData[7]   = (crc & 0xff);
   HC12_TransmitData(RfpData, 8);
}
static void RFP_InitializeFunction(void)
{
   Rfp->NewEvent = RFP_EVENT_END_INITIALIZE;
   HC12_ExitCommandMode();
   HC12_ReciveToIdleDMA(RfpData, sizeof(RfpData));
}
static void RFP_IdleFunction(void)
{
   if(Rfp->NewDataFlag == RFP_NEW_DATA_FLAG_SET)
   {
      Rfp->NewDataFlag = RFP_NEW_DATA_FLAG_RESET;
      Rfp->NewEvent    = RFP_EVENT_NEW_DATA;
   }
   else if(Rfp->SendFlag == RFP_SEND_FLAG_SET)
   {
      Rfp->SendFlag = RFP_SEND_FLAG_RESET;
   }
}
static void RFP_ParseFunction(void)
{
   uint32_t MessageCRC = 0;
   Rfp->SourceMessage  = RfpData[1];
   if(RfpData[0] != Rfp->DeviceType)
   {
      Rfp->NewEvent = RFP_EVENT_ERROR;
      RFP_SendResponseFunction(RFP_ERROR);
   }
   else
   {
      if(Rfp->DataSize != 0)
      {
         MessageCRC = (((uint32_t)RfpData[Rfp->DataSize - 4] << 24) | ((uint32_t)RfpData[Rfp->DataSize - 3] << 16)
                       | ((uint32_t)RfpData[Rfp->DataSize - 2] << 8) | ((uint32_t)RfpData[Rfp->DataSize - 1]));
         if(MessageCRC == Crc(CRC_INITIAL_VALUE, Rfp->DataSize - 4, RfpData))
         {
            Rfp->NewEvent = RFP_EVENT_DATA_OK;
         }
      }
      else
      {
         if(RepareMessage(MessageCRC, RfpData, Rfp->DataSize) == CRC_OK)
         {
            Rfp->NewEvent = RFP_EVENT_DATA_OK;
         }
         else
         {
            Rfp->NewEvent = RFP_EVENT_ERROR;
            RFP_SendResponseFunction(RFP_ERROR);
         }
      }
   }
}
static void RFP_RunningFunction(void)
{
   switch(RfpData[2])
   {
      case RFP_COMMAND:
      {
         if(RfpCommandFunction[RfpData[3] - 1].RfpCommandFunction != NULL)
         {
            RfpCommandFunction[RfpData[3] - 1].RfpCommandFunction(RfpData, Rfp->DataSize, 4);
         }
         break;
      }
      case RFP_DATA:
      {
         if(RfpDataFunction.RfpDataFunction != NULL)
         {
            RfpDataFunction.RfpDataFunction(RfpData, Rfp->DataSize, 4);
         }
         break;
      }
      case RFP_MESSAGE:
      {
         if(RfpMessageFunction[RfpData[3] - 1].RfpMessageFunction != NULL)
         {
            RfpMessageFunction[RfpData[3] - 1].RfpMessageFunction(RfpData, Rfp->DataSize, 4);
         }
         break;
      }
      default:
      {
         break;
      }
   }
   RFP_SendResponseFunction(RFP_OK);
}
