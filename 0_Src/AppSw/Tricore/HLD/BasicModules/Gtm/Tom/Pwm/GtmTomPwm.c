/*
 * GtmTomPWM.c
 *
 *  Created on: 2019. 10. 17.
 *      Author: Dua
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "GtmTomPwm.h"

#include "HLD.h"
#include <stdio.h>
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define PWM_FREQ (20000)		//PWM Frequency in Hz
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void HLD_GtmTomPwm_initPwm(HLD_GtmTom_Pwm* pwm, HLD_GtmTom_Pwm_Config* config)
{
	IfxGtm_Tom_Timer_Config timerConfig;
	IfxGtm_Tom_Timer_initConfig (&timerConfig, &MODULE_GTM);
	timerConfig.tom = config->tomOut->tom;
	timerConfig.timerChannel = config->tomOut->channel;
	timerConfig.triggerOut = config->tomOut;
	timerConfig.base.frequency = (pwm->frequency = config->frequency);

	timerConfig.base.minResolution = 0;
	timerConfig.clock = IfxGtm_Tom_Ch_ClkSrc_cmuFxclk1;

	timerConfig.base.trigger.enabled = TRUE;
	timerConfig.base.trigger.outputEnabled = TRUE;
	timerConfig.base.trigger.outputMode = IfxPort_OutputMode_pushPull;
	timerConfig.base.trigger.outputDriver = IfxPort_PadDriver_cmosAutomotiveSpeed1;

	timerConfig.base.trigger.triggerPoint = (pwm->triggerPoints = 0);
	timerConfig.base.trigger.risingEdgeAtPeriod = TRUE;

	IfxGtm_Tom_Timer_init(&pwm->driver, &timerConfig);
	IfxGtm_Tom_Timer_run(&pwm->driver);

	pwm->period = IfxGtm_Tom_Timer_getPeriod(&pwm->driver);
}


void HLD_GtmTomPwm_setTriggerPoint(HLD_GtmTom_Pwm* pwm, Ifx_TimerValue timVal)
{
		IfxGtm_Tom_Timer_disableUpdate(&pwm->driver);
		IfxGtm_Tom_Timer_setTrigger(&pwm->driver, (pwm->triggerPoints = timVal));
		IfxGtm_Tom_Timer_applyUpdate(&pwm->driver);
}

void HLD_GtmTomPwm_setTriggerPointFloat(HLD_GtmTom_Pwm* pwm, float32 floatDuty)
{
	if(floatDuty > 1.0)
		floatDuty = 1.0;
	else if(floatDuty < 0.0)
		floatDuty = 0.0;
	uint32 period = pwm->period;
	HLD_GtmTomPwm_setTriggerPoint(pwm, (Ifx_TimerValue)period*floatDuty);
}
