/*
 * HLD.h
 *
 *  Created on: 2018. 5. 17.
 *      Author: Dua
 * Description: Header file for HLD interfaces.
 */

#ifndef HLD_H_
#define HLD_H_

#define HLD_RH26_SB275
#define HLD_VERSION_MAJOR	0
#define HLD_VERSION_MINOR	3
#define HLD_VERSION_PATCH	0

#include "Configuration.h"
/*
 ****** Version History: HLD ******
 * Designed for SMCC2018
 * V_0.1.0:	The first numbered version
 * V_0.2.0:	LcdInteface - Array chart is added (Alpha)
 * V_0.2.1:	Memory optimization
 * V_0.3.0:	LcdInterface - Array chart: chart with lines (Beta)
 * V_0.3.1:	Scheduler - Additional slots
 * V_0.3.2:	LcdInterface - Array chart: chart scale uint16 -> uint32
 * V_0.3.3:	LcdInterface - Temporary 1page mode (Temp);
 * 			MotorControl: Velocity PID control
 * V_0.3.4:	MotorControl - Velocity curve control (Beta)
 * V_0.3.5: MotorControl - Various COF LPF for high speed stability
 * V_0.4.0: EncoderFilter - KalmanFilter
 * V_0.4.1: MotorControl - Complementary filter
 * V_0.4.2: EncoderFilter - KalmanFilter enhancement
 * V_0.5.0: EncoderFilter - KalmanFilter rebuild
 * 			Accelerometer - HillState
 * V_0.5.1: Accelerometer - HillState counter
 * V_1.0.0: FP2, FP3, RACE
 *
 ****** Version History: HLD_RACE ******
 * Designed for KSAE2018
 * V_0.1.0: Cutting out unnecessary modules
 *
 ****** Version History: HLD_RACE_RH26 ******
 * Designed for KSAE2019
 * V_0.1.0: Multican - change structure
 * V_0.2.0: add GTMTIM, GPT12CNT, GTMTOM
 *
 ****** Version History: HLD_SB275 ******
 * Designed for SMCC2019
 * Compatible with ShieldBuddy TC275
 * V_0.1.0:	Migration ShieldBuddy TC275
 * 			Cutting out unavailable modules.
 * 			MultiCAN module is temporarily disabled. (Error MULTICAN1)
 * 			GtmTomPwm module is temporarily disabled. (Pin map)
 * 			CCU60 output is mapped temporarily.
 * V_0.1.1: Qspi module structure is changed.
 * 			IMU-specific functions are moved to Qspi_Mpu9250.h
 *
 * V_0.2.0:	Linescan(Divided)
 * V_0.2.1:	InfraRed VADC
 * V_0.2.2: InfraRed Servo
 * V_0.2.3:	QSPI Pin map
 * 			I2C Pin map
 * 			MotorControl Speed to velocity
 * V_0.2.4: FIX - multi port pin pull-up problem
 * V_0.2.5: FIX - InfraRed ADC force start
 * V_0.2.6: FIX
 * 				- MotorControl PWM output
 * 			Update
 * 				- Steering max servo angle adjustment
 * 				- IR and Steering servo center adjustment
 * V_0.2.7: FIX
 * 				- IR: mistyping correction
 * 			Update
 * 				- UserInterface: button function, Start button
 * 				- TIM Encoder, MotorControl
 *
 * V_0.2.8: Update
 * 				- MotorControl: some function is added
 *
 * V_0.2.9: FIX
 * 				- MotorControl: SPD2VEL fix
 *
 * V_1.0.0: Update
 * 				- UserInterface Lcd
 *
 * V_1.1.0: Update
 * 				- UserInterface Led
 * V_1.1.1: Fix
 * 				- UserInterface Lcd: NULL Pointer error fix
 * 				- UserInterface Led
 * 				- MotorControl adjust steering servo center
 *
 * V_1.2.0: Fix
 * 				- UserInterface Lcd: function for less button
 * 			Update
 * 				- IMU abstraction
 *
 *
 ****** Version History: HLD_RH26_SB275 ******
 * Designed for PAMS2019
 * Compatible with ShieldBuddy TC275
 * V_0.1.0: Base project for RH26 electronic control
 * 			HLD_LIGHT is branched out from here.
 * V_0.2.0: Renew GtmTomPwm (from HLD_Light 0.2.0)
 * V_0.3.0: Vadc (from HLD_Light 0.3.0)
 *
 * Todo
 * 		System Mode to Control system
 *
 * 		Multicore,
 * 			Multican receive/transmit function and routine
 *
 * 		Multican channel allocation
 *
 *
 *		Port macro check,
 * 		Gtm Channel check
 *
 * Todo
 * 		To made HLD a library. - Object-Oriented.
 * 			Initialization function: parameter-configuration
 *
 */
/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/

/*****************************
 *    include BasicModules   *
 *****************************/

#include "GtmTom.h"
#include "GtmTim.h"

#include "Qspi.h"
#include "Qspi_Mpu9250.h"

#include "Vadc.h"
#include "Multican.h"

#include "Led.h"
#include "IMU.h"

#if HLD_BOARD == HLD_BOARD_SB275
#include "UserInterface.h"
#elif HLD_BOARD == HLD_BOARD_AK237
#include "LcdInterface.h"
#endif

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

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/





#endif /* HLD_H */
