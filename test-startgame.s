	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	subq	$40, %rsp
Lcfi0:
	.cfi_def_cfa_offset 48
	movq	$0, 8(%rsp)
	movl	$0, 16(%rsp)
	leaq	8(%rsp), %rdi
	movq	%rdi, 24(%rsp)
	movq	%rdi, 32(%rsp)
	movl	$640, %esi              ## imm = 0x280
	movl	$480, %edx              ## imm = 0x1E0
	callq	_startGame
	xorl	%eax, %eax
	addq	$40, %rsp
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
