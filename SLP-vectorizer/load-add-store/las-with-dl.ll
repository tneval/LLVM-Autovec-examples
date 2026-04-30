; ModuleID = 'las.ll'
source_filename = "las.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @copy(ptr noalias align 32 %a, ptr noalias align 32 %b) {
  %p0 = getelementptr [8 x i32], ptr %a, i64 0, i64 0
  %p1 = getelementptr [8 x i32], ptr %a, i64 0, i64 1
  %p2 = getelementptr [8 x i32], ptr %a, i64 0, i64 2
  %p3 = getelementptr [8 x i32], ptr %a, i64 0, i64 3
  %p4 = getelementptr [8 x i32], ptr %a, i64 0, i64 4
  %p5 = getelementptr [8 x i32], ptr %a, i64 0, i64 5
  %p6 = getelementptr [8 x i32], ptr %a, i64 0, i64 6
  %p7 = getelementptr [8 x i32], ptr %a, i64 0, i64 7
  %v0 = load i32, ptr %p0, align 4
  %v1 = load i32, ptr %p1, align 4
  %v2 = load i32, ptr %p2, align 4
  %v3 = load i32, ptr %p3, align 4
  %v4 = load i32, ptr %p4, align 4
  %v5 = load i32, ptr %p5, align 4
  %v6 = load i32, ptr %p6, align 4
  %v7 = load i32, ptr %p7, align 4
  %vv0 = add i32 %v0, %v0
  %vv1 = add i32 %v1, %v1
  %vv2 = add i32 %v2, %v2
  %vv3 = add i32 %v3, %v3
  %vv4 = add i32 %v4, %v4
  %vv5 = add i32 %v5, %v5
  %vv6 = add i32 %v6, %v6
  %vv7 = add i32 %v7, %v7
  %d0 = getelementptr [8 x i32], ptr %b, i64 0, i64 0
  %d1 = getelementptr [8 x i32], ptr %b, i64 0, i64 1
  %d2 = getelementptr [8 x i32], ptr %b, i64 0, i64 2
  %d3 = getelementptr [8 x i32], ptr %b, i64 0, i64 3
  %d4 = getelementptr [8 x i32], ptr %b, i64 0, i64 4
  %d5 = getelementptr [8 x i32], ptr %b, i64 0, i64 5
  %d6 = getelementptr [8 x i32], ptr %b, i64 0, i64 6
  %d7 = getelementptr [8 x i32], ptr %b, i64 0, i64 7
  store i32 %vv0, ptr %d0, align 4
  store i32 %vv1, ptr %d1, align 4
  store i32 %vv2, ptr %d2, align 4
  store i32 %vv3, ptr %d3, align 4
  store i32 %vv4, ptr %d4, align 4
  store i32 %vv5, ptr %d5, align 4
  store i32 %vv6, ptr %d6, align 4
  store i32 %vv7, ptr %d7, align 4
  ret void
}
