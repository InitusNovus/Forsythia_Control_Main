#include "CanGateway.h"

#define GatewayMsgIn 0x275237
#define GatewayMsgOu  0x275FA1

CanGatewayMsg_t CanGatewayMsgIn;
CanGatewayMsg_t CanGatewayMsgOut;

CanCommunication_Message CanGatewayMsg1;
CanCommunication_Message CanGatewayMsg2;

void CanGateway_init(){
    {
        CanCommunication_Message_Config config;
        config.messageId		=	GatewayMsgIn;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode1;
        CanCommunication_Gateway_initMessage(&CanGatewayMsg1, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	GatewayMsgOu;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&CanGatewayMsg2, &config);
	}
}

void CanGateway_run(){
    if(CanCommunication_receiveMessage(&CanGatewayMsg1))
    {
    	CanGatewayMsgIn.U[0]      =   CanGatewayMsg1.msg.data[0];
    	CanGatewayMsgIn.U[1]      =   CanGatewayMsg1.msg.data[1];
    }

    // CanCommunication_setMessageData(INV->TransmitData[0],INV->TransmitData[1], &TC);

    CanCommunication_transmitMessage(&CanGatewayMsg2);
}