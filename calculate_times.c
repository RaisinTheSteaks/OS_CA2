#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAXBUFFERSIZE 216

int main()
{
	char buffer[MAXBUFFERSIZE];
	fgets(buffer, MAXBUFFERSIZE, stdin);
	//printf("passed fgets\n");
	int count = 0;
	int index = 0;
	//printf("%c", buffer[0]);
	int totalProcTime = 0;
	int minProcTime = 0;
	int maxProcTime = 0;

	int numOfRequest = 1;
	bool detectingRequestPath = false;

	char prevRequest[MAXBUFFERSIZE];
	char currRequest[MAXBUFFERSIZE];

	memset(prevRequest, '\0', sizeof(prevRequest));
	memset(currRequest, '\0', sizeof(currRequest));

	//printf("entering loop\n");
	while(buffer[count] != '\0')
	{
		//if still in one request
		//printf("%c",buffer[count]);
		if(buffer[count] != ',')
		{
			//printf("count: %d\n", count);
			if(buffer[count] == '\"')
			{
				detectingRequestPath = !detectingRequestPath;
				if(detectingRequestPath)
					index = 0;
				else
					currRequest[index] = '\"';
			}

			if(detectingRequestPath)
			{
				//printf("detecting path\n");
				currRequest[index] = buffer[count];
				index++;
				//printf("strcat\n");
			}

		}
		else
		{//if detects delimiter
			int currentProcTime = buffer[count-1] - '0';

			if(buffer[count-2] != ' ')
			{
				int multiplier = buffer[count-2] - '0';
				currentProcTime += multiplier * 10;
			}


			//printf("current buffer%c\n", buffer[count-1]);
			//printf("currentProcTime: %d\n", currentProcTime);
			if(strcmp(currRequest, prevRequest) == 0)
			{
					numOfRequest++;
					totalProcTime += currentProcTime;
					minProcTime = (currentProcTime < minProcTime) ? currentProcTime : minProcTime;
					maxProcTime = (currentProcTime > maxProcTime) ? currentProcTime : maxProcTime;

					//printf("total: %d, numOfRequest: %d\n", totalProcTime, numOfRequest);
					strcpy(prevRequest, currRequest);
					//memset(currRequest, '\0', sizeof(currRequest));


			}
			else
			{
				if(numOfRequest > 1)
				{
					float avg = totalProcTime/numOfRequest;
					printf("Path: %s\t Number of Request: %d\t  Shortest PROC_TIME: %d\t  Longest PROC_TIME: %d\t  Average PROC_TIME: %.2f\n",prevRequest, numOfRequest ,minProcTime, maxProcTime, avg);
				}
				numOfRequest = 1;
				totalProcTime = currentProcTime;
				minProcTime = currentProcTime;
				maxProcTime = currentProcTime;

				//printf("min: %d\n", minProcTime);
			}

			strcpy(prevRequest, currRequest);
			memset(currRequest, '\0', sizeof(currRequest));

		}


		//printf("moves to next char\n");
		count++;
	}

	float avg = totalProcTime/numOfRequest;
	printf("Path: %s\t Number of Request: %d\t  Shortest PROC_TIME: %d\t  Longest PROC_TIME: %d\t  Average PROC_TIME: %.2f\n",prevRequest, numOfRequest ,minProcTime, maxProcTime, avg);


	return 0;
}

