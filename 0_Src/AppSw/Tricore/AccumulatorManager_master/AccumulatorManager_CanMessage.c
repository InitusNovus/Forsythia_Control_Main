/* 
 * AccumulatorManager_CanMessage.c
 * Created on: 2019. 10. 29.
 * Author: Dua
 */

/* Includes */
#include "AccumulatorManager_CanMessage.h"


/* Global Variables */
AmsCanMsg_CanDataConstant AmsCanMsg_voltageConst = 
{
	.mul = 1,
	.div = 2048,
	.offset = 75,
};

AmsCanMsg_CanDataConstant AmsCanMsg_currentConst =
{
	.mul = 3,
	.div = 128,
	.offset = 0,
};

AmsCanMsg_CanDataConstant AmsCanMsg_temperatureConst = 
{
	.mul = 1,
	.div = 2,
	.offset = 64,
};