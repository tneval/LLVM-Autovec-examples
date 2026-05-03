	.text
	.file	"strided4.ll"
	.globl	strided                         # -- Begin function strided
	.p2align	4, 0x90
	.type	strided,@function
strided:                                # @strided
	.cfi_startproc
# %bb.0:
	movl	12(%rdi), %ecx
	movl	28(%rdi), %eax
	vmovq	4(%rdi), %xmm0                  # xmm0 = mem[0],zero
	vmovd	(%rdi), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	vpinsrd	$1, %ecx, %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm1
	vmovq	20(%rdi), %xmm0                 # xmm0 = mem[0],zero
	vmovd	16(%rdi), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vpinsrd	$1, %eax, %xmm2, %xmm2
	vpaddd	%xmm2, %xmm0, %xmm0
	vmovq	%xmm1, (%rsi)
	vmovq	%xmm0, 8(%rsi)
	retq
.Lfunc_end0:
	.size	strided, .Lfunc_end0-strided
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
