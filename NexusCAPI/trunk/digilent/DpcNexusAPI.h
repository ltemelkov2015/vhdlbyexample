/* Nexus 2 API function declaration*/

#ifndef DPCNEXUSAPI_H
#define DPCNEXUSAPI_H


#include "./dpcdefs.h"
#include <tchar.h>


/**
* Structure that holds Device Information
* @param szDefDvcName   Name of the Nexus Device 
* @param  szDvcType     Type of the Nexus Device string
* @iDvcTblIndex         Index of the device in the device Table
* @iDeviceType          Numeric type of the device integer
*/

typedef struct NexusDeviceInfo{ 
	TCHAR szDefDvcName[MAX_NAME_LENGTH]; 
	char  szDeviceName[MAX_NAME_LENGTH];
    TCHAR Interface[MAX_NAME_LENGTH]; 
	int   iDvcTblIndex;
    int   iDeviceType;
	void  *user;
	HANDLE hif;
  } NexusDeviceInfo, *lpNexusDeviceInfo;



typedef struct NEXUS_DATA
{
    unsigned char *data;
    unsigned int  size;
} NEXUS_DATA, *LPNEXUS_DATA;


extern BOOL            Nexus_InitApp(ERC *perc);
extern int             Nexus_GetDefaultId(ERC *erc);
extern unsigned int    NexusDeviceFactory_DiscoverDevices(lpNexusDeviceInfo **pDevInfo, ERC *perc);
extern void            NexusDeviceFactory_CreateDevice(lpNexusDeviceInfo *pDevInfo,int idvc, ERC *perc);
extern void            Nexus_FreeDevices(lpNexusDeviceInfo *devices, int count);
extern void            Nexus_FreeDevice(lpNexusDeviceInfo device);
extern void            Nexus_DeviceTableConfig(HWND hWnd, ERC *erc);
extern BOOL            Nexus_DeviceOpen(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid);
extern BOOL            Nexus_DeviceClose(lpNexusDeviceInfo pDevInfo, ERC *perc);
extern NEXUS_STATUS    NexusDeviceFactory_InitDevice(lpNexusDeviceInfo pDevInfo);
extern TCHAR *         Nexus_GetStatus(ERC err);
extern void            Nexus_ReleaseDLLResource(void);
extern BOOL            Nexus_SetConfigReg(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData);
extern BOOL            Nexus_GetConfigReg(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData);
extern BOOL            Nexus_SetAddressRegs(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData);
extern BOOL            Nexus_GetAddressRegs(lpNexusDeviceInfo pDevInfo, LPNEXUS_DATA lpData, ERC *perc, TRID *ptrid);
extern BOOL            Nexus_SetDataRegs(lpNexusDeviceInfo pDevInfo, ERC *perc, TRID *ptrid, LPNEXUS_DATA lpData);
extern BOOL            Nexus_GetDataRegs(lpNexusDeviceInfo pDevInfo, LPNEXUS_DATA lpData, ERC *perc, TRID *ptrid);

/********************************************************************************
 * MEMORY FUNCTIONS
 ********************************************************************************/

/**
 * Allocates a data buffer.
 * @param size Size of buffer to allocate.
 */
LPNEXUS_DATA 
Nexus_AllocateData(
    int size
    );

/**
 * Frees a data buffer.
 * @param lpData Data to free
 */
void 
Nexus_FreeData(
    LPNEXUS_DATA     lpData
    );


#endif
