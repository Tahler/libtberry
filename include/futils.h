#ifndef _TBERRY_FILE_UTILS_H
#define _TBERRY_FILE_UTILS_H

#include <stdbool.h>
#include <stdio.h>

/*
 * Returns true if a file at @path exists; false otherwise
 */
bool fexists(char *filename);

/*
 * Returns the size of file @f in bytes
 */
long fsizeof(FILE *f);

#endif /* _TBERRY_FILE_UTILS_H */
