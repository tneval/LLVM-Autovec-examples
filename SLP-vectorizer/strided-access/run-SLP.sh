#!/bin/bash

LLVM_SOURCE="strided8.ll"
LLVM_SOURCE_DL="strided8-with-dl.ll"

clang $LLVM_SOURCE -O0 -S -emit-llvm -o $LLVM_SOURCE_DL

opt $LLVM_SOURCE_DL -mcpu=native -passes=slp-vectorizer -S -o strided8-after-SLP-native.ll

llc strided8-after-SLP-native.ll -O0 -o strided8-native.asm

opt $LLVM_SOURCE_DL -passes=slp-vectorizer -S -o strided8-after-SLP.ll

llc strided8-after-SLP.ll -O0 -o strided8.asm




LLVM_SOURCE4="strided4.ll"
LLVM_SOURCE4_DL="strided4-with-dl.ll"

clang $LLVM_SOURCE4 -O0 -S -emit-llvm -o $LLVM_SOURCE4_DL

opt $LLVM_SOURCE4_DL -mcpu=native -passes=slp-vectorizer -S -o strided4-after-SLP-native.ll

llc strided4-after-SLP-native.ll -O0 -o strided4-native.asm

opt $LLVM_SOURCE4_DL -passes=slp-vectorizer -S -o strided4-after-SLP.ll

llc strided4-after-SLP.ll -O0 -o strided4.asm