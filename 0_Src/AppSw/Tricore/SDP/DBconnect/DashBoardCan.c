#include "DashBoardCan.h"



#define STARTBTNPushedCanMSg 0x011

#define STARTBTNMirrorCanMSg 0x010

StartBtnPushed_t StartBtnPushed;
StartBtnPushed_t StartBtnMirror;

CanCommunication_Message StartBtnPushedMsg;
CanCommunication_Message StartBtnMirrorMsg;
    
boolean RTD_flag;
boolean pastRTD_flag = 0;

boolean DashBoard_RTD_Status = 0;

// CanCommunication_Message ShockCanMsg1;

void SDP_DashBoardCan_init(void);
void SDP_DashBoardCan_run_10ms(void);
boolean SDP_DashBoardCan_getDashBoard_RTD_Status();

void SDP_DashBoardCan_init(void){
    /* CAN message init */
	{
        CanCommunication_Message_Config config;
        config.messageId		=	STARTBTNPushedCanMSg;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&StartBtnPushedMsg, &config);
	}
    {
        CanCommunication_Message_Config config2;
        config2.messageId		=	STARTBTNMirrorCanMSg;
        config2.frameType		=	IfxMultican_Frame_transmit;
        config2.dataLen			=	IfxMultican_DataLengthCode_8;
        config2.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&StartBtnMirrorMsg, &config2);
	}
	
}

void SDP_DashBoardCan_run_10ms(void){
    if(CanCommunication_receiveMessage(&StartBtnPushedMsg))
    {
    	StartBtnPushed.RxData[0]      =   StartBtnPushedMsg.msg.data[0];
    	StartBtnPushed.RxData[1]      =   StartBtnPushedMsg.msg.data[1];
    }

    RTD_flag = StartBtnPushed.B.StartBtnPushed;

    if(RTD_flag == 1 && pastRTD_flag ==0){
    	DashBoard_RTD_Status = 1;
    	/* RVC_setR2d에서
        HLD_GtmTomBeeper_start(InvStartPattern);
        CascadiaInverter_initParameterWrite();
        */
    }
    else if(RTD_flag ==0 && pastRTD_flag == 1){
    	DashBoard_RTD_Status = 0;
    	/* RVC_resetR2d에서
        HLD_GtmTomBeeper_start(InvOffPattern);
        CascadiaInverter_disable();
        */
    }

    if (StartBtnPushed.B.OFFvehicle || StartBtnPushed.B.StartBtnPushed ){

        CanCommunication_setMessageData(StartBtnPushed.RxData[0],StartBtnPushed.RxData[1], &StartBtnMirrorMsg);

        CanCommunication_transmitMessage(&StartBtnMirrorMsg);
    }
    pastRTD_flag = RTD_flag;
}

boolean SDP_DashBoardCan_getDashBoard_RTD_Status(void) {
	return DashBoard_RTD_Status;
}
