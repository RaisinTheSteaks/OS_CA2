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
* hexToDecimal.c
* calculate_times.c

In order to run each section, type:

```
make run-secN-taskM
```
Replace the N to the number of section that is desired
Replace the M to the number of task in the specified section

Example: running section 2 task 3

```
make run-sec2-task3
```

