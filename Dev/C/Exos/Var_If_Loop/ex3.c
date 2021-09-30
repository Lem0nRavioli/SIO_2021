#include <stdio.h>

int main() {
    char entry;
    printf("Select a char: ");
    scanf("%c", &entry);
    int deciEntry = entry;
    printf("Char: %c, decimal: %d, hex: %02X", entry, deciEntry, entry);

}