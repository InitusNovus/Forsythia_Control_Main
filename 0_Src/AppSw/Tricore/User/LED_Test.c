#include "HLD.h"
#include "LED_Test.h"

//#define BINARY

void LED_blinking (void)
{
/*

	static uint8 LED_counter = 0;
	LED_counter ++;
#ifdef BINARY
	if(LED_counter == 16)
	{
		LED_counter = 0;
	}
	HLD_Led_setLedBinary(LED_counter);
#else
	if(LED_counter == 2)
	{
		LED_counter = 0;
	}
	if(HLD_GptEncoder.speed >= 2)
	{
		HLD_Led_setLedBinary(0b1111);
	}
	else if(HLD_GptEncoder.speed >= 1.5)
	{
		HLD_Led_setLedBinary(0b0111);
	}
	else if(HLD_GptEncoder.speed >=1)
	{
		HLD_Led_setLedBinary(0b0011);
	}
	else if(HLD_GptEncoder.speed >= 0.5)
	{
		HLD_Led_setLedBinary(0b0001);
	}
	else
	{
		if(LED_counter == 0)
		{
			if(HLD_Led_getLedState() == 0b0000)
			{
				HLD_Led_setLedBinary(0b0001);
			}
			else
			{
				HLD_Led_setLedBinary(0b0000);
			}
		}
	}
#endif
*/

}
