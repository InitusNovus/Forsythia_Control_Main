/*
 * SteeringWheel.h
 * Created on: 2020.08.05
 * Author: Dua
 */
#ifndef STEERINGWHEEL_CANMESSAGE_H_
#define STEERINGWHEEL_CANMESSAGE_H_

/************************* Data Structures ***************************/
typedef union
{
	struct 
	{
		uint8 vehicleSpeed;		//byte0;	//SDP
		uint8 lowestVoltage;	//byte1;	//BMS
		uint8 highestTemp;		//byte2;	//BMS
		uint8 bmsTemp;			//byte3;	//BMS
		uint8 soc;				//byte4;	//BMS
		uint8 averageTemp;		//byte5		//BMS
		union 					//byte6~7;	//RVC
		{
			uint16 U;
			struct 
			{
				uint16 r2d:4;
				uint16 appsError:1;
				uint16 bppsError:1;
				uint16 reserved:10; 
			}S;
		}status;
	}S;
	uint32 U[2];
}SteeringWheel_canMsg1_t;

typedef union 
{
	struct 
	{
		uint16 apps;				//byte0~1;		//RVC
		uint16 bpps;				//byte2~3;		//RVC
		uint16 lvBatteryVoltage;	//byte4~5;		//RVC
		uint16 accumulatorVoltage;	//byte6~7;		//BMS
	}S;
	uint32 U[2];
}SteeringWheel_canMsg2_t;

#endif