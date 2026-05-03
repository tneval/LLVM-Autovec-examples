	.text
	.file	"strided.ll"
	.globl	strided                         # -- Begin function strided
	.p2align	4, 0x90
	.type	strided,@function
strided:                                # @strided
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movl	(%rbx), %r11d
	movl	8(%rbx), %r10d
	movl	16(%rbx), %r9d
	movl	24(%rbx), %r8d
	movl	32(%rbx), %edi
	movl	40(%rbx), %edx
	movl	48(%rbx), %ecx
	movl	56(%rbx), %eax
	movl	%eax, -4(%rsp)                  # 4-byte Spill
	movl	4(%rbx), %eax
	movl	12(%rbx), %ebp
	movl	%ebp, -8(%rsp)                  # 4-byte Spill
	movl	20(%rbx), %r13d
	movl	28(%rbx), %r12d
	movl	36(%rbx), %r15d
	movl	44(%rbx), %r14d
	movl	52(%rbx), %ebp
	movl	60(%rbx), %ebx
	addl	%eax, %r11d
	movl	-8(%rsp), %eax                  # 4-byte Reload
	addl	%eax, %r10d
	movl	-4(%rsp), %eax                  # 4-byte Reload
	addl	%r13d, %r9d
	addl	%r12d, %r8d
	addl	%r15d, %edi
	addl	%r14d, %edx
	addl	%ebp, %ecx
	addl	%ebx, %eax
	movl	%r11d, (%rsi)
	movl	%r10d, 4(%rsi)
	movl	%r9d, 8(%rsi)
	movl	%r8d, 12(%rsi)
	movl	%edi, 16(%rsi)
	movl	%edx, 20(%rsi)
	movl	%ecx, 24(%rsi)
	movl	%eax, 28(%rsi)
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	strided, .Lfunc_end0-strided
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
