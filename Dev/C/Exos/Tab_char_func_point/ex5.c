#include <stdio.h>
#include <string.h>

// strlen() / strcomp() => 0 equal / strcpy(b, a) => copy char array values from to b from a
int max(int a, int b) {
    int max = a;
    if (max < b) max = b;
    return max;
}

int main() {
    char arr1[255], arr2[255], temp[255];
    printf("Enter a ch'array less than 254 character long: ");
    scanf("%s", arr1);
    printf("Enter another ch'array less than 254 character long: ");
    scanf("%s", arr2);

    printf("Current shape: %s\n", arr1);
    printf("Current shape: %s\n", arr2);
    // this using strcpy
    strcpy(temp, arr1);
    strcpy(arr1, arr2);
    strcpy(arr2, temp);

    printf("Current shape: %s\n", arr1);
    printf("Current shape: %s\n", arr2);
    
    // this without
    int len1 = strlen(arr1);
    int len2 = strlen(arr2);
    int maxLen = max(len1, len2);
    for (int i=0;i<maxLen;i++) {
        char temp = arr1[i];
        arr1[i] = arr2[i];
        arr2[i] = temp;
    }

    printf("Current shape: %s\n", arr1);
    printf("Current shape: %s\n", arr2);

}