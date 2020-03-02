/*
 * GtmTom.c
 *
 *  Created on: 2018. 5. 19.
 *      Author: bigbi_000
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "GtmTom.h"

#include <stdio.h>

#include "GtmTomBeeper.h"
#include "GtmTomServo.h"
#include "GtmTomPwm.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef struct
{
	float32				frequency;
	float32				gclkFrequency;
	float32				cmuClk0Frequency;
}GtmTom_t;


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
GtmTom_t g_GtmTom;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void HLD_GtmTom_init(void)
{
	printf("GtmTom_init() called\n");
    /* disable interrupts */
    boolean  interruptState = IfxCpu_disableInterrupts();
	Ifx_GTM *gtm = &MODULE_GTM;

	/* Initialze GTM global */	//FIXME: Split out GTM global init functions
	{
		/* Get GTM clocks */
		g_GtmTom.frequency = IfxGtm_Cmu_getModuleFrequency(gtm);
		/* Module enable */
		IfxGtm_enable(gtm);

		/* Set the global clock frequencies */
		IfxGtm_Cmu_setGclkFrequency(gtm, g_GtmTom.frequency);
		g_GtmTom.gclkFrequency = IfxGtm_Cmu_getGclkFrequency(gtm);

		IfxGtm_Cmu_setClkFrequency(gtm, IfxGtm_Cmu_Clk_0, g_GtmTom.gclkFrequency);
		g_GtmTom.cmuClk0Frequency = IfxGtm_Cmu_getClkFrequency(gtm, IfxGtm_Cmu_Clk_0, TRUE);
	}

	/* Initialze Beeper */
	{
		HLD_GtmTomBeeper_init();
	}
	/*Initialize Servo*/
	{
//		HLD_GtmTomServo_init();
	}

	{
//		HLD_GtmTomPWM_init();
	}


	printf("GtmTom initialized\n");

	/* enable interrupts again */
	IfxCpu_restoreInterrupts(interruptState);

	IfxGtm_Cmu_enableClocks(gtm, IFXGTM_CMU_CLKEN_FXCLK | IFXGTM_CMU_CLKEN_CLK0);

}
