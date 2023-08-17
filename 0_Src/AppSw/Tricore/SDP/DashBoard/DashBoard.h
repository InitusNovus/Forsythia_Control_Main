#include "HLD.h"
#include <Port/Io/IfxPort_Io.h>
#include "Configuration.h"
#include "CanCommunication.h"
#include "Gpio_Debounce.h"

IFX_EXTERN void SDP_DashBoardLed_init();
IFX_EXTERN void SDP_TEMP1_LED_ON();
IFX_EXTERN void SDP_TEMP1_LED_OFF();
IFX_EXTERN void SDP_TEMP2_LED_ON();
IFX_EXTERN void SDP_TEMP2_LED_OFF();
IFX_EXTERN void SDP_RTD_LED_ON();
IFX_EXTERN void SDP_RTD_LED_OFF();
IFX_EXTERN void SDP_SDC_LED_ON();
IFX_EXTERN void SDP_SDC_LED_OFF();
IFX_EXTERN void SDP_ECU_LED_ON();
IFX_EXTERN void SDP_ECU_LED_OFF();
IFX_EXTERN void SDP_BSPD_LED_ON();
IFX_EXTERN void SDP_BSPD_LED_OFF();
IFX_EXTERN void SDP_IMD_LED_ON();
IFX_EXTERN void SDP_IMD_LED_OFF();
IFX_EXTERN void SDP_AMS_LED_ON();
IFX_EXTERN void SDP_AMS_LED_OFF();

typedef struct{
    Ifx_P* module;
    uint8 port;
    boolean val;
}indicator_t;

typedef struct{
    indicator_t TEMP1;
    indicator_t TEMP2;
    indicator_t RTD;
    indicator_t SDC;
    indicator_t ECU;
    indicator_t BSPD;
    indicator_t IMD;
    indicator_t AMS;
}DashBoardLed_t;

typedef union{
	uint32 TxData[2];
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
} DashBoardMsg0_t;

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

IFX_EXTERN void SDP_Dashboard_can_init();

// IFX_EXTERN boolean DashBoardSendMessage;

IFX_EXTERN StartBtnPushed_t StartBtnPushed;
IFX_EXTERN StartBtnPushed_t StartBtnMirror;

IFX_EXTERN DashBoardLed_t DashBoardLed;
