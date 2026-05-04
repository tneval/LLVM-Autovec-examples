; ModuleID = 'reduce.ll'
source_filename = "reduce.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @reduce(ptr %in, i32 %n) {
entry:
  %sum = alloca i32, align 4
  store i32 0, ptr %sum, align 4
  %i = alloca i32, align 4
  store i32 %n, ptr %i, align 4
  br label %loop_cond

loop_cond:                                        ; preds = %loop_body, %entry
  %cur_i = load i32, ptr %i, align 4
  %cmp = icmp ugt i32 %cur_i, 0
  br i1 %cmp, label %loop_body, label %exit

loop_body:                                        ; preds = %loop_cond
  %li = load i32, ptr %i, align 4
  %temp_sum = load i32, ptr %sum, align 4
  %next_ptr = getelementptr i32, ptr %in, i32 %li
  %next_val = load i32, ptr %next_ptr, align 4
  %added = add i32 %temp_sum, %next_val
  store i32 %added, ptr %sum, align 4
  %i_inc = sub i32 %li, 1
  store i32 %i_inc, ptr %i, align 4
  br label %loop_cond

exit:                                             ; preds = %loop_cond
  %reduced = load i32, ptr %sum, align 4
  ret i32 %reduced
}
