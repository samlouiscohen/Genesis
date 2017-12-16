void update(int f){
	if (keyDown("Space")){
		prints("Space pressed");
	}
	if (keyHeld("Space")){
		prints("Space held");
	}
	if (keyUp("Space")){
		prints("Space released");
	}
}

void init(){}

int main(){
    color c;
    cluster cl;
    c = <0,255,0>;
    cl = $ 50, 50, 100, 100, 0, 0, c $ ;
    c = <0, 0, 0>;
    startGame(640, 480, c);
    print(1);
    return 0;
}
