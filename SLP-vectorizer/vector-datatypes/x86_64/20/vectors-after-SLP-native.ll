; ModuleID = 'vectors-with-dl.ll'
source_filename = "../../vectors.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @vectors(ptr %in_a, ptr %in_b, ptr %out) #0 {
  %a0 = getelementptr i32, ptr %in_a, i64 0
  %a1 = getelementptr i32, ptr %in_a, i64 4
  %b0 = getelementptr i32, ptr %in_b, i64 0
  %b1 = getelementptr i32, ptr %in_b, i64 4
  %av0 = load <4 x i32>, ptr %a0, align 16
  %av1 = load <4 x i32>, ptr %a1, align 16
  %bv0 = load <4 x i32>, ptr %b0, align 16
  %bv1 = load <4 x i32>, ptr %b1, align 16
  %res0 = add <4 x i32> %av0, %bv0
  %res1 = add <4 x i32> %av1, %bv1
  %out0 = getelementptr i32, ptr %out, i64 0
  %out1 = getelementptr i32, ptr %out, i64 4
  store <4 x i32> %res0, ptr %out0, align 16
  store <4 x i32> %res1, ptr %out1, align 16
  ret i32 9
}

attributes #0 = { "target-cpu"="znver1" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,-invpcid,+64bit,+xsavec,-avx10.1-512,-avx512vpopcntdq,+cmov,-avx512vp2intersect,-avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-avx10.1-256,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,-vpclmulqdq,-avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,-avx10.2-256,-gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,-avx512f,-amx-bf16,-avx512bf16,-avx512vnni,-push2pop2,+cx8,-avx512bw,+sse3,-pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,-wbnoinvd,-enqcmd,-amx-transpose,-avx10.2-512,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,+bmi2,+fma,+popcnt,-avxifma,+f16c,-avx512bitalg,-rdpru,-clwb,+mmx,+sse2,+rdseed,-avx512vbmi2,-prefetchi,-amx-movrs,-rdpid,-fma4,-avx512vbmi,-shstk,-vaes,-waitpkg,-sgx,+fxsr,-avx512dq,+sse4a" }
