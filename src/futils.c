#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>

#include "futils.h"

bool fexists(char *path)
{
	return access(path, F_OK) == 0;
}

long fsizeof(FILE *f)
{
	long curr = ftell(f);
	fseek(f, 0, SEEK_END);
	long end = ftell(f);
	fseek(f, curr, SEEK_SET);
	return end;
}
