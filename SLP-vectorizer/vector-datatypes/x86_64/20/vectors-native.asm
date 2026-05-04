	.file	"vectors.ll"
	.text
	.globl	vectors                         # -- Begin function vectors
	.p2align	4
	.type	vectors,@function
vectors:                                # @vectors
	.cfi_startproc
# %bb.0:
	vmovdqa	(%rdi), %xmm1
	vmovdqa	16(%rdi), %xmm0
	vmovdqa	(%rsi), %xmm3
	vmovdqa	16(%rsi), %xmm2
	vpaddd	%xmm3, %xmm1, %xmm1
	vpaddd	%xmm2, %xmm0, %xmm0
	vmovdqa	%xmm1, (%rdx)
	vmovdqa	%xmm0, 16(%rdx)
	movl	$9, %eax
	retq
.Lfunc_end0:
	.size	vectors, .Lfunc_end0-vectors
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
