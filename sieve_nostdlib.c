extern void print_asm(int length, char *string);
extern int is_prime(int n);

void itoa(char* str, int val, int base){
	int i = 0;
    int length;
    int did_once = 0;
	
    for(; !did_once || val; i++, val /= base) {
		str[i] = "0123456789abcdef"[val % base];
        did_once = 1;
    }

    length = i;
    for(i=0; i<length/2; i++) {
        int corresp = length - i - 1;
        int aux = str[i];
        str[i] = str[corresp];
        str[corresp] = aux;
    }

    str[length] = '\0';
}

int atoi(char *string) {
    int sign = 1;
    unsigned int num = 0;

    do {
        if (*string == '-')
            sign *= -1;
        else if (*string >= '0' && *string <= '9')
            num = (num * 10) + (*string - '0');
        else if (num > 0)
            break;
    } while (*string++);

    return (num * sign);
}

int main(int argc, char *argv[]) {
    char snum[2];
    int param, param_is_prime;

    param = atoi(argv[1]);
    param_is_prime = is_prime(param);

    itoa(snum, param_is_prime, 10);

    print_asm(1, snum);
    print_asm(1, "\n");

    return 0;
}
