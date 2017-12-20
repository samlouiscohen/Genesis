
//Some globals
cluster head;
cluster tail;
cluster[] snake;
int headSpeed;
int snakeSegSize;

cluster apple;
cluster stem;
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



void init(){}


void gameOver(){

	prints("Congrats! You're score is:");
	print(snakeLen);
	quit();
}


int[] getNewAppleCoord(){
	/* Method to find free location to drop food */
	int[] coord; coord = new int[2];
	int randX;
	int randY;
	bool xNotFound; xNotFound = true;
	bool yNotFound; yNotFound = true;
	int i;
	randX = random(screenWidth - segmentSeperation);
	randY = random(screenHeight - segmentSeperation);

	// while(xNotFound || yNotFound){
	// 	randX = random(screenWidth - snakeSegSize);
	// 	randY = random(screenHeight - snakeSegSize);
	// 	xNotFound = false;
	// 	yNotFound = false;

	// 	//Iterate over snake segments and make sure not spawning on snake
	// 	for(i = 0; i < snakeLen; i = i + 1){
	// 		if(snake[i].x - snakeSegSize < randX && randX < snake[i].x + snakeSegSize){
	// 			xNotFound = true;
	// 		}
	// 	}

	// 	for(i = 0; i < snakeLen; i = i + 1){
	// 		if(snake[i].y - snakeSegSize < randY && randY < snake[i].y+ snakeSegSize){
	// 			yNotFound = true;
	// 		}
	// 	}
	// }




	coord[0] = (randX/segmentSeperation)*segmentSeperation;
	coord[1] = (randY/segmentSeperation)*segmentSeperation;

	return coord;

}


void update(int f){


	//Enforce constant movement on snake
	if (keyDown("Up"))   { currDirection = 0; }
	if (keyDown("Down")) { currDirection = 1; }
	if (keyDown("Left")) { currDirection = 2; }
	if (keyDown("Right")){ currDirection = 3; }
	if (keyHeld("Space")){ prints("held bo"); }

	if(f%5 != 0){return;}



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
	if (head.x > screenWidth - snakeSegSize) { gameOver(); }
	if (head.x < 0 )		  { gameOver(); }
	if (head.y > screenHeight - snakeSegSize){ gameOver(); }
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


		//Grow snake if it eats an apple

		//Set the tail to the opposite of movement
		// tailX = snake[snakeLen-1].x;
		// tailY = snake[snakeLen-1].y;

		//Determine the appending side by comparing the last two segement positions
		// lastSegX = snake[snakeLen - 1].x; lastSegY = snake[snakeLen - 1].y; 
		// secondLastSegX = snake[snakeLen - 2].x;	secondLastSegY = snake[snakeLen - 2].y;


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

		randR = random(80);
		randG = random(55) + 200;
		randB = random(80);


		newColor = #randR, randG, randB#;
		tail = $ snakeSegSize, snakeSegSize, tailX, tailY, 0, 0, newColor $;
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

	if(snakeLen > 1){
		for(j = 1; j < snakeLen; j = j + 1){
			if(head @ snake[j]){
				gameOver();
			}
		}
	}




}

int main(){


	green = #0, 255, 0#;
	bodGreen = #15,90, 30#;
	red   = #255, 0, 0#;
	white = #255, 255, 255#;
	black = #0, 0, 0#;
	blue = #0, 0, 255#;
	lightBlue = #60,194,209#;
	brown = #114,80,44#;

	//Start direction of snake movement
	currDirection = 3;

	snakeSegSize= 50;
	segmentSeperation = (snakeSegSize + (snakeSegSize/10));


	head = $ snakeSegSize, snakeSegSize, segmentSeperation*2, segmentSeperation*2, 0, 0, bodGreen $ ;
	// tail = $ snakeSegSize, snakeSegSize, 100-snakeSegSize, 100, 0, 0, bodGreen $ ;

	headSpeed = 2;

	//Construct the snake body
	maxSnakeLen = 50;
	snake = new cluster[maxSnakeLen];
	snakeLen = 1;
	snake[0] = head;

	//Build apple
	appleCoord = new int[2];
	appleCoord = getNewAppleCoord();


	apple = $snakeSegSize, snakeSegSize, segmentSeperation, segmentSeperation*3,0,0,red$;

	stemOffsetX = snakeSegSize/2 - 5;
	stem = $10, 20, (apple.x + stemOffsetX), apple.y - 10, 0, 0, brown$;

	// screenWidth = 640;
	// screenHeight = 480;
	screenWidth = segmentSeperation*15;
	screenHeight = segmentSeperation*12;

	startGame(screenWidth, screenHeight, white);
    print(1);
    return 0;
}









