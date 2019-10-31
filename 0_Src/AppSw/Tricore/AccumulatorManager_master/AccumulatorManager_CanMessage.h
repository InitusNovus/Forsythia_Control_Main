/* 
 * AccumulatorManager_CanMessage.h
 * Created on: 2019. 10. 29.
 * Author: Dua
 */

#ifndef ACCUMULATORMANAGER_CANMASSAGE_H_
#define ACCUMULATORMANAGER_CANMASSAGE_H_

/* Includes */
// #include "AccumulatorManager_master.h"
#include "Ifx_Types.h"



/* Data Structures */
#define AMS_CAN_TX0_DLEN    8
typedef union 
{
    struct 
    {
        sint16 voltage;
        sint16 current;

        sint8 reserved;
        union 
        {
            uint8 U;
            struct 
            {
                boolean bms0:1;
                boolean bms1:1;
                uint8   tsal:2;
                boolean tempStatus:1;
                boolean reserved:2;
                boolean amsCut:1;
            }B;
        }status;
        union 
        {
            uint8 U;
            struct 
            {
                boolean V_Hi:1;
                boolean V_Lo:1;
                boolean I_Hi:1;
                boolean I_Lo:1;
                boolean reserved:4;
            }B;
        }err0;
        union 
        {
            uint8 U;
            struct 
            {
                boolean reserved:8;
            }B;
        }err1;
    }S;
    uint32 U[AMS_CAN_TX0_DLEN/4];
}AmsCanMsg0_data_t;

typedef struct 
{
	uint32 mul;
	uint32 div;
	float32 offset;
}AmsCanMsg_CanDataConstant;

#define AMS_CAN_TX1_DLEN    8
typedef union 
{
    struct 
    {
        sint8 temperature[8];
    }S;
    uint32 U[AMS_CAN_TX1_DLEN/4];
}AmsCanMsg1_data_t;

/* Global Variables */
IFX_EXTERN AmsCanMsg_CanDataConstant AmsCanMsg_voltageConst;
IFX_EXTERN AmsCanMsg_CanDataConstant AmsCanMsg_currentConst;
IFX_EXTERN AmsCanMsg_CanDataConstant AmsCanMsg_temperatureConst;

/* Inline Function Implementation */
IFX_INLINE sint32 AmsCanMsg_encodeData(float32 data, AmsCanMsg_CanDataConstant* constants)
{
	return (sint32)( ((float32)constants->div) / ((float32)constants->mul) * (data - constants->offset) );
}

IFX_INLINE float32 AmsCanMsg_decodeData(sint32 code, AmsCanMsg_CanDataConstant* constants)
{
	return (float32)( ((float32)constants->mul * (float32)code) / ((float32)constants->div) + (float32)constants->offset );
}



#endif