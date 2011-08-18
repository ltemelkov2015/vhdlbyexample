#include "./utils.h"



void CharToWcharConv(char *chararr, TCHAR* tchararr)
{
  int ix;
  if(chararr==NULL || tchararr==NULL || (sizeof(chararr) > sizeof(tchararr)))
  return;
  for(ix=0; ix<(int)strlen(chararr); ix++)
				  tchararr[ix] = chararr[ix];
   

}

/************************************************************************************
*************************************************************************************/
TCHAR * NexusStrnCpy(TCHAR *destination, const TCHAR *source, int n)
{
  int ix=0;

  if (!n || n > MAX_NAME_LENGTH)
	  return NULL;

  if (destination==NULL || source==NULL)
	  return NULL;
  
  if(sizeof(destination) < sizeof(source))
	  return NULL;
  
  memset((TCHAR*)destination,0,sizeof(destination));
  for(ix=0; ix < n; ix++)
	  destination[ix]=source[ix];
  

  return destination;

}