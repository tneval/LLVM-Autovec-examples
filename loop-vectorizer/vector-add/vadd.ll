
define void @vadd(ptr %in_a, ptr %in_b, ptr %out, i32 %lv)
{
entry:
    %ind = alloca i32
    store i32 0, ptr %ind
    br label %loop_cond

loop_cond:
    %vv = load i32, ptr %ind
    %cond = icmp ugt i32 %lv, %vv
    ;store i32 %lv, %ind
    br i1 %cond, label %loop_body, label %exit

loop_body:
    br label %loop_cond

exit:
    ret void
}