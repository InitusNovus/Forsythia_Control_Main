/*
 * MicroSD_Demo.c
 *
 *  Created on: 2020. 4. 14.
 *      Author: Hohyon_Choi
 */


/*************************************************
 * This demo shows how to read/write data in microSD
 * Always create NEW file named "FILENAME"
 * Write and read string, binary data
 *
 * This demo use fatfs library
 * recommend to read this page before usage
 * http://elm-chan.org/fsw/ff/00index_e.html
 *
 * Qspi module baud rate : 20MHz
 * ***********************************************/


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/

#include "MicroSD_Demo.h"
#include <string.h>
#include <stdio.h>

/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define RESULT		MicroSD_Demo_fresult
#define FILENAME	"MicroSD_Demo.bin"

/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef struct{
	FRESULT		mount;
	FRESULT		open;
	FRESULT		read;
	FRESULT		write;
}MicroSD_Demo_fresult_t;

/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
MicroSD_Demo_fresult_t	MicroSD_Demo_fresult;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/

/*
 * FATfs related variables
 */
FIL 	file;
FATFS 	fatfs;


/**********************************
 * Sample variables
 * demo runs correctly when WBuf and RBuf data are same
 *
 * W : Write
 * R : Read
 *
 * String : string data (char)
 * Hex    : variable binary data
 *
 * Buf : buffer(array)
 * btw : bytes to write
 * bw  : bytes written
 * btr : bytes to read
 * br  : bytes read
 * *********************************/
char WStringBuf[100];
UINT WStringbtw = 0;
UINT WStringbw = 0;

UINT WHexBuf[1] = {0};
UINT	WHexbtw = 0;
UINT	WHexbw = 0;
volatile UINT DataBuffer[4];
uint16_t DataCounter=0;
uint64_t addTime=0;
uint64_t ticaddTime=0;

char RStringBuf[100];
UINT RStringbtr = 0;
UINT RStringbr = 0;

float32 RHexBuf[20];
UINT	RHexbtr = 0;
UINT	RHexbr = 0;

recordTime_t recordTime;
/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/


void MicroSD_Demo_mountSD(){
	/*
	 * microSD mount 함수
	 * 가장 먼저 실행해 줘야 파일을 open할 수 있음.
	 * f_mount함수 사용
	 */
	// f_mount(&fatfs, "", 0);
	if((RESULT.mount=f_mount(&fatfs, "", 1)) == FR_OK)
	{
		printf("fmount finished \n");
	}
	else{
		printf("fmount failed \n");
	}
}


void MicroSD_Demo_openFile(){
	/*
	 * file open함수
	 * f_open함수 사용.
	 * FILENAME macro를 수정하여 파일 이름 수정 가능
	 * 3번째 argument를 통해 read, write, create 옵션 조정 가능
	 *
	 * "r"		FA_READ
	 * "r+"		FA_READ | FA_WRITE
	 * "w"		FA_CREATE_ALWAYS | FA_WRITE
	 * "w+"		FA_CREATE_ALWAYS | FA_WRITE | FA_READ
	 * "a"		FA_OPEN_APPEND | FA_WRITE
	 * "a+"		FA_OPEN_APPEND | FA_WRITE | FA_READ
	 * "wx"		FA_CREATE_NEW | FA_WRITE
	 * "w+x"	FA_CREATE_NEW | FA_WRITE | FA_READ
	 *
	 * open이 실패했을 경우 한번 더 시도하도록 함수를 구성해 둠
	 * */

	RESULT.open = f_open(&file, FILENAME, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);

	if(RESULT.open != FR_OK)
	{
		/*if open fails, delay time for stabilization */
		printf("f_open one more try\n");
		waitTime(TimeConst_10ms*2);
		/* try open again*/
		RESULT.open = f_open(&file, FILENAME, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
		if(RESULT.open != FR_OK)
		{
			printf("f_open failed\n");
		}
	}

	/******  CAUTION!!!!!!!!!!!  ******
	 *
	 * f_sync를 해주지 않으면 critical section이 늘어날 수 있으므로,
	 *
	 * open후, write후에는 f_sync를 해주는 것이 매우 권장됨
	 *
	 * 아래 페이지 참고
	 * http://elm-chan.org/fsw/ff/doc/appnote.html#critical
	 *
	 * ******************/
	// f_sync(&file);

}


void MicroSD_Demo_writeString(){
	/*
	 * 문자열 text의 형태로 데이터를 저장
	 * f_write(FIL, * buffer, bytes to write, * bytes to written)
	 * sprintf 함수를 사용한다면 문자열을 변환하고 문자열 길이도 받을 수 있음
	 *
	 * f_sync의 실행시간이 30ms이상으로 매우 긴 편
	 * **********************************************
	 * f_sync를 생략시켜도 되지만 대신 MicroSD_Demo_stop을 꼭 실행시켜야 함
	 * */
	float32 testVar = IFX_PI;

	WStringbtw=sprintf(WStringBuf,"Hello World! test variable = %.6f \n", testVar);
	RESULT.write=f_write(&file,WStringBuf,WStringbtw,&WStringbw);
	f_sync(&file);
}


void MicroSD_Demo_writeHEX(){
	/*
	 * 데이터를 이진 데이터 형태로 그대로 저장
	 * f_write(FIL, * buffer, bytes to write, * bytes to written)
	 * * buffer에 원하는 데이터의 pointer를 대입하면 됨.
	 * bytes to write는 sizeof를 이용하면 쉽게 계산 가능
	 *
	 * */
	// WHexbtw = sizeof(UINT)*DataCounter;

	// RESULT.write = f_write(&file,DataBuffer,WHexbtw,&WHexbw);
	DataCounter = 0;
	// f_sync(&file);

}


void MicroSD_Demo_readString(){
	/*
	 * file에 쓴 부분을 읽는 함수
	 *
	 * f_lseek은 읽기 시작하는 포인트를 옮기는 함수
	 * 맨 처음부터 읽기 위해 0을 넣어줌
	 *
	 * */
	f_lseek(&file, 0);
	RStringbtr = WStringbw;
	RESULT.read = f_read(&file,RStringBuf,RStringbtr,&RStringbr);
}


void MicroSD_Demo_readHex(){
	/*
	 * binary data를 읽는 함수
	 * 앞쪽에 string데이터가 존재하므로 그 부분을 뛰어넘기 위해서
	 * WStringbw만큼 뛰어넘고 읽기 시작
	 *
	 */
	RHexbtr = WHexbw;
	f_lseek(&file, WStringbw);
	RESULT.read = f_read(&file, RHexBuf, RHexbtr,&RStringbr);
}


void MicroSD_Demo_closeFile(){
	/*
	 * Close opened file
	 */
	f_close(&file);
}

void MicroSD_Demo_f_sync(){
	f_sync(&file);
}

void MicroSD_Demo_initSD(){
	MicroSD_Demo_mountSD();
	MicroSD_Demo_openFile();
}


// void MicroSD_Demo_run(){
// 	MicroSD_Demo_writeString();
// 	MicroSD_Demo_writeHEX();
// 	MicroSD_Demo_readString();
// 	MicroSD_Demo_readHex();
// }


void MicroSD_Demo_stop(){
	/*
	 * Always need to run before stop logging
	 *
	 * if not, MicroSD partition may deleted (in worst situation)
	 */
	MicroSD_Demo_closeFile();
}

void MicroSD_Demo_addData(uint32_t ID, uint32_t data[2])
{
	addTime = IfxStm_get(&MODULE_STM0);
	uint64_t BuffTime = 0;
	BuffTime = addTime*1000/(IfxStm_getFrequency(&MODULE_STM0));
	recordTime.time.ms = BuffTime%1000;
	recordTime.time.min = (BuffTime/1000)/60;
	recordTime.time.sec = (BuffTime/1000)%60;

	// if(DataCounter < 256){
		DataBuffer[DataCounter] = recordTime.dataTime;
		DataBuffer[DataCounter+1] = ID;
		DataBuffer[DataCounter+2] = data[0];
		DataBuffer[DataCounter+3] = data[1];
		// DataCounter += 4;
	// }
	// else
	// {
	// 	DataCounter = 0;
	// }
	WHexbtw = sizeof(UINT)*4;
	RESULT.write = f_write(&file,DataBuffer,WHexbtw,&WHexbw);
	ticaddTime = (IfxStm_get(&MODULE_STM0) - addTime)*1000000/(IfxStm_getFrequency(&MODULE_STM0));
}
