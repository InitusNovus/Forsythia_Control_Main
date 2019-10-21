/*
 * Multican.h
 *
 *  Created on: 2018. 8. 4.
 *      Author: bigbi_000
 */

#ifndef MULTICAN_H_
#define MULTICAN_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include <Ifx_Types.h>
#include "Configuration.h"
#include "ConfigurationIsr.h"

#include <IfxMultican_Can.h>

#include "HLD.h"
/******************************************************************************/
/*-----------------------------------Macros-----------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*------------------------------Type Definitions------------------------------*/
/******************************************************************************/
#define NUMCANMSG	10

#define CANMSGID00	0x0CF11E05
#define CANMSGID01	0x0CF11F05
#define CANMSGID02	0x00000001
#define CANMSGID03	0x00000002
#define CANMSGID04	0x00000003
#define CANMSGID05	0x00000004
#define CANMSGID06	0x00000005
#define CANMSGID07	0x00000006
#define CANMSGID08	0x00000007
#define CANMSGID09	0x00000008

#define CANTYPERX	0
#define CANTYPETX	1

/******************************************************************************/
/*--------------------------------Enumerations--------------------------------*/
/******************************************************************************/

/******************************************************************************/
/*-----------------------------Data Structures--------------------------------*/
/******************************************************************************/
typedef struct{
	boolean 				isUpdated;
	IfxMultican_Can_MsgObj	msgObj;
	IfxMultican_MsgObjId	msgObjId;
	uint32					msgId;
	sint8					nodeId;
	boolean					canId;
	boolean					canType;
	IfxMultican_Message		message;
}HLD_MultiCan_Message;


typedef struct{
	sint8					nodeId;
	boolean					canId;
	uint64					msgId;
	boolean					canType;
}HLD_Multican_msgConfig;


typedef struct{
	sint8					nodeId;
	IfxMultican_Can_Node 	ifxCanNode;
	IfxMultican_Rxd_In		*rxPin;
	IfxMultican_Txd_Out		*txPin;
	uint32					baudrate;
}HLD_MultiCan_Can_Node;

typedef struct
{
    struct
    {
    	struct{
    		IfxMultican_Can			can;
    		HLD_MultiCan_Can_Node   node0;
    		HLD_MultiCan_Can_Node   node1;
    		HLD_MultiCan_Can_Node   node2;
#if HLD_BOARD == HLD_BOARD_SB275
    		HLD_MultiCan_Can_Node   node3;
#endif
    		uint8					msgCnt;

    	}can0;
#if HLD_BOARD == HLD_BOARD_AK237
    	struct{
    		IfxMultican_Can			can;
    		HLD_MultiCan_Can_Node   node0;
    		HLD_MultiCan_Can_Node   node1;
    		HLD_MultiCan_Can_Node   node2;
    		uint8					msgCnt;
    	}can1;
#endif
    }drivers;
} Multican_t;
/******************************************************************************/
/*------------------------------Global variables------------------------------*/
/******************************************************************************/
IFX_EXTERN Multican_t g_Multican;

/******************************************************************************/
/*-------------------------Function Prototypes--------------------------------*/
/******************************************************************************/
IFX_EXTERN void HLD_Multican_init (void);
IFX_EXTERN void HLD_Multican_setMsgConfig(HLD_MultiCan_Message *msg, HLD_Multican_msgConfig config);
IFX_EXTERN void HLD_Multican_initMessage(HLD_MultiCan_Message *msg);

IFX_EXTERN void HLD_Multican_receiveMessage(HLD_MultiCan_Message *msg);
IFX_EXTERN void HLD_Multican_transmitMessage(HLD_MultiCan_Message *msg);
/******************************************************************************/
/*---------------------Inline Function Implementations------------------------*/
/******************************************************************************/


IFX_INLINE void HLD_Multican_setMessageId(HLD_MultiCan_Message *msg, uint32 msgId)
{
	msg->msgId = msgId;
}

IFX_INLINE void HLD_Multican_setNodeBaudrate(HLD_MultiCan_Can_Node *Node, uint32 baud)
{
	Node->baudrate = baud;
}

IFX_INLINE void HLD_Multican_resetUpdatedVaule(HLD_MultiCan_Message *msg)
{
	msg->isUpdated = FALSE;
}

IFX_INLINE void HLD_Multican_setMessage_data(uint32 data0, uint32 data1, HLD_MultiCan_Message *msg)
{
	msg->message.data[0] = data0;
	msg->message.data[1] = data1;
}

#endif /* 0_SRC_APPSW_TRICORE_HLD_BASICMODULES_MULTICAN_H_ */
