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

CanCommunication_Message T_INV_FL_AMK_Actual_Values1_log;
CanCommunication_Message T_INV_RL_AMK_Actual_Values1_log;
CanCommunication_Message T_INV_RR_AMK_Actual_Values1_log;
CanCommunication_Message T_INV_FR_AMK_Actual_Values1_log;
CanCommunication_Message T_INV_FL_AMK_Actual_Values2_log;
CanCommunication_Message T_INV_RL_AMK_Actual_Values2_log;
CanCommunication_Message T_INV_RR_AMK_Actual_Values2_log;
CanCommunication_Message T_INV_FR_AMK_Actual_Values2_log;

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

amkActualValues2 INV_FL_AMK_Actual_Values2;
amkActualValues2 INV_RL_AMK_Actual_Values2;
amkActualValues2 INV_RR_AMK_Actual_Values2;
amkActualValues2 INV_FR_AMK_Actual_Values2;

AmkInverterPublic_t AmkInverterPublic;

amkSetpoint1 INV_FL_AMK_Setpoint1;
amkSetpoint1 INV_RL_AMK_Setpoint1;
amkSetpoint1 INV_RR_AMK_Setpoint1;
amkSetpoint1 INV_FR_AMK_Setpoint1;
Inv_switch_msg_t Inv_switch_msg;

boolean AmkInverterError = FALSE;

AmkActualValues1_log_t INV_FL_AMK_Actual_Values1_log;
AmkActualValues1_log_t INV_RL_AMK_Actual_Values1_log;
AmkActualValues1_log_t INV_RR_AMK_Actual_Values1_log;
AmkActualValues1_log_t INV_FR_AMK_Actual_Values1_log;

AmkActualValues2_log_t INV_FL_AMK_Actual_Values2_log;
AmkActualValues2_log_t INV_RL_AMK_Actual_Values2_log;
AmkActualValues2_log_t INV_RR_AMK_Actual_Values2_log;
AmkActualValues2_log_t INV_FR_AMK_Actual_Values2_log;

void AmkInverter_can_init(void);
void AmkInverter_can_Run(void);
void AmkInverter_can_write(amkSetpoint1 *INV, CanCommunication_Message TC, uint16 tV);

static void setPointInit(amkSetpoint1 *setpoint);

static void setReceiveMessage(uint16_t ID, CanCommunication_Message *Rm,uint8 node);
static void setTransmitMessage(uint16_t ID, CanCommunication_Message *Tm,uint8 node);
void AmkInverter_writeMessage(uint16 Value1, uint16 Value2);
void AmkInverter_writeMessage2(uint16 Value1, uint16 Value2);

struct setSwitch
{
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

// struct Monitor
// {
//     int InverterTemp;
//     struct {
//         uint16 error_FL;
//         uint16 error_RL;
//         uint16 error_RR;
//         uint16 error_FR;
//     }InverterErrorState;
//     struct {
//         uint16 temp_FL;
//         uint16 temp_RL;
//         uint16 temp_RR;
//         uint16 temp_FR;
//     }MotorTemp;
//     struct{
//         uint16 velocity_FL;
//         uint16 velocity_RL;
//         uint16 velocity_RR;
//         uint16 velocity_FR;
//     } MotorVelocity;
//     // struct MotorCurrent{
//     //     uint16 velocity_RL;
//     //     uint16 velocity_FL;
//     //     uint16 velocity_RR;
//     //     uint16 velocity_FR;
//     // }
// };

uint32 AmkState_S2cnt = 0;
uint32 AmkState_S3cnt = 0;

const uint32 AmkState_constS2threshold = 100;
const uint32 AmkState_constS3threshold = 100;

struct Monitor Monitor;//
struct setSwitch SWITCH = {0,0,0,0,0,0};
AmkState_t AmkState = AmkState_S0;

AmkInverterMonitorPublic_t AmkInverterMonitorPublic;

void SET_ID(ID_set *IN, int node)
{
	IN->ID_AMK_Ac1 = 0x282 + node;
	IN->ID_AMK_Ac2 = 0x284 + node;
	IN->ID_AMK_Set = 0x183 + node;
}

void AmkInverter_can_init(void)
{   
    AmkState = AmkState_S0;
    
    //Previous Front/Rear Split setting
	SET_ID(&Inverter_FL,5); //2, FR, node1
	SET_ID(&Inverter_RL,6); //4, FL, node2
	SET_ID(&Inverter_RR,1); //3, RL, node2
	SET_ID(&Inverter_FR,2); //1, RR, node1

    //New Right/Left Split setting
    
	SET_ID(&Inverter_FR,5); //Inverter #2,Node 1, Address 5
	SET_ID(&Inverter_RR,2); //Inverter #1,Node 1, Address 2

    SET_ID(&Inverter_FL,6); //Inverter #4, Node 2, Address 6
	SET_ID(&Inverter_RL,1); //Inverter #3, Node 2, Address 1

    /**************************************Transmit***************************************************/
    setTransmitMessage(Inverter_FR.ID_AMK_Set, &T_TC275_FR,1);
    setTransmitMessage(Inverter_RR.ID_AMK_Set, &T_TC275_RR,1);
    
    setTransmitMessage(Inverter_FL.ID_AMK_Set, &T_TC275_FL,2);
    setTransmitMessage(Inverter_RL.ID_AMK_Set, &T_TC275_RL,2);
    
    setTransmitMessage(InvCtr,&T_InvCtr,1);

    /**************************************Receive***************************************************/
    setReceiveMessage(Inverter_FR.ID_AMK_Ac1, &R_Inverter_FR_1,1);
    setReceiveMessage(Inverter_FR.ID_AMK_Ac2, &R_Inverter_FR_2,1);
    
    setReceiveMessage(Inverter_RR.ID_AMK_Ac1, &R_Inverter_RR_1,1);
    setReceiveMessage(Inverter_RR.ID_AMK_Ac2, &R_Inverter_RR_2,1);

    
    setReceiveMessage(Inverter_FL.ID_AMK_Ac1, &R_Inverter_FL_1,2);
    setReceiveMessage(Inverter_FL.ID_AMK_Ac2, &R_Inverter_FL_2,2);

    setReceiveMessage(Inverter_RL.ID_AMK_Ac1, &R_Inverter_RL_1,2);
    setReceiveMessage(Inverter_RL.ID_AMK_Ac2, &R_Inverter_RL_2,2);

    
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

	// Monitor.MotorTemp.temp_RL = INV_RL_AMK_Actual_Values2.S.AMK_TempMotor * 0.1;
	// Monitor.MotorTemp.temp_FL = INV_FL_AMK_Actual_Values2.S.AMK_TempMotor * 0.1;
	// Monitor.MotorTemp.temp_RR = INV_RR_AMK_Actual_Values2.S.AMK_TempMotor * 0.1;
	// Monitor.MotorTemp.temp_FR = INV_FR_AMK_Actual_Values2.S.AMK_TempMotor * 0.1;

	Monitor.MotorTemp.temp_RL = INV_RL_AMK_Actual_Values2.S.AMK_TempMotor;
	Monitor.MotorTemp.temp_FL = INV_FL_AMK_Actual_Values2.S.AMK_TempMotor;
	Monitor.MotorTemp.temp_RR = INV_RR_AMK_Actual_Values2.S.AMK_TempMotor;
	Monitor.MotorTemp.temp_FR = INV_FR_AMK_Actual_Values2.S.AMK_TempMotor;

	Monitor.MotorVelocity.velocity_RL = INV_RL_AMK_Actual_Values1.S.AMK_ActualVelocity;
	Monitor.MotorVelocity.velocity_FL = INV_FL_AMK_Actual_Values1.S.AMK_ActualVelocity;
	Monitor.MotorVelocity.velocity_RR = INV_RR_AMK_Actual_Values1.S.AMK_ActualVelocity;
	Monitor.MotorVelocity.velocity_FR = INV_FR_AMK_Actual_Values1.S.AMK_ActualVelocity;
	Monitor.InverterTemp = INV_RL_AMK_Actual_Values2.S.AMK_TempInverter;
	SWITCH.Checker += 1;

	while(IfxCpu_acquireMutex(&AmkInverterMonitorPublic.mutex))
		; // wait for the mutex
	{
		AmkInverterMonitorPublic.monitor = Monitor;
		IfxCpu_releaseMutex(&AmkInverterMonitorPublic.mutex);
	}
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

void AmkInverter_writeMessage(uint16 Value1, uint16 Value2)
{

    AmkInverter_can_write(&INV_FL_AMK_Setpoint1,T_TC275_FL,Value1);
    AmkInverter_can_write(&INV_FR_AMK_Setpoint1,T_TC275_FR,Value2);
    // if (Inv_switch_msg.B.BE1on||Inv_switch_msg.B.BE2on||Inv_switch_msg.B.EFon){
    if(alreadyOn != 0){
        InverterControlSet();
    }    
    // }

}
void AmkInverter_writeMessage2(uint16 Value1, uint16 Value2)
{    

    AmkInverter_can_write(&INV_RR_AMK_Setpoint1,T_TC275_RR,Value1);
    AmkInverter_can_write(&INV_RL_AMK_Setpoint1,T_TC275_RL,Value2);
}

void AmkInverter_Start(boolean rtdFlag)
{
	if(AmkState == AmkState_S0)
	{
		SWITCH.DCon = 0;
		SWITCH.negTorquelimit = 0;
		SWITCH.posTorquelimit = 0;
		SWITCH.EF = 0;
		SWITCH.BE1 = 0;
		SWITCH.BE2 = 0;
		SWITCH.Enable = 0;
		SWITCH.inverter = 0;
	}

	/*Inverter Start Sequence*/
	if(rtdFlag == TRUE)
	{
		/*Inverter Error Check*/
		if(INV_FL_AMK_Actual_Values1.S.AMK_bSError | INV_FR_AMK_Actual_Values1.S.AMK_bSError |
		    INV_RL_AMK_Actual_Values1.S.AMK_bSError | INV_RR_AMK_Actual_Values1.S.AMK_bSError)
		{
			AmkInverterError = TRUE;
		}
		else
		{
			AmkInverterError = FALSE;
		}

		/*State 0: Power On*/
		if(AmkState == AmkState_S0)
		{

			/*Try to reset the errors and return to S0*/
			// if(alreadyOn == 0 && AmkInverterError == TRUE)
			if(AmkInverterError == TRUE)
			{
				SWITCH.ErrorReset = TRUE;
				AmkState = AmkState_S0;
			}

			/*When the errors are cleared -> To the state S1*/
			if((INV_FL_AMK_Actual_Values1.S.AMK_bSystemReady & INV_FR_AMK_Actual_Values1.S.AMK_bSystemReady &
			       INV_RL_AMK_Actual_Values1.S.AMK_bSystemReady & INV_RR_AMK_Actual_Values1.S.AMK_bSystemReady))
			{
				SWITCH.ErrorReset = FALSE;
				AmkState = AmkState_S1;
			}
		}
		/*State 1: System Ready*/
		else if(AmkState == AmkState_S1)
		{
			if(alreadyOn == 0)
			{
				if(!(INV_FL_AMK_Actual_Values1.S.AMK_bSystemReady & INV_FR_AMK_Actual_Values1.S.AMK_bSystemReady &
				       INV_RL_AMK_Actual_Values1.S.AMK_bSystemReady & INV_RR_AMK_Actual_Values1.S.AMK_bSystemReady))
				{
					AmkState = AmkState_S0;
				}

				SWITCH.EF = 0;
				SWITCH.BE1 = 0;
				SWITCH.BE2 = 0;
				SWITCH.Enable = 0;
				SWITCH.inverter = 0;
				SWITCH.negTorquelimit = 0;
				SWITCH.posTorquelimit = 0;

				SWITCH.DCon = 1;
				if(INV_FL_AMK_Actual_Values1.S.AMK_bDcOn & INV_FR_AMK_Actual_Values1.S.AMK_bDcOn &
				    INV_RL_AMK_Actual_Values1.S.AMK_bDcOn & INV_RR_AMK_Actual_Values1.S.AMK_bDcOn)
				{
					AmkState = AmkState_S2;
				}
			}
		}
		/*State 2: DC On*/
		else if(AmkState == AmkState_S2)
		{
			// TODO: Error state
			alreadyOn = TRUE;
			SWITCH.EF = 1;
			SWITCH.BE1 = 0;
			SWITCH.Enable = 0;
			SWITCH.inverter = 0;
			AmkState_S2cnt++;
			if(AmkState_S2cnt > AmkState_constS2threshold)
			{
				AmkState = AmkState_S3;
			}
			else
			{
				AmkState = AmkState_S2;
			}
		}
		/*State 3: EF on*/
		else if(AmkState == AmkState_S3)
		{
			// TODO: Error state
			alreadyOn = TRUE;
			SWITCH.EF = 1;
			SWITCH.BE1 = 1;
			SWITCH.Enable = 0;
			SWITCH.inverter = 0;
			AmkState_S3cnt++;
			if(AmkState_S3cnt > AmkState_constS3threshold)
			{
				AmkState = AmkState_S4;
			}
			else
			{
				AmkState = AmkState_S3;
			}
		}
		/*State 4: BE1 on*/
		else if(AmkState == AmkState_S4)
		{
			// TODO: Error state
			alreadyOn = TRUE;
			SWITCH.EF = 1;
			SWITCH.BE1 = 1;
			SWITCH.Enable = 1;
			SWITCH.inverter = 1;
			if(INV_FL_AMK_Actual_Values1.S.AMK_bInverterOn && INV_FR_AMK_Actual_Values1.S.AMK_bInverterOn &&
			    INV_RL_AMK_Actual_Values1.S.AMK_bInverterOn && INV_RR_AMK_Actual_Values1.S.AMK_bInverterOn &&
			    INV_FL_AMK_Actual_Values1.S.AMK_bQuitInverterOn && INV_FR_AMK_Actual_Values1.S.AMK_bQuitInverterOn &&
			    INV_RL_AMK_Actual_Values1.S.AMK_bQuitInverterOn && INV_RR_AMK_Actual_Values1.S.AMK_bQuitInverterOn)
			{
				AmkState = AmkState_S5;
			}
			else
			{
				AmkState = AmkState_S4;
			}
		}
		/*State 5: Enable/InverterEnable on*/
		else if(AmkState == AmkState_S5)
		{
			// TODO: Error state
			alreadyOn = TRUE;
			SWITCH.EF = 1;
			SWITCH.BE1 = 1;
			SWITCH.Enable = 1;
			SWITCH.inverter = 1;

			/*Check again*/
			if(INV_FL_AMK_Actual_Values1.S.AMK_bInverterOn && INV_FR_AMK_Actual_Values1.S.AMK_bInverterOn &&
			    INV_RL_AMK_Actual_Values1.S.AMK_bInverterOn && INV_RR_AMK_Actual_Values1.S.AMK_bInverterOn &&
			    INV_FL_AMK_Actual_Values1.S.AMK_bQuitInverterOn && INV_FR_AMK_Actual_Values1.S.AMK_bQuitInverterOn &&
			    INV_RL_AMK_Actual_Values1.S.AMK_bQuitInverterOn && INV_RR_AMK_Actual_Values1.S.AMK_bQuitInverterOn)
			{
				SWITCH.BE2 = 1;
				SWITCH.posTorquelimit = AMK_TORQUE_LIM;
				SWITCH.negTorquelimit = -AMK_TORQUE_LIM;
				AmkState = AmkState_RTD;
			}
			else
			{
				AmkState = AmkState_S5;
			}
		}
	}
    else //rtdFlag is FALSE
    {
        SWITCH.DCon = 0;
		SWITCH.negTorquelimit = 0;
		SWITCH.posTorquelimit = 0;
		SWITCH.EF = 0;
		SWITCH.BE1 = 0;
		SWITCH.BE2 = 0;
		SWITCH.Enable = 0;
		SWITCH.inverter = 0;
        alreadyOn = FALSE;
        AmkState = AmkState_S0;
        return;
    }

    /*Update the state for the public*/
    while(IfxCpu_acquireMutex(&AmkInverterPublic.mutex));   //Wait for the mutex
    {
        AmkInverterPublic.r2d = AmkState;
        IfxCpu_releaseMutex(&AmkInverterPublic.mutex);
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

void AMKInverter_initLoggingMessage(void) {

	//Init CAN msg of AMK_Actual_Values1
	setTransmitMessage(Inverter_FL.ID_AMK_Ac1, &T_INV_FL_AMK_Actual_Values1_log,0);
	setTransmitMessage(Inverter_RL.ID_AMK_Ac1, &T_INV_RL_AMK_Actual_Values1_log,0);
	setTransmitMessage(Inverter_FR.ID_AMK_Ac1, &T_INV_FL_AMK_Actual_Values1_log,0);
	setTransmitMessage(Inverter_RR.ID_AMK_Ac1, &T_INV_RR_AMK_Actual_Values1_log,0);
	//Init CAN msg of AMK_Actual_Values1
	setTransmitMessage(Inverter_FL.ID_AMK_Ac2, &T_INV_FL_AMK_Actual_Values2_log,0);
	setTransmitMessage(Inverter_RL.ID_AMK_Ac2, &T_INV_RL_AMK_Actual_Values2_log,0);
    setTransmitMessage(Inverter_RR.ID_AMK_Ac2, &T_INV_RR_AMK_Actual_Values2_log,0);
	setTransmitMessage(Inverter_FR.ID_AMK_Ac2, &T_INV_FL_AMK_Actual_Values2_log,0);

}

void AMKInverter_runLogging(void) {

	//Log AMK_Actual_Values1
	INV_FL_AMK_Actual_Values1_log.S.AMK_bReserve = INV_FL_AMK_Actual_Values1.S.AMK_bReserve;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bSystemReady = INV_FL_AMK_Actual_Values1.S.AMK_bSystemReady;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bSError = INV_FL_AMK_Actual_Values1.S.AMK_bSError;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bWarn = INV_FL_AMK_Actual_Values1.S.AMK_bWarn;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bQuitDcOn = INV_FL_AMK_Actual_Values1.S.AMK_bQuitDcOn;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bDcOn = INV_FL_AMK_Actual_Values1.S.AMK_bDcOn;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bQuitInverterOn = INV_FL_AMK_Actual_Values1.S.AMK_bQuitInverterOn;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bInverterOn = INV_FL_AMK_Actual_Values1.S.AMK_bInverterOn;
	INV_FL_AMK_Actual_Values1_log.S.AMK_bDerating = INV_FL_AMK_Actual_Values1.S.AMK_bDerating;
	INV_FL_AMK_Actual_Values1_log.S.AMK_ActualVelocity = INV_FL_AMK_Actual_Values1.S.AMK_ActualVelocity;
	INV_FL_AMK_Actual_Values1_log.S.AMK_TorqueCurrent = INV_FL_AMK_Actual_Values1.S.AMK_TorqueCurrent;
	INV_FL_AMK_Actual_Values1_log.S.AMK_MagnetizingCurrent = INV_FL_AMK_Actual_Values1.S.AMK_MagnetizingCurrent;

	INV_RL_AMK_Actual_Values1_log.S.AMK_bReserve = INV_RL_AMK_Actual_Values1.S.AMK_bReserve;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bSystemReady = INV_RL_AMK_Actual_Values1.S.AMK_bSystemReady;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bSError = INV_RL_AMK_Actual_Values1.S.AMK_bSError;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bWarn = INV_RL_AMK_Actual_Values1.S.AMK_bWarn;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bQuitDcOn = INV_RL_AMK_Actual_Values1.S.AMK_bQuitDcOn;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bDcOn = INV_RL_AMK_Actual_Values1.S.AMK_bDcOn;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bQuitInverterOn = INV_RL_AMK_Actual_Values1.S.AMK_bQuitInverterOn;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bInverterOn = INV_RL_AMK_Actual_Values1.S.AMK_bInverterOn;
	INV_RL_AMK_Actual_Values1_log.S.AMK_bDerating = INV_RL_AMK_Actual_Values1.S.AMK_bDerating;
	INV_RL_AMK_Actual_Values1_log.S.AMK_ActualVelocity = INV_RL_AMK_Actual_Values1.S.AMK_ActualVelocity;
	INV_RL_AMK_Actual_Values1_log.S.AMK_TorqueCurrent = INV_RL_AMK_Actual_Values1.S.AMK_TorqueCurrent;
	INV_RL_AMK_Actual_Values1_log.S.AMK_MagnetizingCurrent = INV_RL_AMK_Actual_Values1.S.AMK_MagnetizingCurrent;

	INV_RR_AMK_Actual_Values1_log.S.AMK_bReserve = INV_RR_AMK_Actual_Values1.S.AMK_bReserve;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bSystemReady = INV_RR_AMK_Actual_Values1.S.AMK_bSystemReady;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bSError = INV_RR_AMK_Actual_Values1.S.AMK_bSError;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bWarn = INV_RR_AMK_Actual_Values1.S.AMK_bWarn;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bQuitDcOn = INV_RR_AMK_Actual_Values1.S.AMK_bQuitDcOn;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bDcOn = INV_RR_AMK_Actual_Values1.S.AMK_bDcOn;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bQuitInverterOn = INV_RR_AMK_Actual_Values1.S.AMK_bQuitInverterOn;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bInverterOn = INV_RR_AMK_Actual_Values1.S.AMK_bInverterOn;
	INV_RR_AMK_Actual_Values1_log.S.AMK_bDerating = INV_RR_AMK_Actual_Values1.S.AMK_bDerating;
	INV_RR_AMK_Actual_Values1_log.S.AMK_ActualVelocity = INV_RR_AMK_Actual_Values1.S.AMK_ActualVelocity;
	INV_RR_AMK_Actual_Values1_log.S.AMK_TorqueCurrent = INV_RR_AMK_Actual_Values1.S.AMK_TorqueCurrent;
	INV_RR_AMK_Actual_Values1_log.S.AMK_MagnetizingCurrent = INV_RR_AMK_Actual_Values1.S.AMK_MagnetizingCurrent;

	INV_FR_AMK_Actual_Values1_log.S.AMK_bReserve = INV_FR_AMK_Actual_Values1.S.AMK_bReserve;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bSystemReady = INV_FR_AMK_Actual_Values1.S.AMK_bSystemReady;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bSError = INV_FR_AMK_Actual_Values1.S.AMK_bSError;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bWarn = INV_FR_AMK_Actual_Values1.S.AMK_bWarn;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bQuitDcOn = INV_FR_AMK_Actual_Values1.S.AMK_bQuitDcOn;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bDcOn = INV_FR_AMK_Actual_Values1.S.AMK_bDcOn;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bQuitInverterOn = INV_FR_AMK_Actual_Values1.S.AMK_bQuitInverterOn;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bInverterOn = INV_FR_AMK_Actual_Values1.S.AMK_bInverterOn;
	INV_FR_AMK_Actual_Values1_log.S.AMK_bDerating = INV_FR_AMK_Actual_Values1.S.AMK_bDerating;
	INV_FR_AMK_Actual_Values1_log.S.AMK_ActualVelocity = INV_FR_AMK_Actual_Values1.S.AMK_ActualVelocity;
	INV_FR_AMK_Actual_Values1_log.S.AMK_TorqueCurrent = INV_FR_AMK_Actual_Values1.S.AMK_TorqueCurrent;
	INV_FR_AMK_Actual_Values1_log.S.AMK_MagnetizingCurrent = INV_FR_AMK_Actual_Values1.S.AMK_MagnetizingCurrent;
	//Log AMK_Actual_Values2
	INV_FL_AMK_Actual_Values2_log.S.AMK_TempMotor = INV_FL_AMK_Actual_Values2.S.AMK_TempMotor;
	INV_FL_AMK_Actual_Values2_log.S.AMK_TempInverter = INV_FL_AMK_Actual_Values2.S.AMK_TempInverter;
	INV_FL_AMK_Actual_Values2_log.S.AMK_ErrorInfo = INV_FL_AMK_Actual_Values2.S.AMK_ErrorInfo;
	INV_FL_AMK_Actual_Values2_log.S.AMK_TempIGBT = INV_FL_AMK_Actual_Values2.S.AMK_TempIGBT;

	INV_RL_AMK_Actual_Values2_log.S.AMK_TempMotor = INV_RL_AMK_Actual_Values2.S.AMK_TempMotor;
	INV_RL_AMK_Actual_Values2_log.S.AMK_TempInverter = INV_RL_AMK_Actual_Values2.S.AMK_TempInverter;
	INV_RL_AMK_Actual_Values2_log.S.AMK_ErrorInfo = INV_RL_AMK_Actual_Values2.S.AMK_ErrorInfo;
	INV_RL_AMK_Actual_Values2_log.S.AMK_TempIGBT = INV_RL_AMK_Actual_Values2.S.AMK_TempIGBT;

	INV_RR_AMK_Actual_Values2_log.S.AMK_TempMotor = INV_RR_AMK_Actual_Values2.S.AMK_TempMotor;
	INV_RR_AMK_Actual_Values2_log.S.AMK_TempInverter = INV_RR_AMK_Actual_Values2.S.AMK_TempInverter;
	INV_RR_AMK_Actual_Values2_log.S.AMK_ErrorInfo = INV_RR_AMK_Actual_Values2.S.AMK_ErrorInfo;
	INV_RR_AMK_Actual_Values2_log.S.AMK_TempIGBT = INV_RR_AMK_Actual_Values2.S.AMK_TempIGBT;

	INV_FR_AMK_Actual_Values2_log.S.AMK_TempMotor = INV_FR_AMK_Actual_Values2.S.AMK_TempMotor;
	INV_FR_AMK_Actual_Values2_log.S.AMK_TempInverter = INV_FR_AMK_Actual_Values2.S.AMK_TempInverter;
	INV_FR_AMK_Actual_Values2_log.S.AMK_ErrorInfo = INV_FR_AMK_Actual_Values2.S.AMK_ErrorInfo;
	INV_FR_AMK_Actual_Values2_log.S.AMK_TempIGBT = INV_FR_AMK_Actual_Values2.S.AMK_TempIGBT;

	//Set CAN msg of AMK_Actual_Values1
	CanCommunication_setMessageData(INV_FL_AMK_Actual_Values1_log.TransmitData[0], INV_FL_AMK_Actual_Values1_log.TransmitData[1], &T_INV_FL_AMK_Actual_Values1_log);
	CanCommunication_setMessageData(INV_RL_AMK_Actual_Values1_log.TransmitData[0], INV_RL_AMK_Actual_Values1_log.TransmitData[1], &T_INV_RL_AMK_Actual_Values1_log);
	CanCommunication_setMessageData(INV_RR_AMK_Actual_Values1_log.TransmitData[0], INV_RR_AMK_Actual_Values1_log.TransmitData[1], &T_INV_RR_AMK_Actual_Values1_log);
	CanCommunication_setMessageData(INV_FR_AMK_Actual_Values1_log.TransmitData[0], INV_FR_AMK_Actual_Values1_log.TransmitData[1], &T_INV_FR_AMK_Actual_Values1_log);
	//Set CAN msg of AMK_Actual_Values2
	CanCommunication_setMessageData(INV_FL_AMK_Actual_Values2_log.TransmitData[0], INV_FL_AMK_Actual_Values2_log.TransmitData[1], &T_INV_FL_AMK_Actual_Values2_log);
	CanCommunication_setMessageData(INV_RL_AMK_Actual_Values2_log.TransmitData[0], INV_RL_AMK_Actual_Values2_log.TransmitData[1], &T_INV_RL_AMK_Actual_Values2_log);
	CanCommunication_setMessageData(INV_RR_AMK_Actual_Values2_log.TransmitData[0], INV_RR_AMK_Actual_Values2_log.TransmitData[1], &T_INV_RR_AMK_Actual_Values2_log);
	CanCommunication_setMessageData(INV_FR_AMK_Actual_Values2_log.TransmitData[0], INV_FR_AMK_Actual_Values2_log.TransmitData[1], &T_INV_FR_AMK_Actual_Values2_log);

	//Transmit CAM msg of AMK_Actual_Values1 to node0(main bus)
	CanCommunication_transmitMessage(&T_INV_FL_AMK_Actual_Values1_log);
	CanCommunication_transmitMessage(&T_INV_RL_AMK_Actual_Values1_log);
	CanCommunication_transmitMessage(&T_INV_RR_AMK_Actual_Values1_log);
	CanCommunication_transmitMessage(&T_INV_FR_AMK_Actual_Values1_log);
	//Transmit CAM msg of AMK_Actual_Values2 to node0(main bus)
	CanCommunication_transmitMessage(&T_INV_FL_AMK_Actual_Values2_log);
	CanCommunication_transmitMessage(&T_INV_RL_AMK_Actual_Values2_log);
	CanCommunication_transmitMessage(&T_INV_RR_AMK_Actual_Values2_log);
	CanCommunication_transmitMessage(&T_INV_FR_AMK_Actual_Values2_log);

}