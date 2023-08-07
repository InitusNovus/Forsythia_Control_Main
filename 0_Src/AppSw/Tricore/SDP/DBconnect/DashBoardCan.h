#ifndef DASHBOARDCAN_H_
#define DASHBOARDCAN_H_

#include "HLD.h"
#include <Port/Io/IfxPort_Io.h>
#include "Configuration.h"
#include "CanCommunication.h"
#include "Gpio_Debounce.h"
#include "AmkInverter_can.h"



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
	uint32 data[2];				//[0-31][32-64]
	struct 
	{
		uint8 AmkState;				//[0-7]
		boolean SdcAmsOk		:1;	//[8]
		boolean SdcImdOk		:1;	//[9]
		boolean SdcBspdOk		:1; //[10]
		boolean SdcSen			:1;	//[11]
		boolean reserved0		:4;	//[12-15]
		uint32 reserved1		:16;//[16-32]
	}B;
} DashBoardMsg0_t;

typedef struct 
{
	boolean bmsOk;
	boolean imdOk;
	boolean bspdOk;
	boolean sdcSenFinal;
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
IFX_EXTERN void SDP_DashBoardCan_run_10ms(void);

#endif