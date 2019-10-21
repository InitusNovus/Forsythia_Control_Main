/*
 * GptCnt.c
 *
 *  Created on: 2019. 3. 11.
 *      Author: HoHyon
 */

#include "GptCnt.h"


typedef struct
{
	IfxGpt12_IncrEnc driver;
	uint32 diff;
	uint32 updateFrequency;
	uint32 cntPerSec;
}HLD_GtmCnt_chData;


typedef struct
{
	HLD_GtmCnt_chData chT3;
	HLD_GtmCnt_chData chT4;

}GptCnt_t;
/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
GptCnt_t g_GptCnt = {.chT3.updateFrequency = 1000,
					.chT4.updateFrequency = 1000};
HLD_CntEncoder_t HLD_GptCnt;


IFX_STATIC void HLD_Gpt12_Cnt_init(IfxGpt12_IncrEnc *driver, const IfxGpt12_IncrEnc_Config *config)
{
    //boolean    status = TRUE;
    Ifx_GPT12 *gpt12  = config->module;

    driver->module             = gpt12;

    driver->offset             = config->base.offset;
    driver->resolution         = config->base.resolution * config->base.resolutionFactor;
    driver->positionConst      = 1.0 / (float32)driver->resolution * 2.0 * IFX_PI;
    driver->speedModeThreshold = config->base.speedModeThreshold;
    IfxGpt12_IncrEnc_setRefreshPeriod(driver, config->base.updatePeriod);

    driver->status.status            = 0;
    driver->status.B.notSynchronised = 1;
    driver->minSpeed                 = config->base.minSpeed;
    driver->maxSpeed                 = config->base.maxSpeed;

    driver->rawPosition              = 0;
    driver->speed                    = 0;
    driver->direction                = IfxStdIf_Pos_Dir_unknown;
    driver->turn                     = 0;

    if (config->pinA->timer == 3)
    {
        /* T3 Configuration */
        IfxGpt12_T3_setMode(gpt12, IfxGpt12_Mode_counter);

        IfxGpt12_T3_setCounterInputMode(gpt12, IfxGpt12_CounterInputMode_risingEdgeTxIN);

/*        switch (config->base.resolutionFactor)
        {
        case IfxStdIf_Pos_ResolutionFactor_twoFold:
            IfxGpt12_T3_setIncrementalInterfaceInputMode(gpt12, IfxGpt12_IncrementalInterfaceInputMode_bothEdgesTxIN);
            break;
        case IfxStdIf_Pos_ResolutionFactor_fourFold:
            IfxGpt12_T3_setIncrementalInterfaceInputMode(gpt12, IfxGpt12_IncrementalInterfaceInputMode_bothEdgesTxINOrTxEUD);
            break;
        default:
            status = FALSE;
            break;
        }*/

        IfxGpt12_T3_setDirectionSource(gpt12, IfxGpt12_TimerDirectionSource_internal);
        IfxGpt12_T3_setTimerDirection(gpt12, config->base.reversed ? IfxGpt12_TimerDirection_up : IfxGpt12_TimerDirection_down);
        IfxGpt12_T3_enableOutput(gpt12, FALSE);
        IfxGpt12_T3_run(gpt12, IfxGpt12_TimerRun_start);

/*        if (config->pinZ != NULL_PTR)
        {                        Only configure T4 if zero signal is available. Zero has to be on T4IN
             T4 Configuration
            IfxGpt12_T4_setMode(gpt12, IfxGpt12_Mode_capture);
            IfxGpt12_T4_setCaptureInputMode(gpt12, IfxGpt12_CaptureInputMode_risingEdgeTxIN);
            IfxGpt12_T4_enableClearTimerT2(gpt12, FALSE);
            IfxGpt12_T4_enableClearTimerT3(gpt12, TRUE);
            IfxGpt12_T4_setInterruptEnable(gpt12, config->zeroIsrPriority != 0);
            IfxGpt12_T4_setRemoteControl(gpt12, IfxGpt12_TimerRemoteControl_off);
            IfxGpt12_T4_run(gpt12, IfxGpt12_TimerRun_stop);

            if (config->zeroIsrPriority)
            {
                 setup interrupt
                volatile Ifx_SRC_SRCR *src = IfxGpt12_T4_getSrc(gpt12);
                IfxSrc_init(src, config->zeroIsrProvider, config->zeroIsrPriority);
                IfxSrc_enable(src);
            }
        }

         T5 Configuration*/
/*        IfxGpt12_T5_setMode(gpt12, IfxGpt12_Mode_timer);
        IfxGpt12_T5_setTimerPrescaler(gpt12, IfxGpt12_TimerInputPrescaler_4);
        IfxGpt12_T5_setCaptureTrigger(gpt12, IfxGpt12_CaptureTrigger_t3inOrT3EUD);
        IfxGpt12_T5_setCaptureTriggerMode(gpt12, IfxGpt12_CaptureTriggerMode_risingEdge);
        IfxGpt12_T5_enableClearTimer(gpt12, TRUE);
        IfxGpt12_T5_setCaptureTriggerEnable(gpt12, TRUE);
        IfxGpt12_T5_setRemoteControl(gpt12, IfxGpt12_TimerRemoteControl_off);
        IfxGpt12_T5_setDirectionSource(gpt12, IfxGpt12_TimerDirectionSource_internal);
        IfxGpt12_T5_setTimerDirection(gpt12, IfxGpt12_TimerDirection_up);
        IfxGpt12_T5_run(gpt12, IfxGpt12_TimerRun_start);*/

        //driver->update = (IfxGpt12_IncrEnc_Update) & IfxGpt12_IncrEnc_updateFromT3;
    }
    else if (config->pinA->timer == 2)
    {
        /* T2 Configuration */
        IfxGpt12_T2_setMode(gpt12, IfxGpt12_Mode_counter);

/*        switch (config->base.resolutionFactor)
        {
        case IfxStdIf_Pos_ResolutionFactor_twoFold:
            IfxGpt12_T2_setIncrementalInterfaceInputMode(gpt12, IfxGpt12_IncrementalInterfaceInputMode_bothEdgesTxIN);
            break;
        case IfxStdIf_Pos_ResolutionFactor_fourFold:
            IfxGpt12_T2_setIncrementalInterfaceInputMode(gpt12, IfxGpt12_IncrementalInterfaceInputMode_bothEdgesTxINOrTxEUD);
            break;
        default:
            status = FALSE;
            break;
        }*/
        IfxGpt12_T2_setCounterInputMode(gpt12, IfxGpt12_CounterInputMode_risingEdgeTxIN);
        IfxGpt12_T2_setDirectionSource(gpt12, IfxGpt12_TimerDirectionSource_internal);
        IfxGpt12_T2_setTimerDirection(gpt12, config->base.reversed ? IfxGpt12_TimerDirection_up : IfxGpt12_TimerDirection_down);
        //IfxGpt12_T2_enableOutput(gpt12, FALSE);
        IfxGpt12_T2_run(gpt12, IfxGpt12_TimerRun_start);

/*        if (config->pinZ != NULL_PTR)
        {                        Only configure T4 if zero signal is available. Zero has to be on T4EUD
             T4 Configuration
            IfxGpt12_T4_setMode(gpt12, IfxGpt12_Mode_capture);
            IfxGpt12_T4_setCaptureInputMode(gpt12, IfxGpt12_CaptureInputMode_none);
            IfxGpt12_T4_enableClearTimerT2(gpt12, TRUE);
            IfxGpt12_T4_enableClearTimerT3(gpt12, FALSE);
            IfxGpt12_T4_setInterruptEnable(gpt12, FALSE);
            IfxGpt12_T4_setRemoteControl(gpt12, IfxGpt12_TimerRemoteControl_off);
            IfxGpt12_T4_run(gpt12, IfxGpt12_TimerRun_stop);
        }

        driver->update = (IfxGpt12_IncrEnc_Update) & IfxGpt12_IncrEnc_updateFromT2;*/
    }

    else if (config->pinA->timer == 4)
    {
        /* T2 Configuration */
        IfxGpt12_T4_setMode(gpt12, IfxGpt12_Mode_counter);

/*        switch (config->base.resolutionFactor)
        {
        case IfxStdIf_Pos_ResolutionFactor_twoFold:
            IfxGpt12_T2_setIncrementalInterfaceInputMode(gpt12, IfxGpt12_IncrementalInterfaceInputMode_bothEdgesTxIN);
            break;
        case IfxStdIf_Pos_ResolutionFactor_fourFold:
            IfxGpt12_T2_setIncrementalInterfaceInputMode(gpt12, IfxGpt12_IncrementalInterfaceInputMode_bothEdgesTxINOrTxEUD);
            break;
        default:
            status = FALSE;
            break;
        }*/
        IfxGpt12_T4_setCounterInputMode(gpt12, IfxGpt12_CounterInputMode_risingEdgeTxIN);
        IfxGpt12_T4_setDirectionSource(gpt12, IfxGpt12_TimerDirectionSource_internal);
        IfxGpt12_T4_setTimerDirection(gpt12, config->base.reversed ? IfxGpt12_TimerDirection_up : IfxGpt12_TimerDirection_down);
        //IfxGpt12_T4_enableOutput(gpt12, FALSE);
        IfxGpt12_T4_run(gpt12, IfxGpt12_TimerRun_start);

/*        if (config->pinZ != NULL_PTR)
        {                        Only configure T4 if zero signal is available. Zero has to be on T4EUD
             T4 Configuration
            IfxGpt12_T4_setMode(gpt12, IfxGpt12_Mode_capture);
            IfxGpt12_T4_setCaptureInputMode(gpt12, IfxGpt12_CaptureInputMode_none);
            IfxGpt12_T4_enableClearTimerT2(gpt12, TRUE);
            IfxGpt12_T4_enableClearTimerT3(gpt12, FALSE);
            IfxGpt12_T4_setInterruptEnable(gpt12, FALSE);
            IfxGpt12_T4_setRemoteControl(gpt12, IfxGpt12_TimerRemoteControl_off);
            IfxGpt12_T4_run(gpt12, IfxGpt12_TimerRun_stop);
        }

        driver->update = (IfxGpt12_IncrEnc_Update) & IfxGpt12_IncrEnc_updateFromT2;*/
    }

    IfxGpt12_initTxInPinWithPadLevel(config->pinA, config->pinMode, config->pinDriver);
/*    IfxGpt12_initTxEudInPinWithPadLevel(config->pinB, config->pinMode, config->pinDriver);

    if (config->pinZ != NULL_PTR)
    {
        IfxGpt12_initTxInPinWithPadLevel(config->pinZ, config->pinMode, config->pinDriver);
    }*/

    driver->speedConstTimeDiff =
        (2.0 * IFX_PI) / (config->base.resolution * 2) * IfxGpt12_T3_getFrequency(gpt12);

    driver->speedFilterEnabled = config->base.speedFilterEnabled;

    if (config->base.speedFilterEnabled)
    {
        Ifx_LowPassPt1F32_Config lpfConfig;
        lpfConfig.gain            = 1.0;
        lpfConfig.cutOffFrequency = config->base.speedFilerCutOffFrequency;
        lpfConfig.samplingTime    = config->base.updatePeriod;
        Ifx_LowPassPt1F32_init(&driver->speedLpf, &lpfConfig);
    }

}


void HLD_GptCnt_init(void){
	IfxGpt12_IncrEnc_Config config;


	IfxGpt12_enableModule(&MODULE_GPT120);
	IfxGpt12_setGpt1BlockPrescaler(&MODULE_GPT120, IfxGpt12_Gpt1BlockPrescaler_4);

    IfxStdIf_Pos_initConfig(&config.base);
//    config.base.resolutionFactor          = IfxStdIf_Pos_ResolutionFactor_twoFold;
    config.base.minSpeed                  = 1.0 / 60.0 * (2 * IFX_PI);     // 1 rpm
    config.base.maxSpeed                  = 20000.0 / 60.0 * (2 * IFX_PI); // 20000 rpm
    config.base.speedFilterEnabled        = TRUE;
    config.base.speedFilerCutOffFrequency = config.base.maxSpeed / 2 * IFX_PI * 10;

    config.pinA                           = &GPT12T3IN;
//    config.pinB                           = NULL_PTR;
//    config.pinZ                           = NULL_PTR;
    config.pinMode                        = IfxPort_InputMode_noPullDevice;
    config.module                         = &MODULE_GPT120;
    config.zeroIsrPriority                = 0;
    config.zeroIsrProvider                = IfxSrc_Tos_cpu0;
    config.pinDriver                      = IfxPort_PadDriver_cmosAutomotiveSpeed1;

    HLD_Gpt12_Cnt_init(&g_GptCnt.chT3.driver, &config);

/*
    config.base.minSpeed                  = 1.0 / 60.0 * (2 * IFX_PI);     // 1 rpm
    config.base.maxSpeed                  = 20000.0 / 60.0 * (2 * IFX_PI); // 20000 rpm
    config.base.speedFilterEnabled        = TRUE;
    config.base.speedFilerCutOffFrequency = config.base.maxSpeed / 2 * IFX_PI * 10;
*/

    config.pinA                           = &GPT12T4IN;
//    config.pinB                           = NULL_PTR;
//    config.pinZ                           = NULL_PTR;
/*
    config.pinMode                        = IfxPort_InputMode_noPullDevice;
    config.module                         = &MODULE_GPT120;
    config.zeroIsrPriority                = 0;
    config.zeroIsrProvider                = IfxSrc_Tos_cpu0;
    config.pinDriver                      = IfxPort_PadDriver_cmosAutomotiveSpeed1;
*/

    HLD_Gpt12_Cnt_init(&g_GptCnt.chT4.driver, &config);

}


IFX_STATIC void HLD_GptCnt_updateCountFromT3(IfxGpt12_IncrEnc *driver){
    Ifx_GPT12 *gpt12 = driver->module;
    sint32     newPosition;
    driver->direction = gpt12->T3CON.B.T3RDIR ? IfxStdIf_Pos_Dir_backward : IfxStdIf_Pos_Dir_forward;

    newPosition       = gpt12->T3.U;

    if(gpt12->T3CON.B.T3OTL){
    	g_GptCnt.chT3.diff			  = (sint64)(driver->rawPosition - newPosition + 0xffff);
    	gpt12->T3CON.B.T3OTL = FALSE;
    }
    else{
    	g_GptCnt.chT3.diff			  = driver->rawPosition - newPosition;
    }
    driver->rawPosition = newPosition;

    g_GptCnt.chT3.cntPerSec = g_GptCnt.chT3.diff * g_GptCnt.chT3.updateFrequency;
}


IFX_STATIC void HLD_GptCnt_updateCountFromT4(IfxGpt12_IncrEnc *driver){
    Ifx_GPT12 *gpt12 = driver->module;
    sint32     newPosition;
    sint32		diff;
    driver->direction = gpt12->T4CON.B.T4RDIR ? IfxStdIf_Pos_Dir_backward : IfxStdIf_Pos_Dir_forward;

    newPosition       = gpt12->T4.U;

    diff = driver->rawPosition - newPosition;

    if(diff>=0){
    	g_GptCnt.chT4.diff = diff;
    }
    else{
    	g_GptCnt.chT4.diff = diff + 0xffff;
    }
/*    if(gpt12->T3CON.B.T3OTL){
    	g_GptCnt.T3.diff			  = (sint64)(driver->rawPosition - newPosition + 0xffff);
    	gpt12->T3CON.B.T3OTL = FALSE;
    }
    else{
    	g_GptCnt.T3.diff			  = driver->rawPosition - newPosition;
    }*/
    driver->rawPosition = newPosition;

    g_GptCnt.chT4.cntPerSec = g_GptCnt.chT4.diff * g_GptCnt.chT4.updateFrequency;
}

/*void HLD_GptCnt_updateCountFromT3(IfxGpt12_IncrEnc *driver){
    Ifx_GPT12 *gpt12 = driver->module;
    sint32     newPosition;
    sint32		diff;
    driver->direction = gpt12->T4CON.B.T4RDIR ? IfxStdIf_Pos_Dir_backward : IfxStdIf_Pos_Dir_forward;

    newPosition       = gpt12->T4.U;

    if(gpt12->T4CON.B.T4OTL){
    	g_GptCnt.diff			  = (sint64)(driver->rawPosition - newPosition + 0xffff);
    	gpt12->T4CON.B.T4OTL = FALSE;
    }
    else{
    	g_GptCnt.diff			  = driver->rawPosition - newPosition;
    }
    driver->rawPosition = newPosition;

    g_GptCnt.cntPerSec = g_GptCnt.diff * g_GptCnt.updateFrequency;
}*/


IFX_STATIC void HLD_GptCnt_updateFromT3(void){
	HLD_GptCnt_updateCountFromT3(&g_GptCnt.chT3.driver);
	HLD_GptCnt.T3.pulseHz = g_GptCnt.chT3.cntPerSec;
	HLD_GptCnt.T3.period_ms = (float32)((float32)1000/g_GptCnt.chT3.cntPerSec);

}

IFX_STATIC void HLD_GptCnt_updateFromT4(void){
	HLD_GptCnt_updateCountFromT4(&g_GptCnt.chT4.driver);
	HLD_GptCnt.T4.pulseHz = g_GptCnt.chT4.cntPerSec;
	HLD_GptCnt.T4.period_ms = (float32)((float32)1000/g_GptCnt.chT4.cntPerSec);

}


void HLD_GptCnt_run(void){

	HLD_GptCnt_updateFromT3();
	HLD_GptCnt_updateFromT4();
	/*  Put Data Processing Code Here  */

}

/*
void IfxGpt12_IncrEnc_initConfig(IfxGpt12_IncrEnc_Config *config, Ifx_GPT12 *gpt12)
{
    IfxStdIf_Pos_initConfig(&config->base);
    config->base.resolutionFactor          = IfxStdIf_Pos_ResolutionFactor_twoFold;
    config->base.minSpeed                  = 1.0 / 60.0 * (2 * IFX_PI);     // 1 rpm
    config->base.maxSpeed                  = 20000.0 / 60.0 * (2 * IFX_PI); // 20000 rpm
    config->base.speedFilterEnabled        = TRUE;
    config->base.speedFilerCutOffFrequency = config->base.maxSpeed / 2 * IFX_PI * 10;

    config->pinA                           = NULL_PTR;
    config->pinB                           = NULL_PTR;
    config->pinZ                           = NULL_PTR;
    config->pinMode                        = IfxPort_InputMode_noPullDevice;
    config->module                         = gpt12;
    config->zeroIsrPriority                = 0;
    config->zeroIsrProvider                = IfxSrc_Tos_cpu0;
    config->pinDriver                      = IfxPort_PadDriver_cmosAutomotiveSpeed1;
}
*/
