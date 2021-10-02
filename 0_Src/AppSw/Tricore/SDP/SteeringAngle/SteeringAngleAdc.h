/*
 * SteeringAngleAdc.h
 *
 *  Created on: 2021. 09. 29.
 *      Author: Suprhimp
 */

#ifndef SRC_APPSW_TRICORE_SDP_SteeringAngleAdc_H_
#define SRC_APPSW_TRICORE_SDP_SteeringAngleAdc_H_
#include "AdcSensor.h"

typedef struct
{
	// SDP_PedalBox_sensorConfig_t	config;
	float32						ratio;
	float32						Percent;
	float32						angle;
	boolean						isValueOk;
}SDP_SteeringAngleAdc_sensor_t;

IFX_EXTERN SDP_SteeringAngleAdc_sensor_t SDP_SteeringAngleAdc_sensor;
IFX_EXTERN void SDP_SteeringAngleAdc_init(void);
IFX_EXTERN void SDP_SteeringAngleAdc_run(void);

#endif
