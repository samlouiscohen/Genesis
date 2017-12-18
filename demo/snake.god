cluster head;
cluster food;
cluster[] snake;
int snakelen;


void init(){}

//helper functions to place food as long as it is not on a snake position. Parsing error somewhere in here
int findX(){
	int x;
	int i;
	int flag;
	int temp;
	x = random(480);
	for(i = 0; i <90; i = i + 1){
		temp = snake[i].x;
		if ( (x > temp) && (x < temp + snake[i].width)){
			flag = 1;
		}
	}
	if(flag == 1){
		x = findX();
	}
	
	return x;
	
}

int findY(){
	int y;
	int i;
	int flag;
	int temp;
	y = random(480);

	for(i = 0; i <90; i = i + 1){
		temp = snake[i].x;
		if ( y > temp && y < temp + snake[i].height){
			flag = 1;
		}
	}
	if(flag == 1){
		y = findY();
	}
	
	return y;
}

int main(){
	color black;
	color white;
	color red;
	int x;
	int y;
	snake = new cluster[90];
	black = #0,0,0#;
	white = #255,255,255#;
	red = #255,0,0#;
	head = $ 50,50,0,0,1,0,black $;
	x = findX();
	y = findY();
	food = $ 50, 50, x, y, 0, 0, red$;
	snakelen = 0;

	startGame(640,480,white);
}

void update(int f){
	
	int i;	
	int tempx;
	int tempy;
	int dx;
	int dy;

	cluster cl;
	color green;

	green = #0,255,0#;

	//get key input
	if(keyDown("Up")){
		//head.dy = -10;
		head.y = head.y - 30;
		head.dy = 1;
		head.dx = 0;
	}
	else if(keyDown("Down")){
		//head.dy = 10;
		head.y = head.y + 30;
		head.dy = -1;
		head.dx = 0;
	}
	else if(keyDown("Left")){
		head.x = head.x - 30;
		//head.dx = -10;
		head.dx = -1;
		head.dy = 0;
	}
	else if(keyDown("Right")){
		//head.dx = 10;
		head.x = head.x + 30;
		head.dx = 1;
		head.dy = 0;
	}

	//add to tail of snake
	if(head@food){
		
		//find new position for food
		food.x = findX();
		food.y = findY();
		

		//add to tail of snake
		if(snakelen != 0){
			if(snake[snakelen].dx == 1){
				tempx = snake[snakelen-1].x-50;
				tempy = snake[snakelen-1].y;
				dy = 0;
				dx = 1;
			}
			else if(snake[i-1].dx == -1){
				tempx = snake[snakelen-1].x+50;
				tempy = snake[snakelen-1].y;
				dx = -1;
				dy = 0;
			}
			else if(snake[i-1].dy == 1){
				tempx = snake[snakelen-1].x;
				tempy = snake[snakelen-1].y + 50;
				dx = 0;
				dy = 1;
			}
			else if(snake[i-1].dy == -1){
				tempx = snake[snakelen-1].x;
				tempy = snake[snakelen-1].y - 50;
				dx = 0;
				dy = -1;
			}
			
			cl = $50,50,tempx,tempy,dx,dy,green$;

			snake[snakelen] = cl;
		}
		//draw first snake segment to left of head
		else if (snakelen == 0)	{
			tempx = head.x - 50;
			tempy = head.y;

			cl = $50,50,tempx,tempy,0,0,green$;

			snake[snakelen] = cl;
		}
		

		//increment global snakelen

		snakelen = snakelen + 1;
		print(snakelen);
	}
	else{
		//snake[0] follows head. snake[0] is not the head but is the first addition to the snake. snakelen will be greater than 0 after the first collision
		if(snakelen > 0){
			if(head.dx == 1){
				snake[0].x = head.x-50;
				snake[0].y = head.y;
				snake[0].dx = 1;
				snake[0].dy = 0;
			}
			else if(head.dx == -1){
				snake[0].x = head.x+50;
				snake[0].y = head.y;
				snake[0].dx = -1;
				snake[0].dy = 0;
			}
			else if(head.dy == 1){
				snake[0].x = head.x;
				snake[0].y = head.y + 50;
				snake[0].dx = 0;
				snake[0].dy = 1;
			}
			else if(head.dy == -1){
				snake[0].x = head.x;
				snake[0].y = head.y - 50;
				snake[0].dx = 0;
				snake[0].dy = -1;
			}
			/*snake[0].x = head.x - 50;
			snake[0].y = head.y;*/
			prints("snake[0]");
			print(snake[0].x);
			print(snake[0].y);
		}

		//snake body follows snake[0] position. only needs to be performed after second collision
		if(snakelen > 1){
			for(i = 1; i < snakelen; i = i + 1 ){
				if(snake[i-1].dx == 1){
					snake[i].x = snake[i-1].x-50;
					snake[i].y = snake[i-1].y;
					snake[i].dx = snake[i-1].dx;
					snake[i].dy = snake[i-1].dy;
				}
				else if(snake[i-1].dx == -1){
					snake[i].x = snake[i-1].x+50;
					snake[i].y = snake[i-1].y;
					snake[i].dx = snake[i-1].dx;
					snake[i].dy = snake[i-1].dy;
				}
				else if(snake[i-1].dy == 1){
					snake[i].x = snake[i-1].x;
					snake[i].y = snake[i-1].y + 50;
					snake[i].dx = snake[i-1].dx;
					snake[i].dy = snake[i-1].dy;
				}
				else if(snake[i-1].dy == -1){
					snake[i].x = snake[i-1].x;
					snake[i].y = snake[i-1].y - 50;
					snake[i].dx = snake[i-1].dx;
					snake[i].dy = snake[i-1].dy;
				}
			
			}
		}
		
	}
	
	

	}