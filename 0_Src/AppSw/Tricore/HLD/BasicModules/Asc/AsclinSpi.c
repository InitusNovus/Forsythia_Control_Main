/*
 * AsclinSpi.c
 *
 *  Created on: 2018. 5. 26.
 *      Author: bigbi_000
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "AsclinSpi.h"
#include <stdio.h>
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
AsclinSpi_t g_AsclinSpi;
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/

void HLD_AsclinSpi_init(void)
{
	printf("AsclinSpi_init() called\n");
	/* disable interrupts */
	boolean interruptState = IfxCpu_disableInterrupts();

    /* create module config */
    IfxAsclin_Spi_Config spiConfig;
    IfxAsclin_Spi_initModuleConfig(&spiConfig, &MODULE_ASCLIN1);

    /* set the desired baudrate */
    spiConfig.baudrate.prescaler    = 1;
    spiConfig.baudrate.baudrate     = 1000000;                		//8MHz
    spiConfig.baudrate.oversampling = IfxAsclin_OversamplingFactor_8;

    /*input and output polarity config
     *mode 0: CPOL = 0, SPOL = 0*/
    spiConfig.inputOutput.alti = IfxAsclin_RxInputSelect_3;				//RxInput: P14.8(RXD)
    spiConfig.inputOutput.cpol = IfxAsclin_ClockPolarity_idleHigh;
    spiConfig.inputOutput.spol = IfxAsclin_SlavePolarity_idleLow;

    spiConfig.frame.idleDelay = IfxAsclin_IdleDelay_0;
    spiConfig.frame.leadDelay = IfxAsclin_LeadDelay_0;
    spiConfig.frame.stopBit   = IfxAsclin_StopBit_0;
    spiConfig.frame.shiftDir  = IfxAsclin_ShiftDirection_msbFirst;

    spiConfig.dataLength = IfxAsclin_DataLength_8;


    const IfxAsclin_Spi_Pins pins =
    {
            &IfxAsclin1_SCLK_P33_11_OUT, IfxPort_OutputMode_pushPull, /* Clock out pin */
            &IfxAsclin1_RXD_P14_8_IN,   IfxPort_InputMode_pullUp,    /* Rx pin */
            &IfxAsclin1_TX_P15_4_OUT,   IfxPort_OutputMode_pushPull, /* Tx pin */
            &IfxAsclin1_SLSO_P33_10_OUT, IfxPort_OutputMode_pushPull, /* Slave select pin */
	        IfxPort_PadDriver_cmosAutomotiveSpeed1
    };
    spiConfig.pins = &pins;

    /* initialize module */
    IfxAsclin_Spi_initModule(&g_AsclinSpi.driver, &spiConfig);

    printf("AsclinSpi initialized\n");

    /* enable interrupts again */
    IfxCpu_restoreInterrupts(interruptState);

}





