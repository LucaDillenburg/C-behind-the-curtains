#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int is_prime(int n);

int main(int argc, char *argv[]) {
    int param = atoi(argv[1]);
    printf("%d\n", is_prime(param));
    return 0;
}
