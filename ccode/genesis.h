

typedef struct color {
	int r;
	int g;
	int b;
} color;

typedef struct position {

	int x;
	int y;
	
} position;

//what is our implementation here?
/*typedef struct cluster{

}*/

void initScreen(int width, int height, color c);

typedef struct board {
	const char* name;
	color color;
} board;