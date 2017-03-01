#include <stdio.h>
#include <stdarg.h>

#include "err.h"

int eprintf(char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	int result = vfprintf(stderr, fmt, args);
	va_end(args);
	return result;
}
