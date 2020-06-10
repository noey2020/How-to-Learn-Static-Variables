/* Noel S Cruz 	June 9, 2020
   ex_static_variables.c   Local variable versus declaring it static. */

#include <stdio.h>

int myFunction(){
	int x = 5;	// x is a local variable. scope is local. becomes local
	x = x + 1;  // after a brace. whereas global is outside a brace and
	return x;	// visible to the file. extern makes its scope outside
}				// to other file/s.

int myFunction1(){
	static int v = 5;	// local variable v declared static
	v = v + 1;			// variable initialized once only
	return v;			// stored not in register but in memory
}

int main()
{
    int y, z;
    y = myFunction();	// y = 6
    printf("y = %d\n", y);
	y = myFunction();	// y = 6
	printf("second call, y = %d\n", y);
	y = myFunction();	// y = 6
	printf("third call, y = %d\n\n", y);

	printf("Local variable declared static.\n");
    z = myFunction1();	// z = 6
    printf("z = %d\n", z);
	z = myFunction1();	// z = 7
	printf("second call, z = %d\n", z);
	z = myFunction1();	// z = 8
	printf("third call, z = %d\n", z);

    return 0;
}