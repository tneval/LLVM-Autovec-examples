
; Assume why have %in = [a0, b0, a1, b1, a2, b2, ...]
; And we want to compute %out = a + b
define void @strided(ptr noalias align 32 %in, ptr noalias align 32 %out)
{
    ; Address calculations for %in
    %ap0 = getelementptr i32, ptr %in, i32 0
    %ap1 = getelementptr i32, ptr %in, i32 2
    %ap2 = getelementptr i32, ptr %in, i32 4
    %ap3 = getelementptr i32, ptr %in, i32 6


    %bp0 = getelementptr i32, ptr %in, i32 1
    %bp1 = getelementptr i32, ptr %in, i32 3
    %bp2 = getelementptr i32, ptr %in, i32 5
    %bp3 = getelementptr i32, ptr %in, i32 7
   


    ; Address calculations for %out
    %out0 = getelementptr i32, ptr %out, i32 0
    %out1 = getelementptr i32, ptr %out, i32 1
    %out2 = getelementptr i32, ptr %out, i32 2
    %out3 = getelementptr i32, ptr %out, i32 3



    %av0 = load i32, ptr %ap0
    %av1 = load i32, ptr %ap1
    %av2 = load i32, ptr %ap2
    %av3 = load i32, ptr %ap3


    %bv0 = load i32, ptr %bp0
    %bv1 = load i32, ptr %bp1
    %bv2 = load i32, ptr %bp2
    %bv3 = load i32, ptr %bp3


    ; Sum of a+b
    %ab0 = add i32 %av0, %bv0
    %ab1 = add i32 %av1, %bv1
    %ab2 = add i32 %av2, %bv2
    %ab3 = add i32 %av3, %bv3


    store i32 %ab0, ptr %out0
    store i32 %ab1, ptr %out1
    store i32 %ab2, ptr %out2
    store i32 %ab3, ptr %out3


    ret void
}
