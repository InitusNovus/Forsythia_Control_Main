/*
 * SchedulerTask.h
 *
 */

#ifndef SCHEDULERTASK_H
#define SCHEDULERTASK_H

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
/*
#include "HLD.h"
#include "LineScan.h"
#include "MasterControl.h"
*/
#include "HLD.h"

#include "SchedulerTask_Cpu1.h"
#include "SchedulerTask_Cpu2.h"
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
typedef enum
{
#if TASK_MODE == TASK_MODE_RH
	initialized,
	tsActivated,
	ppsChecked,
	readyToDrive

#else
	initialized,
	ready,
	run,
#endif
}Task_state;

typedef struct
{
	sint16 counter_1ms;
	sint16 counter_10ms;
	sint16 counter_100ms;
	sint16 counter_1000ms;

	Task_state systemState;

	struct
	{
//		boolean start;
//		boolean flag;
		uint32 test;
	}core1;

}Task_data;


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
IFX_EXTERN Task_data Task;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
void Task_init(void);

void Task_1ms (void);
void Task_10ms (void);
void Task_10ms_slot1 (void);

void Task_100ms (void);
void Task_100ms_slot4 (void);
void Task_100ms_slot5 (void);
void Task_100ms_slot14 (void);
void Task_100ms_slot24 (void);
void Task_100ms_slot34 (void);
void Task_100ms_slot44 (void);

void Task_1000ms (void);
void Task_1000ms_slot3 (void);

void Task_IsrCb_1ms (void);
void Task_idle (void);

#endif /* SCHEDULERTASK_H */
