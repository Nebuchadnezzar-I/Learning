__global__ void print_by_gpu(int *i) { }

int main() {
    int* source;

    size_t size = 1000000 * sizeof(int);
    cudaMalloc((void**)&source, size);
    cudaMemset(source, 0, size);

    print_by_gpu<<<1, 1>>>(source);

    cudaFree(source);
    cudaDeviceSynchronize();

    return 0;
}
