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
		findX();
	}
	else{
		return x;
	}
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
		findY();
	}
	else{
		return y;
	}
}
void update(int f){
	/*
	int i;	
	int tempx;
	int tempy;

	cluster cl;
	color black;

	black = #255,255,255#;

	//add to tail of snake
	if(head@food){
		
		//find new position for food
		food.x = findX();
		food.y = findY();

		
		tempx = snake[snakelen].x;
		tempy = snake[snakelen].y;
		cl = $tempx,tempy,50,50,0,0,black$;

		//increment global snakelen
		snakelen = snakelen + 1;
	}
	//update segment position
	for(i = 1; i < snakelen; i = i + 1 ){
			snake[i].x = snake[i-1].x;
			snake[i].y = snake[i-1].y;
		}
*/
	//get key input
	if(keyDown("Up")){
		head.dy = -1;
	}
	else if(keyDown("Space")){
		head.dy = 1;
	}
	else if(keyDown("Left")){
		head.dx = -1;
	}
	else if(keyDown("Right")){
		head.dx = 1;
	}
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
	snakelen = 1;

	startGame(640,480,white);
}