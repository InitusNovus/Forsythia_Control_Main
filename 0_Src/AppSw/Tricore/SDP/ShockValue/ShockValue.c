#include "ShockValue.h"

#define SHOCK_CAN_MSG_0     0x405A
#define SHOCK_CAN_MSG_1     0x405B

/*
#define SHOCK_CAN_MSG_0_log     0x275F01
#define SHOCK_CAN_MSG_1_log     0x275F02
*/

ShockCanMsg_data_t ShockCanMsgFront;
ShockCanMsg_data_t ShockCanMsgRear;
ShockValue_t shockValue;

/*
ShockCanMsg_data_log_t ShockCanMsgFront_log;
ShockCanMsg_data_log_t ShockCanMsgRear_log;
*/

CanCommunication_Message ShockCanMsg0;
CanCommunication_Message ShockCanMsg1;

/*
CanCommunication_Message ShockCanMsg0_log;
CanCommunication_Message ShockCanMsg1_log;
*/

void SDP_ShockValue_init(void);
void SDP_ShockValue_run_1ms(void);

void SDP_ShockValue_init(void){
    /* CAN message init */
	{
        CanCommunication_Message_Config config;
        config.messageId		=	SHOCK_CAN_MSG_0;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
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
    	ShockCanMsgFront.RecievedData[0]      =   ShockCanMsg0.msg.data[0];
    	ShockCanMsgFront.RecievedData[1]      =   ShockCanMsg0.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&ShockCanMsg1))
    {
        ShockCanMsgRear.RecievedData[0]      =   ShockCanMsg1.msg.data[0];
        ShockCanMsgRear.RecievedData[1]      =   ShockCanMsg1.msg.data[1];
    }

    shockValue.frontHeave = (float)(ShockCanMsgFront.S.Heave/10);
    shockValue.frontRoll = (float)(ShockCanMsgFront.S.Roll/10);
    shockValue.rearHeave = (float)(ShockCanMsgRear.S.Heave/10);
    shockValue.rearRoll = (float)(ShockCanMsgRear.S.Roll/10);
}

/*
void SDP_ShockValue_log_init(void){
    // CAN message init 
	{
        CanCommunication_Message_Config config;
        config.messageId		=	SHOCK_CAN_MSG_0_log;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&ShockCanMsg0_log, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	SHOCK_CAN_MSG_1_log;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&ShockCanMsg1_log, &config);
	}
}

void SDP_ShockValue_run_log(void){
    ShockCanMsgFront_log.S.AngleR = ShockCanMsgFront.S.AngleR;
    ShockCanMsgFront_log.S.AngleL = ShockCanMsgFront.S.AngleL;
    ShockCanMsgFront_log.S.Roll = ShockCanMsgFront.S.Roll;
    ShockCanMsgFront_log.S.Heave = ShockCanMsgFront.S.Heave;

    ShockCanMsgRear_log.S.AngleR = ShockCanMsgRear.S.AngleR;
    ShockCanMsgRear_log.S.AngleL = ShockCanMsgRear.S.AngleL;
    ShockCanMsgRear_log.S.Roll = ShockCanMsgRear.S.Roll;
    ShockCanMsgRear_log.S.Heave = ShockCanMsgRear.S.Heave;

    CanCommunication_setMessageData(ShockCanMsgRear_log.TransmitData[0], ShockCanMsgFront_log.TransmitData[1], &ShockCanMsg0_log);
    CanCommunication_setMessageData(ShockCanMsgRear_log.TransmitData[0], ShockCanMsgRear_log.TransmitData[1], &ShockCanMsg1_log);

    CanCommunication_transmitMessage(&ShockCanMsg0_log);
    CanCommunication_transmitMessage(&ShockCanMsg1_log);
}
*/