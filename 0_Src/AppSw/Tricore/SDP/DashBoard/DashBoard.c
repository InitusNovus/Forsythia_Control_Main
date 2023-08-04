#include "DashBoard.h"

#define STARTBTNPushedCanMSg 0x011

#define STARTBTNMirrorCanMSg 0x010
// DashBoardLed_t DashBoardLed;

StartBtnPushed_t StartBtnPushed;
CanCommunication_Message StartBtnPushedMsg;
CanCommunication_Message StartBtnMirrorMsg;
StartBtnPushed_t StartBtnMirror;

DashBoardLed_t DashBoardLed;

uint16 START_BTNCount = 0;
boolean RTDon=0;
IFX_EXTERN boolean DashBoardSendMessage;

void SDP_Dashboard_can_init();

static void SDP_DashBoardedLed_indicator_init(indicator_t *dashBoard,Ifx_P *Module, uint8 port){
    dashBoard->module=Module;
    dashBoard->port=port;
    IfxPort_setPinMode(Module, port,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinPadDriver(Module, port, IfxPort_PadDriver_cmosAutomotiveSpeed1);
}


void SDP_DashBoardLed_init(){

    SDP_DashBoardedLed_indicator_init(&DashBoardLed.TEMP1,&MODULE_P00,7);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.TEMP2,&MODULE_P33,2);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.RTD,&MODULE_P00,6);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.SDC,&MODULE_P00,5);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.ECU,&MODULE_P00,11);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.BSPD,&MODULE_P00,4);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.IMD,&MODULE_P00,10);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.AMS,&MODULE_P00,3);

    IfxPort_setPinMode(&MODULE_P00, 1,  IfxPort_Mode_inputPullUp);
}

void SDP_Dashboard_can_init()
{
	{
		CanCommunication_Message_Config config;
		config.messageId = STARTBTNPushedCanMSg;
		config.frameType = IfxMultican_Frame_transmit;
		config.dataLen = IfxMultican_DataLengthCode_8;
		config.node = &CanCommunication_canNode0;
		CanCommunication_initMessage(&StartBtnPushedMsg, &config);
	}

	{
		CanCommunication_Message_Config config2;
		config2.messageId = STARTBTNMirrorCanMSg;
		config2.frameType = IfxMultican_Frame_receive;
		config2.dataLen = IfxMultican_DataLengthCode_8;
		config2.node = &CanCommunication_canNode0;
		CanCommunication_initMessage(&StartBtnMirrorMsg, &config2);
	}
}

static void SDP_Dashboard_LED(Ifx_P* Module,uint8 port,boolean val){
    if(val)
    IfxPort_setPinHigh(Module, port);
    else
    IfxPort_setPinLow(Module, port);
}

void SDP_DashBoardMirrorCan(){
    if(CanCommunication_receiveMessage(&StartBtnMirrorMsg))
    {
    	StartBtnMirror.TxData[0]      =   StartBtnMirrorMsg.msg.data[0];
    	StartBtnMirror.TxData[1]      =   StartBtnMirrorMsg.msg.data[1];
    }
}
volatile uint32 CNT_DashBoardCanSend = 0;
void SDP_DashBoardCanSend(){
    
    StartBtnPushed.B.Remain1 = 12345;
    CanCommunication_setMessageData(StartBtnPushed.TxData[0],StartBtnPushed.TxData[1], &StartBtnPushedMsg);
    CanCommunication_transmitMessage(&StartBtnPushedMsg);

    CNT_DashBoardCanSend++;
}

void SDP_DashBoardLed_run_10ms(){

    if (IfxPort_getPinState(&MODULE_P00,1)==0){
    // if (TRUE){
        START_BTNCount++;
        if (RTDon==FALSE && START_BTNCount %60 == 0 ){
            IfxPort_setPinHigh(DashBoardLed.TEMP1.module,DashBoardLed.TEMP1.port);
        }
        // else if(RTDon==TRUE && START_BTNCount %60 == 0 ){
        //     IfxPort_setPinHigh(DashBoardLed.SDC.module,DashBoardLed.SDC.port);
        // }

        if (RTDon==FALSE && START_BTNCount %120 == 0){
            IfxPort_setPinHigh(DashBoardLed.TEMP2.module,DashBoardLed.TEMP2.port);
        }
        // else if(RTDon==TRUE && START_BTNCount %120 == 0 ){
        //     IfxPort_setPinHigh(DashBoardLed.RTD.module,DashBoardLed.RTD.port);
        // }

        if (RTDon==FALSE && START_BTNCount %180 == 0){
            IfxPort_setPinHigh(DashBoardLed.RTD.module,DashBoardLed.RTD.port);
        }
        // else if(RTDon==TRUE && START_BTNCount %180 == 0 ){
        //     IfxPort_setPinHigh(DashBoardLed.TEMP2.module,DashBoardLed.TEMP2.port);
        // }

        if (RTDon==FALSE && START_BTNCount %240 == 0){
            IfxPort_setPinHigh(DashBoardLed.SDC.module,DashBoardLed.SDC.port);
        }
        // else if(RTDon==TRUE && START_BTNCount %240 == 0 ){
        //     IfxPort_setPinHigh(DashBoardLed.TEMP1.module,DashBoardLed.TEMP1.port);
        // }

        if (RTDon==FALSE && START_BTNCount>300){
            StartBtnPushed.B.StartBtnPushed = TRUE;
            StartBtnPushed.B.OFFvehicle     = FALSE;
            while(TRUE){
                DashBoardSendMessage = TRUE;
                SDP_DashBoardMirrorCan();
                if (StartBtnMirror.B.StartBtnPushed){
                    DashBoardSendMessage =FALSE;
                    break;
                }
            }
            START_BTNCount = 0;
            RTDon = TRUE;
            IfxPort_setPinLow(DashBoardLed.TEMP1.module,DashBoardLed.TEMP1.port);
            IfxPort_setPinLow(DashBoardLed.TEMP2.module,DashBoardLed.TEMP2.port);
            IfxPort_setPinLow(DashBoardLed.RTD.module,DashBoardLed.RTD.port);
            IfxPort_setPinLow(DashBoardLed.SDC.module,DashBoardLed.SDC.port);
        }
        else if (RTDon==TRUE && START_BTNCount>300){
            StartBtnPushed.B.StartBtnPushed = FALSE;
            StartBtnPushed.B.OFFvehicle     = TRUE;
            
            CanCommunication_setMessageData(StartBtnPushed.TxData[0],StartBtnPushed.TxData[1], &StartBtnPushedMsg);
            CanCommunication_transmitMessage(&StartBtnPushedMsg);
            START_BTNCount=0;
            RTDon = FALSE;
            IfxPort_setPinLow(DashBoardLed.TEMP1.module,DashBoardLed.TEMP1.port);
            IfxPort_setPinLow(DashBoardLed.TEMP2.module,DashBoardLed.TEMP2.port);
            IfxPort_setPinLow(DashBoardLed.RTD.module,DashBoardLed.RTD.port);
            IfxPort_setPinLow(DashBoardLed.SDC.module,DashBoardLed.SDC.port);
        }
        StartBtnPushed.B.StartBtnPushed = FALSE;
        StartBtnPushed.B.OFFvehicle     = FALSE;
    }
    else{
        if (START_BTNCount>0)START_BTNCount=0;
        SDP_Dashboard_LED(DashBoardLed.TEMP1.module,DashBoardLed.TEMP1.port,DashBoardLed.TEMP1.val);
        SDP_Dashboard_LED(DashBoardLed.TEMP2.module,DashBoardLed.TEMP2.port,DashBoardLed.TEMP2.val);
        SDP_Dashboard_LED(DashBoardLed.RTD.module,DashBoardLed.RTD.port,DashBoardLed.RTD.val);
        SDP_Dashboard_LED(DashBoardLed.SDC.module,DashBoardLed.SDC.port,DashBoardLed.SDC.val);
        SDP_Dashboard_LED(DashBoardLed.ECU.module,DashBoardLed.ECU.port,DashBoardLed.ECU.val);
        SDP_Dashboard_LED(DashBoardLed.BSPD.module,DashBoardLed.BSPD.port,DashBoardLed.BSPD.val);
        SDP_Dashboard_LED(DashBoardLed.IMD.module,DashBoardLed.IMD.port,DashBoardLed.IMD.val);
        SDP_Dashboard_LED(DashBoardLed.AMS.module,DashBoardLed.AMS.port,DashBoardLed.AMS.val);
    }

    
}