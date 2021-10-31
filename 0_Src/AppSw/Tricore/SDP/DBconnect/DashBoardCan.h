#include "HLD.h"
#include <Port/Io/IfxPort_Io.h>
#include "Configuration.h"
#include "CanCommunication.h"
#include "Gpio_Debounce.h"




typedef union{
	uint32 RxData[2];
	struct{
		uint8 StartBtnPushed : 1;
        uint8 OFFvehicle : 1;
		uint32 Remain1 : 30;
        uint32 Remain2;
	}B;

}StartBtnPushed_t;

IFX_EXTERN StartBtnPushed_t StartBtnPushed;
IFX_EXTERN StartBtnPushed_t StartBtnMirror;

IFX_EXTERN void SDP_DashBoardCan_init(void);
IFX_EXTERN void SDP_DashBoardCan_run_10ms(void);