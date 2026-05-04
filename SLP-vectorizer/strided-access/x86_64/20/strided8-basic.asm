	.file	"strided8.ll"
	.text
	.globl	strided                         # -- Begin function strided
	.p2align	4
	.type	strided,@function
strided:                                # @strided
	.cfi_startproc
# %bb.0:
	movups	(%rdi), %xmm1
	movups	16(%rdi), %xmm2
	movaps	%xmm1, %xmm0
	shufps	$136, %xmm2, %xmm0              # xmm0 = xmm0[0,2],xmm2[0,2]
	shufps	$221, %xmm2, %xmm1              # xmm1 = xmm1[1,3],xmm2[1,3]
	paddd	%xmm1, %xmm0
	movups	%xmm0, (%rsi)
	movups	32(%rdi), %xmm1
	movups	48(%rdi), %xmm2
	movaps	%xmm1, %xmm0
	shufps	$136, %xmm2, %xmm0              # xmm0 = xmm0[0,2],xmm2[0,2]
	shufps	$221, %xmm2, %xmm1              # xmm1 = xmm1[1,3],xmm2[1,3]
	paddd	%xmm1, %xmm0
	movdqu	%xmm0, 16(%rsi)
	retq
.Lfunc_end0:
	.size	strided, .Lfunc_end0-strided
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
