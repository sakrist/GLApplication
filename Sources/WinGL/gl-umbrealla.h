#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <gl/GL.h>
#include "glext.h"
#include "glcorearb.h"

#if !WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP)
    #error "THIS SHOULD BE SET"
#endif


