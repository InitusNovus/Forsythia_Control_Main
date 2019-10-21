/*
 * Stm.c
 *
 *  Created on: 2018. 5. 16.
 *      Author: bigbi_000
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "Stm.h"
#include "SchedulerTask.h"
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
Stm_data g_Stm;
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
static void Stm_Led_init(void);
static void Stm_Led_blinking(void);
/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/
static Stm_task stmTask;
/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/

IFX_INTERRUPT(STM_Int0Handler, 0, ISR_PRIORITY_STM_INT0);

void STM_Int0Handler (void)
{
    IfxStm_clearCompareFlag(g_Stm.stmSfr, g_Stm.stmConfig.comparator);
#ifdef SIMULATION
	IfxStm_increaseCompare(g_Stm.stmSfr, g_Stm.stmConfig.comparator, 1000);
#else
	IfxStm_increaseCompare(g_Stm.stmSfr, g_Stm.stmConfig.comparator, TimeConst_1ms);
#endif
    IfxCpu_enableInterrupts();

    g_Stm.counter++;
    if(g_Stm.counter == 1000){
    	g_Stm.counter = 0;
    }



    stmTask.flag_1ms = TRUE;
    /*10ms*/
    if(g_Stm.counter%10 == 0)
    {
    	stmTask.flag_10ms = TRUE;
    }
    if((g_Stm.counter-1)%10==0)
    {
    	stmTask.flag_10ms_slot1 = TRUE;
    }
    /*100ms*/
    if(g_Stm.counter%100 == 0)
    {
    	stmTask.flag_100ms = TRUE;
    }
    if((g_Stm.counter-4)%100 == 0)
    {
    	stmTask.flag_100ms_slot4 = TRUE;
    }
    if((g_Stm.counter-5)%100 == 0)
    {
    	stmTask.flag_100ms_slot5 = TRUE;
    }
    if((g_Stm.counter-14)%100 == 0)
    {
    	stmTask.flag_100ms_slot14 = TRUE;
    }
    if((g_Stm.counter-24)%100 == 0)
    {
    	stmTask.flag_100ms_slot24 = TRUE;
    }
    if((g_Stm.counter-34)%100 == 0)
    {
    	stmTask.flag_100ms_slot34 = TRUE;
    }
    if((g_Stm.counter-44)%100 == 0)
    {
    	stmTask.flag_100ms_slot44 = TRUE;
    }

    if(g_Stm.counter%500 == 0)
    {
    	Stm_Led_blinking();
    }

    /*1s*/
    if(g_Stm.counter%1000 == 0)
    {
    	stmTask.flag_1000ms = TRUE;
    }
    if((g_Stm.counter-3)%1000 == 0)
    {
    	stmTask.flag_1000ms_slot3 = TRUE;
    }
    Task_IsrCb_1ms();
}

void Stm_init (void)
{
	printf("Stm_init() called\n");

    /* disable interrupts */
    boolean interruptState = IfxCpu_disableInterrupts();

    g_Stm.LedState.U = 0;
    g_Stm.counter = 0;

    initTime();

    // suspend by debugger enabled
    IfxStm_enableOcdsSuspend (&MODULE_STM0);

    g_Stm.stmSfr = &MODULE_STM0;
    IfxStm_initCompareConfig(&g_Stm.stmConfig);

    g_Stm.stmConfig.triggerPriority = ISR_PRIORITY_STM_INT0;
    g_Stm.stmConfig.typeOfService   = IfxSrc_Tos_cpu0;
#ifdef SIMULATION
    g_SrcSwInt.stmConfig.ticks      = 1000;
#else
    g_Stm.stmConfig.ticks           = TimeConst_1ms;
#endif
    IfxStm_initCompare(g_Stm.stmSfr, &g_Stm.stmConfig);

    printf("Stm_Led_init() called\n");
    Stm_Led_init();

    /* enable interrupts again */
    IfxCpu_restoreInterrupts(interruptState);
}


void Stm_Led_init (void)
{
	IfxPort_setPinMode(LED_ONBOARD.port, LED_ONBOARD.pinIndex, IfxPort_Mode_outputPushPullGeneral);

	IfxPort_setPinState(LED_ONBOARD.port, LED_ONBOARD.pinIndex, IfxPort_State_high);
}


void Stm_Led_blinking(void)
{
	g_Stm.LedState.B.Led_Onboard = !g_Stm.LedState.B.Led_Onboard;
	if(g_Stm.LedState.B.Led_Onboard == TRUE)
	{
		IfxPort_setPinState (LED_ONBOARD.port, LED_ONBOARD.pinIndex, IfxPort_State_low);
	}
	else
	{
		IfxPort_setPinState (LED_ONBOARD.port, LED_ONBOARD.pinIndex, IfxPort_State_high);
	}

}


void Stm_scheduler (void)
{
	/*1ms*/
	if(stmTask.flag_1ms == TRUE)
	{
		Task_1ms();
		stmTask.flag_1ms = FALSE;
	}
	/*10ms*/
	if(stmTask.flag_10ms == TRUE)
	{
		Task_10ms();
		stmTask.flag_10ms = FALSE;
	}
	if(stmTask.flag_10ms_slot1 == TRUE)
	{
		Task_10ms_slot1();
		stmTask.flag_10ms_slot1 = FALSE;
	}
	/*100ms*/
	if(stmTask.flag_100ms == TRUE)
	{
		Task_100ms();
		stmTask.flag_100ms = FALSE;
	}
	if(stmTask.flag_100ms_slot4 == TRUE)
	{
		Task_100ms_slot4();
		stmTask.flag_100ms_slot4 = FALSE;
	}
	if(stmTask.flag_100ms_slot5 == TRUE)
	{
		Task_100ms_slot5();
		stmTask.flag_100ms_slot5 = FALSE;
	}
	if(stmTask.flag_100ms_slot14 == TRUE)
	{
		Task_100ms_slot14();
		stmTask.flag_100ms_slot14 = FALSE;
	}
	if(stmTask.flag_100ms_slot24 == TRUE)
	{
		Task_100ms_slot24();
		stmTask.flag_100ms_slot24 = FALSE;
	}
	if(stmTask.flag_100ms_slot34 == TRUE)
	{
		Task_100ms_slot34();
		stmTask.flag_100ms_slot34 = FALSE;
	}
	if(stmTask.flag_100ms_slot44 == TRUE)
	{
		Task_100ms_slot44();
		stmTask.flag_100ms_slot44 = FALSE;
	}
	/*1000ms*/
	if(stmTask.flag_1000ms == TRUE)
	{
		Task_1000ms();
		stmTask.flag_1000ms = FALSE;
	}
	if(stmTask.flag_1000ms_slot3 == TRUE)
	{
		Task_1000ms_slot3();
		stmTask.flag_1000ms_slot3 = FALSE;
	}
}
