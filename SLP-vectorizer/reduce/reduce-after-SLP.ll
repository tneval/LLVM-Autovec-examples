; ModuleID = 'reduce-with-dl.ll'
source_filename = "reduce.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @reduce(ptr %a) {
  %a0 = getelementptr i32, ptr %a, i64 0
  %1 = load <8 x i32>, ptr %a0, align 4
  %2 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %1)
  ret i32 %2
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
