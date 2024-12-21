#include <stdio.h>

typedef struct {
    int specName;
} Helper;

typedef struct {
    int name;
    Helper h;
} ts_struct;

int main() {
    ts_struct ts = { .h = { } };

    printf("Size of typedef struct: %zu\n", sizeof(ts_struct));

    return 0;
}
