; ModuleID = 'las-with-dl.ll'
source_filename = "las.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @copy(ptr noalias align 32 %a, ptr noalias align 32 %b) {
  %p0 = getelementptr [8 x i32], ptr %a, i64 0, i64 0
  %p4 = getelementptr [8 x i32], ptr %a, i64 0, i64 4
  %d0 = getelementptr [8 x i32], ptr %b, i64 0, i64 0
  %d4 = getelementptr [8 x i32], ptr %b, i64 0, i64 4
  %1 = load <4 x i32>, ptr %p0, align 4
  %2 = add <4 x i32> %1, %1
  store <4 x i32> %2, ptr %d0, align 4
  %3 = load <4 x i32>, ptr %p4, align 4
  %4 = add <4 x i32> %3, %3
  store <4 x i32> %4, ptr %d4, align 4
  ret void
}
