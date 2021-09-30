#include <stdio.h>

int main() {

    int a,b,c;
    printf("enter 3 int: ");
    scanf("%d %d %d", &a, &b, &c);
    if (a > b){
        if (a > c) printf("%d", a);
        else printf("%d", c);
    }
    else if (c > b) printf("%d", c);
    else printf("max is: %d", b);
}