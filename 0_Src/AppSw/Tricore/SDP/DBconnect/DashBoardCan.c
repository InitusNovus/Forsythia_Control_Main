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

const uint32 DshBrdMsg1 = 0x00081F01UL;
DashBoardMsg1_t DashBoard_canMsg1;
CanCommunication_Message DashBoard_msgObj1;

DashBoard_public_t DashBoard_public;

boolean RTD_flag = FALSE;
boolean pastRTD_flag = FALSE;

uint16 RTD_cnt = 0;
static const uint16 rtdCntTh = 300;

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
	{
		CanCommunication_Message_Config config;
		config.messageId = DshBrdMsg1;
		config.frameType = IfxMultican_Frame_receive;
		config.dataLen = IfxMultican_DataLengthCode_4;
		config.node = &CanCommunication_canNode0;
		CanCommunication_initMessage(&DashBoard_msgObj1, &config);
	}
}

void SDP_DashBoardCan_reset_pastRTD() {
	pastRTD_flag = 0;
	StartBtnPushed.RxData[0] = 0;
	StartBtnPushed.RxData[1] = 0;
	DashBoard_RTD_Status = 0;
}

void SDP_DashBoardCan_run_1ms(void)
{
	
}

void SDP_DashBoardCan_run_10ms(void)
{
	// /*RTD button routine(Legacy)*/
	// // FIXME: RTD status on VCU only
	// if(CanCommunication_receiveMessage(&StartBtnPushedMsg))
	// {
	// 	StartBtnPushed.RxData[0] = StartBtnPushedMsg.msg.data[0];
	// 	StartBtnPushed.RxData[1] = StartBtnPushedMsg.msg.data[1];
	// }

	// RTD_flag = StartBtnPushed.B.StartBtnPushed;

	// if(RTD_flag == 1 && pastRTD_flag == 0)
	// {
	// 	DashBoard_RTD_Status = 1;
	// 	/* RVC_setR2d
	// 	HLD_GtmTomBeeper_start(InvStartPattern);
	// 	*/
	// }
	// else if(RTD_flag == 0 && pastRTD_flag == 1)
	// {
	// 	DashBoard_RTD_Status = 0;
	// 	/* RVC_resetR2d
	// 	HLD_GtmTomBeeper_start(InvOffPattern);
	// 	*/
	// }

	// pastRTD_flag = RTD_flag;

	// StartBtnMirror.RxData[0] = StartBtnPushed.RxData[0];
	// StartBtnMirror.RxData[1] = StartBtnPushed.RxData[1];

	// if(StartBtnPushed.B.OFFvehicle || StartBtnPushed.B.StartBtnPushed)
	// {

	// 	CanCommunication_setMessageData(StartBtnMirror.RxData[0], StartBtnMirror.RxData[1], &StartBtnMirrorMsg);

	// 	CanCommunication_transmitMessage(&StartBtnMirrorMsg);
	// }

	/*DashBoard_Msg1 RX*/
	if(CanCommunication_receiveMessage(&DashBoard_msgObj1))
	{
		DashBoard_canMsg1.data[0] = DashBoard_msgObj1.msg.data[0];
		DashBoard_canMsg1.data[1] = DashBoard_msgObj1.msg.data[1];
	}

	/*Data from RVC*/
	while(IfxCpu_acquireMutex(&DashBoard_public.shared.mutex))
		; // Wait for the mutex
	{
		DashBoard_public.data = DashBoard_public.shared.data;
		IfxCpu_releaseMutex(&DashBoard_public.shared.mutex);
	}

	/*RTD routine*/
	if(RTD_flag == FALSE)
	{
		if(DashBoard_public.data.brakeOn && DashBoard_public.data.tsalOn && DashBoard_canMsg1.B.StartBtn)
		{
			RTD_cnt++;
			if(RTD_cnt > rtdCntTh)
			{
				RTD_flag = TRUE;
				RTD_cnt = 0;
			}
		}
		else 
		{
			RTD_cnt = 0;
		}
	}
	else	//(RTD_flag == TRUE) 
	{
		if(DashBoard_canMsg1.B.StartBtn)
		{
			RTD_cnt++;
			if(RTD_cnt > rtdCntTh)
			{
				RTD_flag = FALSE;
				RTD_cnt = 0;
			}
			else
			{
				RTD_cnt = 0;
			}
		}
		else if(DashBoard_public.data.tsalOn == FALSE)
		{
			RTD_flag = FALSE;
		}
	}

	/*Dash Board Info TX*/
	DashBoard_canMsg0.B.AmkState = (uint8)AmkState;
	DashBoard_canMsg0.B.SdcAmsOk = DashBoard_public.data.bmsOk;
	DashBoard_canMsg0.B.SdcImdOk = DashBoard_public.data.imdOk;
	DashBoard_canMsg0.B.SdcBspdOk = DashBoard_public.data.bspdOk;
	DashBoard_canMsg0.B.SdcSen = DashBoard_public.data.sdcSenFinal;
	DashBoard_canMsg0.B.tsalOn = DashBoard_public.data.tsalOn;

    CanCommunication_setMessageData(DashBoard_canMsg0.data[0], DashBoard_canMsg0.data[1], &DashBoard_msgObj0);
    CanCommunication_transmitMessage(&DashBoard_msgObj0);
}

boolean SDP_DashBoardCan_getDashBoard_RTD_Status(void)
{
	return DashBoard_RTD_Status;
}
