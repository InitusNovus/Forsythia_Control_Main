/*
 * Cascadia_Inverter_can.h
 *
 * Created: Jan 8th 2023
 * Author: Terry
 * yoonsb@hanayng.ac.kr
 * blog.terrysyoon.com
 *
 * */

#include "Cascadia_Inverter_can.h"
#include "HLD.h"

ID_set Inverter_L_ID;
ID_set Inverter_R_ID;

CanCommunication_Message Rx_Inverter_L[6];
CanCommunication_Message Rx_Inverter_R[6];

CanCommunication_Message Tx_TC275_L[1];
CanCommunication_Message Tx_TC275_R[1];

PM100_Status_t Inverter_L_Status;
PM100_Status_t Inverter_R_Status;

PM100_Control_t Inverter_L_Control;
PM100_Control_t Inverter_R_Control;

void SET_ID(ID_set* IN, int node);
void CascadiaInverter_can_init(void);
void CascadiaInverter_can_Run(void);

static void setReceiveMessage(ID_set* ID, CanCommunication_Message* Rm);
static void setTransmitMessage(ID_set* ID, CanCommunication_Message* Tm);
static void setInitialControl(PM100_Control_t* Control);

void SET_ID(ID_set* IN, int node)
{

	IN->node = node;

	/*Rx~*/
	IN->ID_PM100_Temperature  = 0x0A2;
	IN->ID_PM100_Position  = 0x0A5;
	IN->ID_PM100_Current  = 0x0A6;
	IN->ID_PM100_Voltage  = 0x0A7;
	IN->ID_PM100_FaultCodes  = 0x0AB;
	IN->ID_PM100_HighSpeedMessage  = 0x0B0;
	/*~Rx*/

	/*Tx~*/
	IN->ID_PM100_Command  = 0x0C0;
	/*~Tx*/
}

void CascadiaInverter_can_init(void)
{
	SET_ID(&Inverter_L_ID,1);
	SET_ID(&Inverter_R_ID,2);

	setTransmitMessage(&Inverter_L_ID, Tx_TC275_L);
	setTransmitMessage(&Inverter_R_ID, Tx_TC275_R);

	setReceiveMessage(&Inverter_L_ID, Rx_Inverter_L);
	setReceiveMessage(&Inverter_R_ID, Rx_Inverter_R);

	setFixedCommand(&Inverter_L_Control);
	setFixedCommand(&Inverter_R_Control);
}

void CascadiaInverter_can_Run(void) //receive loop
{
	if(CanCommunication_receiveMessage(Rx_Inverter_L[0]))
	{
		Inverter_L_Status.Temperature3.ReceivedData[0] = Rx_Inverter_L[0].msg.data[0];
		Inverter_L_Status.Temperature3.ReceivedData[1] = Rx_Inverter_L[0].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_L[1]))
	{
		Inverter_L_Status.Position.ReceivedData[0] = Rx_Inverter_L[1].msg.data[0];
		Inverter_L_Status.Position.ReceivedData[1] = Rx_Inverter_L[1].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_L[2]))
	{
		Inverter_L_Status.Current.ReceivedData[0] = Rx_Inverter_L[2].msg.data[0];
		Inverter_L_Status.Current.ReceivedData[1] = Rx_Inverter_L[2].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_L[3]))
	{
		Inverter_L_Status.Voltage.ReceivedData[0] = Rx_Inverter_L[3].msg.data[0];
		Inverter_L_Status.Voltage.ReceivedData[1] = Rx_Inverter_L[3].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_L[4]))
	{
		Inverter_L_Status.FaultCodes.ReceivedData[0] = Rx_Inverter_L[4].msg.data[0];
		Inverter_L_Status.FaultCodes.ReceivedData[1] = Rx_Inverter_L[4].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_L[5]))
	{
		Inverter_L_Status.HighSpeedMessage.ReceivedData[0] = Rx_Inverter_L[5].msg.data[0];
		Inverter_L_Status.HighSpeedMessage.ReceivedData[1] = Rx_Inverter_L[5].msg.data[1];
	}





	if(CanCommunication_receiveMessage(Rx_Inverter_R[0]))
	{
		Inverter_R_Status.Temperature3.ReceivedData[0] = Rx_Inverter_R[0].msg.data[0];
		Inverter_R_Status.Temperature3.ReceivedData[1] = Rx_Inverter_R[0].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_R[1]))
	{
		Inverter_R_Status.Position.ReceivedData[0] = Rx_Inverter_R[1].msg.data[0];
		Inverter_R_Status.Position.ReceivedData[1] = Rx_Inverter_R[1].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_R[2]))
	{
		Inverter_R_Status.Current.ReceivedData[0] = Rx_Inverter_R[2].msg.data[0];
		Inverter_R_Status.Current.ReceivedData[1] = Rx_Inverter_R[2].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_R[3]))
	{
		Inverter_R_Status.Voltage.ReceivedData[0] = Rx_Inverter_R[3].msg.data[0];
		Inverter_R_Status.Voltage.ReceivedData[1] = Rx_Inverter_R[3].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_R[4]))
	{
		Inverter_R_Status.FaultCodes.ReceivedData[0] = Rx_Inverter_R[4].msg.data[0];
		Inverter_R_Status.FaultCodes.ReceivedData[1] = Rx_Inverter_R[4].msg.data[1];
	}
	if(CanCommunication_receiveMessage(Rx_Inverter_R[5]))
	{
		Inverter_R_Status.HighSpeedMessage.ReceivedData[0] = Rx_Inverter_R[5].msg.data[0];
		Inverter_R_Status.HighSpeedMessage.ReceivedData[1] = Rx_Inverter_R[5].msg.data[1];
	}
}

static void setReceiveMessage(ID_set* ID, CanCommunication_Message* Rm)
{
	/*Config in common~*/
	IfxMultican_Can_Node* CanCommunication_canNodes[3] = {&CanCommunication_canNode0, &CanCommunication_canNode1, &CanCommunication_canNode2};
	CanCommunication_Message_Config config_Message_Receive;

	config_Message_Receive.frameType = IfxMultican_Frame_receive;
	config_Message_Receive.dataLen = IfxMultican_DataLengthCode_8;
	config_Message_Receive.isStandardId = FALSE;
	config_Message_Receive.node = CanCommunication_canNodes[ID->node];
	/*~Config in common*/

	config_Message_Receive.messageId = ID->ID_PM100_Temperature;
	CanCommunication_initMessage(Rm[0], config_Message_Receive);

	config_Message_Receive.messageId = ID->ID_PM100_Position;
	CanCommunication_initMessage(Rm[1], config_Message_Receive);

	config_Message_Receive.messageId = ID->ID_PM100_Current;
	CanCommunication_initMessage(Rm[2], config_Message_Receive);

	config_Message_Receive.messageId = ID->ID_PM100_Voltage;
	CanCommunication_initMessage(Rm[3], config_Message_Receive);

	config_Message_Receive.messageId = ID->ID_PM100_FaultCodes;
	CanCommunication_initMessage(Rm[4], config_Message_Receive);

	config_Message_Receive.messageId = ID->ID_PM100_HighSpeedMessage;
	CanCommunication_initMessage(Rm[5], config_Message_Receive);
}

static void setTransmitMessage(ID_set* ID, CanCommunication_Message* Tm)
{
	/*Config in common~*/
	IfxMultican_Can_Node* CanCommunication_canNodes[3] = {&CanCommunication_canNode0, &CanCommunication_canNode1, &CanCommunication_canNode2};
	CanCommunication_Message_Config config_Message_Transmit;

	config_Message_Transmit.frameType = IfxMultican_Frame_transmit;
	config_Message_Transmit.dataLen = IfxMultican_DataLengthCode_8;
	config_Message_Transmit.isStandardId = FALSE;
	config_Message_Transmit.node = CanCommunication_canNodes[ID->node];
	/*~Config in common*/


	config_Message_Transmit.messageId = ID->ID_PM100_Command;
	CanCommunication_initMessage(Tm[0], config_Message_Transmit);
}

static void setInitialControl(PM100_Control_t* Control)
{
	//Control->Command.S.reservedBits = 0;
}
