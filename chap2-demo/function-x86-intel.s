	.file	"function.c"
	.intel_syntax noprefix
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
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	fld	DWORD PTR [ebp+8]
	fadd	DWORD PTR [ebp+12]
	fstp	DWORD PTR [ebp-4]
	fld	DWORD PTR [ebp-4]
	leave
	ret
	.size	add, .-add
	.globl	add_and_multiply
	.type	add_and_multiply, @function
add_and_multiply:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	call	add
	add	esp, 8
	fstp	DWORD PTR [ebp-4]
	fld	DWORD PTR [ebp-4]
	fld	DWORD PTR .LC1
	fmulp	st(1), st
	fstp	DWORD PTR [ebp-4]
	fld	DWORD PTR [ebp-4]
	leave
	ret
	.size	add_and_multiply, .-add_and_multiply
	.section	.rodata
	.align 4
.LC1:
	.long	1077936128
	.ident	"GCC: (GNU) 13.2.0"
