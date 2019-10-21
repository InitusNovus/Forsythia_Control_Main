/*
 * GptCnt.h
 *
 *  Created on: 2019. 3. 11.
 *      Author: HoHyon
 */

#ifndef GPTCNT_H_
#define GPTCNT_H_

#include <Ifx_Types.h>
#include <stdio.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
//#include "Gpt12/Std/IfxGpt12.h"
#include "Gpt12/IncrEnc/IfxGpt12_IncrEnc.h"
#include "IfxPort.h"
#include "Bsp.h"
#include "IfxPort_PinMap.h"


typedef struct{
/*	uint32				pulseWidth_tick;
	uint32				period_tick;
	float32				pulseWidth_ms;*/
	float32				period_ms;
	float32				pulseHz;
//	float32				dutyRatio_percent;
}HLD_GptCnt_data_Pulse;


typedef struct
{

	HLD_GptCnt_data_Pulse	T3;
	HLD_GptCnt_data_Pulse	T4;

}HLD_CntEncoder_t;
/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
IFX_EXTERN HLD_CntEncoder_t HLD_GptCnt;



IFX_EXTERN void HLD_GptCnt_init(void);
IFX_EXTERN void HLD_GptCnt_run(void);
#endif /* 0_SRC_APPSW_TRICORE_HLD_GPTCNT_H_ */
