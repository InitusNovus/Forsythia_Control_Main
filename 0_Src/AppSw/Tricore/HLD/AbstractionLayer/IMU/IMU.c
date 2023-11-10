/*
 * IMU.c
 *
 *  Created on: 2019. 7. 7.
 *      Author: USER
 */




/*------------------------------------Includes----------------------------------*/

#include "../../AbstractionLayer/IMU/IMU.h"

/*-------------------------------------Macros-----------------------------------*/
#define IMU_UNIT_RADPERSEC		0
#define IMU_UNIT_DEGPERSEC		1

#define IMU_UNIT 				IMU_UNIT_RADPERSEC

#define IMU_GYRO_CAN_MSG		0x275E01
#define IMU_ACCEL_CAN_MSG		0x275E02

#if IMU_UNIT == IMU_UNIT_RADPERSEC
#define IMU_UNIT_CONST			(IFX_PI/180)
#elif IMU_UNIT == IMU_UNIT_DEGPERSEC
#define IMU_UNIT_CONST			(1)
#endif
/*----------------------------------Enumerations--------------------------------*/

/*---------------------------------Data Structures------------------------------*/

HLD_Imu_t HLD_Imu;

HLD_Imu_Gyro_log_t	HLD_Imu_Gyro_log;
HLD_Imu_Accel_log_t	HLD_Imu_Accel_log;

CanCommunication_Message T_HLD_Imu_Gyro_log;
CanCommunication_Message T_HLD_Imu_Accel_log;



/*--------------------------------Global variables------------------------------*/



/*-------------------------------Function Prototypes----------------------------*/
IFX_STATIC void HLD_Imu_spiRoutine(void);
IFX_STATIC void HLD_Imu_procData(void);


/*---------------------------Private Variables/Constants------------------------*/

/*------------------------------Function Implementations------------------------*/

void HLD_Imu_init(void)
{
	HLD_Qspi_Mpu9250_writeReg(0x6A,0b01010000);
}

void HLD_Imu_run_10ms_s1(void)
{
	HLD_Imu_spiRoutine();
	HLD_Imu_procData();
}

void HLD_Imu_run_1ms_c1(void)
{
	HLD_Imu_spiRoutine();
	HLD_Imu_procData();
	while(IfxCpu_acquireMutex(&HLD_Imu.shared.mutex));		//Wait for mutex
	{
		HLD_Imu.shared.data = HLD_Imu.data;
		IfxCpu_releaseMutex(&HLD_Imu.shared.mutex);
	}
}

IFX_STATIC void HLD_Imu_spiRoutine(void)
{
	HLD_Imu.MPU.WhoAmI = HLD_Qspi_readReg(0x75);
	HLD_Imu.MPU.Accel_x = HLD_Qspi_getSint16(0x3C,0x3B);
	HLD_Imu.MPU.Accel_y = HLD_Qspi_getSint16(0x3E,0x3D);
	HLD_Imu.MPU.Accel_z = HLD_Qspi_getSint16(0x40,0x3F);
	HLD_Imu.MPU.Gyro_x = HLD_Qspi_getSint16(0x44,0x43);
	HLD_Imu.MPU.Gyro_y = HLD_Qspi_getSint16(0x46,0x45);
	HLD_Imu.MPU.Gyro_z = HLD_Qspi_getSint16(0x48,0x47);
}

IFX_STATIC void HLD_Imu_procData(void)
{
	HLD_Imu.data.Gyro_x = ((float32)HLD_Imu.MPU.Gyro_x/GYRO_SENSE)*IMU_UNIT_CONST;
	HLD_Imu.data.Gyro_y = ((float32)HLD_Imu.MPU.Gyro_y/GYRO_SENSE)*IMU_UNIT_CONST;

	HLD_Imu.data.Accel_z = -((float32)HLD_Imu.MPU.Accel_z/ACCEL_SENSE)*9.807;

	HLD_Imu.data.Accel_y = -((float32)HLD_Imu.MPU.Accel_y/ACCEL_SENSE)*9.807;
	HLD_Imu.data.Accel_x = -((float32)HLD_Imu.MPU.Accel_x/ACCEL_SENSE)*9.807;
	HLD_Imu.data.Gyro_z = ((float32)HLD_Imu.MPU.Gyro_z/GYRO_SENSE)*IMU_UNIT_CONST;

	if(HLD_Imu.MPU.WhoAmI == 113)
	{
		HLD_Imu.data.isOk = TRUE;
	}
}

void HLD_Imu_procData_msg_init(void){
	/* CAN message init */
	{
        CanCommunication_Message_Config config;
        config.messageId		=	IMU_GYRO_CAN_MSG;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&T_HLD_Imu_Gyro_log, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	IMU_ACCEL_CAN_MSG;
        config.frameType		=	IfxMultican_Frame_transmit;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&T_HLD_Imu_Accel_log, &config);
	}
}

void HLD_Imu_procData_msg_log(void){
	while(IfxCpu_acquireMutex(&HLD_Imu.shared.mutex));		//Wait for mutex
	{
		IfxCpu_releaseMutex(&HLD_Imu.shared.mutex);
	}
	HLD_Imu_Gyro_log.MPU.Gyro_x = HLD_Imu.MPU.Gyro_x;
	HLD_Imu_Gyro_log.MPU.Gyro_y = HLD_Imu.MPU.Gyro_y;
	HLD_Imu_Gyro_log.MPU.Gyro_z = HLD_Imu.MPU.Gyro_z;
	HLD_Imu_Gyro_log.MPU.WhoAmI = HLD_Imu.MPU.WhoAmI;

	HLD_Imu_Accel_log.MPU.Accel_x = HLD_Imu.MPU.Accel_x;
	HLD_Imu_Accel_log.MPU.Accel_y = HLD_Imu.MPU.Accel_y;
	HLD_Imu_Accel_log.MPU.Accel_z = HLD_Imu.MPU.Accel_z;
	HLD_Imu_Accel_log.MPU.WhoAmI = HLD_Imu.MPU.WhoAmI;

	CanCommunication_setMessageData(HLD_Imu_Gyro_log.TransmitData[0], HLD_Imu_Gyro_log.TransmitData[1], &T_HLD_Imu_Gyro_log);
	CanCommunication_setMessageData(HLD_Imu_Accel_log.TransmitData[0], HLD_Imu_Accel_log.TransmitData[1], &T_HLD_Imu_Accel_log);

	CanCommunication_transmitMessage(&T_HLD_Imu_Gyro_log);
	CanCommunication_transmitMessage(&T_HLD_Imu_Accel_log);
}