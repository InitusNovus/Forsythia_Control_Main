/* 
 * AccmulatorManager_master.h
 * Created on 2019. 10. 30.
 * Author: Dua
 */

#ifndef ACCUMULATORMANAGER_MASTER
#define ACCUMULATORMANAGER_MASTER


/* Includes */
#include "CanCommunication.h"
#include "AccumulatorManager_CanMessage.h"

/* Enumerations */
typedef enum
{
	Accumulator_Bms_Status_cutOff	= 0,
	Accumulator_Bms_Status_ok,
}Accumulator_Bms_Status;

typedef enum
{
	Accumulator_Tsal_off		= 0,
	Accumulator_Tsal_ready		= 1,	//Green right
	Accumulator_Tsal_run		= 2,	//Red right
}Accumulator_Tsal_Status;

typedef enum 
{
	Accumulator_Indicator_off	= 0,
	Accumulator_Indicator_on,
}Accumulator_Indicator_Status;

typedef enum 
{
	Accumulator_Temp_Status_ok			= 0,
	Accumulator_Temp_Status_tempHigh,
}Accumulator_Temp_Status;

typedef enum
{
	Accumulator_Ams_Status_ok		= 0,
	Accumulator_Ams_Status_cutOff,
}Accumulator_Ams_Status;


/* Data Structures */
typedef struct 
{
	Accumulator_Bms_Status 			bms[2];
	Accumulator_Tsal_Status			tsal;
	Accumulator_Indicator_Status	indicator;
	Accumulator_Temp_Status			temp;
	Accumulator_Ams_Status			ams;
	
}Accumulator_Status_t;


/* Function Prototypes */
IFX_EXTERN void AccumulatorManager_master_init(void);
IFX_EXTERN void AccumulatorManager_master_run_1ms_c2(void);



#endif