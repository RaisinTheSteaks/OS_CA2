##Our Makefile
#--Compiler Name
CC 			= gcc

#--Compile flags
FLAGS 	= -Wall -Wextra -Wpedantic

#--Name of our output directory--
OUTPUT 	= output/

#--Directory of input files--
LIB 		= lib/

#--Remove all built files
clean:
	rm -rf ./build && mkdir build

run-task1:
	printf 'The quick brown fox jumps over the lazy dog\n' | wc -w

run-task2:
	printf 'The quick brown fox jumps over the lazy dog\n' | tr [a-z] [A-Z]

run-task3:
	curl -o ${OUTPUT}dkit.html https://www.dkit.ie

run-task4: ${OUTPUT}dkit.html
	tail -n 1 < ${OUTPUT}dkit.html | tr '<>' '[]' > ${OUTPUT}mangled.txt ; echo >> ${OUTPUT}mangled.txt ; head -n 1 < $^ | tr '<>' '[]' >> ${OUTPUT}mangled.txt
