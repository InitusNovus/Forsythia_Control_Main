/*
 * PedalBox.h
 *
 *  Created on: 2019. 10. 6.
 *      Author: Dua
 */

#ifndef SRC_APPSW_TRICORE_SDP_PEDALBOX_H_
#define SRC_APPSW_TRICORE_SDP_PEDALBOX_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "GtmTim.h"
#include "SDP.h"
#include "AdcSensor.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/

#define ADC			0
#define PWM			1
#define PPSMODE 	ADC


/*
#define A0STT		0
#define A0END		100
#define A0DDZ		5

#define A1STT		0
#define A1END		100
#define A1DDZ		5

#define A2STT		0
#define A2END		100
#define A2DDZ		5
*/

/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef struct
{
	float32 start;
	float32 end;
	float32 deadzone;
	boolean reversed;

	float32 center;
	float32 opposite;
	float32 len;


	float32 dzstart;
	float32 dzend;
	float32 dzlen;

}SDP_PedalBox_sensorConfig_t;

typedef struct
{
	SDP_PedalBox_sensorConfig_t	config;
	float32						pedalPercent;
	boolean						isValueOk;
}SDP_PedalBox_sensor_t;

typedef struct
{
	SDP_PedalBox_sensor_t		apps0;
	SDP_PedalBox_sensor_t		apps1;
	SDP_PedalBox_sensor_t		apps2;
	SDP_PedalBox_sensor_t		bpps0;
	SDP_PedalBox_sensor_t		bpps1;
}SDP_PedalBox_pps_t;

typedef struct
{
	float32 pps;
	boolean isValueOk;
}SDP_PedalBox_struct_t;

typedef struct
{
	SDP_PedalBox_struct_t			apps;
	SDP_PedalBox_struct_t			bpps;
}SDP_PedalBox_t;


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
IFX_EXTERN SDP_PedalBox_t 		SDP_PedalBox;
IFX_EXTERN SDP_PedalBox_pps_t	SDP_PedalBox_pps;
// IFX_EXTERN AdcSensor APPS0;
// IFX_EXTERN AdcSensor APPS1;

// IFX_EXTERN	AdcSensor BPPS0;
// IFX_EXTERN	AdcSensor BPPS1;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/

IFX_EXTERN void SDP_PedalBox_run_1ms(void);
IFX_EXTERN void SDP_PedalBox_init(void);

/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/

/*
IFX_INLINE float32 SDP_PedalBox_getAppsPercent(void)
{
	return SDP_PedalBox.apps.pps;
}


IFX_INLINE boolean SDP_PedalBox_isAppsValid(void)
{
	return SDP_PedalBox.apps.isValueOk;
}


IFX_INLINE float32 SDP_PedalBox_getBppsPercent(void)
{
	return SDP_PedalBox.bpps.pps;
}


IFX_INLINE boolean SDP_PedalBox_isBppsValid(void)
{
	return SDP_PedalBox.bpps.isValueOk;
}
*/


#endif
