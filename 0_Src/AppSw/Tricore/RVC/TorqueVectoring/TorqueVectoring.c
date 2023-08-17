/*
 * TorqueVectoring.c
 * Created on 2019. 12. 10.
 * Author: Dua
 */


/* Includes */
#include "TorqueVectoring.h"

/* Macros */
#define TVOPEN_LSD_ON		FALSE
#define TVOPEN_LSD_GAIN		1.0f

/* Global Variables */
IFX_EXTERN RVC_t RVC;

/* Function Implementation */
void RVC_TorqueVectoring_run_modeOpen(void)
{
	// if(TVOPEN_LSD_ON == TRUE)
	// {
	// 	// RVC.slip.axle

	// }
	// else
	// {
	// 	float32 fd = 2*RVC.torque.frontDist;
	// 	RVC.torque.frontLeft = fd * RVC.torque.controlled;
	// 	RVC.torque.frontRight = fd * RVC.torque.controlled;
	// 	RVC.torque.rearLeft = RVC.torque.controlled;
	// 	RVC.torque.rearRight = RVC.torque.controlled;
	// }
	
	float32 fd = 2 * RVC.torque.frontDist;
	RVC.torque.frontLeft = fd * RVC.torque.controlled;
	RVC.torque.frontRight = fd * RVC.torque.controlled;
	RVC.torque.rearLeft = RVC.torque.controlled;
	RVC.torque.rearRight = RVC.torque.controlled;
}

void RVC_TorqueVectoring_run_mode1(void)
{
	// TODO: TV algorithm
	/*Default*/
	RVC_TorqueVectoring_run_modeOpen();
}