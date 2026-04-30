
define i32 @reduce(ptr %a)
{
    %a0 = getelementptr i32, ptr %a, i64 0
    %a1 = getelementptr i32, ptr %a, i64 1
    %a2 = getelementptr i32, ptr %a, i64 2
    %a3 = getelementptr i32, ptr %a, i64 3
    %a4 = getelementptr i32, ptr %a, i64 4
    %a5 = getelementptr i32, ptr %a, i64 5
    %a6 = getelementptr i32, ptr %a, i64 6
    %a7 = getelementptr i32, ptr %a, i64 7

    %v0 = load i32, ptr %a0
    %v1 = load i32, ptr %a1
    %v2 = load i32, ptr %a2
    %v3 = load i32, ptr %a3
    %v4 = load i32, ptr %a4
    %v5 = load i32, ptr %a5
    %v6 = load i32, ptr %a6
    %v7 = load i32, ptr %a7

    ; This is a reduction tree pattern, that SLP should recognize
    %sum1 = add i32 %v0, %v1
    %sum2 = add i32 %v2, %v3
    %sum3 = add i32 %v4, %v5
    %sum4 = add i32 %v6, %v7

    %sum12 = add i32 %sum1, %sum2
    %sum34 = add i32 %sum3, %sum4

    %sum1234 = add i32 %sum12, %sum34

    ret i32 %sum1234
}
