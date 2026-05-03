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
	vpaddd	%xmm1, %xmm0, %xmm3
	vmovq	20(%rdi), %xmm0                 # xmm0 = mem[0],zero
	vmovd	16(%rdi), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	vpinsrd	$1, %edx, %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm2
	vmovq	36(%rdi), %xmm0                 # xmm0 = mem[0],zero
	vmovd	32(%rdi), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	vpinsrd	$1, %ecx, %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm1
	vmovq	52(%rdi), %xmm0                 # xmm0 = mem[0],zero
	vmovd	48(%rdi), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	vpinsrd	$1, %eax, %xmm4, %xmm4
	vpaddd	%xmm4, %xmm0, %xmm0
	vmovq	%xmm3, (%rsi)
	vmovq	%xmm2, 8(%rsi)
	vmovq	%xmm1, 16(%rsi)
	vmovq	%xmm0, 24(%rsi)
	retq
.Lfunc_end0:
	.size	strided, .Lfunc_end0-strided
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
