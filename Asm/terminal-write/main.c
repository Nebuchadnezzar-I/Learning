#include <stdio.h>
#include <stdlib.h>

int main() {
    for (int i = 0; i < 5000000; i++) {
        putchar('A' + (rand() % 26));
    }

    return 0;
}
