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
		sint16 PM100_CoolantTemperature; //Temperature
		sint16 PM100_HotSpotTemperature; //Temperature
		sint16 PM100_MotorTemperature; //Temperature
		sint16 PM100_TorqueShudder; //Torque
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
		sint16 PM100_MotorAngle; //Angle
		sint16 PM100_MotorSpeed; //Angular Velocity
		sint16 PM100_ElectricalOutputFrequency;//Frequency
		sint16 PM100_DeltaResolverFiltered; //Angle
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
		sint16 PM100_PhaseACurrent; //Current
		sint16 PM100_PhaseBCurrent; //Current
		sint16 PM100_PhaseCCurrent; //Current
		sint16 PM100_DCBusCurrent; //Current
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
		sint16 PM100_DCBusVoltage; //High Voltage
		sint16 PM100_OutputVoltage; //High Voltage
		sint16 PM100_VAB_Vd_Voltage; //High Voltage
		sint16 PM100_VBC_Vq_Voltage; //High Voltage
	}S;
}PM100_VoltageInformation_Can_t;

/*
 * Memory Structure for "Internal States" CAN
 * Address: 0x0AA
 * */
typedef union
{
	uint32 ReceivedData[2];
	struct{
		uint8 VSM_State; //byte0
		uint8 Reserved; //byte1. NA for Gen3
		uint8 InverterState; //byte2
		union{ //byte3
			uint8 RelayState;
			struct{
				uint8 Relay1Status : 1;
				uint8 Relay2Status : 1;
				uint8 Relay3Status : 1;
				uint8 Relay4Status : 1;
				uint8 Relay5Status : 1;
				uint8 Relay6Status : 1;
				uint8 _Reserved_RelayStatus : 2;
			};
		};
		union{ //byte4
			uint8 byte4;
			struct{
				uint8 InverterRunMode : 1;
				uint8 _Reserved_Byte4 : 4;
				uint8 InverterActiveDischargeState : 3;
			};
		};
		union{
			uint8 byte5;
			struct{
				uint8 InverterCommandMode : 1;
				uint8 _Reserved_Byte5 : 3;
				uint8 RollingCounterValue : 4;
			};
		};
		union
		{
			uint8 byte6;
			struct{
				uint8 InverterEnableState : 1;
				uint8 _Reserved_Byte6 : 5;
				uint8 StartModeActive : 1;
				uint8 InverterEnableLockout : 1;
			};
		};
		union{
			uint8 byte7;
			struct{
				uint8 DirectionCommand : 1;
				uint8 BMSActive : 1;
				uint8 BMSLimitingTorque : 1;
				uint8 LimitMaxSpeed : 1; //For Gen3 2042+, Available for ours, 204C.
				uint8 _Reserved_Byte7 : 4;
			};
		};
	};
}PM100_InternalStates_Can_t;

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
		sint16 PM100_TorqueCommand;
		sint16 PM100_TorqueFeedback;
		sint16 PM100_MotorSpeed;
		sint16 PM100_DCBusVoltage;
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
		union{
			sint16 PM100_TorqueCommand;
			struct{
				uint8 PM100_TorqueCommand_1;
				uint8 PM100_TorqueCommand_2;
			};
		};
		//sint8 PM100_TorqueCommand_1;
		//sint8 PM100_TorqueCommand_2;
		uint16 PM100_SpeedCommand;
		uint8 PM100_DirectionCommand;
		uint8 PM100_InverterEnable : 1;
		uint8 PM100_InverterDischarge : 1;
		uint8 PM100_SpeedModeEnable : 1;
		uint8 reservedBits : 5;
		uint16 PM100_CommandedTorqueLimit;
	}S;
}PM100_CommandMessage_Can_t;

typedef struct {

	int node;

	/*RX~*/
	uint16 ID_PM100_Temperature;
	uint16 ID_PM100_Position;
	uint16 ID_PM100_Current;
	uint16 ID_PM100_Voltage;
	uint16 ID_PM100_InternalStates; //0x0AA
	uint16 ID_PM100_FaultCodes;
	uint16 ID_PM100_HighSpeedMessage;
	/*~RX*/

	/*TX~*/
	uint16 ID_PM100_Command;
	/*~TX*/
}PM100_ID_set;

typedef struct
{
	PM100_Temperature3_Can_t Temperature3;
	PM100_MotorPositionInformation_Can_t Position;
	PM100_CurrentInformation_Can_t Current;
	PM100_VoltageInformation_Can_t Voltage;
	PM100_InternalStates_Can_t InternalStates;
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
IFX_EXTERN void CascadiaInverter_writeTorque(uint16 torque_L, uint16 torque_R);
#endif
