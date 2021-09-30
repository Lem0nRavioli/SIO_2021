#include <stdio.h>

int main() {
    int entry;
    printf("enter number to divide: ");
    scanf("%d", &entry);
    printf("all denominators: 1");
    for (int i=2;i<entry;i++) {
        if (entry % i == 0) printf(", %d", i);
    }
}