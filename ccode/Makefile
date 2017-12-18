CC = clang

CFLAGS =
LDFLAGS =

#Import SDL based on system type
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Linux)
	LDFLAGS += -I SDL2-2.0.7/include -L SDL2-2.0.7/build -l SDL2
endif

ifeq ($(UNAME_S), Darwin)
#	LDFLAGS += -I /Library/Frameworks/SDL2.framework/Headers -framework SDL2
	CFLAGS += -I /Library/Frameworks/SDL2.framework/Headers -F /Library/Frameworks
	LDFLAGS += -F /Library/Frameworks -framework SDL2
endif

all: genesis

genesis: genesis.o
	$(CC) $< -o $@ $(LDFLAGS) 

genesis.o: genesis.c genesis.h
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm genesis *.o
