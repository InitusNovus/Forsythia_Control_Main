/*
 * GtmTim.c
 *
 *  Created on: 2019. 3. 7.
 *      Author: HoHyon
 */

#include "GtmTim.h"

#include "GtmTom.h"

/*

typedef struct
{
	IfxGtm_Tim_In driver0;
	IfxGtm_Tim_In driver1;
	IfxGtm_Tim_In driver2;
	IfxGtm_Tim_In driver3;
	IfxGtm_Tim_In driver4;
	IfxGtm_Tim_In driver5;
	IfxGtm_Tim_In driver6;
	IfxGtm_Tim_In driver7;
}GtmTim_t;


GtmTim_t g_gtmTim;
 */


HLD_GtmTim_t HLD_GtmTim;


IFX_STATIC void HLD_GtmTim_procChannelData(HLD_GtmTim_channel_t* channel);
IFX_STATIC void HLD_GtmTim_read(void);
IFX_STATIC void HLD_GtmTim_initChannel(HLD_GtmTim_channel_t* channel,IfxGtm_Tim_TinMap* timIn);

void HLD_GtmTim_init(void)
{
	/* disable interrupts */
	boolean  interruptState = IfxCpu_disableInterrupts();


	Ifx_GTM *gtm = &MODULE_GTM;

/*
	{
		IfxGtm_Tim_In_Config timInConfig;
		IfxGtm_Tim_In_initConfig(&timInConfig, &MODULE_GTM);

		timInConfig.timIndex = GTMTIM0.tim;
		timInConfig.channelIndex = GTMTIM0.channel;
		timInConfig.filter.inputPin = &GTMTIM0;
		IfxGtm_Tim_In_init(&HLD_GtmTim.ch[0].driver,&timInConfig);
	}
*/
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[0],&GTMTIM0);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[1],&GTMTIM1);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[2],&GTMTIM2);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[3],&GTMTIM3);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[4],&GTMTIM4);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[5],&GTMTIM5);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[6],&GTMTIM6);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[7],&GTMTIM7);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[8],&GTMTIM8);
	HLD_GtmTim_initChannel(&HLD_GtmTim.ch[9],&GTMTIM9);

	IfxCpu_restoreInterrupts(interruptState);

	IfxGtm_Cmu_enableClocks(gtm, IFXGTM_CMU_CLKEN_FXCLK | IFXGTM_CMU_CLKEN_CLK0);

}

void HLD_GtmTim_run_1ms(void)
{
	HLD_GtmTim_read();
//	HLD_GtmTim_procChannelData(&HLD_GtmTim.ch[0]);
	uint32 index = 0;
	for(index = 0; index<10; index++)
	{
		HLD_GtmTim_procChannelData(&HLD_GtmTim.ch[index]);
	}
}

IFX_STATIC void HLD_GtmTim_initChannel(HLD_GtmTim_channel_t* channel,IfxGtm_Tim_TinMap* timIn)
{
	IfxGtm_Tim_In_Config timInConfig;
	IfxGtm_Tim_In_initConfig(&timInConfig, &MODULE_GTM);

	timInConfig.timIndex = timIn->tim;
	timInConfig.channelIndex = timIn->channel;
	timInConfig.filter.inputPin = timIn;

	timInConfig.filter.fallingEdgeMode = IfxGtm_Tim_In_ConfigFilterMode_individualDeglitchTimeUpDown;
	timInConfig.filter.fallingEdgeFilterTime = 5e-6;

	timInConfig.filter.risingEdgeMode = IfxGtm_Tim_In_ConfigFilterMode_individualDeglitchTimeUpDown;
	timInConfig.filter.risingEdgeFilterTime = 5e-6;

	IfxGtm_Tim_In_init(&channel->driver,&timInConfig);
}

IFX_STATIC void HLD_GtmTim_read(void)
{
//	IfxGtm_Tim_In_update(&HLD_GtmTim.ch[0].driver);
	uint32 index = 0;
	for(index = 0; index<10; index++)
	{
		IfxGtm_Tim_In_update(&HLD_GtmTim.ch[index].driver);
	}
}

IFX_STATIC void HLD_GtmTim_procChannelData(HLD_GtmTim_channel_t* channel)
{
	channel->data.period_tick = channel->driver.periodTick;
	channel->data.pulseWidth_tick = channel->driver.pulseLengthTick;
	channel->data.period_ms = (float32)(channel->driver.periodTick*1000)/(channel->driver.captureClockFrequency);
	channel->data.pulseWidth_ms = (float32)(channel->driver.pulseLengthTick*1000)/(channel->driver.captureClockFrequency);
	channel->data.pulseHz = (float32)(channel->driver.captureClockFrequency/channel->driver.periodTick);
	channel->data.dutyRatio_percent = (float32)(channel->driver.pulseLengthTick*100)/(channel->driver.periodTick);
}

