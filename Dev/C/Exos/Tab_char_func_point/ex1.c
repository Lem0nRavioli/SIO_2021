#include <stdio.h>

int main() {
    int total=0, dim;
    printf("give arr dim: ");
    scanf("%d", &dim);
    int arr[dim];
    for (int i=0;i<dim;i++) {
        printf("give number: ");
        scanf("%d", &arr[i]);
        total += arr[i];
    }
    printf("%d", total);
}