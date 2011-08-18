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



int
main(int argc, char * argv[]) {

unsigned int ix=0;
int idStatus = 0;
ERC erc;
unsigned int numdevices=0;
lpNexusDeviceInfo *pDeviceInfo=NULL;
LPNEXUS_DATA pDataSet = NULL;
LPNEXUS_DATA pDataGet = NULL;
BOOL st;


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
pDataSet->data[0]=0x05;
//assuming only one Nexus device with index 0 found
if(Nexus_SetConfigReg(pDeviceInfo[0], &erc, NULL, pDataSet)) //synch/blocking call
{
   if(!Nexus_GetConfigReg(pDeviceInfo[0],&erc,NULL,pDataGet))
       _tprintf(_T("Failure Getting the CONFIG_REG %s \n"), Nexus_GetStatus(erc));
   else
       _tprintf(_T("Success Getting the CONFIG_REG %h \n"), pDataGet->data[0]);
}
else
      _tprintf(_T("Failure Setting the CONFIG_REG %s \n"), Nexus_GetStatus(erc)); 

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
	getchar();
return 0;
}

#if 0

/* ------------------------------------------------------------ */

/***	FInit
**
**	Synopsis
**		void FInit()
**
**	Input:
**
**	Output:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Initialize application local variables.
**
*/

static BOOL
FInit() {

	ERC erc;
	int idDvc;

	/* Set up the command line argument defaults.
	*/
	fGetReg			= fFalse;
	fPutReg			= fFalse;
	fGetRegRepeat	= fFalse;
	fPutRegRepeat	= fFalse;
	fFirstParam		= fFalse;
	fDvctbl			= fFalse;

	/* DPCUTIL API CALL : DpcInit
	*/
	if (!DpcInit(&erc)) {
		return fFalse;
	}

	/* DPCUTIL API CALL : DvmgGetDefaultDev
	*/
	idDvc = DvmgGetDefaultDev(&erc);
	if (idDvc == -1) {
		printf("No default device\n");
		fDefDvc = fFalse;
		return fTrue;
	}
	else {
		fDefDvc = fTrue;
		/* DPCUTIL API CALL : DvmgGetDevName
		*/
		DvmgGetDevName(idDvc, szDefDvc, &erc);
		strcpy(szDefDvc, szDefDvc);
		return fTrue;
	}
}

/* ------------------------------------------------------------ */

/***	DoDvcTbl
**
**	Synopsis
**		void DoDvcTbl()
**
**	Input:
**
**	Output:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Makes API call to open Communication Devices dialog box
**
*/

static void
DoDvcTbl() {

	ERC erc;
	int idDvc;

	printf("Opening Communication Modules dialog box...\n");

	/* DPCUTIL API CALL : DvmgStartConfigureDevices
	*/
	DvmgStartConfigureDevices(NULL, &erc);

	/* DPCUTIL API CALL : DvmgGetDefaultDev
	*/
	idDvc = DvmgGetDefaultDev(&erc);
	if (idDvc == -1) {
		printf("No default device selected\n");
	}
	else {

		/* DPCUTIL API CALL : DvmgGetDevName
		*/
		DvmgGetDevName(idDvc, szDefDvc, &erc);
		printf("Default device selected:  %s\n", szDefDvc);
	}
}

/* ------------------------------------------------------------ */

/***	DoGetReg
**
**	Synopsis
**		void DoGetReg()
**
**	Input:
**		none
**
**	Output:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Gets a byte from, a specified register
**
*/

static void
DoGetReg() {

	BYTE	idReg;
	BYTE	idData;
	char *	szStop;

	ERC		erc;
	HANDLE	hif;


	idReg = (BYTE) strtol(szFirstParam, &szStop, 10);
	
	/* DPCUTIL API CALL : DpcOpenData 
	*	notice last parameter is set to NULL.  This is a blocking call
	*/
	if (!DpcOpenData(&hif, szDefDvc, &erc, NULL)) {
		printf("error=%d\n", erc);
		printf("DpcOpenData failed.\n");
		goto lFail;
	}

	/* DPCUTIL API CALL : DpcGetReg
	*/
	if (!DpcGetReg(hif, idReg, &idData, &erc, NULL)) {
		DpcCloseData(hif,&erc);
		printf("DpcGetReg failed.\n");
		goto lFail;
	}

	/* DPCUTIL API CALL : DpcGetFirstError
	*/
	erc = DpcGetFirstError(hif);

	if (erc == ercNoError) {
		/* DPCUTIL API CALL : DpcCloseData
		*/
		DpcCloseData(hif, &erc);
		printf("Complete!  Data received = %d\n", idData);
	}
	else{
		/* DPCUTIL API CALL : DpcCloseData
		*/
		DpcCloseData(hif, &erc);
		printf("An error occured while reading the register.\n", idData);
	}

lFail:
	return;

}

/* ------------------------------------------------------------ */

/***	DoPutReg
**
**	Synopsis
**		void DoPutReg()
**
**	Input:
**		none
**
**	Output:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Sends a byte to a specified register
**
*/

static void
DoPutReg() {


	BYTE	idReg;
	BYTE	idData;
	char *	szStop;
	ERC		erc;
	HANDLE	hif;
	TRID	trid;

	idReg = (BYTE) strtol(szFirstParam, &szStop, 10);
	idData = (BYTE) strtol(szSecondParam, &szStop, 10);
	
	/* DPCUTIL API CALL : DpcOpenData
	*	notice the last parameter is a TRID address.  This is a non-blocking call
	*/
	if (!DpcOpenData(&hif, szDefDvc, &erc, &trid)) {
		printf("error=%d\n", erc);
		printf("DpcOpenData failed.\n");
		goto lFail;
	}

	/* we must wait for the transaction to be completed before moving on */
	if (!DpcWaitForTransaction(hif, trid, &erc)) {
		DpcCloseData(hif, &erc);
		printf("error=%d\n", erc);
		printf("DpcOpenData failed.\n");
		goto lFail;
	}

	/* DPCUTIL API CALL : DpcGetReg
	*/
	if (!DpcPutReg(hif, idReg, idData, &erc, NULL)) {
		DpcCloseData(hif,&erc);
		printf("DpcGetReg failed.\n");
		goto lFail;
	}

	/* DPCUTIL API CALL : DpcGetFirstError
	*/
	erc = DpcGetFirstError(hif);

	if (erc == ercNoError) {
		/* DPCUTIL API CALL : DpcCloseData
		*/
		DpcCloseData(hif, &erc);
		printf("Complete!  Register set with data: %d.\n", idData);
	}
	else{
		/* DPCUTIL API CALL : DpcCloseData
		*/
		DpcCloseData(hif, &erc);
		printf("An error occured while setting the register.\n", idData);
	}

	lFail:
		return;
}

/* ------------------------------------------------------------ */

/***	DoGetRegRepeat
**
**	Synopsis
**		void DoGetRegRepeat()
**
**	Input:
**		none
**
**	Output:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Gets a stream of bytes from specified register
**
*/

static void
DoGetRegRepeat() {

	FILE *	fhout;
	long	cb;
	BYTE	idReg;
	char *	szStop;
	BYTE	rgbStf[cbBlockSize];
	int		cbGet, cbGetTotal;
	ERC		erc;
	HANDLE	hif;

	idReg	= (BYTE) strtol(szFirstParam, &szStop, 10);
	cb		=  strtol(szThirdParam, &szStop, 10);

	fhout = fopen(szSecondParam, "wb");
	if(fhout == NULL){
		printf("Cannot open file\n");
		goto lFail;
	}

	/* DPCUTIL API CALL : DpcOpenData
	*/
	if (!DpcOpenData(&hif, szDefDvc, &erc, NULL)) {
		printf("error=%d\n", erc);
		printf("DpcOpenData failed.\n");
		goto lFail;
	}

	if (hif == NULL) {
		printf("Cannot open device\n");
		goto lFail;
	}

	cbGet = 0;
	cbGetTotal = cb;
	while (cbGetTotal > 0) {
			
		if ((cbGetTotal - cbBlockSize) <= 0) {
			cbGet = cbGetTotal;
			cbGetTotal = 0;
		}
		else {
			cbGet = cbBlockSize;
			cbGetTotal -= cbBlockSize;
		}

		/* DPCUTIL API CALL : DpcGetRegRepeat
		*/
		if (!DpcGetRegRepeat(hif, idReg, rgbStf, cbGet, &erc, NULL)) {

			printf("DpcGetRegRepeat failed.\n");

			/* DPCUTIL API CALL : DpcCloseData
			*/
			DpcCloseData(hif, &erc);
			goto lFail;
		}
		fwrite(rgbStf, sizeof(BYTE), cbGet, fhout);
	}

	/* DPCUTIL API CALL : DpcCloseData
	*/
	DpcCloseData(hif, &erc);
	printf("Stream from register complete!\n");

lFail:
	if (fhout != NULL) {
		fclose(fhout);
	}
	return;
}

/* ------------------------------------------------------------ */

/***	DoPutRegRepeat
**
**	Synopsis
**		void DoPutRegRepeat()
**
**	Input:
**		none
**
**	Output:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Sends a stream of bytes to specified register
**
*/

static void
DoPutRegRepeat() {

	FILE *	fhin;
	long	cb;
	BYTE	idReg;
	char *	szStop;
	BYTE	rgbLd[cbBlockSize];
	int		cbSend, cbSendTotal, cbSendCheck;
	ERC		erc;
	HANDLE	hif;

	idReg	= (BYTE) strtol(szFirstParam, &szStop, 10);
	cb		=  strtol(szThirdParam, &szStop, 10);
	

	fhin = fopen(szSecondParam, "r+b");
	if (fhin == NULL) {
		printf("Cannot open file\n");
		goto lFail;
	}

	/* DPCUTIL API CALL : DpcOpenData
	*/
	if (!DpcOpenData(&hif, szDefDvc, &erc, NULL)) {
		printf("error=%d\n", erc);
		printf("DpcOpenData failed.\n");
		goto lFail;
	}

	if (hif == NULL) {
		printf("Cannot open device\n");
		goto lFail;
	}


	cbSendTotal = cb;
	cbSend = 0;

	while (cbSendTotal > 0) {

		if ((cbSendTotal - cbBlockSize) <= 0) {
			cbSend = cbSendTotal;
			cbSendTotal = 0;
		}
		else {
			cbSend = cbBlockSize;
			cbSendTotal -= cbBlockSize;
		}

		cbSendCheck = fread(rgbLd, sizeof(BYTE), cbSend, fhin);

		if (cbSendCheck != cbSend) {
			printf("Cannot read specified number of bytes from file.\n");
			/* DPCUTIL API CALL : DpcCloseData
			*/
			DpcCloseData(hif, &erc);
			goto lFail;
		}

		/* DPCUTIL API CALL : DpcPutRegRepeat
		*/
		if (!DpcPutRegRepeat(hif, idReg, rgbLd, cbSend, &erc, NULL)) {

			printf("DpcPutRegRepeat failed.\n");

			/* DPCUTIL API CALL : DpcCloseData
			*/
			DpcCloseData(hif, &erc);
			goto lFail;
		}
				
	}
	/* DPCUTIL API CALL : DpcCloseData
	*/
	DpcCloseData(hif, &erc);
	printf("Stream to register complete!\n");

lFail:
	if (fhin != NULL) {
		fclose(fhin);
	}
	return;
}

/* ------------------------------------------------------------ */

/***	FProcessCommandLine
**
**	Synopsis
**		BOOL FProcessCommandLine(argc, argv)
**
**	Input:
**		argc		- count of command line arguments
**		argv		- array of command line arguments
**
**	Output:
**		none
**
**	Errors:
**		returns fTrue if successful, fFalse if command line error
**
**	Description:
**		parses command line, determines what task the application 
**		must carry out.
**	
*/

static BOOL
FProcessCommandLine(int argc, char * argv[]) {

	BOOL		fStatus;
	BOOL		fInFile;
	int 		i		= 1;

	fStatus = fTrue;
	fInFile = fFalse;

	/* Examine the command line for user switches.
	*/
	if (argc == 1) {
		ShowUseage (argv[0]);
		exit (1);
	}

	while (argc > 1) {

		if (*argv[i] == '-') {
			/* Parse a command line switch
			*/
			argv[i] += 1;			/* bump to the switch character */
			switch (*(argv[i]++)) {

				case 'x':
					fDvctbl = fTrue;
					break;

				case 'g':
					fGetReg = fTrue;
					break;

				case 'p':
					fPutReg	= fTrue;
					break;

				case 'l':
					fPutRegRepeat = fTrue;
					break;

				case 's':
					fGetRegRepeat = fTrue;
					break;

				default:
					ShowUseage (argv[0]);
					exit (1);
			}
		}

		else {
			if (fGetReg) {
				if (!fFirstParam) {
					strcpy(szFirstParam, argv[i]);
					fFirstParam = fTrue;
				}
				else {
					printf("Invalid command line.\n");
					ShowUseage (argv[0]);
					exit (1);
				}
			}

			else if (fPutReg || fGetRegRepeat || fPutRegRepeat) {
				if (!fFirstParam) {
					strcpy(szFirstParam, argv[i]);
					fFirstParam = fTrue;
				}
				else if (!fSecondParam && fFirstParam) {
					strcpy(szSecondParam, argv[i]);
					fSecondParam = fTrue;
				}
				else if(fSecondParam) {
					strcpy(szThirdParam, argv[i]);
				}
				else {
					printf("Invalid command line.\n");
					ShowUseage (argv[0]);
					exit (1);
				}
			}
			else {
				printf("Invalid command line.\n");
				ShowUseage (argv[0]);
				exit (1);
			}
		}

		i += 1;
		argc -= 1;
	}
	return (fStatus);
}

/* ------------------------------------------------------------ */

/***	ShowUseage
**
**	Synopsis
**		VOID ShowUseage(sz)
**
**	Input:
**		sz			- command name string
**
**	Output:
**		none
**
**	Errors:
**		none
**
**	Description:
**		prints message to user detailing command line options
**
*/

static void
ShowUseage(char * sz)
	{

	printf ("\nDigilent DPCUTIL demo:  version %1.2f\n", idVer);
	printf ("  %s [options] <parameter 1> <parameter 2> <parameter 3>\n", sz);
	printf ("\n");
	printf ("\tOptions:\n");
	printf ("\t-x \t\t\t\t\tLaunch device dialog box\n");
	printf ("\t-g <register>\t\t\t\tGet register byte\n");
	printf ("\t-p <register> <data byte>\t\tPut register byte\n");
	printf ("\t-l <register> <filename> <# bytes>\tStream file into register\n");
	printf ("\t-s <register> <filename> <# bytes>\tStream register to file\n");
}

/************************************************************************/
#endif

