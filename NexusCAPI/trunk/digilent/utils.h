#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <string.h>
#include <tchar.h>

#ifdef __cplusplus
 extern "C" {
 #endif

#define MAX_NAME_LENGTH 128

extern void CharToWcharConv(char *chararr, TCHAR* tchararr);
extern TCHAR *NexusStrnCpy(TCHAR *destination, const TCHAR *source, int n);


 #ifdef __cplusplus
 }
 #endif 
#endif