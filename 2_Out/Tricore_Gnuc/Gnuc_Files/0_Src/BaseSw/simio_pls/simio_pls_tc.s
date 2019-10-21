	.file	"simio_pls_tc.c"
.section .text,"ax",@progbits
.Ltext0:
.section .text.simio_GetTHBufferSpace,"ax",@progbits
	.align 1
	.type	simio_GetTHBufferSpace, @function
simio_GetTHBufferSpace:
.LFB1:
	.file 1 "0_Src/BaseSw/simio_pls/simio_pls_tc.c"
	.loc 1 100 0
	.loc 1 105 0
	movh.a	%a15, hi:g_JtagSimioAccess
	lea	%a15, [%a15] lo:g_JtagSimioAccess
	ld.a	%a15, [%a15] 8
	ld.hu	%d3, [%a15]0
.LVL0:
	.loc 1 106 0
	ld.hu	%d15, [%a15] 2
.LVL1:
	.loc 1 114 0
	sub	%d2, %d3, %d15
	addi	%d2, %d2, 1023
	.loc 1 108 0
	jge.u	%d15, %d3, .L3
	.loc 1 110 0
	sub	%d15, %d3, %d15
.LVL2:
	add	%d2, %d15, -1
.LVL3:
.L3:
	.loc 1 117 0
	movh.a	%a15, hi:simio_NonBlockingMode
	ld.w	%d4, [%a15] lo:simio_NonBlockingMode
	.loc 1 119 0
	ne	%d15, %d4, 0
	and.eq	%d15, %d2, 0
	jz	%d15, .L4
	.loc 1 121 0
	add	%d3, 1
.LVL4:
	extr.u	%d3, %d3, 0, 16
.LVL5:
	.loc 1 123 0
	mov	%d2, 1024
.LVL6:
	lt.u	%d15, %d3, %d2
	cmovn	%d3, %d15, 0
.LVL7:
	.loc 1 125 0
	movh.a	%a15, hi:simio_THBuffer
	st.h	[%a15] lo:simio_THBuffer, %d3
.LVL8:
	.loc 1 126 0
	mov	%d2, 1
.LVL9:
.L4:
	.loc 1 131 0
	ret
.LFE1:
	.size	simio_GetTHBufferSpace, .-simio_GetTHBufferSpace
.section .text.simio_PutByteToHost,"ax",@progbits
	.align 1
	.type	simio_PutByteToHost, @function
simio_PutByteToHost:
.LFB4:
	.loc 1 177 0
.LVL10:
	.loc 1 180 0
	movh.a	%a15, hi:simio_NonBlockingMode
	ld.w	%d15, [%a15] lo:simio_NonBlockingMode
	.loc 1 177 0
	mov	%d8, %d4
	.loc 1 180 0
	jnz	%d15, .L24
.LVL11:
.L20:
	.loc 1 190 0 discriminator 1
	call	simio_GetTHBufferSpace
.LVL12:
	jz	%d2, .L20
.L15:
	.loc 1 193 0
	movh.a	%a15, hi:simio_THBuffer
	lea	%a15, [%a15] lo:simio_THBuffer
	ld.hu	%d2, [%a15] 2
.LVL13:
	.loc 1 197 0
	mov	%d3, 1024
	.loc 1 194 0
	add	%d15, %d2, 1
	extr.u	%d15, %d15, 0, 16
.LVL14:
	addsc.a	%a2, %a15, %d2, 0
	.loc 1 197 0
	lt.u	%d2, %d15, %d3
	.loc 1 194 0
	st.b	[%a2] 4, %d8
	.loc 1 197 0
	sel	%d15, %d2, %d15, 0
.LVL15:
	.loc 1 199 0
	st.h	[%a15] 2, %d15
	ret
.LVL16:
.L24:
	.loc 1 182 0
	call	simio_GetTHBufferSpace
.LVL17:
	jnz	%d2, .L15
	ret
.LFE4:
	.size	simio_PutByteToHost, .-simio_PutByteToHost
.section .text.SIMIO_Init,"ax",@progbits
	.align 1
	.global	SIMIO_Init
	.type	SIMIO_Init, @function
SIMIO_Init:
.LFB0:
	.loc 1 87 0
.LVL18:
	.loc 1 88 0
	and	%d4, %d4, 1
.LVL19:
	jnz	%d4, .L28
	.loc 1 91 0
	movh.a	%a15, hi:simio_NonBlockingMode
	st.w	[%a15] lo:simio_NonBlockingMode, %d4
	ret
.L28:
	.loc 1 89 0
	mov	%d15, 1
	movh.a	%a15, hi:simio_NonBlockingMode
	st.w	[%a15] lo:simio_NonBlockingMode, %d15
	ret
.LFE0:
	.size	SIMIO_Init, .-SIMIO_Init
.section .text.read,"ax",@progbits
	.align 1
	.global	read
	.type	read, @function
read:
.LFB5:
	.loc 1 210 0
.LVL20:
.LBB20:
	.loc 1 213 0
	movh.a	%a15, hi:_impure_ptr
	ld.a	%a15, [%a15] lo:_impure_ptr
.LBE20:
	.loc 1 210 0
	mov.aa	%a12, %a4
.LBB35:
	.loc 1 213 0
	ld.a	%a4, [%a15] 4
.LVL21:
.LBE35:
	.loc 1 210 0
	mov	%d15, %d4
	mov	%d8, %d5
.LBB36:
	.loc 1 213 0
	call	fileno
.LVL22:
	jeq	%d2, %d15, .L45
.LBE36:
	.loc 1 212 0
	mov	%d8, 0
.LVL23:
.L30:
	.loc 1 226 0
	mov	%d2, %d8
	ret
.LVL24:
.L45:
	movh.a	%a15, hi:simio_HTBuffer
	lea	%a15, [%a15] lo:simio_HTBuffer
.LBB37:
.LBB21:
.LBB22:
.LBB23:
	.loc 1 150 0
	mov	%d2, 1024
.LVL25:
.L33:
	.loc 1 141 0 discriminator 1
	ld.hu	%d15, [%a15]0
.LVL26:
	.loc 1 142 0 discriminator 1
	ld.hu	%d3, [%a15] 2
.LVL27:
	.loc 1 150 0 discriminator 1
	sub	%d6, %d2, %d15
	.loc 1 146 0 discriminator 1
	sub	%d4, %d3, %d15
	add	%d6, %d3
	lt.u	%d15, %d3, %d15
.LVL28:
	sel	%d15, %d15, %d6, %d4
.LBE23:
.LBE22:
	.loc 1 218 0 discriminator 1
	jz	%d15, .L33
.LVL29:
.LBB24:
.LBB25:
	.loc 1 166 0 discriminator 1
	mov.a	%a2, %d8
.LBE25:
.LBE24:
	.loc 1 220 0 discriminator 1
	mov	%d7, 0
.LBB28:
.LBB29:
	.loc 1 150 0 discriminator 1
	mov	%d2, 1024
.LBE29:
.LBE28:
.LBB31:
.LBB26:
	.loc 1 166 0 discriminator 1
	add.a	%a2, -1
.LBE26:
.LBE31:
	.loc 1 220 0 discriminator 1
	jz	%d8, .L30
.LVL30:
.L43:
.LBB32:
.LBB30:
	.loc 1 141 0
	ld.hu	%d15, [%a15]0
	.loc 1 142 0
	ld.hu	%d3, [%a15] 2
	.loc 1 150 0
	sub	%d6, %d2, %d15
	.loc 1 146 0
	sub	%d4, %d3, %d15
	add	%d6, %d3
	lt.u	%d15, %d3, %d15
	sel	%d15, %d15, %d6, %d4
	addsc.a	%a3, %a12, %d7, 0
.LVL31:
.LBE30:
.LBE32:
	.loc 1 220 0
	jz	%d15, .L46
.LBB33:
.LBB27:
	.loc 1 163 0
	ld.hu	%d3, [%a15]0
.LVL32:
	.loc 1 166 0
	mov	%d5, 1024
	.loc 1 164 0
	add	%d15, %d3, 1
	extr.u	%d15, %d15, 0, 16
.LVL33:
	addsc.a	%a5, %a15, %d3, 0
	.loc 1 166 0
	lt.u	%d4, %d15, %d5
	.loc 1 164 0
	ld.bu	%d3, [%a5] 4
.LVL34:
	.loc 1 166 0
	sel	%d15, %d4, %d15, 0
.LVL35:
	.loc 1 167 0
	st.h	[%a15]0, %d15
.LBE27:
.LBE33:
	.loc 1 222 0
	st.b	[%a3]0, %d3
	.loc 1 220 0
	add	%d7, 1
.LVL36:
	loop	%a2, .L43
.LVL37:
.LBE21:
.LBE37:
	.loc 1 226 0
	mov	%d2, %d8
	ret
.LVL38:
.L46:
.LBB38:
.LBB34:
	mov	%d8, %d7
.LVL39:
.LBE34:
.LBE38:
	mov	%d2, %d8
	ret
.LFE5:
	.size	read, .-read
.section .text.write,"ax",@progbits
	.align 1
	.global	write
	.type	write, @function
write:
.LFB6:
	.loc 1 235 0
.LVL40:
.LBB39:
	.loc 1 238 0
	movh.a	%a12, hi:_impure_ptr
	ld.a	%a2, [%a12] lo:_impure_ptr
.LBE39:
	.loc 1 235 0
	mov.aa	%a15, %a4
.LBB41:
	.loc 1 238 0
	ld.a	%a4, [%a2] 8
.LVL41:
.LBE41:
	.loc 1 235 0
	mov	%d8, %d4
	mov	%d15, %d5
.LBB42:
	.loc 1 238 0
	call	fileno
.LVL42:
	jeq	%d2, %d8, .L51
	.loc 1 238 0 is_stmt 0 discriminator 1
	ld.a	%a2, [%a12] lo:_impure_ptr
	ld.a	%a4, [%a2] 12
	call	fileno
.LVL43:
	jeq	%d2, %d8, .L51
.L50:
.LBE42:
	.loc 1 237 0 is_stmt 1
	mov	%d15, 0
.LVL44:
	.loc 1 247 0
	mov	%d2, %d15
	ret
.LVL45:
.L51:
	addsc.a	%a12, %a15, %d15, 0
.LBB43:
.LBB40:
	.loc 1 241 0
	jz	%d15, .L50
.LVL46:
.L54:
	.loc 1 243 0 discriminator 2
	ld.bu	%d4, [%a15+]1
.LVL47:
	call	simio_PutByteToHost
.LVL48:
	.loc 1 241 0 discriminator 2
	jne.a	%a15, %a12, .L54
.LVL49:
.LBE40:
.LBE43:
	.loc 1 247 0
	mov	%d2, %d15
	ret
.LFE6:
	.size	write, .-write
.section .text.kbhit,"ax",@progbits
	.align 1
	.global	kbhit
	.type	kbhit, @function
kbhit:
.LFB7:
	.loc 1 250 0
.LBB44:
.LBB45:
	.loc 1 141 0
	movh.a	%a2, hi:simio_HTBuffer
	lea	%a15, [%a2] lo:simio_HTBuffer
	ld.hu	%d15, [%a2] lo:simio_HTBuffer
.LVL50:
	.loc 1 142 0
	ld.hu	%d3, [%a15] 2
.LVL51:
	.loc 1 150 0
	sub	%d2, %d3, %d15
	.loc 1 146 0
	sub	%d4, %d3, %d15
	.loc 1 150 0
	addi	%d2, %d2, 1024
	.loc 1 146 0
	lt.u	%d15, %d3, %d15
.LVL52:
	cmovn	%d2, %d15, %d4
.LBE45:
.LBE44:
	.loc 1 252 0
	ne	%d2, %d2, 0
	ret
.LFE7:
	.size	kbhit, .-kbhit
.section .text.SIMIO_GetHTCharCount,"ax",@progbits
	.align 1
	.global	SIMIO_GetHTCharCount
	.type	SIMIO_GetHTCharCount, @function
SIMIO_GetHTCharCount:
.LFB8:
	.loc 1 256 0
.LBB46:
.LBB47:
	.loc 1 141 0
	movh.a	%a2, hi:simio_HTBuffer
	lea	%a15, [%a2] lo:simio_HTBuffer
	ld.hu	%d15, [%a2] lo:simio_HTBuffer
.LVL53:
	.loc 1 142 0
	ld.hu	%d3, [%a15] 2
.LVL54:
	.loc 1 150 0
	sub	%d4, %d3, %d15
	.loc 1 146 0
	sub	%d2, %d3, %d15
	.loc 1 150 0
	addi	%d4, %d4, 1024
	.loc 1 146 0
	lt.u	%d15, %d3, %d15
.LVL55:
.LBE47:
.LBE46:
	.loc 1 258 0
	cmov	%d2, %d15, %d4
	ret
.LFE8:
	.size	SIMIO_GetHTCharCount, .-SIMIO_GetHTCharCount
.section .text.SIMIO_GetByteFromHost,"ax",@progbits
	.align 1
	.global	SIMIO_GetByteFromHost
	.type	SIMIO_GetByteFromHost, @function
SIMIO_GetByteFromHost:
.LFB9:
	.loc 1 261 0
	.loc 1 262 0
	movh.a	%a15, hi:simio_NonBlockingMode
	ld.w	%d15, [%a15] lo:simio_NonBlockingMode
	movh.a	%a2, hi:simio_HTBuffer
	lea	%a15, [%a2] lo:simio_HTBuffer
	jnz	%d15, .L63
.LBB48:
.LBB49:
.LBB50:
	.loc 1 150 0
	mov	%d5, 1024
.L66:
	.loc 1 141 0 discriminator 1
	ld.hu	%d15, [%a15]0
.LVL56:
	.loc 1 142 0 discriminator 1
	ld.hu	%d2, [%a15] 2
.LVL57:
	.loc 1 150 0 discriminator 1
	sub	%d4, %d5, %d15
	.loc 1 146 0 discriminator 1
	sub	%d3, %d2, %d15
	add	%d4, %d2
	lt.u	%d15, %d2, %d15
.LVL58:
	sel	%d15, %d15, %d4, %d3
.LBE50:
.LBE49:
.LBE48:
	.loc 1 265 0 discriminator 1
	jz	%d15, .L66
.LVL59:
.L63:
.LBB51:
.LBB52:
	.loc 1 163 0
	ld.hu	%d2, [%a2] lo:simio_HTBuffer
.LVL60:
	.loc 1 166 0
	mov	%d4, 1024
	.loc 1 164 0
	add	%d15, %d2, 1
	extr.u	%d15, %d15, 0, 16
.LVL61:
	addsc.a	%a15, %a15, %d2, 0
	.loc 1 166 0
	lt.u	%d3, %d15, %d4
	sel	%d15, %d3, %d15, 0
.LVL62:
	.loc 1 164 0
	ld.bu	%d2, [%a15] 4
.LVL63:
	.loc 1 167 0
	st.h	[%a2] lo:simio_HTBuffer, %d15
.LBE52:
.LBE51:
	.loc 1 269 0
	ret
.LFE9:
	.size	SIMIO_GetByteFromHost, .-SIMIO_GetByteFromHost
.section .text.SIMIO_PutByteToHost,"ax",@progbits
	.align 1
	.global	SIMIO_PutByteToHost
	.type	SIMIO_PutByteToHost, @function
SIMIO_PutByteToHost:
.LFB10:
	.loc 1 272 0
.LVL64:
	.loc 1 273 0
	j	simio_PutByteToHost
.LVL65:
.LFE10:
	.size	SIMIO_PutByteToHost, .-SIMIO_PutByteToHost
.section .data,"aw",@progbits
	.align 2
	.type	simio_NonBlockingMode, @object
	.size	simio_NonBlockingMode, 4
simio_NonBlockingMode:
	.zero	4
	.global	g_JtagSimioAccess
	.align 2
	.type	g_JtagSimioAccess, @object
	.size	g_JtagSimioAccess, 16
g_JtagSimioAccess:
	.word	1195463754
	.short	1024
	.short	1024
	.word	simio_HTBuffer
	.word	simio_THBuffer
	.align 1
	.type	simio_THBuffer, @object
	.size	simio_THBuffer, 1028
simio_THBuffer:
	.zero	1028
	.align 1
	.type	simio_HTBuffer, @object
	.size	simio_HTBuffer, 1028
simio_HTBuffer:
	.zero	1028
.section .debug_frame,"",@progbits
.Lframe0:
	.uaword	.LECIE0-.LSCIE0
.LSCIE0:
	.uaword	0xffffffff
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 1
	.uleb128 0x1b
	.byte	0xc
	.uleb128 0x1a
	.uleb128 0
	.align 2
.LECIE0:
.LSFDE0:
	.uaword	.LEFDE0-.LASFDE0
.LASFDE0:
	.uaword	.Lframe0
	.uaword	.LFB1
	.uaword	.LFE1-.LFB1
	.align 2
.LEFDE0:
.LSFDE2:
	.uaword	.LEFDE2-.LASFDE2
.LASFDE2:
	.uaword	.Lframe0
	.uaword	.LFB4
	.uaword	.LFE4-.LFB4
	.align 2
.LEFDE2:
.LSFDE4:
	.uaword	.LEFDE4-.LASFDE4
.LASFDE4:
	.uaword	.Lframe0
	.uaword	.LFB0
	.uaword	.LFE0-.LFB0
	.align 2
.LEFDE4:
.LSFDE6:
	.uaword	.LEFDE6-.LASFDE6
.LASFDE6:
	.uaword	.Lframe0
	.uaword	.LFB5
	.uaword	.LFE5-.LFB5
	.align 2
.LEFDE6:
.LSFDE8:
	.uaword	.LEFDE8-.LASFDE8
.LASFDE8:
	.uaword	.Lframe0
	.uaword	.LFB6
	.uaword	.LFE6-.LFB6
	.align 2
.LEFDE8:
.LSFDE10:
	.uaword	.LEFDE10-.LASFDE10
.LASFDE10:
	.uaword	.Lframe0
	.uaword	.LFB7
	.uaword	.LFE7-.LFB7
	.align 2
.LEFDE10:
.LSFDE12:
	.uaword	.LEFDE12-.LASFDE12
.LASFDE12:
	.uaword	.Lframe0
	.uaword	.LFB8
	.uaword	.LFE8-.LFB8
	.align 2
.LEFDE12:
.LSFDE14:
	.uaword	.LEFDE14-.LASFDE14
.LASFDE14:
	.uaword	.Lframe0
	.uaword	.LFB9
	.uaword	.LFE9-.LFB9
	.align 2
.LEFDE14:
.LSFDE16:
	.uaword	.LEFDE16-.LASFDE16
.LASFDE16:
	.uaword	.Lframe0
	.uaword	.LFB10
	.uaword	.LFE10-.LFB10
	.align 2
.LEFDE16:
.section .text,"ax",@progbits
.Letext0:
	.file 2 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\lib\\gcc\\tricore\\4.9.4\\include\\stddef.h"
	.file 3 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\tricore\\include\\sys\\lock.h"
	.file 4 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\tricore\\include\\sys\\_types.h"
	.file 5 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\tricore\\include\\sys\\reent.h"
.section .debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x129a
	.uahalf	0x3
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.string	"GNU C 4.9.4 build on 2019-06-07 -mlicense-dir=c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\bin\\../lib/gcc/tricore/4.9.4/../../../../licenses -mtc161 -g -O2 -std=c99 -fno-common -fstrict-volatile-bitfields -ffunction-sections -fdata-sections"
	.byte	0x1
	.string	"0_Src/BaseSw/simio_pls/simio_pls_tc.c"
	.string	"C:\\\\Google drive\\\\RH_Workspace\\\\__RH26_Control_Base_TC275"
	.uaword	.Ldebug_ranges0+0x90
	.uaword	0
	.uaword	0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.string	"size_t"
	.byte	0x2
	.byte	0xd4
	.uaword	0x183
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.string	"long unsigned int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.string	"signed char"
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.string	"unsigned char"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.string	"short int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.string	"short unsigned int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.string	"unsigned int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.string	"long long int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.string	"long long unsigned int"
	.uleb128 0x2
	.string	"_LOCK_RECURSIVE_T"
	.byte	0x3
	.byte	0x7
	.uaword	0x1db
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"long int"
	.uleb128 0x2
	.string	"_fpos_t"
	.byte	0x4
	.byte	0x2c
	.uaword	0x236
	.uleb128 0x4
	.string	"wint_t"
	.byte	0x2
	.uahalf	0x161
	.uaword	0x1e2
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.byte	0x46
	.uaword	0x284
	.uleb128 0x6
	.string	"__wch"
	.byte	0x4
	.byte	0x48
	.uaword	0x251
	.uleb128 0x6
	.string	"__wchb"
	.byte	0x4
	.byte	0x49
	.uaword	0x284
	.byte	0
	.uleb128 0x7
	.uaword	0x1a7
	.uaword	0x294
	.uleb128 0x8
	.uaword	0x294
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.string	"sizetype"
	.uleb128 0x9
	.byte	0x8
	.byte	0x4
	.byte	0x43
	.uaword	0x2c9
	.uleb128 0xa
	.string	"__count"
	.byte	0x4
	.byte	0x45
	.uaword	0x1db
	.byte	0
	.uleb128 0xa
	.string	"__value"
	.byte	0x4
	.byte	0x4a
	.uaword	0x260
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.string	"_mbstate_t"
	.byte	0x4
	.byte	0x4b
	.uaword	0x2a0
	.uleb128 0x2
	.string	"_flock_t"
	.byte	0x4
	.byte	0x4f
	.uaword	0x21d
	.uleb128 0xb
	.byte	0x4
	.uleb128 0x2
	.string	"__ULong"
	.byte	0x5
	.byte	0x15
	.uaword	0x183
	.uleb128 0xc
	.string	"_Bigint"
	.byte	0x18
	.byte	0x5
	.byte	0x2c
	.uaword	0x35c
	.uleb128 0xa
	.string	"_next"
	.byte	0x5
	.byte	0x2e
	.uaword	0x35c
	.byte	0
	.uleb128 0xa
	.string	"_k"
	.byte	0x5
	.byte	0x2f
	.uaword	0x1db
	.byte	0x4
	.uleb128 0xa
	.string	"_maxwds"
	.byte	0x5
	.byte	0x2f
	.uaword	0x1db
	.byte	0x8
	.uleb128 0xa
	.string	"_sign"
	.byte	0x5
	.byte	0x2f
	.uaword	0x1db
	.byte	0xc
	.uleb128 0xa
	.string	"_wds"
	.byte	0x5
	.byte	0x2f
	.uaword	0x1db
	.byte	0x10
	.uleb128 0xa
	.string	"_x"
	.byte	0x5
	.byte	0x30
	.uaword	0x362
	.byte	0x14
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x2fc
	.uleb128 0x7
	.uaword	0x2ed
	.uaword	0x372
	.uleb128 0x8
	.uaword	0x294
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"__tm"
	.byte	0x24
	.byte	0x5
	.byte	0x34
	.uaword	0x420
	.uleb128 0xa
	.string	"__tm_sec"
	.byte	0x5
	.byte	0x36
	.uaword	0x1db
	.byte	0
	.uleb128 0xa
	.string	"__tm_min"
	.byte	0x5
	.byte	0x37
	.uaword	0x1db
	.byte	0x4
	.uleb128 0xa
	.string	"__tm_hour"
	.byte	0x5
	.byte	0x38
	.uaword	0x1db
	.byte	0x8
	.uleb128 0xa
	.string	"__tm_mday"
	.byte	0x5
	.byte	0x39
	.uaword	0x1db
	.byte	0xc
	.uleb128 0xa
	.string	"__tm_mon"
	.byte	0x5
	.byte	0x3a
	.uaword	0x1db
	.byte	0x10
	.uleb128 0xa
	.string	"__tm_year"
	.byte	0x5
	.byte	0x3b
	.uaword	0x1db
	.byte	0x14
	.uleb128 0xa
	.string	"__tm_wday"
	.byte	0x5
	.byte	0x3c
	.uaword	0x1db
	.byte	0x18
	.uleb128 0xa
	.string	"__tm_yday"
	.byte	0x5
	.byte	0x3d
	.uaword	0x1db
	.byte	0x1c
	.uleb128 0xa
	.string	"__tm_isdst"
	.byte	0x5
	.byte	0x3e
	.uaword	0x1db
	.byte	0x20
	.byte	0
	.uleb128 0xe
	.uaword	.LASF0
	.uahalf	0x108
	.byte	0x5
	.byte	0x47
	.uaword	0x475
	.uleb128 0xa
	.string	"_fnargs"
	.byte	0x5
	.byte	0x48
	.uaword	0x475
	.byte	0
	.uleb128 0xa
	.string	"_dso_handle"
	.byte	0x5
	.byte	0x49
	.uaword	0x475
	.byte	0x80
	.uleb128 0xf
	.string	"_fntypes"
	.byte	0x5
	.byte	0x4b
	.uaword	0x2ed
	.uahalf	0x100
	.uleb128 0xf
	.string	"_is_cxa"
	.byte	0x5
	.byte	0x4e
	.uaword	0x2ed
	.uahalf	0x104
	.byte	0
	.uleb128 0x7
	.uaword	0x2eb
	.uaword	0x485
	.uleb128 0x8
	.uaword	0x294
	.byte	0x1f
	.byte	0
	.uleb128 0x10
	.string	"_atexit"
	.uahalf	0x190
	.byte	0x5
	.byte	0x59
	.uaword	0x4cb
	.uleb128 0xa
	.string	"_next"
	.byte	0x5
	.byte	0x5a
	.uaword	0x4cb
	.byte	0
	.uleb128 0xa
	.string	"_ind"
	.byte	0x5
	.byte	0x5b
	.uaword	0x1db
	.byte	0x4
	.uleb128 0xa
	.string	"_fns"
	.byte	0x5
	.byte	0x5d
	.uaword	0x4d1
	.byte	0x8
	.uleb128 0x11
	.uaword	.LASF0
	.byte	0x5
	.byte	0x5e
	.uaword	0x420
	.byte	0x88
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x485
	.uleb128 0x7
	.uaword	0x4e1
	.uaword	0x4e1
	.uleb128 0x8
	.uaword	0x294
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x4e7
	.uleb128 0x12
	.byte	0x1
	.uleb128 0xc
	.string	"__sbuf"
	.byte	0x8
	.byte	0x5
	.byte	0x69
	.uaword	0x515
	.uleb128 0xa
	.string	"_base"
	.byte	0x5
	.byte	0x6a
	.uaword	0x515
	.byte	0
	.uleb128 0xa
	.string	"_size"
	.byte	0x5
	.byte	0x6b
	.uaword	0x1db
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x1a7
	.uleb128 0xc
	.string	"__sFILE"
	.byte	0x68
	.byte	0x5
	.byte	0xa9
	.uaword	0x67b
	.uleb128 0xa
	.string	"_p"
	.byte	0x5
	.byte	0xaa
	.uaword	0x515
	.byte	0
	.uleb128 0xa
	.string	"_r"
	.byte	0x5
	.byte	0xab
	.uaword	0x1db
	.byte	0x4
	.uleb128 0xa
	.string	"_w"
	.byte	0x5
	.byte	0xac
	.uaword	0x1db
	.byte	0x8
	.uleb128 0xa
	.string	"_flags"
	.byte	0x5
	.byte	0xad
	.uaword	0x1b8
	.byte	0xc
	.uleb128 0xa
	.string	"_file"
	.byte	0x5
	.byte	0xae
	.uaword	0x1b8
	.byte	0xe
	.uleb128 0xa
	.string	"_bf"
	.byte	0x5
	.byte	0xaf
	.uaword	0x4e9
	.byte	0x10
	.uleb128 0xa
	.string	"_lbfsize"
	.byte	0x5
	.byte	0xb0
	.uaword	0x1db
	.byte	0x18
	.uleb128 0xa
	.string	"_cookie"
	.byte	0x5
	.byte	0xb7
	.uaword	0x2eb
	.byte	0x1c
	.uleb128 0xa
	.string	"_read"
	.byte	0x5
	.byte	0xb9
	.uaword	0x84e
	.byte	0x20
	.uleb128 0xa
	.string	"_write"
	.byte	0x5
	.byte	0xbb
	.uaword	0x87e
	.byte	0x24
	.uleb128 0xa
	.string	"_seek"
	.byte	0x5
	.byte	0xbd
	.uaword	0x8a3
	.byte	0x28
	.uleb128 0xa
	.string	"_close"
	.byte	0x5
	.byte	0xbe
	.uaword	0x8be
	.byte	0x2c
	.uleb128 0xa
	.string	"_ub"
	.byte	0x5
	.byte	0xc1
	.uaword	0x4e9
	.byte	0x30
	.uleb128 0xa
	.string	"_up"
	.byte	0x5
	.byte	0xc2
	.uaword	0x515
	.byte	0x38
	.uleb128 0xa
	.string	"_ur"
	.byte	0x5
	.byte	0xc3
	.uaword	0x1db
	.byte	0x3c
	.uleb128 0xa
	.string	"_ubuf"
	.byte	0x5
	.byte	0xc6
	.uaword	0x8c4
	.byte	0x40
	.uleb128 0xa
	.string	"_nbuf"
	.byte	0x5
	.byte	0xc7
	.uaword	0x8d4
	.byte	0x43
	.uleb128 0xa
	.string	"_lb"
	.byte	0x5
	.byte	0xca
	.uaword	0x4e9
	.byte	0x44
	.uleb128 0xa
	.string	"_blksize"
	.byte	0x5
	.byte	0xcd
	.uaword	0x1db
	.byte	0x4c
	.uleb128 0xa
	.string	"_offset"
	.byte	0x5
	.byte	0xce
	.uaword	0x1db
	.byte	0x50
	.uleb128 0xa
	.string	"_data"
	.byte	0x5
	.byte	0xd1
	.uaword	0x69a
	.byte	0x54
	.uleb128 0xa
	.string	"_lock"
	.byte	0x5
	.byte	0xd5
	.uaword	0x2db
	.byte	0x58
	.uleb128 0xa
	.string	"_mbstate"
	.byte	0x5
	.byte	0xd7
	.uaword	0x2c9
	.byte	0x5c
	.uleb128 0xa
	.string	"_flags2"
	.byte	0x5
	.byte	0xd8
	.uaword	0x1db
	.byte	0x64
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.uaword	0x1db
	.uaword	0x69a
	.uleb128 0x14
	.uaword	0x69a
	.uleb128 0x14
	.uaword	0x2eb
	.uleb128 0x14
	.uaword	0x840
	.uleb128 0x14
	.uaword	0x1db
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x6a0
	.uleb128 0x15
	.string	"_reent"
	.uahalf	0x424
	.byte	0x5
	.uahalf	0x243
	.uaword	0x840
	.uleb128 0x16
	.string	"_errno"
	.byte	0x5
	.uahalf	0x245
	.uaword	0x1db
	.byte	0
	.uleb128 0x16
	.string	"_stdin"
	.byte	0x5
	.uahalf	0x24a
	.uaword	0x937
	.byte	0x4
	.uleb128 0x16
	.string	"_stdout"
	.byte	0x5
	.uahalf	0x24a
	.uaword	0x937
	.byte	0x8
	.uleb128 0x16
	.string	"_stderr"
	.byte	0x5
	.uahalf	0x24a
	.uaword	0x937
	.byte	0xc
	.uleb128 0x16
	.string	"_inc"
	.byte	0x5
	.uahalf	0x24c
	.uaword	0x1db
	.byte	0x10
	.uleb128 0x16
	.string	"_emergency"
	.byte	0x5
	.uahalf	0x24d
	.uaword	0xbdd
	.byte	0x14
	.uleb128 0x16
	.string	"_current_category"
	.byte	0x5
	.uahalf	0x24f
	.uaword	0x1db
	.byte	0x30
	.uleb128 0x16
	.string	"_current_locale"
	.byte	0x5
	.uahalf	0x250
	.uaword	0x873
	.byte	0x34
	.uleb128 0x16
	.string	"__sdidinit"
	.byte	0x5
	.uahalf	0x252
	.uaword	0x1db
	.byte	0x38
	.uleb128 0x16
	.string	"__cleanup"
	.byte	0x5
	.uahalf	0x254
	.uaword	0xbf9
	.byte	0x3c
	.uleb128 0x16
	.string	"_result"
	.byte	0x5
	.uahalf	0x257
	.uaword	0x35c
	.byte	0x40
	.uleb128 0x16
	.string	"_result_k"
	.byte	0x5
	.uahalf	0x258
	.uaword	0x1db
	.byte	0x44
	.uleb128 0x16
	.string	"_p5s"
	.byte	0x5
	.uahalf	0x259
	.uaword	0x35c
	.byte	0x48
	.uleb128 0x16
	.string	"_freelist"
	.byte	0x5
	.uahalf	0x25a
	.uaword	0xbff
	.byte	0x4c
	.uleb128 0x16
	.string	"_cvtlen"
	.byte	0x5
	.uahalf	0x25d
	.uaword	0x1db
	.byte	0x50
	.uleb128 0x16
	.string	"_cvtbuf"
	.byte	0x5
	.uahalf	0x25e
	.uaword	0x840
	.byte	0x54
	.uleb128 0x16
	.string	"_new"
	.byte	0x5
	.uahalf	0x281
	.uaword	0xbb4
	.byte	0x58
	.uleb128 0x17
	.string	"_atexit"
	.byte	0x5
	.uahalf	0x284
	.uaword	0x4cb
	.uahalf	0x148
	.uleb128 0x17
	.string	"_atexit0"
	.byte	0x5
	.uahalf	0x285
	.uaword	0x485
	.uahalf	0x14c
	.uleb128 0x17
	.string	"_sig_func"
	.byte	0x5
	.uahalf	0x288
	.uaword	0xc11
	.uahalf	0x2dc
	.uleb128 0x17
	.string	"__sglue"
	.byte	0x5
	.uahalf	0x28d
	.uaword	0x8f3
	.uahalf	0x2e0
	.uleb128 0x17
	.string	"__sf"
	.byte	0x5
	.uahalf	0x28e
	.uaword	0xc1d
	.uahalf	0x2ec
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x846
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.string	"char"
	.uleb128 0xd
	.byte	0x4
	.uaword	0x67b
	.uleb128 0x13
	.byte	0x1
	.uaword	0x1db
	.uaword	0x873
	.uleb128 0x14
	.uaword	0x69a
	.uleb128 0x14
	.uaword	0x2eb
	.uleb128 0x14
	.uaword	0x873
	.uleb128 0x14
	.uaword	0x1db
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x879
	.uleb128 0x18
	.uaword	0x846
	.uleb128 0xd
	.byte	0x4
	.uaword	0x854
	.uleb128 0x13
	.byte	0x1
	.uaword	0x242
	.uaword	0x8a3
	.uleb128 0x14
	.uaword	0x69a
	.uleb128 0x14
	.uaword	0x2eb
	.uleb128 0x14
	.uaword	0x242
	.uleb128 0x14
	.uaword	0x1db
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x884
	.uleb128 0x13
	.byte	0x1
	.uaword	0x1db
	.uaword	0x8be
	.uleb128 0x14
	.uaword	0x69a
	.uleb128 0x14
	.uaword	0x2eb
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x8a9
	.uleb128 0x7
	.uaword	0x1a7
	.uaword	0x8d4
	.uleb128 0x8
	.uaword	0x294
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.uaword	0x1a7
	.uaword	0x8e4
	.uleb128 0x8
	.uaword	0x294
	.byte	0
	.byte	0
	.uleb128 0x4
	.string	"__FILE"
	.byte	0x5
	.uahalf	0x111
	.uaword	0x51b
	.uleb128 0x19
	.string	"_glue"
	.byte	0xc
	.byte	0x5
	.uahalf	0x115
	.uaword	0x931
	.uleb128 0x16
	.string	"_next"
	.byte	0x5
	.uahalf	0x117
	.uaword	0x931
	.byte	0
	.uleb128 0x16
	.string	"_niobs"
	.byte	0x5
	.uahalf	0x118
	.uaword	0x1db
	.byte	0x4
	.uleb128 0x16
	.string	"_iobs"
	.byte	0x5
	.uahalf	0x119
	.uaword	0x937
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x8f3
	.uleb128 0xd
	.byte	0x4
	.uaword	0x8e4
	.uleb128 0x19
	.string	"_rand48"
	.byte	0xe
	.byte	0x5
	.uahalf	0x131
	.uaword	0x97b
	.uleb128 0x16
	.string	"_seed"
	.byte	0x5
	.uahalf	0x132
	.uaword	0x97b
	.byte	0
	.uleb128 0x16
	.string	"_mult"
	.byte	0x5
	.uahalf	0x133
	.uaword	0x97b
	.byte	0x6
	.uleb128 0x16
	.string	"_add"
	.byte	0x5
	.uahalf	0x134
	.uaword	0x1c5
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.uaword	0x1c5
	.uaword	0x98b
	.uleb128 0x8
	.uaword	0x294
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.byte	0xcc
	.byte	0x5
	.uahalf	0x262
	.uaword	0xb38
	.uleb128 0x16
	.string	"_unused_rand"
	.byte	0x5
	.uahalf	0x264
	.uaword	0x1e2
	.byte	0
	.uleb128 0x16
	.string	"_strtok_last"
	.byte	0x5
	.uahalf	0x265
	.uaword	0x840
	.byte	0x4
	.uleb128 0x16
	.string	"_asctime_buf"
	.byte	0x5
	.uahalf	0x266
	.uaword	0xb38
	.byte	0x8
	.uleb128 0x16
	.string	"_localtime_buf"
	.byte	0x5
	.uahalf	0x267
	.uaword	0x372
	.byte	0x24
	.uleb128 0x16
	.string	"_gamma_signgam"
	.byte	0x5
	.uahalf	0x268
	.uaword	0x1db
	.byte	0x48
	.uleb128 0x16
	.string	"_rand_next"
	.byte	0x5
	.uahalf	0x269
	.uaword	0x203
	.byte	0x4c
	.uleb128 0x16
	.string	"_r48"
	.byte	0x5
	.uahalf	0x26a
	.uaword	0x93d
	.byte	0x54
	.uleb128 0x16
	.string	"_mblen_state"
	.byte	0x5
	.uahalf	0x26b
	.uaword	0x2c9
	.byte	0x64
	.uleb128 0x16
	.string	"_mbtowc_state"
	.byte	0x5
	.uahalf	0x26c
	.uaword	0x2c9
	.byte	0x6c
	.uleb128 0x16
	.string	"_wctomb_state"
	.byte	0x5
	.uahalf	0x26d
	.uaword	0x2c9
	.byte	0x74
	.uleb128 0x16
	.string	"_l64a_buf"
	.byte	0x5
	.uahalf	0x26e
	.uaword	0xb48
	.byte	0x7c
	.uleb128 0x16
	.string	"_signal_buf"
	.byte	0x5
	.uahalf	0x26f
	.uaword	0xb58
	.byte	0x84
	.uleb128 0x16
	.string	"_getdate_err"
	.byte	0x5
	.uahalf	0x270
	.uaword	0x1db
	.byte	0x9c
	.uleb128 0x16
	.string	"_mbrlen_state"
	.byte	0x5
	.uahalf	0x271
	.uaword	0x2c9
	.byte	0xa0
	.uleb128 0x16
	.string	"_mbrtowc_state"
	.byte	0x5
	.uahalf	0x272
	.uaword	0x2c9
	.byte	0xa8
	.uleb128 0x16
	.string	"_mbsrtowcs_state"
	.byte	0x5
	.uahalf	0x273
	.uaword	0x2c9
	.byte	0xb0
	.uleb128 0x16
	.string	"_wcrtomb_state"
	.byte	0x5
	.uahalf	0x274
	.uaword	0x2c9
	.byte	0xb8
	.uleb128 0x16
	.string	"_wcsrtombs_state"
	.byte	0x5
	.uahalf	0x275
	.uaword	0x2c9
	.byte	0xc0
	.uleb128 0x16
	.string	"_h_errno"
	.byte	0x5
	.uahalf	0x276
	.uaword	0x1db
	.byte	0xc8
	.byte	0
	.uleb128 0x7
	.uaword	0x846
	.uaword	0xb48
	.uleb128 0x8
	.uaword	0x294
	.byte	0x19
	.byte	0
	.uleb128 0x7
	.uaword	0x846
	.uaword	0xb58
	.uleb128 0x8
	.uaword	0x294
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.uaword	0x846
	.uaword	0xb68
	.uleb128 0x8
	.uaword	0x294
	.byte	0x17
	.byte	0
	.uleb128 0x1a
	.byte	0xf0
	.byte	0x5
	.uahalf	0x27b
	.uaword	0xb94
	.uleb128 0x16
	.string	"_nextf"
	.byte	0x5
	.uahalf	0x27e
	.uaword	0xb94
	.byte	0
	.uleb128 0x16
	.string	"_nmalloc"
	.byte	0x5
	.uahalf	0x27f
	.uaword	0xba4
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.uaword	0x515
	.uaword	0xba4
	.uleb128 0x8
	.uaword	0x294
	.byte	0x1d
	.byte	0
	.uleb128 0x7
	.uaword	0x1e2
	.uaword	0xbb4
	.uleb128 0x8
	.uaword	0x294
	.byte	0x1d
	.byte	0
	.uleb128 0x1b
	.byte	0xf0
	.byte	0x5
	.uahalf	0x260
	.uaword	0xbdd
	.uleb128 0x1c
	.string	"_reent"
	.byte	0x5
	.uahalf	0x277
	.uaword	0x98b
	.uleb128 0x1c
	.string	"_unused"
	.byte	0x5
	.uahalf	0x280
	.uaword	0xb68
	.byte	0
	.uleb128 0x7
	.uaword	0x846
	.uaword	0xbed
	.uleb128 0x8
	.uaword	0x294
	.byte	0x18
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.uaword	0xbf9
	.uleb128 0x14
	.uaword	0x69a
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0xbed
	.uleb128 0xd
	.byte	0x4
	.uaword	0x35c
	.uleb128 0x1d
	.byte	0x1
	.uaword	0xc11
	.uleb128 0x14
	.uaword	0x1db
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0xc17
	.uleb128 0xd
	.byte	0x4
	.uaword	0xc05
	.uleb128 0x7
	.uaword	0x8e4
	.uaword	0xc2d
	.uleb128 0x8
	.uaword	0x294
	.byte	0x2
	.byte	0
	.uleb128 0x10
	.string	"tagSimIOBuffer"
	.uahalf	0x404
	.byte	0x1
	.byte	0x20
	.uaword	0xc6f
	.uleb128 0x11
	.uaword	.LASF1
	.byte	0x1
	.byte	0x22
	.uaword	0x1c5
	.byte	0
	.uleb128 0x11
	.uaword	.LASF2
	.byte	0x1
	.byte	0x23
	.uaword	0x1c5
	.byte	0x2
	.uleb128 0xa
	.string	"byBuffer"
	.byte	0x1
	.byte	0x24
	.uaword	0xc6f
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.uaword	0x1a7
	.uaword	0xc80
	.uleb128 0x1e
	.uaword	0x294
	.uahalf	0x3ff
	.byte	0
	.uleb128 0x2
	.string	"SIMIOBUFFER_t"
	.byte	0x1
	.byte	0x25
	.uaword	0xc2d
	.uleb128 0xc
	.string	"tagJtagSimioAccess"
	.byte	0x10
	.byte	0x1
	.byte	0x27
	.uaword	0xd13
	.uleb128 0xa
	.string	"dwSignature"
	.byte	0x1
	.byte	0x29
	.uaword	0x1e2
	.byte	0
	.uleb128 0xa
	.string	"wHTBufSize"
	.byte	0x1
	.byte	0x2a
	.uaword	0x1c5
	.byte	0x4
	.uleb128 0xa
	.string	"wTHBufSize"
	.byte	0x1
	.byte	0x2b
	.uaword	0x1c5
	.byte	0x6
	.uleb128 0xa
	.string	"dwHTBufAddr"
	.byte	0x1
	.byte	0x2c
	.uaword	0xd13
	.byte	0x8
	.uleb128 0xa
	.string	"dwTHBufAddr"
	.byte	0x1
	.byte	0x2d
	.uaword	0xd13
	.byte	0xc
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0xd19
	.uleb128 0x1f
	.uaword	0xc80
	.uleb128 0x2
	.string	"TJtagSimioAccess_t"
	.byte	0x1
	.byte	0x2e
	.uaword	0xc95
	.uleb128 0x20
	.string	"simio_GetHTCharCount"
	.byte	0x1
	.byte	0x8a
	.byte	0x1
	.uaword	0x1e2
	.byte	0x1
	.uaword	0xd71
	.uleb128 0x21
	.uaword	.LASF1
	.byte	0x1
	.byte	0x8c
	.uaword	0x1c5
	.uleb128 0x21
	.uaword	.LASF2
	.byte	0x1
	.byte	0x8c
	.uaword	0x1c5
	.byte	0
	.uleb128 0x20
	.string	"simio_GetByteFromHost"
	.byte	0x1
	.byte	0x9f
	.byte	0x1
	.uaword	0x1a7
	.byte	0x1
	.uaword	0xdae
	.uleb128 0x21
	.uaword	.LASF1
	.byte	0x1
	.byte	0xa1
	.uaword	0x1c5
	.uleb128 0x22
	.string	"ucByte"
	.byte	0x1
	.byte	0xa2
	.uaword	0x1a7
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.string	"SIMIO_GetHTCharCount"
	.byte	0x1
	.byte	0xff
	.byte	0x1
	.uaword	0x1e2
	.byte	0x1
	.uleb128 0x24
	.string	"simio_GetTHBufferSpace"
	.byte	0x1
	.byte	0x63
	.byte	0x1
	.uaword	0x1e2
	.uaword	.LFB1
	.uaword	.LFE1
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0xe33
	.uleb128 0x25
	.string	"uiBufferSpace"
	.byte	0x1
	.byte	0x65
	.uaword	0x1e2
	.uaword	.LLST0
	.uleb128 0x26
	.uaword	.LASF1
	.byte	0x1
	.byte	0x66
	.uaword	0x1c5
	.uaword	.LLST1
	.uleb128 0x26
	.uaword	.LASF2
	.byte	0x1
	.byte	0x66
	.uaword	0x1c5
	.uaword	.LLST2
	.byte	0
	.uleb128 0x27
	.string	"simio_PutByteToHost"
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.uaword	.LFB4
	.uaword	.LFE4
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0xe8c
	.uleb128 0x28
	.string	"Data"
	.byte	0x1
	.byte	0xb0
	.uaword	0x1a7
	.uaword	.LLST3
	.uleb128 0x26
	.uaword	.LASF2
	.byte	0x1
	.byte	0xb2
	.uaword	0x1c5
	.uaword	.LLST4
	.uleb128 0x29
	.uaword	.LVL12
	.uaword	0xdcd
	.uleb128 0x29
	.uaword	.LVL17
	.uaword	0xdcd
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.string	"SIMIO_Init"
	.byte	0x1
	.byte	0x56
	.byte	0x1
	.uaword	.LFB0
	.uaword	.LFE0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0xebc
	.uleb128 0x28
	.string	"Mode"
	.byte	0x1
	.byte	0x56
	.uaword	0x1e2
	.uaword	.LLST5
	.byte	0
	.uleb128 0x2b
	.byte	0x1
	.string	"read"
	.byte	0x1
	.byte	0xd1
	.byte	0x1
	.uaword	0x175
	.uaword	.LFB5
	.uaword	.LFE5
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0xfd9
	.uleb128 0x28
	.string	"fd"
	.byte	0x1
	.byte	0xd1
	.uaword	0x1db
	.uaword	.LLST6
	.uleb128 0x28
	.string	"buffer"
	.byte	0x1
	.byte	0xd1
	.uaword	0x2eb
	.uaword	.LLST7
	.uleb128 0x28
	.string	"count"
	.byte	0x1
	.byte	0xd1
	.uaword	0x175
	.uaword	.LLST8
	.uleb128 0x25
	.string	"index"
	.byte	0x1
	.byte	0xd3
	.uaword	0x175
	.uaword	.LLST9
	.uleb128 0x2c
	.uaword	.Ldebug_ranges0+0
	.uleb128 0x2d
	.byte	0x1
	.uaword	.LASF3
	.byte	0x1
	.byte	0xd5
	.uaword	0x1db
	.byte	0x1
	.uaword	0xf33
	.uleb128 0x2e
	.byte	0
	.uleb128 0x2f
	.uaword	.Ldebug_ranges0+0x18
	.uaword	0xfce
	.uleb128 0x25
	.string	"buf"
	.byte	0x1
	.byte	0xd7
	.uaword	0x840
	.uaword	.LLST10
	.uleb128 0x30
	.uaword	0xd38
	.uaword	.LBB22
	.uaword	.LBE22
	.byte	0x1
	.byte	0xda
	.uaword	0xf7b
	.uleb128 0x31
	.uaword	.LBB23
	.uaword	.LBE23
	.uleb128 0x32
	.uaword	0xd5a
	.uaword	.LLST11
	.uleb128 0x32
	.uaword	0xd65
	.uaword	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x33
	.uaword	0xd71
	.uaword	.LBB24
	.uaword	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0xde
	.uaword	0xfa7
	.uleb128 0x2c
	.uaword	.Ldebug_ranges0+0x30
	.uleb128 0x32
	.uaword	0xd94
	.uaword	.LLST13
	.uleb128 0x32
	.uaword	0xd9f
	.uaword	.LLST14
	.byte	0
	.byte	0
	.uleb128 0x34
	.uaword	0xd38
	.uaword	.LBB28
	.uaword	.Ldebug_ranges0+0x50
	.byte	0x1
	.byte	0xdc
	.uleb128 0x2c
	.uaword	.Ldebug_ranges0+0x50
	.uleb128 0x35
	.uaword	0xd5a
	.byte	0x1
	.byte	0x5f
	.uleb128 0x32
	.uaword	0xd65
	.uaword	.LLST15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.uaword	.LVL22
	.uaword	0x128e
	.byte	0
	.byte	0
	.uleb128 0x2b
	.byte	0x1
	.string	"write"
	.byte	0x1
	.byte	0xea
	.byte	0x1
	.uaword	0x175
	.uaword	.LFB6
	.uaword	.LFE6
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x108b
	.uleb128 0x28
	.string	"fd"
	.byte	0x1
	.byte	0xea
	.uaword	0x1db
	.uaword	.LLST16
	.uleb128 0x28
	.string	"buffer"
	.byte	0x1
	.byte	0xea
	.uaword	0x108b
	.uaword	.LLST17
	.uleb128 0x28
	.string	"count"
	.byte	0x1
	.byte	0xea
	.uaword	0x175
	.uaword	.LLST18
	.uleb128 0x25
	.string	"index"
	.byte	0x1
	.byte	0xec
	.uaword	0x175
	.uaword	.LLST19
	.uleb128 0x2c
	.uaword	.Ldebug_ranges0+0x68
	.uleb128 0x2d
	.byte	0x1
	.uaword	.LASF3
	.byte	0x1
	.byte	0xd5
	.uaword	0x1db
	.byte	0x1
	.uaword	0x1051
	.uleb128 0x2e
	.byte	0
	.uleb128 0x36
	.uaword	.LBB40
	.uaword	.LBE40
	.uaword	0x1077
	.uleb128 0x25
	.string	"buf"
	.byte	0x1
	.byte	0xf0
	.uaword	0x873
	.uaword	.LLST20
	.uleb128 0x29
	.uaword	.LVL48
	.uaword	0xe33
	.byte	0
	.uleb128 0x29
	.uaword	.LVL42
	.uaword	0x128e
	.uleb128 0x29
	.uaword	.LVL43
	.uaword	0x128e
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.uaword	0x1091
	.uleb128 0x37
	.uleb128 0x2b
	.byte	0x1
	.string	"kbhit"
	.byte	0x1
	.byte	0xf9
	.byte	0x1
	.uaword	0x1db
	.uaword	.LFB7
	.uaword	.LFE7
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x10db
	.uleb128 0x38
	.uaword	0xd38
	.uaword	.LBB44
	.uaword	.LBE44
	.byte	0x1
	.byte	0xfb
	.uleb128 0x31
	.uaword	.LBB45
	.uaword	.LBE45
	.uleb128 0x32
	.uaword	0xd5a
	.uaword	.LLST21
	.uleb128 0x35
	.uaword	0xd65
	.byte	0x1
	.byte	0x53
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x39
	.uaword	0xdae
	.uaword	.LFB8
	.uaword	.LFE8
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x111b
	.uleb128 0x3a
	.uaword	0xd38
	.uaword	.LBB46
	.uaword	.LBE46
	.byte	0x1
	.uahalf	0x101
	.uleb128 0x31
	.uaword	.LBB47
	.uaword	.LBE47
	.uleb128 0x32
	.uaword	0xd5a
	.uaword	.LLST22
	.uleb128 0x35
	.uaword	0xd65
	.byte	0x1
	.byte	0x53
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.byte	0x1
	.string	"SIMIO_GetByteFromHost"
	.byte	0x1
	.uahalf	0x104
	.byte	0x1
	.uaword	0x1a7
	.uaword	.LFB9
	.uaword	.LFE9
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x11b8
	.uleb128 0x3c
	.uaword	0xdae
	.uaword	.LBB48
	.uaword	.LBE48
	.byte	0x1
	.uahalf	0x109
	.uaword	0x118c
	.uleb128 0x3a
	.uaword	0xd38
	.uaword	.LBB49
	.uaword	.LBE49
	.byte	0x1
	.uahalf	0x101
	.uleb128 0x31
	.uaword	.LBB50
	.uaword	.LBE50
	.uleb128 0x32
	.uaword	0xd5a
	.uaword	.LLST23
	.uleb128 0x32
	.uaword	0xd65
	.uaword	.LLST24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uaword	0xd71
	.uaword	.LBB51
	.uaword	.LBE51
	.byte	0x1
	.uahalf	0x10c
	.uleb128 0x31
	.uaword	.LBB52
	.uaword	.LBE52
	.uleb128 0x32
	.uaword	0xd94
	.uaword	.LLST25
	.uleb128 0x35
	.uaword	0xd9f
	.byte	0x1
	.byte	0x52
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3d
	.byte	0x1
	.string	"SIMIO_PutByteToHost"
	.byte	0x1
	.uahalf	0x10f
	.byte	0x1
	.uaword	.LFB10
	.uaword	.LFE10
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x11fd
	.uleb128 0x3e
	.string	"Data"
	.byte	0x1
	.uahalf	0x10f
	.uaword	0x1a7
	.uaword	.LLST26
	.uleb128 0x3f
	.uaword	.LVL65
	.byte	0x1
	.uaword	0xe33
	.byte	0
	.uleb128 0x40
	.string	"simio_HTBuffer"
	.byte	0x1
	.byte	0x42
	.uaword	0xd19
	.byte	0x5
	.byte	0x3
	.uaword	simio_HTBuffer
	.uleb128 0x40
	.string	"simio_THBuffer"
	.byte	0x1
	.byte	0x43
	.uaword	0xd19
	.byte	0x5
	.byte	0x3
	.uaword	simio_THBuffer
	.uleb128 0x40
	.string	"simio_NonBlockingMode"
	.byte	0x1
	.byte	0x4e
	.uaword	0x1e2
	.byte	0x5
	.byte	0x3
	.uaword	simio_NonBlockingMode
	.uleb128 0x41
	.string	"_impure_ptr"
	.byte	0x5
	.uahalf	0x331
	.uaword	0x69a
	.byte	0x1
	.byte	0x1
	.uleb128 0x42
	.string	"g_JtagSimioAccess"
	.byte	0x1
	.byte	0x45
	.uaword	0xd1e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	g_JtagSimioAccess
	.uleb128 0x43
	.byte	0x1
	.uaword	.LASF3
	.byte	0x1
	.byte	0xd5
	.uaword	0x1db
	.byte	0x1
	.uleb128 0x2e
	.byte	0
	.byte	0
.section .debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
.section .debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LVL3
	.uaword	.LVL6
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL8
	.uaword	.LVL9
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL9
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LVL0
	.uaword	.LVL4
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL4
	.uaword	.LVL5
	.uahalf	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.uaword	.LVL5
	.uaword	.LVL9
	.uahalf	0x1
	.byte	0x53
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LVL1
	.uaword	.LVL2
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LVL10
	.uaword	.LVL11
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL11
	.uaword	.LVL16
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	.LVL16
	.uaword	.LVL17-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL17-1
	.uaword	.LFE4
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LVL13
	.uaword	.LVL14
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL14
	.uaword	.LVL16
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LVL18
	.uaword	.LVL19
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL19
	.uaword	.LFE0
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LVL20
	.uaword	.LVL22-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL22-1
	.uaword	.LVL23
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL23
	.uaword	.LVL24
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	.LVL24
	.uaword	.LVL25
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL25
	.uaword	.LFE5
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LVL20
	.uaword	.LVL21
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL21
	.uaword	.LFE5
	.uahalf	0x1
	.byte	0x6c
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LVL20
	.uaword	.LVL22-1
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL22-1
	.uaword	.LVL23
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL23
	.uaword	.LVL24
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.uaword	.LVL24
	.uaword	.LVL39
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL39
	.uaword	.LFE5
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST9:
	.uaword	.LVL20
	.uaword	.LVL23
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL23
	.uaword	.LVL24
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL24
	.uaword	.LVL30
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL31
	.uaword	.LVL37
	.uahalf	0x1
	.byte	0x57
	.uaword	.LVL37
	.uaword	.LVL38
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL38
	.uaword	.LVL39
	.uahalf	0x1
	.byte	0x57
	.uaword	.LVL39
	.uaword	.LFE5
	.uahalf	0x1
	.byte	0x58
	.uaword	0
	.uaword	0
.LLST10:
	.uaword	.LVL29
	.uaword	.LVL30
	.uahalf	0x1
	.byte	0x6c
	.uaword	.LVL31
	.uaword	.LVL36
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL38
	.uaword	.LFE5
	.uahalf	0x1
	.byte	0x63
	.uaword	0
	.uaword	0
.LLST11:
	.uaword	.LVL26
	.uaword	.LVL28
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST12:
	.uaword	.LVL27
	.uaword	.LVL30
	.uahalf	0x1
	.byte	0x53
	.uaword	0
	.uaword	0
.LLST13:
	.uaword	.LVL32
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL33
	.uaword	.LVL38
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST14:
	.uaword	.LVL34
	.uaword	.LVL38
	.uahalf	0x1
	.byte	0x53
	.uaword	0
	.uaword	0
.LLST15:
	.uaword	.LVL31
	.uaword	.LVL32
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL38
	.uaword	.LFE5
	.uahalf	0x1
	.byte	0x53
	.uaword	0
	.uaword	0
.LLST16:
	.uaword	.LVL40
	.uaword	.LVL42-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL42-1
	.uaword	.LFE6
	.uahalf	0x1
	.byte	0x58
	.uaword	0
	.uaword	0
.LLST17:
	.uaword	.LVL40
	.uaword	.LVL41
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL41
	.uaword	.LVL46
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL46
	.uaword	.LFE6
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x64
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST18:
	.uaword	.LVL40
	.uaword	.LVL42-1
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL42-1
	.uaword	.LVL44
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL44
	.uaword	.LVL45
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.uaword	.LVL45
	.uaword	.LFE6
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST19:
	.uaword	.LVL40
	.uaword	.LVL44
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL44
	.uaword	.LVL45
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL45
	.uaword	.LVL48
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL48
	.uaword	.LVL49
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL49
	.uaword	.LFE6
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST20:
	.uaword	.LVL45
	.uaword	.LVL47
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL47
	.uaword	.LVL48
	.uahalf	0x3
	.byte	0x8f
	.sleb128 -1
	.byte	0x9f
	.uaword	.LVL48
	.uaword	.LFE6
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST21:
	.uaword	.LVL50
	.uaword	.LVL52
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST22:
	.uaword	.LVL53
	.uaword	.LVL55
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST23:
	.uaword	.LVL56
	.uaword	.LVL58
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST24:
	.uaword	.LVL57
	.uaword	.LVL59
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST25:
	.uaword	.LVL60
	.uaword	.LVL61
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL61
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL62
	.uaword	.LVL63
	.uahalf	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL63
	.uaword	.LFE9
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST26:
	.uaword	.LVL64
	.uaword	.LVL65-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL65-1
	.uaword	.LFE10
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	0
	.uaword	0
.section .debug_aranges,"",@progbits
	.uaword	0x5c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.LFB1
	.uaword	.LFE1-.LFB1
	.uaword	.LFB4
	.uaword	.LFE4-.LFB4
	.uaword	.LFB0
	.uaword	.LFE0-.LFB0
	.uaword	.LFB5
	.uaword	.LFE5-.LFB5
	.uaword	.LFB6
	.uaword	.LFE6-.LFB6
	.uaword	.LFB7
	.uaword	.LFE7-.LFB7
	.uaword	.LFB8
	.uaword	.LFE8-.LFB8
	.uaword	.LFB9
	.uaword	.LFE9-.LFB9
	.uaword	.LFB10
	.uaword	.LFE10-.LFB10
	.uaword	0
	.uaword	0
.section .debug_ranges,"",@progbits
.Ldebug_ranges0:
	.uaword	.LBB20
	.uaword	.LBE20
	.uaword	.LBB35
	.uaword	.LBE35
	.uaword	.LBB36
	.uaword	.LBE36
	.uaword	.LBB37
	.uaword	.LBE37
	.uaword	.LBB38
	.uaword	.LBE38
	.uaword	0
	.uaword	0
	.uaword	.LBB24
	.uaword	.LBE24
	.uaword	.LBB31
	.uaword	.LBE31
	.uaword	.LBB33
	.uaword	.LBE33
	.uaword	0
	.uaword	0
	.uaword	.LBB28
	.uaword	.LBE28
	.uaword	.LBB32
	.uaword	.LBE32
	.uaword	0
	.uaword	0
	.uaword	.LBB39
	.uaword	.LBE39
	.uaword	.LBB41
	.uaword	.LBE41
	.uaword	.LBB42
	.uaword	.LBE42
	.uaword	.LBB43
	.uaword	.LBE43
	.uaword	0
	.uaword	0
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LFB9
	.uaword	.LFE9
	.uaword	.LFB10
	.uaword	.LFE10
	.uaword	0
	.uaword	0
.section .debug_line,"",@progbits
.Ldebug_line0:
.section .debug_str,"",@progbits
.LASF1:
	.string	"wReadIndex"
.LASF2:
	.string	"wWriteIndex"
.LASF3:
	.string	"fileno"
.LASF0:
	.string	"_on_exit_args"
	.extern	fileno,STT_FUNC,0
	.extern	_impure_ptr,STT_OBJECT,4
	.ident	"GCC: (HighTec Release HDP-v4.9.3.0-infineon-1.0-fb21a99) 4.9.4 build on 2019-06-07"
