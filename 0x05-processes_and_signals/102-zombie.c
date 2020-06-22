#include <stdlib.h>
#include <stdio.h>

/**
 * infinite_while - runs an infinite loop
 *
 * Return: always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - creates five zombie process
 *
 * Return: always 0
 */
int main(void)
{
	short i;

	for (i = 0; i < 5; i++)
	{
		if (fork() != 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
		}
		else
		{
			return (0);
		}
	}
	infinite_while();
	return (0);
}
