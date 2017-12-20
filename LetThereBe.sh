#!/bin/bash

if [[ $# -eq 1 ]]; then

	make &> /dev/null
	basename=`basename $1 .god`

	printf "Let there be... \e[5m\e[47m\e[34m%s\e[0m\n" $basename
	./genesis.native $1 | llc > tmp.s

	if [[ `uname -s` == "Darwin" ]]; then
		clang -o $basename tmp.s printbig.o ccode/genesis.o -I /Library/Frameworks/SDL2.framework/Headers -F/Library/Frameworks -framework SDL2
	elif [[ `uname -s` == "Linux" ]]; then
		clang -o $basename tmp.s printbig.o ccode/genesis.o -l SDL2
	else
		echo "WARNING: Unrecognized system.  Trying Linux..."
		clang -o $basename tmp.s printbig.o ccode/genesis.o -l SDL2
	fi

	rm tmp.s

elif [[ $# -eq 0 ]]; then
	echo "You gotta give me something to work with..."
else
	echo "I only do one at a time..."
fi
