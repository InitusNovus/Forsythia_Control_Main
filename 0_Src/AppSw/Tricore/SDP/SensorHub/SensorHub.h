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
    SensorHub_msgADC_t SensorHubADC1;
    SensorHub_msgADC_t SensorHubADC2;
    SensorHub_msgWSS_t SensorHubWSS;

    CanCommunication_Message SensorHub_msgADC1;
    CanCommunication_Message SensorHub_msgADC2;
    CanCommunication_Message SensorHub_msgWSS;
}SensorHub_t;

IFX_EXTERN SensorHub_t SensorHub_FRONT;
IFX_EXTERN SensorHub_t SensorHub_REAR;

IFX_EXTERN void SDP_SensorHub_init();
IFX_EXTERN void SDP_SensorHub_run_10ms();

IFX_EXTERN uint16 SDP_SensorHub_getRPM_FL();
IFX_EXTERN uint16 SDP_SensorHub_getRPM_FR();
IFX_EXTERN uint16 SDP_SensorHub_getRPM_RL();
IFX_EXTERN uint16 SDP_SensorHub_getRPM_RR();
IFX_EXTERN void SDP_SensorHub_getRPM_Front(uint16*);
IFX_EXTERN void SDP_SensorHub_getRPM_Rear(uint16*);
IFX_EXTERN void SDP_SensorHub_getRPM(uint16*);

IFX_EXTERN double SDP_SensorHub_getDamper_FL();
IFX_EXTERN double SDP_SensorHub_getDamper_FR();
IFX_EXTERN double SDP_SensorHub_getDamper_RL();
IFX_EXTERN double SDP_SensorHub_getDamper_RR();
IFX_EXTERN void SDP_SensorHub_getDamper_Front(double*);
IFX_EXTERN void SDP_SensorHub_getDamper_Rear(double*);
IFX_EXTERN void SDP_SensorHub_getDamper(double*);
#endif /* SENSORHUB_H*/
