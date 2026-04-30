	.file	"reduce.ll"
	.text
	.globl	reduce                          # -- Begin function reduce
	.p2align	4
	.type	reduce,@function
reduce:                                 # @reduce
	.cfi_startproc
# %bb.0:
	movups	(%rdi), %xmm0
	movups	16(%rdi), %xmm1
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	retq
.Lfunc_end0:
	.size	reduce, .Lfunc_end0-reduce
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
