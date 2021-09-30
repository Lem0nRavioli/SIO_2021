#include <stdio.h>

int main() {
    int entry = 1, max = -32767, min = 32767;
    while (entry != 0) {
        printf("Enter an int (0 to end): ");
        scanf("%d", &entry);
        if (entry > max) max = entry;
        if (entry < min) min = entry;
        printf("Current max: %d, current min: %d\n", max, min);
    }
    
}