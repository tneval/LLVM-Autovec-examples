; ModuleID = 'strided4-with-dl.ll'
source_filename = "strided4.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define void @strided(ptr noalias align 32 %in, ptr noalias align 32 %out) #0 {
  %ap0 = getelementptr i32, ptr %in, i32 0
  %ap2 = getelementptr i32, ptr %in, i32 4
  %bp0 = getelementptr i32, ptr %in, i32 1
  %bp1 = getelementptr i32, ptr %in, i32 3
  %bp2 = getelementptr i32, ptr %in, i32 5
  %bp3 = getelementptr i32, ptr %in, i32 7
  %out0 = getelementptr i32, ptr %out, i32 0
  %out2 = getelementptr i32, ptr %out, i32 2
  %av0 = load i32, ptr %ap0, align 4
  %av2 = load i32, ptr %ap2, align 4
  %bv1 = load i32, ptr %bp1, align 4
  %bv3 = load i32, ptr %bp3, align 4
  %1 = load <2 x i32>, ptr %bp0, align 4
  %2 = insertelement <2 x i32> poison, i32 %av0, i32 0
  %3 = insertelement <2 x i32> %2, i32 %bv1, i32 1
  %4 = add <2 x i32> %1, %3
  store <2 x i32> %4, ptr %out0, align 4
  %5 = load <2 x i32>, ptr %bp2, align 4
  %6 = insertelement <2 x i32> poison, i32 %av2, i32 0
  %7 = insertelement <2 x i32> %6, i32 %bv3, i32 1
  %8 = add <2 x i32> %5, %7
  store <2 x i32> %8, ptr %out2, align 4
  ret void
}

attributes #0 = { "target-cpu"="znver3" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,+xsaves,-avx512fp16,-usermsr,-sm4,+sse4.1,-avx512ifma,+xsave,-avx512pf,+sse4.2,-tsxldtrk,-ptwrite,-widekl,-sm3,+invpcid,+64bit,+xsavec,-avx10.1-512,-avx512vpopcntdq,+cmov,-avx512vp2intersect,-avx512cd,+movbe,-avxvnniint8,-avx512er,-amx-int8,-kl,-avx10.1-256,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,-avx512vl,-uintr,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,-gfni,-avxvnniint16,-amx-fp16,+xsaveopt,+rdrnd,-avx512f,-amx-bf16,-avx512bf16,-avx512vnni,+cx8,-avx512bw,+sse3,-pku,+fsgsbase,+clzero,-mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-wbnoinvd,-enqcmd,-prefetchwt1,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,+bmi2,+fma,+popcnt,-avxifma,+f16c,-avx512bitalg,-rdpru,+clwb,+mmx,+sse2,+rdseed,-avx512vbmi2,-prefetchi,+rdpid,-fma4,-avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,-avx512dq,+sse4a" }
