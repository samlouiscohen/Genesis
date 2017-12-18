void init(){}

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

int main(){
    color c;
    color c2;
    cluster cl;
    cluster cl2;
    string s;
    s = "Hello World";
    prints(s);
    c = #0,0,25#;
    cl = $ 50, 50, 100, 100, 0, 0, c $ ;
    c2 = #0, 255, 0#;
    startGame(640, 480, c2);
    print(1);
    return 0;
}
