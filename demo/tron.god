/**
 * Author: Jason Zhao
**/


// Some globals

cluster[] snake1;
int s1dx; int s1dy;
int s1len;
int s1bcount;
bool s1boost;

cluster[] snake2;
int s2dx; int s2dy;
int s2len;
int s2bcount;
bool s2boost;

int xblocks;
int yblocks;
int blockwidth;
int blockheight;
int spacer;

color white; 
color black;
color dark;
color red; 
color orange;
color blue;
color cyan;

// Convert a block_x coord to pixel x
int scalex(int x) {
	return (x * blockwidth) + (x * spacer);
}

// Convert a block_y coord to pixel y
int scaley(int y) {
	return (y * blockheight) + (y * spacer);
}

// Up: 1, Down: 2, Left: 3, Right: 4
int s1dir() {
	if (snake1[s1len - 1].x == snake1[0].x - scalex(1)) { return 4; }
	if (snake1[s1len - 1].x == snake1[0].x + scalex(1)) { return 3; }
	if (snake1[s1len - 1].y == snake1[0].y + scaley(1)) { return 2; }
	
	return 1;
}

// Up: 1, Down: 2, Left: 3, Right: 4
int s2dir() {
	if (snake2[s2len - 1].x == snake2[0].x - scalex(1)) { return 4; }
	if (snake2[s2len - 1].x == snake2[0].x + scalex(1)) { return 3; }
	if (snake2[s2len - 1].y == snake2[0].y + scaley(1)) { return 2; }
	
	return 1;
}

void pollKeys() {
	// Snake #1 keys
	int dir; dir = s1dir();

	if (keyDown("w") && dir != 2)  { s1dx = 0;  s1dy = -1; } else
	if (keyDown("s") && dir != 1)    { s1dx = 0;  s1dy = 1;  } else
	if (keyDown("a") && dir != 4) { s1dx = -1; s1dy = 0;  } else
	if (keyDown("d") && dir != 3)  { s1dx = 1;  s1dy = 0;  }
	if (keyHeld("Left Shift")) { 
		s1boost = true;
	}

	dir = s2dir();

	// Snake #2 keys
	if (keyDown("i") && dir != 2) { s2dx = 0;  s2dy = -1; } else
	if (keyDown("k") && dir != 1) { s2dx = 0;  s2dy = 1;  } else
	if (keyDown("j") && dir != 4) { s2dx = -1; s2dy = 0;  } else
	if (keyDown("l") && dir != 3) { s2dx = 1;  s2dy = 0;  }
	if (keyHeld("Right Shift")) {
		s2boost = true;
	}
}

void moveSnake1() {
	// Create cluster in old head position
	cluster c1; c1 = $ blockwidth, blockheight, snake1[0].x, snake1[0].y, 0, 0, cyan $;

	// Append to body
	snake1[s1len] = c1; s1len = s1len + 1;

	// Update head
	snake1[0].x = snake1[0].x + scalex(s1dx);
	snake1[0].y = snake1[0].y + scaley(s1dy);
}

void moveSnake2() {
	// Create cluster in old head position
	cluster c2; c2 = $ blockwidth, blockheight, snake2[0].x, snake2[0].y, 0, 0, orange $;

	snake2[s2len] = c2; s2len = s2len + 1;

	// Update head
	snake2[0].x = snake2[0].x + scalex(s2dx);
	snake2[0].y = snake2[0].y + scaley(s2dy);
}

void collision() {
	int i; bool s1lose; bool s2lose;
	s1lose = false; s2lose = false;

	// Check snake bounds
	if (snake1[0].y < 0) {
		prints("Player 1 (cyan) hit the wall!");
		s1lose = true;
	} else if (snake1[0].y > scaley(yblocks - 1)) {
		prints("Player 1 (cyan) hit the wall!");
		s1lose = true;
	} else if (snake1[0].x < 0) {
		prints("Player 1 (cyan) hit the wall!");
		s1lose = true;
	} else if (snake1[0].x > scalex(xblocks - 1)) {
		prints("Player 1 (cyan) hit the wall!");
		s1lose = true;
	}

	if (snake2[0].y < 0) {
		prints("Player 2 (orange) hit the wall!");
		s2lose = true;
	} else if (snake2[0].y > scaley(yblocks - 1)) {
		prints("Player 2 (orange) hit the wall!");
		s2lose = true;
	} else if (snake2[0].x < 0) {
		prints("Player 2 (orange) hit the wall!");
		s2lose = true;
	} else if (snake2[0].x > scalex(xblocks - 1)) {
		prints("Player 2 (orange) hit the wall!");
		s2lose = true;
	}

	// Check snake on snake collision
	for (i = 0; i < s1len; i = i + 1) {
		if (i != 0 && snake1[0] @ snake1[i]) {
			prints("Player 1 (cyan) hit themself!");
			s1lose = true;
		}

		if (i != 0 && snake2[0] @ snake2[i]) {
			prints("Player 2 (orange) hit themself!");
			s2lose = true;
		}
	}

	for (i = 0; i < s2len; i = i + 1) {
		if (snake1[0] @ snake2[i]) {
			prints("Player 1 (cyan) hit Player 2!");
			s1lose = true;
		}

		if (snake2[0] @ snake1[i]) {
			prints("Player 2 (orange) hit Player 1!");
			s2lose = true;
		}
	}

	if (s1lose && s2lose) {
		prints("You both died at the same time!");
		quit();
	} else if (s1lose) {
		prints("Player 2 (orange) wins!");
		quit();
	} else if (s2lose) {
		prints("Player 1 (cyan) wins!");
		quit();
	}
}

void boost() {
	if (s1boost && s1bcount > 0) {
		moveSnake1(); s1bcount = s1bcount - 1;
		if (s1bcount <= 0) {
			s1boost = false;
		}
	}

	if (s2boost && s2bcount > 0) {
		moveSnake2(); s2bcount = s2bcount - 1;
		if (s2bcount <= 0) {
			s2boost = false;
		}
	}
}

void replenishBoost() {
	if (!s1boost && s1bcount < 10) { s1bcount = s1bcount + 1; }
	if (!s2boost && s2bcount < 10) { s2bcount = s2bcount + 1; }
}

void update(int fnum) {
	pollKeys();
	if (fnum % 5 == 0) { moveSnake1(); moveSnake2(); }

	// Check for collision
	collision();

	// Boost snakes
	if (fnum % 3 == 0) { boost(); }
	if (fnum % 10 == 0) { replenishBoost(); }
}

void init() { }

int main(){
	// Define some colors
	white  = #255, 255, 255#;
	black  = #10,  10,  10#;
	dark   = #115, 115, 115#;
	red    = #255, 0,   0#;
	orange = #247, 207, 73#;
	blue   = #0,   0,   255#;
	cyan   = #142, 218, 221#;

	// Number of cells
	xblocks = 100;
	yblocks = 70;

	// Size of each cell, space between cells, size of screen
	blockwidth = 10;
	blockheight = 10;
	spacer = 1;
	int width; width = (xblocks * blockwidth) + ((xblocks - 1) * spacer);
	int height; height = (yblocks * blockheight) + ((yblocks - 1) * spacer);

	// Allocate board and associated metadata
	snake1 = new cluster[xblocks * yblocks];
	snake2 = new cluster[xblocks * yblocks];

	int x1; int x2; int y1; int y2;
	x1 = scalex(xblocks / 3); x2 = scalex(2 * (xblocks / 3));
	y1 = scaley(yblocks / 2); y2 = scaley(yblocks / 2);

	cluster head1; head1 = $ blockwidth, blockheight, x1, y1, 0, 0, cyan $;
	snake1[0] = head1; s1len = 1;
	s1dx = 1; s1dy = 0; 
	s1boost = false; s1bcount = 10;

	cluster head2; head2 = $ blockwidth, blockheight, x2, y2, 0, 0, orange $;
	snake2[0] = head2; s2len = 1;
	s2dx = -1; s2dy = 0;
	s2boost = false; s2bcount = 10;

	startGame(width, height, black);
    return 0;
}









