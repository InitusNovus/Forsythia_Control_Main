/*
 * microSD.h
 *
 *  Created on: 2020. 3. 30.
 *      Author: Hohyon_Choi
 */

#ifndef _MICROSD_H_
#define _MICROSD_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include "Qspi/SpiMaster/IfxQspi_SpiMaster.h"
#include "ff.h"
#include "diskio.h"

/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/

/* Definitions for MMC/SDC command */
#define CMD0     (0x40+0)     	/* GO_IDLE_STATE */
#define CMD1     (0x40+1)     	/* SEND_OP_COND */
#define CMD6	 (0x40+6)
#define CMD8     (0x40+8)     	/* SEND_IF_COND */
#define CMD9     (0x40+9)     	/* SEND_CSD */
#define CMD10    (0x40+10)    	/* SEND_CID */
#define CMD12    (0x40+12)    	/* STOP_TRANSMISSION */
#define CMD16    (0x40+16)    	/* SET_BLOCKLEN */
#define CMD17    (0x40+17)    	/* READ_SINGLE_BLOCK */
#define CMD18    (0x40+18)    	/* READ_MULTIPLE_BLOCK */
#define CMD23    (0x40+23)    	/* SET_BLOCK_COUNT */
#define CMD24    (0x40+24)    	/* WRITE_BLOCK */
#define CMD25    (0x40+25)    	/* WRITE_MULTIPLE_BLOCK */
#define CMD41    (0x40+41)    	/* SEND_OP_COND (ACMD) */
#define CMD55    (0x40+55)    	/* APP_CMD */
#define CMD58    (0x40+58)    	/* READ_OCR */

/* MMC card type flags (MMC_GET_TYPE) */
#define CT_MMC		0x01		/* MMC ver 3 */
#define CT_SD1		0x02		/* SD ver 1 */
#define CT_SD2		0x04		/* SD ver 2 */
#define CT_SDC		0x06		/* SD */
#define CT_BLOCK	0x08		/* Block addressing */

/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/


typedef struct {
	uint16 timer1;
	uint16 timer2;
}HLD_microSD_t;

/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/

IFX_EXTERN HLD_microSD_t HLD_microSD;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
/*
 * QSPI initialization function
 * */

IFX_EXTERN DSTATUS HLD_microSD_disk_initialize(BYTE drv);
IFX_EXTERN DSTATUS HLD_microSD_disk_status(BYTE drv);
IFX_EXTERN DRESULT HLD_microSD_disk_read(BYTE pdrv, BYTE* buff, DWORD sector, UINT count);
IFX_EXTERN DRESULT HLD_microSD_disk_write(BYTE pdrv, const BYTE* buff, DWORD sector, UINT count);
IFX_EXTERN DRESULT HLD_microSD_disk_ioctl(BYTE drv, BYTE ctrl, void *buff);



/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/


#endif /* 0_SRC_APPSW_TRICORE_HLD_ABSTRACTIONLAYER_MICROSD_MICROSD_H_ */
