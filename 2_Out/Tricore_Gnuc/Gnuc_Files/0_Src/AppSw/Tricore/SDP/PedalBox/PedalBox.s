	.file	"PedalBox.c"
.section .text,"ax",@progbits
.Ltext0:
.section .text.SDP_PedalBox_getPedalLinear.isra.0,"ax",@progbits
	.align 1
	.type	SDP_PedalBox_getPedalLinear.isra.0, @function
SDP_PedalBox_getPedalLinear.isra.0:
.LFB269:
	.file 1 "0_Src/AppSw/Tricore/SDP/PedalBox/PedalBox.c"
	.loc 1 190 0
.LVL0:
	.loc 1 205 0
	ld.w	%d3, [%a4] 24
	mov	%d15, 0
	cmp.f	%d15, %d3, %d15
	.loc 1 201 0
	ld.w	%d2, [%a4] 20
.LVL1:
	.loc 1 205 0
	jnz.t	%d15, 0, .L23
	.loc 1 214 0
	movh	%d3, 17096
	cmp.f	%d15, %d2, %d3
	or.t	%d15, %d15,2, %d15,1
	jz	%d15, .L21
.LVL2:
	.loc 1 216 0
	sub.f	%d2, %d2, %d3
.LVL3:
	.loc 1 217 0
	cmp.f	%d2, %d2, %d4
.LVL4:
	jnz.t	%d2, 2, .L8
.LVL5:
.L4:
	.loc 1 230 0
	ld.w	%d15, [%a4] 28
.LVL6:
	.loc 1 231 0
	ld.w	%d5, [%a4] 32
.LVL7:
	.loc 1 234 0
	cmp.f	%d3, %d15, %d4
	.loc 1 232 0
	ld.w	%d2, [%a4] 36
.LVL8:
	.loc 1 234 0
	jz.t	%d3, 0, .L10
	cmp.f	%d5, %d5, %d4
.LVL9:
	jnz.t	%d5, 2, .L24
.L10:
	.loc 1 238 0
	cmp.f	%d4, %d15, %d4
.LVL10:
	.loc 1 240 0
	mov	%d2, 0
.LVL11:
	.loc 1 238 0
	jnz.t	%d4, 2, .L13
	.loc 1 244 0
	movh	%d2, 17096
.L13:
.LVL12:
	.loc 1 247 0
	ret
.LVL13:
.L21:
	.loc 1 224 0
	cmp.f	%d2, %d2, %d4
.LVL14:
	jz.t	%d2, 0, .L4
	.loc 1 226 0
	sub.f	%d4, %d4, %d3
.LVL15:
	j	.L4
.LVL16:
.L23:
	.loc 1 209 0
	cmp.f	%d2, %d2, %d4
.LVL17:
	jz.t	%d2, 2, .L4
.LVL18:
.L8:
	.loc 1 211 0
	movh	%d15, 17096
	add.f	%d4, %d4, %d15
.LVL19:
	j	.L4
.LVL20:
.L24:
	.loc 1 236 0
	sub.f	%d4, %d4, %d15
.LVL21:
	movh	%d3, 17096
	div.f	%d2, %d4, %d2
.LVL22:
	mul.f	%d2, %d2, %d3
.LVL23:
	ret
.LFE269:
	.size	SDP_PedalBox_getPedalLinear.isra.0, .-SDP_PedalBox_getPedalLinear.isra.0
.section .text.SDP_PedalBox_updatePPS,"ax",@progbits
	.align 1
	.type	SDP_PedalBox_updatePPS, @function
SDP_PedalBox_updatePPS:
.LFB263:
	.loc 1 251 0
.LVL24:
	.loc 1 254 0
	ld.bu	%d15, [%a4] 12
	.loc 1 251 0
	mov.aa	%a15, %a4
	.loc 1 253 0
	ld.w	%d4, [%a5] 20
	.loc 1 254 0
	jnz	%d15, .L28
	.loc 1 254 0 is_stmt 0 discriminator 2
	call	SDP_PedalBox_getPedalLinear.isra.0
.LVL25:
	.loc 1 252 0 is_stmt 1 discriminator 2
	st.w	[%a15] 40, %d2
	ret
.LVL26:
.L28:
	.loc 1 253 0 discriminator 1
	call	SDP_PedalBox_getPedalLinear.isra.0
.LVL27:
	.loc 1 254 0 discriminator 1
	movh	%d15, 17096
	sub.f	%d2, %d15, %d2
	.loc 1 252 0 discriminator 1
	st.w	[%a15] 40, %d2
	ret
.LFE263:
	.size	SDP_PedalBox_updatePPS, .-SDP_PedalBox_updatePPS
.section .text.SDP_PedalBox_init,"ax",@progbits
	.align 1
	.global	SDP_PedalBox_init
	.type	SDP_PedalBox_init, @function
SDP_PedalBox_init:
.LFB259:
	.loc 1 94 0
.LVL28:
.LBB34:
.LBB35:
	.loc 1 177 0
	movh.a	%a2, hi:SDP_PedalBox_pps
	.loc 1 181 0
	movh	%d3, 16833
	.loc 1 177 0
	lea	%a15, [%a2] lo:SDP_PedalBox_pps
	.loc 1 181 0
	addi	%d3, %d3, 13108
	st.w	[%a15] 16, %d3
	.loc 1 182 0
	movh	%d3, 17044
	addi	%d3, %d3, 19661
	st.w	[%a15] 20, %d3
	.loc 1 183 0
	movh	%d3, 16605
	addi	%d3, %d3, -13108
	st.w	[%a15] 24, %d3
	.loc 1 184 0
	movh	%d3, 16808
	addi	%d3, %d3, 23593
	st.w	[%a15] 28, %d3
	.loc 1 185 0
	movh	%d3, 16858
	addi	%d3, %d3, 2622
	st.w	[%a15] 32, %d3
	.loc 1 186 0
	movh	%d3, 16583
	addi	%d3, %d3, -18348
	st.w	[%a15] 36, %d3
.LVL29:
.LBE35:
.LBE34:
.LBB44:
.LBB45:
	.loc 1 177 0
	movh	%d3, 16765
	addi	%d3, %d3, -13107
	st.w	[%a15] 48, %d3
	.loc 1 178 0
	movh	%d3, 16826
	addi	%d3, %d3, 26214
	st.w	[%a15] 52, %d3
	.loc 1 181 0
	addih	%d3, %d3, 65506
	st.w	[%a15] 64, %d3
	.loc 1 182 0
	movh	%d3, 17035
	addi	%d3, %d3, 6554
	st.w	[%a15] 68, %d3
	.loc 1 183 0
	movh	%d3, 16624
	add	%d3, -2
	st.w	[%a15] 72, %d3
	.loc 1 184 0
	movh	%d3, 16769
	addi	%d3, %d3, 26214
	st.w	[%a15] 76, %d3
	.loc 1 185 0
	addih	%d3, %d3, 54
	st.w	[%a15] 80, %d3
	.loc 1 186 0
	movh	%d3, 16600
	st.w	[%a15] 84, %d3
.LVL30:
.LBE45:
.LBE44:
.LBB48:
.LBB49:
	.loc 1 177 0
	movh	%d3, 16786
	addi	%d3, %d3, 26214
.LBE49:
.LBE48:
.LBB57:
.LBB36:
	.loc 1 180 0
	mov	%d2, 1
.LBE36:
.LBE57:
.LBB58:
.LBB50:
	.loc 1 177 0
	st.w	[%a15] 96, %d3
	.loc 1 178 0
	addih	%d3, %d3, 56
.LBE50:
.LBE58:
.LBB59:
.LBB37:
	.loc 1 180 0
	st.b	[%a15] 12, %d2
.LBE37:
.LBE59:
.LBB60:
.LBB46:
	st.b	[%a15] 60, %d2
.LBE46:
.LBE60:
.LBB61:
.LBB51:
	st.b	[%a15] 108, %d2
	.loc 1 181 0
	addih	%d2, %d3, 65508
	st.w	[%a15] 112, %d2
	.loc 1 182 0
	movh	%d2, 17040
	addi	%d2, %d2, -26214
	st.w	[%a15] 116, %d2
	.loc 1 183 0
	movh	%d2, 16608
	st.w	[%a15] 120, %d2
	.loc 1 184 0
	movh	%d2, 16789
	addi	%d2, %d2, 13107
	st.w	[%a15] 124, %d2
	.loc 1 185 0
	movh	%d2, 16840
	addi	%d2, %d2, -26215
.LBE51:
.LBE61:
.LBB62:
.LBB38:
	.loc 1 177 0
	movh	%d15, 16806
	addi	%d15, %d15, -26214
.LBE38:
.LBE62:
.LBB63:
.LBB52:
	.loc 1 185 0
	st.w	[%a15] 128, %d2
	.loc 1 186 0
	movh	%d2, 16586
.LBE52:
.LBE63:
.LBB64:
.LBB39:
	.loc 1 177 0
	st.w	[%a2] lo:SDP_PedalBox_pps, %d15
.LBE39:
.LBE64:
.LBB65:
.LBB53:
	.loc 1 186 0
	addi	%d2, %d2, -26216
.LBE53:
.LBE65:
.LBB66:
.LBB40:
	.loc 1 178 0
	movh	%d15, 16861
	addi	%d15, %d15, -13107
.LBE40:
.LBE66:
.LBB67:
.LBB54:
	.loc 1 186 0
	st.w	[%a15] 132, %d2
.LVL31:
.LBE54:
.LBE67:
.LBB68:
.LBB69:
	.loc 1 177 0
	addih	%d2, %d3, 210
.LBE69:
.LBE68:
.LBB72:
.LBB41:
	.loc 1 178 0
	st.w	[%a15] 4, %d15
.LBE41:
.LBE72:
.LBB73:
.LBB55:
	st.w	[%a15] 100, %d3
.LBE55:
.LBE73:
.LBB74:
.LBB42:
	.loc 1 179 0
	movh	%d15, 16544
.LBE42:
.LBE74:
.LBB75:
.LBB70:
	.loc 1 177 0
	st.w	[%a15] 144, %d2
	.loc 1 181 0
	movh	%d3, 17058
	.loc 1 178 0
	addih	%d2, %d2, 11
.LBE70:
.LBE75:
.LBB76:
.LBB43:
	.loc 1 179 0
	st.w	[%a15] 8, %d15
.LBE43:
.LBE76:
.LBB77:
.LBB47:
	st.w	[%a15] 56, %d15
.LBE47:
.LBE77:
.LBB78:
.LBB56:
	st.w	[%a15] 104, %d15
.LBE56:
.LBE78:
.LBB79:
.LBB71:
	.loc 1 178 0
	st.w	[%a15] 148, %d2
	.loc 1 179 0
	st.w	[%a15] 152, %d15
	.loc 1 180 0
	mov	%d2, 0
	.loc 1 181 0
	addi	%d3, %d3, -6554
	.loc 1 180 0
	st.b	[%a15] 156, %d2
	.loc 1 181 0
	st.w	[%a15] 160, %d3
	.loc 1 182 0
	movh	%d3, 17155
	addi	%d3, %d3, -3277
	st.w	[%a15] 164, %d3
	.loc 1 183 0
	movh	%d3, 16560
	st.w	[%a15] 168, %d3
	.loc 1 184 0
	movh	%d3, 17053
	addi	%d3, %d3, -3277
	st.w	[%a15] 172, %d3
	.loc 1 185 0
	movh	%d3, 17063
	addi	%d3, %d3, -9831
	st.w	[%a15] 176, %d3
	.loc 1 186 0
	movh	%d3, 16542
	addi	%d3, %d3, 26208
	st.w	[%a15] 180, %d3
.LVL32:
.LBE71:
.LBE79:
.LBB80:
.LBB81:
	.loc 1 177 0
	movh	%d3, 16938
	addi	%d3, %d3, 26214
	st.w	[%a15] 192, %d3
	.loc 1 178 0
	addih	%d3, %d3, 20
	.loc 1 179 0
	st.w	[%a15] 200, %d15
	.loc 1 180 0
	st.b	[%a15] 204, %d2
	.loc 1 183 0
	st.w	[%a15] 216, %d15
	.loc 1 181 0
	addih	%d2, %d3, 65526
	.loc 1 184 0
	addih	%d15, %d3, 65517
	.loc 1 181 0
	st.w	[%a15] 208, %d2
	.loc 1 184 0
	st.w	[%a15] 220, %d15
	.loc 1 182 0
	movh	%d2, 17086
	.loc 1 185 0
	addih	%d15, %d3, 65535
	.loc 1 182 0
	addi	%d2, %d2, 13107
	.loc 1 185 0
	st.w	[%a15] 224, %d15
	.loc 1 186 0
	movh	%d15, 16528
	.loc 1 178 0
	st.w	[%a15] 196, %d3
	.loc 1 182 0
	st.w	[%a15] 212, %d2
	.loc 1 186 0
	st.w	[%a15] 228, %d15
	ret
.LBE81:
.LBE80:
.LFE259:
	.size	SDP_PedalBox_init, .-SDP_PedalBox_init
.section .text.SDP_PedalBox_run_1ms,"ax",@progbits
	.align 1
	.global	SDP_PedalBox_run_1ms
	.type	SDP_PedalBox_run_1ms, @function
SDP_PedalBox_run_1ms:
.LFB268:
	.loc 1 415 0
.LVL33:
.LBB90:
.LBB91:
	.loc 1 343 0
	movh.a	%a15, hi:SDP_PedalBox_pps+144
	movh.a	%a12, hi:HLD_GtmTim+200
	lea	%a15, [%a15] lo:SDP_PedalBox_pps+144
	lea	%a12, [%a12] lo:HLD_GtmTim+200
	mov.aa	%a4, %a15
	mov.aa	%a5, %a12
	call	SDP_PedalBox_updatePPS
.LVL34:
	.loc 1 344 0
	lea	%a4, [%a15] 48
	lea	%a5, [%a12] 56
	call	SDP_PedalBox_updatePPS
.LVL35:
	lea	%a15, [%a15] -144
.LBB92:
.LBB93:
	.loc 1 260 0
	ld.w	%d2, [%a15] 184
	ld.w	%d15, [%a15] 232
	.loc 1 263 0
	movh.a	%a14, hi:SDP_PedalBox_errorLimit
	.loc 1 260 0
	sub.f	%d3, %d2, %d15
	.loc 1 263 0
	ld.w	%d4, [%a14] lo:SDP_PedalBox_errorLimit
	.loc 1 261 0
	insert	%d3, %d3, 0, 31, 1
	.loc 1 263 0
	cmp.f	%d3, %d3, %d4
	jz.t	%d3, 2, .L92
.LBE93:
.LBE92:
	.loc 1 366 0
	movh	%d8, hi:SDP_PedalBox
	mov.a	%a2, %d8
.LBB97:
.LBB94:
	.loc 1 265 0
	mov	%d15, 0
.LBE94:
.LBE97:
	.loc 1 366 0
	lea	%a12, [%a2] lo:SDP_PedalBox
	mov	%d2, 0
.LBB98:
.LBB95:
	.loc 1 265 0
	st.b	[%a15] 188, %d15
	.loc 1 266 0
	st.b	[%a15] 236, %d15
.LVL36:
.LBE95:
.LBE98:
	.loc 1 366 0
	st.w	[%a12] 8, %d2
	.loc 1 367 0
	st.b	[%a12] 12, %d15
.L74:
.LVL37:
.LBE91:
.LBE90:
.LBB101:
.LBB102:
	.loc 1 377 0
	movh.a	%a13, hi:HLD_GtmTim+32
	lea	%a13, [%a13] lo:HLD_GtmTim+32
	mov.aa	%a4, %a15
	mov.aa	%a5, %a13
	call	SDP_PedalBox_updatePPS
.LVL38:
	.loc 1 378 0
	lea	%a4, [%a15] 48
	lea	%a5, [%a13] 56
	call	SDP_PedalBox_updatePPS
.LVL39:
	.loc 1 379 0
	lea	%a4, [%a15] 96
	lea	%a5, [%a13] 112
	call	SDP_PedalBox_updatePPS
.LVL40:
	ld.w	%d15, [%a15] 40
	ld.w	%d3, [%a15] 88
	ld.w	%d5, [%a15] 136
.LVL41:
.LBB103:
.LBB104:
	.loc 1 278 0
	sub.f	%d2, %d15, %d3
.LVL42:
	.loc 1 279 0
	sub.f	%d3, %d3, %d5
.LVL43:
	.loc 1 282 0
	insert	%d2, %d2, 0, 31, 1
.LVL44:
	.loc 1 280 0
	sub.f	%d5, %d5, %d15
.LVL45:
	.loc 1 286 0
	ld.w	%d15, [%a14] lo:SDP_PedalBox_errorLimit
.LVL46:
	.loc 1 283 0
	insert	%d3, %d3, 0, 31, 1
.LVL47:
	.loc 1 286 0
	cmp.f	%d4, %d2, %d15
	.loc 1 284 0
	insert	%d5, %d5, 0, 31, 1
.LVL48:
	.loc 1 286 0
	jz.t	%d4, 0, .L93
	cmp.f	%d4, %d3, %d15
	jnz.t	%d4, 0, .L98
.L37:
	.loc 1 293 0
	cmp.f	%d4, %d3, %d15
	jz.t	%d4, 0, .L44
.L39:
	cmp.f	%d4, %d5, %d15
	or.t	%d4, %d4,2, %d4,1
	jnz	%d4, .L46
.L44:
	.loc 1 299 0
	cmp.f	%d4, %d3, %d15
	or.t	%d4, %d4,2, %d4,1
	jz	%d4, .L47
	cmp.f	%d4, %d5, %d15
	jz.t	%d4, 0, .L47
.L46:
	.loc 1 288 0
	mov	%d15, 1
	st.b	[%a15] 44, %d15
	.loc 1 289 0
	st.b	[%a15] 92, %d15
	.loc 1 290 0
	st.b	[%a15] 140, %d15
	mov	%d3, 1
.LVL49:
	mov	%d4, 1
.LVL50:
.L41:
.LBE104:
.LBE103:
	.loc 1 386 0
	ld.w	%d2, [%a15] 40
	mov	%d15, 0
	add.f	%d15, %d15, %d2
.LVL51:
	.loc 1 387 0
	mov	%d2, 1
.LVL52:
	.loc 1 389 0
	jz	%d4, .L69
.LVL53:
.L99:
	.loc 1 391 0
	ld.w	%d4, [%a15] 88
	.loc 1 392 0
	add	%d2, 1
	.loc 1 391 0
	add.f	%d15, %d15, %d4
.LVL54:
	.loc 1 392 0
	and	%d2, %d2, 255
.LVL55:
	.loc 1 394 0
	jz	%d3, .L70
.LVL56:
.L73:
	.loc 1 396 0
	ld.w	%d3, [%a15] 136
	.loc 1 397 0
	add	%d2, 1
	.loc 1 396 0
	add.f	%d15, %d15, %d3
.LVL57:
	.loc 1 397 0
	and	%d2, %d2, 255
.LVL58:
.L70:
	.loc 1 401 0
	jlt.u	%d2, 2, .L71
	.loc 1 403 0
	utof	%d2, %d2
.LVL59:
	mov.a	%a2, %d8
	div.f	%d15, %d15, %d2
.LVL60:
	st.w	[%a2] lo:SDP_PedalBox, %d15
	.loc 1 404 0
	mov	%d15, 1
	st.b	[%a12] 4, %d15
	ret
.LVL61:
.L93:
.LBB107:
.LBB105:
	.loc 1 293 0
	cmp.f	%d4, %d2, %d15
	jnz.t	%d4, 0, .L37
	.loc 1 299 0
	cmp.f	%d4, %d2, %d15
	jnz.t	%d4, 0, .L44
.L47:
	.loc 1 305 0
	cmp.f	%d4, %d2, %d15
	or.t	%d4, %d4,2, %d4,1
	jz	%d4, .L95
	cmp.f	%d4, %d3, %d15
	jz.t	%d4, 0, .L52
	cmp.f	%d4, %d5, %d15
	jnz.t	%d4, 0, .L46
	.loc 1 311 0
	cmp.f	%d4, %d3, %d15
	or.t	%d4, %d4,2, %d4,1
	jz	%d4, .L76
.L75:
	cmp.f	%d4, %d5, %d15
	jz.t	%d4, 0, .L57
	.loc 1 313 0
	mov	%d15, 1
	.loc 1 314 0
	mov	%d2, 0
.LVL62:
	.loc 1 313 0
	st.b	[%a15] 44, %d15
	.loc 1 314 0
	st.b	[%a15] 92, %d2
	.loc 1 315 0
	st.b	[%a15] 140, %d15
	mov	%d3, 1
.LVL63:
	mov	%d4, 0
	j	.L41
.LVL64:
.L92:
.LBE105:
.LBE107:
.LBE102:
.LBE101:
.LBB110:
.LBB100:
.LBB99:
.LBB96:
	.loc 1 270 0
	mov	%d3, 1
	st.b	[%a15] 188, %d3
	.loc 1 271 0
	st.b	[%a15] 236, %d3
.LVL65:
.LBE96:
.LBE99:
	.loc 1 350 0
	mov	%d3, 0
	add.f	%d2, %d2, %d3
.LVL66:
	.loc 1 361 0
	movh	%d8, hi:SDP_PedalBox
	.loc 1 355 0
	add.f	%d15, %d2, %d15
	.loc 1 361 0
	mov.a	%a2, %d8
	movh	%d3, 16128
	mul.f	%d15, %d15, %d3
	lea	%a12, [%a2] lo:SDP_PedalBox
	st.w	[%a12] 8, %d15
	.loc 1 362 0
	mov	%d15, 1
	st.b	[%a12] 12, %d15
	j	.L74
.LVL67:
.L98:
.LBE100:
.LBE110:
.LBB111:
.LBB109:
.LBB108:
.LBB106:
	.loc 1 286 0
	cmp.f	%d4, %d5, %d15
	jz.t	%d4, 0, .L39
	j	.L46
.L52:
	.loc 1 311 0
	cmp.f	%d4, %d3, %d15
	or.t	%d4, %d4,2, %d4,1
	jnz	%d4, .L75
.L57:
	.loc 1 317 0
	cmp.f	%d4, %d3, %d15
	jz.t	%d4, 0, .L60
.L76:
	cmp.f	%d4, %d5, %d15
	or.t	%d4, %d4,2, %d4,1
	jz	%d4, .L60
	.loc 1 319 0
	mov	%d15, 0
	st.b	[%a15] 44, %d15
	.loc 1 320 0
	mov	%d15, 1
	st.b	[%a15] 92, %d15
	.loc 1 321 0
	st.b	[%a15] 140, %d15
	mov	%d3, 1
.LVL68:
	mov	%d4, 1
	j	.L64
.LVL69:
.L95:
	.loc 1 311 0
	cmp.f	%d4, %d2, %d15
	or.t	%d4, %d4,2, %d4,1
	jnz	%d4, .L52
	.loc 1 317 0
	cmp.f	%d4, %d2, %d15
	or.t	%d4, %d4,2, %d4,1
	jnz	%d4, .L57
.L60:
	.loc 1 323 0
	cmp.f	%d2, %d2, %d15
.LVL70:
	jz.t	%d2, 0, .L65
	cmp.f	%d3, %d3, %d15
.LVL71:
	or.t	%d3, %d3,2, %d3,1
	jz	%d3, .L65
	cmp.f	%d15, %d5, %d15
	or.t	%d15, %d15,2, %d15,1
	jz	%d15, .L65
	.loc 1 325 0
	mov	%d15, 1
	st.b	[%a15] 44, %d15
	.loc 1 326 0
	st.b	[%a15] 92, %d15
	.loc 1 327 0
	mov	%d15, 0
	st.b	[%a15] 140, %d15
	mov	%d3, 0
	mov	%d4, 1
	j	.L41
.L65:
	.loc 1 331 0
	mov	%d15, 0
	st.b	[%a15] 44, %d15
	.loc 1 332 0
	st.b	[%a15] 92, %d15
	.loc 1 333 0
	st.b	[%a15] 140, %d15
	mov	%d3, 0
	mov	%d4, 0
.L64:
.LBE106:
.LBE108:
	.loc 1 375 0
	mov	%d15, 0
	.loc 1 374 0
	mov	%d2, 0
.LVL72:
	.loc 1 389 0
	jnz	%d4, .L99
.LVL73:
.L69:
	.loc 1 394 0
	jnz	%d3, .L73
.LVL74:
.L71:
	.loc 1 408 0
	mov.a	%a2, %d8
	mov	%d2, 0
	.loc 1 409 0
	mov	%d15, 0
	.loc 1 408 0
	st.w	[%a2] lo:SDP_PedalBox, %d2
	.loc 1 409 0
	st.b	[%a12] 4, %d15
	ret
.LBE109:
.LBE111:
.LFE268:
	.size	SDP_PedalBox_run_1ms, .-SDP_PedalBox_run_1ms
	.global	SDP_PedalBox
.section .bss.SDP_PedalBox,"aw",@nobits
	.align 2
	.type	SDP_PedalBox, @object
	.size	SDP_PedalBox, 16
SDP_PedalBox:
	.zero	16
	.global	SDP_PedalBox_pps
.section .bss.SDP_PedalBox_pps,"aw",@nobits
	.align 2
	.type	SDP_PedalBox_pps, @object
	.size	SDP_PedalBox_pps, 240
SDP_PedalBox_pps:
	.zero	240
	.global	SDP_PedalBox_errorLimit
.section .data.SDP_PedalBox_errorLimit,"aw",@progbits
	.align 2
	.type	SDP_PedalBox_errorLimit, @object
	.size	SDP_PedalBox_errorLimit, 4
SDP_PedalBox_errorLimit:
	.word	1092616192
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
	.uaword	.LFB269
	.uaword	.LFE269-.LFB269
	.align 2
.LEFDE0:
.LSFDE2:
	.uaword	.LEFDE2-.LASFDE2
.LASFDE2:
	.uaword	.Lframe0
	.uaword	.LFB263
	.uaword	.LFE263-.LFB263
	.align 2
.LEFDE2:
.LSFDE4:
	.uaword	.LEFDE4-.LASFDE4
.LASFDE4:
	.uaword	.Lframe0
	.uaword	.LFB259
	.uaword	.LFE259-.LFB259
	.align 2
.LEFDE4:
.LSFDE6:
	.uaword	.LEFDE6-.LASFDE6
.LASFDE6:
	.uaword	.Lframe0
	.uaword	.LFB268
	.uaword	.LFE268-.LFB268
	.align 2
.LEFDE6:
.section .text,"ax",@progbits
.Letext0:
	.file 2 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/Platform_Types.h"
	.file 3 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/Ifx_Types.h"
	.file 4 "0_Src/BaseSw/Infra/Sfr/TC27D/_Reg/IfxGtm_regdef.h"
	.file 5 "0_Src/BaseSw/iLLD/TC27D/Tricore/_Impl/IfxGtm_cfg.h"
	.file 6 "0_Src/BaseSw/iLLD/TC27D/Tricore/_Impl/IfxCpu_cfg.h"
	.file 7 "0_Src/BaseSw/iLLD/TC27D/Tricore/Gtm/Tim/In/IfxGtm_Tim_In.h"
	.file 8 "0_Src/AppSw/Tricore/HLD/BasicModules/Gtm/Tim/GtmTim.h"
	.file 9 "0_Src/AppSw/Tricore/SDP/PedalBox/PedalBox.h"
.section .debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x230c
	.uahalf	0x3
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.string	"GNU C 4.9.4 build on 2019-06-07 -mlicense-dir=c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\bin\\../lib/gcc/tricore/4.9.4/../../../../licenses -mtc161 -g -O2 -std=c99 -fno-common -fstrict-volatile-bitfields -ffunction-sections -fdata-sections"
	.byte	0x1
	.string	"0_Src/AppSw/Tricore/SDP/PedalBox/PedalBox.c"
	.string	"C:\\\\Google drive\\\\RH_Workspace\\\\__RH26_Control_Base_TC275"
	.uaword	.Ldebug_ranges0+0x150
	.uaword	0
	.uaword	0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.string	"float"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.string	"long int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.string	"long unsigned int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.string	"signed char"
	.uleb128 0x3
	.string	"uint8"
	.byte	0x2
	.byte	0x59
	.uaword	0x1c8
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.string	"unsigned char"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.string	"short int"
	.uleb128 0x3
	.string	"uint16"
	.byte	0x2
	.byte	0x5b
	.uaword	0x1f4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.string	"short unsigned int"
	.uleb128 0x3
	.string	"sint32"
	.byte	0x2
	.byte	0x5c
	.uaword	0x184
	.uleb128 0x3
	.string	"uint32"
	.byte	0x2
	.byte	0x5d
	.uaword	0x190
	.uleb128 0x3
	.string	"float32"
	.byte	0x2
	.byte	0x5e
	.uaword	0x17b
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.string	"double"
	.uleb128 0x3
	.string	"boolean"
	.byte	0x2
	.byte	0x68
	.uaword	0x1c8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.string	"long long int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.string	"long long unsigned int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.string	"char"
	.uleb128 0x4
	.byte	0x4
	.uaword	0x287
	.uleb128 0x5
	.uleb128 0x6
	.byte	0x8
	.byte	0x3
	.byte	0x7e
	.uaword	0x2ae
	.uleb128 0x7
	.string	"module"
	.byte	0x3
	.byte	0x80
	.uaword	0x281
	.byte	0
	.uleb128 0x7
	.string	"index"
	.byte	0x3
	.byte	0x81
	.uaword	0x20a
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.string	"IfxModule_IndexMap"
	.byte	0x3
	.byte	0x82
	.uaword	0x288
	.uleb128 0x8
	.uaword	0x2cd
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.string	"unsigned int"
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_CNT_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf01
	.uaword	0x320
	.uleb128 0xa
	.string	"CNT"
	.byte	0x4
	.uahalf	0xf03
	.uaword	0x2c8
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.uaword	.LASF0
	.byte	0x4
	.uahalf	0xf04
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_CNT_Bits"
	.byte	0x4
	.uahalf	0xf05
	.uaword	0x2dd
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_CNTS_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf08
	.uaword	0x386
	.uleb128 0xa
	.string	"CNTS"
	.byte	0x4
	.uahalf	0xf0a
	.uaword	0x2c8
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.string	"ECNT"
	.byte	0x4
	.uahalf	0xf0b
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_CNTS_Bits"
	.byte	0x4
	.uahalf	0xf0c
	.uaword	0x340
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_CTRL_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf0f
	.uaword	0x5bf
	.uleb128 0xa
	.string	"TIM_EN"
	.byte	0x4
	.uahalf	0xf11
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.string	"TIM_MODE"
	.byte	0x4
	.uahalf	0xf12
	.uaword	0x2c8
	.byte	0x4
	.byte	0x3
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.string	"OSM"
	.byte	0x4
	.uahalf	0xf13
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xa
	.string	"ARU_EN"
	.byte	0x4
	.uahalf	0xf14
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xa
	.string	"CICTRL"
	.byte	0x4
	.uahalf	0xf15
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xa
	.string	"TBU0_SEL"
	.byte	0x4
	.uahalf	0xf16
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.string	"GPR0_SEL"
	.byte	0x4
	.uahalf	0xf17
	.uaword	0x2c8
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0
	.uleb128 0xa
	.string	"GPR1_SEL"
	.byte	0x4
	.uahalf	0xf18
	.uaword	0x2c8
	.byte	0x4
	.byte	0x2
	.byte	0x14
	.byte	0
	.uleb128 0xa
	.string	"CNTS_SEL"
	.byte	0x4
	.uahalf	0xf19
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0xa
	.string	"DSL"
	.byte	0x4
	.uahalf	0xf1a
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0xa
	.string	"ISL"
	.byte	0x4
	.uahalf	0xf1b
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0xa
	.string	"ECNT_RESET"
	.byte	0x4
	.uahalf	0xf1c
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.string	"FLT_EN"
	.byte	0x4
	.uahalf	0xf1d
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.string	"FLT_CNT_FRQ"
	.byte	0x4
	.uahalf	0xf1e
	.uaword	0x2c8
	.byte	0x4
	.byte	0x2
	.byte	0xd
	.byte	0
	.uleb128 0xa
	.string	"EXT_CAP_EN"
	.byte	0x4
	.uahalf	0xf1f
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.string	"FLT_MODE_RE"
	.byte	0x4
	.uahalf	0xf20
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0xa
	.string	"FLT_CTR_RE"
	.byte	0x4
	.uahalf	0xf21
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0xa
	.string	"FLT_MODE_FE"
	.byte	0x4
	.uahalf	0xf22
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0
	.uleb128 0xa
	.string	"FLT_CTR_FE"
	.byte	0x4
	.uahalf	0xf23
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.string	"CLK_SEL"
	.byte	0x4
	.uahalf	0xf24
	.uaword	0x2c8
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0
	.uleb128 0xa
	.string	"FR_ECNT_OFL"
	.byte	0x4
	.uahalf	0xf25
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.string	"EGPR0_SEL"
	.byte	0x4
	.uahalf	0xf26
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.string	"EGPR1_SEL"
	.byte	0x4
	.uahalf	0xf27
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.string	"TOCTRL"
	.byte	0x4
	.uahalf	0xf28
	.uaword	0x2c8
	.byte	0x4
	.byte	0x2
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_CTRL_Bits"
	.byte	0x4
	.uahalf	0xf29
	.uaword	0x3a7
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_ECNT_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf2c
	.uaword	0x62d
	.uleb128 0xa
	.string	"ECNT"
	.byte	0x4
	.uahalf	0xf2e
	.uaword	0x2c8
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.string	"reserved_16"
	.byte	0x4
	.uahalf	0xf2f
	.uaword	0x2c8
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_ECNT_Bits"
	.byte	0x4
	.uahalf	0xf30
	.uaword	0x5e0
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_ECTRL_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf33
	.uaword	0x6a2
	.uleb128 0xa
	.string	"EXT_CAP_SRC"
	.byte	0x4
	.uahalf	0xf35
	.uaword	0x2c8
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0xa
	.string	"reserved_3"
	.byte	0x4
	.uahalf	0xf36
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1d
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_ECTRL_Bits"
	.byte	0x4
	.uahalf	0xf37
	.uaword	0x64e
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_EIRQ_EN_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf3a
	.uaword	0x7a0
	.uleb128 0xa
	.string	"NEWVAL_EIRQ_EN"
	.byte	0x4
	.uahalf	0xf3c
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.string	"ECNTOFL_EIRQ_EN"
	.byte	0x4
	.uahalf	0xf3d
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xa
	.string	"CNTOFL_EIRQ_EN"
	.byte	0x4
	.uahalf	0xf3e
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xa
	.string	"GPROFL_EIRQ_EN"
	.byte	0x4
	.uahalf	0xf3f
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.string	"TODET_EIRQ_EN"
	.byte	0x4
	.uahalf	0xf40
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xa
	.string	"GLITCHDET_EIRQ_EN"
	.byte	0x4
	.uahalf	0xf41
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xb
	.uaword	.LASF1
	.byte	0x4
	.uahalf	0xf42
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_EIRQ_EN_Bits"
	.byte	0x4
	.uahalf	0xf43
	.uaword	0x6c4
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_FLT_FE_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf46
	.uaword	0x80d
	.uleb128 0xa
	.string	"FLT_FE"
	.byte	0x4
	.uahalf	0xf48
	.uaword	0x2c8
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.uaword	.LASF0
	.byte	0x4
	.uahalf	0xf49
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_FLT_FE_Bits"
	.byte	0x4
	.uahalf	0xf4a
	.uaword	0x7c4
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_FLT_RE_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf4d
	.uaword	0x879
	.uleb128 0xa
	.string	"FLT_RE"
	.byte	0x4
	.uahalf	0xf4f
	.uaword	0x2c8
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.uaword	.LASF0
	.byte	0x4
	.uahalf	0xf50
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_FLT_RE_Bits"
	.byte	0x4
	.uahalf	0xf51
	.uaword	0x830
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_GPR0_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf54
	.uaword	0x8e2
	.uleb128 0xa
	.string	"GPR0"
	.byte	0x4
	.uahalf	0xf56
	.uaword	0x2c8
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.string	"ECNT"
	.byte	0x4
	.uahalf	0xf57
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_GPR0_Bits"
	.byte	0x4
	.uahalf	0xf58
	.uaword	0x89c
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_GPR1_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf5b
	.uaword	0x949
	.uleb128 0xa
	.string	"GPR1"
	.byte	0x4
	.uahalf	0xf5d
	.uaword	0x2c8
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.string	"ECNT"
	.byte	0x4
	.uahalf	0xf5e
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_GPR1_Bits"
	.byte	0x4
	.uahalf	0xf5f
	.uaword	0x903
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_IRQ_EN_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf62
	.uaword	0xa3f
	.uleb128 0xa
	.string	"NEWVAL_IRQ_EN"
	.byte	0x4
	.uahalf	0xf64
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.string	"ECNTOFL_IRQ_EN"
	.byte	0x4
	.uahalf	0xf65
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xa
	.string	"CNTOFL_IRQ_EN"
	.byte	0x4
	.uahalf	0xf66
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xa
	.string	"GPROFL_IRQ_EN"
	.byte	0x4
	.uahalf	0xf67
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.string	"TODET_IRQ_EN"
	.byte	0x4
	.uahalf	0xf68
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xa
	.string	"GLITCHDET_IRQ_EN"
	.byte	0x4
	.uahalf	0xf69
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xb
	.uaword	.LASF1
	.byte	0x4
	.uahalf	0xf6a
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_EN_Bits"
	.byte	0x4
	.uahalf	0xf6b
	.uaword	0x96a
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_IRQ_FORCINT_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf6e
	.uaword	0xb2a
	.uleb128 0xa
	.string	"TRG_NEWVAL"
	.byte	0x4
	.uahalf	0xf70
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.string	"TRG_ECNTOFL"
	.byte	0x4
	.uahalf	0xf71
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xa
	.string	"TRG_CNTOFL"
	.byte	0x4
	.uahalf	0xf72
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xa
	.string	"TRG_GPROFL"
	.byte	0x4
	.uahalf	0xf73
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.string	"TRG_TODET"
	.byte	0x4
	.uahalf	0xf74
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xa
	.string	"TRG_GLITCHDET"
	.byte	0x4
	.uahalf	0xf75
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xb
	.uaword	.LASF1
	.byte	0x4
	.uahalf	0xf76
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_FORCINT_Bits"
	.byte	0x4
	.uahalf	0xf77
	.uaword	0xa62
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_IRQ_MODE_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf7a
	.uaword	0xba1
	.uleb128 0xb
	.uaword	.LASF2
	.byte	0x4
	.uahalf	0xf7c
	.uaword	0x2c8
	.byte	0x4
	.byte	0x2
	.byte	0x1e
	.byte	0
	.uleb128 0xa
	.string	"reserved_2"
	.byte	0x4
	.uahalf	0xf7d
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1e
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_MODE_Bits"
	.byte	0x4
	.uahalf	0xf7e
	.uaword	0xb52
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_IRQ_NOTIFY_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf81
	.uaword	0xc75
	.uleb128 0xa
	.string	"NEWVAL"
	.byte	0x4
	.uahalf	0xf83
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.string	"ECNTOFL"
	.byte	0x4
	.uahalf	0xf84
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xa
	.string	"CNTOFL"
	.byte	0x4
	.uahalf	0xf85
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xa
	.string	"GPROFL"
	.byte	0x4
	.uahalf	0xf86
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.string	"TODET"
	.byte	0x4
	.uahalf	0xf87
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xa
	.string	"GLITCHDET"
	.byte	0x4
	.uahalf	0xf88
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xb
	.uaword	.LASF1
	.byte	0x4
	.uahalf	0xf89
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_NOTIFY_Bits"
	.byte	0x4
	.uahalf	0xf8a
	.uaword	0xbc6
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_TDUC_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf8d
	.uaword	0xce3
	.uleb128 0xa
	.string	"TO_CNT"
	.byte	0x4
	.uahalf	0xf8f
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.uaword	.LASF3
	.byte	0x4
	.uahalf	0xf90
	.uaword	0x2c8
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_TDUC_Bits"
	.byte	0x4
	.uahalf	0xf91
	.uaword	0xc9c
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH_TDUV_Bits"
	.byte	0x4
	.byte	0x4
	.uahalf	0xf94
	.uaword	0xd70
	.uleb128 0xa
	.string	"TOV"
	.byte	0x4
	.uahalf	0xf96
	.uaword	0x2c8
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.uaword	.LASF3
	.byte	0x4
	.uahalf	0xf97
	.uaword	0x2c8
	.byte	0x4
	.byte	0x14
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.string	"TCS"
	.byte	0x4
	.uahalf	0xf98
	.uaword	0x2c8
	.byte	0x4
	.byte	0x3
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.string	"reserved_31"
	.byte	0x4
	.uahalf	0xf99
	.uaword	0x2c8
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_TDUV_Bits"
	.byte	0x4
	.uahalf	0xf9a
	.uaword	0xd04
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1a95
	.uaword	0xdb9
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1a97
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1a98
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1a99
	.uaword	0x320
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_CNT"
	.byte	0x4
	.uahalf	0x1a9a
	.uaword	0xd91
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1a9d
	.uaword	0xdfc
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1a9f
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1aa0
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1aa1
	.uaword	0x386
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_CNTS"
	.byte	0x4
	.uahalf	0x1aa2
	.uaword	0xdd4
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1aa5
	.uaword	0xe40
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1aa7
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1aa8
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1aa9
	.uaword	0x5bf
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_CTRL"
	.byte	0x4
	.uahalf	0x1aaa
	.uaword	0xe18
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1aad
	.uaword	0xe84
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1aaf
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ab0
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ab1
	.uaword	0x62d
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_ECNT"
	.byte	0x4
	.uahalf	0x1ab2
	.uaword	0xe5c
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1ab5
	.uaword	0xec8
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1ab7
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ab8
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ab9
	.uaword	0x6a2
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_ECTRL"
	.byte	0x4
	.uahalf	0x1aba
	.uaword	0xea0
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1abd
	.uaword	0xf0d
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1abf
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ac0
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ac1
	.uaword	0x7a0
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_EIRQ_EN"
	.byte	0x4
	.uahalf	0x1ac2
	.uaword	0xee5
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1ac5
	.uaword	0xf54
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1ac7
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ac8
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ac9
	.uaword	0x80d
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_FLT_FE"
	.byte	0x4
	.uahalf	0x1aca
	.uaword	0xf2c
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1acd
	.uaword	0xf9a
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1acf
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ad0
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ad1
	.uaword	0x879
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_FLT_RE"
	.byte	0x4
	.uahalf	0x1ad2
	.uaword	0xf72
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1ad5
	.uaword	0xfe0
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1ad7
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ad8
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ad9
	.uaword	0x8e2
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_GPR0"
	.byte	0x4
	.uahalf	0x1ada
	.uaword	0xfb8
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1add
	.uaword	0x1024
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1adf
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ae0
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ae1
	.uaword	0x949
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_GPR1"
	.byte	0x4
	.uahalf	0x1ae2
	.uaword	0xffc
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1ae5
	.uaword	0x1068
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1ae7
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1ae8
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1ae9
	.uaword	0xa3f
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_EN"
	.byte	0x4
	.uahalf	0x1aea
	.uaword	0x1040
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1aed
	.uaword	0x10ae
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1aef
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1af0
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1af1
	.uaword	0xb2a
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_FORCINT"
	.byte	0x4
	.uahalf	0x1af2
	.uaword	0x1086
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1af5
	.uaword	0x10f9
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1af7
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1af8
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1af9
	.uaword	0xba1
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_MODE"
	.byte	0x4
	.uahalf	0x1afa
	.uaword	0x10d1
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1afd
	.uaword	0x1141
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1aff
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1b00
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1b01
	.uaword	0xc75
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_IRQ_NOTIFY"
	.byte	0x4
	.uahalf	0x1b02
	.uaword	0x1119
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1b05
	.uaword	0x118b
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1b07
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1b08
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1b09
	.uaword	0xce3
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_TDUC"
	.byte	0x4
	.uahalf	0x1b0a
	.uaword	0x1163
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.uahalf	0x1b0d
	.uaword	0x11cf
	.uleb128 0xe
	.string	"U"
	.byte	0x4
	.uahalf	0x1b0f
	.uaword	0x2cd
	.uleb128 0xe
	.string	"I"
	.byte	0x4
	.uahalf	0x1b10
	.uaword	0x1a5
	.uleb128 0xe
	.string	"B"
	.byte	0x4
	.uahalf	0x1b11
	.uaword	0xd70
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH_TDUV"
	.byte	0x4
	.uahalf	0x1b12
	.uaword	0x11a7
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.string	"sizetype"
	.uleb128 0x9
	.string	"_Ifx_GTM_TIM_CH"
	.byte	0x78
	.byte	0x4
	.uahalf	0x1cd1
	.uaword	0x131b
	.uleb128 0xf
	.string	"GPR0"
	.byte	0x4
	.uahalf	0x1cd3
	.uaword	0xfe0
	.byte	0
	.uleb128 0xf
	.string	"GPR1"
	.byte	0x4
	.uahalf	0x1cd4
	.uaword	0x1024
	.byte	0x4
	.uleb128 0xf
	.string	"CNT"
	.byte	0x4
	.uahalf	0x1cd5
	.uaword	0xdb9
	.byte	0x8
	.uleb128 0xf
	.string	"ECNT"
	.byte	0x4
	.uahalf	0x1cd6
	.uaword	0xe84
	.byte	0xc
	.uleb128 0xf
	.string	"CNTS"
	.byte	0x4
	.uahalf	0x1cd7
	.uaword	0xdfc
	.byte	0x10
	.uleb128 0xf
	.string	"TDUC"
	.byte	0x4
	.uahalf	0x1cd8
	.uaword	0x118b
	.byte	0x14
	.uleb128 0xf
	.string	"TDUV"
	.byte	0x4
	.uahalf	0x1cd9
	.uaword	0x11cf
	.byte	0x18
	.uleb128 0xf
	.string	"FLT_RE"
	.byte	0x4
	.uahalf	0x1cda
	.uaword	0xf9a
	.byte	0x1c
	.uleb128 0xf
	.string	"FLT_FE"
	.byte	0x4
	.uahalf	0x1cdb
	.uaword	0xf54
	.byte	0x20
	.uleb128 0xf
	.string	"CTRL"
	.byte	0x4
	.uahalf	0x1cdc
	.uaword	0xe40
	.byte	0x24
	.uleb128 0xf
	.string	"ECTRL"
	.byte	0x4
	.uahalf	0x1cdd
	.uaword	0xec8
	.byte	0x28
	.uleb128 0xf
	.string	"IRQ_NOTIFY"
	.byte	0x4
	.uahalf	0x1cde
	.uaword	0x1141
	.byte	0x2c
	.uleb128 0xf
	.string	"IRQ_EN"
	.byte	0x4
	.uahalf	0x1cdf
	.uaword	0x1068
	.byte	0x30
	.uleb128 0xf
	.string	"IRQ_FORCINT"
	.byte	0x4
	.uahalf	0x1ce0
	.uaword	0x10ae
	.byte	0x34
	.uleb128 0x10
	.uaword	.LASF2
	.byte	0x4
	.uahalf	0x1ce1
	.uaword	0x10f9
	.byte	0x38
	.uleb128 0xf
	.string	"EIRQ_EN"
	.byte	0x4
	.uahalf	0x1ce2
	.uaword	0xf0d
	.byte	0x3c
	.uleb128 0xf
	.string	"reserved_40"
	.byte	0x4
	.uahalf	0x1ce3
	.uaword	0x131b
	.byte	0x40
	.byte	0
	.uleb128 0x11
	.uaword	0x1c8
	.uaword	0x132b
	.uleb128 0x12
	.uaword	0x11eb
	.byte	0x37
	.byte	0
	.uleb128 0xc
	.string	"Ifx_GTM_TIM_CH"
	.byte	0x4
	.uahalf	0x1ce4
	.uaword	0x1342
	.uleb128 0x8
	.uaword	0x11f7
	.uleb128 0x13
	.byte	0x1
	.byte	0x5
	.byte	0xed
	.uaword	0x138c
	.uleb128 0x14
	.string	"IfxGtm_Tim_0"
	.sleb128 0
	.uleb128 0x14
	.string	"IfxGtm_Tim_1"
	.sleb128 1
	.uleb128 0x14
	.string	"IfxGtm_Tim_2"
	.sleb128 2
	.uleb128 0x14
	.string	"IfxGtm_Tim_3"
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.string	"IfxGtm_Tim"
	.byte	0x5
	.byte	0xf2
	.uaword	0x1347
	.uleb128 0x13
	.byte	0x1
	.byte	0x5
	.byte	0xf7
	.uaword	0x1437
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_0"
	.sleb128 0
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_1"
	.sleb128 1
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_2"
	.sleb128 2
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_3"
	.sleb128 3
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_4"
	.sleb128 4
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_5"
	.sleb128 5
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_6"
	.sleb128 6
	.uleb128 0x14
	.string	"IfxGtm_Tim_Ch_7"
	.sleb128 7
	.byte	0
	.uleb128 0xc
	.string	"IfxGtm_Tim_Ch"
	.byte	0x5
	.uahalf	0x100
	.uaword	0x139e
	.uleb128 0x13
	.byte	0x1
	.byte	0x6
	.byte	0x76
	.uaword	0x149d
	.uleb128 0x14
	.string	"IfxCpu_Index_0"
	.sleb128 0
	.uleb128 0x14
	.string	"IfxCpu_Index_1"
	.sleb128 1
	.uleb128 0x14
	.string	"IfxCpu_Index_2"
	.sleb128 2
	.uleb128 0x14
	.string	"IfxCpu_Index_none"
	.sleb128 3
	.byte	0
	.uleb128 0x6
	.byte	0x20
	.byte	0x7
	.byte	0x7a
	.uaword	0x15a9
	.uleb128 0x7
	.string	"channel"
	.byte	0x7
	.byte	0x7c
	.uaword	0x15a9
	.byte	0
	.uleb128 0x7
	.string	"periodTick"
	.byte	0x7
	.byte	0x7d
	.uaword	0x218
	.byte	0x4
	.uleb128 0x7
	.string	"pulseLengthTick"
	.byte	0x7
	.byte	0x7e
	.uaword	0x218
	.byte	0x8
	.uleb128 0x7
	.string	"dataCoherent"
	.byte	0x7
	.byte	0x7f
	.uaword	0x23f
	.byte	0xc
	.uleb128 0x7
	.string	"overflowCnt"
	.byte	0x7
	.byte	0x80
	.uaword	0x23f
	.byte	0xd
	.uleb128 0x7
	.string	"newData"
	.byte	0x7
	.byte	0x81
	.uaword	0x23f
	.byte	0xe
	.uleb128 0x7
	.string	"dataLost"
	.byte	0x7
	.byte	0x82
	.uaword	0x23f
	.byte	0xf
	.uleb128 0x7
	.string	"edgeCounterUpper"
	.byte	0x7
	.byte	0x83
	.uaword	0x218
	.byte	0x10
	.uleb128 0x7
	.string	"glitch"
	.byte	0x7
	.byte	0x84
	.uaword	0x23f
	.byte	0x14
	.uleb128 0x7
	.string	"captureClockFrequency"
	.byte	0x7
	.byte	0x85
	.uaword	0x226
	.byte	0x18
	.uleb128 0x7
	.string	"timIndex"
	.byte	0x7
	.byte	0x86
	.uaword	0x138c
	.byte	0x1c
	.uleb128 0x7
	.string	"channelIndex"
	.byte	0x7
	.byte	0x87
	.uaword	0x1437
	.byte	0x1d
	.uleb128 0x7
	.string	"edgeCount"
	.byte	0x7
	.byte	0x88
	.uaword	0x1e6
	.byte	0x1e
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x132b
	.uleb128 0x3
	.string	"IfxGtm_Tim_In"
	.byte	0x7
	.byte	0x89
	.uaword	0x149d
	.uleb128 0x6
	.byte	0x18
	.byte	0x8
	.byte	0x1c
	.uaword	0x164b
	.uleb128 0x7
	.string	"pulseWidth_tick"
	.byte	0x8
	.byte	0x1e
	.uaword	0x218
	.byte	0
	.uleb128 0x7
	.string	"period_tick"
	.byte	0x8
	.byte	0x1f
	.uaword	0x218
	.byte	0x4
	.uleb128 0x7
	.string	"pulseWidth_ms"
	.byte	0x8
	.byte	0x20
	.uaword	0x226
	.byte	0x8
	.uleb128 0x7
	.string	"period_ms"
	.byte	0x8
	.byte	0x21
	.uaword	0x226
	.byte	0xc
	.uleb128 0x7
	.string	"pulseHz"
	.byte	0x8
	.byte	0x22
	.uaword	0x226
	.byte	0x10
	.uleb128 0x7
	.string	"dutyRatio_percent"
	.byte	0x8
	.byte	0x23
	.uaword	0x226
	.byte	0x14
	.byte	0
	.uleb128 0x3
	.string	"HLD_GtmTim_dataPulse_t"
	.byte	0x8
	.byte	0x24
	.uaword	0x15c4
	.uleb128 0x6
	.byte	0x38
	.byte	0x8
	.byte	0x26
	.uaword	0x168e
	.uleb128 0x7
	.string	"driver"
	.byte	0x8
	.byte	0x28
	.uaword	0x15af
	.byte	0
	.uleb128 0x7
	.string	"data"
	.byte	0x8
	.byte	0x29
	.uaword	0x164b
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.string	"HLD_GtmTim_channel_t"
	.byte	0x8
	.byte	0x2a
	.uaword	0x1669
	.uleb128 0x15
	.uahalf	0x230
	.byte	0x8
	.byte	0x2c
	.uaword	0x16bf
	.uleb128 0x7
	.string	"ch"
	.byte	0x8
	.byte	0x2e
	.uaword	0x16bf
	.byte	0
	.byte	0
	.uleb128 0x11
	.uaword	0x168e
	.uaword	0x16cf
	.uleb128 0x12
	.uaword	0x11eb
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.string	"HLD_GtmTim_t"
	.byte	0x8
	.byte	0x2f
	.uaword	0x16aa
	.uleb128 0x6
	.byte	0x28
	.byte	0x9
	.byte	0x2e
	.uaword	0x1768
	.uleb128 0x16
	.uaword	.LASF4
	.byte	0x9
	.byte	0x30
	.uaword	0x226
	.byte	0
	.uleb128 0x7
	.string	"end"
	.byte	0x9
	.byte	0x31
	.uaword	0x226
	.byte	0x4
	.uleb128 0x16
	.uaword	.LASF5
	.byte	0x9
	.byte	0x32
	.uaword	0x226
	.byte	0x8
	.uleb128 0x16
	.uaword	.LASF6
	.byte	0x9
	.byte	0x33
	.uaword	0x23f
	.byte	0xc
	.uleb128 0x16
	.uaword	.LASF7
	.byte	0x9
	.byte	0x35
	.uaword	0x226
	.byte	0x10
	.uleb128 0x16
	.uaword	.LASF8
	.byte	0x9
	.byte	0x36
	.uaword	0x226
	.byte	0x14
	.uleb128 0x7
	.string	"len"
	.byte	0x9
	.byte	0x37
	.uaword	0x226
	.byte	0x18
	.uleb128 0x16
	.uaword	.LASF9
	.byte	0x9
	.byte	0x3a
	.uaword	0x226
	.byte	0x1c
	.uleb128 0x7
	.string	"dzend"
	.byte	0x9
	.byte	0x3b
	.uaword	0x226
	.byte	0x20
	.uleb128 0x7
	.string	"dzlen"
	.byte	0x9
	.byte	0x3c
	.uaword	0x226
	.byte	0x24
	.byte	0
	.uleb128 0x3
	.string	"SDP_PedalBox_sensorConfig_t"
	.byte	0x9
	.byte	0x3e
	.uaword	0x16e3
	.uleb128 0x6
	.byte	0x30
	.byte	0x9
	.byte	0x40
	.uaword	0x17c1
	.uleb128 0x16
	.uaword	.LASF10
	.byte	0x9
	.byte	0x42
	.uaword	0x1768
	.byte	0
	.uleb128 0x7
	.string	"pedalPercent"
	.byte	0x9
	.byte	0x43
	.uaword	0x226
	.byte	0x28
	.uleb128 0x16
	.uaword	.LASF11
	.byte	0x9
	.byte	0x44
	.uaword	0x23f
	.byte	0x2c
	.byte	0
	.uleb128 0x3
	.string	"SDP_PedalBox_sensor_t"
	.byte	0x9
	.byte	0x45
	.uaword	0x178b
	.uleb128 0x6
	.byte	0xf0
	.byte	0x9
	.byte	0x47
	.uaword	0x182d
	.uleb128 0x7
	.string	"apps0"
	.byte	0x9
	.byte	0x49
	.uaword	0x17c1
	.byte	0
	.uleb128 0x7
	.string	"apps1"
	.byte	0x9
	.byte	0x4a
	.uaword	0x17c1
	.byte	0x30
	.uleb128 0x7
	.string	"apps2"
	.byte	0x9
	.byte	0x4b
	.uaword	0x17c1
	.byte	0x60
	.uleb128 0x7
	.string	"bpps0"
	.byte	0x9
	.byte	0x4c
	.uaword	0x17c1
	.byte	0x90
	.uleb128 0x7
	.string	"bpps1"
	.byte	0x9
	.byte	0x4d
	.uaword	0x17c1
	.byte	0xc0
	.byte	0
	.uleb128 0x3
	.string	"SDP_PedalBox_pps_t"
	.byte	0x9
	.byte	0x4e
	.uaword	0x17de
	.uleb128 0x6
	.byte	0x8
	.byte	0x9
	.byte	0x50
	.uaword	0x1868
	.uleb128 0x7
	.string	"pps"
	.byte	0x9
	.byte	0x52
	.uaword	0x226
	.byte	0
	.uleb128 0x16
	.uaword	.LASF11
	.byte	0x9
	.byte	0x53
	.uaword	0x23f
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.string	"SDP_PedalBox_struct_t"
	.byte	0x9
	.byte	0x54
	.uaword	0x1847
	.uleb128 0x6
	.byte	0x10
	.byte	0x9
	.byte	0x56
	.uaword	0x18a8
	.uleb128 0x7
	.string	"apps"
	.byte	0x9
	.byte	0x58
	.uaword	0x1868
	.byte	0
	.uleb128 0x7
	.string	"bpps"
	.byte	0x9
	.byte	0x59
	.uaword	0x1868
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.string	"SDP_PedalBox_t"
	.byte	0x9
	.byte	0x5a
	.uaword	0x1885
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.string	"long double"
	.uleb128 0x6
	.byte	0x10
	.byte	0x1
	.byte	0x3e
	.uaword	0x1912
	.uleb128 0x16
	.uaword	.LASF4
	.byte	0x1
	.byte	0x40
	.uaword	0x226
	.byte	0
	.uleb128 0x7
	.string	"end"
	.byte	0x1
	.byte	0x41
	.uaword	0x226
	.byte	0x4
	.uleb128 0x7
	.string	"percentDeadzone"
	.byte	0x1
	.byte	0x42
	.uaword	0x226
	.byte	0x8
	.uleb128 0x16
	.uaword	.LASF6
	.byte	0x1
	.byte	0x43
	.uaword	0x23f
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.string	"SDP_PedalBox_sensorConfig_config"
	.byte	0x1
	.byte	0x44
	.uaword	0x18cd
	.uleb128 0x17
	.string	"SDP_PedalBox_getPedalLinear"
	.byte	0x1
	.byte	0xbe
	.byte	0x1
	.uaword	0x226
	.byte	0x1
	.uaword	0x19ff
	.uleb128 0x18
	.string	"sensor"
	.byte	0x1
	.byte	0xbe
	.uaword	0x19ff
	.uleb128 0x18
	.string	"tim"
	.byte	0x1
	.byte	0xbe
	.uaword	0x1a05
	.uleb128 0x19
	.string	"value"
	.byte	0x1
	.byte	0xc1
	.uaword	0x226
	.uleb128 0x19
	.string	"result"
	.byte	0x1
	.byte	0xc2
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF4
	.byte	0x1
	.byte	0xc5
	.uaword	0x1a0b
	.uleb128 0x19
	.string	"end"
	.byte	0x1
	.byte	0xc6
	.uaword	0x1a0b
	.uleb128 0x1a
	.uaword	.LASF5
	.byte	0x1
	.byte	0xc7
	.uaword	0x1a0b
	.uleb128 0x19
	.string	"len"
	.byte	0x1
	.byte	0xc8
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF8
	.byte	0x1
	.byte	0xc9
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF7
	.byte	0x1
	.byte	0xca
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF9
	.byte	0x1
	.byte	0xe6
	.uaword	0x226
	.uleb128 0x19
	.string	"dzend"
	.byte	0x1
	.byte	0xe7
	.uaword	0x226
	.uleb128 0x19
	.string	"dzlen"
	.byte	0x1
	.byte	0xe8
	.uaword	0x226
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x17c1
	.uleb128 0x4
	.byte	0x4
	.uaword	0x164b
	.uleb128 0x1b
	.uaword	0x226
	.uleb128 0x1c
	.string	"SDP_PedalBox_checkErrorState_fromTwo"
	.byte	0x1
	.uahalf	0x102
	.byte	0x1
	.byte	0x1
	.uaword	0x1a79
	.uleb128 0x1d
	.string	"data1"
	.byte	0x1
	.uahalf	0x102
	.uaword	0x19ff
	.uleb128 0x1d
	.string	"data2"
	.byte	0x1
	.uahalf	0x102
	.uaword	0x19ff
	.uleb128 0x1e
	.string	"diff"
	.byte	0x1
	.uahalf	0x104
	.uaword	0x226
	.uleb128 0x1e
	.string	"absDiff"
	.byte	0x1
	.uahalf	0x105
	.uaword	0x226
	.byte	0
	.uleb128 0x1c
	.string	"SDP_PedalBox_checkErrorState_fromThree"
	.byte	0x1
	.uahalf	0x114
	.byte	0x1
	.byte	0x1
	.uaword	0x1b38
	.uleb128 0x1d
	.string	"data1"
	.byte	0x1
	.uahalf	0x114
	.uaword	0x19ff
	.uleb128 0x1d
	.string	"data2"
	.byte	0x1
	.uahalf	0x114
	.uaword	0x19ff
	.uleb128 0x1d
	.string	"data3"
	.byte	0x1
	.uahalf	0x114
	.uaword	0x19ff
	.uleb128 0x1e
	.string	"diff12"
	.byte	0x1
	.uahalf	0x116
	.uaword	0x226
	.uleb128 0x1e
	.string	"diff23"
	.byte	0x1
	.uahalf	0x117
	.uaword	0x226
	.uleb128 0x1e
	.string	"diff31"
	.byte	0x1
	.uahalf	0x118
	.uaword	0x226
	.uleb128 0x1e
	.string	"absDiff12"
	.byte	0x1
	.uahalf	0x11a
	.uaword	0x226
	.uleb128 0x1e
	.string	"absDiff23"
	.byte	0x1
	.uahalf	0x11b
	.uaword	0x226
	.uleb128 0x1e
	.string	"absDiff31"
	.byte	0x1
	.uahalf	0x11c
	.uaword	0x226
	.byte	0
	.uleb128 0x1f
	.string	"SDP_PedalBox_initSensorConfig"
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.byte	0x1
	.uaword	0x1b6b
	.uleb128 0x20
	.uaword	.LASF10
	.byte	0x1
	.byte	0x85
	.uaword	0x1b6b
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x1912
	.uleb128 0x1f
	.string	"SDP_PedalBox_initSensor"
	.byte	0x1
	.byte	0x8d
	.byte	0x1
	.byte	0x1
	.uaword	0x1c13
	.uleb128 0x18
	.string	"sensor"
	.byte	0x1
	.byte	0x8d
	.uaword	0x19ff
	.uleb128 0x20
	.uaword	.LASF10
	.byte	0x1
	.byte	0x8d
	.uaword	0x1b6b
	.uleb128 0x1a
	.uaword	.LASF4
	.byte	0x1
	.byte	0x8f
	.uaword	0x226
	.uleb128 0x19
	.string	"end"
	.byte	0x1
	.byte	0x90
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF5
	.byte	0x1
	.byte	0x91
	.uaword	0x226
	.uleb128 0x19
	.string	"len"
	.byte	0x1
	.byte	0x93
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF7
	.byte	0x1
	.byte	0x95
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF8
	.byte	0x1
	.byte	0x96
	.uaword	0x226
	.uleb128 0x1a
	.uaword	.LASF9
	.byte	0x1
	.byte	0xac
	.uaword	0x226
	.uleb128 0x19
	.string	"dzend"
	.byte	0x1
	.byte	0xad
	.uaword	0x226
	.uleb128 0x19
	.string	"dzlen"
	.byte	0x1
	.byte	0xae
	.uaword	0x226
	.byte	0
	.uleb128 0x21
	.uaword	0x193a
	.uaword	.LFB269
	.uaword	.LFE269
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x1c9a
	.uleb128 0x22
	.uaword	0x1963
	.byte	0x1
	.byte	0x64
	.uleb128 0x22
	.uaword	0x1971
	.byte	0x6
	.byte	0xfa
	.uaword	0x1971
	.byte	0x9f
	.uleb128 0x23
	.uaword	0x197c
	.uaword	.LLST0
	.uleb128 0x23
	.uaword	0x1989
	.uaword	.LLST1
	.uleb128 0x24
	.uaword	0x1997
	.byte	0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x24
	.uaword	0x19a2
	.byte	0x2
	.byte	0x84
	.sleb128 4
	.uleb128 0x24
	.uaword	0x19ad
	.byte	0x2
	.byte	0x84
	.sleb128 8
	.uleb128 0x23
	.uaword	0x19b8
	.uaword	.LLST2
	.uleb128 0x23
	.uaword	0x19c3
	.uaword	.LLST3
	.uleb128 0x24
	.uaword	0x19ce
	.byte	0x2
	.byte	0x84
	.sleb128 16
	.uleb128 0x23
	.uaword	0x19d9
	.uaword	.LLST4
	.uleb128 0x23
	.uaword	0x19e4
	.uaword	.LLST5
	.uleb128 0x23
	.uaword	0x19f1
	.uaword	.LLST6
	.byte	0
	.uleb128 0x25
	.string	"SDP_PedalBox_updatePPS"
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.uaword	.LFB263
	.uaword	.LFE263
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x1d1c
	.uleb128 0x26
	.string	"data_out"
	.byte	0x1
	.byte	0xfa
	.uaword	0x19ff
	.uaword	.LLST7
	.uleb128 0x26
	.string	"data_in"
	.byte	0x1
	.byte	0xfa
	.uaword	0x1a05
	.uaword	.LLST8
	.uleb128 0x27
	.uaword	.LVL25
	.uaword	0x1c13
	.uaword	0x1d08
	.uleb128 0x28
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.uleb128 0x29
	.uaword	0x1971
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0
	.uleb128 0x2a
	.uaword	.LVL27
	.uaword	0x1c13
	.uleb128 0x29
	.uaword	0x1971
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0
	.byte	0
	.uleb128 0x2b
	.byte	0x1
	.string	"SDP_PedalBox_init"
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.uaword	.LFB259
	.uaword	.LFE259
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x200a
	.uleb128 0x1a
	.uaword	.LASF10
	.byte	0x1
	.byte	0x5f
	.uaword	0x1912
	.uleb128 0x2c
	.uaword	0x1b71
	.uaword	.LBB34
	.uaword	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x66
	.uaword	0x1dd9
	.uleb128 0x22
	.uaword	0x1ba0
	.byte	0x6
	.byte	0xf2
	.uaword	.Ldebug_info0+7490
	.sleb128 0
	.uleb128 0x22
	.uaword	0x1b92
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps
	.byte	0x9f
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0
	.uleb128 0x2e
	.uaword	0x1bab
	.byte	0x4
	.uaword	0x41a5999a
	.uleb128 0x2e
	.uaword	0x1bb6
	.byte	0x4
	.uaword	0x41dccccd
	.uleb128 0x2e
	.uaword	0x1bc1
	.byte	0x4
	.uaword	0x40a00000
	.uleb128 0x2e
	.uaword	0x1bcc
	.byte	0x4
	.uaword	0x40dccccc
	.uleb128 0x2e
	.uaword	0x1bd7
	.byte	0x4
	.uaword	0x41c13334
	.uleb128 0x2e
	.uaword	0x1be2
	.byte	0x4
	.uaword	0x42944ccd
	.uleb128 0x2e
	.uaword	0x1bed
	.byte	0x4
	.uaword	0x41a85c29
	.uleb128 0x2e
	.uaword	0x1bf8
	.byte	0x4
	.uaword	0x41da0a3e
	.uleb128 0x2e
	.uaword	0x1c05
	.byte	0x4
	.uaword	0x40c6b854
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uaword	0x1b71
	.uaword	.LBB44
	.uaword	.Ldebug_ranges0+0x50
	.byte	0x1
	.byte	0x6d
	.uaword	0x1e65
	.uleb128 0x22
	.uaword	0x1ba0
	.byte	0x6
	.byte	0xf2
	.uaword	.Ldebug_info0+7490
	.sleb128 0
	.uleb128 0x22
	.uaword	0x1b92
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+48
	.byte	0x9f
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0x50
	.uleb128 0x2e
	.uaword	0x1bab
	.byte	0x4
	.uaword	0x417ccccd
	.uleb128 0x2e
	.uaword	0x1bb6
	.byte	0x4
	.uaword	0x41ba6666
	.uleb128 0x2e
	.uaword	0x1bc1
	.byte	0x4
	.uaword	0x40a00000
	.uleb128 0x2e
	.uaword	0x1bcc
	.byte	0x4
	.uaword	0x40effffe
	.uleb128 0x2e
	.uaword	0x1bd7
	.byte	0x4
	.uaword	0x419c6666
	.uleb128 0x2e
	.uaword	0x1be2
	.byte	0x4
	.uaword	0x428b199a
	.uleb128 0x2e
	.uaword	0x1bed
	.byte	0x4
	.uaword	0x41816666
	.uleb128 0x2e
	.uaword	0x1bf8
	.byte	0x4
	.uaword	0x41b76666
	.uleb128 0x2e
	.uaword	0x1c05
	.byte	0x4
	.uaword	0x40d80000
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uaword	0x1b71
	.uaword	.LBB48
	.uaword	.Ldebug_ranges0+0x70
	.byte	0x1
	.byte	0x74
	.uaword	0x1ef1
	.uleb128 0x22
	.uaword	0x1ba0
	.byte	0x6
	.byte	0xf2
	.uaword	.Ldebug_info0+7490
	.sleb128 0
	.uleb128 0x22
	.uaword	0x1b92
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+96
	.byte	0x9f
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0x70
	.uleb128 0x2e
	.uaword	0x1bab
	.byte	0x4
	.uaword	0x41926666
	.uleb128 0x2e
	.uaword	0x1bb6
	.byte	0x4
	.uaword	0x41ca6666
	.uleb128 0x2e
	.uaword	0x1bc1
	.byte	0x4
	.uaword	0x40a00000
	.uleb128 0x2e
	.uaword	0x1bcc
	.byte	0x4
	.uaword	0x40e00000
	.uleb128 0x2e
	.uaword	0x1bd7
	.byte	0x4
	.uaword	0x41ae6666
	.uleb128 0x2e
	.uaword	0x1be2
	.byte	0x4
	.uaword	0x428f999a
	.uleb128 0x2e
	.uaword	0x1bed
	.byte	0x4
	.uaword	0x41953333
	.uleb128 0x2e
	.uaword	0x1bf8
	.byte	0x4
	.uaword	0x41c79999
	.uleb128 0x2e
	.uaword	0x1c05
	.byte	0x4
	.uaword	0x40c99998
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uaword	0x1b71
	.uaword	.LBB68
	.uaword	.Ldebug_ranges0+0xb8
	.byte	0x1
	.byte	0x7b
	.uaword	0x1f7d
	.uleb128 0x22
	.uaword	0x1ba0
	.byte	0x6
	.byte	0xf2
	.uaword	.Ldebug_info0+7490
	.sleb128 0
	.uleb128 0x22
	.uaword	0x1b92
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+144
	.byte	0x9f
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0xb8
	.uleb128 0x2e
	.uaword	0x1bab
	.byte	0x4
	.uaword	0x429c6666
	.uleb128 0x2e
	.uaword	0x1bb6
	.byte	0x4
	.uaword	0x42a76666
	.uleb128 0x2e
	.uaword	0x1bc1
	.byte	0x4
	.uaword	0x40a00000
	.uleb128 0x2e
	.uaword	0x1bcc
	.byte	0x4
	.uaword	0x40b00000
	.uleb128 0x2e
	.uaword	0x1bd7
	.byte	0x4
	.uaword	0x42a1e666
	.uleb128 0x2e
	.uaword	0x1be2
	.byte	0x4
	.uaword	0x4302f333
	.uleb128 0x2e
	.uaword	0x1bed
	.byte	0x4
	.uaword	0x429cf333
	.uleb128 0x2e
	.uaword	0x1bf8
	.byte	0x4
	.uaword	0x42a6d999
	.uleb128 0x2e
	.uaword	0x1c05
	.byte	0x4
	.uaword	0x409e6660
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uaword	0x1b71
	.uaword	.LBB80
	.uaword	.LBE80
	.byte	0x1
	.byte	0x82
	.uleb128 0x22
	.uaword	0x1ba0
	.byte	0x6
	.byte	0xf2
	.uaword	.Ldebug_info0+7490
	.sleb128 0
	.uleb128 0x22
	.uaword	0x1b92
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+192
	.byte	0x9f
	.uleb128 0x30
	.uaword	.LBB81
	.uaword	.LBE81
	.uleb128 0x2e
	.uaword	0x1bab
	.byte	0x4
	.uaword	0x422a6666
	.uleb128 0x2e
	.uaword	0x1bb6
	.byte	0x4
	.uaword	0x423e6666
	.uleb128 0x2e
	.uaword	0x1bc1
	.byte	0x4
	.uaword	0x40a00000
	.uleb128 0x2e
	.uaword	0x1bcc
	.byte	0x4
	.uaword	0x40a00000
	.uleb128 0x2e
	.uaword	0x1bd7
	.byte	0x4
	.uaword	0x42346666
	.uleb128 0x2e
	.uaword	0x1be2
	.byte	0x4
	.uaword	0x42be3333
	.uleb128 0x2e
	.uaword	0x1bed
	.byte	0x4
	.uaword	0x422b6666
	.uleb128 0x2e
	.uaword	0x1bf8
	.byte	0x4
	.uaword	0x423d6666
	.uleb128 0x2e
	.uaword	0x1c05
	.byte	0x4
	.uaword	0x40900000
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.string	"SDP_PedalBox_updateBPPS"
	.byte	0x1
	.uahalf	0x152
	.byte	0x1
	.byte	0x1
	.uaword	0x2049
	.uleb128 0x1e
	.string	"okCount"
	.byte	0x1
	.uahalf	0x154
	.uaword	0x1bb
	.uleb128 0x1e
	.string	"sum"
	.byte	0x1
	.uahalf	0x155
	.uaword	0x226
	.byte	0
	.uleb128 0x1c
	.string	"SDP_PedalBox_updateAPPS"
	.byte	0x1
	.uahalf	0x174
	.byte	0x1
	.byte	0x1
	.uaword	0x2088
	.uleb128 0x1e
	.string	"okCount"
	.byte	0x1
	.uahalf	0x176
	.uaword	0x1bb
	.uleb128 0x1e
	.string	"sum"
	.byte	0x1
	.uahalf	0x177
	.uaword	0x226
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.string	"SDP_PedalBox_run_1ms"
	.byte	0x1
	.uahalf	0x19e
	.byte	0x1
	.uaword	.LFB268
	.uaword	.LFE268
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x2269
	.uleb128 0x32
	.uaword	0x200a
	.uaword	.LBB90
	.uaword	.Ldebug_ranges0+0xd8
	.byte	0x1
	.uahalf	0x1a0
	.uaword	0x216c
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0xd8
	.uleb128 0x23
	.uaword	0x202c
	.uaword	.LLST9
	.uleb128 0x23
	.uaword	0x203c
	.uaword	.LLST10
	.uleb128 0x32
	.uaword	0x1a10
	.uaword	.LBB92
	.uaword	.Ldebug_ranges0+0xf0
	.byte	0x1
	.uahalf	0x15a
	.uaword	0x213a
	.uleb128 0x22
	.uaword	0x1a3f
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+144
	.byte	0x9f
	.uleb128 0x22
	.uaword	0x1a3f
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+144
	.byte	0x9f
	.uleb128 0x22
	.uaword	0x1a4d
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+192
	.byte	0x9f
	.uleb128 0x22
	.uaword	0x1a4d
	.byte	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+192
	.byte	0x9f
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0xf0
	.uleb128 0x23
	.uaword	0x1a5b
	.uaword	.LLST11
	.uleb128 0x23
	.uaword	0x1a68
	.uaword	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x27
	.uaword	.LVL34
	.uaword	0x1c9a
	.uaword	0x2154
	.uleb128 0x28
	.byte	0x1
	.byte	0x65
	.byte	0x2
	.byte	0x8c
	.sleb128 0
	.uleb128 0x28
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x2a
	.uaword	.LVL35
	.uaword	0x1c9a
	.uleb128 0x28
	.byte	0x1
	.byte	0x65
	.byte	0x2
	.byte	0x8c
	.sleb128 56
	.uleb128 0x28
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 48
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x33
	.uaword	0x2049
	.uaword	.LBB101
	.uaword	.Ldebug_ranges0+0x118
	.byte	0x1
	.uahalf	0x1a1
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0x118
	.uleb128 0x23
	.uaword	0x206b
	.uaword	.LLST13
	.uleb128 0x23
	.uaword	0x207b
	.uaword	.LLST14
	.uleb128 0x32
	.uaword	0x1a79
	.uaword	.LBB103
	.uaword	.Ldebug_ranges0+0x130
	.byte	0x1
	.uahalf	0x17d
	.uaword	0x221a
	.uleb128 0x34
	.uaword	0x1aaa
	.uaword	.LLST15
	.uleb128 0x34
	.uaword	0x1aaa
	.uaword	.LLST15
	.uleb128 0x34
	.uaword	0x1ab8
	.uaword	.LLST17
	.uleb128 0x34
	.uaword	0x1ab8
	.uaword	.LLST17
	.uleb128 0x34
	.uaword	0x1ac6
	.uaword	.LLST19
	.uleb128 0x34
	.uaword	0x1ac6
	.uaword	.LLST19
	.uleb128 0x2d
	.uaword	.Ldebug_ranges0+0x130
	.uleb128 0x23
	.uaword	0x1ad4
	.uaword	.LLST21
	.uleb128 0x23
	.uaword	0x1ae3
	.uaword	.LLST22
	.uleb128 0x23
	.uaword	0x1af2
	.uaword	.LLST23
	.uleb128 0x23
	.uaword	0x1b01
	.uaword	.LLST24
	.uleb128 0x23
	.uaword	0x1b13
	.uaword	.LLST25
	.uleb128 0x23
	.uaword	0x1b25
	.uaword	.LLST26
	.byte	0
	.byte	0
	.uleb128 0x27
	.uaword	.LVL38
	.uaword	0x1c9a
	.uaword	0x2234
	.uleb128 0x28
	.byte	0x1
	.byte	0x65
	.byte	0x2
	.byte	0x8d
	.sleb128 0
	.uleb128 0x28
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.uaword	.LVL39
	.uaword	0x1c9a
	.uaword	0x224e
	.uleb128 0x28
	.byte	0x1
	.byte	0x65
	.byte	0x2
	.byte	0x8d
	.sleb128 56
	.uleb128 0x28
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 48
	.byte	0
	.uleb128 0x2a
	.uaword	.LVL40
	.uaword	0x1c9a
	.uleb128 0x28
	.byte	0x1
	.byte	0x65
	.byte	0x3
	.byte	0x8d
	.sleb128 112
	.uleb128 0x28
	.byte	0x1
	.byte	0x64
	.byte	0x3
	.byte	0x8f
	.sleb128 96
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uaword	0x2ae
	.uaword	0x2279
	.uleb128 0x12
	.uaword	0x11eb
	.byte	0x2
	.byte	0
	.uleb128 0x35
	.string	"IfxCpu_cfg_indexMap"
	.byte	0x6
	.byte	0x96
	.uaword	0x2296
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.uaword	0x2269
	.uleb128 0x35
	.string	"HLD_GtmTim"
	.byte	0x8
	.byte	0x35
	.uaword	0x16cf
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.string	"SDP_PedalBox"
	.byte	0x1
	.byte	0x4c
	.uaword	0x18a8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	SDP_PedalBox
	.uleb128 0x36
	.string	"SDP_PedalBox_pps"
	.byte	0x1
	.byte	0x4b
	.uaword	0x182d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	SDP_PedalBox_pps
	.uleb128 0x36
	.string	"SDP_PedalBox_errorLimit"
	.byte	0x1
	.byte	0x49
	.uaword	0x226
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	SDP_PedalBox_errorLimit
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4
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
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x410a
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0x2d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x35
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x36
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
	.byte	0
.section .debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LVL0
	.uaword	.LVL10
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL13
	.uaword	.LVL21
	.uahalf	0x1
	.byte	0x54
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LVL12
	.uaword	.LVL13
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL23
	.uaword	.LFE269
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LVL0
	.uaword	.LVL5
	.uahalf	0x2
	.byte	0x84
	.sleb128 24
	.uaword	.LVL13
	.uaword	.LVL16
	.uahalf	0x2
	.byte	0x84
	.sleb128 24
	.uaword	.LVL16
	.uaword	.LVL18
	.uahalf	0x6
	.byte	0xf5
	.uleb128 0x3
	.uleb128 0x17b
	.byte	0x1f
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LVL1
	.uaword	.LVL2
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL2
	.uaword	.LVL3
	.uahalf	0xe
	.byte	0xf5
	.uleb128 0x2
	.uleb128 0x17b
	.byte	0xf4
	.uleb128 0x17b
	.byte	0x4
	.uaword	0x42c80000
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL3
	.uaword	.LVL4
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL4
	.uaword	.LVL5
	.uahalf	0x10
	.byte	0x84
	.sleb128 20
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0xf4
	.uleb128 0x17b
	.byte	0x4
	.uaword	0x42c80000
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL13
	.uaword	.LVL14
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL14
	.uaword	.LVL16
	.uahalf	0x2
	.byte	0x84
	.sleb128 20
	.uaword	.LVL16
	.uaword	.LVL17
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL17
	.uaword	.LVL18
	.uahalf	0x2
	.byte	0x84
	.sleb128 20
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LVL6
	.uaword	.LVL13
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL20
	.uaword	.LFE269
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LVL7
	.uaword	.LVL9
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL9
	.uaword	.LVL13
	.uahalf	0x2
	.byte	0x84
	.sleb128 32
	.uaword	.LVL20
	.uaword	.LFE269
	.uahalf	0x2
	.byte	0x84
	.sleb128 32
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LVL8
	.uaword	.LVL11
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL11
	.uaword	.LVL13
	.uahalf	0x2
	.byte	0x84
	.sleb128 36
	.uaword	.LVL20
	.uaword	.LVL22
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL22
	.uaword	.LFE269
	.uahalf	0x2
	.byte	0x84
	.sleb128 36
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LVL24
	.uaword	.LVL25-1
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL25-1
	.uaword	.LVL26
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL26
	.uaword	.LVL27-1
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL27-1
	.uaword	.LFE263
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LVL24
	.uaword	.LVL25-1
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL25-1
	.uaword	.LVL26
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	.LVL26
	.uaword	.LVL27-1
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL27-1
	.uaword	.LFE263
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST9:
	.uaword	.LVL33
	.uaword	.LVL36
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL64
	.uaword	.LVL65
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL65
	.uaword	.LVL66
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL66
	.uaword	.LVL67
	.uahalf	0x2
	.byte	0x32
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST10:
	.uaword	.LVL33
	.uaword	.LVL36
	.uahalf	0x6
	.byte	0x9e
	.uleb128 0x4
	.uaword	0
	.uaword	.LVL64
	.uaword	.LVL65
	.uahalf	0x6
	.byte	0x9e
	.uleb128 0x4
	.uaword	0
	.uaword	.LVL65
	.uaword	.LVL66
	.uahalf	0xe
	.byte	0xf5
	.uleb128 0x2
	.uleb128 0x17b
	.byte	0xf4
	.uleb128 0x17b
	.byte	0x4
	.uaword	0
	.byte	0x22
	.byte	0x9f
	.uaword	.LVL66
	.uaword	.LVL67
	.uahalf	0xf
	.byte	0xf5
	.uleb128 0x2
	.uleb128 0x17b
	.byte	0x3
	.uaword	SDP_PedalBox_pps+232
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x22
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST11:
	.uaword	.LVL35
	.uaword	.LVL38-1
	.uahalf	0x14
	.byte	0x3
	.uaword	SDP_PedalBox_pps+184
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x3
	.uaword	SDP_PedalBox_pps+232
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL64
	.uaword	.LVL67
	.uahalf	0x14
	.byte	0x3
	.uaword	SDP_PedalBox_pps+184
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x3
	.uaword	SDP_PedalBox_pps+232
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST12:
	.uaword	.LVL35
	.uaword	.LVL38-1
	.uahalf	0x15
	.byte	0x3
	.uaword	SDP_PedalBox_pps+184
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x3
	.uaword	SDP_PedalBox_pps+232
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	.LVL64
	.uaword	.LVL67
	.uahalf	0x15
	.byte	0x3
	.uaword	SDP_PedalBox_pps+184
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x3
	.uaword	SDP_PedalBox_pps+232
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST13:
	.uaword	.LVL37
	.uaword	.LVL51
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL51
	.uaword	.LVL52
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL52
	.uaword	.LVL53
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL55
	.uaword	.LVL56
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL58
	.uaword	.LVL59
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL61
	.uaword	.LVL64
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LVL72
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL72
	.uaword	.LVL74
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST14:
	.uaword	.LVL37
	.uaword	.LVL51
	.uahalf	0x6
	.byte	0x9e
	.uleb128 0x4
	.uaword	0
	.uaword	.LVL51
	.uaword	.LVL60
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL61
	.uaword	.LVL64
	.uahalf	0x6
	.byte	0x9e
	.uleb128 0x4
	.uaword	0
	.uaword	.LVL67
	.uaword	.LVL72
	.uahalf	0x6
	.byte	0x9e
	.uleb128 0x4
	.uaword	0
	.uaword	.LVL72
	.uaword	.LVL74
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST15:
	.uaword	.LVL41
	.uaword	.LVL64
	.uahalf	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LFE268
	.uahalf	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST17:
	.uaword	.LVL41
	.uaword	.LVL64
	.uahalf	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+48
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LFE268
	.uahalf	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+48
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST19:
	.uaword	.LVL41
	.uaword	.LVL64
	.uahalf	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+96
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LFE268
	.uahalf	0x6
	.byte	0x3
	.uaword	SDP_PedalBox_pps+96
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST21:
	.uaword	.LVL41
	.uaword	.LVL42
	.uahalf	0xa
	.byte	0xf5
	.uleb128 0xf
	.uleb128 0x17b
	.byte	0xf5
	.uleb128 0x3
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL42
	.uaword	.LVL44
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL44
	.uaword	.LVL46
	.uahalf	0xd
	.byte	0xf5
	.uleb128 0xf
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL46
	.uaword	.LVL64
	.uahalf	0xf
	.byte	0x8f
	.sleb128 40
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LFE268
	.uahalf	0xf
	.byte	0x8f
	.sleb128 40
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST22:
	.uaword	.LVL41
	.uaword	.LVL43
	.uahalf	0xa
	.byte	0xf5
	.uleb128 0x3
	.uleb128 0x17b
	.byte	0xf5
	.uleb128 0x5
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL43
	.uaword	.LVL47
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL47
	.uaword	.LVL64
	.uahalf	0x10
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LFE268
	.uahalf	0x10
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST23:
	.uaword	.LVL41
	.uaword	.LVL45
	.uahalf	0xa
	.byte	0xf5
	.uleb128 0x5
	.uleb128 0x17b
	.byte	0xf5
	.uleb128 0xf
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL45
	.uaword	.LVL48
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL48
	.uaword	.LVL64
	.uahalf	0xf
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 40
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LFE268
	.uahalf	0xf
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 40
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST24:
	.uaword	.LVL44
	.uaword	.LVL50
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL50
	.uaword	.LVL61
	.uahalf	0x10
	.byte	0x8f
	.sleb128 40
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	.LVL61
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL62
	.uaword	.LVL64
	.uahalf	0x10
	.byte	0x8f
	.sleb128 40
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LVL70
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL70
	.uaword	.LFE268
	.uahalf	0x10
	.byte	0x8f
	.sleb128 40
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST25:
	.uaword	.LVL47
	.uaword	.LVL49
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL49
	.uaword	.LVL61
	.uahalf	0x11
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	.LVL61
	.uaword	.LVL63
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL63
	.uaword	.LVL64
	.uahalf	0x11
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	.LVL67
	.uaword	.LVL68
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL68
	.uaword	.LVL69
	.uahalf	0x11
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	.LVL69
	.uaword	.LVL71
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL71
	.uaword	.LFE268
	.uahalf	0x11
	.byte	0x8f
	.sleb128 88
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x8f
	.sleb128 136
	.byte	0xf6
	.byte	0x4
	.uleb128 0x17b
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST26:
	.uaword	.LVL48
	.uaword	.LVL64
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL67
	.uaword	.LFE268
	.uahalf	0x1
	.byte	0x55
	.uaword	0
	.uaword	0
.section .debug_aranges,"",@progbits
	.uaword	0x34
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.LFB269
	.uaword	.LFE269-.LFB269
	.uaword	.LFB263
	.uaword	.LFE263-.LFB263
	.uaword	.LFB259
	.uaword	.LFE259-.LFB259
	.uaword	.LFB268
	.uaword	.LFE268-.LFB268
	.uaword	0
	.uaword	0
.section .debug_ranges,"",@progbits
.Ldebug_ranges0:
	.uaword	.LBB34
	.uaword	.LBE34
	.uaword	.LBB57
	.uaword	.LBE57
	.uaword	.LBB59
	.uaword	.LBE59
	.uaword	.LBB62
	.uaword	.LBE62
	.uaword	.LBB64
	.uaword	.LBE64
	.uaword	.LBB66
	.uaword	.LBE66
	.uaword	.LBB72
	.uaword	.LBE72
	.uaword	.LBB74
	.uaword	.LBE74
	.uaword	.LBB76
	.uaword	.LBE76
	.uaword	0
	.uaword	0
	.uaword	.LBB44
	.uaword	.LBE44
	.uaword	.LBB60
	.uaword	.LBE60
	.uaword	.LBB77
	.uaword	.LBE77
	.uaword	0
	.uaword	0
	.uaword	.LBB48
	.uaword	.LBE48
	.uaword	.LBB58
	.uaword	.LBE58
	.uaword	.LBB61
	.uaword	.LBE61
	.uaword	.LBB63
	.uaword	.LBE63
	.uaword	.LBB65
	.uaword	.LBE65
	.uaword	.LBB67
	.uaword	.LBE67
	.uaword	.LBB73
	.uaword	.LBE73
	.uaword	.LBB78
	.uaword	.LBE78
	.uaword	0
	.uaword	0
	.uaword	.LBB68
	.uaword	.LBE68
	.uaword	.LBB75
	.uaword	.LBE75
	.uaword	.LBB79
	.uaword	.LBE79
	.uaword	0
	.uaword	0
	.uaword	.LBB90
	.uaword	.LBE90
	.uaword	.LBB110
	.uaword	.LBE110
	.uaword	0
	.uaword	0
	.uaword	.LBB92
	.uaword	.LBE92
	.uaword	.LBB97
	.uaword	.LBE97
	.uaword	.LBB98
	.uaword	.LBE98
	.uaword	.LBB99
	.uaword	.LBE99
	.uaword	0
	.uaword	0
	.uaword	.LBB101
	.uaword	.LBE101
	.uaword	.LBB111
	.uaword	.LBE111
	.uaword	0
	.uaword	0
	.uaword	.LBB103
	.uaword	.LBE103
	.uaword	.LBB107
	.uaword	.LBE107
	.uaword	.LBB108
	.uaword	.LBE108
	.uaword	0
	.uaword	0
	.uaword	.LFB269
	.uaword	.LFE269
	.uaword	.LFB263
	.uaword	.LFE263
	.uaword	.LFB259
	.uaword	.LFE259
	.uaword	.LFB268
	.uaword	.LFE268
	.uaword	0
	.uaword	0
.section .debug_line,"",@progbits
.Ldebug_line0:
.section .debug_str,"",@progbits
.LASF6:
	.string	"reversed"
.LASF4:
	.string	"start"
.LASF1:
	.string	"reserved_6"
.LASF10:
	.string	"config"
.LASF3:
	.string	"reserved_8"
.LASF0:
	.string	"reserved_24"
.LASF8:
	.string	"opposite"
.LASF11:
	.string	"isValueOk"
.LASF7:
	.string	"center"
.LASF5:
	.string	"deadzone"
.LASF9:
	.string	"dzstart"
.LASF2:
	.string	"IRQ_MODE"
	.extern	HLD_GtmTim,STT_OBJECT,560
	.ident	"GCC: (HighTec Release HDP-v4.9.3.0-infineon-1.0-fb21a99) 4.9.4 build on 2019-06-07"
