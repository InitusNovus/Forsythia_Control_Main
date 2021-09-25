#include "AmkInverter_can.h"
#include "HLD.h"


const float Inverter_peak_current = 107.2;
const float Nominal_torque = 9.8;
const uint32 InvCtr = 0x405D;

ID_set Inverter1;
ID_set Inverter2;
ID_set Inverter3;
ID_set Inverter4;


CanCommunication_Message T_TC237_1;
CanCommunication_Message T_TC237_2;
CanCommunication_Message T_TC237_3;
CanCommunication_Message T_TC237_4;
CanCommunication_Message T_InvCtr;

CanCommunication_Message R_Inverter1_1;
CanCommunication_Message R_Inverter2_1;
CanCommunication_Message R_Inverter3_1;
CanCommunication_Message R_Inverter4_1;
CanCommunication_Message R_Inverter1_2;
CanCommunication_Message R_Inverter2_2;
CanCommunication_Message R_Inverter3_2;
CanCommunication_Message R_Inverter4_2;


amkActualValues1 INV1_AMK_Actual_Values1;
amkActualValues1 INV2_AMK_Actual_Values1;
amkActualValues1 INV3_AMK_Actual_Values1;
amkActualValues1 INV4_AMK_Actual_Values1;

amkActualValues2 INV1_AMK_Actual_Values2;
amkActualValues2 INV2_AMK_Actual_Values2;
amkActualValues2 INV3_AMK_Actual_Values2;
amkActualValues2 INV4_AMK_Actual_Values2;

amkSetpoint1 INV1_AMK_Setpoint1;
amkSetpoint1 INV2_AMK_Setpoint1;
amkSetpoint1 INV3_AMK_Setpoint1;
amkSetpoint1 INV4_AMK_Setpoint1;
Inv_switch_msg_t Inv_switch_msg;

void AmkInverter_can_init(void);
void AmkInverter_can_Run(void);
void AmkInverter_can_write(amkSetpoint1 *INV, CanCommunication_Message TC, uint16 tV);

static void setPointInit(amkSetpoint1 *setpoint);

static void setReceiveMessage(uint16_t ID, CanCommunication_Message *Rm,uint8 node);
static void setTransmitMessage(uint16_t ID, CanCommunication_Message *Tm,uint8 node);
void writeMessage(uint16 Value1, uint16 Value2);
void writeMessage2(uint16 Value1, uint16 Value2);

struct setSwitch{
    uint8 DCon;
    uint8 Enable;
    uint8 inverter;
    uint16 posTorquelimit;
    int16_t negTorquelimit;
    uint8 ErrorReset;
    uint32 Checker;
    boolean BE1;
    boolean BE2;
    boolean EF;
};
struct Monitor{
    int InverterTemp;
    struct {
        uint16 error_1;
        uint16 error_2;
        uint16 error_3;
        uint16 error_4;
    }InverterErrorState;
    struct {
        uint16 temp_1;
        uint16 temp_2;
        uint16 temp_3;
        uint16 temp_4;
    }MotorTemp;
    struct{
        uint16 velocity_1;
        uint16 velocity_2;
        uint16 velocity_3;
        uint16 velocity_4;
    } MotorVelocity;
    // struct MotorCurrent{
    //     uint16 velocity_1;
    //     uint16 velocity_2;
    //     uint16 velocity_3;
    //     uint16 velocity_4;
    // }
};
struct Monitor Monitor;//
struct setSwitch SWITCH = {0,0,0,0,0,0};
void SET_ID(ID_set *IN, int node)
{
	IN->ID_AMK_Ac1 = 0x282 + node;
	IN->ID_AMK_Ac2 = 0x284 + node;
	IN->ID_AMK_Set = 0x183 + node;
}

void AmkInverter_can_init(void)
{   
    

	SET_ID(&Inverter1,1);
	SET_ID(&Inverter2,2);
	SET_ID(&Inverter3,5);
	SET_ID(&Inverter4,6);

    /**************************************Transmit***************************************************/
    setTransmitMessage(Inverter1.ID_AMK_Set, &T_TC237_1,2);
    setTransmitMessage(Inverter2.ID_AMK_Set, &T_TC237_2,1);
    setTransmitMessage(Inverter3.ID_AMK_Set, &T_TC237_3,1);
    setTransmitMessage(Inverter4.ID_AMK_Set, &T_TC237_4,2);
    setTransmitMessage(InvCtr,&T_InvCtr,1);

    /**************************************Receive***************************************************/
    setReceiveMessage(Inverter1.ID_AMK_Ac1, &R_Inverter1_1,2);
    setReceiveMessage(Inverter1.ID_AMK_Ac2, &R_Inverter1_2,2);
    setReceiveMessage(Inverter2.ID_AMK_Ac1, &R_Inverter2_1,1);
    setReceiveMessage(Inverter2.ID_AMK_Ac2, &R_Inverter2_2,1);
    setReceiveMessage(Inverter3.ID_AMK_Ac1, &R_Inverter3_1,1);
    setReceiveMessage(Inverter3.ID_AMK_Ac2, &R_Inverter3_2,1);
    setReceiveMessage(Inverter4.ID_AMK_Ac1, &R_Inverter4_1,2);
    setReceiveMessage(Inverter4.ID_AMK_Ac2, &R_Inverter4_2,2);

    // {
    //     CanCommunication_Message_Config config_Message8_Recive;
    //     config_Message8_Recive.messageId        =   STM32ID;
    //     config_Message8_Recive.frameType        =   IfxMultican_Frame_receive;
    //     config_Message8_Recive.dataLen          =   IfxMultican_DataLengthCode_8;
    //     config_Message8_Recive.node             =   &CanCommunication_canNode1;
    //     CanCommunication_initMessage(&STM32A, &config_Message8_Recive);
    // }
    /**************************************Initial setpoint***************************************************/ 
    setPointInit(&INV1_AMK_Setpoint1);
    setPointInit(&INV2_AMK_Setpoint1);
    setPointInit(&INV3_AMK_Setpoint1);
    setPointInit(&INV4_AMK_Setpoint1);

}

void AmkInverter_can_Run(void)
{
    if(CanCommunication_receiveMessage(&R_Inverter1_1))
    {
    	INV1_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter1_1.msg.data[0];
    	INV1_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter1_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter1_2))
    {
        INV1_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter1_2.msg.data[0];
        INV1_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter1_2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter2_1))
    {
        INV2_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter2_1.msg.data[0];
        INV2_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter2_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter2_2))
    {
        INV2_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter2_2.msg.data[0];
        INV2_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter2_2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter3_1))
    {
    	INV3_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter3_1.msg.data[0];
    	INV3_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter3_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter3_2))
    {
        INV3_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter3_2.msg.data[0];
        INV3_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter3_2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter4_1))
    {
        INV4_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter4_1.msg.data[0];
        INV4_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter4_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter4_2))
    {
        INV4_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter4_2.msg.data[0];
        INV4_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter4_2.msg.data[1];
    }

    Monitor.InverterErrorState.error_1 = INV1_AMK_Actual_Values1.S.AMK_bSError;
    Monitor.InverterErrorState.error_2 = INV2_AMK_Actual_Values1.S.AMK_bSError;
    Monitor.InverterErrorState.error_3 = INV3_AMK_Actual_Values1.S.AMK_bSError;
    Monitor.InverterErrorState.error_4 = INV4_AMK_Actual_Values1.S.AMK_bSError;

    Monitor.MotorTemp.temp_1 = INV1_AMK_Actual_Values2.S.AMK_TempMotor*0.1;
    Monitor.MotorTemp.temp_2 = INV2_AMK_Actual_Values2.S.AMK_TempMotor*0.1;
    Monitor.MotorTemp.temp_3 = INV3_AMK_Actual_Values2.S.AMK_TempMotor*0.1;
    Monitor.MotorTemp.temp_4 = INV4_AMK_Actual_Values2.S.AMK_TempMotor*0.1;

    Monitor.MotorVelocity.velocity_1 = INV1_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.MotorVelocity.velocity_2 = INV2_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.MotorVelocity.velocity_3 = INV3_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.MotorVelocity.velocity_4 = INV4_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.InverterTemp = INV1_AMK_Actual_Values2.S.AMK_TempInverter;
    SWITCH.Checker+=1;
}



void AmkInverter_can_write(amkSetpoint1 *INV, CanCommunication_Message TC, uint16 tV)
{    
    if (SWITCH.DCon&&SWITCH.Enable&&SWITCH.inverter&&(SWITCH.posTorquelimit>0))INV->S.AMK_Torque_setpoint = tV;
    INV->S.AMK_bDcOn = SWITCH.DCon;
    INV->S.AMK_bEnable = SWITCH.Enable;
    INV->S.AMK_bInverterOn = SWITCH.inverter;
    INV->S.AMK_TorqueLimitPositv  = SWITCH.posTorquelimit;
    INV->S.AMK_TorqueLimitNegativ = SWITCH.negTorquelimit;
    if (SWITCH.ErrorReset){
        INV->S.AMK_bErrorReset = SWITCH.ErrorReset;
        SWITCH.ErrorReset = 0;
        INV->S.AMK_bErrorReset = SWITCH.ErrorReset;
    }
    CanCommunication_setMessageData(INV->TransmitData[0],INV->TransmitData[1], &TC);

    CanCommunication_transmitMessage(&TC);

}

void InverterControlSet(){
    Inv_switch_msg.B.EFon = SWITCH.EF;
    Inv_switch_msg.B.BE1on = SWITCH.BE1;
    Inv_switch_msg.B.BE2on = SWITCH.BE2;
    CanCommunication_setMessageData(Inv_switch_msg.TransmitData[0],Inv_switch_msg.TransmitData[1], &T_InvCtr);

    CanCommunication_transmitMessage(&T_InvCtr);
}

void writeMessage(uint16 Value1, uint16 Value2)
{

    AmkInverter_can_write(&INV1_AMK_Setpoint1,T_TC237_1,Value1);
    AmkInverter_can_write(&INV2_AMK_Setpoint1,T_TC237_2,Value2);
    if (!(Inv_switch_msg.B.BE1on&&Inv_switch_msg.B.BE2on&&Inv_switch_msg.B.EFon)){
        InverterControlSet();
    }

}
void writeMessage2(uint16 Value1, uint16 Value2)
{    

    AmkInverter_can_write(&INV3_AMK_Setpoint1,T_TC237_3,Value1);
    AmkInverter_can_write(&INV4_AMK_Setpoint1,T_TC237_4,Value2);        

}



static void setPointInit(amkSetpoint1 *setpoint){
    setpoint->S.AMK_bInverterOn = FALSE;
    setpoint->S.AMK_bDcOn = FALSE;
    setpoint->S.AMK_bEnable = FALSE;
    setpoint->S.AMK_bErrorReset = FALSE;
    setpoint->S.AMK_TorqueLimitPositv = 0;
    setpoint->S.AMK_TorqueLimitNegativ = 0;
}

static void setReceiveMessage(uint16_t ID, CanCommunication_Message *Rm,uint8 node){

    CanCommunication_Message_Config config_Message_Recive;
    config_Message_Recive.messageId        =   ID;
    config_Message_Recive.frameType        =   IfxMultican_Frame_receive;
    config_Message_Recive.dataLen          =   IfxMultican_DataLengthCode_8;
    config_Message_Recive.isStandardId     =   TRUE;
    if (node == 0){
        config_Message_Recive.node             =   &CanCommunication_canNode0;
    }
    else if (node == 1){
        config_Message_Recive.node             =   &CanCommunication_canNode1;
    }
    else{
        config_Message_Recive.node             =   &CanCommunication_canNode2;
    }

    CanCommunication_initMessage(Rm, &config_Message_Recive);

}

static void setTransmitMessage(uint16_t ID, CanCommunication_Message *Tm,uint8 node){

    CanCommunication_Message_Config config_Message_Transmit;
    config_Message_Transmit.messageId        =   ID;
    config_Message_Transmit.frameType        =   IfxMultican_Frame_transmit;
    config_Message_Transmit.dataLen          =   IfxMultican_DataLengthCode_8;
    config_Message_Transmit.isStandardId       =   TRUE;
        if (node == 0){
        config_Message_Transmit.node             =   &CanCommunication_canNode0;
    }
    else if (node == 1){
        config_Message_Transmit.node             =   &CanCommunication_canNode1;
    }
    else{
        config_Message_Transmit.node             =   &CanCommunication_canNode2;
    }

    CanCommunication_initMessage(Tm, &config_Message_Transmit);

}
