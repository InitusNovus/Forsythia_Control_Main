/*
 * ShockValue.h
 *
 *  Created on: 2021. 5. 13.
 *      Author: Suprhimp
 */

#ifndef SRC_APPSW_TRICORE_SDP_SHOCKVALUE_SHOCKVALUE_H_
#define SRC_APPSW_TRICORE_SDP_SHOCKVALUE_SHOCKVALUE_H_

/******************************************************************************/
/*----------------------------------Includes----------------------------------*/
/******************************************************************************/
#include "SDP.h"
#include "CanCommunication.h"
#include "HLD.h"

typedef union
{
    struct{
        uint32 isUpdated;
        uint16 ShockValueL; 
        uint16 ShockValueR; 
    }S;
    uint32 RecievedData[2];
}ShockCanMsg_data_t;



IFX_EXTERN ShockCanMsg_data_t ShockCanMsgFront;
IFX_EXTERN ShockCanMsg_data_t ShockCanMsgRear;


IFX_EXTERN void SDP_ShockValue_init(void);
IFX_EXTERN void SDP_ShockValue_run_1ms(void);

#endif /* SHOCKVALUE_H */
