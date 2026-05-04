; ModuleID = 'rotated.ll'
source_filename = "reduce.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @reduce(ptr %in, i32 %n) !dbg !3 {
entry:
  %in1 = alloca ptr, align 8
  store ptr %in, ptr %in1, align 8
  call void @llvm.dbg.declare(metadata ptr %in1, metadata !9, metadata !DIExpression()), !dbg !11
  %n2 = alloca i32, align 4
  store i32 %n, ptr %n2, align 4
  call void @llvm.dbg.declare(metadata ptr %n2, metadata !10, metadata !DIExpression()), !dbg !11
  br label %loop_cond, !dbg !12

loop_cond:                                        ; preds = %loop_body, %entry
  %i.0 = phi i32 [ %n, %entry ], [ %i_inc, %loop_body ], !dbg !14
  %sum.0 = phi i32 [ 0, %entry ], [ %added, %loop_body ], !dbg !15
  tail call void @llvm.dbg.value(metadata i32 %sum.0, metadata !16, metadata !DIExpression()), !dbg !15
  tail call void @llvm.dbg.value(metadata i32 %i.0, metadata !17, metadata !DIExpression()), !dbg !14
  %cmp = icmp ugt i32 %i.0, 0, !dbg !18
  tail call void @llvm.dbg.value(metadata i1 %cmp, metadata !20, metadata !DIExpression()), !dbg !18
  br i1 %cmp, label %loop_body, label %exit, !dbg !22

loop_body:                                        ; preds = %loop_cond
  %next_ptr = getelementptr i32, ptr %in, i32 %i.0, !dbg !23
  tail call void @llvm.dbg.value(metadata ptr %next_ptr, metadata !25, metadata !DIExpression()), !dbg !23
  %next_val = load i32, ptr %next_ptr, align 4, !dbg !26
  tail call void @llvm.dbg.value(metadata i32 %next_val, metadata !27, metadata !DIExpression()), !dbg !26
  %added = add i32 %sum.0, %next_val, !dbg !28
  tail call void @llvm.dbg.value(metadata i32 %added, metadata !29, metadata !DIExpression()), !dbg !28
  %i_inc = sub i32 %i.0, 1, !dbg !30
  tail call void @llvm.dbg.value(metadata i32 %i_inc, metadata !31, metadata !DIExpression()), !dbg !30
  br label %loop_cond, !dbg !32

exit:                                             ; preds = %loop_cond
  ret i32 %sum.0, !dbg !33
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "LLVM Version 18.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "rotated.ll", directory: "")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "reduce", linkageName: "reduce", scope: !1, file: !1, line: 6, type: !4, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !6}
!6 = !DIBasicType(name: "i32", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "ptr", baseType: null, size: 64, align: 64)
!8 = !{!9, !10}
!9 = !DILocalVariable(name: "in", arg: 1, scope: !3, file: !1, line: 6, type: !7)
!10 = !DILocalVariable(name: "n", arg: 2, scope: !3, file: !1, line: 6, type: !6)
!11 = !DILocation(line: 6, scope: !3)
!12 = !DILocation(line: 8, scope: !13)
!13 = distinct !DILexicalBlock(scope: !3, file: !1, line: 8)
!14 = !DILocation(line: 11, scope: !3)
!15 = !DILocation(line: 12, scope: !3)
!16 = !DILocalVariable(name: "sum.0", scope: !3, file: !1, line: 12, type: !6)
!17 = !DILocalVariable(name: "i.0", scope: !3, file: !1, line: 11, type: !6)
!18 = !DILocation(line: 13, scope: !19)
!19 = distinct !DILexicalBlock(scope: !3, file: !1, line: 11)
!20 = !DILocalVariable(name: "cmp", scope: !19, file: !1, line: 13, type: !21)
!21 = !DIBasicType(name: "i1", size: 1, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 14, scope: !19)
!23 = !DILocation(line: 17, scope: !24)
!24 = distinct !DILexicalBlock(scope: !3, file: !1, line: 17)
!25 = !DILocalVariable(name: "next_ptr", scope: !24, file: !1, line: 17, type: !7)
!26 = !DILocation(line: 18, scope: !24)
!27 = !DILocalVariable(name: "next_val", scope: !24, file: !1, line: 18, type: !6)
!28 = !DILocation(line: 19, scope: !24)
!29 = !DILocalVariable(name: "added", scope: !24, file: !1, line: 19, type: !6)
!30 = !DILocation(line: 20, scope: !24)
!31 = !DILocalVariable(name: "i_inc", scope: !24, file: !1, line: 20, type: !6)
!32 = !DILocation(line: 21, scope: !24)
!33 = !DILocation(line: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !3, file: !1, line: 24)
