/*
 * Ccu6PwmHl.c
 *
 *  Created on: 2018. 6. 2.
 *      Author: bigbi_000
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "Ccu6Pwm.h"
#include <stdio.h>
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
Ccu6Tpwm_t g_Ccu6Pwm;
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_STATIC void HLD_Ccu6Pwm_applyUpdate(Ifx_CCU6* ccu6);
/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void HLD_Ccu6Pwm_init(void)
{
	printf("Ccu6Pwm_init() called\n");
	/* disable interrupts */
	boolean  interruptState = IfxCpu_disableInterrupts();

	/*PwmMotor init*/
	{
		IfxCcu6_TPwm_Config tPwmConfig;
		IfxCcu6_T12Channel firstChannel = IfxCcu6_T12Channel_1;
		IfxCcu6_ChannelOut firstChannelOut = IfxCcu6_ChannelOut_cc1;
		IfxCcu6_T12Channel secondChannel = IfxCcu6_T12Channel_2;
		IfxCcu6_ChannelOut secondChannelOut = IfxCcu6_ChannelOut_cc2;
		IfxCcu6_TPwm_initModuleConfig(&tPwmConfig, &MODULE_CCU60);



//		tPwmConfig.base.frequency			= 10000;
		tPwmConfig.base.frequency			= 20000;
//		tPwmConfig.base.period				= 10000;
		tPwmConfig.base.period				= 5000;
		tPwmConfig.base.waitingTime			= 0;
//		tPwmConfig.base.activeCount			= 10000;
		tPwmConfig.base.activeCount			= 5000;
		tPwmConfig.base.activeState = Ifx_ActiveState_high;

		tPwmConfig.timer						= IfxCcu6_TimerId_t12;
		tPwmConfig.clock.t12ExtClockEnabled		= FALSE;
//		tPwmConfig.timer12.compareValue			= 5000;
		tPwmConfig.timer12.compareValue			= tPwmConfig.base.period/2;
		tPwmConfig.timer12.deadTimeValue		= 0;

		tPwmConfig.channelOut = firstChannelOut;

		const IfxCcu6_TPwm_Pins pins = {
				NULL_PTR,                              /* CC60Out pin  */
				&MOTOR_U5,                              /* CC61Out pin */
				&MOTOR_U6,                              /* CC62Out pin */
				NULL_PTR,                              /* COUT60 pin */
				NULL_PTR,                              /* COUT61 pin */
				NULL_PTR,                              /* COUT62 pin */
				NULL_PTR,          						  /* COUT63 pin */
				IfxPort_OutputMode_pushPull,
				IfxPort_PadDriver_cmosAutomotiveSpeed1,
				NULL_PTR,
				NULL_PTR,
				IfxPort_InputMode_pullUp
		};
		tPwmConfig.pins = &pins;
		tPwmConfig.trigger.outputTriggerEnabled = FALSE;

		IfxCcu6_TPwm_initModule(&g_Ccu6Pwm.drivers.tPwm, &tPwmConfig);
		g_Ccu6Pwm.drivers.channels.channel1 = firstChannel;
		g_Ccu6Pwm.drivers.channels.out1 = firstChannelOut;
		g_Ccu6Pwm.drivers.channels.channel2 = secondChannel;
		g_Ccu6Pwm.drivers.channels.out2 = secondChannelOut;

		{	/*first channel config*/
			IfxCcu6_setT12ChannelMode(g_Ccu6Pwm.drivers.tPwm.ccu6, firstChannel, IfxCcu6_T12ChannelMode_compareMode);
			IfxCcu6_setT12CompareValue(g_Ccu6Pwm.drivers.tPwm.ccu6, firstChannel, tPwmConfig.base.period/2);
			if (tPwmConfig.timer12.deadTimeValue)
			{
				IfxCcu6_setDeadTimeValue(g_Ccu6Pwm.drivers.tPwm.ccu6, tPwmConfig.timer12.deadTimeValue);
				IfxCcu6_enableDeadTime(g_Ccu6Pwm.drivers.tPwm.ccu6, firstChannel);
				IfxCcu6_enableModulationOutput(g_Ccu6Pwm.drivers.tPwm.ccu6, tPwmConfig.timer, firstChannelOut);
				IfxCcu6_setOutputPassiveState(g_Ccu6Pwm.drivers.tPwm.ccu6, firstChannelOut, tPwmConfig.base.activeState);
			}
			IfxCcu6_enableModulationOutput(g_Ccu6Pwm.drivers.tPwm.ccu6, tPwmConfig.timer, firstChannelOut);
			IfxCcu6_setOutputPassiveState(g_Ccu6Pwm.drivers.tPwm.ccu6, firstChannelOut,  Ifx_ActiveState_high);
		}

		{	/*Second channel config*/
			IfxCcu6_setT12ChannelMode(g_Ccu6Pwm.drivers.tPwm.ccu6, secondChannel, IfxCcu6_T12ChannelMode_compareMode);
			IfxCcu6_setT12CompareValue(g_Ccu6Pwm.drivers.tPwm.ccu6, secondChannel, tPwmConfig.base.period/2);
			if (tPwmConfig.timer12.deadTimeValue)
			{
				IfxCcu6_setDeadTimeValue(g_Ccu6Pwm.drivers.tPwm.ccu6, tPwmConfig.timer12.deadTimeValue);
				IfxCcu6_enableDeadTime(g_Ccu6Pwm.drivers.tPwm.ccu6, secondChannel);
				IfxCcu6_enableModulationOutput(g_Ccu6Pwm.drivers.tPwm.ccu6, tPwmConfig.timer, secondChannelOut);
				IfxCcu6_setOutputPassiveState(g_Ccu6Pwm.drivers.tPwm.ccu6, secondChannelOut, tPwmConfig.base.activeState);
			}
			IfxCcu6_enableModulationOutput(g_Ccu6Pwm.drivers.tPwm.ccu6, tPwmConfig.timer, secondChannelOut);
			IfxCcu6_setOutputPassiveState(g_Ccu6Pwm.drivers.tPwm.ccu6, secondChannelOut,  Ifx_ActiveState_high);
		}

		IfxCcu6_setT12PeriodValue(g_Ccu6Pwm.drivers.tPwm.ccu6, (uint16)tPwmConfig.base.period);
		g_Ccu6Pwm.compareValue = tPwmConfig.base.period/2;

		g_Ccu6Pwm.drivers.tPwm.base.period = tPwmConfig.base.period;
	}
	IfxCpu_restoreInterrupts(interruptState);

	printf("Ccu6Pwm is initialized\n");

	IfxCcu6_TPwm_start(&g_Ccu6Pwm.drivers.tPwm);
}

void HLD_Ccu6Pwm_run(void)
{
	IfxCcu6_setT12CompareValue(g_Ccu6Pwm.drivers.tPwm.ccu6, g_Ccu6Pwm.drivers.channels.channel1, g_Ccu6Pwm.compareValue);
	IfxCcu6_setT12CompareValue(g_Ccu6Pwm.drivers.tPwm.ccu6, g_Ccu6Pwm.drivers.channels.channel2, g_Ccu6Pwm.compareValue);
	HLD_Ccu6Pwm_applyUpdate(g_Ccu6Pwm.drivers.tPwm.ccu6);
}

void HLD_Ccu6Pwm_applyUpdate(Ifx_CCU6* ccu6)
{
	ccu6->TCTR4.B.T12STR = TRUE;
}
