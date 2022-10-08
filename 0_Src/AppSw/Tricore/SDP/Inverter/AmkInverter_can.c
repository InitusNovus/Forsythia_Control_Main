#include "AmkInverter_can.h"
#include "HLD.h"


const float Inverter_peak_current = 107.2;
const float Nominal_torque = 9.8;
const uint16 InvCtr = 0x160;
boolean alreadyOn=0; 

ID_set Inverter_FL;
ID_set Inverter_RL;
ID_set Inverter_RR;
ID_set Inverter_FR;


CanCommunication_Message T_TC275_FL;
CanCommunication_Message T_TC275_RL;
CanCommunication_Message T_TC275_RR;
CanCommunication_Message T_TC275_FR;
CanCommunication_Message T_InvCtr;

CanCommunication_Message R_Inverter_FL_1;
CanCommunication_Message R_Inverter_RL_1;
CanCommunication_Message R_Inverter_RR_1;
CanCommunication_Message R_Inverter_FR_1;
CanCommunication_Message R_Inverter_FL_2;
CanCommunication_Message R_Inverter_RL_2;
CanCommunication_Message R_Inverter_RR_2;
CanCommunication_Message R_Inverter_FR_2;


amkActualValues1 INV_FL_AMK_Actual_Values1;
amkActualValues1 INV_RL_AMK_Actual_Values1;
amkActualValues1 INV_RR_AMK_Actual_Values1;
amkActualValues1 INV_FR_AMK_Actual_Values1;

IFX_EXTERN amkActualValues2 INV_FL_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV_RL_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV_RR_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV_FR_AMK_Actual_Values2;

amkSetpoint1 INV_FL_AMK_Setpoint1;
amkSetpoint1 INV_RL_AMK_Setpoint1;
amkSetpoint1 INV_RR_AMK_Setpoint1;
amkSetpoint1 INV_FR_AMK_Setpoint1;
Inv_switch_msg_t Inv_switch_msg;

void AmkInverter_can_init(void);
void AmkInverter_can_Run(void);
void AmkInverter_can_write(amkSetpoint1 *INV, CanCommunication_Message TC, uint16 tV);

static void setPointInit(amkSetpoint1 *setpoint);

static void setReceiveMessage(uint16_t ID, CanCommunication_Message *Rm,uint8 node);
static void setTransmitMessage(uint16_t ID, CanCommunication_Message *Tm,uint8 node);
void writeMessage(uint16 Value1, uint16 Value2);
void writeMessage2(uint16 Value1, uint16 Value2);
void InverterControlSet();
void AmkInverterStart();

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
        uint16 error_FL;
        uint16 error_RL;
        uint16 error_RR;
        uint16 error_FR;
    }InverterErrorState;
    struct {
        uint16 temp_FL;
        uint16 temp_RL;
        uint16 temp_RR;
        uint16 temp_FR;
    }MotorTemp;
    struct{
        uint16 velocity_FL;
        uint16 velocity_RL;
        uint16 velocity_RR;
        uint16 velocity_FR;
    } MotorVelocity;
    // struct MotorCurrent{
    //     uint16 velocity_RL;
    //     uint16 velocity_FL;
    //     uint16 velocity_RR;
    //     uint16 velocity_FR;
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
    

	SET_ID(&Inverter_FL,5);
	SET_ID(&Inverter_RL,6);
	SET_ID(&Inverter_RR,1);
	SET_ID(&Inverter_FR,2);

    /**************************************Transmit***************************************************/
    setTransmitMessage(Inverter_FL.ID_AMK_Set, &T_TC275_FL,1);
    setTransmitMessage(Inverter_RL.ID_AMK_Set, &T_TC275_RL,2);
    setTransmitMessage(Inverter_RR.ID_AMK_Set, &T_TC275_RR,2);
    setTransmitMessage(Inverter_FR.ID_AMK_Set, &T_TC275_FR,1);
    setTransmitMessage(InvCtr,&T_InvCtr,1);

    /**************************************Receive***************************************************/
    setReceiveMessage(Inverter_FL.ID_AMK_Ac1, &R_Inverter_FL_1,1);
    setReceiveMessage(Inverter_FL.ID_AMK_Ac2, &R_Inverter_FL_2,1);
    setReceiveMessage(Inverter_RL.ID_AMK_Ac1, &R_Inverter_RL_1,2);
    setReceiveMessage(Inverter_RL.ID_AMK_Ac2, &R_Inverter_RL_2,2);
    setReceiveMessage(Inverter_RR.ID_AMK_Ac1, &R_Inverter_RR_1,2);
    setReceiveMessage(Inverter_RR.ID_AMK_Ac2, &R_Inverter_RR_2,2);
    setReceiveMessage(Inverter_FR.ID_AMK_Ac1, &R_Inverter_FR_1,1);
    setReceiveMessage(Inverter_FR.ID_AMK_Ac2, &R_Inverter_FR_2,1);

    // {
    //     CanCommunication_Message_Config config_Message8_Recive;
    //     config_Message8_Recive.messageId        =   STM32ID;
    //     config_Message8_Recive.frameType        =   IfxMultican_Frame_receive;
    //     config_Message8_Recive.dataLen          =   IfxMultican_DataLengthCode_8;
    //     config_Message8_Recive.node             =   &CanCommunication_canNode1;
    //     CanCommunication_initMessage(&STM32A, &config_Message8_Recive);
    // }
    /**************************************Initial setpoint***************************************************/ 
    setPointInit(&INV_FL_AMK_Setpoint1);
    setPointInit(&INV_RL_AMK_Setpoint1);
    setPointInit(&INV_RR_AMK_Setpoint1);
    setPointInit(&INV_FR_AMK_Setpoint1);

}

void AmkInverter_can_Run(void)
{
    if(CanCommunication_receiveMessage(&R_Inverter_FL_1))
    {
    	INV_FL_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter_FL_1.msg.data[0];
    	INV_FL_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter_FL_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter_FL_2))
    {
        INV_FL_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter_FL_2.msg.data[0];
        INV_FL_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter_FL_2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter_RL_1))
    {
        INV_RL_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter_RL_1.msg.data[0];
        INV_RL_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter_RL_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter_RL_2))
    {
        INV_RL_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter_RL_2.msg.data[0];
        INV_RL_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter_RL_2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter_RR_1))
    {
    	INV_RR_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter_RR_1.msg.data[0];
    	INV_RR_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter_RR_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter_RR_2))
    {
        INV_RR_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter_RR_2.msg.data[0];
        INV_RR_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter_RR_2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter_FR_1))
    {
        INV_FR_AMK_Actual_Values1.RecievedData[0]      =   R_Inverter_FR_1.msg.data[0];
        INV_FR_AMK_Actual_Values1.RecievedData[1]      =   R_Inverter_FR_1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&R_Inverter_FR_2))
    {
        INV_FR_AMK_Actual_Values2.RecievedData[0]      =   R_Inverter_FR_2.msg.data[0];
        INV_FR_AMK_Actual_Values2.RecievedData[1]      =   R_Inverter_FR_2.msg.data[1];
    }

    Monitor.InverterErrorState.error_RL = INV_RL_AMK_Actual_Values1.S.AMK_bSError;
    Monitor.InverterErrorState.error_FL = INV_FL_AMK_Actual_Values1.S.AMK_bSError;
    Monitor.InverterErrorState.error_RR = INV_RR_AMK_Actual_Values1.S.AMK_bSError;
    Monitor.InverterErrorState.error_FR = INV_FR_AMK_Actual_Values1.S.AMK_bSError;

    Monitor.MotorTemp.temp_RL = INV_RL_AMK_Actual_Values2.S.AMK_TempMotor*0.1;
    Monitor.MotorTemp.temp_FL = INV_FL_AMK_Actual_Values2.S.AMK_TempMotor*0.1;
    Monitor.MotorTemp.temp_RR = INV_RR_AMK_Actual_Values2.S.AMK_TempMotor*0.1;
    Monitor.MotorTemp.temp_FR = INV_FR_AMK_Actual_Values2.S.AMK_TempMotor*0.1;

    Monitor.MotorVelocity.velocity_RL = INV_RL_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.MotorVelocity.velocity_FL = INV_FL_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.MotorVelocity.velocity_RR = INV_RR_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.MotorVelocity.velocity_FR = INV_FR_AMK_Actual_Values1.S.AMK_ActualVelocity;
    Monitor.InverterTemp = INV_RL_AMK_Actual_Values2.S.AMK_TempInverter;
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
    // if (SWITCH.ErrorReset){
        INV->S.AMK_bErrorReset = SWITCH.ErrorReset;
        // SWITCH.ErrorReset = 0;
    // }
    // else{
        // INV->S.AMK_bErrorReset = 0;
    // }
    CanCommunication_setMessageData(INV->TransmitData[0],INV->TransmitData[1], &TC);

    CanCommunication_transmitMessage(&TC);

}

void InverterControlSet(){
    Inv_switch_msg.B.EFon = SWITCH.EF;
    Inv_switch_msg.B.BE1on = SWITCH.BE1;
    Inv_switch_msg.B.BE2on = SWITCH.BE2;
    Inv_switch_msg.B.Remain = 0x1231;
    CanCommunication_setMessageData(Inv_switch_msg.TransmitData[0],Inv_switch_msg.TransmitData[1], &T_InvCtr);

    CanCommunication_transmitMessage(&T_InvCtr);
}

void writeMessage(uint16 Value1, uint16 Value2)
{

    AmkInverter_can_write(&INV_FL_AMK_Setpoint1,T_TC275_FL,Value1);
    AmkInverter_can_write(&INV_FR_AMK_Setpoint1,T_TC275_FR,Value2);
    // if (Inv_switch_msg.B.BE1on||Inv_switch_msg.B.BE2on||Inv_switch_msg.B.EFon){
    if(alreadyOn != 0){
        InverterControlSet();
    }    
    // }

}
void writeMessage2(uint16 Value1, uint16 Value2)
{    

    AmkInverter_can_write(&INV_RR_AMK_Setpoint1,T_TC275_RR,Value1);
    AmkInverter_can_write(&INV_RL_AMK_Setpoint1,T_TC275_RL,Value2);        

}

void AmkInverterStart(){
    if (alreadyOn==0){
        if(!(INV_FL_AMK_Actual_Values1.S.AMK_bSystemReady&
            INV_FR_AMK_Actual_Values1.S.AMK_bSystemReady&
            INV_RL_AMK_Actual_Values1.S.AMK_bSystemReady&
            INV_RR_AMK_Actual_Values1.S.AMK_bSystemReady)){
                return ;
            }
           
        SWITCH.negTorquelimit = 0;
        SWITCH.posTorquelimit = 0;
        SWITCH.DCon = 1;
        if(INV_FL_AMK_Actual_Values1.S.AMK_bDcOn&
            INV_FR_AMK_Actual_Values1.S.AMK_bDcOn&
            INV_RL_AMK_Actual_Values1.S.AMK_bDcOn&
            INV_RR_AMK_Actual_Values1.S.AMK_bDcOn){
                SWITCH.EF = 1;
                SWITCH.BE1 = 1;
                SWITCH.Enable =1;
                SWITCH.inverter = 1;
                if (INV_FL_AMK_Actual_Values1.S.AMK_bInverterOn&
                    INV_FR_AMK_Actual_Values1.S.AMK_bInverterOn&
                    INV_RL_AMK_Actual_Values1.S.AMK_bInverterOn&
                    INV_RR_AMK_Actual_Values1.S.AMK_bInverterOn&
                    INV_FL_AMK_Actual_Values1.S.AMK_bQuitInverterOn&
                    INV_FR_AMK_Actual_Values1.S.AMK_bQuitInverterOn&
                    INV_RL_AMK_Actual_Values1.S.AMK_bQuitInverterOn&
                    INV_RR_AMK_Actual_Values1.S.AMK_bQuitInverterOn){
                        SWITCH.BE2 = 1;
                        SWITCH.posTorquelimit = 2143;
                        // SWITCH.negTorquelimit = 
                        alreadyOn = TRUE;
                    }
            }
    }
    
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
