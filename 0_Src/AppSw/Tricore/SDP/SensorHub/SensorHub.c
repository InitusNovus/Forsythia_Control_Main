/*
* SensorHub.h
* Created: Jan 16th, 2023
* Author: Terry
* yoonsb@hanyang.ac.kr
* blog.terrysyoon.com
*/

#include "SensorHub.h"

#define SENSORHUB_CAN_MSGADC1_ID_FRONT (0x00334F01)
#define SENSORHUB_CAN_MSGADC2_ID_FRONT (0x00334F02)
#define SENSORHUB_CAN_MSGWSS_ID_FRONT (0x00334F03)

#define SENSORHUB_CAN_MSGADC1_ID_REAR (0x00334B01)
#define SENSORHUB_CAN_MSGADC2_ID_REAR (0x00334B02)
#define SENSORHUB_CAN_MSGWSS_ID_REAR (0x00334B03)

SensorHub_t SensorHub_FRONT;
SensorHub_t SensorHub_REAR;

void SDP_SensorHub_init(void);
void SDP_SensorHub_run_10ms(void);

void SDP_SensorHub_init(void)
{
    /* CAN message init */

    /*FRONT~*/
	{
        CanCommunication_Message_Config config;
        config.messageId		=	SENSORHUB_CAN_MSGADC1_ID_FRONT;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&SensorHub_FRONT.SensorHub_msgADC1, &config);
	}
	{
        CanCommunication_Message_Config config;
        config.messageId		=	SENSORHUB_CAN_MSGADC2_ID_FRONT;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&SensorHub_FRONT.SensorHub_msgADC2, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	SENSORHUB_CAN_MSGWSS_ID_FRONT;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&SensorHub_FRONT.SensorHub_msgWSS, &config);
	}
    /*~FRONT*/

    /*REAR~*/
	{
        CanCommunication_Message_Config config;
        config.messageId		=	SENSORHUB_CAN_MSGADC1_ID_REAR;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&SensorHub_REAR.SensorHub_msgADC1, &config);
	}
	{
        CanCommunication_Message_Config config;
        config.messageId		=	SENSORHUB_CAN_MSGADC2_ID_REAR;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&SensorHub_REAR.SensorHub_msgADC2, &config);
	}
	{
		CanCommunication_Message_Config config;
        config.messageId		=	SENSORHUB_CAN_MSGWSS_ID_REAR;
        config.frameType		=	IfxMultican_Frame_receive;
        config.dataLen			=	IfxMultican_DataLengthCode_8;
        config.node				=	&CanCommunication_canNode0;
        CanCommunication_initMessage(&SensorHub_REAR.SensorHub_msgWSS, &config);
	}
    /*~REAR*/

}

void SDP_SensorHub_run_10ms(void)
{
    /* CAN message refresh*/
    
    /*FRONT~*/
    if(CanCommunication_receiveMessage(&SensorHub_FRONT.SensorHub_msgADC1))
    {
    	SensorHub_FRONT.SensorHubADC1.ReceivedData[0]      =   SensorHub_FRONT.SensorHub_msgADC1.msg.data[0];
    	SensorHub_FRONT.SensorHubADC1.ReceivedData[1]      =   SensorHub_FRONT.SensorHub_msgADC1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&SensorHub_FRONT.SensorHub_msgADC2))
    {
    	SensorHub_FRONT.SensorHubADC2.ReceivedData[0]      =   SensorHub_FRONT.SensorHub_msgADC2.msg.data[0];
    	SensorHub_FRONT.SensorHubADC2.ReceivedData[1]      =   SensorHub_FRONT.SensorHub_msgADC2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&SensorHub_FRONT.SensorHub_msgWSS))
    {
        SensorHub_FRONT.SensorHubWSS.ReceivedData[0]      =   SensorHub_FRONT.SensorHub_msgWSS.msg.data[0];
        SensorHub_FRONT.SensorHubWSS.ReceivedData[1]      =   SensorHub_FRONT.SensorHub_msgWSS.msg.data[1];
    }
    /*~FRONT*/

    /*REAR~*/
    if(CanCommunication_receiveMessage(&SensorHub_REAR.SensorHub_msgADC1))
    {
    	SensorHub_REAR.SensorHubADC1.ReceivedData[0]      =   SensorHub_REAR.SensorHub_msgADC1.msg.data[0];
    	SensorHub_REAR.SensorHubADC1.ReceivedData[1]      =   SensorHub_REAR.SensorHub_msgADC1.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&SensorHub_REAR.SensorHub_msgADC2))
    {
    	SensorHub_REAR.SensorHubADC2.ReceivedData[0]      =   SensorHub_REAR.SensorHub_msgADC2.msg.data[0];
    	SensorHub_REAR.SensorHubADC2.ReceivedData[1]      =   SensorHub_REAR.SensorHub_msgADC2.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&SensorHub_REAR.SensorHub_msgWSS))
    {
        SensorHub_REAR.SensorHubWSS.ReceivedData[0]      =   SensorHub_REAR.SensorHub_msgWSS.msg.data[0];
        SensorHub_REAR.SensorHubWSS.ReceivedData[1]      =   SensorHub_REAR.SensorHub_msgWSS.msg.data[1];
    }
    /*~REAR*/

}
