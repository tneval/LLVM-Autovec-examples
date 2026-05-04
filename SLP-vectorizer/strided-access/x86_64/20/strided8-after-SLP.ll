; ModuleID = 'strided8-with-dl.ll'
source_filename = "../../strided8.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define void @strided(ptr noalias %in, ptr noalias %out) {
  %ap0 = getelementptr i32, ptr %in, i32 0
  %ap4 = getelementptr i32, ptr %in, i32 8
  %out0 = getelementptr i32, ptr %out, i32 0
  %out4 = getelementptr i32, ptr %out, i32 4
  %1 = load <8 x i32>, ptr %ap0, align 4
  %2 = shufflevector <8 x i32> %1, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %3 = shufflevector <8 x i32> %1, <8 x i32> poison, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %4 = add <4 x i32> %2, %3
  store <4 x i32> %4, ptr %out0, align 4
  %5 = load <8 x i32>, ptr %ap4, align 4
  %6 = shufflevector <8 x i32> %5, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %7 = shufflevector <8 x i32> %5, <8 x i32> poison, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %8 = add <4 x i32> %6, %7
  store <4 x i32> %8, ptr %out4, align 4
  ret void
}
