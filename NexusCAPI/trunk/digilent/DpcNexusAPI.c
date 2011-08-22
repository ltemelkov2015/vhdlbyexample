/*
 * DpcNexusAPI.c
 * Added memset function to Nexus_AllocateData() Api: 08/22/2011
 */

#include <windows.h>
#include "./DpcNexusAPI.h"
#include <stdio.h>
#include <stdlib.h>
#include <tchar.h>
#include "./dpcutil.h"
#include <string.h>
#include "./utils.h"
#include "./nexusdefs.h"


TCHAR *
Nexus_GetStatus(ERC err){
    
   switch (err)
    {
       case 0:
          return _T("No error occured in transaction");
       case  3001: 
          return _T("Device connection reject");
       case  3002:
          return _T("Connection type error");
       case  3003:
          return _T("Connection no mode");
       case  3004:
          return _T("Invalid parameter sent in API call");
       case  3005:
          return _T("Invalid command"); 
       case  3006:
          return _T("Unknown error");
       case  3007:
          return _T("JTAG conflict");
       case  3008:
          return _T("Not implemented");
       case  3009:
          return _T("Not enough memory to carry out transaction");
       case  3010:
          return _T("Time Out");
       case  3011:
          return _T("Conflict");
       case  3012:
          return _T("Bad Packet");
       case  3013:
          return _T("Invalid option");
       case  3014:
          return _T("Already connected");
       case  3101:
          return _T("Connected");
       case  3102:
          return _T("Communication device not initialized");
       case  3103:
          return _T("Can not connect");
       case  3104:
          return _T("Already connected");
       case  3105:
          return _T("Error sending data");
       case  3106:
          return _T("Error receiving data ");
       case  3107:
          return _T("Error while aborting transaction");
       case  3108:
          return _T("Time Out");
       case  3109:
          return _T("Completion out of order");
       case  3110:
          return _T("Extra data received");
       case  3111:
          return _T("Nothing to send or data/address mismatch");
       case  3201:
          return _T("No matching TRID in queue");
       case  3202:
          return _T("Transaction not complete");
       case  3203:
          return _T("Not connected to comm device");
       case  3204:
          return _T("Connected in wrong mode");
       case  3205:
          return _T("Wrong ver.");
       case  3301:
          return _T("Device table does not exist");
       case  3302:
          return _T("Device table corrupted");
       case  3303:
          return _T("Device not found in device table");
       case  3304:
          return _T("DpcInit() call failed");
       case  3305:
          return _T("Unknown Error");
       case  3306:
          return _T("Device table open");
       case  3307:
          return _T("Registry error");
       case  3308:
          return _T("Notify registry full"); 
       case  3309:
          return _T("Notify not found");
       case  3310:
          return _T("Old driver new fw.");
       case  3311:
          return _T("Invalid handle");    
	   case  3312:
	      return _T("Application Memory Alloc Error");
	   case 3313:
	      return _T("Generic Failure");
	   case 3314:
		  return _T("Unknown Nexus Device Interface");
	   case 3315:
	      return _T("Nexus Device Invalid ID");
	   case 3316:
		   return _T("Nexus Invalid Data Size");
	   default:
	      return _T("Undetermined");
		  
    }   
}




#ifdef WIN32
BOOL   Nexus_InitApp(ERC *perc){

return(DpcInit(perc));
}
/************************************************************************************
*************************************************************************************/
unsigned int 
NexusDeviceFactory_DiscoverDevices(lpNexusDeviceInfo **pDevInfo, ERC *perc)
{
 int devcount=0;
 unsigned int deviceCount=0;
 int ix=0;
  
 devcount=DvmgGetDevCount(perc);
 if(devcount)
	   *pDevInfo =(lpNexusDeviceInfo *)malloc(devcount*sizeof(lpNexusDeviceInfo ));
       if(*pDevInfo==NULL)
	   {
         *perc=3312; //App Mem alloc error
		 goto failure;
	   }
       memset(*pDevInfo,0,(devcount*sizeof(lpNexusDeviceInfo)));
       for(ix=0; ix<devcount; ix++)
	   {
	      NexusDeviceFactory_CreateDevice(&(*pDevInfo)[deviceCount],ix, perc);
          if (*perc!=ercNoError) 
			  goto failure;
		  else
              deviceCount++;
	    }
 return deviceCount;

failure:
    return 0;
}


/************************************************************************************
*************************************************************************************/
void    
NexusDeviceFactory_CreateDevice(lpNexusDeviceInfo *pDevInfo,int idvc, ERC *perc)
  {
   char DeviceName[MAX_NAME_LENGTH]={0}; 
   TCHAR t_DeviceName[MAX_NAME_LENGTH] ={0};
   int dvtp;

   if(idvc==-1){
	   *perc=3315; //Invalid Device ID
	   return;
   }

   *pDevInfo = (lpNexusDeviceInfo)malloc(sizeof(NexusDeviceInfo));
   if(*pDevInfo==NULL)
       {
	    *perc=3312;//App mem alloc failure
		return;
       }
	  memset((*pDevInfo),0,sizeof(NexusDeviceInfo));
	  DvmgGetDevName(idvc, DeviceName, perc);  //Get name from index in device table
	  CharToWcharConv(DeviceName, t_DeviceName);  
      DvmgGetDevType(idvc, &dvtp, perc);
	  switch (dvtp)
	  {
		  case dvctEthernet:
			   NexusStrnCpy((*pDevInfo)->Interface,_T("ETHERNET"),8);
			   break;
		  case dvctUSB:
			   NexusStrnCpy((*pDevInfo)->Interface,_T("USB"),3);
			   break;
		  case dvctSerial:
			   NexusStrnCpy((*pDevInfo)->Interface,_T("SERIAL COM"),10);
			   break;
		  case dvctParallel:
			   NexusStrnCpy((*pDevInfo)->Interface,_T("PARALLEL LPT"),12);
			   break;
		  default:
			  *perc=3314;
			   NexusStrnCpy((*pDevInfo)->Interface,_T("UNKNOWN"),7);
			  
	  }
	  NexusStrnCpy((*pDevInfo)->szDefDvcName,t_DeviceName, MAX_NAME_LENGTH);
	  strcpy((*pDevInfo)->szDeviceName,DeviceName);
	  (*pDevInfo)->iDvcTblIndex=idvc;
	  (*pDevInfo)->iDeviceType=dvtp;
	  (*pDevInfo)->user=NULL;
	  (*pDevInfo)->hif=NULL;
 }

#endif



/****************************************************************
****************************************************************/
void 
Nexus_FreeDevices(lpNexusDeviceInfo *devices, int count)
{
int ix=0;
if(devices==NULL)
   return;
else
  for(ix=0; ix<count; ix++)
      free(devices[ix]);
  
free(devices);
}

/******************************************************************************
******************************************************************************/
void
Nexus_FreeDevice(lpNexusDeviceInfo device){
if (device==NULL)
    return;
free(device);
free(&device);
}
/***************************************************************************
****************************************************************************/
void  
Nexus_DeviceTableConfig(HWND hWnd, ERC *perc)
{
DvmgStartConfigureDevices(hWnd, perc);
}


/*************************************************************************
**************************************************************************/
BOOL 
Nexus_DeviceOpen(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid)
{
 return(DpcOpenData(&(pDevInfo->hif),pDevInfo->szDeviceName, perc, ptrid));
}


/****************************************************************************
*****************************************************************************/
BOOL  
Nexus_DeviceClose(lpNexusDeviceInfo pDevInfo, ERC *perc){
	BOOL status;
	status = DpcCloseData(pDevInfo->hif,perc);
	Nexus_ReleaseDLLResource(); //Clean up DLL recources
	return status;
}

/****************************************************************************
*****************************************************************************/
void
Nexus_ReleaseDLLResource(void)
{
 DpcTerm();
}

/****************************************************************************
*****************************************************************************/
int  Nexus_GetDefaultId(ERC *perc){
return(DvmgGetDefaultDev(perc));
}

/****************************************************************************

--Table:1
-- internal addressable registersp
-- MemControlReg:
   -- bit 0  lb_en   '0'en, '1' dis
   -- bit 1  ub_en   '0'en, '1' dis
   -- bit 2  aiw(addres auto increment write)  '1'- enable, '0' dis
   -- bit 3  air(address auto increment read)  '1'- enable, '0' dis
        -- bit 4-7 "xxxx"

***********************************************************************************************/
BOOL Nexus_SetConfigReg(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData){


if(lpData==NULL)
{
 *perc=3312;
 return fFalse;
}
else if(lpData->size!=1)
{
 *perc=3316;
 return fFalse;
}
 
 
if(!DpcPutReg(pDevInfo->hif,CONFIG_REG, lpData->data[0], perc, ptrid))
  return fFalse;
 
return fTrue;
}

/*******************************************************************************************
********************************************************************************************/
BOOL   Nexus_GetConfigReg(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData){
	if(lpData==NULL)
       {
        *perc=3312;
        return fFalse;
       }
    else if(lpData->size!=1)
      {
	   *perc=3316;
	   return fFalse;
      }

	return(DpcGetReg(pDevInfo->hif,CONFIG_REG, &(lpData->data[0]),perc, ptrid));
}
/**********************************************************************************************
***********************************************************************************************/
BOOL Nexus_SetAddressRegs(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData){

BYTE addr_ix;

if(lpData==NULL)
{
 *perc=3312;
 return fFalse;
}
else if(lpData->size!=3)
{
	*perc=3316;
	return fFalse;
}
 for(addr_ix=0;addr_ix<3; addr_ix++)
 {
	 if(!DpcPutReg(pDevInfo->hif,addr_ix, lpData->data[addr_ix], perc, ptrid))
		 return fFalse;
 }
return fTrue;
}

/***************************************************************************************************
****************************************************************************************************/
BOOL Nexus_GetAddressRegs(lpNexusDeviceInfo pDevInfo, LPNEXUS_DATA lpData, ERC *perc, TRID *ptrid){

BYTE addr_ix=0;
if(lpData==NULL)
{
 *perc=3312;
  return fFalse;;
}
else if(lpData->size!=3)
{
	*perc=3316;
	return fFalse;
}

for(addr_ix=0;addr_ix<3; addr_ix++)
 {
	 if(!DpcGetReg(pDevInfo->hif,addr_ix, &(lpData->data[addr_ix]), perc, ptrid))
		return fFalse;	 
 }

return fTrue;
}

/*****************************************************************************
*****************************************************************************/
LPNEXUS_DATA 
Nexus_AllocateData(
    int size
    )
{

LPNEXUS_DATA lpData=NULL;

if (size < 0)
{
    return NULL;
}

lpData = (LPNEXUS_DATA )malloc(sizeof(NEXUS_DATA));
if(lpData==NULL)
   return NULL;
memset(lpData,0,sizeof(NEXUS_DATA)); 
lpData->data = (BYTE *)malloc(size*sizeof(BYTE));
  if (lpData->data==NULL)
      goto failure;
  else
  {
	  memset(lpData->data, 0, size*sizeof(BYTE));
	  lpData->size = size;
	  return lpData;
  }
   
failure:
 lpData->size=0;
 lpData->data=NULL;
 free(lpData);
 return NULL;
}


/**************************************************************************
***************************************************************************/
void 
Nexus_FreeData(
    LPNEXUS_DATA     lpData
    )
{
if (lpData==NULL)
    return;

free(lpData->data);
lpData->size=0;
free(lpData);
}

/**************************************************************************
***************************************************************************/
BOOL Nexus_SetDataRegs(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData){
BYTE addr_ix;

if(lpData==NULL)
{
 *perc=3312;
 return fFalse;
}
else if(lpData->size!=2)
{
	*perc=3316;
	return fFalse;
}

 for(addr_ix=0;addr_ix<2; addr_ix++)
 {
	 if(!DpcPutReg(pDevInfo->hif,addr_ix + 3, lpData->data[addr_ix], perc, ptrid))
		 return fFalse;
 }
return fTrue;
}

/**************************************************************************************
***************************************************************************************/
BOOL Nexus_GetDataRegs(lpNexusDeviceInfo pDevInfo, LPNEXUS_DATA lpData, ERC *perc, TRID *ptrid){
BYTE addr_ix=0;

if(lpData==NULL)
{
 *perc=3312;
  return fFalse;
}
else if(lpData->size!=2)
{
	*perc=3316;
	return fFalse;
}


for(addr_ix=0;addr_ix<2; addr_ix++)
 {
	 if(!DpcGetReg(pDevInfo->hif,addr_ix + 3, &(lpData->data[addr_ix]), perc, ptrid))
		 return fFalse;	 
 }

return fTrue;
}

/**************************************************************************************
***************************************************************************************/