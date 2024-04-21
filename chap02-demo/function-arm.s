	.arch armv8-a
	.text
	.globl _nCompletionStatus
	.zerofill __DATA,__common,_nCompletionStatus,4,2
	.text
	.align	2
	.globl _add
_add:
LFB0:
	sub	sp, sp, #32
LCFI0:
	str	s0, [sp, 12]
	str	s1, [sp, 8]
	ldr	s1, [sp, 12]
	ldr	s0, [sp, 8]
	fadd	s0, s1, s0
	str	s0, [sp, 28]
	ldr	s0, [sp, 28]
	add	sp, sp, 32
LCFI1:
	ret
LFE0:
	.align	2
	.globl _add_and_multiply
_add_and_multiply:
LFB1:
	stp	x29, x30, [sp, -48]!
LCFI2:
	mov	x29, sp
	str	s0, [sp, 28]
	str	s1, [sp, 24]
	ldr	s1, [sp, 24]
	ldr	s0, [sp, 28]
	bl	_add
	str	s0, [sp, 44]
	ldr	s1, [sp, 44]
	fmov	s0, 3.0e+0
	fmul	s0, s1, s0
	str	s0, [sp, 44]
	ldr	s0, [sp, 44]
	ldp	x29, x30, [sp], 48
LCFI3:
	ret
LFE1:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.uleb128 0x1
	.sleb128 -8
	.byte	0x1e
	.uleb128 0x1
	.byte	0x10
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB0-.
	.set L$set$2,LFE0-LFB0
	.quad L$set$2
	.uleb128 0
	.byte	0x4
	.set L$set$3,LCFI0-LFB0
	.long L$set$3
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$5,LEFDE3-LASFDE3
	.long L$set$5
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB1-.
	.set L$set$6,LFE1-LFB1
	.quad L$set$6
	.uleb128 0
	.byte	0x4
	.set L$set$7,LCFI2-LFB1
	.long L$set$7
	.byte	0xe
	.uleb128 0x30
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0xde
	.byte	0xdd
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 13.2.0) 13.2.0"
	.subsections_via_symbols
