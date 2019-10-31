/**
 * \file Cpu1_Main.c
 * \brief CPU1 functions.
 *
 * \version iLLD_Demos_1_0_1_8_0
 * \copyright Copyright (c) 2014 Infineon Technologies AG. All rights reserved.
 *
 *
 *                                 IMPORTANT NOTICE
 *
 *
 * Infineon Technologies AG (Infineon) is supplying this file for use
 * exclusively with Infineon's microcontroller products. This file can be freely
 * distributed within development tools that are supporting such microcontroller
 * products.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * INFINEON SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL,
 * OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 */

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/

#include "Cpu0_Main.h"
#include "IfxScuWdt.h"

#include "SchedulerTask.h"
uint32* testP = &Task.core1.test;
/** \brief Main entry point for CPU1  */
void core1_main(void)
{
	/*
	 * !!WATCHDOG1 IS DISABLED HERE!!
	 * Enable the watchdog in the demo if it is required and also service the watchdog periodically
	 * */
	IfxScuWdt_disableCpuWatchdog(IfxScuWdt_getCpuWatchdogPassword());


	while(TRUE)	//waiting for the start-up sign.
	{
		boolean start;
		while(IfxCpu_acquireMutex(&Task_core1.mutex));
		{
			start = Task_core1.start;
			IfxCpu_releaseMutex(&Task_core1.mutex);
		}
		if(start)
		{
			break;
		}
	}

	/** - Background loop */
	while (TRUE)
	{
		boolean flag;
		while(IfxCpu_acquireMutex(&Task_core1.mutex));
		{
			flag = Task_core1.flag;
			IfxCpu_releaseMutex(&Task_core1.mutex);
		}
		if(flag)
		{
			Task_core1_1ms();

			while(IfxCpu_acquireMutex(&Task_core1.mutex));
			{
				Task_core1.flag = FALSE;
				IfxCpu_releaseMutex(&Task_core1.mutex);
			}
		}
	}
}
