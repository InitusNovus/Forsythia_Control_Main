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
		uint8 WaterPump_P;
		uint8 Radiator0_T;
		uint8 Radiator1_T;
	}B;

}Cooling_msg_t;

typedef union{
	uint32 TxData[2];
	struct{
		uint8 AutoMode_ON : 1;
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


IFX_EXTERN Cooling_msg_t Cooling_msg;
IFX_EXTERN Cooling_switch_t Cooling_switch;
IFX_EXTERN Cooling_order_t Cooling_order;


IFX_EXTERN void SDP_Cooling_init(void);
IFX_EXTERN void SDP_Cooling_run_1ms(void);

#endif /* COOLING_H */
