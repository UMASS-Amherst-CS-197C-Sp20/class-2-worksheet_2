	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI0_0:
	.quad	4618760256179416344     ## double 6.2831853071795862
LCPI0_1:
	.quad	4666723172467343360     ## double 1.0E+4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movsd	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movl	$0, -4(%rbp)
	movsd	%xmm0, -16(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -28(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$10000, -28(%rbp)       ## imm = 0x2710
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movsd	LCPI0_1(%rip), %xmm0    ## xmm0 = mem[0],zero
	movl	-28(%rbp), %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm0, %xmm1
	mulsd	-16(%rbp), %xmm1
	movsd	%xmm1, -40(%rbp)
	movsd	-40(%rbp), %xmm0        ## xmm0 = mem[0],zero
	callq	_sin
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_1
LBB0_4:
	movsd	-24(%rbp), %xmm0        ## xmm0 = mem[0],zero
	leaq	L_.str(%rip), %rdi
	movb	$1, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"The integral of sin(x) from x=0 to x=2*pi is approximately %f\n"


.subsections_via_symbols
