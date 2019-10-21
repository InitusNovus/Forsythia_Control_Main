/*
 * Stm.h
 *
 *  Created on: 2018. 5. 16.
 *      Author: bigbi_000
 */

#ifndef STM_H_
#define STM_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include <Ifx_Types.h>
#include <stdio.h>
#include "Bsp.h"
#include "ConfigurationIsr.h"
#include "Cpu/Irq/IfxCpu_Irq.h"
#include "IfxPort.h"
#include <Stm/Std/IfxStm.h>
#include <Src/Std/IfxSrc.h>
#include "Cpu0_Main.h"
#include "Cpu/Irq/IfxCpu_Irq.h"
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
typedef union
{
	uint8 U;
	struct
	{
		volatile boolean Led_Onboard;
	} B;
}Stm_LedState;

typedef struct
{
	Ifx_STM					*stmSfr;		/*Pointer to STM system function registers*/
	IfxStm_CompareConfig	 stmConfig;		/*STM configuration structure*/
	Stm_LedState			 LedState;		/*LED state variable*/
	volatile sint32			 counter;		/*Interrupt counter*/
}Stm_data;

typedef struct
{
	volatile boolean flag_1ms:1;
	volatile boolean flag_10ms:1;
	volatile boolean flag_10ms_slot1:1;
	volatile boolean flag_100ms:1;
	volatile boolean flag_100ms_slot4:1;
	volatile boolean flag_100ms_slot5:1;
	volatile boolean flag_100ms_slot14:1;
	volatile boolean flag_100ms_slot24:1;
	volatile boolean flag_100ms_slot34:1;
	volatile boolean flag_100ms_slot44:1;
	volatile boolean flag_1000ms:1;
	volatile boolean flag_1000ms_slot3:1;
}Stm_task;
/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_EXTERN void Stm_init (void);
IFX_EXTERN void Stm_scheduler (void);


#endif /* STM_H */
