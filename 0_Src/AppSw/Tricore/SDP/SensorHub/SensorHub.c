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

IFX_EXTERN SensorHub_t SensorHub_FRONT;
IFX_EXTERN SensorHub_t SensorHub_REAR;

void SDP_SensorHub_init(void);
void SDP_SensorHub_run_1ms(void);

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
        CanCommunication_initMessage(&SensorHub_FRONT.SensorHub_msgADC, &config);
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
        CanCommunication_initMessage(&SensorHub_REAR.SensorHub_msgADC, &config);
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

void SDP_ShockValue_run_1ms(void)
{
    /* CAN message refresh*/
    
    /*FRONT~*/
    if(CanCommunication_receiveMessage(&SensorHub_FRONT.SensorHub_msgADC))
    {
    	SensorHub_FRONT.SensorHub_msgADC.RecievedData[0]      =   SensorHub_FRONT.SensorHubADC.msg.data[0];
    	SensorHub_FRONT.SensorHub_msgADC.RecievedData[1]      =   SensorHub_FRONT.SensorHubADC.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&SensorHub_FRONT.SensorHub_msgWSS))
    {
        SensorHub_FRONT.SensorHub_msgWSS.RecievedData[0]      =   SensorHub_FRONT.SensorHubWSS.msg.data[0];
        SensorHub_FRONT.SensorHub_msgWSS.RecievedData[1]      =   SensorHub_FRONT.SensorHubWSS.msg.data[1];
    }
    /*~FRONT*/

    /*REAR~*/
    if(CanCommunication_receiveMessage(&SensorHub_REAR.SensorHub_msgADC))
    {
    	SensorHub_REAR.SensorHub_msgADC.RecievedData[0]      =   SensorHub_REAR.SensorHubADC.msg.data[0];
    	SensorHub_REAR.SensorHub_msgADC.RecievedData[1]      =   SensorHub_REAR.SensorHubADC.msg.data[1];
    }
    if(CanCommunication_receiveMessage(&SensorHub_REAR.SensorHub_msgWSS))
    {
        SensorHub_REAR.SensorHub_msgWSS.RecievedData[0]      =   SensorHub_REAR.SensorHubWSS.msg.data[0];
        SensorHub_REAR.SensorHub_msgWSS.RecievedData[1]      =   SensorHub_REAR.SensorHubWSS.msg.data[1];
    }
    /*~REAR*/

}