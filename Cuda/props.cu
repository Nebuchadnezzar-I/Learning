#include <cstdio>
int main() {
    cudaDeviceProp cuda_props;

    int count;
    cudaGetDeviceCount( &count );
    for (int i = 0; i < count; i++) {
        cudaGetDeviceProperties( &cuda_props, i );
        printf("Prop: %s\n", cuda_props.name);
    }

    return 0;
}
