/**
 * Authors:
 *  - Leon Stilwell
 *  - Sam Cohen
**/

// Some globals
cluster head;
cluster tail;
cluster[] snake;
int blockSize;

cluster apple;
cluster stem;
cluster temp;
int stemOffsetX;
int[] appleCoord;

int snakeLen;
int maxSnakeLen;
int currDirection;

int screenWidth;
int screenHeight;

color green; 
color bodGreen;
color red; 
color white; 
color black;
color blue;
color lightBlue;
color brown;

int diffX;
int diffY;

int segmentSeperation;

int[] segfault;
int segger;

int start;


bool go;


// Change direction of snake, don't allow snake

void gameOver(){

	prints("Congrats! Your score is:");
	print(snakeLen);
	quit();

}
void run(int f){
	// to go back on itself
	if (keyDown("Up")    && currDirection != 1) { currDirection = 0; }
	if (keyDown("Down")  && currDirection != 0) { currDirection = 1; }
	if (keyDown("Left")  && currDirection != 3) { currDirection = 2; }
	if (keyDown("Right") && currDirection != 2) { currDirection = 3; }



	if(f % 10 != 0) { return; }

	int i;

	//Update all segments of the snake body
	for(i = snakeLen - 1; i > 0; i = i - 1){
		snake[i].x = snake[i-1].x;
		snake[i].y = snake[i-1].y;
	}

	if(currDirection == 0){ head.y = head.y - segmentSeperation; }
	else if(currDirection == 1){ head.y = head.y + segmentSeperation; }
	else if(currDirection == 2){ head.x = head.x - segmentSeperation; }
	else { head.x = head.x + segmentSeperation; }


	//Bound checking
	if (head.x > screenWidth - blockSize) { gameOver(); }
	if (head.x < 0 )		  { gameOver(); }
	if (head.y > screenHeight - blockSize){ gameOver(); }
	if (head.y < 0)			  { gameOver(); }


	cluster tail;
	int tailX;
	int tailY;
	// int lastSegX; int lastSegY; int secondLastSegX; int secondLastSegY; 
	int tailChangeX;
	int tailChangeY;
	color newColor;
	int randR; int randG; int randB;


	if(head @ apple){

		//Determine side to append tail to by comparing the last two segments
		if(snakeLen > 1){
			tailChangeX = snake[snakeLen - 1].x - snake[snakeLen - 2].x;
			tailChangeY = snake[snakeLen - 1].y - snake[snakeLen - 2].y;

			if(tailChangeX < 0){ //Append tail to left
				tailX = snake[snakeLen-1].x - segmentSeperation;
				tailY = snake[snakeLen-1].y;
			}
			else if(tailChangeX > 0){ //Append tail to right
				tailX = snake[snakeLen-1].x + segmentSeperation;
				tailY = snake[snakeLen-1].y;
			}
			else if(tailChangeY > 0){ //Append tail to bottom
				tailX = snake[snakeLen-1].x;
				tailY = snake[snakeLen-1].y + segmentSeperation;
			}
			else{//Append tail to bottom
				tailX = snake[snakeLen-1].x;
				tailY = snake[snakeLen-1].y - segmentSeperation;
			}
		}else{
			//If a single segment, append to side opposite of head motion
			if(currDirection == 0){ //Moving Up
				tailX = snake[0].x;
				tailY = snake[0].y + segmentSeperation;
			}
			else if(currDirection == 1){//Moving Down
				tailX = snake[0].x;
				tailY = snake[0].y - segmentSeperation;
			}
			else if(currDirection == 2){//Moving Left
				tailX = snake[0].x + segmentSeperation;
				tailY = snake[0].y;
			}
			else {//Moving Right
				tailX = snake[0].x - segmentSeperation;
				tailY = snake[0].y;
			}
		}

		//Build new tail cluster and update
		randR = random(80); randG = random(55) + 200; randB = random(80);
		newColor = #randR, randG, randB#;
		tail = $ blockSize, blockSize, tailX, tailY, 0, 0, newColor $;
		snake[snakeLen] = tail;
		snakeLen = snakeLen + 1;

		//"Spawn" a new apple when last one is eaten
		appleCoord = getNewAppleCoord();

		apple.x = appleCoord[0];
		apple.y = appleCoord[1];

		stem.x = apple.x + stemOffsetX;
		stem.y = apple.y - 10;

	}
	//Kill off snake if it collides with self
	int j;
	for(j = 1; j < snakeLen; j = j + 1){
		if(head @ snake[j]){
			gameOver();
		}
	}
}


void update(int f){

	if(keyDown("Space")){
		go = true;
	}
	if(go){
		run(f);
	}
	


}


void init(){
	//Randomize snake starting direction (0, 1, 2, 3)
	//currDirection = random(4);
	currDirection = 3;
}


int main(){

	//Define some colors
	green = #0, 255, 0#;
	bodGreen = #15,90, 30#;
	red   = #255, 0, 0#;
	white = #255, 255, 255#;
	black = #0, 0, 0#;
	blue = #0, 0, 255#;
	lightBlue = #60,194,209#;
	brown = #114,80,44#;

	//Set the block size of the grid & associated "offset blocks"
	blockSize = 50;
	segmentSeperation = (blockSize + (blockSize/10));

	screenWidth = segmentSeperation*15;
	screenHeight = segmentSeperation*12;
	//Build apple and stem cluster
	apple = $blockSize, blockSize, segmentSeperation, segmentSeperation*3,0,0,red$;
	stemOffsetX = blockSize/2 - 5;
	stem = $10, 20, (apple.x + stemOffsetX), apple.y - 10, 0, 0, brown$;

	//Build the starting snake head cluster
	head = $ blockSize, blockSize, segmentSeperation*2, segmentSeperation*2, 0, 0, bodGreen $ ;

	//Construct the snake body
	maxSnakeLen = 50;
	snake = new cluster[maxSnakeLen];
	snakeLen = 1;
	snake[0] = head;

	//Build apple
	appleCoord = new int[2];
	appleCoord = getNewAppleCoord();

	startGame(screenWidth, screenHeight, white);
    return 0;
}



//Some helper functions



int[] getNewAppleCoord(){
	/* Method to find free location to drop food */
	int[] coord; coord = new int[2];
	int randX;
	int randY;
	bool notFound; notFound = true;
	
	int i;
	randX = random(screenWidth - segmentSeperation);
	randY = random(screenHeight - segmentSeperation);


	 while(notFound){


	 	randX = random(screenWidth - blockSize);
	 	randY = random(screenHeight - blockSize);
	 	notFound = false;
	 	
	 	
	 	temp = $blockSize, blockSize, randX, randY, 0,0,bodGreen$;
	 	temp.draw = false; 
	 	for(i = 0; i < snakeLen; i = i + 1){
	 		if(temp @ snake[i]){
	 			notFound = true;
	 		}
	 	}
	 }

	coord[0] = (randX/segmentSeperation)*segmentSeperation;
	coord[1] = (randY/segmentSeperation)*segmentSeperation;

	return coord;

}

















