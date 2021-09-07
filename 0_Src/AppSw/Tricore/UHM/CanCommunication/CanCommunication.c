/* 
 * CanCommunication.c
 * Created on 2019. 10. 24.
 * Author: Dua
 * 
 * For RH26_Control_main
 */


/* Includes */
#include <stdio.h>
#include "CanCommunication.h"


/* Macros */
#define CANCOMM_TXTIMEOUT	200
/* GlobalVariables */
IfxMultican_Can			CanCommunication_canModule;

IfxMultican_Can_Node	CanCommunication_canNode0;
IfxMultican_Can_Node	CanCommunication_canNode1;
IfxMultican_Can_Node	CanCommunication_canNode2;

// CanCommunication_Message CanCommunication_message0;

/* Private Variables */
IFX_STATIC IfxMultican_MsgObjId numMsgObj = 0;
IFX_STATIC sint32 canTransmitTimeout = CANCOMM_TXTIMEOUT;


/* Function Implementation */
void CanCommunication_init(void)
{
	/* Can Module initialiazation */
	IfxMultican_Can_Config canConfig;
	IfxMultican_Can_initModuleConfig(&canConfig, &MODULE_CAN);
	IfxMultican_Can_initModule(&CanCommunication_canModule, &canConfig);


	/* Can node0 initialization */
	IfxMultican_Can_NodeConfig canNodeConfig;
	IfxMultican_Can_Node_initConfig(&canNodeConfig, &CanCommunication_canModule);

	canNodeConfig.baudrate 	= 1000000;		//1Mbps
	canNodeConfig.nodeId	= IfxMultican_NodeId_0;
	canNodeConfig.rxPin		= &CAN0NODE0IN;
	canNodeConfig.rxPinMode	= IfxPort_InputMode_pullUp;
	canNodeConfig.txPin		= &CAN0NODE0OUT;
	canNodeConfig.txPinMode	= IfxPort_OutputMode_pushPull;
	IfxMultican_Can_Node_init(&CanCommunication_canNode0, &canNodeConfig);

	/* Can node1 initialization */
	// IfxMultican_Can_NodeConfig canNodeConfig;
	IfxMultican_Can_Node_initConfig(&canNodeConfig, &CanCommunication_canModule);

	canNodeConfig.baudrate 	= 500000;		//500kbps
	canNodeConfig.nodeId	= IfxMultican_NodeId_1;
	canNodeConfig.rxPin		= &CAN0NODE1IN;
	canNodeConfig.rxPinMode	= IfxPort_InputMode_pullUp;
	canNodeConfig.txPin		= &CAN0NODE1OUT;
	canNodeConfig.txPinMode	= IfxPort_OutputMode_pushPull;
	IfxMultican_Can_Node_init(&CanCommunication_canNode1, &canNodeConfig);

	/* Can node2 initialization */
	// IfxMultican_Can_NodeConfig canNodeConfig;
	IfxMultican_Can_Node_initConfig(&canNodeConfig, &CanCommunication_canModule);

	canNodeConfig.baudrate 	= 500000;		//500kbps
	canNodeConfig.nodeId	= IfxMultican_NodeId_2;
	canNodeConfig.rxPin		= &CAN0NODE2IN;
	canNodeConfig.rxPinMode	= IfxPort_InputMode_pullUp;
	canNodeConfig.txPin		= &CAN0NODE2OUT;
	canNodeConfig.txPinMode	= IfxPort_OutputMode_pushPull;
	IfxMultican_Can_Node_init(&CanCommunication_canNode2, &canNodeConfig);
}

void CanCommunication_initMessage(CanCommunication_Message* ccMsg, CanCommunication_Message_Config* config)
{
	IfxMultican_Can_MsgObj* obj 	= &ccMsg->obj;

	IfxMultican_Can_MsgObjConfig canMsgObjConfig;
	IfxMultican_Can_MsgObj_initConfig(&canMsgObjConfig, config->node);

	canMsgObjConfig.msgObjId		= numMsgObj;
	canMsgObjConfig.messageId		= config->messageId;
	canMsgObjConfig.acceptanceMask	= 0x7FFFFFFFUL;
	canMsgObjConfig.frame			=config->frameType;
	canMsgObjConfig.control.messageLen		= config->dataLen;
	canMsgObjConfig.control.extendedFrame	= TRUE;	//Default: extended address
	if(config->isStandardId)
		canMsgObjConfig.control.extendedFrame = FALSE;
	canMsgObjConfig.control.messageLen		= TRUE;	//TODO: standard ID range check
	IfxMultican_Can_MsgObj_init(obj, &canMsgObjConfig);

	ccMsg->isUpdated = FALSE;
	IfxMultican_Message_init(&ccMsg->msg, config->messageId, 0xdeadbeef, 0xdeadbeef,config-> dataLen);

	numMsgObj++;
}




boolean CanCommunication_receiveMessage(CanCommunication_Message* msg)
{
	boolean isReceived;
	IfxMultican_Status  readStatus;
	if(IfxMultican_Can_MsgObj_isRxPending(&msg->obj))
	{
		readStatus = IfxMultican_Can_MsgObj_readMessage(&msg->obj, &msg->msg);

		/* if no new data is been received report an error */
		if (!(readStatus & IfxMultican_Status_newData))
		{
			printf("ERROR: IfxMultican_Can_MsgObj_readMessage for canMsgObj00 returned 0x%04x\n", readStatus);
		}

		/* if a new data is been received but one lost, report the status */
		if ((readStatus & IfxMultican_Status_newDataButOneLost) == IfxMultican_Status_newDataButOneLost)
		{
			printf(" IfxMultican_Can_MsgObj_readMessage for canMsgObj00 returned 0x%04x\n", readStatus);
		}

		if (readStatus & IfxMultican_Status_newData)
		{
			msg->isUpdated = TRUE;
		}
		isReceived = TRUE;
		msg->testCount.Success++;
	}
	else 
	{
		isReceived = FALSE;
		msg->testCount.Failed++;
	}

	return isReceived;
}


void CanCommunication_resetUpdateState(CanCommunication_Message* msg)
{
	msg->isUpdated = FALSE;
}


void CanCommunication_transmitMessage(CanCommunication_Message *msg)
{
/*
	if((IfxMultican_Can_MsgObj_sendMessage(&msg->msgObj, &msg->message)) == IfxMultican_Status_ok)
	{
		msg->isUpdated = TRUE;
	}
*/
	while(IfxMultican_Can_MsgObj_sendMessage(&msg->obj, &msg->msg) == IfxMultican_Status_notSentBusy )
	{
		static uint32 count = 0;
		count++;
		if(count >= canTransmitTimeout)
		{
			count = 0;
			break;
		}
			
	}
	msg->isUpdated = TRUE;
}


void CanCommunication_setMessageData(uint32 data0, uint32 data1, CanCommunication_Message *msg)
{
	msg->msg.data[0] = data0;
	msg->msg.data[1] = data1;
}