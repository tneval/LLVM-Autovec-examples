; ModuleID = '../../vectors.ll'
source_filename = "../../vectors.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @vectors(ptr %in_a, ptr %in_b, ptr %out) {
  %a0 = getelementptr i32, ptr %in_a, i64 0
  %a1 = getelementptr i32, ptr %in_a, i64 4
  %b0 = getelementptr i32, ptr %in_b, i64 0
  %b1 = getelementptr i32, ptr %in_b, i64 4
  %av0 = load <4 x i32>, ptr %a0, align 16
  %av1 = load <4 x i32>, ptr %a1, align 16
  %bv0 = load <4 x i32>, ptr %b0, align 16
  %bv1 = load <4 x i32>, ptr %b1, align 16
  %res0 = add <4 x i32> %av0, %bv0
  %res1 = add <4 x i32> %av1, %bv1
  %out0 = getelementptr i32, ptr %out, i64 0
  %out1 = getelementptr i32, ptr %out, i64 4
  store <4 x i32> %res0, ptr %out0, align 16
  store <4 x i32> %res1, ptr %out1, align 16
  ret i32 9
}
