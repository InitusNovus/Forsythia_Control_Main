/* 
 * RVC.c
 * Created on 2019. 11. 01
 * Author: Dua
 */

/* Includes */
#include "HLD.h"
#include "RVC.h"
#include "PedalMap.h"
#include "UserInterface_Button.h"
#include "Beeper_Test_Music.h"
#include "IfxPort.h"


/* Macro */
#define RVCTEST

#define PWMVREF	5.0
#define R2DOUT	IfxPort_P21_0



/* Enumerations */
typedef enum
{
	RVC_ReadyToDrive_status_notInitialized = 0,
	RVC_ReadyToDrive_status_initialized = 1,
	RVC_ReadyToDrive_status_run = 2,
}RVC_ReadyToDrive_status;

typedef enum 
{
	RVC_TorqueVectoring_modeOpen = 0,
	RVC_TorqueVectoring_mode1 = 1,
}RVC_TorqueVectoring_mode_t;

typedef struct 
{
	float32 mul;
	float32 offset;
}RVC_pwmCalibration;

/* Data Structures */
typedef struct 
{
	RVC_ReadyToDrive_status readyToDrive;
	RVC_TorqueVectoring_mode_t tvMode;

	struct 
	{
		float32 required;

		float32 rearLeft;
		float32 rearRight;
	}torque;

	struct 
	{
		float32 rearLeft;
		float32 rearRight;
	}pwmDuty;

	struct 
	{
		HLD_GtmTom_Pwm accel_rearLeft;
		HLD_GtmTom_Pwm accel_rearRight;
		HLD_GtmTom_Pwm decel_rearLeft;
		HLD_GtmTom_Pwm decel_rearRight;
	}out;

	HLD_button_t startButton;

	struct 
	{
		RVC_pwmCalibration left;
		RVC_pwmCalibration right;
	}calibration;

	struct
	{
		float32 pGain;
	}tvMode1;
	

}RVC_t;


/* Global Variables */
RVC_t RVC = 
{
	.readyToDrive = RVC_ReadyToDrive_status_notInitialized,
	.torque.required = 0,
	.torque.rearLeft = 0,
	.torque.rearRight = 0,

};



/* Private Function Prototypes */
IFX_STATIC void RVC_setR2d(void);
IFX_STATIC void RVC_resetR2d(void);
IFX_STATIC void RVC_toggleR2d(void);

IFX_STATIC void RVC_TorqueVectoring_run_modeOpen(void);
IFX_STATIC void RVC_TorqueVectoring_run_mode1(void);


/* Function Implementation */
void RVC_init(void)
{
	RVC.tvMode = RVC_TorqueVectoring_modeOpen;
	RVC_PedalMap_lut_setMode(0);

	HLD_GtmTom_Pwm_Config pwmConfig;
	pwmConfig.frequency = 20000;

	pwmConfig.tomOut = &PWMACCL;
	HLD_GtmTomPwm_initPwm(&RVC.out.accel_rearLeft, &pwmConfig);

	pwmConfig.tomOut = &PWMACCR;
	HLD_GtmTomPwm_initPwm(&RVC.out.accel_rearRight, &pwmConfig);

	pwmConfig.tomOut = &PWMDCCL;
	HLD_GtmTomPwm_initPwm(&RVC.out.decel_rearLeft, &pwmConfig);
	
	pwmConfig.tomOut = &PWMDCCR;
	HLD_GtmTomPwm_initPwm(&RVC.out.decel_rearRight, &pwmConfig);

	HLD_buttonConfig_t buttonConfig;
	HLD_UserInterface_buttonInitConfig(&buttonConfig);

	buttonConfig.bufferLen = HLD_buttonBufferLength_10;
	buttonConfig.port = &START_BTN;
	buttonConfig.callBack = RVC_toggleR2d;
	
	HLD_UserInterface_buttonInit(&RVC.startButton, &buttonConfig);
	IfxPort_setPinModeOutput(R2DOUT.port, R2DOUT.pinIndex,IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);
	IfxPort_setPinLow(R2DOUT.port, R2DOUT.pinIndex);

	RVC.calibration.left.mul = 1.06;
	RVC.calibration.left.offset = 0.015;

	RVC.calibration.right.mul = 1.065;
	RVC.calibration.right.offset = 0.0125;


	RVC.tvMode1.pGain = 0.001;

	RVC.readyToDrive = RVC_ReadyToDrive_status_initialized;
}


void RVC_run_1ms(void)
{
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
	{
		IfxPort_setPinHigh(R2DOUT.port, R2DOUT.pinIndex);
	}
	else
	{
		IfxPort_setPinLow(R2DOUT.port, R2DOUT.pinIndex);
	}
	
	/* Test mode */
#ifdef RVCTEST
	
#else
	/* Get torque required from pedal value */
	if(SDP_PedalBox.apps.isValueOk)
	{
		RVC.torque.required = RVC_PedalMap_lut_getResult(SDP_PedalBox.apps.pps);
	}
	else
	{
		RVC.torque.required = 0;
	}
	
#endif
	if(SDP_PedalBox.bpps.isValueOk)
	{
		if(SDP_PedalBox.bpps.pps > 10)
		{
			RVC.torque.required = 0;
		}
	}
	/* Torque distribution */
	switch(RVC.tvMode)
	{
		case RVC_TorqueVectoring_mode1:
			RVC_TorqueVectoring_run_mode1();
			break;
		default:
			RVC_TorqueVectoring_run_modeOpen();
			break;
	}

	/* Torque signal generation */
	//0~100% maped to 1~4V ( = 0.2~0.8 duty)
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
	{
		RVC.pwmDuty.rearLeft = (RVC.torque.rearLeft)*0.006f*RVC.calibration.left.mul + 0.2f + RVC.calibration.left.offset;
		RVC.pwmDuty.rearRight = (RVC.torque.rearRight)*0.006f*RVC.calibration.right.mul + 0.2f + RVC.calibration.right.offset;
	}
	else
	{
		RVC.pwmDuty.rearLeft = (0)*0.006f*RVC.calibration.left.mul + 0.2f + RVC.calibration.left.offset;
		RVC.pwmDuty.rearRight = (0)*0.006f*RVC.calibration.right.mul + 0.2f + RVC.calibration.right.offset;
	}
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.accel_rearLeft, RVC.pwmDuty.rearLeft);
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.accel_rearRight, RVC.pwmDuty.rearRight);
}

void RVC_run_10ms(void)
{
	if(HLD_UserInterface_pollButton(&RVC.startButton))
	{
		if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
		HLD_GtmTomBeeper_start(music);
	}
}



IFX_STATIC void RVC_setR2d(void)
{
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_initialized)
		RVC.readyToDrive = RVC_ReadyToDrive_status_run;
}

IFX_STATIC void RVC_resetR2d(void)
{
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
		RVC.readyToDrive = RVC_ReadyToDrive_status_initialized;
}

IFX_STATIC void RVC_toggleR2d(void)
{
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_initialized)
		RVC.readyToDrive = RVC_ReadyToDrive_status_run;
	else if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
		RVC.readyToDrive = RVC_ReadyToDrive_status_initialized;
}

IFX_STATIC void RVC_TorqueVectoring_run_modeOpen(void)
{
	RVC.torque.rearLeft = RVC.torque.required;
	RVC.torque.rearRight = RVC.torque.required;
}

IFX_STATIC void RVC_TorqueVectoring_run_mode1(void)
{
	/*Default*/
	//FIXME: TV algorithm
	RVC_TorqueVectoring_run_modeOpen();
}