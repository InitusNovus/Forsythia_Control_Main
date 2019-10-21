	.file	"usr_sprintf.c"
.section .text,"ax",@progbits
.Ltext0:
.section .text._cvt,"ax",@progbits
	.align 1
	.type	_cvt, @function
_cvt:
.LFB0:
	.file 1 "0_Src/AppSw/Tricore/HLD/UserInterface/Lcd/usr_sprintf.c"
	.loc 1 24 0
.LVL0:
	sub.a	%SP, 80
.LCFI0:
.LVL1:
	.loc 1 24 0
	mov	%d2, %d5
	.loc 1 29 0
	jnz	%d4, .L2
.LVL2:
	.loc 1 32 0
	mov	%d15, 48
	st.b	[%SP]0, %d15
	lea	%a6, [%SP] 1
.LVL3:
	mov.aa	%a15, %SP
.LVL4:
.L3:
	sub.a	%a15, %a15, %a6
	mov.d	%d2, %a15
	mov.aa	%a3, %a6
	not	%d2
	mov.a	%a15, %d2
	mov.aa	%a2, %a4
.LVL5:
.L8:
	.loc 1 44 0
	st.b	[%a2]0, %d15
	lea	%a7, [%a2] 1
.LVL6:
	lea	%a5, [%a3] -1
.LVL7:
	loop	%a15, .L10
	sub.a	%a15, %a6, %a5
	mov.d	%d2, %a15
	add.a	%a4, %a15
.LVL8:
.L4:
	.loc 1 47 0
	mov	%d15, 0
	st.b	[%a4]0, %d15
	.loc 1 49 0
	ret
.LVL9:
.L10:
	ld.b	%d15, [%a3] -2
	.loc 1 44 0
	mov.aa	%a2, %a7
	mov.aa	%a3, %a5
	j	.L8
.LVL10:
.L2:
	.loc 1 29 0
	mov.aa	%a15, %SP
	mov.aa	%a2, %SP
.LVL11:
.L5:
	.loc 1 38 0
	div.u	%e4, %d4, %d2
.LVL12:
	lea	%a6, [%a2] 1
.LVL13:
	addsc.a	%a3, %a5, %d5, 0
	ld.b	%d15, [%a3]0
	st.b	[%a2]0, %d15
.LVL14:
	mov.aa	%a2, %a6
	.loc 1 36 0
	jnz	%d4, .L5
	.loc 1 42 0
	mov	%d2, 0
.LVL15:
	jne.a	%a6, %a15, .L3
	j	.L4
.LFE0:
	.size	_cvt, .-_cvt
.section .rodata,"a",@progbits
.LC0:
	.string	"0123456789"
.LC1:
	.string	"0123456789abcdef"
.LC2:
	.string	"0123456789ABCDEF"
.section .text.usr_vsprintf,"ax",@progbits
	.align 1
	.global	usr_vsprintf
	.type	usr_vsprintf, @function
usr_vsprintf:
.LFB1:
	.loc 1 52 0
.LVL16:
	.loc 1 112 0
	movh	%d13, hi:.L34
	.loc 1 52 0
	sub.a	%SP, 32
.LCFI1:
	.loc 1 52 0
	mov.aa	%a14, %a4
	mov.aa	%a12, %a5
	.loc 1 53 0
	mov.aa	%a15, %a4
	.loc 1 196 0
	mov	%d11, 13
	.loc 1 188 0
	mov	%d9, 32
	.loc 1 112 0
	addi	%d13, %d13, lo:.L34
.LVL17:
.L16:
	.loc 1 58 0
	ld.b	%d15, [%a12]0
.LVL18:
	jz	%d15, .L93
.LVL19:
.L53:
	.loc 1 62 0
	ne	%d3, %d15, 37
	jz	%d3, .L94
	.loc 1 194 0
	ne	%d3, %d15, 10
	jz	%d3, .L95
.L52:
.LVL20:
	.loc 1 198 0
	st.b	[%a15]0, %d15
	.loc 1 58 0
	add.a	%a12, 1
	ld.b	%d15, [%a12]0
	.loc 1 198 0
	add.a	%a15, 1
.LVL21:
	.loc 1 58 0
	jnz	%d15, .L53
.LVL22:
.L93:
	.loc 1 204 0
	sub.a	%a14, %a15, %a14
.LVL23:
	.loc 1 202 0
	st.b	[%a15]0, %d15
	.loc 1 204 0
	mov.d	%d2, %a14
	ret
.LVL24:
.L94:
	.loc 1 64 0
	ld.b	%d15, [%a12] 1
.LVL25:
	lea	%a2, [%a12] 2
.LVL26:
	.loc 1 66 0
	eq	%d3, %d15, 45
	.loc 1 65 0
	mov	%d10, 0
	.loc 1 66 0
	jnz	%d3, .L96
.LVL27:
.L19:
	.loc 1 71 0
	ne	%d3, %d15, 48
	.loc 1 78 0
	mov	%d12, 0
	.loc 1 71 0
	jz	%d3, .L97
.LVL28:
.L20:
	.loc 1 80 0
	addi	%d3, %d15, -48
	and	%d4, %d3, 255
	mov.aa	%a12, %a2
	mov	%d8, 0
	jge.u	%d4, 10, .L21
.LVL29:
.L22:
	.loc 1 83 0
	ld.b	%d15, [%a2]0
.LVL30:
	.loc 1 82 0
	madd	%d8, %d3, %d8, 10
.LVL31:
	.loc 1 80 0
	addi	%d3, %d15, -48
	.loc 1 83 0
	lea	%a12, [%a2] 1
.LVL32:
	.loc 1 80 0
	and	%d4, %d3, 255
	.loc 1 83 0
	mov.aa	%a2, %a12
	.loc 1 80 0
	jlt.u	%d4, 10, .L22
.LVL33:
.L21:
	.loc 1 85 0
	ne	%d3, %d15, 46
	jz	%d3, .L98
.LVL34:
.L23:
	.loc 1 101 0
	andn	%d3, %d15, ~(-5)
	ne	%d3, %d3, 104
	jnz	%d3, .L25
.LVL35:
	.loc 1 103 0
	ld.b	%d15, [%a12]0
.LVL36:
	add.a	%a12, 1
.LVL37:
.L25:
	.loc 1 105 0
	eq	%d3, %d15, 100
	jnz	%d3, .L27
	ge	%d3, %d15, 101
	jnz	%d3, .L28
	eq	%d2, %d15, 88
	jnz	%d2, .L27
	eq	%d2, %d15, 99
	jnz	%d2, .L29
	eq	%d2, %d15, 37
	jnz	%d2, .L90
.LVL38:
.L26:
	.loc 1 144 0
	mov	%d15, 63
.LVL39:
.L90:
	st.b	[%a15]0, %d15
	mov	%d3, -1
	add.a	%a15, 1
	.loc 1 61 0
	mov	%d2, 0
	.loc 1 60 0
	mov.aa	%a13, %SP
.LVL40:
.L32:
	.loc 1 146 0
	sub	%d8, %d2
.LVL41:
.L41:
	mov	%d4, 0
	.loc 1 151 0
	jz	%d12, .L44
.L43:
.LVL42:
	.loc 1 164 0
	jz	%d10, .L63
.LVL43:
	.loc 1 175 0
	jlez	%d2, .L56
.LVL44:
.L55:
	.loc 1 180 0
	mov.d	%d2, %a13
	mov.d	%d15, %a13
	not	%d2
	addi	%d4, %d3, 1
	add	%d15, %d2
	add	%d15, %d4
	ge	%d3, %d3, 0
	sel	%d3, %d3, %d15, 0
	mov.a	%a2, %d3
	.loc 1 173 0
	mov.aa	%a3, %a13
.L50:
.LVL45:
	.loc 1 177 0
	ld.b	%d15, [%a3]0
	lea	%a7, [%a3] 1
.LVL46:
	.loc 1 178 0
	ne	%d3, %d15, 10
	mov.aa	%a3, %a15
.LVL47:
	jz	%d3, .L99
.LVL48:
.L49:
	.loc 1 182 0
	st.b	[%a3]0, %d15
	lea	%a15, [%a3] 1
.LVL49:
	.loc 1 177 0
	mov.aa	%a3, %a7
	loop	%a2, .L50
.LVL50:
	.loc 1 184 0
	jz	%d10, .L16
.LVL51:
.L56:
	.loc 1 186 0
	jlez	%d8, .L16
	.loc 1 188 0
	mov.d	%d15, %a15
	addsc.a	%a2, %a15, %d8, 0
	not	%d15
	addsc.a	%a2, %a2, %d15, 0
.L51:
.LVL52:
	st.b	[%a15]0, %d9
	add.a	%a15, 1
.LVL53:
	loop	%a2, .L51
	j	.L16
.LVL54:
.L35:
	.loc 1 115 0
	jgez	%d4, .L38
.LVL55:
	.loc 1 122 0
	movh.a	%a5, hi:.LC0
	rsub	%d4
.LVL56:
	mov.aa	%a4, %SP
	mov	%d5, 10
	lea	%a5, [%a5] lo:.LC0
	call	_cvt
.LVL57:
	.loc 1 146 0
	sub	%d8, %d2
.LVL58:
	.loc 1 149 0
	add	%d8, -1
.LVL59:
	.loc 1 151 0
	jnz	%d12, .L39
	.loc 1 111 0
	mov.aa	%a6, %a13
	addi	%d3, %d2, -1
	.loc 1 60 0
	mov.aa	%a13, %SP
.LVL60:
	.loc 1 151 0
	mov	%d4, 45
.LVL61:
.L44:
	mov	%d15, 32
	.loc 1 164 0
	jnz	%d10, .L45
	.loc 1 166 0
	addi	%d5, %d8, -1
.LVL62:
	jlez	%d8, .L61
.LVL63:
.L101:
	mov.d	%d5, %a15
.LVL64:
	addsc.a	%a5, %a15, %d8, 0
	not	%d5
	addsc.a	%a5, %a5, %d5, 0
.L46:
.LVL65:
	.loc 1 168 0
	st.b	[%a15]0, %d15
.LVL66:
	add.a	%a15, 1
.LVL67:
	loop	%a5, .L46
.LVL68:
	mov	%d8, -1
.LVL69:
.L45:
	.loc 1 171 0
	jz	%d4, .L47
.LVL70:
	.loc 1 173 0
	st.b	[%a15]0, %d4
	add.a	%a15, 1
.LVL71:
.L47:
	.loc 1 175 0
	jgtz	%d2, .L55
	.loc 1 184 0
	jz	%d10, .L16
	j	.L56
.LVL72:
.L99:
	.loc 1 180 0
	add.a	%a3, 1
.LVL73:
	st.b	[%a15]0, %d11
.LVL74:
	j	.L49
.LVL75:
.L95:
	.loc 1 196 0
	st.b	[%a15]0, %d11
	add.a	%a15, 1
.LVL76:
	j	.L52
.LVL77:
.L28:
	.loc 1 105 0
	eq	%d2, %d15, 117
	jnz	%d2, .L27
	eq	%d2, %d15, 120
	jnz	%d2, .L27
	eq	%d15, %d15, 115
.LVL78:
	jz	%d15, .L26
	.loc 1 133 0
	ld.a	%a13, [%a6]0
	mov.d	%d15, %a6
	.loc 1 134 0
	mov.aa	%a4, %a13
	call	strlen
.LVL79:
	.loc 1 133 0
	add	%d15, 4
.LVL80:
	addi	%d3, %d2, -1
	mov.a	%a6, %d15
	.loc 1 135 0
	j	.L32
.LVL81:
.L98:
	.loc 1 87 0
	ld.b	%d15, [%a12]0
	lea	%a2, [%a12] 1
.LVL82:
	.loc 1 89 0
	addi	%d2, %d15, -48
	and	%d2, %d2, 255
	.loc 1 88 0
	add	%d12, 1
.LVL83:
	.loc 1 87 0
	mov.aa	%a12, %a2
	.loc 1 89 0
	jge.u	%d2, 10, .L23
.LVL84:
.L24:
	.loc 1 92 0
	ld.b	%d15, [%a2]0
.LVL85:
	lea	%a12, [%a2] 1
.LVL86:
	.loc 1 89 0
	addi	%d3, %d15, -48
	and	%d3, %d3, 255
	.loc 1 92 0
	mov.aa	%a2, %a12
	.loc 1 89 0
	jlt.u	%d3, 10, .L24
	j	.L23
.LVL87:
.L97:
	.loc 1 74 0
	ld.b	%d15, [%a2]0
.LVL88:
	.loc 1 73 0
	mov	%d12, 1
	.loc 1 74 0
	add.a	%a2, 1
.LVL89:
	j	.L20
.LVL90:
.L96:
	.loc 1 68 0
	lea	%a2, [%a12] 3
.LVL91:
	ld.b	%d15, [%a12] 2
.LVL92:
	.loc 1 69 0
	mov	%d10, 1
	j	.L19
.LVL93:
.L27:
	.loc 1 112 0
	addi	%d15, %d15, -88
.LVL94:
	ge.u	%d2, %d15, 33
	.loc 1 111 0
	lea	%a13, [%a6] 4
.LVL95:
	ld.w	%d4, [%a6]0
.LVL96:
	.loc 1 112 0
	jz	%d2, .L100
.L60:
	.loc 1 111 0
	mov.aa	%a6, %a13
	.loc 1 112 0
	mov	%d3, -1
	.loc 1 61 0
	mov	%d2, 0
	.loc 1 60 0
	mov.aa	%a13, %SP
.LVL97:
	j	.L32
.LVL98:
.L63:
	.loc 1 164 0
	mov	%d4, 0
	mov	%d15, 48
	.loc 1 166 0
	addi	%d5, %d8, -1
.LVL99:
	jgtz	%d8, .L101
.LVL100:
.L61:
	mov	%d8, %d5
	j	.L45
.LVL101:
.L29:
	.loc 1 137 0
	ld.w	%d15, [%a6]0
	add.a	%a6, 4
.LVL102:
	st.b	[%a15]0, %d15
.LVL103:
	.loc 1 138 0
	add.a	%a15, 1
.LVL104:
	.loc 1 139 0
	j	.L16
.LVL105:
.L100:
	.loc 1 112 0
	mov.a	%a3, %d13
	addsc.a	%a2, %a3, %d15, 2
	ji	%a2
	.align 2
	.align 2
.L34:
	.code32
	j	.L33
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L35
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L38
	.code32
	j	.L60
	.code32
	j	.L60
	.code32
	j	.L37
.L38:
	.loc 1 122 0
	movh.a	%a5, hi:.LC0
	mov.aa	%a4, %SP
	mov	%d5, 10
	lea	%a5, [%a5] lo:.LC0
	call	_cvt
.LVL106:
	.loc 1 111 0
	mov.aa	%a6, %a13
	.loc 1 146 0
	sub	%d8, %d2
.LVL107:
	addi	%d3, %d2, -1
	.loc 1 60 0
	mov.aa	%a13, %SP
.LVL108:
	j	.L41
.LVL109:
.L37:
	.loc 1 125 0
	movh.a	%a5, hi:.LC1
	mov.aa	%a4, %SP
	mov	%d5, 16
	lea	%a5, [%a5] lo:.LC1
	call	_cvt
.LVL110:
	.loc 1 111 0
	mov.aa	%a6, %a13
	addi	%d3, %d2, -1
	.loc 1 60 0
	mov.aa	%a13, %SP
.LVL111:
	.loc 1 126 0
	j	.L32
.LVL112:
.L33:
	.loc 1 128 0
	movh.a	%a5, hi:.LC2
	mov.aa	%a4, %SP
	mov	%d5, 16
	lea	%a5, [%a5] lo:.LC2
	call	_cvt
.LVL113:
	.loc 1 111 0
	mov.aa	%a6, %a13
	addi	%d3, %d2, -1
	.loc 1 60 0
	mov.aa	%a13, %SP
.LVL114:
	.loc 1 129 0
	j	.L32
.LVL115:
.L39:
	.loc 1 156 0
	mov	%d15, 45
	st.b	[%a15]0, %d15
.LVL116:
	mov.aa	%a6, %a13
	addi	%d3, %d2, -1
	add.a	%a15, 1
.LVL117:
	mov.aa	%a13, %SP
.LVL118:
	j	.L43
.LFE1:
	.size	usr_vsprintf, .-usr_vsprintf
.section .text.usr_sprintf,"ax",@progbits
	.align 1
	.global	usr_sprintf
	.type	usr_sprintf, @function
usr_sprintf:
.LFB2:
	.loc 1 208 0
.LVL119:
	.loc 1 214 0
	mov.aa	%a6, %SP
.LVL120:
	.loc 1 218 0
	j	vsprintf
.LVL121:
.LFE2:
	.size	usr_sprintf, .-usr_sprintf
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
	.uaword	.LFB0
	.uaword	.LFE0-.LFB0
	.byte	0x4
	.uaword	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x50
	.align 2
.LEFDE0:
.LSFDE2:
	.uaword	.LEFDE2-.LASFDE2
.LASFDE2:
	.uaword	.Lframe0
	.uaword	.LFB1
	.uaword	.LFE1-.LFB1
	.byte	0x4
	.uaword	.LCFI1-.LFB1
	.byte	0xe
	.uleb128 0x20
	.align 2
.LEFDE2:
.LSFDE4:
	.uaword	.LEFDE4-.LASFDE4
.LASFDE4:
	.uaword	.Lframe0
	.uaword	.LFB2
	.uaword	.LFE2-.LFB2
	.align 2
.LEFDE4:
.section .text,"ax",@progbits
.Letext0:
	.file 2 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\lib\\gcc\\tricore\\4.9.4\\include\\stddef.h"
	.file 3 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\lib\\gcc\\tricore\\4.9.4\\include\\stdarg.h"
	.file 4 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\tricore\\include\\string.h"
	.file 5 "c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\tricore\\include\\stdio.h"
.section .debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x5ba
	.uahalf	0x3
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.string	"GNU C 4.9.4 build on 2019-06-07 -mlicense-dir=c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\bin\\../lib/gcc/tricore/4.9.4/../../../../licenses -mtc161 -g -O2 -std=c99 -fno-common -fstrict-volatile-bitfields -ffunction-sections -fdata-sections"
	.byte	0x1
	.string	"0_Src/AppSw/Tricore/HLD/UserInterface/Lcd/usr_sprintf.c"
	.string	"C:\\\\Google drive\\\\RH_Workspace\\\\__RH26_Control_Base_TC275"
	.uaword	.Ldebug_ranges0+0
	.uaword	0
	.uaword	0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.string	"size_t"
	.byte	0x2
	.byte	0xd4
	.uaword	0x195
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.string	"long unsigned int"
	.uleb128 0x2
	.string	"__gnuc_va_list"
	.byte	0x3
	.byte	0x28
	.uaword	0x1c0
	.uleb128 0x4
	.byte	0x4
	.string	"__builtin_va_list"
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"long int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.string	"sizetype"
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.uaword	0x279
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.string	"char"
	.uleb128 0x6
	.byte	0x4
	.uaword	0x287
	.uleb128 0x7
	.uaword	0x279
	.uleb128 0x2
	.string	"va_list"
	.byte	0x3
	.byte	0x62
	.uaword	0x1aa
	.uleb128 0x8
	.string	"_cvt"
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.uaword	0x217
	.uaword	.LFB0
	.uaword	.LFE0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x329
	.uleb128 0x9
	.string	"val"
	.byte	0x1
	.byte	0x17
	.uaword	0x195
	.uaword	.LLST0
	.uleb128 0x9
	.string	"buf"
	.byte	0x1
	.byte	0x17
	.uaword	0x273
	.uaword	.LLST1
	.uleb128 0x9
	.string	"radix"
	.byte	0x1
	.byte	0x17
	.uaword	0x259
	.uaword	.LLST2
	.uleb128 0x9
	.string	"digits"
	.byte	0x1
	.byte	0x17
	.uaword	0x273
	.uaword	.LLST3
	.uleb128 0xa
	.string	"temp"
	.byte	0x1
	.byte	0x19
	.uaword	0x329
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xb
	.string	"cp"
	.byte	0x1
	.byte	0x1a
	.uaword	0x273
	.uaword	.LLST4
	.uleb128 0xb
	.string	"length"
	.byte	0x1
	.byte	0x1b
	.uaword	0x217
	.uaword	.LLST5
	.byte	0
	.uleb128 0xc
	.uaword	0x279
	.uaword	0x339
	.uleb128 0xd
	.uaword	0x265
	.byte	0x4f
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.string	"usr_vsprintf"
	.byte	0x1
	.byte	0x33
	.byte	0x1
	.uaword	0x217
	.uaword	.LFB1
	.uaword	.LFE1
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x4f3
	.uleb128 0x9
	.string	"dest"
	.byte	0x1
	.byte	0x33
	.uaword	0x273
	.uaword	.LLST6
	.uleb128 0x9
	.string	"fmt"
	.byte	0x1
	.byte	0x33
	.uaword	0x281
	.uaword	.LLST7
	.uleb128 0x9
	.string	"ap"
	.byte	0x1
	.byte	0x33
	.uaword	0x28c
	.uaword	.LLST8
	.uleb128 0xb
	.string	"c"
	.byte	0x1
	.byte	0x35
	.uaword	0x279
	.uaword	.LLST9
	.uleb128 0xb
	.string	"sign"
	.byte	0x1
	.byte	0x35
	.uaword	0x279
	.uaword	.LLST10
	.uleb128 0xb
	.string	"cp"
	.byte	0x1
	.byte	0x35
	.uaword	0x273
	.uaword	.LLST11
	.uleb128 0xb
	.string	"dp"
	.byte	0x1
	.byte	0x35
	.uaword	0x273
	.uaword	.LLST12
	.uleb128 0xb
	.string	"left_prec"
	.byte	0x1
	.byte	0x36
	.uaword	0x217
	.uaword	.LLST13
	.uleb128 0xb
	.string	"right_prec"
	.byte	0x1
	.byte	0x36
	.uaword	0x217
	.uaword	.LLST14
	.uleb128 0xb
	.string	"zero_fill"
	.byte	0x1
	.byte	0x36
	.uaword	0x217
	.uaword	.LLST15
	.uleb128 0xb
	.string	"length"
	.byte	0x1
	.byte	0x36
	.uaword	0x217
	.uaword	.LLST16
	.uleb128 0xb
	.string	"pad"
	.byte	0x1
	.byte	0x36
	.uaword	0x217
	.uaword	.LLST17
	.uleb128 0xb
	.string	"pad_on_right"
	.byte	0x1
	.byte	0x36
	.uaword	0x217
	.uaword	.LLST18
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x37
	.uaword	0x4f3
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.string	"val"
	.byte	0x1
	.byte	0x38
	.uaword	0x259
	.uaword	.LLST19
	.uleb128 0xf
	.uaword	.LVL57
	.uaword	0x29b
	.uaword	0x47c
	.uleb128 0x10
	.byte	0x1
	.byte	0x65
	.byte	0x5
	.byte	0x3
	.uaword	.LC0
	.uleb128 0x10
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x3a
	.uleb128 0x10
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8a
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.uaword	.LVL79
	.uaword	0x57f
	.uaword	0x490
	.uleb128 0x10
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8d
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.uaword	.LVL106
	.uaword	0x29b
	.uaword	0x4b2
	.uleb128 0x10
	.byte	0x1
	.byte	0x65
	.byte	0x5
	.byte	0x3
	.uaword	.LC0
	.uleb128 0x10
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x3a
	.uleb128 0x10
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8a
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.uaword	.LVL110
	.uaword	0x29b
	.uaword	0x4d4
	.uleb128 0x10
	.byte	0x1
	.byte	0x65
	.byte	0x5
	.byte	0x3
	.uaword	.LC1
	.uleb128 0x10
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x40
	.uleb128 0x10
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8a
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.uaword	.LVL113
	.uaword	0x29b
	.uleb128 0x10
	.byte	0x1
	.byte	0x65
	.byte	0x5
	.byte	0x3
	.uaword	.LC2
	.uleb128 0x10
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x40
	.uleb128 0x10
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8a
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uaword	0x279
	.uaword	0x503
	.uleb128 0xd
	.uaword	0x265
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.string	"usr_sprintf"
	.byte	0x1
	.byte	0xcf
	.byte	0x1
	.uaword	0x217
	.uaword	.LFB2
	.uaword	.LFE2
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x57f
	.uleb128 0x9
	.string	"buf"
	.byte	0x1
	.byte	0xcf
	.uaword	0x273
	.uaword	.LLST20
	.uleb128 0x9
	.string	"fmt"
	.byte	0x1
	.byte	0xcf
	.uaword	0x281
	.uaword	.LLST21
	.uleb128 0x12
	.uleb128 0x13
	.string	"ret"
	.byte	0x1
	.byte	0xd1
	.uaword	0x217
	.uleb128 0xb
	.string	"ap"
	.byte	0x1
	.byte	0xd2
	.uaword	0x28c
	.uaword	.LLST22
	.uleb128 0x14
	.uaword	.LVL121
	.byte	0x1
	.uaword	0x59a
	.uleb128 0x10
	.byte	0x1
	.byte	0x66
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.byte	0x1
	.byte	0x65
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x10
	.byte	0x1
	.byte	0x64
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.string	"strlen"
	.byte	0x4
	.byte	0x22
	.byte	0x1
	.uaword	0x187
	.byte	0x1
	.uaword	0x59a
	.uleb128 0x16
	.uaword	0x281
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.string	"vsprintf"
	.byte	0x5
	.byte	0xc4
	.byte	0x1
	.uaword	0x217
	.byte	0x1
	.uleb128 0x16
	.uaword	0x273
	.uleb128 0x16
	.uaword	0x281
	.uleb128 0x16
	.uaword	0x271
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
.section .debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LVL0
	.uaword	.LVL4
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL10
	.uaword	.LVL12
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL14
	.uaword	.LFE0
	.uahalf	0x1
	.byte	0x54
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LVL0
	.uaword	.LVL5
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL5
	.uaword	.LVL6
	.uahalf	0x1
	.byte	0x62
	.uaword	.LVL6
	.uaword	.LVL8
	.uahalf	0x1
	.byte	0x67
	.uaword	.LVL9
	.uaword	.LVL10
	.uahalf	0x1
	.byte	0x67
	.uaword	.LVL10
	.uaword	.LFE0
	.uahalf	0x1
	.byte	0x64
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LVL0
	.uaword	.LVL10
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL10
	.uaword	.LVL15
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL15
	.uaword	.LFE0
	.uahalf	0x1
	.byte	0x55
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LVL0
	.uaword	.LVL5
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL5
	.uaword	.LVL10
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	.LVL10
	.uaword	.LFE0
	.uahalf	0x1
	.byte	0x65
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LVL1
	.uaword	.LVL2
	.uahalf	0x1
	.byte	0x6a
	.uaword	.LVL2
	.uaword	.LVL3
	.uahalf	0x4
	.byte	0x91
	.sleb128 -79
	.byte	0x9f
	.uaword	.LVL3
	.uaword	.LVL5
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL5
	.uaword	.LVL7
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL7
	.uaword	.LVL8
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL9
	.uaword	.LVL10
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL10
	.uaword	.LVL11
	.uahalf	0x1
	.byte	0x6a
	.uaword	.LVL11
	.uaword	.LVL13
	.uahalf	0x1
	.byte	0x62
	.uaword	.LVL13
	.uaword	.LFE0
	.uahalf	0x1
	.byte	0x66
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LVL1
	.uaword	.LVL5
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL10
	.uaword	.LFE0
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LVL16
	.uaword	.LVL17
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL17
	.uaword	.LVL23
	.uahalf	0x1
	.byte	0x6e
	.uaword	.LVL23
	.uaword	.LVL24
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x64
	.byte	0x9f
	.uaword	.LVL24
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x6e
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LVL16
	.uaword	.LVL17
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL17
	.uaword	.LVL19
	.uahalf	0x3
	.byte	0x8c
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL21
	.uaword	.LVL22
	.uahalf	0x3
	.byte	0x8c
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL24
	.uaword	.LVL26
	.uahalf	0x3
	.byte	0x8c
	.sleb128 2
	.byte	0x9f
	.uaword	.LVL26
	.uaword	.LVL32
	.uahalf	0x1
	.byte	0x62
	.uaword	.LVL32
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6c
	.uaword	.LVL33
	.uaword	.LVL35
	.uahalf	0x1
	.byte	0x62
	.uaword	.LVL35
	.uaword	.LVL37
	.uahalf	0x3
	.byte	0x82
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL37
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x6c
	.uaword	.LVL77
	.uaword	.LVL81
	.uahalf	0x1
	.byte	0x6c
	.uaword	.LVL81
	.uaword	.LVL86
	.uahalf	0x1
	.byte	0x62
	.uaword	.LVL86
	.uaword	.LVL87
	.uahalf	0x1
	.byte	0x6c
	.uaword	.LVL87
	.uaword	.LVL89
	.uahalf	0x3
	.byte	0x82
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL89
	.uaword	.LVL93
	.uahalf	0x1
	.byte	0x62
	.uaword	.LVL93
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x6c
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LVL16
	.uaword	.LVL54
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL54
	.uaword	.LVL60
	.uahalf	0x1
	.byte	0x6d
	.uaword	.LVL60
	.uaword	.LVL79-1
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL79-1
	.uaword	.LVL81
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL81
	.uaword	.LVL95
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL95
	.uaword	.LVL97
	.uahalf	0x1
	.byte	0x6d
	.uaword	.LVL97
	.uaword	.LVL101
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL101
	.uaword	.LVL102
	.uahalf	0x3
	.byte	0x86
	.sleb128 4
	.byte	0x9f
	.uaword	.LVL102
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL105
	.uaword	.LVL108
	.uahalf	0x1
	.byte	0x6d
	.uaword	.LVL108
	.uaword	.LVL109
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL109
	.uaword	.LVL111
	.uahalf	0x1
	.byte	0x6d
	.uaword	.LVL111
	.uaword	.LVL112
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL112
	.uaword	.LVL114
	.uahalf	0x1
	.byte	0x6d
	.uaword	.LVL114
	.uaword	.LVL115
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL115
	.uaword	.LVL118
	.uahalf	0x1
	.byte	0x6d
	.uaword	.LVL118
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x66
	.uaword	0
	.uaword	0
.LLST9:
	.uaword	.LVL18
	.uaword	.LVL19
	.uahalf	0x2
	.byte	0x8c
	.sleb128 0
	.uaword	.LVL21
	.uaword	.LVL22
	.uahalf	0x2
	.byte	0x8c
	.sleb128 0
	.uaword	.LVL25
	.uaword	.LVL30
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL32
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL34
	.uaword	.LVL35
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL35
	.uaword	.LVL36
	.uahalf	0x2
	.byte	0x82
	.sleb128 0
	.uaword	.LVL36
	.uaword	.LVL38
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL42
	.uaword	.LVL44
	.uahalf	0x3
	.byte	0x8
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL46
	.uaword	.LVL47
	.uahalf	0x2
	.byte	0x83
	.sleb128 0
	.uaword	.LVL47
	.uaword	.LVL48
	.uahalf	0x2
	.byte	0x87
	.sleb128 -1
	.uaword	.LVL48
	.uaword	.LVL51
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL54
	.uaword	.LVL61
	.uahalf	0x4
	.byte	0x7f
	.sleb128 88
	.byte	0x9f
	.uaword	.LVL61
	.uaword	.LVL63
	.uahalf	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.uaword	.LVL72
	.uaword	.LVL74
	.uahalf	0x2
	.byte	0x87
	.sleb128 -1
	.uaword	.LVL74
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL77
	.uaword	.LVL78
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL82
	.uaword	.LVL85
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL86
	.uaword	.LVL87
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL87
	.uaword	.LVL88
	.uahalf	0x2
	.byte	0x82
	.sleb128 0
	.uaword	.LVL88
	.uaword	.LVL91
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL91
	.uaword	.LVL92
	.uahalf	0x2
	.byte	0x8c
	.sleb128 2
	.uaword	.LVL92
	.uaword	.LVL94
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL94
	.uaword	.LVL98
	.uahalf	0x4
	.byte	0x7f
	.sleb128 88
	.byte	0x9f
	.uaword	.LVL98
	.uaword	.LVL100
	.uahalf	0x3
	.byte	0x8
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL101
	.uaword	.LVL102
	.uahalf	0x2
	.byte	0x86
	.sleb128 0
	.uaword	.LVL102
	.uaword	.LVL103
	.uahalf	0x2
	.byte	0x86
	.sleb128 -4
	.uaword	.LVL105
	.uaword	.LVL115
	.uahalf	0x4
	.byte	0x7f
	.sleb128 88
	.byte	0x9f
	.uaword	.LVL115
	.uaword	.LFE1
	.uahalf	0x3
	.byte	0x8
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST10:
	.uaword	.LVL34
	.uaword	.LVL44
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL54
	.uaword	.LVL55
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL55
	.uaword	.LVL61
	.uahalf	0x3
	.byte	0x8
	.byte	0x2d
	.byte	0x9f
	.uaword	.LVL61
	.uaword	.LVL63
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL77
	.uaword	.LVL81
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL93
	.uaword	.LVL100
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL101
	.uaword	.LVL115
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL115
	.uaword	.LVL116
	.uahalf	0x3
	.byte	0x8
	.byte	0x2d
	.byte	0x9f
	.uaword	.LVL116
	.uaword	.LFE1
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST11:
	.uaword	.LVL19
	.uaword	.LVL22
	.uahalf	0x1
	.byte	0x6a
	.uaword	.LVL24
	.uaword	.LVL40
	.uahalf	0x1
	.byte	0x6a
	.uaword	.LVL45
	.uaword	.LVL46
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL46
	.uaword	.LVL50
	.uahalf	0x1
	.byte	0x67
	.uaword	.LVL50
	.uaword	.LVL51
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL54
	.uaword	.LVL61
	.uahalf	0x1
	.byte	0x6a
	.uaword	.LVL72
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x67
	.uaword	.LVL75
	.uaword	.LVL80
	.uahalf	0x1
	.byte	0x6a
	.uaword	.LVL81
	.uaword	.LVL98
	.uahalf	0x1
	.byte	0x6a
	.uaword	.LVL101
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x6a
	.uaword	0
	.uaword	0
.LLST12:
	.uaword	.LVL16
	.uaword	.LVL17
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL20
	.uaword	.LVL21
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL21
	.uaword	.LVL22
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL38
	.uaword	.LVL39
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL48
	.uaword	.LVL49
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL49
	.uaword	.LVL51
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL52
	.uaword	.LVL53
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL53
	.uaword	.LVL54
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL65
	.uaword	.LVL67
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LVL69
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL70
	.uaword	.LVL71
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL73
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL75
	.uaword	.LVL76
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL76
	.uaword	.LVL77
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL101
	.uaword	.LVL104
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL104
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL115
	.uaword	.LVL117
	.uahalf	0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.uaword	.LVL117
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST13:
	.uaword	.LVL25
	.uaword	.LVL29
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL29
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL87
	.uaword	.LVL93
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST14:
	.uaword	.LVL25
	.uaword	.LVL34
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL81
	.uaword	.LVL83
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL87
	.uaword	.LVL93
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST15:
	.uaword	.LVL28
	.uaword	.LVL29
	.uahalf	0x1
	.byte	0x5c
	.uaword	.LVL34
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x5c
	.uaword	.LVL77
	.uaword	.LVL81
	.uahalf	0x1
	.byte	0x5c
	.uaword	.LVL83
	.uaword	.LVL87
	.uahalf	0x1
	.byte	0x5c
	.uaword	.LVL87
	.uaword	.LVL90
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL93
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x5c
	.uaword	0
	.uaword	0
.LLST16:
	.uaword	.LVL19
	.uaword	.LVL22
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL24
	.uaword	.LVL40
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL40
	.uaword	.LVL43
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL54
	.uaword	.LVL57
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL57
	.uaword	.LVL71
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL75
	.uaword	.LVL80
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL80
	.uaword	.LVL81
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL81
	.uaword	.LVL98
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL98
	.uaword	.LVL101
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL101
	.uaword	.LVL106
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL106
	.uaword	.LVL109
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL109
	.uaword	.LVL110
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL110
	.uaword	.LVL112
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL112
	.uaword	.LVL113
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL113
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST17:
	.uaword	.LVL41
	.uaword	.LVL44
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL58
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL62
	.uaword	.LVL64
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL66
	.uaword	.LVL68
	.uahalf	0xa
	.byte	0x8f
	.sleb128 0
	.byte	0x20
	.byte	0x8f
	.sleb128 0
	.byte	0x22
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.uaword	.LVL68
	.uaword	.LVL69
	.uahalf	0x3
	.byte	0x9
	.byte	0xfe
	.byte	0x9f
	.uaword	.LVL98
	.uaword	.LVL99
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL99
	.uaword	.LVL101
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL107
	.uaword	.LVL109
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL115
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x58
	.uaword	0
	.uaword	0
.LLST18:
	.uaword	.LVL25
	.uaword	.LVL27
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL27
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x5a
	.uaword	.LVL77
	.uaword	.LVL90
	.uahalf	0x1
	.byte	0x5a
	.uaword	.LVL90
	.uaword	.LVL92
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL92
	.uaword	.LVL93
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL93
	.uaword	.LFE1
	.uahalf	0x1
	.byte	0x5a
	.uaword	0
	.uaword	0
.LLST19:
	.uaword	.LVL54
	.uaword	.LVL55
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL55
	.uaword	.LVL56
	.uahalf	0x4
	.byte	0x74
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.uaword	.LVL56
	.uaword	.LVL57-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL96
	.uaword	.LVL98
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL105
	.uaword	.LVL106-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL109
	.uaword	.LVL110-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL112
	.uaword	.LVL113-1
	.uahalf	0x1
	.byte	0x54
	.uaword	0
	.uaword	0
.LLST20:
	.uaword	.LVL119
	.uaword	.LVL121-1
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL121-1
	.uaword	.LFE2
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x64
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST21:
	.uaword	.LVL119
	.uaword	.LVL121-1
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL121-1
	.uaword	.LFE2
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST22:
	.uaword	.LVL119
	.uaword	.LVL120
	.uahalf	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x9f
	.uaword	.LVL120
	.uaword	.LVL121-1
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL121-1
	.uaword	.LFE2
	.uahalf	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x9f
	.uaword	0
	.uaword	0
.section .debug_aranges,"",@progbits
	.uaword	0x2c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.LFB0
	.uaword	.LFE0-.LFB0
	.uaword	.LFB1
	.uaword	.LFE1-.LFB1
	.uaword	.LFB2
	.uaword	.LFE2-.LFB2
	.uaword	0
	.uaword	0
.section .debug_ranges,"",@progbits
.Ldebug_ranges0:
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	0
	.uaword	0
.section .debug_line,"",@progbits
.Ldebug_line0:
.section .debug_str,"",@progbits
	.extern	vsprintf,STT_FUNC,0
	.extern	strlen,STT_FUNC,0
	.ident	"GCC: (HighTec Release HDP-v4.9.3.0-infineon-1.0-fb21a99) 4.9.4 build on 2019-06-07"
