#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>

#include "futils.h"

bool fexists(char *path)
{
	return access(path, F_OK) == 0;
}

unsigned long fsizeof(FILE *f)
{
	unsigned long curr = (unsigned long) ftell(f);
	fseek(f, 0, SEEK_END);
	unsigned long end = (unsigned long) ftell(f);
	fseek(f, curr, SEEK_SET);
	return end;
}
