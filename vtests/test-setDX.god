cluster cl;
int prevX;
void init(){}

int main(){
    color c;
    color c2;
    c = #0,0,255#;
    cl = $ 50, 50, 0, 0, 10, 0, c $ ;
    c2 = #0, 255, 0#;
    startGame(640, 480, c2);
    return 0;
}

void update(int f){
	if (f == 2){
		prevX = cl.x;
	}
	if (f == 3){
		if((cl.x - prevX) == cl.dx){
			print(1);
		}
		quit();
	}
}
