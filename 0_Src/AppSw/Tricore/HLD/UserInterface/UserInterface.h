/*
 * UserInterface.h
 * 2019. 7. 2.
 */
#ifndef SRC_APPSW_TRICORE_HLD_USERINTERFACE_USERINTERFACE_H_
#define SRC_APPSW_TRICORE_HLD_USERINTERFACE_USERINTERFACE_H_

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
//#define BUTTON_TEST		0

/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/
typedef struct
{
/*	uint8 page;
	uint8 line;*/
	boolean isFloat;
	uint32 con;
	void* val;
	char* name;
	uint32 inc;
}HLD_UserInterface_configVal_t;

typedef struct
{
/*	uint8 page;
	uint8 line;*/
	boolean isFloat;
	uint32 con;
	void* val;
	char* name;
}HLD_UserInterface_viewVal_t;

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
#ifdef BUTTON_TEST
IFX_EXTERN void HLD_UserInterface_init(void);
#else
IFX_EXTERN void HLD_UserInterface_init(void (*callBack_start)(void));
#endif
/*
 * page: 변수를 등록할 페이지 (0~)
 * line: 페이지 안에서 변수를 표시할 줄(0~)
 * isFloat: 실수형/정수형 (TRUE/FALSE)
 * con: 정수형일 때는 scale(표시되는 값 = 변수값/con) 실수형일 때는 소수 자릿수
 * val: 등록할 변수의 포인터
 * name: 표시할 이름 최대 6글자
 * inc: 증감량(실수형일 때는 표시되는 소수점 가장 작은 자리 기준)
 */
IFX_EXTERN void HLD_UserInterface_instView(uint8 page, uint8 line, boolean isFloat, uint32 con, void* val, char* name);
IFX_EXTERN void HLD_UserInterface_instConfig(uint8 page, uint8 line, boolean isFloat, uint32 con, void* val, char* name, uint32 inc);
IFX_EXTERN void HLD_UserInterface_instViewArray(HLD_UserInterface_configVal_t* viewArray, uint32 num);
IFX_EXTERN void HLD_UserInterface_instConfigArray(HLD_UserInterface_configVal_t* configArray, uint32 num);

IFX_EXTERN void HLD_UserInterface_run_10ms(void);
IFX_EXTERN void HLD_UserInterface_run_100ms_s4(void);
IFX_EXTERN void HLD_UserInterface_run_100ms_s14(void);
IFX_EXTERN void HLD_UserInterface_run_100ms_s24(void);
IFX_EXTERN void HLD_UserInterface_run_100ms_s34(void);
IFX_EXTERN void HLD_UserInterface_run_100ms_s44(void);
/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/



#endif /* 0_SRC_APPSW_TRICORE_HLD_USERINTERFACE_USERINTERFACE_H_ */
