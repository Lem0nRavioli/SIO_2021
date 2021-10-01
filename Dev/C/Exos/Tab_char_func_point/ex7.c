#include <stdio.h>

int max_2(int a, int b) {
    int max = a;
    if (b > a) max = b;
    return max;
}

int max_4(int a, int b, int c, int d) {
    int x = max_2(a, b);
    int y = max_2(c, d);
    if (x > y) return x;
    else return y;
}

int main() {
    int a,b,c,d;
    printf("Give 4 int: ");
    scanf("%d %d %d %d", &a, &b, &c, &d);

    int result = max_4(a, b, c, d);
    printf("max: %d", result);
}