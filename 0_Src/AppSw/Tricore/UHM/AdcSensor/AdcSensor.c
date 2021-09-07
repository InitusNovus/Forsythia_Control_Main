/*
 * AdcSensor.c
 * Created on 2019. 10. 21
 * Author: Dua
 * 
 */

/* Includes */
#include "AdcSensor.h"
#include "Vadc.h"


/* Private Function Prototypes */
IFX_STATIC float32 AdcSensor_getValueFromAdc(AdcSensor* sensor);


/* Function Inplementation */

void AdcSensor_initSensor(AdcSensor* sensor, AdcSensor_Config* config)
{
    HLD_Vadc_initChannel(&sensor->adcChannel, &config->adcConfig);
    sensor->tf.a = config->tfConfig.a;
    sensor->tf.b = config->tfConfig.b;

    sensor->linCal.a = 1;
    sensor->linCal.b = 0;
    sensor->linCal.d = 0;
    if(config->linCalConfig.isAct)
    {
        sensor->linCal.a = config->linCalConfig.a;
        sensor->linCal.b = config->linCalConfig.b;
        sensor->linCal.d = config->linCalConfig.d;
        sensor->linCal.isAct = config->linCalConfig.isAct;
    }

    sensor->overvoltageLimit.limHi = ADCSENSOR_OVP_HI;
	sensor->overvoltageLimit.limLo = ADCSENSOR_OVP_LO;
	if(config->isOvervoltageProtected)
	{
        sensor->overvoltageLimit.limHi = config->overvoltageLimitConfig.limHi;
        sensor->overvoltageLimit.limLo = config->overvoltageLimitConfig.limLo;
		sensor->isOvervoltageProtected = config->isOvervoltageProtected;
	}
	sensor->status = AdcSensor_Status_ok;
}


IFX_STATIC float32 AdcSensor_getValueFromAdc(AdcSensor* sensor)
{
    float32 a = sensor->tf.a;
    float32 b = sensor->tf.b;
    sensor->unCalValue = a * sensor->data.voltage + b;
    /* Post calibration */
    if(sensor->linCal.isAct)
    {
        float32 a = sensor->linCal.a;
        float32 b = sensor->linCal.b;
        float32 d = sensor->linCal.d;
        return sensor->value = a * (sensor->unCalValue - d) + b;
    }
    else
    {
        return sensor->value = sensor->unCalValue;
    }    
}

float32 AdcSensor_getData(AdcSensor* sensor)
{
    float32 value;
    float32 voltage;
    HLD_Vadc_getData(&sensor->data, &sensor->adcChannel);
    value = AdcSensor_getValueFromAdc(sensor);
    voltage = sensor->data.voltage;

    if(sensor->isOvervoltageProtected)
    {
        if(voltage > sensor->overvoltageLimit.limHi)
            sensor->status |= AdcSensor_Status_errorTooHigh;
        else if(voltage < sensor->overvoltageLimit.limLo)
            sensor->status |= AdcSensor_Status_errorTooLow;
        else
            sensor->status = AdcSensor_Status_ok;
    }

    return value;
}

boolean AdcSensor_isTooHigh(AdcSensor* sensor)
{
    if(sensor->status&AdcSensor_Status_errorTooHigh)
        return TRUE;
    else
        return FALSE;
}

boolean AdcSensor_isTooLow(AdcSensor* sensor)
{
    if(sensor->status&AdcSensor_Status_errorTooLow)
        return TRUE;
    else
        return FALSE;
}

boolean AdnSensor_isError(AdcSensor* sensor)
{
    if(sensor->status != AdcSensor_Status_ok)
        return TRUE;
    else 
        return FALSE;
}