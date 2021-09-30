#include <stdio.h>

int main() {
    int dim;
    printf("give arr dim: ");
    scanf("%d", &dim);
    int arr[dim];
    for (int i=0;i<dim;i++) {
        printf("give number: ");
        scanf("%d", &arr[i]);
    }
    for (int i=0;i<dim/2;i++) {
        int temp = arr[i];
        arr[i] = arr[dim - i - 1];
        arr[dim - i - 1] = temp;
    }
    for (int i=0;i<dim;i++) printf("%d ", arr[i]); 
}