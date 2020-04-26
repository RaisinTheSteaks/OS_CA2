##Our Makefile
#--Compiler Name
CC 			= gcc

#--Compile flags
FLAGS 	= -Wall -Wextra -Wpedantic

#--Name of our output directory--
OUTPUT 	= output/

#--Directory of input files--
LIB 		= lib/

#--Input for Colours --
COLOURS	= colours.txt

#--Input for access.log--
ACCESS	= access.log


build/hexToDecimal.o: hexToDecimal.c
	${cc} -c ${FLAGS} hexToDecimal.c -o build/hexToDecimal.o

#--Remove all built files
clean:
	rm -rf ./build && mkdir build

run-task1: ${LIB}${COLOURS}
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' $^

run-task2: ${LIB}${COLOURS}
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' $^ | tr -d '\n' | ./build/hexToDecimal | cut -d ',' -f 2 | tr '\n' ','

run-task3: ${LIB}${COLOURS}
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' $^ | tr -d '\n' | ./build/hexToDecimal | sort -k 4 -t , -n > ${OUTPUT}rgba-colours.txt


