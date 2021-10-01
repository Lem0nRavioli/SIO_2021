#include <stdio.h>

int main() {
    int tab[] = {1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5}, total = 0;
    int *pt_tab = &tab;
    for (int i=0;i<20;i++) {
        total += *(pt_tab + i);
    }
    // supposed 60
    printf("%d", total);
}