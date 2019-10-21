/*
 * GtmTomServo.h
 *
 *  Created on: 2018. 6. 2.
 *      Author: bigbi_000
 */

#ifndef GTMTOMSERVO_H_
#define GTMTOMSERVO_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include "GtmTom.h"

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
typedef struct
{
	float32 			frequency;
	Ifx_TimerValue 		triggerPoint;
	IfxGtm_Tom_Timer 	driver;
}GtmTomServo_t;

typedef struct
{
	GtmTomServo_t servo;	//Servo Tom Data
	float32 angle;			//Servo angle in Degree
	float32 center;			//Servo center trim in Degree
	float32 leftLimit;		//Servo left limit in Degree
	float32 rightLimit;		//Servo right limit in Degree
	boolean inversion;		//Servo direction inversion
}HLD_servo_t;

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
IFX_EXTERN HLD_servo_t HLD_servoSteering;
IFX_EXTERN HLD_servo_t HLD_servoInfraRed;
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
/*
 * Servo initialzation function
 */
IFX_EXTERN void HLD_GtmTomServo_init(void);

/*
 * Servo running function
 */
IFX_EXTERN void HLD_GtmTomServo_run(void);

/******************************************************************************/

/*
 * Servo angle setting function
 * Argument1: servo object instance
 * Argument2: Expected servo angle in degree
 */
IFX_EXTERN void HLD_GtmTomServo_setAngle(HLD_servo_t* servo, float32 degAngle);

/*
 * Servo angle get function
 * Argument: servo object instance
 * Return: servo angle in degree
 */
IFX_EXTERN float32 HLD_GtmTomServo_getAngle(HLD_servo_t* servo);
/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/

#endif /* GTMTOMSERVO_H_ */
