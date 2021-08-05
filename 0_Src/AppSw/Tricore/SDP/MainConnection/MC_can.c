#include "MC_can.h"

#define MC_CAN_MSG_0     0x275A
#define MC_CAN_MSG_1     0x275B

MC_R_data_t MC_R_data;
MC_T_data_t MC_T_data;
TC_msg_t TC_msg;

CanCommunication_Message mcCanMsg0;
CanCommunication_Message mcCanMsg1;

void SDP_MC_init(void);
void SDP_MC_run_1ms(void);

void SDP_MC_init(void){
    /* CAN message init */
	{
        CanCommunication_Message_Config config;
        config.messageId		=	MC_CAN_MSG_0;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode1;
        CanCommunication_initMessage(&mcCanMsg0, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	MC_CAN_MSG_1;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode1;
        CanCommunication_initMessage(&mcCanMsg1, &config);
	}
}

void SDP_MC_run_1ms(void){
    if(CanCommunication_receiveMessage(&mcCanMsg0))
    {
    	TC_msg.RecievedData[0]      =   mcCanMsg0.msg.data[0];
    	TC_msg.RecievedData[1]      =   mcCanMsg0.msg.data[1];
        // MicroSD_Demo_addData(MC_CAN_MSG_0,TC_msg.RecievedData);
    }
    // else if(CanCommunication_receiveMessage(&mcCanMsg1))
    // {
    //     ShockCanMsgRear.RecievedData[0]      =   mcCanMsg1.msg.data[0];
    //     ShockCanMsgRear.RecievedData[1]      =   mcCanMsg1.msg.data[1];
    // }


}