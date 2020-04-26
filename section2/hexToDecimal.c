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
			printf("%s" , "rgba(");
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


		for(int i = 0; i < 6; i+= 2)
		{

			char hex[3] = {hex_str[i] , hex_str[i+1], '\0'};
			long decimal = strtol(hex, NULL, 16);
			if(decimal != 0)
				printf("%d,", decimal);
		}

		long alpha = 255;

		if(index > 6)
		{
			char hex[3] = {hex_str[6] , hex_str[7], '\0'};
			alpha = strtol(hex, NULL, 16);
		}

		printf("%d)\n", alpha);

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
