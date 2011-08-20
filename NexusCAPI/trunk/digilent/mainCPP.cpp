/*
 *
 */
#include <windows.h>
#include <stdio.h>
#include <tchar.h>
#include "./gendefs.h"
#include "./dpcdefs.h"	/* holds error codes and data types for dpcutil	*/
#include "./dpcutil.h"	/* holds declaration of DPCUTIL API calls		*/
#include "./DpcNexusAPI.h"
#include "./duration.h"



int
_tmain(int argc, _TCHAR* argv[]) {

unsigned int ix, iy, iz;
int idStatus = 0;
ERC erc;
unsigned int numdevices=0;
lpNexusDeviceInfo *pDeviceInfo=NULL;
LPNEXUS_DATA pDataSet = NULL;
LPNEXUS_DATA pDataGet = NULL;
BOOL st;
CDuration cd;


//Init App
if(!Nexus_InitApp(&erc))
  {
  _tprintf(_T("Can not Init the Application::Error msg: %s \n"), Nexus_GetStatus(erc));
  return 1;
  }

//run this only once to setup devices
//Nexus_DeviceTableConfig(NULL,&erc);



     

//Discover the Nexus devises
  numdevices = NexusDeviceFactory_DiscoverDevices(&pDeviceInfo, &erc);
  if(numdevices>0)
	for(ix=0; ix<numdevices;ix++){
		_tprintf(_T("Device %d, has a DevName: %s \n"), ix,pDeviceInfo[ix]->szDefDvcName);

     //Open Nexus Devices,
        st=Nexus_DeviceOpen(pDeviceInfo[ix], &erc, NULL);
		if(st)
           _tprintf(_T("Success Open Nexus Device %d \n"), ix);
		else
		{
		  _tprintf(_T("Failure Open Nexus Device %d, Err msg: %s\n"), ix, Nexus_GetStatus(erc));
          goto lCleanup;   
		}
	}



/******* Set/Get Config register *****************************************************/
pDataSet = Nexus_AllocateData(1);
if(pDataSet==NULL) 
  {
   Nexus_ReleaseDLLResource();
   _tprintf(_T("Memory alloc Error exiting... \n"));
   return 1;
   }

pDataGet = Nexus_AllocateData(1);
if(pDataGet==NULL) 
  {
  Nexus_ReleaseDLLResource();
  _tprintf(_T("Memory alloc Error exiting... \n"));
  return 1;
  }


_tprintf(_T("--------------------------------------------\n"));
_tprintf(_T("TESTING READING WRITING CONFIG REGISTER \n"));
_tprintf(_T("--------------------------------------------\n"));

pDataSet->data[0]=0x05;
cd.Start();
for(iy=0; iy<10; iy++)
{
//assuming only one Nexus device with index 0 found
if(Nexus_SetConfigReg(pDeviceInfo[0], &erc, NULL, pDataSet)) //synch/blocking call
{
	
       if(!Nexus_GetConfigReg(pDeviceInfo[0],&erc,NULL,pDataGet))
	   {
          _tprintf(_T("Failure Getting the CONFIG_REG %s \n"), Nexus_GetStatus(erc));
		  break;
	   }
       else
         {
          _tprintf(_T("Success Getting the CONFIG_REG with value %x \n"), pDataGet->data[0]);
	      if(pDataGet->data[0] != pDataSet->data[0])
	        {
		      _tprintf(_T("Failure: Success Getting the CONFIG_REG but data values are different \n"));
			  break;
	        }
         }
	
}
else
{
      _tprintf(_T("Failure Setting the CONFIG_REG %s \n"), Nexus_GetStatus(erc)); 
	  break;
}

//_tprintf(_T("Iteration number: %d \n"), iy);
}
cd.Stop();
_tprintf(_T("Number of Iterations: %d , execeuted for %f sec.\n"), iy, (cd.GetDuration())/1e6);

//Clean up
Nexus_FreeData(pDataSet);
Nexus_FreeData(pDataGet);


/**********************************************************************/
_tprintf(_T("------------------------------------------------\n"));
_tprintf(_T("TESTING READING WRITING NEXUS ADDRESS REGISTERS \n"));
_tprintf(_T("------------------------------------------------\n"));
/********************************************************************/
//Allocate memory

pDataSet = Nexus_AllocateData(3);
if(pDataSet==NULL) 
  {
   Nexus_ReleaseDLLResource();
   _tprintf(_T("Memory alloc Error exiting... \n"));
   return 1;
   }

pDataGet = Nexus_AllocateData(3);
if(pDataGet==NULL) 
  {
  Nexus_ReleaseDLLResource();
  _tprintf(_T("Memory alloc Error exiting... \n"));
  return 1;
  }

pDataSet->data[0]=0x01;
pDataSet->data[1]=0x02;
pDataSet->data[2]=0x03;

cd.Start();
for(iy=0; iy<10; iy++)
{
 if(!Nexus_SetAddressRegs(pDeviceInfo[0], &erc, NULL, pDataSet))
   {
     _tprintf(_T("Failure Setting THE ADDR_REG %s \n"), Nexus_GetStatus(erc)); 
     break;
   }

 if(!Nexus_GetAddressRegs(pDeviceInfo[0], pDataGet, &erc, NULL))
	 {
     _tprintf(_T("Failure GETTING THE ADDR_REG %s \n"), Nexus_GetStatus(erc)); 
     break;
   }
 for(iz=0; iz<3; iz++)
 {
  if(iz==2)
  {
    if((pDataGet->data[iz] & 0x3F)!=pDataSet->data[iz])
	  {
           _tprintf(_T("Failure Address Data with index %d mismatch\n"),iz);
		  break;
	  }
  }
  else
  {
	  if(pDataGet->data[iz]!=pDataSet->data[iz])
	  {
           _tprintf(_T("Failure Address Data with index %d mismatch\n"),iz);
		  break;
	  }
  }

 }
_tprintf(_T("Iteration number: %d \n"), iy);
}
cd.Stop();
_tprintf(_T("Number of Iterations: %d , execeuted for %f sec.\n"), iy, (cd.GetDuration())/1e6);


/******* End Set/Get Config register ****************************************************/
lCleanup:
// Close Nexus Devices
		if(numdevices>0){
			for(ix=0; ix<numdevices;ix++){
	           if(Nexus_DeviceClose(pDeviceInfo[ix],&erc))
				   _tprintf(_T("Device id %d, Dev Name: %s has been Closed \n"), ix,pDeviceInfo[ix]->szDefDvcName);
			   else
                   _tprintf(_T("Failure Closing Device id %d, DevName %s. Err msg %s  \n"), \
				                       ix,pDeviceInfo[ix]->szDefDvcName, Nexus_GetStatus(erc));
			}
		}

	//Free Nexus devices
	Nexus_FreeDevices(pDeviceInfo, numdevices);
	pDeviceInfo=NULL;

    //Free allocated data
	Nexus_FreeData(pDataSet);
	Nexus_FreeData(pDataGet);
	getchar(); //Pause
return 0;
}

