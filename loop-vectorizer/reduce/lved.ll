; ModuleID = 'rotated.ll'
source_filename = "reduce.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @reduce(ptr %in, i32 %n) #0 {
entry:
  %cmp1 = icmp ugt i32 %n, 0
  br i1 %cmp1, label %iter.check, label %exit

iter.check:                                       ; preds = %entry
  %min.iters.check = icmp ult i32 %n, 8
  br i1 %min.iters.check, label %vec.epilog.scalar.ph, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %iter.check
  %0 = add i32 %n, -1
  %mul = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 1, i32 %0)
  %mul.result = extractvalue { i32, i1 } %mul, 0
  %mul.overflow = extractvalue { i32, i1 } %mul, 1
  %1 = sub i32 %n, %mul.result
  %2 = icmp sgt i32 %1, %n
  %3 = or i1 %2, %mul.overflow
  br i1 %3, label %vec.epilog.scalar.ph, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.scevcheck
  %min.iters.check1 = icmp ult i32 %n, 32
  br i1 %min.iters.check1, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.mod.vf = urem i32 %n, 32
  %n.vec = sub i32 %n, %n.mod.vf
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %15, %vector.body ]
  %vec.phi2 = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %16, %vector.body ]
  %vec.phi3 = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %17, %vector.body ]
  %vec.phi4 = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %18, %vector.body ]
  %4 = sub i32 %n, %index
  %5 = add i32 %4, 0
  %6 = getelementptr i32, ptr %in, i32 %5
  %7 = getelementptr i32, ptr %6, i32 0
  %8 = getelementptr i32, ptr %7, i32 -7
  %9 = getelementptr i32, ptr %6, i32 -8
  %10 = getelementptr i32, ptr %9, i32 -7
  %11 = getelementptr i32, ptr %6, i32 -16
  %12 = getelementptr i32, ptr %11, i32 -7
  %13 = getelementptr i32, ptr %6, i32 -24
  %14 = getelementptr i32, ptr %13, i32 -7
  %wide.load = load <8 x i32>, ptr %8, align 4
  %reverse = shufflevector <8 x i32> %wide.load, <8 x i32> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %wide.load5 = load <8 x i32>, ptr %10, align 4
  %reverse6 = shufflevector <8 x i32> %wide.load5, <8 x i32> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %wide.load7 = load <8 x i32>, ptr %12, align 4
  %reverse8 = shufflevector <8 x i32> %wide.load7, <8 x i32> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %wide.load9 = load <8 x i32>, ptr %14, align 4
  %reverse10 = shufflevector <8 x i32> %wide.load9, <8 x i32> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %15 = add <8 x i32> %vec.phi, %reverse
  %16 = add <8 x i32> %vec.phi2, %reverse6
  %17 = add <8 x i32> %vec.phi3, %reverse8
  %18 = add <8 x i32> %vec.phi4, %reverse10
  %index.next = add nuw i32 %index, 32
  %19 = icmp eq i32 %index.next, %n.vec
  br i1 %19, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <8 x i32> %16, %15
  %bin.rdx11 = add <8 x i32> %17, %bin.rdx
  %bin.rdx12 = add <8 x i32> %18, %bin.rdx11
  %20 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %bin.rdx12)
  %cmp.n = icmp eq i32 %n, %n.vec
  br i1 %cmp.n, label %loop_cond.exit_crit_edge, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %ind.end = sub i32 %n, %n.vec
  %n.vec.remaining = sub i32 %n, %n.vec
  %min.epilog.iters.check = icmp ult i32 %n.vec.remaining, 8
  br i1 %min.epilog.iters.check, label %vec.epilog.scalar.ph, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vec.epilog.iter.check, %vector.main.loop.iter.check
  %vec.epilog.resume.val = phi i32 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %bc.merge.rdx = phi i32 [ %20, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.mod.vf13 = urem i32 %n, 8
  %n.vec14 = sub i32 %n, %n.mod.vf13
  %21 = sub i32 %n, %n.vec14
  %22 = insertelement <8 x i32> zeroinitializer, i32 %bc.merge.rdx, i32 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index15 = phi i32 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next19, %vec.epilog.vector.body ]
  %vec.phi16 = phi <8 x i32> [ %22, %vec.epilog.ph ], [ %27, %vec.epilog.vector.body ]
  %offset.idx = sub i32 %n, %index15
  %23 = add i32 %offset.idx, 0
  %24 = getelementptr i32, ptr %in, i32 %23
  %25 = getelementptr i32, ptr %24, i32 0
  %26 = getelementptr i32, ptr %25, i32 -7
  %wide.load17 = load <8 x i32>, ptr %26, align 4
  %reverse18 = shufflevector <8 x i32> %wide.load17, <8 x i32> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %27 = add <8 x i32> %vec.phi16, %reverse18
  %index.next19 = add nuw i32 %index15, 8
  %28 = icmp eq i32 %index.next19, %n.vec14
  br i1 %28, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !3

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %29 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %27)
  %cmp.n20 = icmp eq i32 %n, %n.vec14
  br i1 %cmp.n20, label %loop_cond.exit_crit_edge, label %vec.epilog.scalar.ph

vec.epilog.scalar.ph:                             ; preds = %vec.epilog.iter.check, %vec.epilog.middle.block, %vector.scevcheck, %iter.check
  %bc.merge.rdx21 = phi i32 [ %29, %vec.epilog.middle.block ], [ 0, %vector.scevcheck ], [ 0, %iter.check ], [ %20, %vec.epilog.iter.check ]
  %bc.resume.val = phi i32 [ %21, %vec.epilog.middle.block ], [ %n, %vector.scevcheck ], [ %n, %iter.check ], [ %ind.end, %vec.epilog.iter.check ]
  br label %loop_body

loop_body:                                        ; preds = %vec.epilog.scalar.ph, %loop_body
  %sum.03 = phi i32 [ %bc.merge.rdx21, %vec.epilog.scalar.ph ], [ %added, %loop_body ]
  %i.02 = phi i32 [ %bc.resume.val, %vec.epilog.scalar.ph ], [ %i_inc, %loop_body ]
  %next_ptr = getelementptr i32, ptr %in, i32 %i.02
  %next_val = load i32, ptr %next_ptr, align 4
  %added = add i32 %sum.03, %next_val
  %i_inc = sub i32 %i.02, 1
  %cmp = icmp ugt i32 %i_inc, 0
  br i1 %cmp, label %loop_body, label %loop_cond.exit_crit_edge, !llvm.loop !4

loop_cond.exit_crit_edge:                         ; preds = %vec.epilog.middle.block, %middle.block, %loop_body
  %split = phi i32 [ %added, %loop_body ], [ %20, %middle.block ], [ %29, %vec.epilog.middle.block ]
  br label %exit

exit:                                             ; preds = %loop_cond.exit_crit_edge, %entry
  %sum.0.lcssa = phi i32 [ %split, %loop_cond.exit_crit_edge ], [ 0, %entry ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #1

attributes #0 = { "target-cpu"="znver1" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,-invpcid,+64bit,+xsavec,-avx10.1-512,-avx512vpopcntdq,+cmov,-avx512vp2intersect,-avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-avx10.1-256,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,-vpclmulqdq,-avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,-avx10.2-256,-gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,-avx512f,-amx-bf16,-avx512bf16,-avx512vnni,-push2pop2,+cx8,-avx512bw,+sse3,-pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,-wbnoinvd,-enqcmd,-amx-transpose,-avx10.2-512,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,+bmi2,+fma,+popcnt,-avxifma,+f16c,-avx512bitalg,-rdpru,-clwb,+mmx,+sse2,+rdseed,-avx512vbmi2,-prefetchi,-amx-movrs,-rdpid,-fma4,-avx512vbmi,-shstk,-vaes,-waitpkg,-sgx,+fxsr,-avx512dq,+sse4a" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.isvectorized", i32 1}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = distinct !{!3, !1, !2}
!4 = distinct !{!4, !1}
