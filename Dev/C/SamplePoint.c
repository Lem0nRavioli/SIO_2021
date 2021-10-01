#include <stdio.h>

int main(int argc, char const *argv[])
{
    int a[] = {3, 4, 5};
    int *pt_a = a;
    printf("%x", *(pt_a + 2));
    
}
