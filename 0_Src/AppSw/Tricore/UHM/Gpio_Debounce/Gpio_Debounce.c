/* 
 * Gpio_Debounce.c
 * Created on: 2019. 10. 25.
 * Author: Dua
 */

/* TODO:
 *	Active high mode
 *	To be included by HLD
 *  Userinterface button
 */

/* Includes */
#include "Gpio_Debounce.h"

void Gpio_Debounce_initInput(Gpio_Debounce_input* input, Gpio_Debounce_inputConfig* config)
{
	int index = 0;
	input->port = config->port;
	input->on = FALSE;
	input->flag = FALSE;
	input->bufferLen = config->bufferLen;


	input->bufferMask = 0;
	for(index = 0; index < input->bufferLen; index++)
	{
		input->bufferMask |= 1<<index;
	}
	input->buffer = 0;
	IfxPort_setPinModeInput(input->port->port, input->port->pinIndex, IfxPort_InputMode_noPullDevice);
}
boolean Gpio_Debounce_pollInput(Gpio_Debounce_input* input)
{
    boolean pinState;
    pinState = IfxPort_getPinState(input->port->port,input->port->pinIndex);
    	/*save previous values*/
	boolean preOn;
	boolean preFlag;
	preOn = input->on;
	preFlag = input->flag;

    /*Buffer update*/
	input->buffer = (input->buffer << 1)|(pinState&0x1);

	/*input state update*/
	if(input->bufferLen != Gpio_Debounce_BufferLength_noDebounce)
	{
		if(input->on)
		{
			if(((input->buffer)&(input->bufferMask)) == 0)
			{
				input->on = FALSE;
			}
		}
		else//input->on == FALSE
		{

            if(((input->buffer)&(input->bufferMask)) == (input->bufferMask))
			{
				input->on = TRUE;
			}
		}
	}
	else	//No Debouncing
	{
		if(pinState)
			input->on = FALSE;
		else
			input->on = TRUE;
	}

	return input->on;
}

void Gpio_Debounce_initInputConfig(Gpio_Debounce_inputConfig* config)
{
	config-> port = NULL_PTR;
	config->bufferLen = Gpio_Debounce_BufferLength_noDebounce;
}