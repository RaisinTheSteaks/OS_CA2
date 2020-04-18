##Our Makefile
#--Compiler Name
CC 		= gcc

#--Compile flags
FLAGS = -Wall -Wextra -Wpedantic

#--List of files to be build
OBJECTS = build/main.o \
					build/sys.o 

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


#--Remove all built files
clean:
	rm -rf ./build && mkdir build

#--Run the solution
run:
	./build/main

run-sec1-task1:
	 printf “The quick brown fox jumps over the lazy dog\n” | wc -w

run-sec1-task2:
	 printf “The quick brown fox jumps over the lazy dog\n” | tr [a-z] [A-Z]

run-sec1-task3:
	 curl -o dkit.html https://www.dkit.ie

run-sec1-task4: dkit.html
	 tail -n 1 dkit.html > temp.txt ; printf "\n" >> temp.txt ; head -n 1 dkit.html >> temp.txt ; cat temp.txt |\
	    tr '<' [ | tr '>' ]  >> mangled.txt; rm temp.txt

run-sec2-task1: lib/colours.txt
	 grep -E '#((([[:xdigit:]]){6}$$)|(([[:xdigit:]]){8}$$))' lib/colours.txt
