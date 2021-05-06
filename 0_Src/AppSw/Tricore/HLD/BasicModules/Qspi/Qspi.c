/*
 * Qspi.c
 *
 *  Created on: 2018. 5. 27.
 *      Author: bigbi_000
 */

//FIXME Separate communication layer
/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "Qspi.h"
#include <stdio.h>
#include "Ifx_Assert.h"

#include "HLD.h"

//#define DMA_
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define IFX_QSPI2_TX_CHANNELID (IfxDma_ChannelId_3)
#define IFX_QSPI2_RX_CHANNELID (IfxDma_ChannelId_4)
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

Qspi_t		g_Qspi;

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
#ifdef DMA_
IFX_INTERRUPT(ISR_qspi2_Er, 0, ISR_PRIORITY_QSPI2_ER);
IFX_INTERRUPT(ISR_dma_ch3, 0, ISR_PRIORITY_DMA_CH3);
IFX_INTERRUPT(ISR_dma_ch4, 0, ISR_PRIORITY_DMA_CH4);

void ISR_qspi2_Er(void)
{
    IfxCpu_enableInterrupts();
    IfxQspi_SpiMaster_isrError(&g_QspiCam.drivers.spiMaster);
	HLD_GtmTomBeeper_start(Beep_pattern3);
}

void ISR_dma_ch3(void)
{
	IfxCpu_enableInterrupts();
	IfxQspi_SpiMaster_isrDmaTransmit(&g_QspiCam.drivers.spiMaster);
//	HLD_GtmTomBeeper_start(Beep_pattern1);
	QspiTest1 ++;
}

void ISR_dma_ch4(void)
{
	IfxCpu_enableInterrupts();
	IfxQspi_SpiMaster_isrDmaReceive(&g_QspiCam.drivers.spiMaster);
//	HLD_GtmTomBeeper_start(Beep_pattern2);
	QspiTest2 ++;
}
#else
IFX_INTERRUPT(ISR_qspi2_Tx, 0, ISR_PRIORITY_QSPI2_TX);
IFX_INTERRUPT(ISR_qspi2_Rx, 0, ISR_PRIORITY_QSPI2_RX);
IFX_INTERRUPT(ISR_qspi2_Er, 0, ISR_PRIORITY_QSPI2_ER);
void ISR_qspi2_Tx(void)
{
    IfxCpu_enableInterrupts();
    IfxQspi_SpiMaster_isrTransmit(&g_Qspi.drivers.spiMaster);
}
void ISR_qspi2_Rx(void)
{
    IfxCpu_enableInterrupts();
    IfxQspi_SpiMaster_isrReceive(&g_Qspi.drivers.spiMaster);
}
void ISR_qspi2_Er(void)
{
    IfxCpu_enableInterrupts();
    IfxQspi_SpiMaster_isrError(&g_Qspi.drivers.spiMaster);
}
#endif

static void HLD_QspiModule_init(void)
{
	printf("QspiModule_init() called\n");
	IfxQspi_SpiMaster_Config        spiMasterConfig;
	IfxQspi_SpiMaster_ChannelConfig spiMasterChannelConfig;
	Ifx_QSPI                       *qspi2SFR;
	{
		/* create module config */
		IfxQspi_SpiMaster_initModuleConfig(&spiMasterConfig, &MODULE_QSPI2);

		/* set the maximum baudrate */
		spiMasterConfig.base.maximumBaudrate = 10000000;

		/* ISR priorities and interrupt target */
#ifdef DMA_
		spiMasterConfig.base.txPriority    = ISR_PRIORITY_DMA_CH3;
		spiMasterConfig.base.rxPriority    = ISR_PRIORITY_DMA_CH4;
		spiMasterConfig.base.erPriority    = ISR_PRIORITY_QSPI2_ER;
		spiMasterConfig.base.isrProvider   = (IfxSrc_Tos)IfxCpu_getCoreIndex();
		spiMasterConfig.dma.txDmaChannelId = IFX_QSPI2_TX_CHANNELID;
		spiMasterConfig.dma.rxDmaChannelId = IFX_QSPI2_RX_CHANNELID;
		spiMasterConfig.dma.useDma         = 1;
#else
		spiMasterConfig.base.txPriority    = ISR_PRIORITY_QSPI2_TX;
		spiMasterConfig.base.rxPriority    = ISR_PRIORITY_QSPI2_RX;
		spiMasterConfig.base.erPriority    = ISR_PRIORITY_QSPI2_ER;
		spiMasterConfig.base.isrProvider   = (IfxSrc_Tos)IfxCpu_getCoreIndex();
#endif
//		spiMasterConfig.txFifoMode		   = IfxQspi_FifoMode_singleMove;
//		spiMasterConfig.rxFifoMode		   = IfxQspi_FifoMode_singleMove;
		spiMasterConfig.rxFifoThreshold = IfxQspi_RxFifoInt_1;
		/* pin configuration */
/*		const IfxQspi_SpiMaster_Pins pins = {&IfxQspi2_SCLK_P15_6_OUT,                                SCLK
				IfxPort_OutputMode_pushPull,
				&IfxQspi2_MTSR_P15_5_OUT,  IfxPort_OutputMode_pushPull,  MTSR
				&IfxQspi2_MRSTB_P15_7_IN,  IfxPort_InputMode_pullDown,   MRST
				IfxPort_PadDriver_cmosAutomotiveSpeed3                    pad driver mode
		};*/
		const IfxQspi_SpiMaster_Pins pins = {&QSPI2_SCLK,                               /* SCLK */
				IfxPort_OutputMode_pushPull,
				&QSPI2_MTSR,  IfxPort_OutputMode_pushPull, /* MTSR */
//				&QSPI2_MRST,  IfxPort_InputMode_pullDown,  /* MRST */
				&QSPI2_MRST,  IfxPort_InputMode_pullUp,  /* MRST */
//				&QSPI2_MRST,  IfxPort_InputMode_noPullDevice,  /* MRST */
				IfxPort_PadDriver_cmosAutomotiveSpeed3                   /* pad driver mode */
		};
		spiMasterConfig.pins = &pins;

		/* initialize module */
		IfxQspi_SpiMaster_initModule(&g_Qspi.drivers.spiMaster, &spiMasterConfig);
#ifdef DMA_
		{
			qspi2SFR = spiMasterConfig.qspi;
			volatile Ifx_SRC_SRCR *src = IfxQspi_getErrorSrc(qspi2SFR);
			IfxSrc_init(src, (IfxSrc_Tos)IfxCpu_getCoreIndex(), ISR_PRIORITY_QSPI2_ER);
			IfxSrc_enable(src);
		}
#endif
	}

	{
		/* create channel config */
		IfxQspi_SpiMaster_initChannelConfig(&spiMasterChannelConfig,
				&g_Qspi.drivers.spiMaster);

		/* set the baudrate for this channel */
		spiMasterChannelConfig.base.baudrate = 1000000;
//		spiMasterChannelConfig.base.baudrate = 500000;
		spiMasterChannelConfig.channelBasedCs  = IfxQspi_SpiMaster_ChannelBasedCs_disabled;
		spiMasterChannelConfig.base.mode.shiftClock = SpiIf_ShiftClock_shiftTransmitDataOnLeadingEdge;
		//spiMasterChannelConfig.base.mode.shiftClock = SpiIf_ShiftClock_shiftTransmitDataOnTrailingEdge;
		spiMasterChannelConfig.base.mode.clockPolarity = SpiIf_ClockPolarity_idleHigh;
		//spiMasterChannelConfig.base.mode.clockPolarity = SpiIf_ClockPolarity_idleLow;

		const IfxQspi_SpiMaster_Output slsOutput = {&QSPI2_SLSO9,
				IfxPort_OutputMode_pushPull,
				IfxPort_PadDriver_cmosAutomotiveSpeed1};
//				IfxPort_PadDriver_cmosAutomotiveSpeed3};

		spiMasterChannelConfig.sls.output.pin    = slsOutput.pin;
		spiMasterChannelConfig.sls.output.mode   = slsOutput.mode;
		spiMasterChannelConfig.sls.output.driver = slsOutput.driver;

		/* initialize channel */
		IfxQspi_SpiMaster_initChannel(&g_Qspi.drivers.spiMasterChannel,
				&spiMasterChannelConfig);
	}
	printf("QspiModule initialized\n");
}





void HLD_Qspi_init(void)
{
	printf("Qspi_init() called\n");
	/* disable interrupts */
    boolean interruptState = IfxCpu_disableInterrupts();

	HLD_QspiModule_init();

	printf("Qspi initialized\n");
	/* enable interrupts again */
	IfxCpu_restoreInterrupts(interruptState);
}


/*
void HLD_Qspi_writeReg(uint8 address, uint8 value)
{
	uint8 tx[2]={address,value};
	while( IfxQspi_SpiMaster_getStatus(&g_Qspi.drivers.spiMasterChannel) == SpiIf_Status_busy );
	// send/receive new stream
	IfxQspi_SpiMaster_exchange(&g_Qspi.drivers.spiMasterChannel, tx, NULL_PTR, 2);
}

uint8 HLD_Qspi_readReg(uint8 address)
{
	uint8 tx[2]={(0b10000000|address),0x00};

	IfxQspi_SpiMaster_exchange(&g_Qspi.drivers.spiMasterChannel, tx, g_Qspi.rx, 2);
	waitTime(TimeConst_10us*3);
	return g_Qspi.rx[0];
}

sint16 HLD_Qspi_getSint16(uint8 addressLow,uint8 addressHigh)
{
	uint8 lowbyte;
	uint8 highbyte;
	lowbyte=HLD_Qspi_readReg(addressLow);
	highbyte=HLD_Qspi_readReg(addressHigh);
	return (sint16)((uint16)(highbyte<<8)|lowbyte);
}

*/
#if QSPI_DEFAULT == QSPI_DEFAULT_MPU9250

void HLD_Qspi_writeReg(uint8 address, uint8 value)
{
	HLD_Qspi_Mpu9250_writeReg(address, value);
}
uint8 HLD_Qspi_readReg(uint8 address)
{
	return HLD_Qspi_Mpu9250_readReg(address);
}
sint16 HLD_Qspi_getSint16(uint8 addressLow,uint8 addressHigh)
{
	return HLD_Qspi_Mpu9250_getSint16(addressLow,addressHigh);
}

#else
void HLD_Qspi_writeReg(uint8 address, uint8 value)
{

}
uint8 HLD_Qspi_readReg(uint8 address)
{
	return 0;
}
sint16 HLD_Qspi_getSint16(uint8 addressLow,uint8 addressHigh)
{
	return 0;
}
#endif
