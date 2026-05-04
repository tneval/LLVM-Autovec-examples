# SLP-vectorization of vector data types

- Starting from LLVM 19, `-mllvm -slp-revec` allows SLP-vectorizer to revectorize vector data types.
    - Doesn't help loopvectorizer, though.