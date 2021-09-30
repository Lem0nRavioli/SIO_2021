#include <stdio.h>

void divide(int big, int small,int *arr) {
    int quotient = 0;
    while (big >= small) {
        quotient += 1;
        big -= small;
    }
    arr[0] = quotient;
    arr[1] = big;
}

int main() {
    int a,b, quotient, remainder, results[2];
    printf("Enter 2 ints to divide (big will be diveded): ");
    scanf("%d %d", &a, &b);
    if (a > b) {
        divide(a, b, results);
        quotient = results[0];
        remainder = results[1];
        printf("%d / %d, quotient: %d, remainder: %d", a, b, quotient, remainder);
    }
    else {
        divide(b, a, results);
        quotient = results[0];
        remainder = results[1];
        printf("%d / %d, quotient: %d, remainder: %d", b, a, quotient, remainder);
    }
}