/**
 * Author: Jason Zhao
**/

// Global variables
color white;
color light;
color dark;
color yellow;
color brown;

int xblocks;
int yblocks;

bool cursor_color;
int cursor_x;
int cursor_y;

cluster[] board;
bool[] metadata;
bool[] next;

bool running;

int xy2i(int x, int y) {
	return (x * yblocks) + y;
}

void darken(int x, int y) {
	if (metadata[xy2i(x, y)]) {
		board[xy2i(x, y)].clr = brown;
	} else {
		board[xy2i(x, y)].clr = dark;
	}
}

void brighten(int x, int y) {
	if (metadata[xy2i(x, y)]) {
		board[xy2i(x, y)].clr = yellow;
	} else {
		board[xy2i(x, y)].clr = light;
	}
}

void flashCursor() {
	if (cursor_color) {
		darken(cursor_x, cursor_y);
		cursor_color = false;
	} else {
		brighten(cursor_x, cursor_y);
		cursor_color = true;
	}
}

void pollKeys() {
	// Cursor movement direction based on keypress
	int dx; int dy; dx = 0; dy = 0;
	if (keyDown("Up")    && cursor_y > 0)           { dy = -1; }
	if (keyDown("Down")  && cursor_y < yblocks - 1) { dy = 1;  }
	if (keyDown("Left")  && cursor_x > 0)           { dx = -1; }
	if (keyDown("Right") && cursor_x < xblocks - 1) { dx = 1;  }

	// Toggle state of cell at cursor location
	if (keyDown("Space")) {
		if (metadata[xy2i(cursor_x, cursor_y)]) {
			metadata[xy2i(cursor_x, cursor_y)] = false;
		} else {
			metadata[xy2i(cursor_x, cursor_y)] = true;
		}
	}

	if (dx != 0 || dy != 0) {
		// Make sure old cursor has its default color
		brighten(cursor_x, cursor_y);

		// Update cursor location
		cursor_x = cursor_x + dx;
		cursor_y = cursor_y + dy;

		// Make new cursor dark so you can see it
		darken(cursor_x, cursor_y);
	}

	// Toggle run state
	if (keyDown("s")) {
		if (running) {
			running = false;
		} else {
			running = true;
		}
	}

	// Step through state
	if (keyDown("d")) {
		evolve();
	}
}

// Conway's Game of Life algorithm
void evolve() {
	int i; int j; int n;
	for (i = 0; i < xblocks; i = i + 1) {
		for (j = 0; j < yblocks; j = j + 1) {

			n = 0;

			// Count number of neighbors, careful for edges
			if (i >= 1 && j >= 1 &&           metadata[xy2i(i - 1, j - 1)]) { n = n + 1; }
			if (i >= 1 &&                     metadata[xy2i(i - 1, j)])     { n = n + 1; }
			if (i >= 1 && j < yblocks &&      metadata[xy2i(i - 1, j + 1)]) { n = n + 1; }
			if (j >= 1 &&                     metadata[xy2i(i, j - 1)])     { n = n + 1; }
			if (j < yblocks &&                metadata[xy2i(i, j + 1)])     { n = n + 1; }
			if (i < xblocks && j >= 1 &&      metadata[xy2i(i + 1, j - 1)]) { n = n + 1; }
			if (i < xblocks &&                metadata[xy2i(i + 1, j)])     { n = n + 1; }
			if (i < xblocks && j < yblocks && metadata[xy2i(i + 1, j + 1)]) { n = n + 1; }

			// Life / death rules
			if (n <= 1 || n >= 4) {
				next[xy2i(i, j)] = false;
			} else if (n == 3) {
				next[xy2i(i, j)] = true;
			} else {
				next[xy2i(i, j)] = metadata[xy2i(i, j)];
			}
		}
	}

	// Apply new state, reset buffer, draw the cells
	for (i = 0; i < xblocks; i = i + 1) {
		for (j = 0; j < yblocks; j = j + 1) {
			metadata[xy2i(i, j)] = next[xy2i(i, j)];
			next[xy2i(i, j)] = false;
			brighten(i, j);
		}
	}
}

void update(int fnum) {
	pollKeys();

	if (fnum % 15 == 0) { flashCursor(); }
	if (running) { evolve(); }
}

void init() { }

int main() {
	// Define some colors
	white  = #255, 255, 255#;
	light  = #200, 200, 200#;
	dark   = #115, 115, 115#;
	yellow = #230, 230, 15#;
	brown  = #180, 180, 15#;

	// Number of cells
	xblocks = 100;
	yblocks = 70;

	// Size of each cell, space between cells, size of screen
	int blockwidth; blockwidth = 10;
	int blockheight; blockheight = 10;
	int spacer; spacer = 1;
	int width; width = (xblocks * blockwidth) + ((xblocks - 1) * spacer);
	int height; height = (yblocks * blockheight) + ((yblocks - 1) * spacer);

	// Allocate board and associated metadata
	board = new cluster[xblocks * yblocks];
	metadata = new bool[xblocks * yblocks];
	next = new bool[xblocks * yblocks];

	int i; int j; int x; int y; cluster c;
	for (i = 0; i < xblocks; i = i + 1) {
		for (j = 0; j < yblocks; j = j + 1) {
			// Calculate pixel position of cell
			x = (i * blockwidth) + (i * spacer);
			y = (j * blockheight) + (j * spacer);

			// Create cluster object
			c = $ blockwidth, blockheight, x, y, 0, 0, light $;
			board[xy2i(i, j)] = c;
			metadata[xy2i(i, j)] = false;
			next[xy2i(i, j)] = false;

			// Initialize cursor to centermost cell
			if (i == xblocks / 2 && j == yblocks / 2) { 
				cursor_x = i; cursor_y = j;
				cursor_color = true;
			}
		}
	}

	// Initialize running state
	running = false;

	startGame(width, height, white);
}