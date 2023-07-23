/*
 * SchedulerTask_Cpu2.c
 *
 *  Created on: 2019. 10. 30.
 *      Author: Dua
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "SDP.h"
#include "SchedulerTask_Cpu2.h"
#ifndef __SDP_CLOVER__
#include "AmkInverter_can.h"
#endif
#include "OrionBms2.h"
#include "SteeringWheel.h"
#include "AdcSensor.h"
#include "PedalBox.h"


/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
Task_cpu2 Task_core2 =
{
	.flag = FALSE,
};
uint64 stm_buf_c2 = 0;
uint64 stm_buf_c2_delay = 0;
uint64 ticToc_1ms_c2 = 0;
uint64 delay_1ms_c2 = 0;
uint16_t task2_10ms_counter = 0;

extern AdcSensor APPS0;
int value = 0;
// boolean RTD_flag;
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void Task_core2_primaryService(void)
{
	
}

void Task_core2_1ms(void)
{
	stm_buf_c2_delay = IfxStm_get(&MODULE_STM0);

	delay_1ms_c2 = (IfxStm_get(&MODULE_STM0) - stm_buf_c2_delay) * 1000000 / (IfxStm_getFrequency(&MODULE_STM0));
	stm_buf_c2 = IfxStm_get(&MODULE_STM0);

	SDP_PedalBox_run_1ms();
	SDP_SteeringAngleAdc_run();
#ifndef __SDP_CLOVER__
	AmkInverter_can_Run();
	// AccumulatorManager_master_run_1ms_c2();
	// OrionBms2_run_1ms_c2();
	// SteeringWheel_run_xms_c2();
#endif

#ifdef __SDP_CLOVER__
	CascadiaInverter_can_Run();

	OrionBms2_run_1ms_c2();
	SDP_SensorHub_run_10ms();

	//SDP_SensorHub_run_1ms();
#endif
	task2_10ms_counter+=1;
	value = 2.37*APPS0.value - 11.89;
#ifndef __SDP_CLOVER__
	writeMessage(value,value);
	writeMessage2(value,value);
#endif
#ifdef __SDP_CLOVER__
	//CascadiaInverter_writeTorque(10, 10);
#endif
	// else if (task2_10ms_counter ==15)
	SDP_DashBoardCan_run_10ms();
#ifndef __SDP_CLOVER__
	if (RTD_flag)AmkInverterStart();
#endif
	if(RTD_flag) {
		//Expect to enter this snippet only once per single RTD on.
		//That is, this condition is evaluated true when the VCU receives the "RTD ON" CAN message.
		//The dashboard TriCore(MCU) repeatedly sends the message until it processes a ACK generated from the VCU.
		//The VCU broadcasts the ACK for each "RTD ON" messages.
		//So consequently, it IS possible for the VCU to enter this scope multiple times,
		//but please clearly understand the "RTD_flag" condition only evaluates true only during a short time interval of each "Power Up"s,
		//rather than the entire drive.

		//CascadiaInverter_enable(); // Do this in the RVC_setR2d()
	}else {
		//CascadiaInverter_disable();
	}
	if (task2_10ms_counter == 10){
		Task_core2_10ms_slot1();
		task2_10ms_counter = 0;
	}
	else if(task2_10ms_counter == 5) {
		Task_core2_10ms_slot2();
	}
	ticToc_1ms_c2 = (IfxStm_get(&MODULE_STM0) - stm_buf_c2) * 1000000 / (IfxStm_getFrequency(&MODULE_STM0));
	
}

void Task_core2_10ms_slot1(void)
{


	/*
	FIXME:
	tempPedal to target torque value
	target torque value unit : 0.1 % of nominal torque 9.8Nm
	1000-> 100% of nominal torque
	2143 -> 214.3% of nominal torque 21Nm
	maby 21Nm is max by datasheet graph
	*/
	SteeringWheel_run_xms_c2();

}

void Task_core2_10ms_slot2(void){

}

void Task_core2_backgroundService(void)
{

}
