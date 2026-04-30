	.file	"las.ll"
	.text
	.globl	copy                            # -- Begin function copy
	.p2align	4
	.type	copy,@function
copy:                                   # @copy
	.cfi_startproc
# %bb.0:
	vmovdqu	(%rdi), %ymm0
	vpaddd	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rsi)
	vzeroupper
	retq
.Lfunc_end0:
	.size	copy, .Lfunc_end0-copy
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
