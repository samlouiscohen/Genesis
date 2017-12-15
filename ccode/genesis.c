#include <SDL2/SDL.h>
#include <stdbool.h>
#include "genesis.h"

extern void update();
extern void init();
extern board_t *curBoard;
extern cluster_t *toRemove;

char *additionalKeynames[] = {"Up", "Down", "Left", "Right", "Space", "Escape"};

SDL_Window *gWindow = NULL;
SDL_Renderer *gRenderer = NULL;
int backgroundR = 0xFF;
int backgroundG = 0xFF;
int backgroundB = 0xFF;
int quit = 0;
uint64_t downState = 0;
uint64_t heldState = 0;
uint64_t upState = 0;
const Uint8 *keyStates = NULL;

int initScreen(color_t *c, int width, int height);
void clearScreen();
void static close();
void showDisplay();
int keyToInt(const char *keyName);
uint64_t keyMask(int number);

//Create screen
int initScreen(color_t *c, int width, int height){
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

SDL_Rect drawRectangle(int x, int y, int w, int h, int r, int g, int b){
    SDL_Rect rect = {x, y, w, h};
    SDL_SetRenderDrawColor(gRenderer, r, g, b, 0xFF);
    SDL_RenderFillRect(gRenderer, &rect);
    return rect;
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
}

void pollEvents(){
    SDL_Event event;
    downState = 0;
    upState = 0;
    heldState = 0;
    while(SDL_PollEvent(&event)){
        if (event.type == SDL_QUIT){
            quit = 1;
        } else if (event.type == SDL_KEYDOWN){
            const char* keyName = SDL_GetKeyName(event.key.keysym.sym);
            uint64_t mask = keyMask(keyToInt(keyName));
            if (event.key.repeat){
                heldState |= mask;
            } else {
                downState |= mask;
            }
        } else if (event.type == SDL_KEYUP){
            const char* keyName = SDL_GetKeyName(event.key.keysym.sym);
            uint64_t mask = keyMask(keyToInt(keyName));
            upState |= mask;
        }
    }
    keyStates = SDL_GetKeyboardState(NULL);
}

int keyInBitmask(uint64_t bitmask, char *keyName){
    int keyInt = keyToInt(keyName);
    return (bitmask & keyMask(keyInt)) != 0;
}

bool isKeyHeld(char *key){
    return keyInBitmask( heldState, key);
}

bool isKeyDown(char *key){
    return keyInBitmask( downState, key);
}

bool isKeyUp(char *key){
    return keyInBitmask( upState, key);
}

int keyToInt(const char *keyName){
    int numChars = 26;
    int numInts = 10;
    if (strlen(keyName) == 1){
        //Check values for alphabet and number chars
        char keyChar = keyName[0];
        if(isalpha(keyChar)){
            keyChar = toupper(keyChar);
            return keyChar - 'A';
        } else if (isdigit(keyChar)){
            return numChars + keyChar - '0';
        }
    } else {
        int i;
        int numAdditionalKeys = sizeof(additionalKeynames) / sizeof(additionalKeynames[0]);
        for(i = 0; i < numAdditionalKeys; i = i + 1){
            if (strcmp(additionalKeynames[i], keyName) == 0){
                return numChars + numInts + i;
            }
        }
    }
    return -1; //Key does not have an int representation
}

uint64_t keyMask(int number){
    uint64_t mask = 1;
    return mask << number;
}

void startGame(color_t *c, int width, int height){
    quit = 0;
    initScreen(c, width, height);
    //init();
    printf("%s\n", "Init successful");
    while (!quit){
        pollEvents();
        //update();
    }
}


/*
void add_Cluster(cluster_t *c){
    cluster_t *clusterList;
    HASH_FIND_STR(curBoard->clusters, c->name,clusterList);
    if(clusterList == NULL){
        clusterList = malloc(sizeof(cluster_t));
        clusterList->name = c->name;
        clusterList->next = NULL;
        HASH_ADD_STR(curBoard->clusters, name, clusterList);
    }
    LL_APPEND(clusterList,c);
}

void remove_Cluster(cluster_t *c){
    cluster_t *clusterList;
    HASH_FIND_STR(curBoard->clusters, c->name,clusterList);

    if(clusterList != NULL){
        LL_DELETE(clusterList, c);
        LL_APPEND(toRemove, c);
    }
}
*/

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


#ifdef BUILD_TEST
int main(int argc, char* args[]){
    struct color col;
    col.r = 0xFF;
    col.g = 0xFF;
    col.b = 0xFF;
    //Make new screen

    struct color *colptr = &col;
    startGame(colptr, 640, 480);
}
#endif
