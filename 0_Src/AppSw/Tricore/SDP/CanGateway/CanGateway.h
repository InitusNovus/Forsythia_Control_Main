#ifndef CANGATEWAY_H_
#define CANGATEWAY_H_


#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"
#include <stdint.h>
#include "Multican.h"
#include "CanCommunication.h"

typedef union 
{
	struct 
	{
		uint8 inverterFLTemp;		//byte0;		//Inverter
		uint8 motorFLTemp;			//byte1;		//Inverter
		uint8 inverterRLTemp;        //byte2;		//Inverter
		uint8 motorRLTemp;			//byte3;		//Inverter
		uint8 inverterRRTemp;		//byte0;		//Inverter
		uint8 motorRRTemp;			//byte1;		//Inverter
		uint8 inverterFRTemp;        //byte2;		//Inverter
		uint8 motorFRTemp;			//byte3;		//Inverter
	}S;
	uint32 U[2];
}CanGatewayMsg_t;

IFX_EXTERN void CanGateway_init();
IFX_EXTERN void CanGateway_run();

#endif