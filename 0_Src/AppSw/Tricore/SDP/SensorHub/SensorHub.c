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

#define ADC_RESOLUTION (4095)

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

uint16 SDP_SensorHub_getRPM_FL() {
	return SensorHub_FRONT.SensorHubWSS.WSS2_RPM;
}

uint16 SDP_SensorHub_getRPM_FR() {
	return SensorHub_FRONT.SensorHubWSS.WSS1_RPM;
}

uint16 SDP_SensorHub_getRPM_RL() {
	return SensorHub_REAR.SensorHubWSS.WSS1_RPM;
}

uint16 SDP_SensorHub_getRPM_RR() {
	return SensorHub_REAR.SensorHubWSS.WSS2_RPM;
}

//Must have a parameter of uint16 type pointer with memory assigned at least of 32bits.
void SDP_SensorHub_getRPM_Front(uint16* frontRPM) {
	frontRPM[0] = SDP_SensorHub_getRPM_FL();
	frontRPM[1] = SDP_SensorHub_getRPM_FR();
}

//Must have a parameter of uint16 type pointer with memory assigned at least of 32bits.
void SDP_SensorHub_getRPM_Rear(uint16* rearRPM) {
	rearRPM[0] = SDP_SensorHub_getRPM_RL();
	rearRPM[1] = SDP_SensorHub_getRPM_RR();
}

//Must have a parameter of uint16 type pointer with memory assigned at least of 32bits.
//In the sequence of FL FR RL RR
void SDP_SensorHub_getRPM(uint16* RPM) {
	RPM[0] = SDP_SensorHub_getRPM_FL();
	RPM[1] = SDP_SensorHub_getRPM_FR();
	RPM[2] = SDP_SensorHub_getRPM_RL();
	RPM[3] = SDP_SensorHub_getRPM_RR();
}

//Returns damper contraction ratio
//Returns 1 when the potentiometer is at its full expansion and 0 at its full contraction.
double SDP_SensorHub_getDamper_FL() {
	return SensorHub_FRONT.SensorHubADC2.IN2/ADC_RESOLUTION;
}

//Returns damper contraction ratio
//Returns 1 when the potentiometer is at its full expansion and 0 at its full contraction.
double SDP_SensorHub_getDamper_FR() {
	return SensorHub_FRONT.SensorHubADC1.IN3/ADC_RESOLUTION;
}

//Returns damper contraction ratio
//Returns 1 when the potentiometer is at its full expansion and 0 at its full contraction.
double SDP_SensorHub_getDamper_RL() {
	return SensorHub_REAR.SensorHubADC1.IN3/ADC_RESOLUTION;
}

//Returns damper contraction ratio
//Returns 1 when the potentiometer is at its full expansion and 0 at its full contraction.
double SDP_SensorHub_getDamper_RR() {
	return SensorHub_REAR.SensorHubADC2.IN2/ADC_RESOLUTION;
}

//Must have a parameter of double type pointer with memory assigned at least of two elements.
void SDP_SensorHub_getDamper_Front(double* frontDamper) {
	frontDamper[0] = SDP_SensorHub_getDamper_FL();
	frontDamper[1] = SDP_SensorHub_getDamper_FR();
}

//Must have a parameter of double type pointer with memory assigned at least of two elements.
void SDP_SensorHub_getDamper_Rear(double* rearDamper) {
	rearDamper[0] = SDP_SensorHub_getDamper_RL();
	rearDamper[1] = SDP_SensorHub_getDamper_RR();
}

//Must have a parameter of double type pointer with memory assigned at least of four elements.
void SDP_SensorHub_getDamper(double* Damper) {
	Damper[0] = SDP_SensorHub_getDamper_FL();
	Damper[1] = SDP_SensorHub_getDamper_FR();
	Damper[2] = SDP_SensorHub_getDamper_RL();
	Damper[3] = SDP_SensorHub_getDamper_RR();
}
