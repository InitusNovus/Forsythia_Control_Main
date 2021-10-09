/*
 * MC_can.h
 *
 *  Created on: 2021. 5. 13.
 *      Author: Suprhimp
 */

#ifndef MC_can_H_
#define MC_can_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "SDP.h"
#include "CanCommunication.h"
#include "HLD.h"
#include "MicroSD_Demo.h"

typedef union
{
    struct{
		int AMK_ActualVelocity : 10;
		int AMK_TorqueCurrent : 8;
		int AMK_MagnetizingCurrent : 8;
        int AMK_TempMotor : 10;
        int AMK_TempInverter : 10;
        unsigned int AMK_ErrorInfo : 16;
    }S;
    uint32 RecievedData[2];
}MC_R_data_t;

typedef union
{
    uint32 TransmitData[2];
    struct{
        unsigned int Inverter_DcOn : 1;
        unsigned int EF_On : 1;
        unsigned int BE1_On : 1;
        unsigned int bEnable : 1;
        unsigned int Inverter_On : 1;
        unsigned int BE2_On : 1;
        unsigned int AMK_bErrorResetFL : 1;
        unsigned int AMK_bErrorResetFR : 1;
        unsigned int AMK_bErrorResetRL : 1;
        unsigned int AMK_bErrorResetRR : 1;
        unsigned int Reserve1 : 22;
        unsigned int Reserve2 ;

    }S;
}MC_T_data_t;

typedef union 
{
    uint32 RecievedData[2];
	struct{
		uint8 External_ON : 1;
		uint8 WaterPump0_ON : 1;
		uint8 WaterPump1_ON : 1;
		uint8 Radiator0_ON : 1;
		uint8 Radiator1_ON : 1;
		uint8 killAll : 1;
		uint8 OnAll : 1;
		uint8 RST : 1;
		sint8 WaterPump0_DutyOrder;
		sint8 WaterPump1_DutyOrder;
		sint8 Radiator0_DutyOrder;
		sint8 Radiator1_DutyOrder;
		sint8 ExternalFan_DutyOrder;
		uint16 Remain;

	}B;
}TC_msg_t;


IFX_EXTERN MC_R_data_t MC_R_data;
IFX_EXTERN MC_T_data_t MC_T_data;
IFX_EXTERN TC_msg_t TC_msg;

IFX_EXTERN void SDP_MC_init(void);
IFX_EXTERN void SDP_MC_run_1ms(void);

#endif /* MC_can_H_ */
