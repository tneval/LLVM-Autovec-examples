
; Assume why have %in = [a0, b0, a1, b1, a2, b2, ...]
; And we want to compute %out = a + b
define void @strided(ptr %in, ptr %out)
{
    ; Address calculations for %in
    %ap0 = getelementptr i32, ptr %in, i32 0
    %ap1 = getelementptr i32, ptr %in, i32 2
    %ap2 = getelementptr i32, ptr %in, i32 4
    %ap3 = getelementptr i32, ptr %in, i32 6
    %ap4 = getelementptr i32, ptr %in, i32 8
    %ap5 = getelementptr i32, ptr %in, i32 10
    %ap6 = getelementptr i32, ptr %in, i32 12
    %ap7 = getelementptr i32, ptr %in, i32 14

    %bp0 = getelementptr i32, ptr %in, i32 1
    %bp1 = getelementptr i32, ptr %in, i32 3
    %bp2 = getelementptr i32, ptr %in, i32 5
    %bp3 = getelementptr i32, ptr %in, i32 7
    %bp4 = getelementptr i32, ptr %in, i32 9
    %bp5 = getelementptr i32, ptr %in, i32 11
    %bp6 = getelementptr i32, ptr %in, i32 13
    %bp7 = getelementptr i32, ptr %in, i32 15


    ; Address calculations for %out
    %out0 = getelementptr i32, ptr %out, i32 0
    %out1 = getelementptr i32, ptr %out, i32 1
    %out2 = getelementptr i32, ptr %out, i32 2
    %out3 = getelementptr i32, ptr %out, i32 3
    %out4 = getelementptr i32, ptr %out, i32 4
    %out5 = getelementptr i32, ptr %out, i32 5
    %out6 = getelementptr i32, ptr %out, i32 6
    %out7 = getelementptr i32, ptr %out, i32 7


    %av0 = load i32, ptr %ap0
    %av1 = load i32, ptr %ap1
    %av2 = load i32, ptr %ap2
    %av3 = load i32, ptr %ap3
    %av4 = load i32, ptr %ap4
    %av5 = load i32, ptr %ap5
    %av6 = load i32, ptr %ap6
    %av7 = load i32, ptr %ap7

    %bv0 = load i32, ptr %bp0
    %bv1 = load i32, ptr %bp1
    %bv2 = load i32, ptr %bp2
    %bv3 = load i32, ptr %bp3
    %bv4 = load i32, ptr %bp4
    %bv5 = load i32, ptr %bp5
    %bv6 = load i32, ptr %bp6
    %bv7 = load i32, ptr %bp7

    ; Sum of a+b
    %ab0 = add i32 %av0, %bv0
    %ab1 = add i32 %av1, %bv1
    %ab2 = add i32 %av2, %bv2
    %ab3 = add i32 %av3, %bv3
    %ab4 = add i32 %av4, %bv4
    %ab5 = add i32 %av5, %bv5
    %ab6 = add i32 %av6, %bv6
    %ab7 = add i32 %av7, %bv7

    store i32 %ab0, ptr %out0
    store i32 %ab1, ptr %out1
    store i32 %ab2, ptr %out2
    store i32 %ab3, ptr %out3
    store i32 %ab4, ptr %out4
    store i32 %ab5, ptr %out5
    store i32 %ab6, ptr %out6
    store i32 %ab7, ptr %out7

    ret void
}
