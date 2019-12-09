/*
 * ButtonFunc.c
 *
 *  Created on: 2019. 7. 2.
 *      Author: bigbi_000
 */

/* TODO:
 * Inherent Gpio_Debounce
 * 
 */
/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "HLD.h"
#include "UserInterface_Button.h"

/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/
#define BUFFER_MASK		(0xFFFFFFFF)
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


/******************************************************************************/
/*------------------------Private Variables/Constants-------------------------*/
/******************************************************************************/


/******************************************************************************/
/*-------------------------Function Implementations---------------------------*/
/******************************************************************************/
void HLD_UserInterface_buttonInitConfig(HLD_buttonConfig_t* config)
{
	config-> port = NULL_PTR;
	config-> callBack = NULL_PTR;
	config->bufferLen = HLD_buttonBufferLength_noDebounce;
}

void HLD_UserInterface_buttonInit(HLD_button_t* button, HLD_buttonConfig_t* config)
{
	int index = 0;
	button->port = config->port;
	button->callBack = config->callBack;
	button->on = FALSE;
	button->flag = FALSE;
	button->bufferLen = config->bufferLen;


	button->bufferMask = 0;
	for(index = 0; index < button->bufferLen; index++)
	{
		button->bufferMask |= 1<<index;
	}
	button->buffer = BUFFER_MASK;
	IfxPort_setPinModeInput(button->port->port, button->port->pinIndex, IfxPort_InputMode_pullUp);
}

boolean HLD_UserInterface_pollButton(HLD_button_t* button)
{
	boolean pinState = TRUE;
	pinState = IfxPort_getPinState(button->port->port,button->port->pinIndex);
	/*save previous values*/
	boolean preOn;
	boolean preFlag;
	preOn = button->on;
	preFlag = button->flag;

	/*Buffer update*/
	button->buffer = (button->buffer << 1)|(pinState&0x1);

	/*button state update*/
	if(button->bufferLen != HLD_buttonBufferLength_noDebounce)
	{	/*ON for low, OFF for high*/
		if(button->on)
		{
			if(((button->buffer)&(button->bufferMask)) == (button->bufferMask))
			{
				button->on = FALSE;
			}
		}
		else//button->on == FALSE
		{
			if(((button->buffer)&(button->bufferMask)) == 0)
			{
				button->on = TRUE;
			}
		}
	}
	else	//No Debouncing
	{
		if(pinState)
			button->on = FALSE;
		else
			button->on = TRUE;
	}

	/*flag update*/
	if((preOn == TRUE)&&(button->on == FALSE))	//Falling Edge
	{
		button->flag = FALSE;
	}
	if((preOn == FALSE)&&(button->on == TRUE))	//Rising Edge
	{
		button->flag = TRUE;
	}

	if(button->flag)
	{
		button->callBack();
		button->flag = FALSE;
	}

	return button->on;
}

