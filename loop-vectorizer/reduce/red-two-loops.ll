; ModuleID = 'red-two-loops.ll'
source_filename = "red-two-loops.ll"

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
  br i1 %cmp, label %loop_body, label %exit_l

loop_body:                                        ; preds = %loop_cond
  %li = load i32, ptr %i, align 4
  %temp_sum = load i32, ptr %sum, align 4
  %next_ptr = getelementptr i32, ptr %in, i32 %li
  %next_val = load i32, ptr %next_ptr, align 4
  %added = add i32 %temp_sum, %next_val
  store i32 %added, ptr %sum, align 4
  %i_inc = add i32 %li, 1
  store i32 %i_inc, ptr %i, align 4
  br label %loop_cond

exit_l:                                           ; preds = %loop_cond
  %reduced = load i32, ptr %sum, align 4
  br label %next_loop_hdr

next_loop_hdr:                                    ; preds = %exit_l
  %i2 = alloca i32, align 4
  store i32 10, ptr %i2, align 4
  br label %loop_cond2

loop_cond2:                                       ; preds = %loop_body2, %next_loop_hdr
  %cur_i2 = load i32, ptr %i2, align 4
  %cmp2 = icmp ugt i32 %cur_i2, 0
  br i1 %cmp2, label %loop_body2, label %exit

loop_body2:                                       ; preds = %loop_cond2
  %li2 = load i32, ptr %i2, align 4
  %temp_sum2 = load i32, ptr %sum, align 4
  %next_ptr2 = getelementptr i32, ptr %in, i32 %li2
  %next_val2 = load i32, ptr %next_ptr2, align 4
  %added2 = add i32 %temp_sum2, %next_val2
  store i32 %added2, ptr %sum, align 4
  %i_inc2 = sub i32 %li2, 1
  store i32 %i_inc2, ptr %i2, align 4
  br label %loop_cond2

exit:                                             ; preds = %loop_cond2
  ret i32 %reduced
}
