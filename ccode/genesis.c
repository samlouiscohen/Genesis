#include <SDL2/SDL.h>
#include <stdlib.h>
#include <time.h>
#include "genesis.h"

extern void update(int frame);
extern void init();
//extern board_t *curBoard;
//extern cluster_t *toRemove;

const int framesPerSec = 60;
char *additionalKeynames[] = {"Up", "Down", "Left", "Right", "Space", "Escape"};

//Global values used during runtime
SDL_Window *gWindow = NULL;
SDL_Renderer *gRenderer = NULL;
int backgroundR = 0xFF;
int backgroundG = 0xFF;
int backgroundB = 0xFF;
int quit = 0;
int cluster_id = 0;
cluster_t *clusters = NULL;
int keyStateLen;
Uint8 *prevKeyStates = NULL;
const Uint8 *keyStates = NULL;
int frameNum = 0;

int initScreen(color *c, int width, int height);
void quitGame();
void clearScreen();
void static close();
void showDisplay();

void quitGame(){
    quit = 1;
}

void copyArray(const Uint8 *src, Uint8 *dest, int len){
    int i;
    for (i = 0; i < len; i += 1){
        dest[i] = src[i];
    }
}

//Create screen
int initScreen(color *c, int width, int height){
    //Initialization flag
    int success = 1;

    //Initialize SDL
    if( SDL_Init( SDL_INIT_VIDEO ) < 0 )
    {
        printf( "SDL could not initialize! SDL Error: %s\n", SDL_GetError() );
        success = 0;
    }
    else
    {
        //Set texture filtering to linear
        if( !SDL_SetHint( SDL_HINT_RENDER_SCALE_QUALITY, "1" ) )
        {
            printf( "Warning: Linear texture filtering not enabled!" );
        }

        //Create window
        gWindow = SDL_CreateWindow( "Game", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, width, height, SDL_WINDOW_SHOWN );
        if( gWindow == NULL )
        {
            printf( "Window could not be created! SDL Error: %s\n", SDL_GetError() );
            success = 0;
        }
        else
        {
            //Create renderer for window
            gRenderer = SDL_CreateRenderer( gWindow, -1, SDL_RENDERER_ACCELERATED );
            if( gRenderer == NULL )
            {
                printf( "Renderer could not be created! SDL Error: %s\n", SDL_GetError() );
                success = 0;
            }
            else
            {
                //Set background color
                backgroundR = c->r;
                backgroundG = c->g;
                backgroundB = c->b;

                //Clear background
                clearScreen();
                showDisplay();
                //SDL_RenderPresent(gRenderer);
            }
        }
    }
    return success;
}

//Clears everything drawn on the screen
void clearScreen(){
    SDL_SetRenderDrawColor(gRenderer, backgroundR, backgroundG, backgroundB, 0xFF);
    SDL_RenderClear(gRenderer);
}

void drawRectangle(int x, int y, int w, int h, int r, int g, int b){
    SDL_Rect rect = {x, y, w, h};
    SDL_SetRenderDrawColor(gRenderer, r, g, b, 0xFF);
    SDL_RenderFillRect(gRenderer, &rect);

}

int inGoalArea(SDL_Rect rect, SDL_Rect goal){
    int leftBlock = rect.x;
    int rightBlock = rect.x + rect.w;
    int bottomBlock = rect.y;
    int topBlock = rect.y + rect.h;
        
    int leftGoal = goal.x;
    int rightGoal = goal.x + goal.w;
    int bottomGoal = goal.y;
    int topGoal  = goal.y + goal.h;

    if ( bottomBlock > bottomGoal && topBlock < topGoal && leftBlock > leftGoal && rightBlock < rightGoal ) {
        return 1;
    }

    return 0;


}
void showDisplay(){
    SDL_RenderPresent(gRenderer);
}

//Must be called when program finishes
void static close(){
    SDL_DestroyRenderer(gRenderer);
    SDL_DestroyWindow(gWindow);
    gWindow = NULL;
    gRenderer = NULL;

    SDL_Quit();

    free(prevKeyStates);

    cluster_t *temp,*currentCluster;
    HASH_ITER(hh,clusters,currentCluster,temp){
        HASH_DEL(clusters,currentCluster);
        free(currentCluster);
    }
}

void pollEvents(){
    SDL_Event event;
    copyArray(keyStates, prevKeyStates, keyStateLen);

    while(SDL_PollEvent(&event)){
        if (event.type == SDL_QUIT){
            quit = 1;
        } 
    }
}

bool isKeyHeld(char *key){
    SDL_Scancode code = SDL_GetScancodeFromName(key);
    return keyStates[code] && prevKeyStates[code];
}

bool isKeyDown(char *key){
    SDL_Scancode code = SDL_GetScancodeFromName(key);
    return keyStates[code] && (!prevKeyStates[code]);
}

bool isKeyUp(char *key){
    SDL_Scancode code = SDL_GetScancodeFromName(key);
    return (!keyStates[code]) && prevKeyStates[code];
}

void startGame(color *c, int width, int height){
    quit = 0;
    int msPerFrame = (int) (1000 / framesPerSec);
    initScreen(c, width, height);


    //update screen
    showDisplay();
    keyStates = SDL_GetKeyboardState(&keyStateLen);
    prevKeyStates = malloc(keyStateLen * sizeof(Uint8));

    init();

    //main loop
    while (!quit){
        //Load current keystate into prev

        clearScreen();

        frameNum += 1;
        unsigned int frameStart = SDL_GetTicks();
        pollEvents();

        cluster_t *cl;
        //draws all clusters in hash
        for (cl = clusters; cl!=NULL;cl = cl->hh.next){
            if(cl->draw == 1){
                drawRectangle(cl->x,cl->y,cl->height,cl->width,cl->color.r,cl->color.g,cl->color.b);
                }
        }

        update(frameNum);
        unsigned int frameTime = SDL_GetTicks() - frameStart;
        if(frameTime < msPerFrame){
            SDL_Delay(msPerFrame - frameTime);
        }
        showDisplay();
    }
    close();
}

//called from newCluster. DO NOT CALL OTHERWISE
int create_id(){
    int temp = cluster_id;
    cluster_id = cluster_id + 1;
    
    return temp;

}

int newCluster(int length, int width, int x, int y, int dx, int dy, color *color){
    cluster_t *cluster;
    //HASH_FIND_STR(curBoard->clusters, cluster_id, cluster);
    cluster = malloc(sizeof(cluster_t));
    cluster->height = length;
    cluster->width = width;
    cluster->x = x;
    cluster->y = y;
    cluster->dx = dx;
    cluster->dy = dy;
    cluster->color = *color;
    cluster->id = create_id();
    cluster->draw = 1;

    // printf("%d\n",cluster->id);
    HASH_ADD_INT(clusters, id, cluster);
    unsigned int numClusters;
    numClusters = HASH_COUNT(clusters);
    printf("there are %u clusters\n", numClusters);
    return cluster->id;
    //LL_APPEND(clusterList,c);
}

void setDraw(int id, bool b){
    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);
    if(cluster != NULL){
        cluster->draw = b;
    }
}

int getDraw(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters,&id,cluster);
    if(cluster != NULL){
        return cluster->draw;
    }
    else{
        return -1;
    }
}
int getX(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters,&id,cluster);

    if(cluster != NULL){
        return cluster->x;
    }
    else{
        return -1;
    }
}
void setX(int id, int x){

    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);
    if(cluster != NULL){
        cluster->x = x;
        
    }
}

void setY(int id, int y){
    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);

    if(cluster != NULL){
        cluster->y = y;
    }
}

int getY(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);

    if(cluster != NULL){
        return cluster->y;
    }
    else {
        return -1;
    }
}

int getHeight(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters,&id,cluster);

    if(cluster != NULL){
        return cluster->height;
    }
    else{
        return -1;
    }
}

int getWidth(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters,&id,cluster);

    if(cluster != NULL){
        return cluster->width;
    }
    else{
        return -1;
    }
}

void deleteCluster(int id){
    cluster_t *toRemove;
    HASH_FIND_INT(clusters,&id,toRemove);
    if(toRemove != NULL){
        HASH_DEL(clusters,toRemove);
    }
}

// int main(){

//     color c = {255,0,0};
   
//     add_Cluster(5,10,50,100,0,0, &c);
//     unsigned int numUsers;
//     numUsers = HASH_COUNT(clusters);
//     printf("there are %u users\n", numUsers);
//     return 1;
// }

int getDX(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters,&id,cluster);

    if(cluster != NULL){
        return cluster->dx;
    }
    else{
        return 0;
    }
}
void setDX(int id, int dx){
    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);

    if(cluster != NULL){
        cluster-> dx = dx;
    }
}

int getDY(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters,&id,cluster);

    if(cluster != NULL){
        return cluster->dy;
    }
    else{
        return 0;
    }
}
void setDY(int id, int dy){
    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);

    if(cluster != NULL){
        cluster-> dy = dy;
    }
}

bool detectCollision(int id1, int id2){

    cluster_t *c1;
    cluster_t *c2;

    HASH_FIND_INT(clusters,&id1,c1);
    HASH_FIND_INT(clusters,&id2,c2);

    if((c1 != NULL) && (c2 != NULL)){
        SDL_Rect r1;
        r1.x = c1->x;
        r1.y = c1->y;
        r1.w = c1->width;
        r1.h = c1->height;

        SDL_Rect r2;
        r2.x = c2->x;
        r2.y = c2->y;
        r2.w = c2->width;
        r2.h = c2->height;

        const SDL_Rect *r3 = &r1;
        const SDL_Rect *r4 = &r2;

        SDL_Rect res;
        SDL_bool ans;
        ans = SDL_IntersectRect(r3,r4,&res);

        if(ans == SDL_TRUE){
            return 1;
        }
        else{
            return 0;
        }
    }
    return 0;
 }


//assumes cluster will be in hash
color getColor(int id){
    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);

    if(cluster != NULL){
        return cluster->color;
    }
    return cluster->color;

}

void setColor(int id, struct color *color){
    cluster_t *cluster;
    HASH_FIND_INT(clusters, &id, cluster);

    if(cluster != NULL){
        cluster->color = *color;
    }
}


int randomInt(int max){
    srand(time(NULL));
    return (rand() % max);
}


/* Exported function (visible in Genesis) */
// int initScreenT(int x){
//     struct color col;
//     col.r = 0xFF;
//     col.g = 0xFF;
//     col.b = 0xFF;
//     //Make new screen

//     struct color *colptr = &col;
//     initScreen(640, 480, colptr);
// }


#ifndef SKIP_MAIN
int main(int argc, char* args[]){
    struct color col;
    col.r = 0;
    col.g = 0;
    col.b = 0;

    struct color col2;
    col2.r = 0xFF;
    col2.g = 0;
    col2.b = 0;
    //Make new screen
    cluster_t *c = NULL;
    c = malloc(sizeof(cluster_t));
    c->height = 50;
    c->width = 50;
    c->x = 50;
    c->y = 100;
    c->dx = 0;
    c->dy = 0;
    c->color = col2;
    c->id = 0;
    
    HASH_ADD_INT(clusters,id,c);
    printf("%d\n", c->x);
    struct color *colptr = &col;
    startGame(colptr, 640, 480);
}
#endif
