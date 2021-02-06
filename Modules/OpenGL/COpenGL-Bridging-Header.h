
#ifndef GL_GLEXT_PROTOTYPES
#define GL_GLEXT_PROTOTYPES 1
#endif

#ifdef __APPLE__
#include <OpenGL/gl.h>
#else
#include <sys/types.h>
#include <GL/gl.h>
#include <GL/glext.h>
#include <GL/glx.h>
#endif
