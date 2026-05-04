

define void @vectors(ptr %in_a, ptr %in_b, ptr %out)
{
    %a0 = getelementptr i32, ptr %in_a, i64 0
    %a1 = getelementptr i32, ptr %in_a, i64 4

    %b0 = getelementptr i32, ptr %in_b, i64 0
    %b1 = getelementptr i32, ptr %in_b, i64 4


    %av0 = load <4 x i32>, ptr %a0
    %av1 = load <4 x i32>, ptr %a1

    %bv0 = load <4 x i32>, ptr %b0
    %bv1 = load <4 x i32>, ptr %b1

    %res0 = add <4 x i32> %av0, %bv0
    %res1 = add <4 x i32> %av1, %bv1

    %out0 = getelementptr i32, ptr %out, i64 0
    %out1 = getelementptr i32, ptr %out, i64 4

    store <4 x i32> %res0, ptr %out0
    store <4 x i32> %res1, ptr %out1

    ret void
}