/*
 * TorqueVectoring.c
 * Created on 2019. 12. 10.
 * Author: Dua
 */


/* Includes */
#include "TorqueVectoring.h"

/* Global Variables */
IFX_EXTERN RVC_t RVC;

/* Function Implementation */
void RVC_TorqueVectoring_run_modeOpen(void)
{
	RVC.torque.rearLeft = RVC.torque.controlled;
	RVC.torque.rearRight = RVC.torque.controlled;
}

void RVC_TorqueVectoring_run_mode1(void)
{
	/*Default*/
	// TODO: TV algorithm
	RVC_TorqueVectoring_run_modeOpen();
}