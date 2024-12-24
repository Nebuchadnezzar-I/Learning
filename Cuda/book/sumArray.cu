#include <cstdint>
#include <cstdio>
#include <cuda_runtime.h>

__global__ void sumArray(uint8_t *arr, int *result) {
    int sum = 0;

    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if (tid < 65) {
        sum = arr[tid];
    }

    for (int offset = 16; offset > 0; offset /= 2) {
        sum += __shfl_down_sync(0xFFFFFFFF, sum, offset);
    }

    if (threadIdx.x % 32 == 0) {
        atomicAdd(result, sum);
    }
}

int main(int argc, char **argv) {
    uint8_t source[] = {
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
        19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
        36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
        54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
    };

    uint8_t *d_source;
    int *d_result;
    int h_result = 0;

    cudaMalloc((void**)&d_source, sizeof(source));
    cudaMalloc((void**)&d_result, sizeof(int));

    cudaMemcpy(d_source, source, sizeof(source), cudaMemcpyHostToDevice);
    cudaMemset(d_result, 0, sizeof(int));

    sumArray<<<1, 65>>>(d_source, d_result);
    cudaDeviceSynchronize();

    cudaMemcpy(&h_result, d_result, sizeof(int), cudaMemcpyDeviceToHost);

    cudaFree(d_source);
    cudaFree(d_result);

    printf("Sum: %d\n", h_result);

    return 0;
}
