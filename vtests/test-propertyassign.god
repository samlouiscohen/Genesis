void update(int f){

    if(f == 20){
        quit();
    }
}

void init(){}

int main(){
    color c;
    cluster cl;
    c = #0,255,0#;
    cl = $ 50, 50, 100, 100, 0, 0, c $ ;
    cl.x = 100;
    c = #0, 0, 0#;
    startGame(640, 480, c);
    print(1);
    return 0;
}
