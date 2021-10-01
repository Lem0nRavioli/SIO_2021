#include <stdio.h>

int somme(int a, int b) {
    return a + b;
}

int main() {
    int a,b;
    printf("Enter a, then b: ");
    scanf("%d %d", &a, &b);

    int result = somme(a, b);
    printf("result: %d", result);


}