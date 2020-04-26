##Our Makefile
#--Compiler Name
CC 		= gcc

#--Compile flags
FLAGS = -Wall -Wextra -Wpedantic

#--List of files to be build
OBJECTS = build/main.o \
					build/sys.o 

OUTPUT = output/

#--${varname} is used to call variables
#used to compile all other files
#$^ references whatever the dependencies are
link: ${OBJECTS}
	${CC} $^ -o build/main

#--Compiles main.c
build/main.o: main.c
	${CC} -c ${FLAGS} main.c -o build/main.o

#--Compiles sys.c
build/sys.o: lib/sys.c
	${CC} -c ${FLAGS} lib/sys.c -o build/sys.o

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
	tail -n 1 < ${OUTPUT}dkit.html | tr '<>' '[]' > ${OUTPUT}mangled.txt ; echo >> ${OUTPUT}mangled.txt ; head -n 1 < ${OUTPUT}dkit.html | tr '<>' '[]' >> ${OUTPUT}mangled.txt

run-sec2-task1: lib/colours.txt
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' lib/colours.txt

run-sec2-task2: lib/colours.txt
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' lib/colours.txt | tr -d '\n' | ./build/hexToDecimal | cut -d ',' -f 2 | tr '\n' ','

run-sec2-task3: lib/colours.txt
	grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' lib/colours.txt | tr -d '\n' | ./build/hexToDecimal | sort -k 4 -t , -n > ${OUTPUT}rgba-colours.txt

run-sec3-task1: lib/access.log
	tail lib/access.log

run-sec3-task2: lib/access.log
	cut -d " " -f 1 lib/access.log | sort -n | uniq

run-sec3-task3: lib/access.log
	grep -e '" 404' lib/access.log | cut -d " " -f 3-5

run-sec3-task4: lib/access.log
	grep -E '((Trident)|(MSIE))' lib/access.log > ${OUTPUT}access.ie.log

run-sec3-task5: lib/access.log
	grep -E '" [0-9]{3} ([5-9]|[0-9]{2,})' lib/access.log | cut -d ' ' -f 3-5,7 | sort | tr '\n' ',' | ./build/calculate_times

