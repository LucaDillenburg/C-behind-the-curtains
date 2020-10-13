#include <stdlib.h>
#include <math.h>

extern void print_asm(int length, char *string);
extern int is_prime(int n);

int main(int argc, char *argv[]) {
    int param = atoi(argv[1]);
    printf("Returned: %d\n", is_prime(param));
}
