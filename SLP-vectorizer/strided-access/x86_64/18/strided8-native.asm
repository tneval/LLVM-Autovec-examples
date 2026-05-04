	.text
	.file	"strided8.ll"
	.globl	strided                         # -- Begin function strided
	.p2align	4, 0x90
	.type	strided,@function
strided:                                # @strided
	.cfi_startproc
# %bb.0:
	movl	12(%rdi), %r8d
	movl	28(%rdi), %edx
	movl	44(%rdi), %ecx
	movl	60(%rdi), %eax
	vmovq	4(%rdi), %xmm0                  # xmm0 = mem[0],zero
	vmovd	(%rdi), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	vpinsrd	$1, %r8d, %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	16(%rdi), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovd	32(%rdi), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vmovd	48(%rdi), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	vmovq	%xmm0, (%rsi)
	vmovq	20(%rdi), %xmm0                 # xmm0 = mem[0],zero
	vpinsrd	$1, %edx, %xmm3, %xmm3
	vpaddd	%xmm3, %xmm0, %xmm0
	vmovq	%xmm0, 8(%rsi)
	vmovq	36(%rdi), %xmm0                 # xmm0 = mem[0],zero
	vpinsrd	$1, %ecx, %xmm2, %xmm2
	vpaddd	%xmm2, %xmm0, %xmm0
	vmovq	%xmm0, 16(%rsi)
	vmovq	52(%rdi), %xmm0                 # xmm0 = mem[0],zero
	vpinsrd	$1, %eax, %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, 24(%rsi)
	retq
.Lfunc_end0:
	.size	strided, .Lfunc_end0-strided
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
