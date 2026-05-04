
define i32 @reduce(ptr %in, i32 %n)
{
entry:
    %sum = alloca i32
    store i32 0, ptr %sum

    %i = alloca i32
    store i32 %n, ptr %i
    br label %loop_cond

loop_cond:
    %cur_i = load i32, ptr %i
    %cmp = icmp ugt i32 %cur_i, 0
    br i1 %cmp, label %loop_body, label %exit

loop_body:
    %li = load i32, ptr %i
    %temp_sum = load i32, ptr %sum
    %next_ptr = getelementptr i32, ptr %in, i32 %li
    %next_val = load i32, ptr %next_ptr
    %added = add i32 %temp_sum, %next_val
    store i32 %added, ptr %sum
    %i_inc = sub i32 %li, 1
    store i32 %i_inc, ptr %i

    br label %loop_cond


exit:
    %reduced = load i32, ptr %sum
    ret i32 %reduced
}