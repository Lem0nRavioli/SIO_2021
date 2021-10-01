#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// clear console
void clrscr()
{
    system("@cls||clear");
}

void tour(int *life, char *word, char *show, char *bad, int len){
    clrscr();
    printf("You have %d life\n", *life);
    printf("You already tried: %s\n", bad);
    printf("%s\n", show);
    char prop;
    printf("Propose a letter: ");
    scanf(" %c", &prop);
    bool okmove = false;
    for (int i=1;i<len - 1;i++) {
        if (word[i] == prop) {
            show[i] = prop;
            okmove = true;
        }
    }
    if (!okmove) {
        *life -= 1;
        strncat(bad, &prop, 1); // append proposition to char list of bad attempt
    }
}

int main() {
    char word[255], show[255], bad[255];
    int life=8;
    printf("Enter a word: ");
    scanf("%s", word);
    int len = strlen(word);
    show[0] = word[0];
    for (int i=1;i<len-1;i++) show[i] = '_';
    show[len - 1] = word[len - 1];
    show[len] = '\0';
    while (life > 0) {
        tour(&life, word, show, bad, len);
        if (strcmp(word, show) == 0) break;
    }
    if (life == 0) printf("U suck lol");
    else printf("Congratulation ! the word was: %s", show);

}