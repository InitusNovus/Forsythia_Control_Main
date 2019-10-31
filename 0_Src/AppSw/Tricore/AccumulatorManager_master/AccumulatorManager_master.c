/* 
 * AccmulatorManager_master.c
 * Created on 2019. 10. 30.
 * Author: Dua
 */

/* Includes */
#include "HLD.h"
#include "AccumulatorManager_master.h"
#include "CanCommunication.h"
#include "AccumulatorManager_CanMessage.h"


/* Macros */
#define AMS_CAN_MSG_0	0x10010001UL
#define AMS_CAN_MSG_1	0x10010010UL

#define AMS_RX_ERR_CNT	20

#define TEMP_SEN_NUM	8

/* Data sturctures */
typedef struct 
{
	float32 voltage;
	float32 current;
	float32 temperature[8];
}Accumulator_Data_t;

typedef struct 
{
	
	Accumulator_Status_t status;
	Accumulator_Data_t data;
	
	struct 
	{
		IfxCpu_mutexLock mutex;
		Accumulator_Status_t status;
		Accumulator_Data_t data;
	}shared;

	boolean CanError[2];

}AccumulatorManager_master_t;


/* Global Variables */
AccumulatorManager_master_t AccumulatorManager_master;

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

uint32 AmsCanMsg0_errorCount = 0;
uint32 AmsCanMsg1_errorCount = 0;



/* Funciont Implementations */
void AccumulatorManager_master_init(void)
{
	/* CAN message init */
	{
        CanCommunication_Message_Config config;
        config.messageId		=	AMS_CAN_MSG_0;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&AmsCanMsg0, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	AMS_CAN_MSG_1;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&AmsCanMsg1, &config);
	}
}

void AccumulatorManager_master_run_1ms_c2(void)
{
	/* Receive can messages polling */
	if(CanCommunication_receiveMessage(&AmsCanMsg0))
	{
		AmsCanMsg0_errorCount = 0;
		AccumulatorManager_master.CanError[0] = FALSE;
	}
	else
	{
		if(++AmsCanMsg0_errorCount > AMS_RX_ERR_CNT)
		{
			AccumulatorManager_master.CanError[0] = TRUE;
		}
	}

	if(CanCommunication_receiveMessage(&AmsCanMsg1))
	{
		AmsCanMsg0_errorCount = 0;
		AccumulatorManager_master.CanError[1] = FALSE;
	}
	else
	{
		if(++AmsCanMsg0_errorCount > AMS_RX_ERR_CNT)
		{
			AccumulatorManager_master.CanError[1] = TRUE;
		}
	}

	/* Parse the received data */
	AmsCanMsg0_data.U[0] = AmsCanMsg0.msg.data[0];
	AmsCanMsg0_data.U[1] = AmsCanMsg0.msg.data[1];
	
	AmsCanMsg1_data.U[0] = AmsCanMsg1.msg.data[0];
	AmsCanMsg1_data.U[1] = AmsCanMsg1.msg.data[1];

	/* Decode received can messages */
	AccumulatorManager_master.data.voltage = AmsCanMsg_decodeData(AmsCanMsg0_data.S.voltage, &AmsCanMsg_voltageConst);
	AccumulatorManager_master.data.current = AmsCanMsg_decodeData(AmsCanMsg0_data.S.current, &AmsCanMsg_currentConst);
	for(uint32 index = 0; index < TEMP_SEN_NUM; index++)
	{
		AccumulatorManager_master.data.temperature[index] 
			= AmsCanMsg_decodeData((sint8)AmsCanMsg1_data.S.temperature[index], &AmsCanMsg_temperatureConst);
	}
	AccumulatorManager_master.status.bms[0] = AmsCanMsg0_data.S.status.B.bms0;
	AccumulatorManager_master.status.bms[1] = AmsCanMsg0_data.S.status.B.bms1;
	AccumulatorManager_master.status.tsal = AmsCanMsg0_data.S.status.B.tsal;
	AccumulatorManager_master.status.temp = AmsCanMsg0_data.S.status.B.tempStatus;
	AccumulatorManager_master.status.ams = AmsCanMsg0_data.S.status.B.amsCut;
	
	/* Shared variable update */
	while(IfxCpu_acquireMutex(&AccumulatorManager_master.shared.mutex));
	{
		AccumulatorManager_master.shared.data = AccumulatorManager_master.data;
		AccumulatorManager_master.shared.status = AccumulatorManager_master.status;
		IfxCpu_releaseMutex(&AccumulatorManager_master.shared.mutex);
	}
	
}