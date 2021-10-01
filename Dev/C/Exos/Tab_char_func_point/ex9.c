#include <stdio.h>
#include <string.h>

int main() {
    char a[255], *ptr_char, ch;

    // Work only with word, dealing with string is annoying
    printf("Gib word: ");
    scanf("%s", a);
    printf("Gib char to search: ");
    scanf(" %c", &ch);

    ptr_char = strchr(a, ch);
    printf("After elimination of all char before the searched one, the entry look like: \n%s", ptr_char);
}