#include <cuda.h>
#include <stdio.h>

#define N_BLOCKS 8

__device__ volatile int block_counter = 0;

__global__ void kernel() {
    // Before the barrier.
    printf("(B%d, T%d): Before the barrier.\n", blockIdx.x, threadIdx.x);

    // The barrier.
    __syncthreads();

    if (threadIdx.x == 0) {
        atomicAdd((int *)&block_counter, 1);
        while (block_counter < N_BLOCKS)
            ;
    }

    __syncthreads();

    // After the barrier.
    printf("(B%d, T%d): After the barrier.\n", blockIdx.x, threadIdx.x);
}

int main() {
    kernel<<<N_BLOCKS, 128>>>();
    cudaDeviceSynchronize();
}
