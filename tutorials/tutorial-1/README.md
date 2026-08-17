# Tutorial 1

## Questions

1. Write a program that prints properties of a CUDA device. You can edit the
   program `cuda.c` uploaded on Moodle to print more properties.

2. Write a program that implements a barrier for all threads of a CUDA kernel
   (across blocks as well) using `__syncthreads` and atomic operations.

## Solutions

The solutions can be found in the [`solutions/`](./solutions/) directory:

1. [`q1.cu`](./solutions/q1.cu)
2. [`q2.cu`](./solutions/q2.cu)

> [!WARNING]
> Even though the solution for Q2 will most probably work, the CUDA handbook
> discourages writing kernels wherein threads rely on information from or
> synchronize with other threads from other blocks, as the GPU's hardware
> capabilities might restrict all blocks from being scheduled at once, and as
> the program relies on that to successfully execute, such a scenario might
> lead to a deadlock.

## Sample outputs

The directory [`sample-outputs/`](./sample-outputs/) contains outputs of my
runs of the solutions:

1. [`q1_output`](./sample-outputs/q1_output)
2. [`q2_output`](./sample-outputs/q2_output)

### Checking `q2_output`

```bash
λ⟩ grep Before q2_output -n | tail -n 1
1024:(B3, T127): Before the barrier.

λ⟩ grep After q2_output -n | head -n 1
1025:(B1, T0): After the barrier.
```

This shows that all the `Before the barrier.` outputs came before the first
`After the barrier.` message, which is the expected output for a working
barrier.

