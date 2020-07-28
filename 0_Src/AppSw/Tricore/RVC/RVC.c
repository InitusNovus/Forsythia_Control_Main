/*
 * RVC.c
 * Created on 2019. 11. 01
 * Author: Dua
 */


/* 	
TODO: 
	CAN associated functions 
		- R2D entry routine
		- Steering wheel function
		- Parameter load/save
		- BMS data: Power calculation and limit
			** Data parsing in SDP
		- Broadcasting
	Torque Limit algorithm
		- signoid function?
 */


/***************************** Includes ******************************/
#include "Beeper_Test_Music.h"
#include "HLD.h"
#include "IfxPort.h"
#include "PedalMap.h"
#include "Gpio_Debounce.h"

#include "RVC.h"
#include "RVC_privateDataStructure.h"
#include "TorqueVectoring/TorqueVectoring.h"

<<<<<<< HEAD
/* Macro */
#define PWMFREQ 5000 // PWM frequency in Hz
#define PWMVREF 5.0  // PWM reference voltage (On voltage)
=======
/****************************** Macro ********************************/
#define PWMFREQ 20000 // PWM frequency in Hz
#define PWMVREF 5.0   // PWM reference voltage (On voltage)
>>>>>>> RVC_temp

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
#define R2D_OFFHOLD(1*100)			//1 seconds	
#define R2D_REL (1*100)			//1 seconds

#define PEDAL_BRAKE_ON_THRESHOLD 10

#define TV1PGAIN 0.001

<<<<<<< HEAD
/* Global Variables */
RVC_t RVC = 
{
=======
/************************* Global Variables **************************/
RVC_t RVC = {
>>>>>>> RVC_temp
    .readyToDrive = RVC_ReadyToDrive_status_notInitialized,
    .torque.controlled = 0,
    .torque.rearLeft = 0,
    .torque.rearRight = 0,
};

/******************* Private Function Prototypes *********************/
IFX_STATIC void RVC_setR2d(void);
IFX_STATIC void RVC_resetR2d(void);
IFX_STATIC void RVC_toggleR2d(void);

IFX_STATIC void RVC_initPwm(void);
IFX_STATIC void RVC_initButton(void);

/********************* Function Implementation ***********************/
void RVC_init(void)
{
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
	RVC.calibration.left.mul = OUTCAL_LEFT_MUL;
	RVC.calibration.left.offset = OUTCAL_LEFT_OFFSET;

	RVC.calibration.right.mul = OUTCAL_RIGHT_MUL;
	RVC.calibration.right.offset = OUTCAL_RIGHT_OFFSET;
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

void RVC_run_1ms(void)
{
<<<<<<< HEAD
	// TODO: R2D entry routine
=======
	/* TODO: R2D entry routine */

>>>>>>> RVC_temp
	/* ready to drive state output update */
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
	{
		IfxPort_setPinHigh(R2DOUT.port, R2DOUT.pinIndex);
	}
	else
	{
		IfxPort_setPinLow(R2DOUT.port, R2DOUT.pinIndex);
	}

	/* Get torque required from pedal value*/
	if(SDP_PedalBox.apps.isValueOk)
	{
		RVC.torque.controlled = (RVC.torque.desired = RVC_PedalMap_lut_getResult(SDP_PedalBox.apps.pps));
	}
	else
	{
		RVC.torque.controlled = 0;
	}

	if(SDP_PedalBox.bpps.isValueOk)
	{
		if(SDP_PedalBox.bpps.pps > PEDAL_BRAKE_ON_THRESHOLD)
		{
			RVC.torque.controlled = 0;
		}
	}

	/* TODO: Torque limit: Traction control, Power Limit */
	/* TODO: Negative value for controlled torque value - Regen */
	if(RVC.torque.controlled > 100)
	{
		RVC.torque.controlled = 100;
	}
	else if(RVC.torque.controlled < 0)
	{
		RVC.torque.controlled = 0;
	}
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

<<<<<<< HEAD
	/* Torque signal saturation */
	if(RVC.torque.rearLeft)
	{
	}

	/* Torque signal generation */
=======
	/* TODO: Torque signal saturation */
	/* TODO: Torque signal check*/

	/* Torque signal generation */
	/* TODO: Regen signal generation */
>>>>>>> RVC_temp
	// 0~100% maped to 1~4V ( = 0.2~0.8 duty)
	if(RVC.readyToDrive == RVC_ReadyToDrive_status_run)
	{
		RVC.pwmDuty.rearLeft =
		    (RVC.torque.rearLeft) * 0.006f * RVC.calibration.left.mul + 0.2f + RVC.calibration.left.offset;
		RVC.pwmDuty.rearRight =
		    (RVC.torque.rearRight) * 0.006f * RVC.calibration.right.mul + 0.2f + RVC.calibration.right.offset;
	}
	else
	{
		RVC.pwmDuty.rearLeft = (0) * 0.006f * RVC.calibration.left.mul + 0.2f + RVC.calibration.left.offset;
		RVC.pwmDuty.rearRight = (0) * 0.006f * RVC.calibration.right.mul + 0.2f + RVC.calibration.right.offset;
	}
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.accel_rearLeft, RVC.pwmDuty.rearLeft);
	HLD_GtmTomPwm_setTriggerPointFloat(&RVC.out.accel_rearRight, RVC.pwmDuty.rearRight);
}

void RVC_run_10ms(void)
{
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
		if( releaseCount > R2DREL)
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
