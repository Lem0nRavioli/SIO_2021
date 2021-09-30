#include <stdio.h>
#include <string.h>

// strlen() / strcomp() => 0 equal / strcpy(a, b) => copy char array values

int main() {
    char maybe[255],witness[255], len;
    printf("Enter a potential palyindrom of less than 254 character long: ");
    scanf("%s", maybe);
    len = strlen(maybe);
    strcpy(witness, maybe);
    for (int i=0;i<len/2;i++) {
        witness[len - i - 1] = maybe[len - i - 1];
        witness[i] = maybe[i];
    }
    printf("%s\n", witness);
    printf("%s\n", maybe);
    if (strcmp(maybe, witness) == 0) printf("Palindrome");
    else printf("Pas lindrome");

}