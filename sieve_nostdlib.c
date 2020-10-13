extern void print_asm(int length, char *string);
extern int is_prime(int n);

char* itoa(int val, int base){
	static char buf[32] = {0};
	int i = 30;
    int did_once = 0;
	for(; !did_once || (val && i) ; --i, val /= base) {
		buf[i] = "0123456789abcdef"[val % base];
        did_once = 1;
    }
	return &buf[i+1];	
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
    int param = atoi(argv[1]);
    int param_is_prime = is_prime(param);

    char *snum = itoa(param_is_prime, 10);

    print_asm(1, snum);
    print_asm(1, "\n");

    return 0;
}
