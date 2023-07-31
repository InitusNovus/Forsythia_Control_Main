/*
 * Cooling.h
 *
 *  Created on: 2021. 9. 25.
 *      Author: Suprhimp
 */

#ifndef SRC_APPSW_TRICORE_SDP_COOLING_H
#define SRC_APPSW_TRICORE_SDP_COOLING_H

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "SDP.h"
#include "CanCommunication.h"
#include "HLD.h"

typedef union{
	uint32 RecievedData[2];
	struct{
		uint8 External_IS;
		uint8 WaterPump0_IS;
		uint8 WaterPump1_IS;
		uint8 Radiator0_IS;
		uint8 Radiator1_IS;
		uint8 manualMode_isOn;
		uint8 Radiator0_T;
		uint8 Radiator1_T;
	}B;

}Cooling_msg1_t;

typedef union{
	uint32 ReceivedData[2];
	struct{
		uint8 WaterPressure0;
		uint8 WaterPressure1;
		uint8 duty0;
		uint8 duty1;
		uint8 duty2;
		uint8 Remain;
		uint8 Remain2;
		uint8 Remain3;
	}B;

}Cooling_msg2_t;

typedef union{
	uint32 TxData[2];
	struct{
		uint8 manualMode_ON : 1;
		uint8 WaterPump0_ON : 1;
		uint8 WaterPump1_ON : 1;
		uint8 Radiator0_ON : 1;
		uint8 Radiator1_ON : 1;
		uint8 ExternalFan :1;
		uint8 OnAll : 1;
		uint8 RST : 1;
		uint8 Remain;
		uint16 Remain2;
		uint32 Remain3;
	}B;

}Cooling_switch_t;

typedef union{
	uint32 TxData[2];
	struct{
		uint8 WaterPump0_DutyOrder;
		uint8 WaterPump1_DutyOrder;
		uint8 Radiator0_DutyOrder;
		uint8 Radiator1_DutyOrder;
		uint8 ExternalFan_DutyOrder;
		uint8 defaultDutyOrder;
		uint16 Remain;

	} B;

}Cooling_order_t;


IFX_EXTERN Cooling_msg1_t Cooling_msg1;
IFX_EXTERN Cooling_msg2_t Cooling_msg2;
IFX_EXTERN Cooling_switch_t Cooling_switch;
IFX_EXTERN Cooling_order_t Cooling_order;


IFX_EXTERN void SDP_Cooling_init(void);
IFX_EXTERN void SDP_Cooling_run_10ms(void);
IFX_EXTERN void SDP_Cooling_setVCUmode(void);
IFX_EXTERN void SDP_Cooling_resetVCUmode(void);
IFX_EXTERN void SDP_Cooling_toggleWaterPump(void);
IFX_EXTERN void SDP_Cooling_onWaterPump(void);
IFX_EXTERN void SDP_Cooling_offWaterPump(void);
IFX_EXTERN void SDP_Cooling_toggleRadiatorFan(void);
IFX_EXTERN void SDP_Cooling_onRadiatorFan(void);
IFX_EXTERN void SDP_Cooling_offRadiatorFan(void);
IFX_EXTERN void SDP_Cooling_AllOn(void);
IFX_EXTERN void SDP_Cooling_AllOff(void);
IFX_EXTERN void SDP_Cooling_setWaterPumpDuty(uint8, uint8);
IFX_EXTERN void SDP_Cooling_setWaterPump0Duty(uint8);
IFX_EXTERN void SDP_Cooling_setWaterPump1Duty(uint8);
IFX_EXTERN void SDP_Cooling_setRadiatorFanDuty(uint8, uint8);
IFX_EXTERN void SDP_Cooling_setRadiatorFan0Duty(uint8);
IFX_EXTERN void SDP_Cooling_setRadiatorFan1Duty(uint8);
#endif /* COOLING_H */
