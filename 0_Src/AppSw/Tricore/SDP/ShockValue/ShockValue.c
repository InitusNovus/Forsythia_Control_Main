#include "ShockValue.h"

#define SHOCK_CAN_MSG_0     0x32F405AUL
#define SHOCK_CAN_MSG_1     0x32F405BUL

ShockCanMsg_data_t ShockCanMsgFront;
ShockCanMsg_data_t ShockCanMsgRear;

CanCommunication_Message ShockCanMsg0;
CanCommunication_Message ShockCanMsg1;


void SDP_ShockValue_init(void);
void SDP_ShockValue_run_1ms(void);

void SDP_ShockValue_init(void){
    /* CAN message init */
	{
        CanCommunication_Message_Config config;
        config.messageId		=	SHOCK_CAN_MSG_0;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode2;
        CanCommunication_initMessage(&ShockCanMsg0, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	SHOCK_CAN_MSG_1;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&ShockCanMsg1, &config);
	}
}

void SDP_ShockValue_run_1ms(void){
    if(CanCommunication_receiveMessage(&ShockCanMsg0))
    {
    	ShockCanMsgFront.RxData[0]      =   ShockCanMsg0.msg.data[0];
    	ShockCanMsgFront.RxData[1]      =   ShockCanMsg0.msg.data[1];
    }
    else if(CanCommunication_receiveMessage(&ShockCanMsg1))
    {
        ShockCanMsgRear.RxData[0]      =   ShockCanMsg1.msg.data[0];
        ShockCanMsgRear.RxData[1]      =   ShockCanMsg1.msg.data[1];
    }
}