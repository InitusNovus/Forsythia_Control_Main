#include "Cooling.h"

#define COOLING_CAN_MSG1        0x405C01
#define COOLING_CAN_MSG2        0x405C02
#define COOLING_SWITCH_MSG      0x275C01
#define COOLING_ORDER_MSG       0x275C02

Cooling_msg1_t Cooling_msg1;
Cooling_msg2_t Cooling_msg2;
Cooling_switch_t Cooling_switch;
Cooling_order_t Cooling_order;

CanCommunication_Message CoolingCanMsg1;
CanCommunication_Message CoolingCanMsg2;
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
        config.messageId		=	COOLING_CAN_MSG1;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&CoolingCanMsg1, &config);
	}
    {
        CanCommunication_Message_Config config;
        config.messageId		=	COOLING_CAN_MSG2;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&CoolingCanMsg2, &config);
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
    if(CanCommunication_receiveMessage(&CoolingCanMsg1))
    {
    	Cooling_msg1.RecievedData[0]      =   CoolingCanMsg1.msg.data[0];
    	Cooling_msg1.RecievedData[1]      =   CoolingCanMsg1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&CoolingCanMsg2))
    {
    	Cooling_msg2.ReceivedData[0]      =   CoolingCanMsg2.msg.data[0];
    	Cooling_msg2.ReceivedData[1]      =   CoolingCanMsg2.msg.data[1];
    }
    // else if(CanCommunication_receiveMessage(&ShockCanMsg1))
    // {
    //     ShockCanMsgRear.RecievedData[0]      =   ShockCanMsg1.msg.data[0];
    //     ShockCanMsgRear.RecievedData[1]      =   ShockCanMsg1.msg.data[1];
    // }
    CanCommunication_transmitMessage(&CoolingSwitch);
    if (Cooling_msg1.B.manualMode_isOn){
        CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1],&CoolingOrder);
        CanCommunication_transmitMessage(&CoolingOrder);
    }
}

void SDP_Cooling_setVCUmode(void){ //VCU
    Cooling_switch.B.manualMode_ON = 1;

    CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
    //CanCommunication_transmitMessage(&CoolingSwitch);
}

void SDP_Cooling_resetVCUmode(void) {
	Cooling_switch.B.manualMode_ON = 0;

    CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_toggleWaterPump(void) {
	Cooling_switch.B.WaterPump0_ON ^= 1;
	Cooling_switch.B.WaterPump1_ON ^= 1;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_onWaterPump(void) {
	Cooling_switch.B.WaterPump0_ON = 1;
	Cooling_switch.B.WaterPump1_ON = 1;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_offWaterPump(void) {
	Cooling_switch.B.WaterPump0_ON = 0;
	Cooling_switch.B.WaterPump1_ON = 0;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_toggleRadiatorFan(void) {
	Cooling_switch.B.Radiator0_ON ^= 1;
	Cooling_switch.B.Radiator1_ON ^= 1;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_onRadiatorFan(void) {
	Cooling_switch.B.Radiator0_ON = 1;
	Cooling_switch.B.Radiator1_ON = 1;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_offRadiatorFan(void) {
	Cooling_switch.B.Radiator0_ON = 0;
	Cooling_switch.B.Radiator1_ON = 0;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_AllOn(void) {
	Cooling_switch.B.WaterPump0_ON = 1;
	Cooling_switch.B.WaterPump1_ON = 1;
	Cooling_switch.B.Radiator0_ON = 1;
	Cooling_switch.B.Radiator1_ON = 1;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_AllOff(void) {
	Cooling_switch.B.WaterPump0_ON = 0;
	Cooling_switch.B.WaterPump1_ON = 0;
	Cooling_switch.B.Radiator0_ON = 0;
	Cooling_switch.B.Radiator1_ON = 0;

	CanCommunication_setMessageData(Cooling_switch.TxData[0],Cooling_switch.TxData[1], &CoolingSwitch);
}

void SDP_Cooling_setWaterPumpDuty(uint8 duty0, uint8 duty1) {
	Cooling_order.B.WaterPump0_DutyOrder = duty0;
	Cooling_order.B.WaterPump1_DutyOrder = duty1;

	CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1], &CoolingOrder);
}

void SDP_Cooling_setWaterPump0Duty(uint8 duty0) {
	Cooling_order.B.WaterPump0_DutyOrder = duty0;

	CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1], &CoolingOrder);
}

void SDP_Cooling_setWaterPump1Duty(uint8 duty1) {
	Cooling_order.B.WaterPump1_DutyOrder = duty1;

	CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1], &CoolingOrder);
}

void SDP_Cooling_setRadiatorFanDuty(uint8 duty0, uint8 duty1) {
	Cooling_order.B.Radiator0_DutyOrder = duty0;
	Cooling_order.B.Radiator1_DutyOrder = duty1;

	CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1], &CoolingOrder);
}

void SDP_Cooling_setRadiatorFan0Duty(uint8 duty0) {
	Cooling_order.B.Radiator0_DutyOrder = duty0;

	CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1], &CoolingOrder);
}

void SDP_Cooling_setRadiatorFan1Duty(uint8 duty1) {
	Cooling_order.B.Radiator1_DutyOrder = duty1;

	CanCommunication_setMessageData(Cooling_order.TxData[0],Cooling_order.TxData[1], &CoolingOrder);
}
