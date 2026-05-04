	.file	"vectors.ll"
	.text
	.globl	vectors                         # -- Begin function vectors
	.p2align	4
	.type	vectors,@function
vectors:                                # @vectors
	.cfi_startproc
# %bb.0:
	movdqa	(%rdi), %xmm1
	movdqa	16(%rdi), %xmm0
	movdqa	(%rsi), %xmm3
	movdqa	16(%rsi), %xmm2
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	movdqa	%xmm1, (%rdx)
	movdqa	%xmm0, 16(%rdx)
	movl	$9, %eax
	retq
.Lfunc_end0:
	.size	vectors, .Lfunc_end0-vectors
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
