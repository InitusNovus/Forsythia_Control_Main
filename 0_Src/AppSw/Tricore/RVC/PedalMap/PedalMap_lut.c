/*
 * PedalMap_lut.c
 *
 *  Created on: 2019. 5. 19.
 *      Author: mains
 */



/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "HLD.h"
#include "PedalMap_lut.h"
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
RH26_PedalMap_lut_t		RH26_PedalMap_lut;
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/
const RH26_PedalMap_lut_t		RH26_PedalMap_lut_Mode0={.data = {0, 20, 40, 60, 80, 100}};

const RH26_PedalMap_lut_t		RH26_PedalMap_lut_Mode1={.data = {0, 5, 20, 45, 75, 100}};

const RH26_PedalMap_lut_t		RH26_PedalMap_lut_Mode2={.data = {0, 10, 35, 75, 95, 100}};

/* y = x^2 */
const RH26_PedalMap_lut_t		RH26_PedalMap_lut_Mode3={.data = {0, 4, 16, 36, 64, 100}};

/* y = 1 - x^2 */
const RH26_PedalMap_lut_t		RH26_PedalMap_lut_Mode4={.data = {0, 36, 64, 84, 96, 100}};
/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/

void RH26_PedalMap_lut_setMode(RH26_PedalMap_lut_mode num){
	switch (num)
	{
	case RH26_PedalMap_mode0:
		RH26_PedalMap_lut = RH26_PedalMap_lut_Mode0;
		break;

	case RH26_PedalMap_mode1:
		RH26_PedalMap_lut = RH26_PedalMap_lut_Mode1;
		break;

	case RH26_PedalMap_mode2:
		RH26_PedalMap_lut = RH26_PedalMap_lut_Mode2;
		break;

	case RH26_PedalMap_mode3:
		RH26_PedalMap_lut = RH26_PedalMap_lut_Mode3;
		break;

	case RH26_PedalMap_mode4:
		RH26_PedalMap_lut = RH26_PedalMap_lut_Mode4;
		break;
	}
}



float32 RH26_PedalMap_lut_getResult(float32 input){
	float32 secLen = (float32)100/SIZEOF_PMLUT;
	uint16 index = (uint16)(input/secLen);
	float32 result;
	float32 torLen;
	float32 pedLen;
	if(input<=0){
		input = 0;
		return 0;
	}
	else if(input>=100){
		input = 100;
		return 100;
	}

	torLen = RH26_PedalMap_lut.data[index+1]-RH26_PedalMap_lut.data[index];
	pedLen = input - (index * secLen);
	result = RH26_PedalMap_lut.data[index]+((torLen * pedLen)/(secLen));
	return result;
}
