#include<Gtm/Tom/Pwm/IfxGtm_Tom_Pwm.h>
#include<stdio.h>
#include<Bsp.h>
#include "Cpu/Std/Ifx_Types.h"
#include"IfxGtm_Cmu.h"
#include"IfxGtm_cfg.h"

//#include "IfxPort.h"

#define TOM0_CH0_PRIO 10

typedef struct
{
    Ifx_GTM *gtm ;
    IfxGtm_Tom_Pwm_Config tomConfig; //configuration structure
    IfxGtm_Tom_Pwm_Driver tomHandle;  //handle


    
        /* data */
} App_Gtm;

IFX_EXTERN App_Gtm g_Gtm;
