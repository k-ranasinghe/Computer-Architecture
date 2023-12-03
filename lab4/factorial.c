#include <stdio.h>

int factorial(int n) {
    int sum = 1;
    while (n > 0){
        sum = sum * n;
        n--;
    }
    return sum;
}

int main() {
    int n = 7;
    printf("%d",factorial(n));

    return 0;
}