//Author: Michael Wang

cluster ground;
cluster player;
cluster obstacle1;
cluster obstacle2;
bool jumping;
int score;
int dy;

void init(){
    ground.draw = true;
    player.draw = true;
    obstacle1.draw = true;
    obstacle2.draw = true;
    jumping = false;
    score = 0;
    dy = 0;
}

void update(int f){
    if ((player @ obstacle1) || (player @ obstacle2)){
        player.draw = false;
        print(score);
        quit();
    } 

    if (jumping){
        dy = dy + 2;
    }
    if (keyDown("Space") && !jumping){
        dy = -25;
        jumping = true;
    }
    player.y = player.y + dy;
    if (player @ ground){
        dy = 0;
        player.y = 190;
        jumping = false;
    }

    if (obstacle1.x < -30){
        obstacle1.x = 640;
        score = score + 1;
    }
    if (obstacle2.x < -30){
        obstacle2.x = obstacle1.x + 225 + random(75);
        score = score + 1;
    }

    obstacle1.x = obstacle1.x - 5;
    obstacle2.x = obstacle2.x - 5;
}

int main(){
    color white;
    color green;
    color red;
    color blue;
    color yellow;

    white = #255, 255, 255#;
    red = #255,0,0#;
    green = #0,255,0#;
    blue = #0,0,255#;
    yellow = #255, 255, 0#;

    ground = $ 640, 240, 0, 240, 0, 0, green $;
    player = $ 50, 50, 150, 190, 0, 0, blue $;
    obstacle1 = $ 30, 30,  600, 210, 0, 0, red $;
    obstacle2 = $ 30, 30,  900, 210, 0, 0, red $;

    startGame(640, 480, white);
    return 0;
}

