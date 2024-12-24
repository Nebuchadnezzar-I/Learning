#include <cstdio>

void __global__ print_by_gpu( int *source ) {
    source += 1;
}

int main() {
    int dest;
    int source;

    cudaMalloc((void**)&source, sizeof(int));

    print_by_gpu<<<1, 10>>>(&source);

    cudaMemcpy(
        &dest, &source,
        sizeof(int), cudaMemcpyDeviceToHost
    );

    cudaFree( &source );

    return 0;
}
