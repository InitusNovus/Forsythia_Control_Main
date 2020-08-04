/*
 * OrionBms2.c
 * Created on: 2020.08.04
 * Author: Dua
 */

/***************************** Includes ******************************/
#include "OrionBms2.h"

/**************************** Macro **********************************/


/*********************** Global Variables ****************************/
const uint32 OrionMsgId1 = 0x00001F00UL;
const uint32 OrionMsgId2 = 0x00001F01UL;
const uint32 OrionMsgId3 = 0x00001F02UL;

OrionBms2_t OrionBms2;


/******************* Private Function Prototypes *********************/


/********************* Function Implementation ***********************/
void OrionBms2_init(void)
{
	{
		CanCommunication_Message_Config config;
        config.messageId		=	OrionMsgId1;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_6;
        config.node				=	OrionBms2.msgObj1.node;
        CanCommunication_initMessage(&OrionBms2.msgObj1, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	OrionMsgId2;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_6;
        config.node				=	OrionBms2.msgObj2.node;
        CanCommunication_initMessage(&OrionBms2.msgObj2, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	OrionMsgId3;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_6;
        config.node				=	OrionBms2.msgObj3.node;
        CanCommunication_initMessage(&OrionBms2.msgObj3, &config);
	}
}

void OrionBms2_receiveMessage(void)
{
	if(CanCommunication_receiveMessage(&OrionBms2.msgObj1))
	{
		OrionBms2.msg1.packCurrent = ((OrionBms2.msgObj1.msg.data[0] & 0x0000FFFF) >> 0);
		OrionBms2.msg1.packVoltage = ((OrionBms2.msgObj1.msg.data[0] & 0xFFFF0000) >> 16);
		Orion
	}
	if(CanCommunication_receiveMessage(&OrionBms2.msgObj2))
	{

	}
	if(CanCommunication_receiveMessage(&OrionBms2.msgObj3))
	{

	}
}

/****************** Private Function Implementation ******************/