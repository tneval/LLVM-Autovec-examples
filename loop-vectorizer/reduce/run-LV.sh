
CASE="red-two-loops"

LLVM_SOURCE="${CASE}.ll"
LLVM_SOURCE_DL="${CASE}-with-dl.ll"


#clang $LLVM_SOURCE -O0 -S -emit-llvm -o $LLVM_SOURCE_DL

#opt $LLVM_SOURCE_DL -mcpu=native -passes=loop-vectorize -pass-remarks=loop-vectorize -pass-remarks-missed=loop-vectorize -pass-remarks-analysis=loop-vectorize -pass-remarks-output=outt.yaml -S -o out.ll


clang reduce.ll -O0 -S -emit-llvm -o reduce2.ll
opt reduce2.ll -passes=mem2reg -S -o memtoregged.ll
opt memtoregged.ll -passes=loop-rotate -S -o rotated.ll
#debugir rotated.ll
opt rotated.ll -mcpu=native -passes=loop-vectorize -pass-remarks=loop-vectorize -pass-remarks-missed=loop-vectorize -pass-remarks-analysis=loop-vectorize -pass-remarks-output=remarks.yaml  -S -o lved.ll
