/*
 * Qspi.h
 *
 *  Created on: 2018. 5. 27.
 *      Author: bigbi_000
 */

#ifndef QSPI_H_
#define QSPI_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include "Qspi/SpiMaster/IfxQspi_SpiMaster.h"

// #include "Qspi_Mpu9250.h"
#include "Qspi_microSD.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define QSPI_DEFAULT_NONE		0
#define QSPI_DEFAULT_MPU9250 	1

// #define QSPI_DEFAULT QSPI_DEFAULT_MPU9250
/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/


typedef struct{
	struct{
        IfxQspi_SpiMaster         spiMaster;        /**< \brief Spi Master handle */
        IfxQspi_SpiMaster_Channel spiMasterChannel;
	}drivers1;

	struct{
        IfxQspi_SpiMaster         spiMaster;        /**< \brief Spi Master handle */
        IfxQspi_SpiMaster_Channel spiMasterChannel;
	}drivers2;
	uint8 rx[2];
}Qspi_t;
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
/*
 * QSPI initialization function
 * */
IFX_EXTERN void HLD_Qspi_init(void);

/*
 * Compatibility layer.
 * QSPI Default functions.
 * Conditionally compiled according to QSPI_DEFAULT macro.
 */
IFX_EXTERN void HLD_Qspi_writeReg(uint8 address, uint8 value);
IFX_EXTERN uint8 HLD_Qspi_readReg(uint8 address);
IFX_EXTERN sint16 HLD_Qspi_getSint16(uint8 addressLow,uint8 addressHigh);




/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/



#endif /* QSPI_H_ */
