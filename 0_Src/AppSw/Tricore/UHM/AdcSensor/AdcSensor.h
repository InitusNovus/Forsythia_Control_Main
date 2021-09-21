/* 
 * AdcSensor.h
 * 
 * Created on 2019. 10. 21
 * Author: Dua
 * 
 */

#ifndef ADCSENSOR_H_
#define ADCSENSOR_H_

/* Includes */
// #include "AccumulatorManager.h"
#include "HLD.h"


/* Macros */
#define ADCSENSOR_OVP_HI            4.5f
#define ADCSENSOR_OVP_LO            0.5f



/* Enumerations */
typedef enum
{
    AdcSensor_Status_ok             = 0b00000000,
    AdcSensor_Status_errorUnknown   = 0b00000001,
    AdcSensor_Status_errorTooLow    = 0b00000010,
    AdcSensor_Status_errorTooHigh   = 0b00000100,
}AdcSensor_Status;


/* Data Structures */
typedef struct
{
	HLD_Vadc_Channel adcChannel;
	HLD_Vadc_Data data;
    struct
    {
        float32 a;
        float32 b;
        //y = a*X + b
    }tf;
	float32 value;
    float32 unCalValue;
    boolean isOvervoltageProtected;
    AdcSensor_Status status;
    struct
    {
        boolean isAct;
        float32 a;
        float32 b;
        float32 d;
        //y = a*(x-d) + b
        //post-calibration after tf value
    }linCal;
    struct
    P{
        float32 limHi;
        float32 limLo;
    }overvoltageLimit;
}AdcSensor;

typedef struct
{
    HLD_Vadc_Channel_Config adcConfig;
    struct
    {
        float32 a;
        float32 b;
    }tfConfig;
    boolean isOvervoltageProtected;
    struct
    {
        boolean isAct;
        float32 a;
        float32 b;
        float32 d;
    }linCalConfig;
    struct
    {
        float32 limHi;
        float32 limLo;
    }overvoltageLimitConfig;
}AdcSensor_Config;

/* Function Prototypes */

IFX_EXTERN void AdcSensor_initSensor(AdcSensor* sensor, AdcSensor_Config* config);
IFX_EXTERN float32 AdcSensor_getData(AdcSensor* sensor);
IFX_EXTERN boolean AdcSensor_isTooHigh(AdcSensor* sensor);
IFX_EXTERN boolean AdcSensor_isTooLow(AdcSensor* sensor);
IFX_EXTERN boolean AdnSensor_isError(AdcSensor* sensor);




#endif //ADCSENSOR_H_