/*
* SensorHub.h
* Created: Jan 16th, 2023
* Author: Terry
* yoonsb@hanyang.ac.kr
* blog.terrysyoon.com
*/

#ifndef SRC_APPSW_TRICORE_SDP_COOLING_H
#define SRC_APPSW_TRICORE_SDP_COOLING_H



/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "SDP.h"
#include "CanCommunication.h"
#include "HLD.h"

typedef union
{
    uint32 ReceivedData[2];
    struct
    {
        uint16 IN1;
        uint16 IN2;
        uint16 IN3;
        uint16 IN4;
    };
}SensorHub_msgADC_t;

typedef union
{
    uint32 ReceivedData[2];
    struct 
    {
        uint16 WSS1_RPM;
        uint16 WSS2_RPM;
        union 
        {
            uint8 U;
            struct 
            {
                uint8 reserved1 : 1;
                uint8 TIM2_ERROR : 1;
                uint8 TIM3_ERROR : 1;
                uint8 reserved15 : 1;
                uint8 reserved:4;
            }S;
        } dutyFlag;
        uint16 reserved1;
        uint8 reserved2;
    };
}SensorHub_msgWSS_t;

typedef struct 
{
    SensorHub_msgADC_t SensorHubADC;
    SensorHub_msgWSS_t SensorHubWSS;

    CanCommunication_Message SensorHub_msgADC;
    CanCommunication_Message SensorHub_msgWSS;
}SensorHub_t;

IFX_EXTERN SensorHub_t SensorHub_FRONT;
IFX_EXTERN SensorHub_t SensorHub_REAR;
#endif /* SENSORHUB_H*/
