/*
 * Cascadia_Inverter_can.h
 *
 * With regard to PM100 Gen3 CAN Protocol V5.9
 *
 * Created: Jan 8th 2023
 * Author: Terry
 * yoonsb@hanayng.ac.kr
 * blog.terrysyoon.com
 *
 * */

#ifndef __INC_CASCADIA_INVERTER_H__
#define __INC_CASCADIA_INVERTER_H__

#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include <stdint.h>
#include "Multican.h"
#include "CanCommunication.h"

/*
 * Memory Structure for "Temperature#3" CAN
 * Address: 0x0A2
 * */
typedef union
{
	uint32 ReceivedData[2];
	struct{
		int PM100_CoolantTemperature : 16; //Temperature
		int PM100_HotSpotTemperature : 16; //Temperature
		int PM100_MotorTemperature : 16; //Temperature
		int PM100_TorqueShudder : 16; //Torque
	}S;
}PM100_Temperature3_Can_t;

/*
 * Memory Structure for "Motor Position Information" CAN
 * Address: 0x0A5
 * */
typedef union
{
	uint32 ReceivedData[2];
	struct{
		int PM100_MotorAngle : 16; //Angle
		int PM100_MotorSpeed : 16; //Angular Velocity
		int PM100_ElectricalOutputFrequency : 16;//Frequency
		int PM100_DeltaResolverFiltered : 16; //Angle
	}S;
}PM100_MotorPositionInformation_Can_t;

/*
 * Memory Structure for "Current Information" CAN
 * Address: 0x0A6
 * */
typedef union
{
	uint32 ReceivedData[2];
	struct{
		int PM100_PhaseACurrent : 16; //Current
		int PM100_PhaseBCurrent : 16; //Current
		int PM100_PhaseCCurrent : 16; //Current
		int PM100_DCBusCurrent : 16; //Current
	}S;
}PM100_CurrentInformation_Can_t;

/*
 * Memory Structure for "Voltage Information" CAN
 * Address: 0x0A7
 * */
typedef union
{
	uint32 ReceivedData[2];
	struct{
		int PM100_DCBusVoltage : 16; //High Voltage
		int PM100_OutputVoltage : 16; //High Voltage
		int PM100_VAB_Vd_Voltage : 16; //High Voltage
		int PM100_VBC_Vq_Voltage : 16; //High Voltage
	}S;
}PM100_VoltageInformation_Can_t;

/*
 * Memory Structure for "Fault Codes" CAN
 * Address: 0x0AB
 * */
typedef union
{
	uint32 ReceivedData[2];
	struct{
		union{
			uint16 Flag;
			struct{
				unsigned int Hardware_GATE_Desaturation_Fault : 1;
				unsigned int HW_Over_current_Fault : 1;
				unsigned int Accelerator_Shorted : 1;
				unsigned int Accelerator_Open : 1;
				unsigned int Current_Sensor_Low : 1;
				unsigned int Current_Sensor_High : 1;
				unsigned int Module_Temperature_Low : 1;
				unsigned int Module_Temperature_High : 1;
				unsigned int Control_PCB_Temperature_Low : 1;
				unsigned int Control_PCB_Temperature_High : 1;
				unsigned int Gate_Drive_PCB_Temperature_Low : 1;
				unsigned int Gate_Drive_PCB_Temperature_High : 1;
				unsigned int b5V_Sense_Voltage_Low : 1;
				unsigned int b5V_Sense_Voltage_High : 1;
				unsigned int b12V_Sense_Voltage_Low : 1;
				unsigned int b12V_Sense_Voltage_High : 1;
			}bits;
		}POST_Fault_Lo;
		union{
			uint16 Flag;
			struct{
				unsigned int b2_5V_Sense_Voltage_Low : 1;
				unsigned int b2_5V_Sense_Voltage_High : 1;
				unsigned int b1_5V_Sense_Voltage_Low : 1;
				unsigned int b1_5V_Sense_Voltage_High  : 1;
				unsigned int DC_Bus_Voltage_High : 1;
				unsigned int DC_Bus_Voltage_Low : 1;
				unsigned int Precharge_Timeout : 1;
				unsigned int Precharge_Voltage_Failure : 1;
				unsigned int EEPROM_Checksum_Invalid  : 1;
				unsigned int EEPROM_Data_Out_of_Range : 1;
				unsigned int EEPROM_Update_Required : 1;
				unsigned int Hardware_DC_Bus_OverVoltage_during_initialization  : 1;
				unsigned int Reserved1 : 1;
				unsigned int Reserved2 : 1;
				unsigned int Brake_Shorted : 1;
				unsigned int Brake_Open : 1;
			}bits;
		}POST_Fault_Hi;
		union{
			uint16 Flag;
			struct{
				unsigned int Motor_Overspeed_Fault : 1;
				unsigned int Overcurrent_Fault : 1;
				unsigned int Overvoltage_Fault : 1;
				unsigned int Inverter_Overtemperature_Fault : 1;
				unsigned int Accelerator_Input_Shorted_Fault : 1;
				unsigned int Accelerator_Input_Open_Fault  : 1;
				unsigned int Direction_Command_Fault : 1;
				unsigned int Inverter_Response_Timeout_Fault  : 1;
				unsigned int Hardware_Gate_Desaturation_Fault : 1;
				unsigned int Hardware_Overcurrent_Fault : 1;
				unsigned int Undervoltage_Fault : 1;
				unsigned int CAN_Command_Message_Lost_Fault : 1;
				unsigned int Motor_Overtemperature_Fault : 1;
				unsigned int Reserved1 : 1;
				unsigned int Reserved2 : 1;
				unsigned int Reserved3 : 1;
			}bits;
		}Run_Fault_Lo;
		union{
			uint16 Flag;
			struct{
				unsigned int Brake_Input_Shorted_Fault : 1;
				unsigned int Brake_Input_Open_Fault : 1;
				unsigned int ModuleA_OverTemperature_Fault : 1;
				unsigned int ModuleB_OverTemperature_Fault : 1;
				unsigned int ModuleC_OverTemperature_Fault : 1;
				unsigned int PCB_OverTemperature_Fault : 1;
				unsigned int GateDriveBoard1_OverTemperature_Fault : 1;
				unsigned int GateDriveBoard2_OverTemperature_Fault : 1;
				unsigned int GateDriveBoard3_OverTemperature_Fault : 1;
				unsigned int CurrentSensor_Fault : 1;
				unsigned int Reserved1 : 1;
				unsigned int Reserved2 : 1;
				unsigned int Reserved3 : 1;
				unsigned int Reserved4 : 1;
				unsigned int ResolverNotConnected : 1;
				unsigned int Reserved5 : 1;
			}bits;
		}Run_Fault_Hi;
	}S;
}PM100_FaultCodes_Can_t;


/*
 * Memory Structure for "High Speed Message" CAN
 * Address: 0x0B0
 * */
typedef union
{
	uint32 ReceivedData[2];
	struct{
		int PM100_TorqueCommand : 16;
		int PM100_TorqueFeedback : 16;
		int PM100_MotorSpeed : 16;
		int PM100_DCBusVoltage : 16;
	}S;
}PM100_HighSpeedMessage_Can_t;

/*
 * Memory Structure for "Command Message" CAN
 * Address: 0x0C0
 * */
typedef union
{
	uint32 TransmitData[2];
	struct{
		unsigned int PM100_TorqueCommand : 16;
		unsigned int PM100_SpeedCommand : 16;
		unsigned int PM100_DirectionCommand : 8;
		unsigned int PM100_InverterEnable : 1;
		unsigned int PM100_InverterDischarge : 1;
		unsigned int PM100_SpeedModeEnable : 1;
		unsigned int reservedBits : 5;
		unsigned int PM100_CommandedTorqueLimit : 16;
	}S;
}PM100_CommandMessage_Can_t;

typedef struct {

	int node;

	/*RX~*/
	uint16 ID_PM100_Temperature;
	uint16 ID_PM100_Position;
	uint16 ID_PM100_Current;
	uint16 ID_PM100_Voltage;
	uint16 ID_PM100_FaultCodes;
	uint16 ID_PM100_HighSpeedMessage;
	/*~RX*/

	/*TX~*/
	uint16 ID_PM100_Command;
	/*~TX*/
}ID_set;

typedef struct
{
	PM100_Temperature3_Can_t Temperature3;
	PM100_MotorPositionInformation_Can_t Position;
	PM100_CurrentInformation_Can_t Current;
	PM100_VoltageInformation_Can_t Voltage;
	PM100_FaultCodes_Can_t FaultCodes;
	PM100_HighSpeedMessage_Can_t HighSpeedMessage;
}PM100_Status_t;

typedef struct
{
	PM100_CommandMessage_Can_t Command;
}PM100_Control_t;

IFX_EXTERN PM100_Status_t Inverter_L_Status;
IFX_EXTERN PM100_Status_t Inverter_R_Status;

IFX_EXTERN PM100_Control_t Inverter_L_Control;
IFX_EXTERN PM100_Control_t Inverter_R_Control;

IFX_EXTERN void CascadiaInverter_can_init(void);
IFX_EXTERN void CascadiaInverter_can_Run(void);
#endif
