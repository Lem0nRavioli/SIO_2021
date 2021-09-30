#include <stdio.h>

int dum_alg(int a, int b, int c) {
    while (b > 0) {
        printf("%d * %d + %d\n", a, b, c);
        if (b%2 == 0) {
            a = a * 2;
            b = b / 2;
        }
        else {
            c += a;
            b -= 1;
        }
    }
    printf("%d", c);
}

int main() {
    int a,b, c=0;
    printf("Input a and b: ");
    scanf("%d %d", &a, &b);
    dum_alg(a, b, c);
}