; ModuleID = 'reduce2.ll'
source_filename = "reduce.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @reduce(ptr %in, i32 %n) {
entry:
  br label %loop_cond

loop_cond:                                        ; preds = %loop_body, %entry
  %i.0 = phi i32 [ %n, %entry ], [ %i_inc, %loop_body ]
  %sum.0 = phi i32 [ 0, %entry ], [ %added, %loop_body ]
  %cmp = icmp ugt i32 %i.0, 0
  br i1 %cmp, label %loop_body, label %exit

loop_body:                                        ; preds = %loop_cond
  %next_ptr = getelementptr i32, ptr %in, i32 %i.0
  %next_val = load i32, ptr %next_ptr, align 4
  %added = add i32 %sum.0, %next_val
  %i_inc = sub i32 %i.0, 1
  br label %loop_cond

exit:                                             ; preds = %loop_cond
  ret i32 %sum.0
}
