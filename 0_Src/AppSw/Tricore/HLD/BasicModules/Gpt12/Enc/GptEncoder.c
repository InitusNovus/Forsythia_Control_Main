/*
 * GptEncoder.c
 *
 *  Created on: 2018. 5. 18.
 *      Author: bigbi_000
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "GptEncoder.h"
#include <stdio.h>
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define ENC_RESOLUTION 900
#define ENC_SAMPLINGTIME (1.0e-3)
#define ENC_REVERSED	FALSE


#define ENC_TEST
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef struct
{
	IfxGpt12_IncrEnc driver;
}GptEncoder_t;
/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
GptEncoder_t g_GptEncoder;
HLD_Encoder_t HLD_GptEncoder;

#ifdef ENC_TEST
float32 EncoderTest = 0;
Ifx_LowPassPt1F32 EncoderTestFilter;
#endif

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void HLD_GptEncoder_init(void)
{
	printf("GptEncoder_init() called\n");

	IfxGpt12_enableModule(&MODULE_GPT120);
	IfxGpt12_setGpt1BlockPrescaler(&MODULE_GPT120, IfxGpt12_Gpt1BlockPrescaler_4);

	IfxGpt12_IncrEnc_Config config;
	IfxGpt12_IncrEnc_initConfig(&config, &MODULE_GPT120);

	config.base.offset                    = 0;
	config.base.reversed                  = ENC_REVERSED;
	config.base.resolution                = ENC_RESOLUTION;
	config.base.periodPerRotation         = 1;
	//    config.base.resolutionFactor          = IfxStdIf_Pos_ResolutionFactor_twoFold;
	//    config.base.resolutionFactor          = IfxStdIf_Pos_ResolutionFactor_oneFold;
	config.base.resolutionFactor          = IfxStdIf_Pos_ResolutionFactor_fourFold;
	config.base.updatePeriod              = ENC_SAMPLINGTIME;//
	//    config.base.updatePeriod              = (1.0e-2);//
	config.base.speedModeThreshold        = 2;
	config.base.minSpeed                  = 4;
	//    config.base.maxSpeed                  = 750;
	config.base.maxSpeed                  = 300;
	//    config.zeroIsrPriority                = ISR_PRIORITY(INTERRUPT_INCRINC_ZERO);
	//    config.zeroIsrProvider                = ISR_PROVIDER(INTERRUPT_INCRINC_ZERO);
	//    config.pinA                           = &IfxGpt120_T3INA_P02_6_IN;
	config.pinA                           = &ENCODER_A;
	//    config.pinB                           = &IfxGpt120_T3EUDA_P02_7_IN;
	config.pinB                           = &ENCODER_B;
	//    config.pinZ                           = &IfxGpt120_T4INA_P02_8_IN;
	config.pinMode                        = IfxPort_InputMode_noPullDevice;

	config.base.speedFilterEnabled        = TRUE;
	//    config.base.speedFilterEnabled        = FALSE;
	config.base.speedFilerCutOffFrequency = config.base.maxSpeed / 2 * IFX_PI * 2;

	printf("GptEncoder initialized\n");

#ifdef ENC_TEST
	{
		Ifx_LowPassPt1F32_Config lpfConfig = {
				.cutOffFrequency = 1/(2.0*IFX_PI*2.5),
				.gain = 1,
				.samplingTime = 0.001
		};
		Ifx_LowPassPt1F32_init(&EncoderTestFilter, &lpfConfig);
	}
#endif
	IFX_VALIDATE(IFX_VERBOSE_LEVEL_ERROR, IfxGpt12_IncrEnc_init(&g_GptEncoder.driver, &config));
}

void HLD_GptEncoder_run_1ms(void)
{
	IfxGpt12_IncrEnc_update(&g_GptEncoder.driver);

	HLD_GptEncoder.speed		= IfxGpt12_IncrEnc_getSpeed(&g_GptEncoder.driver);
	HLD_GptEncoder.rawPosition	= (float32) IfxGpt12_IncrEnc_getRawPosition(&g_GptEncoder.driver);
	HLD_GptEncoder.direction 	= IfxGpt12_IncrEnc_getDirection(&g_GptEncoder.driver);

#ifdef ENC_TEST
	{
		EncoderTest = Ifx_LowPassPt1F32_do(&EncoderTestFilter, HLD_GptEncoder.speed);
	}
#endif
}

float32 HLD_GptEncoder_getSpeed(void)
{
	return HLD_GptEncoder.speed;
}

IfxStdIf_Pos_Dir HLD_GptEncoder_getDirection(void)
{
	return HLD_GptEncoder.direction;
}

boolean HLD_GptEncoder_isForward(void)
{
	if(HLD_GptEncoder.direction == IfxStdIf_Pos_Dir_forward)
		return TRUE;
	else
		return FALSE;
}

boolean HLD_GptEncoder_isBackward(void)
{
	if(HLD_GptEncoder.direction == IfxStdIf_Pos_Dir_backward)
		return TRUE;
	else
		return FALSE;
}
