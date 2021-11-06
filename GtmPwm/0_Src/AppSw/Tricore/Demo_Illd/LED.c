
#include <stdio.h>
#include "LED.h"

App_Stm g_Stm;

static void BlinkLED_Task(void);
static void BlinkLED_init(void);
void LED_init(void);
void LED_run(void);

IFX_INTERRUPT(FirstBlink, 0, ISR_PRIORITY_STM_INT0);

void FirstBlink(void)
{
    IfxStm_clearCompareFlag(g_Stm.stmSfr, g_Stm.stmConfig.comparator);
    IfxStm_increaseCompare(g_Stm.stmSfr, g_Stm.stmConfig.comparator, TimeConst_10ms*5);
    IfxCpu_enableInterrupts();
    BlinkLED_Task();
}

static void setOutputPin(Ifx_P *port, uint8 pin, boolean state)
{
    if (state)
    {
        IfxPort_setPinState(port, pin, IfxPort_State_high);
    }
    else
    {
        IfxPort_setPinState(port, pin, IfxPort_State_low);
    }
}


static void BlinkLED_Task(void)
{
    g_Stm.counter++;
    
    if(g_Stm.counter==10){
        g_Stm.LedBlink ^= 1;
        setOutputPin(&MODULE_P13, 0 ,g_Stm.LedBlink);
    }
    else if(g_Stm.counter==11){
        setOutputPin(&MODULE_P13, 1 ,g_Stm.LedBlink);
    }
    else if(g_Stm.counter==12){
        setOutputPin(&MODULE_P13, 2 ,g_Stm.LedBlink);
    }
    else if(g_Stm.counter==13){
        setOutputPin(&MODULE_P13, 3 ,g_Stm.LedBlink);

    }
     if(g_Stm.counter==14){
        g_Stm.LedBlink ^= 1;
        setOutputPin(&MODULE_P13, 0 ,g_Stm.LedBlink);
    }
    else if(g_Stm.counter==15){
        setOutputPin(&MODULE_P13, 1 ,g_Stm.LedBlink);
    }
    else if(g_Stm.counter==16){
        setOutputPin(&MODULE_P13, 2 ,g_Stm.LedBlink);
    }
    else if(g_Stm.counter==17){
        setOutputPin(&MODULE_P13, 3 ,g_Stm.LedBlink);
        g_Stm.counter=0;
    }
    
}

static void BlinkLED_init(void)
{
    IfxPort_setPinMode(&MODULE_P13, 0 , IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P13, 1 , IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P13, 2 , IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P13, 3 , IfxPort_Mode_outputPushPullGeneral);
}

void LED_init(void)
{
    printf("start LED_init\n");
    boolean interruptState = IfxCpu_disableInterrupts();

    g_Stm.LedBlink = 0;
    g_Stm.counter  = 0;
    initTime();

    g_Stm.stmSfr=&MODULE_STM0;
    IfxStm_initCompareConfig(&g_Stm.stmConfig);

    g_Stm.stmConfig.triggerPriority = ISR_PRIORITY_STM_INT0; //ISR_PRIORITY_STM_INT0;
    g_Stm.stmConfig.typeOfService =IfxSrc_Tos_cpu0;
    g_Stm.stmConfig.ticks = TimeConst_100ms;

    IfxStm_initCompare(g_Stm.stmSfr, &g_Stm.stmConfig);
    
    BlinkLED_init();

    IfxCpu_restoreInterrupts(interruptState);
}






void LED_run(void)
{
    printf("LED_run() called\n");

    while (g_Stm.counter < 20)
    {}

    printf("OK: checks passed \n");
}