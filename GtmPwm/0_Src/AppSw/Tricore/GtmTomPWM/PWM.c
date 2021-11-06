#include<Gtm/Tom/Pwm/IfxGtm_Tom_Pwm.h>
#include<stdio.h>
#include"PWM.h"
#include"IfxGtm_Tom_Pwm.h"
#include"IfxGtm_cfg.h"
#include"IfxGtm_PinMap.h"
#include"IfxCcu6.h"
App_Gtm g_Gtm;
void Tom_init(void);

IFX_INTERRUPT(TOM0Ch0_ISR, 0, TOM0_CH0_PRIO)
{}



void Tom_init(void){

    g_Gtm.gtm = &MODULE_GTM;

    //IfxCpu_Irq_installInterruptHandler(TOM0Ch0_ISR, TOM0_CH0_PRIO);
    float32 frequency = IfxGtm_Cmu_getModuleFrequency(g_Gtm.gtm);
    //Enable GTM
    IfxGtm_enable(g_Gtm.gtm);
    //Set the global clock frequenct to the max
    IfxGtm_Cmu_setGclkFrequency(g_Gtm.gtm,frequency);
    //Set the CMU CLK0
    IfxGtm_Cmu_setClkFrequency(g_Gtm.gtm, IfxGtm_Cmu_Clk_0,frequency);
    //FXCLK: used by TOM andCLKO :used by ATOM
    IfxGtm_Cmu_enableClocks(g_Gtm.gtm, IFXGTM_CMU_CLKEN_FXCLK | IFXGTM_CMU_CLKEN_CLK0);


    IfxGtm_Tom_Pwm_initConfig(&g_Gtm.tomConfig, g_Gtm.gtm);
    g_Gtm.tomConfig.tom         =IfxGtm_Tom_1;
    g_Gtm.tomConfig.tomChannel =IfxGtm_Tom_Ch_0;
    g_Gtm.tomConfig.period        =  2000000;//10000->10khz
    g_Gtm.tomConfig.dutyCycle     =  1000000;
    //g_Gtm.tomConfig.interrupt.ccu0Enabled =TRUE;
    //g_Gtm.tomConfig.interrupt.isrPriority = TOM0_CH0_PRIO;
    //g_Gtm.tomConfig.pin.outputPin = &IfxGtm_TOM0_4_TOUT94_P13_2_OUT;
    g_Gtm.tomConfig.pin.outputPin = &IfxGtm_TOM1_0_TOUT32_P33_10_OUT;
    g_Gtm.tomConfig.synchronousUpdateEnabled =1;   

    
    IfxGtm_Tom_Pwm_init(&g_Gtm.tomHandle, &g_Gtm.tomConfig);
    IfxPort_setPinMode(&MODULE_P02, 1 , IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinState(&MODULE_P02, 1 , IfxPort_State_high);
    IfxPort_setPinMode(&MODULE_P02, 2 , IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinState(&MODULE_P02, 2 , IfxPort_State_high);
    IfxPort_setPinMode(&MODULE_P02, 3 , IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinState(&MODULE_P02, 3 , IfxPort_State_high);
}


