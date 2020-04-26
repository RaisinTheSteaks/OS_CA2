##Our Makefile
#--Compiler Name
CC 			= gcc

#--Compile flags
FLAGS 	= -Wall -Wextra -Wpedantic

#--Name of our output directory--
OUTPUT 	= output/

#--Directory of input files--
LIB 		= lib/

#--Input for access.log--
ACCESS	= access.log

#--Remove all built files
clean:
	rm -rf ./build && mkdir build

run-task1: ${LIB}${ACCESS}
	tail $^

run-task2: ${LIB}${ACCESS}
	cut -d " " -f 1 $^ | sort -n | uniq

run-task3: ${LIB}${ACCESS}
	grep -e '" 404' $^ | cut -d " " -f 3-5

run-task4: ${LIB}${ACCESS}
	grep -E '((Trident)|(MSIE))' $^ > ${OUTPUT}access.ie.log

run-task5: ${LIB}${ACCESS}
	grep -E '" [0-9]{3} ([5-9]|[0-9]{2,})' $^ | cut -d ' ' -f 3-5,7 | sort | tr '\n' ',' | ./build/calculate_times

