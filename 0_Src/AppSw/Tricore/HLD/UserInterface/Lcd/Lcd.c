/*
 * Lcd.c
 *
 *  Created on: 2019. 7. 5.
 *      Author: bigbi_000
 *  
 *  TODO: Refactoring: Lcd->CharLcd
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "HLD.h"
#include "Lcd.h"
#include "usr_sprintf.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/


#define COL		20
#define RAW		20
/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/

char textBuffer[COL+1] = {0};
/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/

IFX_STATIC void HLD_Lcd_initPin(IfxPort_Pin* pin);

IFX_STATIC void HLD_Lcd_dispText(char* buffer);
IFX_STATIC void HLD_Lcd_write(uint8 character);
IFX_STATIC void HLD_Lcd_command(uint8 command);
IFX_STATIC void HLD_Lcd_setDramAddress(uint8 address);

IFX_STATIC void HLD_Lcd_put4bits(uint8 data);

IFX_STATIC void HLD_Lcd_setPin(IfxPort_Pin* pin, boolean data);
IFX_STATIC void HLD_Lcd_setPinHigh(IfxPort_Pin* pin);
IFX_STATIC void HLD_Lcd_setPinLow(IfxPort_Pin* pin);
IFX_STATIC void HLD_Lcd_setData (boolean isUpper, uint8 data4bit);
IFX_STATIC void HLD_Lcd_clockPulse(void);
IFX_STATIC void HLD_Lcd_setRs(boolean val);
IFX_STATIC void HLD_Lcd_setRw(boolean val);
/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void HLD_Lcd_init(void)
{
	printf("Lcd_init() called\n");
	HLD_Lcd_initPin(&LCD_EN);
	HLD_Lcd_initPin(&LCD_B7);
	HLD_Lcd_initPin(&LCD_B6);
	HLD_Lcd_initPin(&LCD_B5);
	HLD_Lcd_initPin(&LCD_B4);
	HLD_Lcd_initPin(&LCD_RS);
	HLD_Lcd_initPin(&LCD_RW);

	/*Set 4-bit mode*/
	{
		HLD_Lcd_setData(TRUE,0b0011);
		HLD_Lcd_clockPulse();
		waitTime(50*TimeConst_10us);

		HLD_Lcd_setData(TRUE,0b0011);
		HLD_Lcd_clockPulse();
		waitTime(50*TimeConst_10us);

		HLD_Lcd_setData(TRUE,0b0011);
		HLD_Lcd_clockPulse();
		waitTime(50*TimeConst_10us);

		HLD_Lcd_setData(TRUE,0b0010);
		HLD_Lcd_clockPulse();
		waitTime(50*TimeConst_10us);
	}


	HLD_Lcd_command(0b00001100);
	HLD_Lcd_command(0b00101000);

	/*clear*/
	HLD_Lcd_clear();

//	HLD_Lcd_dispLine(LcdLine0,"01234567890123456789");
	HLD_Lcd_dispLine(LcdLine0,"    Initus Novus    ");
	HLD_Lcd_dispLine(LcdLine1,"                    ");
	HLD_Lcd_dispLine(LcdLine2,"      SMCC 2019     ");


	usr_sprintf(textBuffer, "HLD_V.%d.%d.%d", HLD_VERSION_MAJOR, HLD_VERSION_MINOR, HLD_VERSION_PATCH);
	HLD_Lcd_dispLine(LcdLine3,textBuffer);


	printf("Lcd_init completed\n");
}


IFX_INLINE void HLD_Lcd_initPin(IfxPort_Pin* pin)
{
	IfxPort_setPinMode(pin->port,pin->pinIndex,IfxPort_OutputMode_pushPull);
	IfxPort_setPinState(pin->port,pin->pinIndex,IfxPort_State_low);
}

void HLD_Lcd_dispRowCol(HLD_Lcd_line row, uint8 col, char* text)
{
	char textBuffer[COL+1] = {0};
	HLD_Lcd_setDramAddress(row+col);
	usr_sprintf(textBuffer, text);
	HLD_Lcd_dispText(textBuffer);
}

void HLD_Lcd_dispCharRowCol(HLD_Lcd_line row, uint8 col, char text)
{
	HLD_Lcd_setDramAddress(row+col);
	HLD_Lcd_dispText(&text);
}

void HLD_Lcd_dispLine(HLD_Lcd_line line, char const *fmt, ...)	//FIXME: use varlist
{
	char textBuffer[COL+1] = {0};
	HLD_Lcd_setDramAddress(line);
	va_list ap;
	va_start(ap, fmt);
//	usr_sprintf(textBuffer, text);
	usr_vsprintf(textBuffer, fmt, ap);
	va_end(ap);
	HLD_Lcd_dispText(textBuffer);
}

IFX_STATIC void HLD_Lcd_dispText(char* buffer)
{
	uint32 index = 0;
	buffer[COL] = '\0';
	while(buffer[index] != '\0')
	{
		HLD_Lcd_write(buffer[index]);
		index ++;
	}
}

void HLD_Lcd_clear(void)
{

	HLD_Lcd_command(0b00000001);
	waitTime(2*TimeConst_1ms);
}

IFX_INLINE void HLD_Lcd_setDramAddress(uint8 address)
{
	HLD_Lcd_command(0b10000000|address);
}

IFX_STATIC void HLD_Lcd_write(uint8 character)
{
	uint8 highnip = (character>>4)&0x0F;
	uint8 lownip = character&0x0F;

	HLD_Lcd_setRs(TRUE);
	HLD_Lcd_setRw(FALSE);

	HLD_Lcd_put4bits(highnip);
	HLD_Lcd_put4bits(lownip);
}

IFX_STATIC void HLD_Lcd_command(uint8 command)
{
	uint8 highnip = (command>>4)&0x0F;
	uint8 lownip = command&0x0F;

	HLD_Lcd_setRs(FALSE);
	HLD_Lcd_setRw(FALSE);

	HLD_Lcd_put4bits(highnip);
	HLD_Lcd_put4bits(lownip);
}

IFX_INLINE void HLD_Lcd_put4bits(uint8 data)
{
	HLD_Lcd_setData(TRUE,data);
	HLD_Lcd_clockPulse();
}

IFX_STATIC void HLD_Lcd_clockPulse(void)
{
	//	IfxPort_setPinState(LCD_EN.port,LCD_EN.pinIndex,IfxPort_State_high);
	HLD_Lcd_setPinHigh(&LCD_EN);
	waitTime(1*TimeConst_1us);
	//	IfxPort_setPinState(LCD_EN.port,LCD_EN.pinIndex,IfxPort_State_low);
	HLD_Lcd_setPinLow(&LCD_EN);
	waitTime(50*TimeConst_1us);
}

IFX_STATIC void HLD_Lcd_setData (boolean isUpper, uint8 data4bit)
{
	switch(isUpper)
	{
	case TRUE:
		HLD_Lcd_setPin(&LCD_B4, (boolean)((data4bit>>0)&0b1));
		HLD_Lcd_setPin(&LCD_B5, (boolean)((data4bit>>1)&0b1));
		HLD_Lcd_setPin(&LCD_B6, (boolean)((data4bit>>2)&0b1));
		HLD_Lcd_setPin(&LCD_B7, (boolean)((data4bit>>3)&0b1));
		break;
	default: break;
	}
}

IFX_INLINE void HLD_Lcd_setPin(IfxPort_Pin* pin, boolean data)
{
	switch(data)
	{
	case TRUE:	HLD_Lcd_setPinHigh(pin);	break;
	case FALSE:	HLD_Lcd_setPinLow(pin);		break;
	}
}

IFX_INLINE void HLD_Lcd_setPinHigh(IfxPort_Pin* pin)
{

	IfxPort_setPinState(pin->port,pin->pinIndex,IfxPort_State_high);
}

IFX_INLINE void HLD_Lcd_setPinLow(IfxPort_Pin* pin)
{

	IfxPort_setPinState(pin->port,pin->pinIndex,IfxPort_State_low);
}

IFX_INLINE void HLD_Lcd_setRs(boolean val)
{
	if(val)
		HLD_Lcd_setPinHigh(&LCD_RS);
	else
		HLD_Lcd_setPinLow(&LCD_RS);
}

IFX_INLINE void HLD_Lcd_setRw(boolean val)
{
	if(val)
		HLD_Lcd_setPinHigh(&LCD_RW);
	else
		HLD_Lcd_setPinLow(&LCD_RW);
}
