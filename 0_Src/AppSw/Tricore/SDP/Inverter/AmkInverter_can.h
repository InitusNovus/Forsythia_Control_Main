#ifndef AMKINVERTER_CAN_H_
#define AMKINVERTER_CAN_H_

#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include <stdint.h>
#include "Multican.h"
#include "CanCommunication.h"

#define AMK_TORQUE_LIM  2143

typedef struct
{
	uint8 AMK_bReserve : 8;
	boolean AMK_bSystemReady :1;
	boolean AMK_bWarn : 1;
	boolean AMK_bSError : 1;
	boolean AMK_bQuitDcOn : 1;
	boolean AMK_bDcOn : 1;
	boolean AMK_bQuitInverterOn : 1;
	boolean AMK_bInverterOn : 1;
	boolean AMK_bDerating : 1;
}AMK_Status;

typedef struct
{
	uint8 AMK_bReserve1 : 8;
	boolean AMK_bInverterOn : 1;
	boolean AMK_bDcOn : 1;
	boolean AMK_bEnable : 1;
	boolean AMK_bErrorReset : 1;
	uint8 AMK_bReserve2 : 4;
}AMK_Control;

typedef union
{
	uint32 RecievedData[2];
	struct{
		uint8 AMK_bReserve : 8;
		boolean AMK_bSystemReady : 1;
		boolean AMK_bSError : 1;
		boolean AMK_bWarn : 1;
		boolean AMK_bQuitDcOn : 1;
		boolean AMK_bDcOn : 1;
		boolean AMK_bQuitInverterOn : 1;
		boolean AMK_bInverterOn : 1;
		boolean AMK_bDerating : 1;
		sint16 AMK_ActualVelocity : 16;
		sint16 AMK_TorqueCurrent : 16;
		sint16 AMK_MagnetizingCurrent : 16;
	}S;
}amkActualValues1;

typedef union
{
	uint32 RecievedData[2];
	    struct{
			sint16 AMK_TempMotor : 16;
	        sint16 AMK_TempInverter : 16;
	        uint16 AMK_ErrorInfo : 16;
	        sint16 AMK_TempIGBT : 16;
	    }S;
}amkActualValues2;

typedef union
{
	uint32 TransmitData[2];
	    struct{
			uint8 AMK_bReserve1 : 8;
			boolean AMK_bInverterOn : 1;
			boolean AMK_bDcOn : 1;
			boolean AMK_bEnable : 1;
			boolean AMK_bErrorReset : 1;
			uint8 AMK_bReserve2 : 4;
	    	sint16 AMK_Torque_setpoint: 16;	//0.1Mn
	        sint16 AMK_TorqueLimitPositv : 16;
	        sint16 AMK_TorqueLimitNegativ : 16;
	    }S;
}amkSetpoint1;

typedef union{
	uint32 TransmitData[2];
	struct{
		uint16 EFon;
		uint16 BE1on;
		uint16 BE2on;
		uint16 Remain;
	}B;
}Inv_switch_msg_t;


typedef struct
{
	uint16 ID_AMK_Ac1;
	uint16 ID_AMK_Ac2;
	uint16 ID_AMK_Set;
}ID_set;


typedef enum AmkState_e
{
    AmkState_S0 = 0,    //Power On
    AmkState_S1 = 1,    //System Ready
    AmkState_S2 = 2,    //DC On
    AmkState_S3 = 3,    //EF on
    AmkState_S4 = 4,    //BE1 on
    AmkState_S5 = 5,    //Enable/InverterEnable on
    AmkState_RTD    //Ready To Drive
} AmkState_t;

typedef struct 
{
	AmkState_t r2d;

	float32 fl;
	float32 fr;
	float32 rl;
	float32 rr;

	float32 spdFl;
	float32 spdFr;
	float32 spdRl;
	float32 spdRr;

	IfxCpu_mutexLock mutex;
}AmkInverterPublic_t;

IFX_EXTERN AmkInverterPublic_t AmkInverterPublic;

IFX_EXTERN Inv_switch_msg_t Inv_switch_msg;
IFX_EXTERN amkActualValues1 INV_FL_AMK_Actual_Values1;
IFX_EXTERN amkActualValues1 INV_RL_AMK_Actual_Values1;
IFX_EXTERN amkActualValues1 INV_RR_AMK_Actual_Values1;
IFX_EXTERN amkActualValues1 INV_FR_AMK_Actual_Values1;

IFX_EXTERN amkActualValues2 INV_FL_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV_RL_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV_RR_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV_FR_AMK_Actual_Values2;


IFX_EXTERN amkSetpoint1 INV1_AMK_Setpoint1;
IFX_EXTERN amkSetpoint1 INV2_AMK_Setpoint1;
IFX_EXTERN amkSetpoint1 INV3_AMK_Setpoint1;
IFX_EXTERN amkSetpoint1 INV4_AMK_Setpoint1;

IFX_EXTERN ID_set Inverter1;
IFX_EXTERN ID_set Inverter2;
IFX_EXTERN ID_set Inverter3;
IFX_EXTERN ID_set Inverter4;

IFX_EXTERN void AmkInverter_can_init(void);
IFX_EXTERN void AmkInverter_can_Run(void);
IFX_EXTERN void AmkInverter_can_write(amkSetpoint1 *INV, CanCommunication_Message TC, uint16 tV);
IFX_EXTERN void AmkInverter_writeMessage(uint16 Value1, uint16 Value2);
IFX_EXTERN void AmkInverter_writeMessage2(uint16 Value1, uint16 Value2);
IFX_EXTERN void InverterControlSet();
IFX_EXTERN void AmkInverter_Start(boolean rtdFlag);

#endif 
