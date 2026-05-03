	.text
	.file	"strided4.ll"
	.globl	strided                         # -- Begin function strided
	.p2align	4, 0x90
	.type	strided,@function
strided:                                # @strided
	.cfi_startproc
# %bb.0:
	movq	%rdi, %r8
	movl	(%r8), %edi
	movl	8(%r8), %edx
	movl	16(%r8), %ecx
	movl	24(%r8), %eax
	movl	4(%r8), %r11d
	movl	12(%r8), %r10d
	movl	20(%r8), %r9d
	movl	28(%r8), %r8d
	addl	%r11d, %edi
	addl	%r10d, %edx
	addl	%r9d, %ecx
	addl	%r8d, %eax
	movl	%edi, (%rsi)
	movl	%edx, 4(%rsi)
	movl	%ecx, 8(%rsi)
	movl	%eax, 12(%rsi)
	retq
.Lfunc_end0:
	.size	strided, .Lfunc_end0-strided
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
