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

#--Run the solution
run:
	./build/main

run-sec1-task1:
	printf 'The quick brown fox jumps over the lazy dog\n' | wc -w

run-sec1-task2:
	printf 'The quick brown fox jumps over the lazy dog\n' | tr [a-z] [A-Z]

run-sec1-task3:
	curl -o ${OUTPUT}dkit.html https://www.dkit.ie

run-sec1-task4: ${OUTPUT}dkit.html
	tail -n 1 < ${OUTPUT}dkit.html | tr '<>' '[]' > ${OUTPUT}mangled.txt ; echo >> ${OUTPUT}mangled.txt ; head -n 1 < $^ | tr '<>' '[]' >> ${OUTPUT}mangled.txt

run-sec2-task1: ${LIB}${COLOURS}
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' $^

run-sec2-task2: ${LIB}${COLOURS}
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' $^ | tr -d '\n' | ./build/hexToDecimal | cut -d ',' -f 2 | tr '\n' ','

run-sec2-task3: ${LIB}${COLOURS}
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' $^ | tr -d '\n' | ./build/hexToDecimal | sort -k 4 -t , -n > ${OUTPUT}rgba-colours.txt

run-sec3-task1: ${LIB}${ACCESS}
	tail $^

run-sec3-task2: ${LIB}${ACCESS}
	cut -d " " -f 1 $^ | sort -n | uniq

run-sec3-task3: ${LIB}${ACCESS}
	grep -e '" 404' $^ | cut -d " " -f 3-5

run-sec3-task4: ${LIB}${ACCESS}
	grep -E '((Trident)|(MSIE))' $^ > ${OUTPUT}access.ie.log

run-sec3-task5: ${LIB}${ACCESS}
	grep -E '" [0-9]{3} ([5-9]|[0-9]{2,})' $^ | cut -d ' ' -f 3-5,7 | sort | tr '\n' ',' | ./build/calculate_times

