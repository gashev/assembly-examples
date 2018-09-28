#include <stdio.h>

extern int factorial(int);

int main(void) {
    int n = 6;
    printf("%d! = %d\n", n, factorial(n));
}
