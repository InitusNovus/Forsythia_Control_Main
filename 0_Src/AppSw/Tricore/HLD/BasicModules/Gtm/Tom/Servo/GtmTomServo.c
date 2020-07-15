/*
 * GtmTomServo.c
 *
 *  Created on: 2018. 6. 2.
 *      Author: bigbi_000
 */

//FIXME: Refactoring: general servo object
/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "GtmTomServo.h"

#include "HLD.h"
#include <stdio.h>
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define SERVO_FREQ (100)		//Servo PWM Frequency in Hz

#define HLD_SERVO_INFRARED_CENTER		17
#define HLD_SERVO_STEERING_CENTER		3.5
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef struct
{
	float32 center;
	float32 leftLimit;		//Servo left limit in Degree
	float32 rightLimit;		//Servo right limit in Degree
	boolean inversion;		//Servo direction inversion
	IfxGtm_Tom_ToutMap* tomOut;			//Servo TOM

}HLD_servo_Config;
/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
/*
GtmTomServo_t g_GtmTomServo =
{
		.frequency = SERVO_FREQ,
		.triggerPoint = 1.5*SERVO_FREQ*1000/16		//1.5 ms on time
};
 */

HLD_servo_t HLD_servoSteering; /*=
{
		.servo.frequency = SERVO_FREQ,
		.servo.triggerPoint = 1.5*SERVO_FREQ*1000/16,

		.angle = 0,
		.center = 0,
		.leftLimit = 20,
		.rightLimit =20,
		.inversion = FALSE
};*/
HLD_servo_t HLD_servoInfraRed; /*=
{
		.servo.frequency = SERVO_FREQ,
		.servo.triggerPoint = 1.5*SERVO_FREQ*1000/16,

		.angle = 0,
		.center = 0,
		.leftLimit = 20,
		.rightLimit =20,
		.inversion = FALSE
};*/

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_STATIC void HLD_GtmTomServo_servoInit(HLD_servo_t* servo, HLD_servo_Config* config);
IFX_STATIC void HLD_GtmTomServo_servoRun(HLD_servo_t* servo);
IFX_STATIC void HLD_GtmTomServo_servoInitConfig(HLD_servo_Config* config);
/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void HLD_GtmTomServo_init(void)
{
	/*
	IfxGtm_Tom_Timer_Config timerConfig;
	IfxGtm_Tom_Timer_initConfig (&timerConfig, &MODULE_GTM);
	timerConfig.tom = SERVO.tom;
	timerConfig.timerChannel = SERVO.channel;
	timerConfig.triggerOut = &SERVO;
	timerConfig.base.frequency = SERVO_FREQ;
//	timerConfig.base.minResolution = (1.0 / timerConfig.base.frequency) / 1000;
	timerConfig.base.minResolution = 0;
	timerConfig.clock = IfxGtm_Tom_Ch_ClkSrc_cmuFxclk1;

	timerConfig.base.trigger.enabled = TRUE;
	timerConfig.base.trigger.outputEnabled = TRUE;
	timerConfig.base.trigger.outputMode = IfxPort_OutputMode_pushPull;
	timerConfig.base.trigger.outputDriver = IfxPort_PadDriver_cmosAutomotiveSpeed1;
	timerConfig.base.trigger.triggerPoint =  HLD_GtmTomServo.servo.triggerPoint;
	timerConfig.base.trigger.risingEdgeAtPeriod = TRUE;

    IfxGtm_Tom_Timer_init(&HLD_GtmTomServo.servo.driver, &timerConfig);

    IfxGtm_Tom_Timer_run(&HLD_GtmTomServo.servo.driver);
	 */

	//FIXME Let move system-specific codes out of HLD
	HLD_servo_Config steeringConfig;
	HLD_GtmTomServo_servoInitConfig(&steeringConfig);
	steeringConfig.inversion = FALSE;
	steeringConfig.leftLimit = 42;
	steeringConfig.rightLimit = 42;
	steeringConfig.tomOut = &SERVO;
	steeringConfig.center = HLD_SERVO_STEERING_CENTER;
	HLD_GtmTomServo_servoInit(&HLD_servoSteering, &steeringConfig);

	HLD_servo_Config infraRedConfig;
	HLD_GtmTomServo_servoInitConfig(&infraRedConfig);
	infraRedConfig.inversion = FALSE;
	infraRedConfig.leftLimit = 90;
	infraRedConfig.rightLimit = 90;
	infraRedConfig.tomOut = &SERVO_IR;
	infraRedConfig.center = HLD_SERVO_INFRARED_CENTER;
	HLD_GtmTomServo_servoInit(&HLD_servoInfraRed, &infraRedConfig);
}

void HLD_GtmTomServo_run(void)
{
	/*
	IfxGtm_Tom_Timer *timer = &HLD_GtmTomServo.servo.driver;

	if(HLD_GtmTomServo.angle > HLD_GtmTomServo.leftLimit)
	{
		HLD_GtmTomServo.angle = HLD_GtmTomServo.leftLimit;
	}
	else if(HLD_GtmTomServo.angle < -(HLD_GtmTomServo.rightLimit))
	{
		HLD_GtmTomServo.angle = -(HLD_GtmTomServo.rightLimit);
	}
	HLD_GtmTomServo.servo.triggerPoint = (-((HLD_GtmTomServo.angle + HLD_GtmTomServo.center)*(0.5/45)) + 1.5)*SERVO_FREQ*1000/16;
	IfxGtm_Tom_Timer_disableUpdate(timer);
	IfxGtm_Tom_Timer_setTrigger(timer, HLD_GtmTomServo.servo.triggerPoint);
	IfxGtm_Tom_Timer_applyUpdate(timer);
	 */
	HLD_GtmTomServo_servoRun(&HLD_servoSteering);
	HLD_GtmTomServo_servoRun(&HLD_servoInfraRed);
}

IFX_STATIC void HLD_GtmTomServo_servoInit(HLD_servo_t* servo, HLD_servo_Config* config)
{
	servo->inversion = config->inversion;
	servo->leftLimit = config->leftLimit;
	servo->rightLimit = config->rightLimit;
	servo->angle = 0;
	servo->center = config->center;

	servo->servo.frequency = SERVO_FREQ;
	servo->servo.triggerPoint = 1.5*SERVO_FREQ*1000/16;

	IfxGtm_Tom_Timer_Config timerConfig;
	IfxGtm_Tom_Timer_initConfig (&timerConfig, &MODULE_GTM);
	timerConfig.tom = config->tomOut->tom;
	timerConfig.timerChannel = config->tomOut->channel;
	timerConfig.triggerOut = config->tomOut;
	timerConfig.base.frequency = SERVO_FREQ;
	//	timerConfig.base.minResolution = (1.0 / timerConfig.base.frequency) / 1000;
	timerConfig.base.minResolution = 0;
	timerConfig.clock = IfxGtm_Tom_Ch_ClkSrc_cmuFxclk1;

	timerConfig.base.trigger.enabled = TRUE;
	timerConfig.base.trigger.outputEnabled = TRUE;
	timerConfig.base.trigger.outputMode = IfxPort_OutputMode_pushPull;
	timerConfig.base.trigger.outputDriver = IfxPort_PadDriver_cmosAutomotiveSpeed1;
	timerConfig.base.trigger.triggerPoint =  servo->servo.triggerPoint;
	timerConfig.base.trigger.risingEdgeAtPeriod = TRUE;

	IfxGtm_Tom_Timer_init(&servo->servo.driver, &timerConfig);

	IfxGtm_Tom_Timer_run(&servo->servo.driver);
}

IFX_STATIC void HLD_GtmTomServo_servoInitConfig(HLD_servo_Config* config)
{
	config->leftLimit = 90;
	config->rightLimit = 90;
	config->inversion = FALSE;
}



IFX_STATIC void HLD_GtmTomServo_servoRun(HLD_servo_t* servo)
{
	IfxGtm_Tom_Timer *timer = &servo->servo.driver;

	if(servo->angle > servo->leftLimit)
	{
		servo->angle = servo->leftLimit;
	}
	else if(servo->angle < -(servo->rightLimit))
	{
		servo->angle = -(servo->rightLimit);
	}
	servo->servo.triggerPoint = (-((servo->angle + servo->center)*(0.5/45)) + 1.5)*SERVO_FREQ*1000/16;
	IfxGtm_Tom_Timer_disableUpdate(timer);
	IfxGtm_Tom_Timer_setTrigger(timer, servo->servo.triggerPoint);
	IfxGtm_Tom_Timer_applyUpdate(timer);
}

void HLD_GtmTomServo_setAngle(HLD_servo_t* servo, float32 degAngle)
{
	servo->angle = degAngle;
}

float32 HLD_GtmTomServo_getAngle(HLD_servo_t* servo)
{
	return servo->angle;
}
