; ModuleID = 'strided8-with-dl.ll'
source_filename = "strided8.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define void @strided(ptr %in, ptr %out) #0 {
  %ap0 = getelementptr i32, ptr %in, i32 0
  %ap2 = getelementptr i32, ptr %in, i32 4
  %ap4 = getelementptr i32, ptr %in, i32 8
  %ap6 = getelementptr i32, ptr %in, i32 12
  %bp0 = getelementptr i32, ptr %in, i32 1
  %bp1 = getelementptr i32, ptr %in, i32 3
  %bp2 = getelementptr i32, ptr %in, i32 5
  %bp3 = getelementptr i32, ptr %in, i32 7
  %bp4 = getelementptr i32, ptr %in, i32 9
  %bp5 = getelementptr i32, ptr %in, i32 11
  %bp6 = getelementptr i32, ptr %in, i32 13
  %bp7 = getelementptr i32, ptr %in, i32 15
  %out0 = getelementptr i32, ptr %out, i32 0
  %out2 = getelementptr i32, ptr %out, i32 2
  %out4 = getelementptr i32, ptr %out, i32 4
  %out6 = getelementptr i32, ptr %out, i32 6
  %av0 = load i32, ptr %ap0, align 4
  %av2 = load i32, ptr %ap2, align 4
  %av4 = load i32, ptr %ap4, align 4
  %av6 = load i32, ptr %ap6, align 4
  %bv1 = load i32, ptr %bp1, align 4
  %bv3 = load i32, ptr %bp3, align 4
  %bv5 = load i32, ptr %bp5, align 4
  %bv7 = load i32, ptr %bp7, align 4
  %1 = load <2 x i32>, ptr %bp0, align 4
  %2 = insertelement <2 x i32> poison, i32 %av0, i32 0
  %3 = insertelement <2 x i32> %2, i32 %bv1, i32 1
  %4 = add <2 x i32> %1, %3
  %5 = load <2 x i32>, ptr %bp2, align 4
  %6 = insertelement <2 x i32> poison, i32 %av2, i32 0
  %7 = insertelement <2 x i32> %6, i32 %bv3, i32 1
  %8 = add <2 x i32> %5, %7
  %9 = load <2 x i32>, ptr %bp4, align 4
  %10 = insertelement <2 x i32> poison, i32 %av4, i32 0
  %11 = insertelement <2 x i32> %10, i32 %bv5, i32 1
  %12 = add <2 x i32> %9, %11
  %13 = load <2 x i32>, ptr %bp6, align 4
  %14 = insertelement <2 x i32> poison, i32 %av6, i32 0
  %15 = insertelement <2 x i32> %14, i32 %bv7, i32 1
  %16 = add <2 x i32> %13, %15
  store <2 x i32> %4, ptr %out0, align 4
  store <2 x i32> %8, ptr %out2, align 4
  store <2 x i32> %12, ptr %out4, align 4
  store <2 x i32> %16, ptr %out6, align 4
  ret void
}

attributes #0 = { "target-cpu"="znver3" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,+xsaves,-avx512fp16,-usermsr,-sm4,+sse4.1,-avx512ifma,+xsave,-avx512pf,+sse4.2,-tsxldtrk,-ptwrite,-widekl,-sm3,+invpcid,+64bit,+xsavec,-avx10.1-512,-avx512vpopcntdq,+cmov,-avx512vp2intersect,-avx512cd,+movbe,-avxvnniint8,-avx512er,-amx-int8,-kl,-avx10.1-256,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,-avx512vl,-uintr,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,-gfni,-avxvnniint16,-amx-fp16,+xsaveopt,+rdrnd,-avx512f,-amx-bf16,-avx512bf16,-avx512vnni,+cx8,-avx512bw,+sse3,-pku,+fsgsbase,+clzero,-mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-wbnoinvd,-enqcmd,-prefetchwt1,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,+bmi2,+fma,+popcnt,-avxifma,+f16c,-avx512bitalg,-rdpru,+clwb,+mmx,+sse2,+rdseed,-avx512vbmi2,-prefetchi,+rdpid,-fma4,-avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,-avx512dq,+sse4a" }
