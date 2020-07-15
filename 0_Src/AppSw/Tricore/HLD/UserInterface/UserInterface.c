/*
 * UserInterface.c
 *
 *  Created on: 2019. 7. 3.
 *      Author: bigbi_000
 * 
 * TODO: Merge TFTLCD functions(AK237)
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "HLD.h"
#include "UserInterface.h"

#include "UserInterface_Button.h"
#include "Lcd.h"
#include "FloatSeperation.h"

#include <math.h>
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
//#define BUTTON_TEST      0
//#define BUTTON_TEST6      0

#define BUTTON_SEN      HLD_buttonBufferLength_10
#define BUTTON_NUM      6

#define VAL_NAME_LEN   6

#define VIEW_PAGE_NUM   	3
#define CFG_PAGE_NUM   		20

#define UIMODE_DEFAULT		0
#define UIMODE_AUTOVIEW		1
#define UIMODE_CONFIG		2

#define UIMODE				UIMODE_CONFIG
//#define UIMODE				UIMODE_AUTOVIEW
//#define UIMODE				UIMODE_DEFAULT

#define UISIMPLE			TRUE
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef enum
{
	intro,
	view,
	config,
}HLD_UserInterface_pageMode;

typedef struct
{
	boolean isFloat;
	uint32 con;
	uint32 inc;
	void* val;
	char name[VAL_NAME_LEN+1];
}HLD_UserInterface_value_t;

typedef struct
{
	HLD_UserInterface_pageMode pageMode;
	HLD_UserInterface_value_t value[3];
}HLD_UserInterface_page_t;

typedef struct
{
	struct{
		IfxPort_Pin *pin;
		void (*callBack) (void);
	}button[BUTTON_NUM];
}HLD_UserInterface_uiButtonConfig_t;

typedef struct
{
	boolean       isPressed;
	HLD_button_t    startButton;
	HLD_button_t    button[BUTTON_NUM];
	HLD_UserInterface_pageMode mode;
	uint8         viewPageNum;
	uint8         configPageNum;
	uint8          currentPage;
	uint8         cursor;
	boolean         isSelected;

	HLD_UserInterface_page_t view[VIEW_PAGE_NUM];
	HLD_UserInterface_page_t config[CFG_PAGE_NUM];
}HLD_UserInterface_t;



/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
HLD_UserInterface_t HLD_UserInterface =
{


#if	UIMODE ==  UIMODE_AUTOVIEW
		.isPressed = TRUE,
		.mode = view,
#elif UIMODE == UIMODE_CONFIG
		.isPressed = TRUE,
		.mode = config,
#else
		.isPressed = FALSE,
		.mode = intro,
#endif
		.viewPageNum = VIEW_PAGE_NUM,
		.configPageNum = CFG_PAGE_NUM,


		.currentPage = 0,
		.cursor = 0,
		.isSelected = FALSE,

};



/*Test*/
#ifdef BUTTON_TEST
HLD_button_t TestButton;
uint32 TestVar = 0;
#else
//HLD_button_t startButton;
#define startButton      HLD_UserInterface.startButton   //Compatibility
#endif




uint32 Test1 = 325;
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_STATIC void HLD_UserInterface_installButton(HLD_button_t* button, IfxPort_Pin* port, void (*callBack)(void));

IFX_STATIC void HLD_UserInterface_buttonUp(void);
IFX_STATIC void HLD_UserInterface_buttonDown(void);
IFX_STATIC void HLD_UserInterface_buttonLeft(void);
IFX_STATIC void HLD_UserInterface_buttonRight(void);
IFX_STATIC void HLD_UserInterface_buttonL1(void);
IFX_STATIC void HLD_UserInterface_buttonR1(void);

IFX_STATIC void HLD_UserInterface_dispValue(HLD_Lcd_line line);
IFX_STATIC void HLD_UserInterface_initPage(HLD_UserInterface_page_t* page, HLD_UserInterface_pageMode mode);
IFX_STATIC void HLD_UserInterface_viewMode(void);

#ifdef BUTTON_TEST
IFX_STATIC void TestCallBack(void)
{
	TestVar++;
}
#endif

/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/
HLD_UserInterface_uiButtonConfig_t buttonConfig=
{
		.button[0].pin = &UI_BTN1,
		.button[0].callBack = HLD_UserInterface_buttonUp,

		.button[1].pin = &UI_BTN2,
		.button[1].callBack = HLD_UserInterface_buttonDown,

		.button[2].pin = &UI_BTN3,
		.button[2].callBack = HLD_UserInterface_buttonLeft,

		.button[3].pin = &UI_BTN4,
		.button[3].callBack = HLD_UserInterface_buttonRight,

		.button[4].pin = &UI_BTN5,
		.button[4].callBack = HLD_UserInterface_buttonL1,

		.button[5].pin = &UI_BTN6,
		.button[5].callBack = HLD_UserInterface_buttonR1,
};

/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
#ifdef BUTTON_TEST
void HLD_UserInterface_init(void)
{
	HLD_UserInterface_installButton(&TestButton, &START_BTN, TestCallBack);
}
#else
void HLD_UserInterface_init(void (*callBack_start)(void))
{
	//   HLD_UserInterface_ledInit();
	HLD_UserInterface_installButton(&startButton, &START_BTN, callBack_start);
#if UISIMPLE != TRUE
	uint8 buttonIndex = 0;
	for(buttonIndex = 0; buttonIndex < BUTTON_NUM; buttonIndex++)
	{
		HLD_UserInterface_installButton(&HLD_UserInterface.button[buttonIndex],
				buttonConfig.button[buttonIndex].pin, buttonConfig.button[buttonIndex].callBack);
	}
	uint8 index = 0;
	for(index = 0; index < VIEW_PAGE_NUM; index++)
	{
		HLD_UserInterface_initPage(&HLD_UserInterface.view[index], view);
	}

	for(index = 0; index < CFG_PAGE_NUM; index++)
	{
		HLD_UserInterface_initPage(&HLD_UserInterface.config[index], config);
	}
#endif
}
#endif

void HLD_UserInterface_run_10ms(void)
{

	static uint32 counter = 0;
	boolean press= FALSE;
#ifdef BUTTON_TEST
	HLD_UserInterface_pollButton(&TestButton);
#else

	HLD_UserInterface_pollButton(&startButton);
#if UISIMPLE != TRUE
	uint8 buttonIndex = 0;
	for(buttonIndex = 0; buttonIndex < BUTTON_NUM; buttonIndex++)
		HLD_UserInterface.isPressed |= (press = HLD_UserInterface_pollButton(&HLD_UserInterface.button[buttonIndex]));
#ifdef AUTOVIEWMODE
	counter++;
	if(press)
		counter = 0;
	if(counter > 500)
		HLD_UserInterface_viewMode();
#endif
#endif
#endif
}

void HLD_UserInterface_run_100ms_s4(void)
{
	/*
   if(HLD_UserInterface.isPressed)
   {
      HLD_Lcd_dispLine(LcdLine0, "                    ");
   }
	 */
	HLD_UserInterface_dispValue(LcdLine0);
}
void HLD_UserInterface_run_100ms_s14(void)
{
	/*
   if(HLD_UserInterface.isPressed)
   {
      HLD_Lcd_dispLine(LcdLine1, "                    ");
   }
	 */
	HLD_UserInterface_dispValue(LcdLine1);
}
void HLD_UserInterface_run_100ms_s24(void)
{
	/*
   if(HLD_UserInterface.isPressed)
   {
      HLD_Lcd_dispLine(LcdLine2, "                    ");
   }
	 */
	HLD_UserInterface_dispValue(LcdLine2);
}
void HLD_UserInterface_run_100ms_s34(void)
{
	if(HLD_UserInterface.isPressed)
	{
		switch(HLD_UserInterface.mode)
		{
		case view:
			HLD_Lcd_dispLine(LcdLine3, "VIEW%d               ",HLD_UserInterface.currentPage);
			break;
		case config:
			HLD_Lcd_dispLine(LcdLine3, "CFG %d  Inc%10d",
					HLD_UserInterface.currentPage,
					HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].inc);
			break;
		default:
			HLD_Lcd_dispLine(LcdLine3, "ERROR               ");
		}
	}
}
void HLD_UserInterface_run_100ms_s44(void)
{
	//   HLD_Lcd_dispCharRowCol(LcdLine3, 0, '4');
}

void HLD_UserInterface_instViewArray(HLD_UserInterface_configVal_t* viewArray, uint32 num)
{
	uint32 pages = (num-1)/3+1;
	HLD_UserInterface.viewPageNum = pages;

	uint32 index = 0;
/*
	for(index = 0; index < HLD_UserInterface.viewPageNum; index++)
	{
		HLD_UserInterface_initPage(&HLD_UserInterface.view[index], view);
	}
*/

	for(index = 0; index < num; index++)
	{
		HLD_UserInterface_instView(index/3, index%3, viewArray[index].isFloat,
				viewArray[index].con, (void*)(viewArray[index].val), viewArray[index].name);
	}
}

void HLD_UserInterface_instConfigArray(HLD_UserInterface_configVal_t* configArray, uint32 num)
{
	uint32 pages = (num-1)/3+1;
	HLD_UserInterface.configPageNum = pages;

	uint32 index = 0;
/*
	for(index = 0; index < HLD_UserInterface.configPageNum; index++)
	{
		HLD_UserInterface_initPage(&HLD_UserInterface.config[index], config);
	}
*/

	for(index = 0; index < num; index++)
	{
		HLD_UserInterface_instConfig(index/3, index%3, configArray[index].isFloat,
				configArray[index].con, (void*)(configArray[index].val), configArray[index].name, configArray[index].inc);
	}
}

IFX_STATIC void HLD_UserInterface_viewMode(void)
{
	HLD_UserInterface.mode = view;
	HLD_UserInterface.currentPage = 0;
	HLD_UserInterface.isPressed = TRUE;
}


IFX_STATIC void HLD_UserInterface_dispValue(HLD_Lcd_line line)
{
	void* val = NULL_PTR;
	char* name = "      ";
	uint32 con = 0;
	boolean isFloat = FALSE;
	uint8 row = 0;
	uint32 inc = 0;
	switch(line)
	{
	case LcdLine0: row = 0; break;
	case LcdLine1: row = 1; break;
	case LcdLine2: row = 2; break;
	case LcdLine3: row = 3; break;
	}


	if(HLD_UserInterface.mode == view)
	{
		val = HLD_UserInterface.view[HLD_UserInterface.currentPage].value[row].val;
		name = HLD_UserInterface.view[HLD_UserInterface.currentPage].value[row].name;
		con = HLD_UserInterface.view[HLD_UserInterface.currentPage].value[row].con;
		isFloat = HLD_UserInterface.view[HLD_UserInterface.currentPage].value[row].isFloat;
	}
	else if(HLD_UserInterface.mode == config)
	{
		val = HLD_UserInterface.config[HLD_UserInterface.currentPage].value[row].val;
		name = HLD_UserInterface.config[HLD_UserInterface.currentPage].value[row].name;
		con = HLD_UserInterface.config[HLD_UserInterface.currentPage].value[row].con;
		isFloat = HLD_UserInterface.config[HLD_UserInterface.currentPage].value[row].isFloat;
		inc = HLD_UserInterface.config[HLD_UserInterface.currentPage].value[row].inc;
	}

	if(HLD_UserInterface.isPressed)
	{
		if(val == NULL_PTR)
			HLD_Lcd_dispLine(line, "                    ");
		else if(isFloat)
		{
			sint32 intPart;
			uint32 fracPart;
			Separate_int_frac(&intPart, &fracPart, *(float32*)val, con);
			switch(con)
			{
			case 0: HLD_Lcd_dispLine(line, "%s  %12d",name, intPart); break;
			case 1: HLD_Lcd_dispLine(line, "%s  %10d.%01d", name, intPart, fracPart); break;
			case 2: HLD_Lcd_dispLine(line, "%s  %9d.%02d", name, intPart, fracPart); break;
			case 3: HLD_Lcd_dispLine(line, "%s  %8d.%03d", name, intPart, fracPart); break;
			case 4: HLD_Lcd_dispLine(line, "%s  %7d.%04d", name, intPart, fracPart); break;
			case 5: HLD_Lcd_dispLine(line, "%s  %6d.%05d", name, intPart, fracPart); break;
			case 6: HLD_Lcd_dispLine(line, "%s  %5d.%06d", name, intPart, fracPart); break;
			case 7: HLD_Lcd_dispLine(line, "%s  %4d.%07d", name, intPart, fracPart); break;
			case 8: HLD_Lcd_dispLine(line, "%s  %3d.%08d", name, intPart, fracPart); break;
			case 9: HLD_Lcd_dispLine(line, "%s  %2d.%09d", name, intPart, fracPart); break;
			case 10:
			default:
				HLD_Lcd_dispLine(line, "%s,  %1d.%10d", name, intPart, fracPart); break;
			}
		}
		else
			HLD_Lcd_dispLine(line, "%s  %12d", name, (*(sint32*)val)/con);

		if(HLD_UserInterface.mode == config)
			if(HLD_UserInterface.cursor == row)
			{
				if(HLD_UserInterface.isSelected)
					HLD_Lcd_dispRowCol(line, 6, "->");
				else
					HLD_Lcd_dispRowCol(line, 6, "<");
			}
	}
}

void HLD_UserInterface_instView(uint8 page, uint8 line, boolean isFloat, uint32 con, void* val, char* name)
{
	if(page >= VIEW_PAGE_NUM)
		page = VIEW_PAGE_NUM-1;
	if(line >= 3)
		line = 2;
	HLD_UserInterface.view[page].value[line].con = con;
	HLD_UserInterface.view[page].value[line].isFloat = isFloat;
	uint8 nameIndex = 0;
	for(nameIndex = 0;nameIndex<VAL_NAME_LEN; nameIndex++)
	{
		if(name[nameIndex]!= '\0')
			HLD_UserInterface.view[page].value[line].name[nameIndex] = name[nameIndex];
		else
			break;
	}
	HLD_UserInterface.view[page].value[line].val = val;
}
void HLD_UserInterface_instConfig(uint8 page, uint8 line, boolean isFloat, uint32 con, void* val, char* name, uint32 inc)
{
	if(page >= CFG_PAGE_NUM)
		page = CFG_PAGE_NUM-1;
	if(line >= 3)
		line = 2;
	HLD_UserInterface.config[page].value[line].con = con;
	HLD_UserInterface.config[page].value[line].isFloat = isFloat;
	uint8 nameIndex = 0;
	for(nameIndex = 0;nameIndex<VAL_NAME_LEN; nameIndex++)
	{
		if(name[nameIndex]!= '\0')
			HLD_UserInterface.config[page].value[line].name[nameIndex] = name[nameIndex];
		else
			break;
	}
	HLD_UserInterface.config[page].value[line].val = val;
	HLD_UserInterface.config[page].value[line].inc = inc;
}

IFX_STATIC void HLD_UserInterface_initPage(HLD_UserInterface_page_t* page, HLD_UserInterface_pageMode mode)
{
	if(mode == config)
	{
		page->pageMode = config;
	}
	else
	{
		page->pageMode = view;
	}
	uint8 index = 0;
	for(index = 0; index<3; index++)
	{
		uint8 nameIndex = 0;
		for(nameIndex = 0;nameIndex<VAL_NAME_LEN; nameIndex++)
		{
			page->value[index].name[nameIndex] = (char)' ';
		}
		page->value[index].name[VAL_NAME_LEN] = '\0';
		page->value[index].val = NULL_PTR;
		page->value[index].con = 1;
		page->value[index].inc = 1;
		page->value[index].isFloat = FALSE;
	}
}
#ifdef BUTTON_TEST6
IFX_STATIC void HLD_UserInterface_buttonUp(void)
{
	printf("B_UP\n");
}
IFX_STATIC void HLD_UserInterface_buttonDown(void)
{
	printf("B_DN\n");
}
IFX_STATIC void HLD_UserInterface_buttonLeft(void)
{
	printf("B_LT\n");
}
IFX_STATIC void HLD_UserInterface_buttonRight(void)
{
	printf("B_RT\n");
}
IFX_STATIC void HLD_UserInterface_buttonL1(void)
{
	printf("B_L1\n");
}
IFX_STATIC void HLD_UserInterface_buttonR1(void)
{
	printf("B_R1\n");
}
#else
IFX_STATIC void HLD_UserInterface_buttonUp(void)
{
	if(HLD_UserInterface.mode == config)
	{
		if(HLD_UserInterface.isSelected)
		{
			if(HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].isFloat)
				*(float32*)HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].val +=
						((float32)HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].inc)/
						pow(10,HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].con);
			else
				*(sint32*)HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].val +=
						(HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].inc);
		}
		else
		{
			if(HLD_UserInterface.cursor == 0)
			{
				if(HLD_UserInterface.currentPage != 0)
				{
					HLD_UserInterface.currentPage--;
					HLD_UserInterface.cursor = 2;
				}
			}
			else
			{
				HLD_UserInterface.cursor--;
			}
		}
	}
	else if(HLD_UserInterface.mode == view)
	{
		if(HLD_UserInterface.currentPage != 0)
		{
			HLD_UserInterface.currentPage--;
		}
	}
}
IFX_STATIC void HLD_UserInterface_buttonDown(void)
{
	if(HLD_UserInterface.mode == config)
	{
		if(HLD_UserInterface.isSelected)
		{
			if(HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].isFloat)
				*(float32*)HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].val -=
						((float32)HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].inc)/
						pow(10,HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].con);
			else
				*(sint32*)HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].val -=
						(HLD_UserInterface.config[HLD_UserInterface.currentPage].value[HLD_UserInterface.cursor].inc);
		}
		else
		{
			if(HLD_UserInterface.cursor == 2)
			{
				if(HLD_UserInterface.currentPage < (HLD_UserInterface.configPageNum-1))
				{
					HLD_UserInterface.currentPage++;
					HLD_UserInterface.cursor = 0;
				}
			}
			else
			{
				HLD_UserInterface.cursor++;
			}
		}
	}
	else if(HLD_UserInterface.mode == view)
	{
		if(HLD_UserInterface.currentPage < (HLD_UserInterface.viewPageNum-1))
		{
			HLD_UserInterface.currentPage++;
		}
	}
}
IFX_STATIC void HLD_UserInterface_buttonLeft(void)
{
	if(HLD_UserInterface.isSelected)
		HLD_UserInterface.isSelected = FALSE;
}
IFX_STATIC void HLD_UserInterface_buttonRight(void)
{
	if(HLD_UserInterface.isSelected == FALSE)
		HLD_UserInterface.isSelected = TRUE;
}
IFX_STATIC void HLD_UserInterface_buttonL1(void)
{
	if(HLD_UserInterface.mode == view)
	{
		if(++HLD_UserInterface.currentPage >= HLD_UserInterface.viewPageNum)
		{
			HLD_UserInterface.currentPage = 0;
		}
	}
	else
	{
		HLD_UserInterface.mode = view;
		HLD_UserInterface.currentPage = 0;
	}
}
IFX_STATIC void HLD_UserInterface_buttonR1(void)
{
	if(HLD_UserInterface.mode == config)
	{
		if(++HLD_UserInterface.currentPage >= HLD_UserInterface.configPageNum)
		{
			HLD_UserInterface.currentPage = 0;
		}
	}
	else
	{
		HLD_UserInterface.mode = config;
		HLD_UserInterface.currentPage = 0;
	}
}
#endif

IFX_STATIC void HLD_UserInterface_installButton(HLD_button_t* button, IfxPort_Pin* port, void (*callBack)(void))
{
	HLD_buttonConfig_t buttonConfig;
	HLD_UserInterface_buttonInitConfig(&buttonConfig);
	buttonConfig.bufferLen = BUTTON_SEN;
	buttonConfig.port = port;
	buttonConfig.callBack = callBack;
	HLD_UserInterface_buttonInit(button, &buttonConfig);
}
