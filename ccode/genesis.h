#ifndef GENESIS_H
#define GENESIS_H

#include "uthash/include/uthash.h"

typedef struct color {
	int r;
	int g;
	int b;
} color_t;

typedef struct position {
	int x;
	int y;
	
} position_t;

//what is our implementation here?
typedef struct cluster{
	position_t position;
	color_t color;
	int height;
	int width;
	const char *name;
	struct cluster *next;
	UT_hash_handle hh;
} cluster_t;

typedef struct board {
	const char* name;
	color_t color;
	int height;
	int width;
	cluster_t clusters;
	UT_hash_handle hh;

} board_t;

#endif