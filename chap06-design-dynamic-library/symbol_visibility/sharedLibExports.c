#include "sharedLibExports.h"
#include <stdio.h>

void myfunc1() { printf("func1\n"); }
void myfunc2() { printf("func2\n"); }
void myfunc3() { printf("func3\n"); }

void printMsg(){
    printf("running the function exported from the shared library\n");
}
