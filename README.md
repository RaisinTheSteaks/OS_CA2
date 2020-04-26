# Operating System CA 2 Unix Tools
This project is the result of collaboration between Joshua Corcoran and Antony Saputra.The purpose of this project is to solve tasks that are given using a given UNIX tools.

## Josh's Contributions
* Initialized a new Repo
* Set up project directories
* Section 1:
	- Task 1
	- Task 2
	- Task 3
* Section 2:
	- Task 1
* Section 3:
	- Task 1
	- Task 2
	- Task 3
	- Task 5: Filtered request that is above 5 miliseconds and display REQUEST_PATH and PROC_TIME
* Created efficient Makefile

## Antony's Contributions
* Section 1:
	- Task 4
* Section 2:
	- Task 2
	- Task 3
* Section 3:
	- Task 4
	- Task 5 : Convert Filtered REQUEST_PATH and PROC_TIME into sorted single line to be put on fgets in custom program
* Created custom C program called hexToDecimal.c
* Created custom C program called calculate_times.c

## Running result of each section
Before running any task, build using GCC custom C program:
* ./section2/hexToDecimal.c
* ./section3/calculate_times.c

In order to run each task, go to section directories and type:

```
make run-taskN
```
Replace the N to the task number

Example: to run section 2 task 3, in folder section2, type in:

```
make run-task3
```
NB: Make sure that you are in the correct section directory
