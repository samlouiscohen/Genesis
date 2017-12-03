#include <SDL2/SDL.h>

typedef struct color {
    int r;
    int g;
    int b;
} color;

typedef struct position {
    int x;
    int y;    
} position;

SDL_Window *gWindow = NULL;
SDL_Renderer *gRenderer = NULL;
int backgroundR = 0xFF;
int backgroundG = 0xFF;
int backgroundB = 0xFF;

int initScreen(int width, int height, color c);
void clearScreen();
void static close();
void showDisplay();
int initScreenT(int x);

//Create screen
int initScreen(int width, int height, color c){
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
                backgroundR = c.r;
                backgroundG = c.g;
                backgroundB = c.b;
                //Clear background
                clearScreen();
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

/* Exported function (visible in Genesis) */
int initScreenT(int x){
    struct color col;
    col.r = 0xFF;
    col.g = 0xFF;
    col.b = 0xFF;
    //Make new screen
    if (initScreen(640, 480, col)){
        drawRectangle(0, 0, 20, 20, 0xFF, 0, 0);
        showDisplay();
        //wait 4 seconds
		int i;
        for(i = 0; i < 4000; i++){
            SDL_PumpEvents();
            SDL_Delay(1);
        }
        close();
    }

    return 0;
}

// #ifdef BUILD_TEST
// int main(int argc, char* args[]){

//     struct color col;
//     col.r = 0xFF;
//     col.g = 0xFF;
//     col.b = 0xFF;
//     //Make new screen
//     if (initScreen(640, 480, col)){
//         drawRectangle(0, 0, 20, 20, 0xFF, 0, 0);
//         showDisplay();
//         //wait 4 seconds
//         for(int i = 0; i < 4000; i++){
//             SDL_PumpEvents();
//             SDL_Delay(1);
//         }
//         close();
//     }

//     return 0;
// }
// #endif
