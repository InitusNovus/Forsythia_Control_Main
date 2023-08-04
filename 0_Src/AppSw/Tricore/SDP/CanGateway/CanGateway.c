#include "CanGateway.h"

#define GatewayMsgIn 0x275237
#define GatewayMsgOu  0x275FA1

CanGatewayMsg_t CanGatewayMsgIn;
CanGatewayMsg_t CanGatewayMsgOut;

// CanCommunication_Message CanGatewayMsg1;
// CanCommunication_Message CanGatewayMsg2;

CanCommunication_Message CanGateway_Msg1_src;
CanCommunication_Message CanGateway_Msg2_src;
CanCommunication_Message CanGateway_Msg3_src;
CanCommunication_Message CanGateway_Msg1_dest;
CanCommunication_Message CanGateway_Msg2_dest;
CanCommunication_Message CanGateway_Msg3_dest;



const uint32 DB_StWhlMsgId1 = 0x00101F00UL;
const uint32 DB_StWhlMsgId2 = 0x00101F01UL;
const uint32 DB_StWhlMsgId3 = 0x00101F02UL;

void CanGateway_init(){
    {
        CanCommunication_Gateway_Message_Config config;
        config.dataLen = IfxMultican_DataLengthCode_8;
        config.isStandardId = FALSE;
        config.nodeSrc = &CanCommunication_canNode0;
        config.nodeDest = &CanCommunication_canNode1;
        config.messageId = DB_StWhlMsgId1;

        CanCommunication_Gateway_initMessage(&CanGateway_Msg1_src, &CanGateway_Msg1_dest, &config);
    }
    {
        CanCommunication_Gateway_Message_Config config;
        config.dataLen = IfxMultican_DataLengthCode_8;
        config.isStandardId = FALSE;
        config.nodeSrc = &CanCommunication_canNode0;
        config.nodeDest = &CanCommunication_canNode1;
        config.messageId = DB_StWhlMsgId2;

        CanCommunication_Gateway_initMessage(&CanGateway_Msg2_src, &CanGateway_Msg2_dest, &config);
    }
    {
        CanCommunication_Gateway_Message_Config config;
        config.dataLen = IfxMultican_DataLengthCode_8;
        config.isStandardId = FALSE;
        config.nodeSrc = &CanCommunication_canNode0;
        config.nodeDest = &CanCommunication_canNode1;
        config.messageId = DB_StWhlMsgId3;

        CanCommunication_Gateway_initMessage(&CanGateway_Msg3_src, &CanGateway_Msg3_dest, &config);
    }
}

void CanGateway_run(){
    if(CanCommunication_receiveMessage(&CanGateway_Msg2_src))
    {
    	CanGateway_Msg2_dest.msg.data[0]      =   CanGateway_Msg2_src.msg.data[0];
    	CanGateway_Msg2_dest.msg.data[1]      =   CanGateway_Msg2_src.msg.data[1];
    }
    CanCommunication_transmitMessage(&CanGateway_Msg2_dest);
}