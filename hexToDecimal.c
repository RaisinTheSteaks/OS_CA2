#include <stdio.h>
#include <stdlib.h>

#define MAXBUFFERSIZE 283

int main()
{

	char buffer[MAXBUFFERSIZE];

	fgets(buffer, MAXBUFFERSIZE, stdin);

	int count = 0;

	while (buffer[count] != '\0')
	{

		/*printf("%c," , buffer[count]);
		count++;*/

		if(buffer[count] == '#')
		{
			printf("%c" , '#');
			count++;
			continue;
		}

		char hex_str[8];
		int index = 0;

		while(buffer[count] != '#' && buffer[count] != '\0')
		{

			hex_str[index] = buffer[count];
			//printf("%c\n", hex_str[index]);
			//printf("%c\n", buffer[count]);
			count++;
			index++;
		}


		for(int i = 0; i <= index; i+= 2)
		{
			char hex[3] = {hex_str[i] , hex_str[i+1], '\0'};
			long decimal = strtol(hex, NULL, 16);
			if(decimal != 0)
				printf("%d,", decimal);
		}
		
		printf("\n");

	}


	/*char c = 'f';
	char b = 'a';
	char hex[3] = {c , b, '\0'};
	long dec;

	dec = strtol(hex, NULL ,16);

	printf("%d\n",dec);
*/

	return 0;
}
