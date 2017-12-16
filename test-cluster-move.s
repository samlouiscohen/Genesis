	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_update                 ## -- Begin function update
	.p2align	4, 0x90
_update:                                ## @update
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbx
Lcfi0:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
Lcfi1:
	.cfi_def_cfa_offset 32
Lcfi2:
	.cfi_offset %rbx, -16
	movl	%edi, 12(%rsp)
	movl	_cl(%rip), %ebx
	movl	%ebx, %edi
	callq	_getX
                                        ## kill: %EAX<def> %EAX<kill> %RAX<def>
	leal	50(%rax), %esi
	movl	%ebx, %edi
	callq	_setX
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	subq	$72, %rsp
Lcfi3:
	.cfi_def_cfa_offset 80
	movq	$0, 24(%rsp)
	movl	$255, 32(%rsp)
	leaq	24(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rax, (%rsp)
	movl	$50, %edi
	movl	$50, %esi
	movl	$100, %edx
	movl	$100, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	_newCluster
	movl	%eax, _cl(%rip)
	movabsq	$1095216660480, %rax    ## imm = 0xFF00000000
	movq	%rax, 8(%rsp)
	movl	$0, 16(%rsp)
	leaq	8(%rsp), %rdi
	movq	%rdi, 40(%rsp)
	movq	%rdi, 56(%rsp)
	movl	$640, %esi              ## imm = 0x280
	movl	$480, %edx              ## imm = 0x1E0
	callq	_startGame
	leaq	L_fmt.3(%rip), %rdi
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
	.globl	_cl                     ## @cl
.zerofill __DATA,__common,_cl,4,2
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
