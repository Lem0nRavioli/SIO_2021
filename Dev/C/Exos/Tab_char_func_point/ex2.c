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
    int j=0, newarr[dim];
    for (int i=0; i<dim;i++) {
        if (arr[i] != 0) {
            newarr[j] = arr[i];
            j++;
        }
    }
    for (int i=0;i<j;i++) printf("%d ", newarr[i]);
}