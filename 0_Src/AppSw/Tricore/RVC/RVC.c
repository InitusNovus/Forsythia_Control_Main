/*
 * RVC.c
 * Created on 2019. 11. 01
 * Author: Dua
 */


/* 	
TODO: 
	CAN associated functions 
		- R2D entry routine display
		- Steering wheel function
		- Parameter load/save
		- BMS data: Power calculation and limit
			** Data parsing in SDP
		- Log Data Broadcasting
	Torque Limit algorithm
		- Signoid function?
	Battery Management
		- Charge consumed calculation
 */


/***************************** Includes ******************************/
#include <math.h>

#include "Beeper_Test_Music.h"
#include "HLD.h"
#include "IfxPort.h"
#include "PedalMap.h"
#include "Gpio_Debounce.h"
#include "AdcSensor.h"
#include "AdcForceStart.h"

#include "RVC.h"
#include "RVC_privateDataStructure.h"
#include "TorqueVectoring/TorqueVectoring.h"

/**************************** Macro **********************************/
#define PWMFREQ 5000 // PWM frequency in Hz
#define PWMVREF 5.0  // PWM reference voltage (On voltage)

/*
#define OUTCAL_LEFT_MUL 1.06
#define OUTCAL_LEFT_OFFSET 0.015
#define OUTCAL_RIGHT_MUL 1.065
#define OUTCAL_RIGHT_OFFSET 0.0125
 */

#define OUTCAL_LEFT_MUL 1.0f
#define OUTCAL_LEFT_OFFSET 0.0f
#define OUTCAL_RIGHT_MUL 1.0f
#define OUTCAL_RIGHT_OFFSET 0.0f

#define R2DOUT IfxPort_P21_0
#define R2D_ONHOLD (3*100)			//3 seconds
#define R2D_OFFHOLD (1*100)			//1 seconds	
#define R2D_REL (1*100)			//1 seconds

#define PEDAL_BRAKE_ON_THRESHOLD 10
#define REGEN_MUL	1	//2

#define TV1PGAIN 0.001

#define REGEN_INIT	FALSE

/*********************** Global Variables ****************************/
RVC_t RVC = 
{
    .readyToDrive = RVC_ReadyToDrive_status_notInitialized,
    .torque.controlled = 0,
    .torque.rearLeft = 0,
    .torque.rearRight = 0,
	.torque.isRegenOn = REGEN_INIT,

	.calibration.leftAcc.mul = 1,
	.calibration.leftAcc.offset = 0,
	.calibration.rightAcc.mul = 1,
	.calibration.rightAcc.offset = 0,
	.calibration.leftDec.mul = 1,
	.calibration.leftDec.offset = 0,
	.calibration.rightDec.mul = 1,
	.calibration.rightDec.offset = 0,
};

/******************* Private Function Prototypes *********************/
IFX_STATIC void RVC_setR2d(void);
IFX_STATIC void RVC_resetR2d(void);
IFX_STATIC void RVC_toggleR2d(void);

IFX_STATIC void RVC_initPwm(void);
IFX_STATIC void RVC_initButton(void);
IFX_STATIC void RVC_pollButton(void);

IFX_INLINE void RVC_updateReadyToDriveSignal(void);
IFX_INLINE void RVC_slipComputation(void);
IFX_INLINE void RVC_getTorqueRequired(void);
IFX_INLINE void RVC_torqueSatuation(void);
IFX_INLINE void RVC_torqueDistrobution(void);
IFX_INLINE void RVC_torqueSignalGeneration(void);
IFX_INLINE void RVC_updatePwmSignal(void);

/********************* Function Implementation ***********************/
void RVC_init(void)
{
	AdcSensor_Config adcConfig;
	adcConfig.adcConfig.channelIn = &(HLD_Vadc_Channel_In){HLD_Vadc_group2, HLD_Vadc_ChannelId_4};

	adcConfig.adcConfig.lpf.activated = TRUE;
	adcConfig.adcConfig.lpf.config.gain = 1;
	adcConfig.adcConfig.lpf.config.cutOffFrequency = 1.0e1;
	adcConfig.adcConfig.lpf.config.samplingTime = 10.0e-3;

	adcConfig.isOvervoltageProtected = FALSE;
	adcConfig.linCalConfig.isAct = FALSE;
	adcConfig.tfConfig.a = (20.0f+8.2f)/8.2f;
	adcConfig.tfConfig.b = 0.0f;

	AdcSensor_initSensor(&RVC.LvBattery_Voltage, &adcConfig);
	HLD_AdcForceStart(RVC.LvBattery_Voltage.adcChannel.channel.group);


	RVC.tvMode = RVC_TorqueVectoring_modeOpen;
	RVC.tcMode = RVC_TractionControl_modeNone;
	RVC_PedalMap_lut_setMode(0);

	/* PWM output initialzation */
	RVC_initPwm();

	/* R2D button config */
	RVC_initButton();

	RVC.tvMode1.pGain = TV1PGAIN;
	RVC.readyToDrive = RVC_ReadyToDrive_status_initialized;
}

void RVC_run_1ms(void)
{
	/* TODO: R2D entry routine */

	RVC_updateReadyToDriveSignal();

	RVC_slipComputation();

	RVC_getTorqueRequired();

	/* TODO: Torque limit: Traction control, Power Limit */

	/* PowerCalculation */

	RVC_torqueSatuation();

	RVC_torqueDistrobution();

	/* TODO: Torque signal check*/

	RVC_torqueSignalGeneration();

	RVC_updatePwmSignal();

	/* TODO: Shared variable update */
}

void RVC_run_10ms(void)
{
	/* Start button polling */
	static boolean risingEdgeFlag = FALSE;
	static uint32 pushCount = 0;
	static uint32 releaseCount = 0;

	if( (Gpio_Debounce_pollInput(&RVC.startButton) == TRUE)&&(risingEdgeFlag == FALSE) )
	{	/* The button is Pushed */
		pushCount++;

		/* For Test */
		if( (RVC.readyToDrive == RVC_ReadyToDrive_status_initialized)&&(pushCount > R2D_ONHOLD) )
		{
			RVC_setR2d();
			HLD_GtmTomBeeper_start(music);
			pushCount = 0;
			risingEdgeFlag = TRUE; //Rising edge detected
		}
		else if( (RVC.readyToDrive == RVC_ReadyToDrive_status_run)&&(pushCount > R2D_ONHOLD)/* &&() */ )	//TODO: RTD off condition: Speed == 0, 
		{
			RVC_resetR2d();
			pushCount = 0;
			risingEdgeFlag = TRUE; //Rising edge detected
		}

	}
	else if( (Gpio_Debounce_pollInput(&RVC.startButton) == FALSE)&&(risingEdgeFlag == TRUE) )
	{	/* The button is released */
		releaseCount++;
		if( releaseCount > R2D_REL)
		{
			risingEdgeFlag = FALSE;
			/* The button is released */
		}
	}
	else
	{
		pushCount = 0;
		releaseCount = 0;
	}
}

/****************** Private Function Implementation ******************/
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

IFX_STATIC void RVC_initPwm(void)
{
	HLD_GtmTom_Pwm_Config pwmConfig;
	pwmConfig.frequency = PWMFREQ;

	pwmConfig.tomOut = &PWMACCL;
	HLD_GtmTomPwm_initPwm(&RVC.out.accel_rearLeft, &pwmConfig);

	pwmConfig.tomOut = &PWMACCR;
	HLD_GtmTomPwm_initPwm(&RVC.out.accel_rearRight, &pwmConfig);

	pwmConfig.tomOut = &PWMDCCL;
	HLD_GtmTomPwm_initPwm(&RVC.out.decel_rearLeft, &pwmConfig);

	pwmConfig.tomOut = &PWMDCCR;
	HLD_GtmTomPwm_initPwm(&RVC.out.decel_rearRight, &pwmConfig);

	/* PWM output calibration */
	RVC.calibration.leftAcc.mul = OUTCAL_LEFT_MUL;
	RVC.calibration.leftAcc.offset = OUTCAL_LEFT_OFFSET;

	RVC.calibration.rightAcc.mul = OUTCAL_RIGHT_MUL;
	RVC.calibration.rightAcc.offset = OUTCAL_RIGHT_OFFSET;
}

IFX_STATIC void RVC_initButton(void)
{
	// FIXME: Button (Active Low) -> GPIO (Active High)
/* 	
	HLD_buttonConfig_t buttonConfig;
	HLD_UserInterface_buttonInitConfig(&buttonConfig);

	buttonConfig.bufferLen = HLD_buttonBufferLength_10;
	buttonConfig.port = &START_BTN;
	buttonConfig.callBack = RVC_toggleR2d; // FIXME: Do not just toggle the state!

	HLD_UserInterface_buttonInit(&RVC.startButton, &buttonConfig);
	IfxPort_setPinModeOutput(R2DOUT.port, R2DOUT.pinIndex, IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);
	IfxPort_setPinLow(R2DOUT.port, R2DOUT.pinIndex);
 */

	Gpio_Debounce_inputConfig StartBtnContig;
	Gpio_Debounce_initInputConfig(&StartBtnContig);
	StartBtnContig.bufferLen = Gpio_Debounce_BufferLength_10;
	StartBtnContig.inputMode = IfxPort_InputMode_noPullDevice;
	StartBtnContig.port = &START_BTN;
	Gpio_Debounce_initInput(&RVC.startButton, &StartBtnContig);
}


/***************** Inline Function Implementation ******************/
IFX_INLINE void RVC_updateReadyToDriveSignal(void)
{
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
	{
		IfxPort_setPinHigh(R2DOUT.port, R2DOUT.pinIndex);
	}
	else
	{
		IfxPort_setPinLow(R2DOUT.port, R2DOUT.pinIndex);
	}
}

IFX_INLINE void RVC_slipComputation(void)
{
	RVC.slip.axle = SDP_WheelSpeed.velocity.rearAxle/SDP_WheelSpeed.velocity.frontAxle;
	RVC.slip.left = SDP_WheelSpeed.wssRL.wheelLinearVelocity/SDP_WheelSpeed.wssFL.wheelLinearVelocity;
	RVC.slip.right = SDP_WheelSpeed.wssRR.wheelLinearVelocity/SDP_WheelSpeed.wssFR.wheelLinearVelocity;
	if(isnan(RVC.slip.axle)||isnan(RVC.slip.left)||isnan(RVC.slip.right)) 
	{
		RVC.slip.error = TRUE;
	}
	else
	{
		RVC.slip.error = FALSE;
	}
}

IFX_INLINE void RVC_getTorqueRequired(void)
{
	if(SDP_PedalBox.apps.isValueOk)		//APPS Plausibility check
	{
		RVC.torque.controlled = (RVC.torque.desired = RVC_PedalMap_lut_getResult(SDP_PedalBox.apps.pps));
	}
	else
	{
		RVC.torque.controlled = (RVC.torque.desired = 0);		//APPS Fail
	}

	if(SDP_PedalBox.bpps.isValueOk)		//BPPS Plausibility check
	{
		if(SDP_PedalBox.bpps.pps > PEDAL_BRAKE_ON_THRESHOLD)
		{
			RVC.torque.desired = -(SDP_PedalBox.bpps.pps);		//BPPS overide
			if(RVC.torque.isRegenOn)							//Regen
			{
				RVC.torque.controlled = RVC.torque.desired;
			}
			else 
			{
				RVC.torque.controlled = (RVC.torque.desired = 0);	//Regen off: Zero torque signal when brake on.
			}	
		}
	}
	else //FIXME: BSPD control using Brake Pressure Analog signal. Failsafe for BPPS.
	{
		RVC.torque.controlled = 0;		//BPPS Fail
	}
}

IFX_INLINE void RVC_torqueSatuation(void)
{
	if(RVC.torque.controlled > 100)
	{
		RVC.torque.controlled = 100;
	}
	else if(RVC.torque.controlled < -100)
	{
		RVC.torque.controlled = -100;
	}
	else if(RVC.torque.desired < RVC.torque.controlled)
	{
		RVC.torque.controlled = RVC.torque.desired;
	}
}

IFX_INLINE void RVC_torqueDistrobution(void)
{
	/* Traction Control Calculation */
	switch(RVC.tcMode)
	{
	case RVC_TractionControl_mode1:
		break;
	default:
		break;
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
}

IFX_INLINE void RVC_torqueSignalGeneration(void)
{
	// 0~100% maped to 1~4V ( = 0.2~0.8 duty)
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
	{
		if(RVC.torque.rearLeft > 0) 	//Accelertation
		{
			RVC.pwmDuty.rearLeftAcc =
				(RVC.torque.rearLeft) * 0.006f * RVC.calibration.leftAcc.mul + 0.2f + RVC.calibration.leftAcc.offset;
			RVC.pwmDuty.rearLeftDec = 
				(0) * 0.006f * RVC.calibration.leftDec.mul + 0.2f + RVC.calibration.leftDec.offset;
		}
		else 
		{
			RVC.pwmDuty.rearLeftAcc =
				(0) * 0.006f * RVC.calibration.leftAcc.mul + 0.2f + RVC.calibration.leftAcc.offset;
			RVC.pwmDuty.rearLeftDec = 
				(-(RVC.torque.rearLeft)*REGEN_MUL) * 0.006f * RVC.calibration.leftDec.mul + 0.2f + RVC.calibration.leftDec.offset;
		}

		if(RVC.torque.rearRight > 0)
		{
			RVC.pwmDuty.rearRightAcc =
				(RVC.torque.rearRight) * 0.006f * RVC.calibration.rightAcc.mul + 0.2f + RVC.calibration.rightAcc.offset;			
			RVC.pwmDuty.rearRightDec = 
				(0) * 0.006f * RVC.calibration.rightDec.mul + 0.2f + RVC.calibration.rightDec.offset;
		}
		else 
		{
			RVC.pwmDuty.rearRightAcc =
				(0) * 0.006f * RVC.calibration.rightAcc.mul + 0.2f + RVC.calibration.rightAcc.offset;
			RVC.pwmDuty.rearRightDec = 
				(-(RVC.torque.rearRight)*REGEN_MUL) * 0.006f * RVC.calibration.rightDec.mul + 0.2f + RVC.calibration.rightDec.offset;			
		}
	}
	else
	{
		RVC.pwmDuty.rearLeftAcc = (0) * 0.006f * RVC.calibration.leftAcc.mul + 0.2f + RVC.calibration.leftAcc.offset;
		RVC.pwmDuty.rearRightAcc = (0) * 0.006f * RVC.calibration.rightAcc.mul + 0.2f + RVC.calibration.rightAcc.offset;
		RVC.pwmDuty.rearLeftDec = (0) * 0.006f * RVC.calibration.leftDec.mul + 0.2f + RVC.calibration.leftDec.offset;
		RVC.pwmDuty.rearRightDec = (0) * 0.006f * RVC.calibration.rightDec.mul + 0.2f + RVC.calibration.rightDec.offset;
	}
}

IFX_INLINE void RVC_updatePwmSignal(void)
{
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.accel_rearLeft, RVC.pwmDuty.rearLeftAcc);
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.accel_rearRight, RVC.pwmDuty.rearRightAcc);
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.decel_rearLeft, RVC.pwmDuty.rearLeftDec);
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.decel_rearRight, RVC.pwmDuty.rearRightDec);
}