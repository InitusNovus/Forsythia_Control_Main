/*
 * IMU.h
 *
 *  Created on: 2019. 7. 7.
 *      Author: USER
 */

#ifndef SRC_APPSW_TRICORE_HLD_IMU_IMU_H_
#define SRC_APPSW_TRICORE_HLD_IMU_IMU_H_

/*
 ****** Version History: IMU ******
 * V_1.0.0:	Author_Yimju Kang
 * 			The first numbered version
 * 			Make IMU Structure for reading data
 *
 */
/*------------------------------------Includes----------------------------------*/
#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include "HLD.h"

#include "CanCommunication.h"

/*-------------------------------------Macros-----------------------------------*/

#define GYRO_SENSE			(131)
#define ACCEL_SENSE			(16384)



/*----------------------------------Enumerations--------------------------------*/

/*---------------------------------Data Structures------------------------------*/
typedef struct
{
	float32 Gyro_x;
	float32 Gyro_y;
	float32 Gyro_z;

	float32 Accel_x;
	float32 Accel_y;
	float32 Accel_z;

	boolean isOk;

}HLD_Imu_data_t;


typedef struct
{
	HLD_Imu_data_t data;

	struct
	{
		IfxCpu_mutexLock mutex;
		HLD_Imu_data_t data;
	}shared;

	struct
	{
		sint16 Gyro_x;
		sint16 Gyro_y;
		sint16 Gyro_z;

		sint16 Accel_x;
		sint16 Accel_y;
		sint16 Accel_z;

		uint16 WhoAmI;
	}MPU;

}HLD_Imu_t;

typedef struct
{
	uint32 TransmitData[2];
		struct
		{
			sint16 Gyro_x;
			sint16 Gyro_y;
			sint16 Gyro_z;

			uint16 WhoAmI;	

		}MPU;

}HLD_Imu_Gyro_log_t;

typedef struct
{
	uint32 TransmitData[2];
		struct
		{
			sint16 Accel_x;
			sint16 Accel_y;
			sint16 Accel_z;

			uint16 WhoAmI;	

		}MPU;

}HLD_Imu_Accel_log_t;


/*--------------------------------Global variables------------------------------*/
IFX_EXTERN HLD_Imu_t	HLD_Imu;

IFX_EXTERN HLD_Imu_Gyro_log_t	HLD_Imu_Gyro_log;
IFX_EXTERN HLD_Imu_Accel_log_t	HLD_Imu_Accel_log;

/*-------------------------------Function Prototypes----------------------------*/

IFX_EXTERN void HLD_Imu_init(void);
IFX_EXTERN void HLD_Imu_run_10ms_s0(void);
IFX_EXTERN void HLD_Imu_run_10ms_s1(void);
IFX_EXTERN void HLD_Imu_run_1ms_c1(void);

/*---------------------------Private Variables/Constants------------------------*/

/*------------------------------Function Implementations------------------------*/
IFX_INLINE float32 HLD_Imu_getAccelX (void)
{
	return HLD_Imu.data.Accel_x;
}
IFX_INLINE float32 HLD_Imu_getAccelY (void)
{
	return HLD_Imu.data.Accel_y;
}
IFX_INLINE float32 HLD_Imu_getAccelZ (void)
{
	return HLD_Imu.data.Accel_z;
}

IFX_INLINE float32 HLD_Imu_getGyroX (void)
{
	return HLD_Imu.data.Gyro_x;
}
IFX_INLINE float32 HLD_Imu_getGyroY (void)
{
	return HLD_Imu.data.Gyro_y;
}
IFX_INLINE float32 HLD_Imu_getGyroZ (void)
{
	return HLD_Imu.data.Gyro_z;
}

/*
 * inter processor shared data interface functions.
 */
IFX_INLINE boolean HLD_Imu_shared_acquireMutex(void)
{
	return IfxCpu_acquireMutex(&HLD_Imu.shared.mutex);
}
IFX_INLINE void HLD_Imu_shared_releaseMutex(void)
{
	return IfxCpu_releaseMutex(&HLD_Imu.shared.mutex);
}
IFX_INLINE HLD_Imu_data_t HLD_Imu_shared_getData(void)
{
	return HLD_Imu.shared.data;
}




#endif /* 0_SRC_APPSW_TRICORE_HLD_IMU_IMU_H_ */
