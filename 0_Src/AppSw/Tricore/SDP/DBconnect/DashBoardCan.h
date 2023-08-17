#ifndef DASHBOARDCAN_H_
#define DASHBOARDCAN_H_

#include "HLD.h"
#include <Port/Io/IfxPort_Io.h>
#include "Configuration.h"
#include "CanCommunication.h"
#include "Gpio_Debounce.h"
#include "AmkInverter_can.h"
#include "Platform_Types.h"


typedef union{
	uint32 RxData[2];
	struct{
		uint8 StartBtnPushed : 1;
        uint8 OFFvehicle : 1;
		uint32 Remain1 : 30;
        uint32 Remain2;
	}B;

}StartBtnPushed_t;

typedef union 
{
	uint32 data[2];				//[0-31][32-63]
	struct 
	{
		uint8 AmkState;				//[0-7]
		boolean SdcAmsOk		:1;	//[8]
		boolean SdcImdOk		:1;	//[9]
		boolean SdcBspdOk		:1; //[10]
		boolean SdcSen			:1;	//[11]
		boolean tsalOn			:1;	//[12]
		boolean reserved0		:3;	//[13-15]
		uint16 startCnt			:16;//[16-31]
		uint32 reserved2		:32;//[32-63]
	}B;
} DashBoardMsg0_t;;

typedef union 
{
	uint32 data[2];				//[0-31][32-63]
	struct 
	{
		boolean StartBtn		:1;	//[0]
		uint16 reserved0		:15;//[1-15]
		uint16 startCntMirror	:16;//[16-31]
		uint32 reserved2		:32;//[32-63]
	}B;
} DashBoardMsg1_t;

typedef struct 
{
	boolean bmsOk;
	boolean imdOk;
	boolean bspdOk;
	boolean sdcSenFinal;
	boolean brakeOn;
	boolean tsalOn;
}DashBoard_info_t;

typedef struct
{
	DashBoard_info_t data;
	struct 
	{
		DashBoard_info_t data;
		IfxCpu_mutexLock mutex;
	}shared;
}DashBoard_public_t;

IFX_EXTERN StartBtnPushed_t StartBtnPushed;
IFX_EXTERN StartBtnPushed_t StartBtnMirror;

IFX_EXTERN DashBoard_public_t DashBoard_public;
IFX_EXTERN boolean RTD_flag;

IFX_EXTERN void SDP_DashBoardCan_init(void);
IFX_EXTERN void SDP_DashBoardCan_run_1ms(void);
IFX_EXTERN void SDP_DashBoardCan_run_10ms(void);

#endif