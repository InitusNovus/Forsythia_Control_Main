#include "Cooling.h"

#define COOLING_CAN_MSG         0x405C
#define COOLING_SWITCH_MSG      0x275C01
#define COOLING_ORDER_MSG       0x275C02

Cooling_msg_t Cooling_msg;
Cooling_switch_t Cooling_switch;
Cooling_order_t Cooling_order;

CanCommunication_Message CoolingCanMsg;
// CanCommunication_Message ShockCanMsg1;

void SDP_Cooling_init(void);
void SDP_Cooling_run_1ms(void);

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
	// {
	// 	CanCommunication_Message_Config config;
    //     config.messageId		=	SHOCK_CAN_MSG_1;
    //     config.frameType		=	IfxMultican_Frame_receive;
    //     config.dataLen			=	IfxMultican_DataLengthCode_8;
    //     config.node				=	&CanCommunication_canNode0;
    //     CanCommunication_initMessage(&ShockCanMsg1, &config);
	// }
}

void SDP_Cooling_run_1ms(void){
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
}