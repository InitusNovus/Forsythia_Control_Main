/*
 * Vadc.h
 *
 *  Created on: 2019. 10. 18.
 *      Author: Dua
 */

#ifndef SRC_APPSW_TRICORE_HLD_BASICMODULES_VADC_VADC_H_
#define SRC_APPSW_TRICORE_HLD_BASICMODULES_VADC_VADC_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "HLD.h"

#include <Vadc/Std/IfxVadc.h>
#include <Vadc/Adc/IfxVadc_Adc.h>
#include <Ifx_LowPassPt1F32.h>
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
#if HLD_BOARD == HLD_BOARD_AK237
typedef enum
{
	HLD_Vadc_GroupId_0 = 0,
	HLD_Vadc_GroupId_1 = 1,
}HLD_Vadc_GroupId;
#define HLD_Vadc_groupNum 2

#elif HLD_BOARD == HLD_BOARD_SB275
typedef enum
{
	HLD_Vadc_group0 = 0,
	HLD_Vadc_group1 = 1,
	HLD_Vadc_group2 = 2,
	HLD_Vadc_group3 = 3,
	HLD_Vadc_group4 = 4,
	HLD_Vadc_group5 = 5,
}HLD_Vadc_GroupId;
#define HLD_Vadc_groupNum 6

#endif


typedef enum
{
	HLD_Vadc_ChannelId_none = -1,
	HLD_Vadc_ChannelId_0    = 0,
	HLD_Vadc_ChannelId_1    = 1,
	HLD_Vadc_ChannelId_2    = 2,
	HLD_Vadc_ChannelId_3    = 3,
	HLD_Vadc_ChannelId_4    = 4,
	HLD_Vadc_ChannelId_5    = 5,
	HLD_Vadc_ChannelId_6    = 6,
	HLD_Vadc_ChannelId_7    = 7,
#if HLD_BOARD == HLD_BOARD_AK237
	HLD_Vadc_ChannelId_8    = 8,
	HLD_Vadc_ChannelId_9    = 9,
	HLD_Vadc_ChannelId_10   = 10,
	HLD_Vadc_ChannelId_11   = 11
#endif
}HLD_Vadc_ChannelId;


typedef struct
{
	struct	//driver
	{
		IfxVadc_Adc vadc;

#if HLD_BOARD == HLD_BOARD_AK237
		union	//adcGroup
		{
			struct
			{
				IfxVadc_Adc_Group g0;
				IfxVadc_Adc_Group g1;

			}S;
			IfxVadc_Adc_Group A[2];
		}adcGroup;
#elif HLD_BOARD == HLD_BOARD_SB275
		union	//adcGroup
		{
			struct
			{
				IfxVadc_Adc_Group g0;
				IfxVadc_Adc_Group g1;
				IfxVadc_Adc_Group g2;
				IfxVadc_Adc_Group g3;
				IfxVadc_Adc_Group g4;
				IfxVadc_Adc_Group g5;
			}S;
			IfxVadc_Adc_Group A[6];
		}adcGroup;
#endif

	}driver;

}HLD_Vadc_t;



typedef struct
{
	IfxVadc_Adc_Channel channel;

	IfxVadc_ChannelResult result;

	Ifx_LowPassPt1F32 lpf;
	boolean isLpfActivatied;
}HLD_Vadc_Channel;

typedef struct
{
	HLD_Vadc_GroupId groupId;
	HLD_Vadc_ChannelId channelId;
}HLD_Vadc_Channel_In;


typedef struct
{
	HLD_Vadc_Channel_In* channelIn;
	struct
	{
		boolean	activated;
		Ifx_LowPassPt1F32_Config config;
	}lpf;

}HLD_Vadc_Channel_Config;

typedef struct
{
	uint32 rawData;
	float32 voltage;
}HLD_Vadc_Data;

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
#if HLD_BOARD == HLD_BOARD_AK237
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN0_G0CH0_X102_12;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN1_G0CH1_X102_11;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN2_G0CH2_X102_10;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN3_G0CH3_X102_9;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN9_G0CH9_X102_6;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN10_G0CH10_X102_10;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN11_G0CH11_X103_39;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN12_G1CH0_X103_40;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN13_G1CH1_X103_38;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN15_G1CH3_X102_8;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN16_G1CH4_X102_7;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN17_G1CH5_X103_37;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN20_G1CH8_X103_36;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_AN21_G1CH9_X103_35;

#elif HLD_BOARD == HLD_BOARD_SB275
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P32_3_G4CH7_AD0;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P32_4_G4CH6_AD1;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P32_1_G4CH5_AD2;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P23_2_G4CH4_AD3;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P10_0_G3CH1_AD4;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P10_7_G3CH0_AD5;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P23_3_G2CH5_AD6;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P20_6_G2CH4_AD7;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P33_6_G0CH3_AD8;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P22_2_G0CH2_AD9;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P23_5_G0CH1_AD10;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P23_4_G0CH0_AD11;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P33_10_G5CH4_DA0;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P33_11_G5CH5_DA1;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P20_7_G5CH6_CANRX0;
IFX_EXTERN HLD_Vadc_Channel_In HLD_Vadc_P20_8_G5CH7_CANTX0;

#endif


/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_EXTERN void HLD_Vadc_init(void);
IFX_EXTERN void HLD_Vadc_initChannel(HLD_Vadc_Channel* channel, HLD_Vadc_Channel_Config* config);
IFX_EXTERN void HLD_Vadc_initChannelConfig(HLD_Vadc_Channel_Config* config);
IFX_EXTERN void HLD_Vadc_forceStart(void);
IFX_EXTERN void HLD_Vadc_getData(HLD_Vadc_Data* data, HLD_Vadc_Channel* channel);
/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/



#endif
