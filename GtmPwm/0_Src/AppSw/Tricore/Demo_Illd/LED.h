#include <Ifx_Types.h>
#include <stdio.h>
#include "Bsp.h"
#include "ConfigurationIsr.h"
#include "Cpu/Irq/IfxCpu_Irq.h"
#include "IfxPort.h"
#include <Stm/Std/IfxStm.h>
#include <Src/Std/IfxSrc.h>
#include "Cpu0_Main.h"
#include "Cpu/Irq/IfxCpu_Irq.h"

typedef struct
{

    Ifx_STM *stmSfr;
    IfxStm_CompareConfig stmConfig;
    
    volatile uint8 LedBlink;
    volatile uint32 counter;
} App_Stm;

IFX_EXTERN App_Stm g_Stm;