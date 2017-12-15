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
	pushq	%rax
Lcfi1:
	.cfi_def_cfa_offset 16
	leaq	L_tmp(%rip), %rdi
	callq	_isKeyDown
	testb	$1, %al
	je	LBB2_1
## BB#5:                                ## %then
	leaq	L_fmt.8(%rip), %rdi
	leaq	L_tmp.9(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
LBB2_1:                                 ## %merge
	leaq	L_tmp.10(%rip), %rdi
	callq	_isKeyHeld
	testb	$1, %al
	je	LBB2_2
## BB#6:                                ## %then2
	leaq	L_fmt.8(%rip), %rdi
	leaq	L_tmp.11(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
LBB2_2:                                 ## %merge1
	leaq	L_tmp.12(%rip), %rdi
	callq	_isKeyUp
	testb	$1, %al
	je	LBB2_4
## BB#3:                                ## %then6
	leaq	L_fmt.8(%rip), %rdi
	leaq	L_tmp.13(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
LBB2_4:                                 ## %merge5
	popq	%rax
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

L_tmp:                                  ## @tmp
	.asciz	"Space"

L_tmp.9:                                ## @tmp.9
	.asciz	"Space pressed"

L_tmp.10:                               ## @tmp.10
	.asciz	"Space"

L_tmp.11:                               ## @tmp.11
	.asciz	"Space held"

L_tmp.12:                               ## @tmp.12
	.asciz	"Space"

L_tmp.13:                               ## @tmp.13
	.asciz	"Space released"


.subsections_via_symbols
