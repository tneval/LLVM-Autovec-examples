	.text
	.file	"vectors.ll"
	.globl	vectors                         # -- Begin function vectors
	.p2align	4, 0x90
	.type	vectors,@function
vectors:                                # @vectors
	.cfi_startproc
# %bb.0:
	vmovdqu	(%rdi), %ymm0
	vpaddd	(%rsi), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx)
	vzeroupper
	retq
.Lfunc_end0:
	.size	vectors, .Lfunc_end0-vectors
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
