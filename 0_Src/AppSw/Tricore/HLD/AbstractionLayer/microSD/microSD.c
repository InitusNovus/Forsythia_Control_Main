/*
 * microSD.c
 *
 *  Created on: 2020. 3. 30.
 *      Author: Hohyon_Choi
 */



/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/

#include "microSD.h"
#include "HLD.h"
#include "diskio.h"
#include "SysSe/Bsp/Bsp.h"
#include "IfxScuWdt.h"
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
typedef struct{
	uint8 cardType;
	uint8 powerFlag;
	DSTATUS stat;
}microSD_t;

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/

HLD_microSD_t HLD_microSD;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/
microSD_t		g_microSD = {
		.stat = STA_NOINIT,
		.powerFlag = 0
};

int ctest;
uint8 result1;
uint8 rxbyte;
uint32 cnt11;
uint8  ocrtest[4];
uint8 testtype;

char cmd6test[200];

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/

/***************************************
 * SD functions
 **************************************/

/* wait SD ready */
static uint8 HLD_microSD_ReadyWait(void)
{
	uint8 res;

	/* timeout 500ms */
	HLD_microSD.timer2 = 500;

	/* if SD goes ready, receives 0xFF */
	do {
		res = HLD_microSD_RxByte();
	} while ((res != 0xFF) && HLD_microSD.timer2);
	result1 = res;

	return res;
}

/* power on */
static void HLD_microSD_PowerOn(void)
{
	uint8 args[6];

#ifdef SCOPETEST_
	uint32 cnt = 0xF;
#else
	uint32 cnt = 0x1FFF;
#endif



	/* transmit bytes to wake up */
	// HLD_microSD_slaveDeselect();
	for(ctest = 0; ctest < 10; ctest++)
	{
		HLD_microSD_TxByte(0xFF);
	}

	/* slave select */
	// HLD_microSD_slaveSelect();

	/* make idle state */
	args[0] = CMD0;		/* CMD0:GO_IDLE_STATE */
	args[1] = 0;
	args[2] = 0;
	args[3] = 0;
	args[4] = 0;
	args[5] = 0x95;		/* CRC */

	HLD_microSD_TxBuffer(args, sizeof(args));

	//uint8 rx;

	/* wait response */
/*	while ((HLD_microSD_RxByte() != 0x01) && cnt)
	{
		cnt--;
	}*/

	do{
		rxbyte = HLD_microSD_RxByte();
		cnt--;
	}while((rxbyte != 0x01) && cnt);

	cnt11 = cnt;

	// HLD_microSD_slaveDeselect();
	HLD_microSD_TxByte(0XFF);

	g_microSD.powerFlag = 1;
}

/* power off */
static void HLD_microSD_PowerOff(void)
{
	g_microSD.powerFlag = 0;
}

/* check power flag */
static uint8 HLD_microSD_CheckPower(void)
{
	return g_microSD.powerFlag;
}

/* receive data block */
static boolean HLD_microSD_RxDataBlock(BYTE *buff, UINT len)
{
	uint8 token;

	/* timeout 200ms */
	HLD_microSD.timer1 = 200;

	/* loop until receive a response or timeout */
	do {
		token = HLD_microSD_RxByte();
	} while((token == 0xFF) && HLD_microSD.timer1);

	/* invalid response */
	if(token != 0xFE) return FALSE;

	/* receive data */
	do {
		HLD_microSD_RxBytePtr(buff++);
	} while(len--);

	/* discard CRC */
	HLD_microSD_RxByte();
	HLD_microSD_RxByte();

	return TRUE;
}

/* transmit data block */
#if _USE_WRITE == 1
static boolean HLD_microSD_TxDataBlock(const uint8 *buff, BYTE token)
{
	uint8 resp;
	uint8 i = 0;

	/* wait SD ready */
	if (HLD_microSD_ReadyWait() != 0xFF) return FALSE;

	/* transmit token */
	HLD_microSD_TxByte(token);

	/* if it's not STOP token, transmit data */
	if (token != 0xFD)
	{
		HLD_microSD_TxBuffer((uint8*)buff, 512);

		/* discard CRC */
		HLD_microSD_RxByte();
		HLD_microSD_RxByte();

		/* receive response */
		while (i <= 64)
		{
			resp = HLD_microSD_RxByte();

			/* transmit 0x05 accepted */
			if ((resp & 0x1F) == 0x05) break;
			i++;
		}

		/* recv buffer clear */
		while (HLD_microSD_RxByte() == 0);
	}

	/* transmit 0x05 accepted */
	if ((resp & 0x1F) == 0x05) return TRUE;

	return FALSE;
}
#endif /* _USE_WRITE */

/* transmit command */
static BYTE HLD_microSD_SendCmd(BYTE cmd, uint32 arg)
{
	uint8 crc, res;

	/* wait SD ready */
	if (HLD_microSD_ReadyWait() != 0xFF) return 0xFF;
	//printf("sd ready finished \n");

	/* transmit command */
	HLD_microSD_TxByte(cmd); 					/* Command */
	HLD_microSD_TxByte((uint8)(arg >> 24)); 	/* Argument[31..24] */
	HLD_microSD_TxByte((uint8)(arg >> 16)); 	/* Argument[23..16] */
	HLD_microSD_TxByte((uint8)(arg >> 8)); 	/* Argument[15..8] */
	HLD_microSD_TxByte((uint8)arg); 			/* Argument[7..0] */

	/* prepare CRC */
	if(cmd == CMD0) crc = 0x95;	/* CRC for CMD0(0) */
	else if(cmd == CMD8) crc = 0x87;	/* CRC for CMD8(0x1AA) */
	else crc = 1;

	/* transmit CRC */
	HLD_microSD_TxByte(crc);

	/* Skip a stuff byte when STOP_TRANSMISSION */
	if (cmd == CMD12) HLD_microSD_RxByte();

	/* receive response */
	uint8 n = 10;
	do {
		res = HLD_microSD_RxByte();
	} while ((res & 0x80) && --n);

	return res;
}

/***************************************
 * user_diskio.c functions
 **************************************/

/* initialize SD */
DSTATUS HLD_microSD_disk_initialize(BYTE drv)
{
	uint8 n, type, ocr[4];

	/* single drive, drv should be 0 */
	if(drv) return STA_NOINIT;

	/* no disk */
	if(g_microSD.stat & STA_NODISK) return g_microSD.stat;

	/* power on */
	HLD_microSD_PowerOn();

	/* slave select */
	HLD_microSD_slaveSelect();
	//printf("PowerOn finished \n");



	/* check disk type */
	type = 0;

	//IfxQspi_SpiMaster_setChannelBaudrate(&g_microSD.drivers.spiMasterChannel, 30000000);

	/* send GO_IDLE_STATE command */
	if (HLD_microSD_SendCmd(CMD0, 0) == 1)
	{

		/* timeout 1 sec */
		HLD_microSD.timer1 = 1000;

		/* SDC V2+ accept CMD8 command, http://elm-chan.org/docs/mmc/mmc_e.html */
		if (HLD_microSD_SendCmd(CMD8, 0x1AA) == 1)
		{

			/* operation condition register */
			for (n = 0; n < 4; n++)
			{
				ocr[n] = HLD_microSD_RxByte();
			}

			/* voltage range 2.7-3.6V */
			if (ocr[2] == 0x01 && ocr[3] == 0xAA)
			{

				/* ACMD41 with HCS bit */
				do {
					if (HLD_microSD_SendCmd(CMD55, 0) <= 1 && HLD_microSD_SendCmd(CMD41, 1UL << 30) == 0) break;
				} while (HLD_microSD.timer1);

				/* READ_OCR */
				if (HLD_microSD.timer1 && HLD_microSD_SendCmd(CMD58, 0) == 0)
				{

					/* Check CCS bit */
					for (n = 0; n < 4; n++)
					{
						ocrtest[n] = HLD_microSD_RxByte();
						ocr[n] = HLD_microSD_RxByte();
					}

					/* SDv2 (HC or SC) */
					type = (ocr[0] & 0x40) ? CT_SD2 | CT_BLOCK : CT_SD2;
					testtype = type;
				}
			}
		}
		else
		{
			/* SDC V1 or MMC */
			type = (HLD_microSD_SendCmd(CMD55, 0) <= 1 && HLD_microSD_SendCmd(CMD41, 0) <= 1) ? CT_SD1 : CT_MMC;

			do
			{
				if (type == CT_SD1)
				{
					if (HLD_microSD_SendCmd(CMD55, 0) <= 1 && HLD_microSD_SendCmd(CMD41, 0) == 0) break; /* ACMD41 */
				}
				else
				{
					if (HLD_microSD_SendCmd(CMD1, 0) == 0) break; /* CMD1 */
				}

			} while (HLD_microSD.timer1);

			/* SET_BLOCKLEN */
			if (!HLD_microSD.timer1 || HLD_microSD_SendCmd(CMD16, 512) != 0) type = 0;
		}
	}

	g_microSD.cardType = type;

/*	{
		 //wait SD ready
		if (HLD_microSD_ReadyWait() == 0xFF)
		{
			printf("start sending cmd6 \n");

			 //transmit command
			HLD_microSD_TxByte(CMD6); 					 //Command
			HLD_microSD_TxByte(0x80); 	 //Argument[31..24]
			HLD_microSD_TxByte(0xFF); 	 //Argument[23..16]
			HLD_microSD_TxByte(0x11); 	 //Argument[15..8]
			HLD_microSD_TxByte(0xF1); 			 //Argument[7..0]
			HLD_microSD_TxByte(1);

			 //receive response

			for(int i = 0; i<200; i++){
				cmd6test[i] = HLD_microSD_RxByte();
			}
		}
	}*/

	HLD_microSD_slaveDeselect();

	//HLD_microSD_setBaudRate_fastmode();

	/* Idle */
	HLD_microSD_slaveDeselect();
	HLD_microSD_RxByte();

	/* Clear STA_NOINIT */
	if (g_microSD.cardType)
	{
		g_microSD.stat &= ~STA_NOINIT;

	}
	else
	{
		/* Initialization failed */
		HLD_microSD_PowerOff();
		printf("MicroSD initialization failed\n");
	}

	//fprintf("g_microSD.stat = %d",g_microSD.stat);

	return g_microSD.stat;
}

/* return disk status */
DSTATUS HLD_microSD_disk_status(BYTE drv)
{
	if (drv) return STA_NOINIT;
	return g_microSD.stat;
}

/* read sector */
DRESULT HLD_microSD_disk_read(BYTE pdrv, BYTE* buff, DWORD sector, UINT count)
{
	/* pdrv should be 0 */
	if (pdrv || !count) return RES_PARERR;

	/* no disk */
	if (g_microSD.stat & STA_NOINIT) return RES_NOTRDY;

	/* convert to byte address */
	if (!(g_microSD.cardType & CT_SD2)) sector *= 512;

	HLD_microSD_slaveSelect();

	if (count == 1)
	{
		/* READ_SINGLE_BLOCK */
		if ((HLD_microSD_SendCmd(CMD17, sector) == 0) && HLD_microSD_RxDataBlock(buff, 512)) count = 0;
	}
	else
	{
		/* READ_MULTIPLE_BLOCK */
		if (HLD_microSD_SendCmd(CMD18, sector) == 0)
		{
			do {
				if (!HLD_microSD_RxDataBlock(buff, 512)) break;
				buff += 512;
			} while (--count);

			/* STOP_TRANSMISSION */
			HLD_microSD_SendCmd(CMD12, 0);
		}
	}

	/* Idle */
	HLD_microSD_slaveDeselect();
	HLD_microSD_RxByte();

	return count ? RES_ERROR : RES_OK;
}

/* write sector */
#if _USE_WRITE == 1
DRESULT HLD_microSD_disk_write(BYTE pdrv, const BYTE* buff, DWORD sector, UINT count)
{
	/* pdrv should be 0 */
	if (pdrv || !count) return RES_PARERR;

	/* no disk */
	if (g_microSD.stat & STA_NOINIT) return RES_NOTRDY;

	/* write protection */
	if (g_microSD.stat & STA_PROTECT) return RES_WRPRT;

	/* convert to byte address */
	if (!(g_microSD.cardType & CT_SD2)) sector *= 512;

	HLD_microSD_slaveSelect();

	if (count == 1)
	{
		/* WRITE_BLOCK */
		if ((HLD_microSD_SendCmd(CMD24, sector) == 0) && HLD_microSD_TxDataBlock(buff, 0xFE))
			count = 0;
	}
	else
	{
		/* WRITE_MULTIPLE_BLOCK */
		if (g_microSD.cardType & CT_SD1)
		{
			HLD_microSD_SendCmd(CMD55, 0);
			HLD_microSD_SendCmd(CMD23, count); /* ACMD23 */
		}

		if (HLD_microSD_SendCmd(CMD25, sector) == 0)
		{
			do {
				if(!HLD_microSD_TxDataBlock(buff, 0xFC)) break;
				buff += 512;
			} while (--count);

			/* STOP_TRAN token */
			if(!HLD_microSD_TxDataBlock(0, 0xFD))
			{
				count = 1;
			}
		}
	}

	/* Idle */
	HLD_microSD_slaveDeselect();
	HLD_microSD_RxByte();

	return count ? RES_ERROR : RES_OK;
}
#endif /* _USE_WRITE */

/* ioctl */
DRESULT HLD_microSD_disk_ioctl(BYTE drv, BYTE ctrl, void *buff)
{
	DRESULT res;
	uint8 n, csd[16], *ptr = buff;
	WORD csize;

	/* pdrv should be 0 */
	if (drv) return RES_PARERR;
	res = RES_ERROR;

	if (ctrl == CTRL_POWER)
	{
		switch (*ptr)
		{
		case 0:
			HLD_microSD_PowerOff();		/* Power Off */
			res = RES_OK;
			break;
		case 1:
			HLD_microSD_PowerOn();		/* Power On */
			res = RES_OK;
			break;
		case 2:
			*(ptr + 1) = HLD_microSD_CheckPower();
			res = RES_OK;		/* Power Check */
			break;
		default:
			res = RES_PARERR;
		}
	}
	else
	{
		/* no disk */
		if (g_microSD.stat & STA_NOINIT) return RES_NOTRDY;

		HLD_microSD_slaveSelect();

		switch (ctrl)
		{
		case GET_SECTOR_COUNT:
			/* SEND_CSD */
			if ((HLD_microSD_SendCmd(CMD9, 0) == 0) && HLD_microSD_RxDataBlock(csd, 16))
			{
				if ((csd[0] >> 6) == 1)
				{
					/* SDC V2 */
					csize = csd[9] + ((WORD) csd[8] << 8) + 1;
					*(DWORD*) buff = (DWORD) csize << 10;
				}
				else
				{
					/* MMC or SDC V1 */
					n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
					csize = (csd[8] >> 6) + ((WORD) csd[7] << 2) + ((WORD) (csd[6] & 3) << 10) + 1;
					*(DWORD*) buff = (DWORD) csize << (n - 9);
				}
				res = RES_OK;
			}
			break;
		case GET_SECTOR_SIZE:
			*(WORD*) buff = 512;
			res = RES_OK;
			break;
		case CTRL_SYNC:
			if (HLD_microSD_ReadyWait() == 0xFF) res = RES_OK;
			break;
		case MMC_GET_CSD:
			/* SEND_CSD */
			if (HLD_microSD_SendCmd(CMD9, 0) == 0 && HLD_microSD_RxDataBlock(ptr, 16)) res = RES_OK;
			break;
		case MMC_GET_CID:
			/* SEND_CID */
			if (HLD_microSD_SendCmd(CMD10, 0) == 0 && HLD_microSD_RxDataBlock(ptr, 16)) res = RES_OK;
			break;
		case MMC_GET_OCR:
			/* READ_OCR */
			if (HLD_microSD_SendCmd(CMD58, 0) == 0)
			{
				for (n = 0; n < 4; n++)
				{
					*ptr++ = HLD_microSD_RxByte();
				}
				res = RES_OK;
			}
			break;
		default:
			res = RES_PARERR;
			break;
		}

		HLD_microSD_slaveDeselect();
		HLD_microSD_RxByte();
	}

	return res;
}
