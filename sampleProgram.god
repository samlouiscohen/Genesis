void update(){
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

void init(){
}

int main(){
    color c;
    c = <255, 255, 255>;
    startGame(640, 480, c);
    print(1);
    return 0;
}
