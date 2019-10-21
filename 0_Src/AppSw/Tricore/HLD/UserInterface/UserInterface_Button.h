/*
 * ButtonFunc.h
 * 2019. 7. 2.
 */
#ifndef HLD_USERINTERFACE_BUTTONFUNC_H_
#define HLD_USERINTERFACE_BUTTONFUNC_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/

#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include "IfxPort.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/
typedef uint32 HLD_buttonBuffer;

typedef enum
{
	HLD_buttonBufferLength_noDebounce = 0,
	HLD_buttonBufferLength_1 = 1,
	HLD_buttonBufferLength_2 = 2,
	HLD_buttonBufferLength_3 = 3,
	HLD_buttonBufferLength_4 = 4,
	HLD_buttonBufferLength_5 = 5 ,
	HLD_buttonBufferLength_6 = 6,
	HLD_buttonBufferLength_7 = 7,
	HLD_buttonBufferLength_8 = 8,
	HLD_buttonBufferLength_9 = 9,
	HLD_buttonBufferLength_10 = 10,
	HLD_buttonBufferLength_11 = 11,
	HLD_buttonBufferLength_12 = 12,
	HLD_buttonBufferLength_13 = 13,
	HLD_buttonBufferLength_14 = 14,
	HLD_buttonBufferLength_15 = 15,
	HLD_buttonBufferLength_16 = 16,
	HLD_buttonBufferLength_17 = 17,
	HLD_buttonBufferLength_18 = 18,
	HLD_buttonBufferLength_19 = 19,
	HLD_buttonBufferLength_20 = 20,
	HLD_buttonBufferLength_21 = 21,
	HLD_buttonBufferLength_22 = 22,
	HLD_buttonBufferLength_23 = 23,
	HLD_buttonBufferLength_24 = 24,
	HLD_buttonBufferLength_25 = 25,
	HLD_buttonBufferLength_26 = 26,
	HLD_buttonBufferLength_27 = 27,
	HLD_buttonBufferLength_28 = 28,
	HLD_buttonBufferLength_29 = 29,
	HLD_buttonBufferLength_30 = 30,
	HLD_buttonBufferLength_31 = 31,
	HLD_buttonBufferLength_32 = 32,

}HLD_buttonBufferLength;


typedef struct
{
	IfxPort_Pin* port;			//Button input pin
	void (*callBack) (void);	//Button callback handler
	boolean on;
	boolean flag;
	HLD_buttonBufferLength bufferLen;
	HLD_buttonBuffer buffer;
	HLD_buttonBuffer bufferMask;
}HLD_button_t;


typedef struct
{
	IfxPort_Pin* port;
	void (*callBack) (void);
	HLD_buttonBufferLength bufferLen;
}HLD_buttonConfig_t;
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_EXTERN boolean HLD_UserInterface_pollButton(HLD_button_t* button);
IFX_EXTERN void HLD_UserInterface_buttonInit(HLD_button_t* button, HLD_buttonConfig_t* config);
IFX_EXTERN void HLD_UserInterface_buttonInitConfig(HLD_buttonConfig_t* config);

/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/



#endif /* 0_SRC_APPSW_TRICORE_HLD_USERINTERFACE_BUTTONFUNC_H_ */
