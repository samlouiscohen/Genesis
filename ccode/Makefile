CC = clang

CFLAGS = 
LDFLAGS =

#Import SDL based on system type
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Linux)
	LDFLAGS += -lSDL2
endif
ifeq ($(UNAME_S), Darwin)
	LDFLAGS += -I /Library/Frameworks/SDL2.framework/Headers -framework SDL2
endif

all: genesis

genesis: genesis.c genesis.h
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS) 

clean:
	rm genesis
