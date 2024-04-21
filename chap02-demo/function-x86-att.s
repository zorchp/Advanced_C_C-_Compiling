	.file	"function.c"
	.text
	.globl	nCompletionStatus
	.section	.bss
	.align 4
	.type	nCompletionStatus, @object
	.size	nCompletionStatus, 4
nCompletionStatus:
	.zero	4
	.text
	.globl	add
	.type	add, @function
add:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	flds	8(%ebp)
	fadds	12(%ebp)
	fstps	-4(%ebp)
	flds	-4(%ebp)
	leave
	ret
	.size	add, .-add
	.globl	add_and_multiply
	.type	add_and_multiply, @function
add_and_multiply:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	add
	addl	$8, %esp
	fstps	-4(%ebp)
	flds	-4(%ebp)
	flds	.LC1
	fmulp	%st, %st(1)
	fstps	-4(%ebp)
	flds	-4(%ebp)
	leave
	ret
	.size	add_and_multiply, .-add_and_multiply
	.section	.rodata
	.align 4
.LC1:
	.long	1077936128
	.ident	"GCC: (GNU) 13.2.0"
