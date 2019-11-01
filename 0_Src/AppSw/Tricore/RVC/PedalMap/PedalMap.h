/* 
 * PedalMap.h
 * Created on 2019. 11. 01.
 * Author: Dua
 */

#ifndef PEDALMAP_H_
#define PEDALMAP_H_

/* Includes */
#include "RVC.h"
#include "PedalMap.h"
#include "PedalMap_lut.h"


/* Inline function Impementations */
IFX_INLINE void RVC_PedalMap_lut_setMode(RH26_PedalMap_lut_mode num)
{
	RH26_PedalMap_lut_setMode(num);
}

IFX_INLINE float32 RVC_PedalMap_lut_getResult(float32 input)
{
	return RH26_PedalMap_lut_getResult(input);
}



#endif