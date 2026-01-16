	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 2
	.globl	_updateRoll                     ; -- Begin function updateRoll
	.p2align	2
_updateRoll:                            ; @updateRoll
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	wzr, [x29, #-12]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-12]
	ldur	w9, [x29, #-8]
	subs	w8, w8, w9
	b.ge	LBB0_6
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	bl	_rand
	mov	w9, #6                          ; =0x6
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #1
	str	w8, [sp, #16]
	ldr	w9, [sp, #16]
	ldur	w8, [x29, #-4]
	add	w8, w8, w9
	stur	w8, [x29, #-4]
	ldur	s1, [x29, #-4]
                                        ; implicit-def: $d0
	fmov	s0, s1
	sshll.2d	v0, v0, #0
                                        ; kill: def $d0 killed $d0 killed $q0
	scvtf	d0, d0
	fsqrt	d0, d0
	fcvtzs	w8, d0
	str	w8, [sp, #12]
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #12]
	mul	w8, w8, w9
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	b.ne	LBB0_4
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	stur	wzr, [x29, #-4]
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-12]
	add	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB0_1
LBB0_6:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #224
	stp	x29, x30, [sp, #208]            ; 16-byte Folded Spill
	add	x29, sp, #208
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	stur	wzr, [x29, #-64]
	stur	w0, [x29, #-68]
	stur	x1, [x29, #-80]
	mov	x0, #0                          ; =0x0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	ldur	x8, [x29, #-80]
	ldr	x0, [x8, #8]
	bl	_atoi
	stur	w0, [x29, #-84]
	ldur	x8, [x29, #-80]
	ldr	x0, [x8, #16]
	bl	_atoi
	stur	w0, [x29, #-88]
	ldur	w8, [x29, #-88]
	ldur	w9, [x29, #-84]
	sdiv	w8, w8, w9
	stur	w8, [x29, #-92]
	ldursw	x8, [x29, #-92]
	lsl	x0, x8, #2
	bl	_malloc
	str	x0, [sp, #104]
	ldursw	x8, [x29, #-92]
	lsl	x0, x8, #2
	bl	_malloc
	str	x0, [sp, #96]
	str	wzr, [sp, #92]
	str	wzr, [sp, #88]
	str	wzr, [sp, #84]
	str	wzr, [sp, #80]
	bl	_clock
	str	x0, [sp, #72]
	str	wzr, [sp, #68]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #68]
	ldur	w9, [x29, #-88]
	subs	w8, w8, w9
	b.ge	LBB1_6
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #68]
	ldr	x9, [sp, #104]
	ldrsw	x10, [sp, #92]
	str	w8, [x9, x10, lsl #2]
	ldr	w0, [sp, #88]
	ldur	w1, [x29, #-84]
	bl	_updateRoll
	str	w0, [sp, #88]
	ldr	w8, [sp, #88]
	ldr	x9, [sp, #96]
	ldrsw	x10, [sp, #92]
	str	w8, [x9, x10, lsl #2]
	ldr	x8, [sp, #96]
	ldrsw	x9, [sp, #92]
	ldr	w9, [x8, x9, lsl #2]
	ldr	w8, [sp, #84]
	add	w8, w8, w9
	str	w8, [sp, #84]
	ldr	w8, [sp, #88]
	ldr	w9, [sp, #80]
	subs	w8, w8, w9
	b.lt	LBB1_4
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #88]
	str	w8, [sp, #80]
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #92]
	add	w8, w8, #1
	str	w8, [sp, #92]
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w9, [x29, #-84]
	ldr	w8, [sp, #68]
	add	w8, w8, w9
	str	w8, [sp, #68]
	b	LBB1_1
LBB1_6:
	bl	_clock
	str	x0, [sp, #56]
	ldur	w8, [x29, #-68]
	subs	w8, w8, #3
	b.le	LBB1_13
	b	LBB1_7
LBB1_7:
	ldur	x8, [x29, #-80]
	ldr	x0, [x8, #24]
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	bl	_strcmp
	cbnz	w0, LBB1_13
	b	LBB1_8
LBB1_8:
	str	wzr, [sp, #52]
	b	LBB1_9
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #52]
	ldur	w9, [x29, #-92]
	subs	w8, w8, w9
	b.ge	LBB1_12
	b	LBB1_10
LBB1_10:                                ;   in Loop: Header=BB1_9 Depth=1
	ldr	x8, [sp, #104]
	ldrsw	x9, [sp, #52]
	ldr	w8, [x8, x9, lsl #2]
	mov	x10, x8
	ldr	x8, [sp, #96]
	ldrsw	x9, [sp, #52]
	ldr	w8, [x8, x9, lsl #2]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_9 Depth=1
	ldr	w8, [sp, #52]
	add	w8, w8, #1
	str	w8, [sp, #52]
	b	LBB1_9
LBB1_12:
	b	LBB1_13
LBB1_13:
	ldr	w8, [sp, #84]
	ldur	w9, [x29, #-92]
	sdiv	w8, w8, w9
	scvtf	s0, w8
	str	s0, [sp, #48]
	ldr	s0, [sp, #48]
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldr	w8, [sp, #80]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #56]
	ldr	x9, [sp, #72]
	subs	x8, x8, x9
	ucvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-80]
	ldr	x10, [x8, #8]
	ldur	x8, [x29, #-80]
	ldr	x8, [x8, #16]
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	sub	x0, x29, #58
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	mov	w1, #0                          ; =0x0
	mov	x2, #50                         ; =0x32
	adrp	x3, l_.str.5@PAGE
	add	x3, x3, l_.str.5@PAGEOFF
	bl	___sprintf_chk
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	adrp	x1, l_.str.6@PAGE
	add	x1, x1, l_.str.6@PAGEOFF
	bl	_fopen
	str	x0, [sp, #40]
	ldr	x0, [sp, #40]
	adrp	x1, l_.str.7@PAGE
	add	x1, x1, l_.str.7@PAGEOFF
	bl	_fprintf
	str	wzr, [sp, #36]
	b	LBB1_14
LBB1_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #36]
	ldur	w9, [x29, #-92]
	subs	w8, w8, w9
	b.ge	LBB1_17
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_14 Depth=1
	ldr	x0, [sp, #40]
	ldr	x8, [sp, #104]
	ldrsw	x9, [sp, #36]
	ldr	w8, [x8, x9, lsl #2]
	mov	x10, x8
	ldr	x8, [sp, #96]
	ldrsw	x9, [sp, #36]
	ldr	w8, [x8, x9, lsl #2]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	bl	_fprintf
	b	LBB1_16
LBB1_16:                                ;   in Loop: Header=BB1_14 Depth=1
	ldr	w8, [sp, #36]
	add	w8, w8, #1
	str	w8, [sp, #36]
	b	LBB1_14
LBB1_17:
	ldr	x0, [sp, #40]
	bl	_fclose
	ldr	x0, [sp, #104]
	bl	_free
	ldr	x0, [sp, #96]
	bl	_free
	ldur	w8, [x29, #-64]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	b.eq	LBB1_19
	b	LBB1_18
LBB1_18:
	bl	___stack_chk_fail
LBB1_19:
	ldr	w0, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #208]            ; 16-byte Folded Reload
	add	sp, sp, #224
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"-p"

l_.str.1:                               ; @.str.1
	.asciz	"Rolls: %d, Payoff: %d \n"

l_.str.2:                               ; @.str.2
	.asciz	"Average payoff: %f \n"

l_.str.3:                               ; @.str.3
	.asciz	"Maximum payoff: %d \n"

l_.str.4:                               ; @.str.4
	.asciz	"Elapsed: %f seconds\n"

l_.str.5:                               ; @.str.5
	.asciz	"%s_%s.csv"

l_.str.6:                               ; @.str.6
	.asciz	"w"

l_.str.7:                               ; @.str.7
	.asciz	"Rolls,Payoff\n"

l_.str.8:                               ; @.str.8
	.asciz	"%d,%d\n"

.subsections_via_symbols
