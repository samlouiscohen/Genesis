	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	subq	$72, %rsp
Lcfi0:
	.cfi_def_cfa_offset 80
	movabsq	$1095216660480, %rax    ## imm = 0xFF00000000
	movq	%rax, 24(%rsp)
	movl	$0, 32(%rsp)
	leaq	24(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	%rax, 40(%rsp)
	movq	%rax, (%rsp)
	movl	$50, %edi
	movl	$50, %esi
	movl	$100, %edx
	movl	$100, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	_newCluster
	movl	%eax, 52(%rsp)
	movl	$100, %esi
	movl	%eax, %edi
	callq	_setX
	movq	$0, 8(%rsp)
	movl	$0, 16(%rsp)
	leaq	8(%rsp), %rdi
	movq	%rdi, 56(%rsp)
	movq	%rdi, 40(%rsp)
	movl	$640, %esi              ## imm = 0x280
	movl	$480, %edx              ## imm = 0x1E0
	callq	_startGame
	leaq	L_fmt(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$72, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init                   ## -- Begin function init
	.p2align	4, 0x90
_init:                                  ## @init
	.cfi_startproc
## BB#0:                                ## %entry
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_update                 ## -- Begin function update
	.p2align	4, 0x90
_update:                                ## @update
	.cfi_startproc
## BB#0:                                ## %entry
	movl	%edi, -4(%rsp)
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_fmt:                                  ## @fmt
	.asciz	"%d\n"

L_fmt.1:                                ## @fmt.1
	.asciz	"%lf\n"

L_fmt.2:                                ## @fmt.2
	.asciz	"%s\n"

L_fmt.3:                                ## @fmt.3
	.asciz	"%d\n"

L_fmt.4:                                ## @fmt.4
	.asciz	"%lf\n"

L_fmt.5:                                ## @fmt.5
	.asciz	"%s\n"

L_fmt.6:                                ## @fmt.6
	.asciz	"%d\n"

L_fmt.7:                                ## @fmt.7
	.asciz	"%lf\n"

L_fmt.8:                                ## @fmt.8
	.asciz	"%s\n"


.subsections_via_symbols
