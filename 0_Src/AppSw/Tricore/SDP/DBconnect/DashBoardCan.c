#include "DashBoardCan.h"

#define STARTBTNPushedCanMSg 0x011

#define STARTBTNMirrorCanMSg 0x010

StartBtnPushed_t StartBtnPushed;
StartBtnPushed_t StartBtnMirror;

CanCommunication_Message StartBtnPushedMsg;
CanCommunication_Message StartBtnMirrorMsg;

const uint32 DshBrdMsg0 = 0x00081F00UL;
DashBoardMsg0_t DashBoard_canMsg0;
CanCommunication_Message DashBoard_msgObj0;

DashBoard_public_t DashBoard_public;

boolean RTD_flag;
boolean pastRTD_flag = 0;

boolean DashBoard_RTD_Status = 0;

// CanCommunication_Message ShockCanMsg1;

void SDP_DashBoardCan_init(void);
void SDP_DashBoardCan_run_10ms(void);
boolean SDP_DashBoardCan_getDashBoard_RTD_Status();

void SDP_DashBoardCan_init(void)
{
	/* CAN message init */
	{
		CanCommunication_Message_Config config;
		config.messageId = STARTBTNPushedCanMSg;
		config.frameType = IfxMultican_Frame_receive;
		config.dataLen = IfxMultican_DataLengthCode_8;
		config.node = &CanCommunication_canNode0;
		CanCommunication_initMessage(&StartBtnPushedMsg, &config);
	}
	{
		CanCommunication_Message_Config config;
		config.messageId = STARTBTNMirrorCanMSg;
		config.frameType = IfxMultican_Frame_transmit;
		config.dataLen = IfxMultican_DataLengthCode_8;
		config.node = &CanCommunication_canNode0;
		CanCommunication_initMessage(&StartBtnMirrorMsg, &config);
	}
	{
		CanCommunication_Message_Config config;
		config.messageId = DshBrdMsg0;
		config.frameType = IfxMultican_Frame_transmit;
		config.dataLen = IfxMultican_DataLengthCode_4;
		config.node = &CanCommunication_canNode0;
		CanCommunication_initMessage(&DashBoard_msgObj0, &config);
	}
}

void SDP_DashBoardCan_run_10ms(void)
{
	/*RTD button routine*/
	// FIXME: RTD status on VCU only
	if(CanCommunication_receiveMessage(&StartBtnPushedMsg))
	{
		StartBtnPushed.RxData[0] = StartBtnPushedMsg.msg.data[0];
		StartBtnPushed.RxData[1] = StartBtnPushedMsg.msg.data[1];
	}

	RTD_flag = StartBtnPushed.B.StartBtnPushed;

	if(RTD_flag == 1 && pastRTD_flag == 0)
	{
		DashBoard_RTD_Status = 1;
		/* RVC_setR2d
		HLD_GtmTomBeeper_start(InvStartPattern);
		*/
	}
	else if(RTD_flag == 0 && pastRTD_flag == 1)
	{
		DashBoard_RTD_Status = 0;
		/* RVC_resetR2d
		HLD_GtmTomBeeper_start(InvOffPattern);
		*/
	}

	StartBtnMirror.RxData[0] = StartBtnPushed.RxData[0];
	StartBtnMirror.RxData[1] = StartBtnPushed.RxData[1];

	if(StartBtnPushed.B.OFFvehicle || StartBtnPushed.B.StartBtnPushed)
	{

		CanCommunication_setMessageData(StartBtnMirror.RxData[0], StartBtnMirror.RxData[1], &StartBtnMirrorMsg);

		CanCommunication_transmitMessage(&StartBtnMirrorMsg);
	}
	pastRTD_flag = RTD_flag;

	/*Dash Board Info TX*/
	while(IfxCpu_acquireMutex(&DashBoard_public.shared.mutex))
		; // Wait for the mutex
	{
		DashBoard_public.data = DashBoard_public.shared.data;
		IfxCpu_releaseMutex(&DashBoard_public.shared.mutex);
	}

	DashBoard_canMsg0.B.AmkState = (uint8)AmkState;
	DashBoard_canMsg0.B.SdcAmsOk = DashBoard_public.data.bmsOk;
	DashBoard_canMsg0.B.SdcImdOk = DashBoard_public.data.imdOk;
	DashBoard_canMsg0.B.SdcBspdOk = DashBoard_public.data.bspdOk;
	DashBoard_canMsg0.B.SdcSen = DashBoard_public.data.sdcSenFinal;

    CanCommunication_setMessageData(DashBoard_canMsg0.data[0], DashBoard_canMsg0.data[1], &DashBoard_msgObj0);
    CanCommunication_transmitMessage(&DashBoard_msgObj0);
}

boolean SDP_DashBoardCan_getDashBoard_RTD_Status(void)
{
	return DashBoard_RTD_Status;
}
