/*
 * PedalBox.h
 *
 *  Created on: 2021. 09. 29.
 *      Author: Suprhimp
 */

#include "SteeringAngleAdc.h"

AdcSensor STA_R;
AdcSensor STA_L;


SDP_SteeringAngleAdc_sensor_t SDP_SteeringAngleAdc_sensor_R;
SDP_SteeringAngleAdc_sensor_t SDP_SteeringAngleAdc_sensor_L;

void SDP_SteeringAngleAdc_init(void);
IFX_STATIC void SDP_SteeringAngleAdc_updateSTA_AN(SDP_SteeringAngleAdc_sensor_t *data_out, AdcSensor *data_in);
void SDP_SteeringAngleAdc_run(void);


void SDP_SteeringAngleAdc_init(void){
        AdcSensor_Config config_adc;
		//STA0
		config_adc.adcConfig.lpf.config.cutOffFrequency = 10000/(2.0*IFX_PI*0.05);		//FIXME: Adjust time constant
		config_adc.adcConfig.lpf.config.gain = 1;
		config_adc.adcConfig.lpf.config.samplingTime = 0.001;
		config_adc.adcConfig.lpf.activated = TRUE;

		config_adc.adcConfig.channelIn = &HLD_Vadc_P10_7_G3CH0_AD5;
		config_adc.tfConfig.a = 19.65;
		config_adc.tfConfig.b = 2.64;

		config_adc.isOvervoltageProtected = TRUE;

		AdcSensor_initSensor(&STA_R, &config_adc);
		HLD_AdcForceStart(STA_R.adcChannel.channel.group);

		//STA1
		config_adc.adcConfig.channelIn = &HLD_Vadc_P33_10_G5CH4_DA0;
		config_adc.tfConfig.a = 19.65;
		config_adc.tfConfig.b = 2.64;
		AdcSensor_initSensor(&STA_L, &config_adc);
		HLD_AdcForceStart(STA_L.adcChannel.channel.group);
}


IFX_STATIC void SDP_SteeringAngleAdc_updateSTA_AN(SDP_SteeringAngleAdc_sensor_t *data_out, AdcSensor *data_in)
{
	AdcSensor_getData(data_in);
	// data_out->pedalPercent = data_out->config.reversed
			// ?(float32)100.0 - data_in->value : data_in->value;
	data_out->Percent = data_in->value * data_out->ratio;
}

void SDP_SteeringAngleAdc_run(){
    SDP_SteeringAngleAdc_updateSTA_AN(&SDP_SteeringAngleAdc_sensor_R,&STA_R);
	SDP_SteeringAngleAdc_updateSTA_AN(&SDP_SteeringAngleAdc_sensor_L,&STA_L);
}