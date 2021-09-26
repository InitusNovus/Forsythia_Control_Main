#ifndef MULTICANCOMUNICATE_H
#define MULTICANCOMUNICATE_H
#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include <stdint.h>
#include "Multican.h"
#include "CanCommunication.h"
typedef union 
{
	struct 
	{
		uint8  RrShock;	
        uint8  RlShock;	
        uint8  FrShock;	
        uint8  FlShock;	
        uint8  FhShock;	
        uint8  Adc1;	
        uint8  Adc2;	
        uint8  Adc3;
	}S;
	uint32 U[2];
}Stm32_canMsg1_t;

typedef union 
{
    uint32 RecievedData[2];
    struct{
        unsigned int VADC0 : 12; 
        unsigned int VADC1 : 12;
        unsigned int VADC2 : 12;
        unsigned int VADC3 : 12;
        unsigned int VADC4 : 12;
        unsigned int Temp  : 4;        
    }S;

}Stm32_canMsg2_t;

typedef struct
{
	unsigned int AMK_bReserve : 8;
	unsigned int AMK_bSystemReady :1;
	unsigned int AMK_bWarn : 1;
	unsigned int AMK_bSError : 1;
	unsigned int AMK_bQuitDcOn : 1;
	unsigned int AMK_bDcOn : 1;
	unsigned int AMK_bQuitInverterOn : 1;
	unsigned int AMK_bInverterOn : 1;
	unsigned int AMK_bDerating : 1;
}AMK_Status;

typedef struct
{
	unsigned int AMK_bReserve1 : 8;
	unsigned int AMK_bInverterOn : 1;
	unsigned int AMK_bDcOn : 1;
	unsigned int AMK_bEnable : 1;
	unsigned int AMK_bErrorReset : 1;
	unsigned int AMK_bReserve2 : 4;
}AMK_Control;

typedef union
{
	uint32 RecievedData[2];
	struct{
		unsigned int AMK_bReserve : 8;
		unsigned int AMK_bSystemReady : 1;
		unsigned int AMK_bSError : 1;
		unsigned int AMK_bWarn : 1;
		unsigned int AMK_bQuitDcOn : 1;
		unsigned int AMK_bDcOn : 1;
		unsigned int AMK_bQuitInverterOn : 1;
		unsigned int AMK_bInverterOn : 1;
		unsigned int AMK_bDerating : 1;
		int AMK_ActualVelocity : 16;
		int AMK_TorqueCurrent : 16;
		int AMK_MagnetizingCurrent : 16;
	}S;
}amkActualValues1;

typedef union
{
	uint32 RecievedData[2];
	    struct{
			int AMK_TempMotor : 16;
	        int AMK_TempInverter : 16;
	        unsigned int AMK_ErrorInfo : 16;
	        int AMK_TempIGBT : 16;
	    }S;
}amkActualValues2;

typedef union
{
	uint32 TransmitData[2];
	    struct{
			unsigned int AMK_bReserve1 : 8;
			unsigned int AMK_bInverterOn : 1;
			unsigned int AMK_bDcOn : 1;
			unsigned int AMK_bEnable : 1;
			unsigned int AMK_bErrorReset : 1;
			unsigned int AMK_bReserve2 : 4;
	        volatile int AMK_Torque_setpoint: 16;	//0.1Mn
	        int AMK_TorqueLimitPositv : 16;
	        int AMK_TorqueLimitNegativ : 16;
	    }S;
}amkSetpoint1;

typedef union{
	uint32 TransmitData[2];
	struct{
		uint16_t EFon;
		uint16_t BE1on;
		uint16_t BE2on;
		uint16_t Remain;
	}B;
}Inv_switch_msg_t;


typedef struct
{
	uint16 ID_AMK_Ac1;
	uint16 ID_AMK_Ac2;
	uint16 ID_AMK_Set;
}ID_set;

IFX_EXTERN Inv_switch_msg_t Inv_switch_msg;
IFX_EXTERN Stm32_canMsg1_t canMsg1;
IFX_EXTERN Stm32_canMsg2_t canMsg2;

IFX_EXTERN amkActualValues1 INV1_AMK_Actual_Values1;
IFX_EXTERN amkActualValues1 INV2_AMK_Actual_Values1;
IFX_EXTERN amkActualValues1 INV3_AMK_Actual_Values1;
IFX_EXTERN amkActualValues1 INV4_AMK_Actual_Values1;

IFX_EXTERN amkActualValues2 INV1_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV2_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV3_AMK_Actual_Values2;
IFX_EXTERN amkActualValues2 INV4_AMK_Actual_Values2;

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
IFX_EXTERN void writeMessage(uint16 Value1, uint16 Value2);
IFX_EXTERN void writeMessage2(uint16 Value1, uint16 Value2);
IFX_EXTERN void InverterControlSet();

#endif /* MULTICANCOMUNICATE_H */
