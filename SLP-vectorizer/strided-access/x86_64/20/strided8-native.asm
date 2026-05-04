	.file	"strided8.ll"
	.text
	.globl	strided                         # -- Begin function strided
	.p2align	4
	.type	strided,@function
strided:                                # @strided
	.cfi_startproc
# %bb.0:
	vmovups	(%rdi), %ymm1
	vmovups	32(%rdi), %ymm2
	vshufps	$136, %ymm2, %ymm1, %ymm0       # ymm0 = ymm1[0,2],ymm2[0,2],ymm1[4,6],ymm2[4,6]
	vpermq	$216, %ymm0, %ymm0              # ymm0 = ymm0[0,2,1,3]
	vshufps	$221, %ymm2, %ymm1, %ymm1       # ymm1 = ymm1[1,3],ymm2[1,3],ymm1[5,7],ymm2[5,7]
	vpermq	$216, %ymm1, %ymm1              # ymm1 = ymm1[0,2,1,3]
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rsi)
	vzeroupper
	retq
.Lfunc_end0:
	.size	strided, .Lfunc_end0-strided
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
