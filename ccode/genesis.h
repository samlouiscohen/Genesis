#ifndef GENESIS_H
#define GENESIS_H

#include "uthash/include/uthash.h"
#include "uthash/include/utlist.h"

#include <stdbool.h>




typedef struct color {
	int r;
	int g;
	int b;
} color;

typedef struct position {
	int x;
	int y;
	
} position_t;

//what is our implementation here?
typedef struct cluster{
	int x;
	int y;
	int dx;
	int dy;
	color color;
	int height;
	int width;
	const char *name;
	int id;
	bool draw;
	UT_hash_handle hh;
} cluster_t;

typedef struct board {
	const char* name;
	color color;
	int height;
	int width;
	cluster_t *clusters;
	UT_hash_handle hh;

} board_t;

void add_Cluster(int length, int width, int x, int y, int dx, int dy, color *color);
void remove_Cluster(int id);
int create_id();
#endif