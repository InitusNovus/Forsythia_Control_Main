/*
 * GtmTim.h
 *
 *  Created on: 2019. 3. 7.
 *      Author: HoHyon
 */

#ifndef GTMTIM_H_
#define GTMTIM_H_


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include <Ifx_Types.h>
#include "IfxGtm_Tim.h"
#include "IfxGtm_Tim_In.h"
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include "_Lib/DataHandling/Ifx_Fifo.h"



/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/

typedef struct
{
	uint32				pulseWidth_tick;
	uint32				period_tick;
	float32				pulseWidth_ms;
	float32				period_ms;
	float32				pulseHz;
	float32				dutyRatio_percent;
}HLD_GtmTim_dataPulse_t;

typedef struct
{
	IfxGtm_Tim_In driver;
	HLD_GtmTim_dataPulse_t data;
}HLD_GtmTim_channel_t ;

typedef struct
{
	HLD_GtmTim_channel_t	ch[10];
}HLD_GtmTim_t;


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
IFX_EXTERN HLD_GtmTim_t HLD_GtmTim;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_EXTERN void HLD_GtmTim_init(void);
//IFX_EXTERN void HLD_GtmTim_update(HLD_gtmTim_data_Pulse *data_out , IfxGtm_Tim_In data_in);
//IFX_EXTERN void HLD_GtmTim_update(HLD_GtmTim_channel_t* channel);
IFX_EXTERN void HLD_GtmTim_run_1ms(void);

#endif /* 0_SRC_APPSW_TRICORE_HLD_GTMTIM_H_ */
