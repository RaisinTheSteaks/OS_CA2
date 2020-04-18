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
