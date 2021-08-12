#include "DashBoardLed.h"




void SDP_DashBoardLed_init(){
    IfxPort_setPinMode(&MODULE_P33, 0,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P00, 0,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P00, 0,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P00, 0,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P00, 0,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P00, 0,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P00, 0,  IfxPort_Mode_outputPushPullGeneral);
    IfxPort_setPinMode(&MODULE_P00, 0,  IfxPort_Mode_outputPushPullGeneral);
}

void SDP_TEMP1_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P33, 2);
}
void SDP_TEMP1_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P33, 2);
}

void SDP_TEMP2_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P00, 7);
}
void SDP_TEMP2_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P00, 7);
}

void SDP_RTD_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P00, 6);
}
void SDP_RTD_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P00, 6);
}

void SDP_SDC_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P00, 5);
}
void SDP_SDC_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P00, 5);
}

void SDP_ECU_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P00, 11);
}
void SDP_ECU_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P00, 11);
}

void SDP_BSPD_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P00, 4);
}
void SDP_BSPD_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P00, 4);
}

void SDP_IMD_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P00, 10);
}
void SDP_IMD_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P00, 10);
}

void SDP_AMS_LED_ON(){
    IfxPort_setPinHigh(&MODULE_P00, 3);
}
void SDP_AMS_LED_OFF(){
    IfxPort_setPinLow(&MODULE_P00, 3);
}