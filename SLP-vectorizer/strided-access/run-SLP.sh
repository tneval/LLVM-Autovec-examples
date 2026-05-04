#!/bin/bash

CASE="strided8"
LLVM_SOURCE="${CASE}.ll"
LLVM_SOURCE_DL="${CASE}-with-dl.ll"
SLP_OUT_BASIC="${CASE}-after-SLP.ll"
SLP_OUT_NATIVE="${CASE}-after-SLP-native.ll"
ASM_NATIVE="${CASE}-native.asm"
ASM_BASIC="${CASE}-basic.asm"

if [ "$#" -eq 1 ]; then
    CLANG=clang-$1
    OPT=opt-$1
    LLC=llc-$1
else
    CLANG=clang
    OPT=opt
    LLC=llc
fi


for cmd in "$CLANG" "$OPT" "$LLC"; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: $cmd is not found"
        exit 1
    fi
done


CPU_ARCH=$(uname -m)
mkdir -p $CPU_ARCH

cd $CPU_ARCH

CLANG_VERSION=$($CLANG --version | grep -oP 'clang version \K[0-9]+')

mkdir -p $CLANG_VERSION
cd $CLANG_VERSION

$CLANG ../../$LLVM_SOURCE -O0 -S -emit-llvm -o $LLVM_SOURCE_DL

$OPT $LLVM_SOURCE_DL -passes=slp-vectorizer -S -o $SLP_OUT_BASIC

$LLC $SLP_OUT_BASIC -O0 -o $ASM_BASIC

$OPT $LLVM_SOURCE_DL -mcpu=native -passes=slp-vectorizer -S -o $SLP_OUT_NATIVE

$LLC $SLP_OUT_NATIVE -O0 -o $ASM_NATIVE
