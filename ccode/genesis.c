/*
    Authors: 
     - Leon Stilwell
     - Michael Wang
     - Jason Zhao
*/

#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "genesis.h"

extern void update(int frame);
extern void init();

int initScreen(color *c, int width, int height);

void static close();
void quitGame();
void clearScreen();
void showDisplay();

// Global vars
int framesPerSec = 60;
const Uint8 *keyStates = NULL;

Uint8 *prevKeyStates = NULL;
char *additionalKeynames[] = {"Up", "Down", "Left", "Right", "Space", "Escape"};

int keyStateLen;

SDL_Window *gWindow = NULL;
SDL_Renderer *gRenderer = NULL;

cluster_t *clusters = NULL;

int backgroundR = 0xFF;
int backgroundG = 0xFF;
int backgroundB = 0xFF;

int cluster_id = 0;
int frameNum = 0;
int quit = 0;

void setFPS(int fps){
    framesPerSec = fps;
}

void quitGame(){
    quit = 1;
}

// SDL Initialization 
int initScreen(color *c, int width, int height){
    // Initialize SDL
    if (SDL_Init( SDL_INIT_VIDEO ) < 0) {
        const char *err = SDL_GetError();
        fprintf(stderr, "SDL could not initialize! SDL Error: %s\n", err);
        return -1;
    }

    // Set texture filtering to linear
    if (!SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "1")) {
        fprintf(stderr, "Warning: Linear texture filtering not enabled!");
    }

    // Create window
    gWindow = SDL_CreateWindow("Game", SDL_WINDOWPOS_UNDEFINED, 
                               SDL_WINDOWPOS_UNDEFINED, width, 
                               height, SDL_WINDOW_SHOWN);
    if (!gWindow) {
        const char *err = SDL_GetError();
        fprintf(stderr, "Window could not be created! SDL Error: %s\n", err);
        return -1;
    }

    // Create renderer for window
    gRenderer = SDL_CreateRenderer(gWindow, -1, SDL_RENDERER_ACCELERATED);
    if (!gRenderer) {
        const char *err = SDL_GetError();
        fprintf(stderr, "Renderer could not be created! SDL Error: %s\n", err);
        return -1;
    }

    // Set background color
    backgroundR = c->r;
    backgroundG = c->g;
    backgroundB = c->b;

    // Clear background
    clearScreen();
    showDisplay();

    return 0;
}

//Clears everything drawn on the screen
void clearScreen() {
    SDL_SetRenderDrawColor(gRenderer, backgroundR, backgroundG, backgroundB, 0xFF);
    SDL_RenderClear(gRenderer);
}

void drawRectangle(int x, int y, int w, int h, int r, int g, int b) {
    SDL_Rect rect = { x, y, w, h };
    SDL_SetRenderDrawColor(gRenderer, r, g, b, 0xFF);
    SDL_RenderFillRect(gRenderer, &rect);
}

int inGoalArea(SDL_Rect rect, SDL_Rect goal) {
    int leftBlock = rect.x;
    int rightBlock = rect.x + rect.w;
    int bottomBlock = rect.y;
    int topBlock = rect.y + rect.h;
        
    int leftGoal = goal.x;
    int rightGoal = goal.x + goal.w;
    int bottomGoal = goal.y;
    int topGoal  = goal.y + goal.h;

    if (bottomBlock > bottomGoal && topBlock < topGoal && 
        leftBlock > leftGoal && rightBlock < rightGoal) {
        return 1;
    }

    return 0;
}

void showDisplay(){
    SDL_RenderPresent(gRenderer);
}

// Must be called when program finishes
void static close(){
    SDL_DestroyRenderer(gRenderer);
    SDL_DestroyWindow(gWindow);
    gWindow = NULL;
    gRenderer = NULL;

    SDL_Quit();

    free(prevKeyStates);

    cluster_t *temp, *currentCluster;
    HASH_ITER(hh,clusters,currentCluster,temp) {
        HASH_DEL(clusters,currentCluster);
        free(currentCluster);
    }
}

void pollEvents(){
    int bytes = keyStateLen * sizeof(*keyStates);
    memcpy(prevKeyStates, keyStates, bytes);

    SDL_Event event;
    while(SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            quit = 1;
        } 
    }
}

bool isKeyHeld(char *key) {
    SDL_Scancode code = SDL_GetScancodeFromName(key);
    return keyStates[code] && prevKeyStates[code];
}

bool isKeyDown(char *key) {
    SDL_Scancode code = SDL_GetScancodeFromName(key);
    return keyStates[code] && (!prevKeyStates[code]);
}

bool isKeyUp(char *key) {
    SDL_Scancode code = SDL_GetScancodeFromName(key);
    return (!keyStates[code]) && prevKeyStates[code];
}

void startGame(color *c, int width, int height) {
    quit = 0;
    srand(time(NULL));
    initScreen(c, width, height);

    // Update screen
    showDisplay();
    keyStates = SDL_GetKeyboardState(&keyStateLen);
    prevKeyStates = malloc(keyStateLen * sizeof(Uint8));

    // Initialize any user defined data
    init();

    // Main loop - ie. run the game
    while (!quit) {
        int msPerFrame = (int) (1000 / framesPerSec);        

        frameNum += 1;
        unsigned int frameStart = SDL_GetTicks();

        // Check for user input
        pollEvents();

        // Redraw the screen
        clearScreen();

        // Draws all clusters in hash
        cluster_t *cl;

        for (cl = clusters; cl != NULL; cl = cl->hh.next) {
            if (cl->draw == 1) {
                int x = cl->x + cl->dx; int y = cl->y + cl->dy;
                int h = cl->height; int w = cl->width;
                int r = cl->color.r; int g = cl->color.g; int b = cl->color.b;
                //update cluster x,y
                cl->x = x; cl->y = y;
                drawRectangle(x, y, h, w, r, g, b);
            }
        }

        update(frameNum);
        showDisplay();

        /* Cap the rate of execution of loop */
        unsigned int frameTime = SDL_GetTicks() - frameStart;
        if (frameTime < msPerFrame) {
            SDL_Delay(msPerFrame - frameTime);
        }
    }

    // Tear down
    close();
}

// Called from newCluster. DO NOT CALL OTHERWISE
int create_id() {
    int temp = cluster_id;
    cluster_id = cluster_id + 1;
    
    return temp;

}

int randomInt(int max) {
    return (rand() % max);
}

int newCluster(int length, int width, int x, int y, int dx, int dy, color *color) {
    cluster_t *cluster = malloc(sizeof(cluster_t));
    cluster->height = length;
    cluster->width  = width;
    cluster->x      = x;
    cluster->y      = y;
    cluster->dx     = dx;
    cluster->dy     = dy;
    cluster->color  = *color;
    cluster->id     = create_id();
    cluster->draw   = 1;

    HASH_ADD_INT(clusters, id, cluster);

    unsigned int numClusters;
    numClusters = HASH_COUNT(clusters);

#ifdef DEBUG
    printf("There are %u clusters\n", numClusters);
#endif

    return cluster->id;
}

// Returns pointer to cluster with ID = id if exists, else
// return null, basically a wrapper around HASH_FIND_INT()
cluster_t * getCluster(int id) {
    cluster_t *p;
    HASH_FIND_INT(clusters, &id, p);
    return p;
}

void setDraw(int id, bool b) { cluster_t *c = getCluster(id); if(c) { c->draw = b; } }
void setX(int id, int x)     { cluster_t *c = getCluster(id); if(c) { c->x = x; } }
void setY(int id, int y)     { cluster_t *c = getCluster(id); if(c) { c->y = y; } }
void setDX(int id, int dx)   { cluster_t *c = getCluster(id); if(c) { c->dx = dx; } }
void setDY(int id, int dy)   { cluster_t *c = getCluster(id); if(c) { c->dy = dy; } }
void setColor(int id, struct color *clr) { cluster_t *c = getCluster(id); if(c) { c->color = *clr; } }

int getDraw(int id)    { cluster_t *c = getCluster(id); if (c) { return c->draw; }   else { return -1; } }
int getX(int id)       { cluster_t *c = getCluster(id); if (c) { return c->x; }      else { return -1; } }
int getY(int id)       { cluster_t *c = getCluster(id); if (c) { return c->y; }      else { return -1; } }
int getDX(int id)      { cluster_t *c = getCluster(id); if (c) { return c->dx; }     else { return 0; } }
int getDY(int id)      { cluster_t *c = getCluster(id); if (c) { return c->dy; }     else { return 0; } }
int getHeight(int id)  { cluster_t *c = getCluster(id); if (c) { return c->height; } else { return -1; } }
int getWidth(int id)   { cluster_t *c = getCluster(id); if (c) { return c->width; }  else { return -1; } }
color * getColor(int id) { cluster_t *c = getCluster(id); if (c) { return &(c->color); }  else { return NULL; } }


void deleteCluster(int id){
    cluster_t *c = getCluster(id);
    if(c){ HASH_DEL(clusters, c); }
}

bool detectCollision(int id1, int id2){
    cluster_t *c1 = getCluster(id1);
    cluster_t *c2 = getCluster(id2);

    if (c1 && c2) {
        SDL_Rect r1, r2;
        r1.x = c1->x; r1.y = c1->y;
        r1.w = c1->width; r1.h = c1->height;
        r2.x = c2->x; r2.y = c2->y;
        r2.w = c2->width; r2.h = c2->height;

        const SDL_Rect *r3 = &r1;
        const SDL_Rect *r4 = &r2;

        SDL_Rect res;
        SDL_bool ans;
        ans = SDL_IntersectRect(r3, r4, &res);

        if(ans == SDL_TRUE){
            return 1;
        }

        return 0;
    }

    return 0;
}

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
    struct color *colptr = &col;
    startGame(colptr, 640, 480);
}
#endif
