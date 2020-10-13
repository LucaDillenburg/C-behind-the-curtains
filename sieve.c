#include <stdio.h>
#include <stdlib.h> 
#include <math.h>

int is_prime(int n) {
    int div;
    double lastDiv = sqrt((double)n);

    int absN = abs(n);
    if (absN == 2)
        return 1;
    if (absN == 1 || n%2==0)
        return 0;

    for (div=3; div<=lastDiv; div += 2)
        if (n % div == 0)
            return 0;

    return 1;
}

int main(int argc, char *argv[]) {
    int param = atoi(argv[1]);
    printf("%d\n", is_prime(param));
    return 0;
}
