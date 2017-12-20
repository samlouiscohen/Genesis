cluster cl;
cluster cl2;

void init(){}

int main(){
    color c;
    color c2;
    color c3;
    c = #0,0,255#;
    c3 = #255, 0, 0#;
    cl = $ 50, 50, 100, 100, 1, 0, c $;
    cl2 = $ 100, 100, 400, 100, 0, 0, c3 $;
    c2 = #0, 0, 0#;
    startGame(640, 480, c2);
    print(1);
    return 0;
}

void update(int f){
    if(cl @ cl2){ 
        cl.draw = false; 
        cl2.draw = false;
        quit();
    } 
        cl.x = cl.x + 10;  
}
