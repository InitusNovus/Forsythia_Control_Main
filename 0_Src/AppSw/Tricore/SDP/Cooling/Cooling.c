#include "Cooling.h"

#define COOLING_CAN_MSG         0x405C
#define COOLING_SWITCH_MSG      0x275C01
#define COOLING_ORDER_MSG       0x275C02

Cooling_msg_t Cooling_msg;
Cooling_switch_t Cooling_switch;
Cooling_order_t Cooling_order;

CanCommunication_Message CoolingCanMsg;
CanCommunication_Message CoolingSwitch;
CanCommunication_Message CoolingOrder;
// CanCommunication_Message ShockCanMsg1;

void SDP_Cooling_init(void);
void SDP_Cooling_run_10ms(void);
void SDP_Cooling_Switch(void);

void SDP_Cooling_init(void){
    /* CAN message init */
	{
        CanCommunication_Message_Config config;
        config.messageId		=	COOLING_CAN_MSG;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&CoolingCanMsg, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	COOLING_SWITCH_MSG;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&CoolingSwitch, &config);
	}
    	{
		CanCommunication_Message_Config config;
        config.messageId		=	COOLING_ORDER_MSG;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&CoolingOrder, &config);
	}
}

void SDP_Cooling_run_10ms(void){
    if(CanCommunication_receiveMessage(&CoolingCanMsg))
    {
    	Cooling_msg.RecievedData[0]      =   CoolingCanMsg.msg.data[0];
    	Cooling_msg.RecievedData[1]      =   CoolingCanMsg.msg.data[1];
    }
    // else if(CanCommunication_receiveMessage(&ShockCanMsg1))
    // {
    //     ShockCanMsgRear.RecievedData[0]      =   ShockCanMsg1.msg.data[0];
    //     ShockCanMsgRear.RecievedData[1]      =   ShockCanMsg1.msg.data[1];
    // }
    if (Cooling_msg.B.manualMode_isOn){
        CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1],&CoolingOrder);
        CanCommunication_transmitMessage(&CoolingOrder);
    }
}
void SDP_Cooling_Switch(void){
    // Cooling_switch.B.manualMode_ON = 1;
    CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);

    CanCommunication_transmitMessage(&CoolingSwitch);
}