/* 
 * AccmulatorManager_master.c
 * Created on 2019. 10. 30.
 * Author: Dua
 */

/* Includes */
#include "HLD.h"
#include "AccumulatorManager_master.h"
#include "CanCommunication.h"


/* Macros */
#define AMS_CAN_MSG_0	0x10010001UL
#define AMS_CAN_MSG_1	0x10010010UL


/* Data sturctures */
typedef struct 
{
	Accumulator_Status_t status;
	
	struct 
	{
		IfxCpu_mutexLock mutex;
		Accumulator_Status_t status;
	}shared;

}AccumulatorManager_master_t;

/* Global Variables */
CanCommunication_Message    AmsCanMsg0;
AmsCanMsg0_data_t           AmsCanMsg0_data = 
{
    .S.voltage = 0,
    .S.current = 0,
    .S.status.U = 0,
    .S.err0.U = 0,
    .S.err1.U = 0
};
CanCommunication_Message    AmsCanMsg1;
AmsCanMsg1_data_t           AmsCanMsg1_data;





/* Funciont Implementations */
void AccumulatorManager_master_init(void)
{
	/* CAN message init */

}

void AccumulatorManager_master_run_1ms_c2(void)
{
	/* Receive can messages */
	
	/* Decode received can messages */

}