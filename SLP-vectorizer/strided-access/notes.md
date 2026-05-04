
# SLP-vectorization of strided accesses

- LLVM/Clang 20 can successfully vectorize strided memory access patterns using shuffles.
    - Earlier versions vectorize only partially.