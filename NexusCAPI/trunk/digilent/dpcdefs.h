/************************************************************************/
/*																		*/
/*	dpcdefs.h  --	Type and constant definitions for DPCUTIL.DLL		*/
/*																		*/
/************************************************************************/
/*	Author:		Gene Apperson											*/
/*	Copyright 2003, 2004, Digilent, Inc.								*/
/************************************************************************/
/*  File Description:                                                   */
/*                                                                      */
/*	General symbol and type definitions used by the Digilent DPCUTIL	*/
/*	and JTSC DLL's.														*/
/*                                                                      */
/************************************************************************/
/*  Revision History:                                                   */
/*                                                                      */
/*	04/10/2003(Seth): Created											*/
/*	07/22/2004(GeneA): cleaned up for initial public release			*/
/*                                                                      */
/************************************************************************/

#if !defined(DPCDEFS_INCLUDED)
#define	DPCDEFS_INCLUDED

#include "./gendefs.h"
#define MAX_NAME_LENGTH 128
/* ------------------------------------------------------------ */
/*				Type Declarations								*/
/* ------------------------------------------------------------ */

typedef WORD	TRID;	/* Transaction ID type */
typedef int		ERC;	/* Error code type */
typedef int		TRT;	/* Transaction type */
typedef int		STS;	/* Transaction status type */
typedef int		IFD;	/* Interface ID */
typedef long	IFP;
typedef int		DVCT;	/*Interface device type*/

/* Transaction status structure, 
** holds status information about a transaction 
*/

typedef struct tagTRS {
	TRT		trt;		/* transaction type */
	TRID	trid;		/* transaction ID */
	STS		sts;		/* status of transaction */
	ERC		erc;		/* error code for transaction */
}TRS;


/* ------------------------------------------------------------ */
/*				Constant Declarations							*/
/* ------------------------------------------------------------ */

//const int	cchDevNameMax = 32;


/* Transaction type codes
*/
typedef enum NEXUS_TRANSACTION_CODE{
      trtOpenJtag			= 0x01,
      trtCloseJtag			= 0x02,
      trtSetTmsTdiTck		= 0x03,
      trtPutTdiBits			= 0x04,
      trtPutTmsTdiBits		= 0x05,
      trtGetTdoBits			= 0x06,
      trtSetJtsel			= 0x07,
      trtOpenSpi            = 0x21,
      trtCloseSpi           = 0x22,
      trtEnableSpi          = 0x23,
      trtDisableSpi         = 0x24,
      trtSetSpiSelect       = 0x25,
      trtSetSpiMode         = 0x26,
      trtPutSpiByte         = 0x27,
      trtPutSpi             = 0x28,
      trtGetSpi             = 0x29,
      trtOpenData			= 0x81,
      trtCloseData			= 0x82,
      trtSetDataPins		= 0x83,
      trtGetDataPins		= 0x84,
      trtSendDataByte		= 0x85,
      trtGetDataByte		= 0x86,
      trtSendDataBytes		= 0x87,
      trtGetDataBytes		= 0x88,
      trtSendDataStream		= 0x89,
      trtGetDataStream		= 0x8a,
      trtSendGetDataBytes	= 0x8b,
      trtGetVersion			= 0x8c,
      trtStreamWrite    	= 0x8d,
      trtStreamRead			= 0x8e
}NEXUS_TRANSACTION_CODE;


typedef enum _iodevtype
{
	dvctEthernet =0x00,
    dvctUSB =0x01, 
    dvctSerial= 0x02,
    dvctParallel= 0x03
}NEXUS_DEVICE_TYPE;


/* Error codes
*/
typedef enum NEXUS_STATUS {
          ercNoError          = 0,
          ercConnReject       = 3001,
          ercConnType         = 3002,
          ercConnNoMode       = 3003,
          ercInvParam         = 3004,
          ercInvCmd           = 3005,
          ercUnknown          = 3006,
          ercJtagConflict     = 3007,
          ercNotImp           = 3008,
          ercNoMem            = 3009,
          ercTimeout          = 3010,
          ercConflict         = 3011,
          ercBadPacket        = 3012,
          ercInvOption        = 3013,
          ercAlreadyCon       = 3014,
          ercConnected        = 3101,
          ercNotInit          = 3102,
          ercCantConnect      = 3103,
          ercAlreadyConnect   = 3104,
          ercSendError        = 3105,
          ercRcvError         = 3106,
          ercAbort            = 3107,
          ercTimeOut          = 3108,
          ercOutOfOrder       = 3109,
          ercExtraData        = 3110,
          ercMissingData      = 3111,
          ercTridNotFound     = 3201,
          ercNotComplete      = 3202,
          ercNotConnected     = 3203,
          ercWrongMode        = 3204,
          ercWrongVersion     = 3205,
          ercDvctableDne	  = 3301,
          ercDvctableCorrupt  = 3302,
          ercDvcDne			  = 3303,
          ercDpcutilInitFail  = 3304,
          ercUnknownErr		  = 3305,
          ercDvcTableOpen	  = 3306,
          ercRegError		  = 3307,
          ercNotifyRegFull	  = 3308,
          ercNotifyNotFound	  = 3309,
          ercOldDriverNewFw	  = 3310,
          ercInvHandle  	  = 3311,
		  ercInvMemAlloc      = 3312,
		  ercFailure          = 3313,
		  ercUnknownInterface = 3314,
		  ercInvId            = 3315,
		  ercInvDataSize      = 3316
		  

}NEXUS_STATUS;


/* Transaction status codes
*/
//const STS stsNew		= 1;
//const STS stsComplete	= 2;

/* ------------------------------------------------------------ */

#endif					// DPCDEFS_INCLUDED

/************************************************************************/
