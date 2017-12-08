CC = clang

CFLAGS = -DBUILD_TEST
LDFLAGS =

#Import SDL based on system type
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Linux)
	LDFLAGS += 
endif
ifeq ($(UNAME_S), Darwin)
#	LDFLAGS += -I /Library/Frameworks/SDL2.framework/Headers -framework SDL2
	LDFLAGS += -I /Library/Frameworks/SDL2.framework/Headers -F/Library/Frameworks -framework SDL2
endif

all: genesis

genesis: genesis.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

clean:
	rm genesis
