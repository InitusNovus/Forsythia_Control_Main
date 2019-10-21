/*
 * I2cLcd.c
 *
 *  Created on: 2019. 7. 5.
 *      Author: bigbi_000
 */


/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "HLD.h"
#include "SysSe\Bsp\Bsp.h"

#include "I2c.h"
#include "I2cLcd.h"
#include "I2cLcdMacro.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define LCD_I2C_ADDR_WRITE			0x4E
#define LCD_I2C_ADDR_READ			0x4F
#define LCD_I2C_BAUDRATE			100000	//100kHz
//#define LCD_I2C_BAUDRATE			50000	//500kHz

#define LCD_BACKLIGHT_ON			0b00001000
#define LCD_BACKLIGHT_OFF			0b00000000



/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef struct
{
	HLD_I2c_t I2c;
	uint8 backlight;
	uint8 col;
	uint8 row;
	uint8 charsize;
	uint8 displayFunc;
	uint8 displayCon;
	uint8 displayMode;
}HLD_I2cLcd_t;

HLD_I2cLcd_t HLD_Lcd =
{
		.backlight = LCD_BACKLIGHT_ON,
};

uint8 TestData = 'a';
volatile uint8 byteBuffer = 0;
/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_STATIC void HLD_I2cLcd_write4bit(uint8 data);

IFX_STATIC void HLD_I2cLcd_write(uint8 data);
IFX_STATIC void HLD_I2cLcd_command(uint8 data);
/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/

void HLD_I2cLcd_init(void)
{
	printf("I2cLcd initialization start\n");

	HLD_I2c_init(&HLD_Lcd.I2c, LCD_I2C_ADDR_WRITE, LCD_I2C_BAUDRATE);

	waitTime(5*TimeConst_10ms);

	{
		byteBuffer = 0x00;
		HLD_I2c_writeData(&HLD_Lcd.I2c.driver.i2cDevice, &byteBuffer, 1);
	}
	waitTime(1*TimeConst_1s);

	/*Sequence setting the LCD as 4-bit mode*/
	{
		//		HLD_Lcd.backlight = LCD_BACKLIGHT_OFF;
		/*Set LCD definitely as 8-bit mode*/
		HLD_I2cLcd_write4bit(0b0011);
		waitTime(45*TimeConst_100us);//wait 4.5ms

		HLD_I2cLcd_write4bit(0b0011);
		waitTime(45*TimeConst_100us);//wait 4.5ms

		HLD_I2cLcd_write4bit(0b0011);
		waitTime(45*TimeConst_100us);//wait 4.5ms
		/*LCD is set as 8-bit mode*/

		/*Set LCD as 4-bit mode*/
		HLD_I2cLcd_write4bit(0b0010);
		waitTime(45*TimeConst_100us);//wait 4.5ms
	}

	/*set # lines, font size, etc.*/
	HLD_Lcd.displayFunc = LCD_4BITMODE | LCD_2LINE | LCD_5x8DOTS;
	HLD_I2cLcd_command(LCD_FUNCTIONSET | HLD_Lcd.displayFunc);
	waitTime(50*TimeConst_10us);

	/*turn the display on with no cursor or blinking default*/
//	HLD_Lcd.displayCon = LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF ;
	HLD_Lcd.displayCon = LCD_DISPLAYON | LCD_CURSORON | LCD_BLINKON ;
	HLD_I2cLcd_command(LCD_DISPLAYCONTROL | HLD_Lcd.displayCon);
	waitTime(50*TimeConst_10us);

	//	HLD_Lcd.backlight = LCD_BACKLIGHT_ON;
	HLD_I2cLcd_clear();
	waitTime(50*TimeConst_10us);

	HLD_Lcd.displayMode = LCD_ENTRYLEFT | LCD_ENTRYSHIFTDECREMENT;
	HLD_I2cLcd_command(LCD_ENTRYMODESET | HLD_Lcd.displayMode);
	waitTime(50*TimeConst_10us);

/*
	HLD_I2cLcd_home();

	HLD_I2cLcd_write('a');
	HLD_I2cLcd_write('a');
	HLD_I2cLcd_write('a');
	HLD_I2cLcd_write('a');
*/
	HLD_I2cLcd_write('a');

	printf("I2cLcd initialized\n");
}

void HLD_I2cLcd_run(void)
{

}

/*******High level features*******/
void HLD_I2cLcd_clear(void)
{
	HLD_I2cLcd_command(LCD_CLEARDISPLAY);
	waitTime(2*TimeConst_1ms);
}

void HLD_I2cLcd_home(void)
{
	HLD_I2cLcd_command(LCD_RETURNHOME);
	waitTime(2*TimeConst_1ms);
}

/*******Mid level features*******/
IFX_STATIC void HLD_I2cLcd_command(uint8 data)
{
	uint8 highnip = data&0xf0;
	uint8 lownip = (data&0x0f)<<4;
	HLD_I2cLcd_write4bit(highnip);
	waitTime(50*TimeConst_10us);
	HLD_I2cLcd_write4bit(lownip);
	waitTime(50*TimeConst_10us);

}

IFX_STATIC void HLD_I2cLcd_write(uint8 data)
{
	uint8 highnip = data&0xf0;
	uint8 lownip = (data&0x0f)<<4;
	HLD_I2cLcd_write4bit((highnip)|Rs);
	waitTime(50*TimeConst_10us);
	HLD_I2cLcd_write4bit((lownip)|Rs);
	waitTime(50*TimeConst_10us);
}

/*******Low level features*******/
IFX_STATIC void HLD_I2cLcd_write4bit(uint8 data)
{
	byteBuffer = ((data<<4)|HLD_Lcd.backlight);
	HLD_I2c_writeData(&HLD_Lcd.I2c.driver.i2cDevice, &byteBuffer, 1);
	waitTime(1*TimeConst_1us);

	/*Clock pulse*/
	{
		/*CLK High for 1us (>450ns)*/
		byteBuffer |= En;
		HLD_I2c_writeData(&HLD_Lcd.I2c.driver.i2cDevice, &byteBuffer, 1);
		waitTime(1*TimeConst_1us);
		/*CLK low for 50us (>37us)*/
		byteBuffer &= ~(En);
		HLD_I2c_writeData(&HLD_Lcd.I2c.driver.i2cDevice, &byteBuffer, 1);
		waitTime(50*TimeConst_1us);
	}
}

