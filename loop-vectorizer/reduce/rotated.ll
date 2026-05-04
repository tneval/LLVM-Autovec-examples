; ModuleID = 'memtoregged.ll'
source_filename = "reduce.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @reduce(ptr %in, i32 %n) {
entry:
  %cmp1 = icmp ugt i32 %n, 0
  br i1 %cmp1, label %loop_body.lr.ph, label %exit

loop_body.lr.ph:                                  ; preds = %entry
  br label %loop_body

loop_body:                                        ; preds = %loop_body.lr.ph, %loop_body
  %sum.03 = phi i32 [ 0, %loop_body.lr.ph ], [ %added, %loop_body ]
  %i.02 = phi i32 [ %n, %loop_body.lr.ph ], [ %i_inc, %loop_body ]
  %next_ptr = getelementptr i32, ptr %in, i32 %i.02
  %next_val = load i32, ptr %next_ptr, align 4
  %added = add i32 %sum.03, %next_val
  %i_inc = sub i32 %i.02, 1
  %cmp = icmp ugt i32 %i_inc, 0
  br i1 %cmp, label %loop_body, label %loop_cond.exit_crit_edge

loop_cond.exit_crit_edge:                         ; preds = %loop_body
  %split = phi i32 [ %added, %loop_body ]
  br label %exit

exit:                                             ; preds = %loop_cond.exit_crit_edge, %entry
  %sum.0.lcssa = phi i32 [ %split, %loop_cond.exit_crit_edge ], [ 0, %entry ]
  ret i32 %sum.0.lcssa
}
