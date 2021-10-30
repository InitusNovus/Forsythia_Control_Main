#include "DashBoardLed.h"

// DashBoardLed_t DashBoardLed;

static void SDP_DashBoardedLed_indicator_init(indicator_t *dashBoard,Ifx_P Module, uint8 port){
    IfxPort_setPinMode(&Module, port,  IfxPort_Mode_outputPushPullGeneral);
    dashBoard->module=Module;
    dashBoard->port=port;
}

void SDP_DashBoardLed_init(){
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.TEMP1,MODULE_P33,2);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.TEMP2,MODULE_P33,7);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.RTD,MODULE_P33,6);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.SDC,MODULE_P33,5);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.ECU,MODULE_P33,11);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.BSPD,MODULE_P33,4);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.IMD,MODULE_P33,10);
    SDP_DashBoardedLed_indicator_init(&DashBoardLed.AMS,MODULE_P33,3);
}

static void SDP_Dashboard_LED(Ifx_P Module,uint8 port,boolean val){
    if(val)
    IfxPort_setPinHigh(&Module, port);
    else
    IfxPort_setPinLow(&Module, port);
}

void SDP_DashBoardLed_run_1ms(DashBoardLed_t dashboardLED){
    SDP_Dashboard_LED(dashboardLED.TEMP1.module,dashboardLED.TEMP1.port,dashboardLED.TEMP1.val);
    SDP_Dashboard_LED(dashboardLED.TEMP2.module,dashboardLED.TEMP2.port,dashboardLED.TEMP2.val);
    SDP_Dashboard_LED(dashboardLED.RTD.module,dashboardLED.RTD.port,dashboardLED.RTD.val);
    SDP_Dashboard_LED(dashboardLED.SDC.module,dashboardLED.SDC.port,dashboardLED.SDC.val);
    SDP_Dashboard_LED(dashboardLED.ECU.module,dashboardLED.ECU.port,dashboardLED.ECU.val);
    SDP_Dashboard_LED(dashboardLED.BSPD.module,dashboardLED.BSPD.port,dashboardLED.BSPD.val);
    SDP_Dashboard_LED(dashboardLED.IMD.module,dashboardLED.IMD.port,dashboardLED.IMD.val);
    SDP_Dashboard_LED(dashboardLED.AMS.module,dashboardLED.AMS.port,dashboardLED.AMS.val);
    
}