/*
 * Vadc.c
 *
 *  Created on: 2019. 10. 18.
 *      Author: Dua
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "HLD.h"
#include "Vadc.h"
#include "AdcForceStart.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define VREF		5.0
#define ADCRES		4095
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
HLD_Vadc_t HLD_Vadc;

#if HLD_BOARD == HLD_BOARD_AK237
HLD_Vadc_Channel_In HLD_Vadc_AN0_G0CH0_X102_12 = {HLD_Vadc_GroupId_0, HLD_Vadc_ChannelId_0};
HLD_Vadc_Channel_In HLD_Vadc_AN1_G0CH1_X102_11 = {HLD_Vadc_GroupId_0, HLD_Vadc_ChannelId_1};
HLD_Vadc_Channel_In HLD_Vadc_AN2_G0CH2_X102_10 = {HLD_Vadc_GroupId_0, HLD_Vadc_ChannelId_2};
HLD_Vadc_Channel_In HLD_Vadc_AN3_G0CH3_X102_9 = {HLD_Vadc_GroupId_0, HLD_Vadc_ChannelId_3};
HLD_Vadc_Channel_In HLD_Vadc_AN9_G0CH9_X102_6 = {HLD_Vadc_GroupId_0, HLD_Vadc_ChannelId_9};
HLD_Vadc_Channel_In HLD_Vadc_AN10_G0CH10_X102_10 = {HLD_Vadc_GroupId_0, HLD_Vadc_ChannelId_10};
HLD_Vadc_Channel_In HLD_Vadc_AN11_G0CH11_X103_39 = {HLD_Vadc_GroupId_0, HLD_Vadc_ChannelId_11};
HLD_Vadc_Channel_In HLD_Vadc_AN12_G1CH0_X103_40 = {HLD_Vadc_GroupId_1, HLD_Vadc_ChannelId_0};
HLD_Vadc_Channel_In HLD_Vadc_AN13_G1CH1_X103_38 = {HLD_Vadc_GroupId_1, HLD_Vadc_ChannelId_1};
HLD_Vadc_Channel_In HLD_Vadc_AN15_G1CH3_X102_8 = {HLD_Vadc_GroupId_1, HLD_Vadc_ChannelId_3};
HLD_Vadc_Channel_In HLD_Vadc_AN16_G1CH4_X102_7 = {HLD_Vadc_GroupId_1, HLD_Vadc_ChannelId_4};
HLD_Vadc_Channel_In HLD_Vadc_AN17_G1CH5_X103_37 = {HLD_Vadc_GroupId_1, HLD_Vadc_ChannelId_5};
HLD_Vadc_Channel_In HLD_Vadc_AN20_G1CH8_X103_36 = {HLD_Vadc_GroupId_1, HLD_Vadc_ChannelId_8};
HLD_Vadc_Channel_In HLD_Vadc_AN21_G1CH9_X103_35 = {HLD_Vadc_GroupId_1, HLD_Vadc_ChannelId_9};

#elif HLD_BOARD == HLD_BOARD_SB275
HLD_Vadc_Channel_In HLD_Vadc_P32_3_G4CH7_AD0 = {HLD_Vadc_group4, HLD_Vadc_ChannelId_7};
HLD_Vadc_Channel_In HLD_Vadc_P32_4_G4CH6_AD1 = {HLD_Vadc_group4, HLD_Vadc_ChannelId_6};
HLD_Vadc_Channel_In HLD_Vadc_P32_1_G4CH5_AD2 = {HLD_Vadc_group4, HLD_Vadc_ChannelId_5};
HLD_Vadc_Channel_In HLD_Vadc_P23_2_G4CH4_AD3 = {HLD_Vadc_group4, HLD_Vadc_ChannelId_4};
HLD_Vadc_Channel_In HLD_Vadc_P10_0_G3CH1_AD4 = {HLD_Vadc_group3, HLD_Vadc_ChannelId_1};
HLD_Vadc_Channel_In HLD_Vadc_P10_7_G3CH0_AD5 = {HLD_Vadc_group3, HLD_Vadc_ChannelId_0};
HLD_Vadc_Channel_In HLD_Vadc_P23_3_G2CH5_AD6 = {HLD_Vadc_group2, HLD_Vadc_ChannelId_5};
HLD_Vadc_Channel_In HLD_Vadc_P20_6_G2CH4_AD7 = {HLD_Vadc_group2, HLD_Vadc_ChannelId_4};
HLD_Vadc_Channel_In HLD_Vadc_P33_6_G0CH3_AD8 = {HLD_Vadc_group0, HLD_Vadc_ChannelId_3};
HLD_Vadc_Channel_In HLD_Vadc_P22_2_G0CH2_AD9 = {HLD_Vadc_group0, HLD_Vadc_ChannelId_2};
HLD_Vadc_Channel_In HLD_Vadc_P23_5_G0CH1_AD10 = {HLD_Vadc_group0, HLD_Vadc_ChannelId_1};
HLD_Vadc_Channel_In HLD_Vadc_P23_4_G0CH0_AD11 = {HLD_Vadc_group0, HLD_Vadc_ChannelId_0};
HLD_Vadc_Channel_In HLD_Vadc_P33_10_G5CH4_DA0 = {HLD_Vadc_group5, HLD_Vadc_ChannelId_4};
HLD_Vadc_Channel_In HLD_Vadc_P33_11_G5CH5_DA1 = {HLD_Vadc_group5, HLD_Vadc_ChannelId_5};
HLD_Vadc_Channel_In HLD_Vadc_P20_7_G5CH6_CANRX0 = {HLD_Vadc_group5, HLD_Vadc_ChannelId_6};
HLD_Vadc_Channel_In HLD_Vadc_P20_8_G5CH7_CANTX0 = {HLD_Vadc_group5, HLD_Vadc_ChannelId_7};

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

void HLD_Vadc_init(void)
{
	/*Module initialization*/
	IfxVadc_Adc_Config adcConfig;
	IfxVadc_Adc_initModuleConfig(&adcConfig, &MODULE_VADC);

	IfxVadc_Adc_initModule(&HLD_Vadc.driver.vadc, &adcConfig);

	/*Group initialization*/
	HLD_Vadc_GroupId groupIndex;

	IfxVadc_Adc_GroupConfig adcGroupConfig;
	IfxVadc_Adc_initGroupConfig(&adcGroupConfig, &HLD_Vadc.driver.vadc);
	adcGroupConfig.arbiter.requestSlotScanEnabled = TRUE;
	adcGroupConfig.scanRequest.autoscanEnabled = TRUE;
	adcGroupConfig.scanRequest.triggerConfig.gatingMode = IfxVadc_GatingMode_always;

	for(groupIndex = 0; groupIndex < HLD_Vadc_groupNum; groupIndex++)
	{
		adcGroupConfig.master = (adcGroupConfig.groupId = (IfxVadc_GroupId)groupIndex);
		IfxVadc_Adc_initGroup(&HLD_Vadc.driver.adcGroup.A[groupIndex], &adcGroupConfig);
	}
}

void HLD_Vadc_initChannel(HLD_Vadc_Channel* channel, HLD_Vadc_Channel_Config* config)
{
	if(config->channelIn != NULL_PTR)
	{ 

		uint32 channels;
		uint32 mask;
		IfxVadc_Adc_Group* adcGroup = &HLD_Vadc.driver.adcGroup.A[(IfxVadc_GroupId)config->channelIn->groupId];

		IfxVadc_Adc_ChannelConfig adcChannelConfig;
		IfxVadc_Adc_initChannelConfig(&adcChannelConfig, adcGroup);

		adcChannelConfig.channelId	 	= (IfxVadc_ChannelId)config->channelIn->channelId;
		channel->result = (adcChannelConfig.resultRegister	= (IfxVadc_ChannelResult)config->channelIn->channelId);

		IfxVadc_Adc_initChannel(&channel->channel, &adcChannelConfig);



		channels = (1<<adcChannelConfig.channelId);
		mask = channels;
		IfxVadc_Adc_setScan(adcGroup, channels, mask);

		if(config->lpf.activated)
		{
			Ifx_LowPassPt1F32_init(&channel->lpf, &config->lpf.config);
			channel->isLpfActivatied = TRUE;
		}
		else
		{
			channel->isLpfActivatied = FALSE;
		}
		
	}
}

void HLD_Vadc_initChannelConfig(HLD_Vadc_Channel_Config* config)
{
	config->channelIn = NULL_PTR;
	config->lpf.activated = FALSE;
}

void HLD_Vadc_forceStart(void)
{
	HLD_Vadc_GroupId groupIndex;
	for (groupIndex = 0; groupIndex < HLD_Vadc_groupNum; groupIndex++)
	{
		HLD_AdcForceStart(&HLD_Vadc.driver.adcGroup.A[groupIndex]);
	}
}

void HLD_Vadc_getData(HLD_Vadc_Data* data, HLD_Vadc_Channel* channel)
{

	if(channel->isLpfActivatied)
	{
		data->voltage = Ifx_LowPassPt1F32_do(&channel->lpf, VREF * (data->rawData = IfxVadc_Adc_getResult(&channel->channel).B.RESULT) / ((float32)ADCRES));
	}
	else
	{
		data->voltage = VREF * (data->rawData = IfxVadc_Adc_getResult(&channel->channel).B.RESULT) / ((float32)ADCRES);
	}
	
	

}
