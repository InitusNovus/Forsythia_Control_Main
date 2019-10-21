	.file	"IfxI2c_I2c.c"
.section .text,"ax",@progbits
.Ltext0:
.section .text.IfxI2c_I2c_initConfig,"ax",@progbits
	.align 1
	.global	IfxI2c_I2c_initConfig
	.type	IfxI2c_I2c_initConfig, @function
IfxI2c_I2c_initConfig:
.LFB277:
	.file 1 "0_Src/BaseSw/iLLD/TC27D/Tricore/I2c/I2c/IfxI2c_I2c.c"
	.loc 1 35 0
.LVL0:
	.loc 1 37 0
	movh	%d15, 18627
	addi	%d15, %d15, 20480
	st.w	[%a4] 4, %d15
	.loc 1 38 0
	mov	%d15, 0
	.loc 1 36 0
	st.a	[%a4]0, %a5
	.loc 1 38 0
	st.w	[%a4] 8, %d15
	ret
.LFE277:
	.size	IfxI2c_I2c_initConfig, .-IfxI2c_I2c_initConfig
.section .text.IfxI2c_I2c_initDevice,"ax",@progbits
	.align 1
	.global	IfxI2c_I2c_initDevice
	.type	IfxI2c_I2c_initDevice, @function
IfxI2c_I2c_initDevice:
.LFB278:
	.loc 1 43 0
.LVL1:
	.loc 1 44 0
	ld.w	%d15, [%a5]0
	st.w	[%a4]0, %d15
	.loc 1 45 0
	ld.bu	%d15, [%a5] 4
	st.b	[%a4] 4, %d15
	ret
.LFE278:
	.size	IfxI2c_I2c_initDevice, .-IfxI2c_I2c_initDevice
.section .text.IfxI2c_I2c_initDeviceConfig,"ax",@progbits
	.align 1
	.global	IfxI2c_I2c_initDeviceConfig
	.type	IfxI2c_I2c_initDeviceConfig, @function
IfxI2c_I2c_initDeviceConfig:
.LFB279:
	.loc 1 50 0
.LVL2:
	.loc 1 52 0
	mov	%d15, -1
	.loc 1 51 0
	st.a	[%a4]0, %a5
	.loc 1 52 0
	st.b	[%a4] 4, %d15
	ret
.LFE279:
	.size	IfxI2c_I2c_initDeviceConfig, .-IfxI2c_I2c_initDeviceConfig
.section .text.IfxI2c_I2c_initModule,"ax",@progbits
	.align 1
	.global	IfxI2c_I2c_initModule
	.type	IfxI2c_I2c_initModule, @function
IfxI2c_I2c_initModule:
.LFB280:
	.loc 1 57 0
.LVL3:
	.loc 1 58 0
	ld.a	%a15, [%a5]0
.LVL4:
	.loc 1 57 0
	mov.aa	%a12, %a4
	mov.aa	%a13, %a5
	.loc 1 59 0
	st.a	[%a4]0, %a15
	.loc 1 61 0
	mov.aa	%a4, %a15
.LVL5:
	call	IfxI2c_enableModule
.LVL6:
.LBB168:
.LBB169:
	.file 2 "0_Src/BaseSw/iLLD/TC27D/Tricore/I2c/Std/IfxI2c.h"
	.loc 2 908 0
	mov	%d15, 0
.LBE169:
.LBE168:
	.loc 1 63 0
	mov.aa	%a4, %a15
.LBB171:
.LBB170:
	.loc 2 908 0
	st.w	[%a15] 16, %d15
.LBE170:
.LBE171:
	.loc 1 63 0
	call	IfxI2c_configureAsMaster
.LVL7:
	.loc 1 64 0
	mov.aa	%a4, %a15
	ld.w	%d4, [%a13] 4
	call	IfxI2c_setBaudrate
.LVL8:
	.loc 1 65 0
	ld.a	%a2, [%a13] 8
	ld.a	%a4, [%a2]0
	ld.a	%a5, [%a2] 4
	ld.bu	%d4, [%a2] 8
	call	IfxI2c_initSclSdaPin
.LVL9:
.LBB172:
.LBB173:
	.loc 2 872 0
	mov	%d2, 1
	st.w	[%a15] 16, %d2
.LBE173:
.LBE172:
	.loc 1 67 0
	mov.aa	%a4, %a15
	call	IfxI2c_getBaudrate
.LVL10:
	st.w	[%a12] 8, %d2
.LVL11:
.LBB174:
.LBB175:
	.loc 2 753 0
	ld.w	%d2, [%a15] 36
.LBE175:
.LBE174:
	.loc 1 69 0
	st.b	[%a12] 5, %d15
.LBB177:
.LBB176:
	.loc 2 753 0
	and	%d2, %d2, 3
.LBE176:
.LBE177:
	.loc 1 68 0
	st.b	[%a12] 4, %d2
	.loc 1 69 0
	ret
.LFE280:
	.size	IfxI2c_I2c_initModule, .-IfxI2c_I2c_initModule
.section .text.IfxI2c_I2c_read,"ax",@progbits
	.align 1
	.global	IfxI2c_I2c_read
	.type	IfxI2c_I2c_read, @function
IfxI2c_I2c_read:
.LFB281:
	.loc 1 74 0
.LVL12:
	.loc 1 76 0
	ld.a	%a2, [%a4]0
	ld.a	%a15, [%a2]0
.LVL13:
	.loc 1 80 0
	mov	%d15, 0
	.loc 1 74 0
	sub.a	%SP, 8
.LCFI0:
	.loc 1 80 0
	st.w	[%SP] 4, %d15
.LBB178:
.LBB179:
	.loc 2 573 0
	ld.w	%d15, [%a15] 36
.LBE179:
.LBE178:
	.loc 1 78 0
	ld.bu	%d2, [%a4] 4
.LVL14:
.LBB181:
.LBB180:
	.loc 2 573 0
	and	%d15, %d15, 3
	jnz	%d15, .L77
.LVL15:
.LBE180:
.LBE181:
.LBB182:
.LBB183:
	.loc 2 596 0
	mov	%d15, 127
	st.w	[%a15] 120, %d15
.LVL16:
.LBE183:
.LBE182:
.LBB184:
.LBB185:
	.loc 2 590 0
	mov	%d15, 15
	st.w	[%a15] 104, %d15
.LBE185:
.LBE184:
	.loc 1 98 0
	or	%d15, %d2, 1
.LVL17:
.LBB186:
.LBB187:
	.loc 2 902 0
	ld.w	%d2, [%a15] 52
.LVL18:
.LBE187:
.LBE186:
.LBB190:
.LBB191:
	.loc 2 921 0
	lea	%a2, [%a15] -32768
.LBE191:
.LBE190:
.LBB194:
.LBB188:
	.loc 2 902 0
	insert	%d2, %d2, 1, 0, 14
.LBE188:
.LBE194:
.LBB195:
.LBB192:
	.loc 2 921 0
	addih.a	%a2, %a2, 1
.LBE192:
.LBE195:
.LBB196:
.LBB189:
	.loc 2 902 0
	st.w	[%a15] 52, %d2
.LVL19:
.LBE189:
.LBE196:
.LBB197:
.LBB198:
	.loc 2 884 0
	ld.w	%d2, [%a15] 44
	insert	%d2, %d2, %d4, 0, 14
	st.w	[%a15] 44, %d2
.LVL20:
.LBE198:
.LBE197:
.LBB199:
.LBB193:
	.loc 2 921 0
	st.w	[%a2]0, %d15
.LVL21:
.LBE193:
.LBE199:
.LBB200:
.LBB201:
	.loc 2 620 0
	ld.w	%d15, [%a15] 140
.LVL22:
	or	%d15, %d15, 1
	st.w	[%a15] 140, %d15
.LVL23:
.LBE201:
.LBE200:
.LBB202:
.LBB203:
	.loc 2 632 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 2
	st.w	[%a15] 140, %d15
.LVL24:
.LBE203:
.LBE202:
.LBB204:
.LBB205:
	.loc 2 614 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 4
	st.w	[%a15] 140, %d15
.LVL25:
.LBE205:
.LBE204:
.LBB206:
.LBB207:
	.loc 2 602 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 8
	st.w	[%a15] 140, %d15
.L8:
.LBE207:
.LBE206:
	.loc 1 108 0 discriminator 1
	ld.w	%d15, [%a15] 116
	jnz.t	%d15, 0, .L8
	.loc 1 112 0
	ld.w	%d15, [%a15] 100
	jz	%d15, .L78
.LVL26:
.L73:
.LBB208:
.LBB209:
.LBB210:
	.loc 2 590 0
	mov	%d15, 15
	st.w	[%a15] 104, %d15
.LVL27:
.LBE210:
.LBE209:
	.loc 1 265 0
	mov	%d15, 4
.LVL28:
.L10:
	mov.aa	%a12, %a4
.LVL29:
.LBE208:
	.loc 1 269 0
	mov.aa	%a4, %a15
.LVL30:
	call	IfxI2c_releaseBus
.LVL31:
.LBB280:
.LBB281:
	.loc 2 753 0
	ld.w	%d2, [%a15] 36
.LBE281:
.LBE280:
	.loc 1 270 0
	ld.a	%a2, [%a12]0
.LVL32:
.LBB283:
.LBB282:
	.loc 2 753 0
	and	%d2, %d2, 3
.LBE282:
.LBE283:
	.loc 1 270 0
	st.b	[%a2] 4, %d2
	.loc 1 271 0
	st.b	[%a2] 5, %d15
	.loc 1 272 0
	mov	%d2, %d15
	ret
.LVL33:
.L77:
.LBB284:
.LBB285:
	.loc 2 753 0
	ld.w	%d15, [%a15] 36
.LBE285:
.LBE284:
	.loc 1 91 0
	mov	%d2, 3
.LBB287:
.LBB286:
	.loc 2 753 0
	and	%d15, %d15, 3
.LBE286:
.LBE287:
	.loc 1 89 0
	st.b	[%a2] 4, %d15
.LVL34:
	.loc 1 90 0
	mov	%d15, 3
	st.b	[%a2] 5, %d15
	.loc 1 91 0
	ret
.LVL35:
.L78:
.LBB288:
.LBB289:
	.loc 2 828 0
	ld.w	%d15, [%a15] 116
.LBE289:
.LBE288:
	.loc 1 117 0
	jz.t	%d15, 3, .L11
.LVL36:
.LBB290:
.LBB291:
	.loc 2 626 0
	mov	%d15, 8
	st.w	[%a15] 120, %d15
.LVL37:
.LBE291:
.LBE290:
	.loc 1 120 0
	mov	%d15, 2
	j	.L10
.LVL38:
.L11:
.LBB292:
.LBB293:
	.loc 2 828 0
	ld.w	%d15, [%a15] 116
.LBE293:
.LBE292:
	.loc 1 122 0
	jnz.t	%d15, 4, .L79
	.loc 1 75 0
	mov	%d15, 0
	.loc 1 127 0
	jlez	%d4, .L10
.LBB294:
	.loc 1 130 0
	lt	%d15, %d4, 33
.LBE294:
	.loc 1 81 0
	mov	%d3, %d4
.LBB295:
	.loc 1 130 0
	jnz	%d15, .L60
.LVL39:
.LBB211:
.LBB212:
.LBB213:
.LBB214:
.LBB215:
.LBB216:
	.file 3 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h"
	.loc 3 632 0
#APP
	# 632 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h" 1
	mfcr %d7, LO:0xFE2C
	# 0 "" 2
.LVL40:
#NO_APP
.LBE216:
	.loc 3 633 0
	extr.u	%d7, %d7, 15, 1
.LVL41:
.LBE215:
.LBE214:
	.loc 3 641 0
#APP
	# 641 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h" 1
	disable
	# 0 "" 2
#NO_APP
.LBB217:
.LBB218:
	.file 4 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu_IntrinsicsGnuc.h"
	.loc 4 1436 0
#APP
	# 1436 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu_IntrinsicsGnuc.h" 1
	nop
	# 0 "" 2
.LVL42:
#NO_APP
.LBE218:
.LBE217:
.LBE213:
.LBE212:
.LBB219:
.LBB220:
	.loc 1 157 0
	lea	%a12, [%a15] -16384
.LBE220:
.LBE219:
	.loc 1 135 0
	mov	%d5, 0
.LBB235:
.LBB229:
	.loc 1 157 0
	addih.a	%a12, %a12, 1
.LVL43:
.L23:
.LBE229:
	.loc 1 137 0
	jlt	%d3, 4, .L14
.LVL44:
	.loc 1 140 0
	add	%d3, -4
.LVL45:
	.loc 1 139 0
	mov	%d6, 4
.LVL46:
.L16:
	.loc 1 150 0 discriminator 1
	ld.w	%d15, [%a15] 128
.LVL47:
	jz	%d15, .L16
	.loc 1 155 0
	and	%d2, %d15, 15
	jz	%d2, .L17
.LBB230:
	.loc 1 157 0
	ld.w	%d2, [%a12]0
	mov.a	%a2, %d6
	st.w	[%SP] 4, %d2
.LVL48:
	.loc 1 160 0
	mov.a	%a3, 0
	add.a	%a2, -1
	jz	%d6, .L19
.LVL49:
.L53:
	.loc 1 162 0 discriminator 3
	lea	%a6, [%SP] 4
.LVL50:
	addsc.a	%a7, %a3, %d5, 0
	add.a	%a6, %a3
.LVL51:
	ld.bu	%d2, [%a6]0
	add.a	%a7, %a5
	st.b	[%a7]0, %d2
	.loc 1 160 0 discriminator 3
	add.a	%a3, 1
.LVL52:
	loop	%a2, .L53
.LVL53:
.L19:
.LBB221:
.LBB222:
	.loc 2 620 0
	ld.w	%d2, [%a15] 140
	or	%d2, %d2, 1
	st.w	[%a15] 140, %d2
.LVL54:
.LBE222:
.LBE221:
.LBB223:
.LBB224:
	.loc 2 632 0
	ld.w	%d2, [%a15] 140
	or	%d2, %d2, 2
	st.w	[%a15] 140, %d2
.LVL55:
.LBE224:
.LBE223:
.LBB225:
.LBB226:
	.loc 2 614 0
	ld.w	%d2, [%a15] 140
	or	%d2, %d2, 4
	st.w	[%a15] 140, %d2
.LVL56:
.LBE226:
.LBE225:
.LBB227:
.LBB228:
	.loc 2 602 0
	ld.w	%d2, [%a15] 140
	or	%d2, %d2, 8
	st.w	[%a15] 140, %d2
.LVL57:
.L17:
.LBE228:
.LBE227:
.LBE230:
	.loc 1 172 0
	jnz.t	%d15, 5, .L80
	.loc 1 179 0
	jnz.t	%d15, 4, .L81
.LBE235:
	.loc 1 135 0 discriminator 2
	add	%d5, 4
.LVL58:
	jlt.u	%d5, %d4, .L23
.LBE211:
.LBE295:
	.loc 1 75 0
	mov	%d15, 0
.LVL59:
.L21:
.LBB296:
.LBB244:
.LBB236:
.LBB237:
	.loc 3 916 0
	jz	%d7, .L25
	.loc 3 918 0
#APP
	# 918 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h" 1
	enable
	# 0 "" 2
#NO_APP
.L25:
.LVL60:
.LBE237:
.LBE236:
.LBB238:
.LBB239:
	.loc 2 828 0 discriminator 1
	ld.w	%d2, [%a15] 116
.LBE239:
.LBE238:
	.loc 1 190 0 discriminator 1
	jz.t	%d2, 5, .L25
.LVL61:
.LBB240:
.LBB241:
	.loc 2 626 0
	mov	%d2, 32
	st.w	[%a15] 120, %d2
	j	.L26
.LVL62:
.L60:
.LBE241:
.LBE240:
.LBE244:
.LBB245:
.LBB246:
.LBB247:
	.loc 2 828 0 discriminator 1
	ld.w	%d15, [%a15] 116
.LBE247:
.LBE246:
	.loc 1 198 0 discriminator 1
	jz.t	%d15, 5, .L60
.LVL63:
.LBB248:
.LBB249:
	.loc 2 626 0
	mov	%d15, 32
	st.w	[%a15] 120, %d15
.LBE249:
.LBE248:
	.loc 1 205 0
	ld.w	%d2, [%a15] 128
.LVL64:
	.loc 1 207 0
	jz.t	%d2, 5, .L27
.LVL65:
.LBB250:
.LBB251:
	.loc 2 596 0
	mov	%d15, 127
	st.w	[%a15] 120, %d15
.LVL66:
.LBE251:
.LBE250:
	.loc 1 213 0
	mov	%d15, 4
	jz.t	%d2, 4, .L26
.LVL67:
.L35:
.LBB252:
.LBB253:
	.loc 2 590 0
	mov	%d15, 15
	st.w	[%a15] 104, %d15
.LVL68:
	mov	%d15, 4
.LVL69:
.L26:
.LBE253:
.LBE252:
.LBE245:
	.loc 1 254 0
	ld.w	%d2, [%a15] 128
.LVL70:
	.loc 1 256 0
	jz.t	%d2, 5, .L33
.LVL71:
.LBB274:
.LBB275:
	.loc 2 596 0
	mov	%d15, 127
.LVL72:
	st.w	[%a15] 120, %d15
.LVL73:
.LBE275:
.LBE274:
	.loc 1 259 0
	mov	%d15, 4
.LVL74:
.L33:
	.loc 1 262 0
	jz.t	%d2, 4, .L10
	j	.L73
.LVL75:
.L79:
.LBE296:
.LBB297:
.LBB298:
	.loc 2 626 0
	mov	%d15, 16
	st.w	[%a15] 120, %d15
.LVL76:
.LBE298:
.LBE297:
	.loc 1 125 0
	mov	%d15, 1
	j	.L10
.LVL77:
.L14:
.LBB299:
.LBB276:
.LBB242:
	.loc 1 144 0
	mov	%d6, %d3
.LVL78:
	.loc 1 145 0
	mov	%d3, 0
	j	.L16
.LVL79:
.L27:
.LBE242:
.LBE276:
.LBB277:
	.loc 1 213 0
	jnz.t	%d2, 4, .L35
.LVL80:
	lea	%a12, [%a15] -16384
.LBB254:
	.loc 1 224 0
	mov	%d2, 0
.LVL81:
.LBB255:
	.loc 1 238 0
	addih.a	%a12, %a12, 1
.LVL82:
.L32:
	.loc 1 226 0
	jlt	%d3, 4, .L28
.LVL83:
	.loc 1 238 0
	ld.w	%d15, [%a12]0
	.loc 1 229 0
	add	%d3, -4
.LVL84:
	.loc 1 238 0
	st.w	[%SP] 4, %d15
.LVL85:
.LBB256:
.LBB257:
	.loc 2 620 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 1
	st.w	[%a15] 140, %d15
.LVL86:
.LBE257:
.LBE256:
.LBB259:
.LBB260:
	.loc 2 632 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 2
	st.w	[%a15] 140, %d15
.LVL87:
.LBE260:
.LBE259:
.LBB262:
.LBB263:
	.loc 2 614 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 4
	st.w	[%a15] 140, %d15
.LVL88:
.LBE263:
.LBE262:
.LBB265:
.LBB266:
	.loc 2 602 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 8
	st.w	[%a15] 140, %d15
.LVL89:
.LBE266:
.LBE265:
	.loc 1 228 0
	mov	%d15, 4
.LVL90:
.L29:
	add	%d5, %d15, -1
	cmovn	%d5, %d15, 0
	mov.a	%a2, %d5
	.loc 1 228 0 is_stmt 0 discriminator 3
	mov.a	%a3, 0
.LVL91:
.L31:
	.loc 1 246 0 is_stmt 1 discriminator 3
	lea	%a6, [%SP] 4
.LVL92:
	addsc.a	%a7, %a3, %d2, 0
	add.a	%a6, %a3
.LVL93:
	ld.bu	%d15, [%a6]0
	add.a	%a7, %a5
	st.b	[%a7]0, %d15
	.loc 1 244 0 discriminator 3
	add.a	%a3, 1
.LVL94:
	loop	%a2, .L31
.LVL95:
.L30:
.LBE255:
	.loc 1 224 0 discriminator 2
	add	%d2, 4
.LVL96:
	jlt.u	%d2, %d4, .L32
.LBE254:
.LBE277:
.LBE299:
	.loc 1 75 0
	mov	%d15, 0
.LBB300:
.LBB278:
.LBB273:
	j	.L26
.L28:
.LBB272:
	.loc 1 238 0
	ld.w	%d5, [%a12]0
	.loc 1 233 0
	mov	%d15, %d3
.LVL97:
	.loc 1 238 0
	st.w	[%SP] 4, %d5
.LVL98:
.LBB268:
.LBB258:
	.loc 2 620 0
	ld.w	%d5, [%a15] 140
	or	%d5, %d5, 1
	st.w	[%a15] 140, %d5
.LVL99:
.LBE258:
.LBE268:
.LBB269:
.LBB261:
	.loc 2 632 0
	ld.w	%d5, [%a15] 140
	or	%d5, %d5, 2
	st.w	[%a15] 140, %d5
.LVL100:
.LBE261:
.LBE269:
.LBB270:
.LBB264:
	.loc 2 614 0
	ld.w	%d5, [%a15] 140
	or	%d5, %d5, 4
	st.w	[%a15] 140, %d5
.LVL101:
.LBE264:
.LBE270:
.LBB271:
.LBB267:
	.loc 2 602 0
	ld.w	%d5, [%a15] 140
	or	%d5, %d5, 8
	st.w	[%a15] 140, %d5
.LVL102:
.LBE267:
.LBE271:
	.loc 1 244 0
	jz	%d3, .L30
.LVL103:
	.loc 1 234 0
	mov	%d3, 0
.LVL104:
	j	.L29
.LVL105:
.L80:
.LBE272:
.LBE273:
.LBE278:
.LBB279:
.LBB243:
.LBB231:
.LBB232:
	.loc 2 596 0
	mov	%d15, 127
.LVL106:
	st.w	[%a15] 120, %d15
.LVL107:
.LBE232:
.LBE231:
	.loc 1 175 0
	mov	%d15, 4
	.loc 1 176 0
	j	.L21
.LVL108:
.L81:
.LBB233:
.LBB234:
	.loc 2 590 0
	mov	%d15, 15
.LVL109:
	st.w	[%a15] 104, %d15
.LVL110:
.LBE234:
.LBE233:
	.loc 1 182 0
	mov	%d15, 4
	.loc 1 183 0
	j	.L21
.LBE243:
.LBE279:
.LBE300:
.LFE281:
	.size	IfxI2c_I2c_read, .-IfxI2c_I2c_read
.section .text.IfxI2c_I2c_write,"ax",@progbits
	.align 1
	.global	IfxI2c_I2c_write
	.type	IfxI2c_I2c_write, @function
IfxI2c_I2c_write:
.LFB282:
	.loc 1 277 0
.LVL111:
	.loc 1 279 0
	ld.a	%a2, [%a4]0
	ld.a	%a15, [%a2]0
.LVL112:
	.loc 1 277 0
	sub.a	%SP, 8
.LCFI1:
	.loc 1 280 0
	ld.bu	%d5, [%a4] 4
.LVL113:
.LBB301:
.LBB302:
	.loc 2 573 0
	ld.w	%d15, [%a15] 36
	and	%d15, %d15, 3
	jnz	%d15, .L141
.LVL114:
.LBE302:
.LBE301:
.LBB303:
.LBB304:
	.loc 2 596 0
	mov	%d15, 127
	st.w	[%a15] 120, %d15
.LVL115:
.LBE304:
.LBE303:
.LBB305:
.LBB306:
	.loc 2 590 0
	mov	%d15, 15
	st.w	[%a15] 104, %d15
.LBE306:
.LBE305:
	.loc 1 300 0
	st.w	[%SP] 4, %d5
.LVL116:
.LBB307:
.LBB308:
	.loc 2 902 0
	ld.w	%d15, [%a15] 52
.LBE308:
.LBE307:
.LBB311:
.LBB312:
	.loc 2 921 0
	lea	%a6, [%a15] -32768
.LBE312:
.LBE311:
.LBB315:
.LBB309:
	.loc 2 902 0
	insert	%d15, %d15, 1, 0, 14
.LBE309:
.LBE315:
.LBB316:
.LBB313:
	.loc 2 921 0
	addih.a	%a2, %a6, 1
.LBE313:
.LBE316:
.LBB317:
.LBB310:
	.loc 2 902 0
	st.w	[%a15] 52, %d15
.LVL117:
.LBE310:
.LBE317:
.LBB318:
.LBB314:
	.loc 2 921 0
	st.w	[%a2]0, %d5
.LVL118:
.LBE314:
.LBE318:
.LBB319:
.LBB320:
	.loc 2 620 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 1
	st.w	[%a15] 140, %d15
.LVL119:
.LBE320:
.LBE319:
.LBB321:
.LBB322:
	.loc 2 632 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 2
	st.w	[%a15] 140, %d15
.LVL120:
.LBE322:
.LBE321:
.LBB323:
.LBB324:
	.loc 2 614 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 4
	st.w	[%a15] 140, %d15
.LVL121:
.LBE324:
.LBE323:
.LBB325:
.LBB326:
	.loc 2 602 0
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 8
	st.w	[%a15] 140, %d15
.L85:
.LVL122:
.LBE326:
.LBE325:
.LBB327:
.LBB328:
	.loc 2 828 0 discriminator 1
	ld.w	%d15, [%a15] 116
.LBE328:
.LBE327:
	.loc 1 310 0 discriminator 1
	jz.t	%d15, 5, .L85
.LVL123:
.LBB329:
.LBB330:
	.loc 2 626 0
	mov	%d15, 32
	st.w	[%a15] 120, %d15
.LVL124:
.LBE330:
.LBE329:
.LBB331:
.LBB332:
	.loc 2 828 0
	ld.w	%d15, [%a15] 116
.LBE332:
.LBE331:
	.loc 1 316 0
	jnz.t	%d15, 3, .L142
.LVL125:
.LBB333:
.LBB334:
	.loc 2 828 0
	ld.w	%d15, [%a15] 116
.LBE334:
.LBE333:
	.loc 1 321 0
	jz.t	%d15, 4, .L88
.LVL126:
.LBB335:
.LBB336:
	.loc 2 626 0
	mov	%d15, 16
	st.w	[%a15] 120, %d15
.LVL127:
.LBE336:
.LBE335:
	.loc 1 324 0
	mov	%d8, 1
.LVL128:
.L87:
	mov.aa	%a12, %a4
.LVL129:
	.loc 1 419 0
	mov.aa	%a4, %a15
.LVL130:
	call	IfxI2c_releaseBus
.LVL131:
.LBB337:
.LBB338:
	.loc 2 753 0
	ld.w	%d15, [%a15] 36
.LBE338:
.LBE337:
	.loc 1 420 0
	ld.a	%a2, [%a12]0
.LVL132:
.LBB340:
.LBB339:
	.loc 2 753 0
	and	%d15, %d15, 3
.LBE339:
.LBE340:
	.loc 1 422 0
	mov	%d2, %d8
	.loc 1 420 0
	st.b	[%a2] 4, %d15
	.loc 1 421 0
	st.b	[%a2] 5, %d8
	.loc 1 422 0
	ret
.LVL133:
.L141:
.LBB341:
.LBB342:
	.loc 2 753 0
	ld.w	%d15, [%a15] 36
.LBE342:
.LBE341:
	.loc 1 291 0
	mov	%d2, 3
.LBB344:
.LBB343:
	.loc 2 753 0
	and	%d15, %d15, 3
.LBE343:
.LBE344:
	.loc 1 289 0
	st.b	[%a2] 4, %d15
.LVL134:
	.loc 1 290 0
	mov	%d15, 3
	st.b	[%a2] 5, %d15
	.loc 1 291 0
	ret
.LVL135:
.L142:
.LBB345:
.LBB346:
	.loc 2 626 0
	mov	%d15, 8
	st.w	[%a15] 120, %d15
.LVL136:
.LBE346:
.LBE345:
	.loc 1 319 0
	mov	%d8, 2
	j	.L87
.LVL137:
.L88:
	.loc 1 278 0
	mov	%d8, 0
	.loc 1 326 0
	jlez	%d4, .L87
	.loc 1 282 0
	add	%d4, 1
.LVL138:
.LBB347:
.LBB348:
.LBB349:
.LBB350:
.LBB351:
.LBB352:
	.loc 3 632 0
#APP
	# 632 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h" 1
	mfcr %d10, LO:0xFE2C
	# 0 "" 2
.LVL139:
#NO_APP
.LBE352:
	.loc 3 633 0
	extr.u	%d10, %d10, 15, 1
.LVL140:
.LBE351:
.LBE350:
	.loc 3 641 0
#APP
	# 641 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h" 1
	disable
	# 0 "" 2
#NO_APP
.LBB353:
.LBB354:
	.loc 4 1436 0
#APP
	# 1436 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu_IntrinsicsGnuc.h" 1
	nop
	# 0 "" 2
.LVL141:
#NO_APP
.LBE354:
.LBE353:
.LBE349:
.LBE348:
.LBB355:
.LBB356:
	.loc 2 902 0
	ld.w	%d15, [%a15] 52
.LBE356:
.LBE355:
	.loc 1 335 0
	mov	%d1, %d4
.LBB359:
.LBB357:
	.loc 2 902 0
	insert	%d15, %d15, %d4, 0, 14
.LBE357:
.LBE359:
	.loc 1 335 0
	mov	%d3, 0
.LBB360:
.LBB358:
	.loc 2 902 0
	st.w	[%a15] 52, %d15
.LVL142:
.LBE358:
.LBE360:
	.loc 1 339 0
	mov	%d9, 0
.LBB361:
.LBB362:
.LBB363:
	.loc 2 596 0
	mov	%d6, 127
.LBE363:
.LBE362:
.LBE361:
.LBB368:
.LBB369:
	.loc 2 921 0
	addih.a	%a6, %a6, 1
.LVL143:
.LBE369:
.LBE368:
	.loc 1 337 0
	jlt	%d4, 4, .L89
.LVL144:
.L143:
	.loc 1 340 0
	add	%d4, -4
.LVL145:
	.loc 1 348 0
	st.w	[%SP] 4, %d9
.LVL146:
	.loc 1 339 0
	mov	%d2, 4
.LVL147:
.L90:
	addi	%d0, %d2, -1
	sel	%d0, %d2, %d0, 0
	mov.a	%a2, %d0
	mov	%d15, 0
	addi	%d7, %d3, -1
.LVL148:
.L94:
	.loc 1 352 0
	or	%d2, %d15, %d3
	jnz	%d2, .L92
	.loc 1 354 0
	st.b	[%SP] 4, %d5
.L93:
	.loc 1 350 0 discriminator 2
	add	%d15, 1
.LVL149:
	loop	%a2, .L94
.LVL150:
.L100:
.LBB372:
	.loc 1 367 0
	ld.w	%d15, [%a15] 128
.LVL151:
	.loc 1 369 0
	jz.t	%d15, 5, .L95
.LVL152:
.LBB365:
.LBB364:
	.loc 2 596 0
	st.w	[%a15] 120, %d6
.LVL153:
.LBE364:
.LBE365:
	.loc 1 372 0
	mov	%d8, 4
.LVL154:
.L95:
	.loc 1 375 0
	jz.t	%d15, 4, .L96
.LVL155:
.LBB366:
.LBB367:
	.loc 2 590 0
	mov	%d15, 15
.LVL156:
	st.w	[%a15] 104, %d15
.LVL157:
.LBE367:
.LBE366:
.LBE372:
	.loc 1 380 0
	ld.w	%d15, [%a15] 56
.LVL158:
.L97:
	mov	%d8, 4
.L98:
.LVL159:
.LBB373:
.LBB374:
	.loc 3 916 0
	jz	%d10, .L104
	.loc 3 918 0
#APP
	# 918 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h" 1
	enable
	# 0 "" 2
#NO_APP
.L104:
.LVL160:
.LBE374:
.LBE373:
.LBB375:
.LBB376:
	.loc 2 828 0 discriminator 1
	ld.w	%d15, [%a15] 116
.LBE376:
.LBE375:
	.loc 1 397 0 discriminator 1
	jz.t	%d15, 5, .L104
.LVL161:
.LBB377:
.LBB378:
	.loc 2 626 0
	mov	%d15, 32
	st.w	[%a15] 120, %d15
.LBE378:
.LBE377:
	.loc 1 404 0
	ld.w	%d15, [%a15] 128
.LVL162:
	.loc 1 406 0
	jz.t	%d15, 5, .L105
.LVL163:
.LBB379:
.LBB380:
	.loc 2 596 0
	mov	%d2, 127
	st.w	[%a15] 120, %d2
.LVL164:
.LBE380:
.LBE379:
	.loc 1 409 0
	mov	%d8, 4
.LVL165:
.L105:
	.loc 1 412 0
	jz.t	%d15, 4, .L87
.LVL166:
.LBB381:
.LBB382:
	.loc 2 590 0
	mov	%d15, 15
.LVL167:
	st.w	[%a15] 104, %d15
.LVL168:
.LBE382:
.LBE381:
	.loc 1 415 0
	mov	%d8, 4
	j	.L87
.LVL169:
.L96:
	.loc 1 380 0
	ld.w	%d15, [%a15] 56
.LVL170:
	and	%d15, %d15, 63
	ne	%d15, %d15, 8
	jnz	%d15, .L99
	.loc 1 380 0 is_stmt 0 discriminator 1
	jne	%d8, 4, .L100
	mov	%d8, 4
.LVL171:
	j	.L98
.LVL172:
.L92:
	mov.a	%a7, %d7
	addsc.a	%a3, %a7, %d15, 0
	.loc 1 359 0 is_stmt 1
	lea	%a7, [%SP] 4
.LVL173:
	add.a	%a3, %a5
	ld.bu	%d2, [%a3]0
	addsc.a	%a3, %a7, %d15, 0
	st.b	[%a3]0, %d2
	j	.L93
.LVL174:
.L99:
	.loc 1 382 0
	jeq	%d8, 4, .L97
.LVL175:
.LBB383:
.LBB370:
	.loc 2 921 0 discriminator 2
	ld.w	%d15, [%SP] 4
.LBE370:
.LBE383:
	.loc 1 335 0 discriminator 2
	add	%d3, 4
.LVL176:
.LBB384:
.LBB371:
	.loc 2 921 0 discriminator 2
	st.w	[%a6]0, %d15
.LVL177:
.LBE371:
.LBE384:
.LBB385:
.LBB386:
	.loc 2 620 0 discriminator 2
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 1
	st.w	[%a15] 140, %d15
.LVL178:
.LBE386:
.LBE385:
.LBB387:
.LBB388:
	.loc 2 632 0 discriminator 2
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 2
	st.w	[%a15] 140, %d15
.LVL179:
.LBE388:
.LBE387:
.LBB389:
.LBB390:
	.loc 2 614 0 discriminator 2
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 4
	st.w	[%a15] 140, %d15
.LVL180:
.LBE390:
.LBE389:
.LBB391:
.LBB392:
	.loc 2 602 0 discriminator 2
	ld.w	%d15, [%a15] 140
	or	%d15, %d15, 8
	st.w	[%a15] 140, %d15
.LBE392:
.LBE391:
	.loc 1 335 0 discriminator 2
	jge.u	%d3, %d1, .L98
	.loc 1 337 0
	jge	%d4, 4, .L143
.LVL181:
.L89:
	.loc 1 348 0
	st.w	[%SP] 4, %d9
	.loc 1 344 0
	mov	%d2, %d4
.LVL182:
	.loc 1 350 0
	jz	%d4, .L100
	.loc 1 345 0
	mov	%d4, 0
	j	.L90
.LBE347:
.LFE282:
	.size	IfxI2c_I2c_write, .-IfxI2c_I2c_write
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
	.uaword	.LFB277
	.uaword	.LFE277-.LFB277
	.align 2
.LEFDE0:
.LSFDE2:
	.uaword	.LEFDE2-.LASFDE2
.LASFDE2:
	.uaword	.Lframe0
	.uaword	.LFB278
	.uaword	.LFE278-.LFB278
	.align 2
.LEFDE2:
.LSFDE4:
	.uaword	.LEFDE4-.LASFDE4
.LASFDE4:
	.uaword	.Lframe0
	.uaword	.LFB279
	.uaword	.LFE279-.LFB279
	.align 2
.LEFDE4:
.LSFDE6:
	.uaword	.LEFDE6-.LASFDE6
.LASFDE6:
	.uaword	.Lframe0
	.uaword	.LFB280
	.uaword	.LFE280-.LFB280
	.align 2
.LEFDE6:
.LSFDE8:
	.uaword	.LEFDE8-.LASFDE8
.LASFDE8:
	.uaword	.Lframe0
	.uaword	.LFB281
	.uaword	.LFE281-.LFB281
	.byte	0x4
	.uaword	.LCFI0-.LFB281
	.byte	0xe
	.uleb128 0x8
	.align 2
.LEFDE8:
.LSFDE10:
	.uaword	.LEFDE10-.LASFDE10
.LASFDE10:
	.uaword	.Lframe0
	.uaword	.LFB282
	.uaword	.LFE282-.LFB282
	.byte	0x4
	.uaword	.LCFI1-.LFB282
	.byte	0xe
	.uleb128 0x8
	.align 2
.LEFDE10:
.section .text,"ax",@progbits
.Letext0:
	.file 5 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/Platform_Types.h"
	.file 6 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/Ifx_Types.h"
	.file 7 "0_Src/BaseSw/Infra/Sfr/TC27D/_Reg/IfxI2c_regdef.h"
	.file 8 "0_Src/BaseSw/Infra/Sfr/TC27D/_Reg/IfxCpu_regdef.h"
	.file 9 "0_Src/BaseSw/Infra/Sfr/TC27D/_Reg/IfxPort_regdef.h"
	.file 10 "0_Src/BaseSw/iLLD/TC27D/Tricore/Port/Std/IfxPort.h"
	.file 11 "0_Src/BaseSw/iLLD/TC27D/Tricore/_PinMap/IfxI2c_PinMap.h"
	.file 12 "0_Src/BaseSw/iLLD/TC27D/Tricore/I2c/I2c/IfxI2c_I2c.h"
	.file 13 "0_Src/BaseSw/iLLD/TC27D/Tricore/_Impl/IfxCpu_cfg.h"
.section .debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x620f
	.uahalf	0x3
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.string	"GNU C 4.9.4 build on 2019-06-07 -mlicense-dir=c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\bin\\../lib/gcc/tricore/4.9.4/../../../../licenses -mtc161 -g -O2 -std=c99 -fno-common -fstrict-volatile-bitfields -ffunction-sections -fdata-sections"
	.byte	0x1
	.string	"0_Src/BaseSw/iLLD/TC27D/Tricore/I2c/I2c/IfxI2c_I2c.c"
	.string	"C:\\\\Google drive\\\\RH_Workspace\\\\__RH26_Control_Base_TC275"
	.uaword	.Ldebug_ranges0+0x2f0
	.uaword	0
	.uaword	0
	.uaword	.Ldebug_line0
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
	.byte	0x5
	.byte	0x59
	.uaword	0x1c8
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.string	"unsigned char"
	.uleb128 0x3
	.string	"sint16"
	.byte	0x5
	.byte	0x5a
	.uaword	0x1e7
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.string	"short int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.string	"short unsigned int"
	.uleb128 0x3
	.string	"sint32"
	.byte	0x5
	.byte	0x5c
	.uaword	0x184
	.uleb128 0x3
	.string	"uint32"
	.byte	0x5
	.byte	0x5d
	.uaword	0x190
	.uleb128 0x3
	.string	"float32"
	.byte	0x5
	.byte	0x5e
	.uaword	0x235
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.string	"float"
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.string	"double"
	.uleb128 0x3
	.string	"boolean"
	.byte	0x5
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
	.uaword	0x290
	.uleb128 0x5
	.uleb128 0x3
	.string	"Ifx_SizeT"
	.byte	0x6
	.byte	0x4b
	.uaword	0x1d9
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.byte	0x72
	.uaword	0x31b
	.uleb128 0x7
	.string	"Ifx_RxSel_a"
	.sleb128 0
	.uleb128 0x7
	.string	"Ifx_RxSel_b"
	.sleb128 1
	.uleb128 0x7
	.string	"Ifx_RxSel_c"
	.sleb128 2
	.uleb128 0x7
	.string	"Ifx_RxSel_d"
	.sleb128 3
	.uleb128 0x7
	.string	"Ifx_RxSel_e"
	.sleb128 4
	.uleb128 0x7
	.string	"Ifx_RxSel_f"
	.sleb128 5
	.uleb128 0x7
	.string	"Ifx_RxSel_g"
	.sleb128 6
	.uleb128 0x7
	.string	"Ifx_RxSel_h"
	.sleb128 7
	.byte	0
	.uleb128 0x3
	.string	"Ifx_RxSel"
	.byte	0x6
	.byte	0x7b
	.uaword	0x2a2
	.uleb128 0x8
	.byte	0x8
	.byte	0x6
	.byte	0x7e
	.uaword	0x34f
	.uleb128 0x9
	.uaword	.LASF0
	.byte	0x6
	.byte	0x80
	.uaword	0x28a
	.byte	0
	.uleb128 0xa
	.string	"index"
	.byte	0x6
	.byte	0x81
	.uaword	0x20a
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.string	"IfxModule_IndexMap"
	.byte	0x6
	.byte	0x82
	.uaword	0x32c
	.uleb128 0xb
	.string	"_Ifx_I2C_ACCEN0_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x2d
	.uaword	0x57d
	.uleb128 0xc
	.string	"EN0"
	.byte	0x7
	.byte	0x2f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"EN1"
	.byte	0x7
	.byte	0x30
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"EN2"
	.byte	0x7
	.byte	0x31
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"EN3"
	.byte	0x7
	.byte	0x32
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"EN4"
	.byte	0x7
	.byte	0x33
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"EN5"
	.byte	0x7
	.byte	0x34
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xc
	.string	"EN6"
	.byte	0x7
	.byte	0x35
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.string	"EN7"
	.byte	0x7
	.byte	0x36
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"EN8"
	.byte	0x7
	.byte	0x37
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0xc
	.string	"EN9"
	.byte	0x7
	.byte	0x38
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0xc
	.string	"EN10"
	.byte	0x7
	.byte	0x39
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"EN11"
	.byte	0x7
	.byte	0x3a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"EN12"
	.byte	0x7
	.byte	0x3b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.string	"EN13"
	.byte	0x7
	.byte	0x3c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0xc
	.string	"EN14"
	.byte	0x7
	.byte	0x3d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0xc
	.string	"EN15"
	.byte	0x7
	.byte	0x3e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"EN16"
	.byte	0x7
	.byte	0x3f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.string	"EN17"
	.byte	0x7
	.byte	0x40
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.string	"EN18"
	.byte	0x7
	.byte	0x41
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"EN19"
	.byte	0x7
	.byte	0x42
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.string	"EN20"
	.byte	0x7
	.byte	0x43
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0xc
	.string	"EN21"
	.byte	0x7
	.byte	0x44
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0xc
	.string	"EN22"
	.byte	0x7
	.byte	0x45
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0
	.uleb128 0xc
	.string	"EN23"
	.byte	0x7
	.byte	0x46
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.string	"EN24"
	.byte	0x7
	.byte	0x47
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.string	"EN25"
	.byte	0x7
	.byte	0x48
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.string	"EN26"
	.byte	0x7
	.byte	0x49
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.string	"EN27"
	.byte	0x7
	.byte	0x4a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.string	"EN28"
	.byte	0x7
	.byte	0x4b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.string	"EN29"
	.byte	0x7
	.byte	0x4c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.string	"EN30"
	.byte	0x7
	.byte	0x4d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.string	"EN31"
	.byte	0x7
	.byte	0x4e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.string	"unsigned int"
	.uleb128 0x3
	.string	"Ifx_I2C_ACCEN0_Bits"
	.byte	0x7
	.byte	0x4f
	.uaword	0x369
	.uleb128 0xb
	.string	"_Ifx_I2C_ACCEN1_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x52
	.uaword	0x5d5
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x7
	.byte	0x54
	.uaword	0x57d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ACCEN1_Bits"
	.byte	0x7
	.byte	0x55
	.uaword	0x5a8
	.uleb128 0xb
	.string	"_Ifx_I2C_ADDRCFG_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x58
	.uaword	0x6a1
	.uleb128 0xc
	.string	"ADR"
	.byte	0x7
	.byte	0x5a
	.uaword	0x57d
	.byte	0x4
	.byte	0xa
	.byte	0x16
	.byte	0
	.uleb128 0xd
	.uaword	.LASF2
	.byte	0x7
	.byte	0x5b
	.uaword	0x57d
	.byte	0x4
	.byte	0x6
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"TBAM"
	.byte	0x7
	.byte	0x5c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.string	"GCE"
	.byte	0x7
	.byte	0x5d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.string	"MCE"
	.byte	0x7
	.byte	0x5e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"MnS"
	.byte	0x7
	.byte	0x5f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.string	"SONA"
	.byte	0x7
	.byte	0x60
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0xc
	.string	"SOPE"
	.byte	0x7
	.byte	0x61
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0xc
	.string	"reserved_22"
	.byte	0x7
	.byte	0x62
	.uaword	0x57d
	.byte	0x4
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ADDRCFG_Bits"
	.byte	0x7
	.byte	0x63
	.uaword	0x5f0
	.uleb128 0xb
	.string	"_Ifx_I2C_BUSSTAT_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x66
	.uaword	0x708
	.uleb128 0xc
	.string	"BS"
	.byte	0x7
	.byte	0x68
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"RnW"
	.byte	0x7
	.byte	0x69
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF3
	.byte	0x7
	.byte	0x6a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1d
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_BUSSTAT_Bits"
	.byte	0x7
	.byte	0x6b
	.uaword	0x6bd
	.uleb128 0xb
	.string	"_Ifx_I2C_CLC1_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x6e
	.uaword	0x7cd
	.uleb128 0xc
	.string	"DISR"
	.byte	0x7
	.byte	0x70
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"DISS"
	.byte	0x7
	.byte	0x71
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"SPEN"
	.byte	0x7
	.byte	0x72
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"EDIS"
	.byte	0x7
	.byte	0x73
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"SBWE"
	.byte	0x7
	.byte	0x74
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"FSOE"
	.byte	0x7
	.byte	0x75
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xd
	.uaword	.LASF4
	.byte	0x7
	.byte	0x76
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"RMC"
	.byte	0x7
	.byte	0x77
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x7
	.byte	0x78
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_CLC1_Bits"
	.byte	0x7
	.byte	0x79
	.uaword	0x724
	.uleb128 0xb
	.string	"_Ifx_I2C_CLC_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x7c
	.uaword	0x830
	.uleb128 0xc
	.string	"DISR"
	.byte	0x7
	.byte	0x7e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"DISS"
	.byte	0x7
	.byte	0x7f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF6
	.byte	0x7
	.byte	0x80
	.uaword	0x57d
	.byte	0x4
	.byte	0x1e
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_CLC_Bits"
	.byte	0x7
	.byte	0x81
	.uaword	0x7e6
	.uleb128 0xb
	.string	"_Ifx_I2C_ENDDCTRL_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x84
	.uaword	0x89b
	.uleb128 0xc
	.string	"SETRSC"
	.byte	0x7
	.byte	0x86
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"SETEND"
	.byte	0x7
	.byte	0x87
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF6
	.byte	0x7
	.byte	0x88
	.uaword	0x57d
	.byte	0x4
	.byte	0x1e
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ENDDCTRL_Bits"
	.byte	0x7
	.byte	0x89
	.uaword	0x848
	.uleb128 0xb
	.string	"_Ifx_I2C_ERRIRQSC_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x8c
	.uaword	0x923
	.uleb128 0xd
	.uaword	.LASF7
	.byte	0x7
	.byte	0x8e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.uaword	.LASF8
	.byte	0x7
	.byte	0x8f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF9
	.byte	0x7
	.byte	0x90
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF10
	.byte	0x7
	.byte	0x91
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xd
	.uaword	.LASF11
	.byte	0x7
	.byte	0x92
	.uaword	0x57d
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ERRIRQSC_Bits"
	.byte	0x7
	.byte	0x93
	.uaword	0x8b8
	.uleb128 0xb
	.string	"_Ifx_I2C_ERRIRQSM_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0x96
	.uaword	0x9ab
	.uleb128 0xd
	.uaword	.LASF7
	.byte	0x7
	.byte	0x98
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.uaword	.LASF8
	.byte	0x7
	.byte	0x99
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF9
	.byte	0x7
	.byte	0x9a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF10
	.byte	0x7
	.byte	0x9b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xd
	.uaword	.LASF11
	.byte	0x7
	.byte	0x9c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ERRIRQSM_Bits"
	.byte	0x7
	.byte	0x9d
	.uaword	0x940
	.uleb128 0xb
	.string	"_Ifx_I2C_ERRIRQSS_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xa0
	.uaword	0xa33
	.uleb128 0xd
	.uaword	.LASF7
	.byte	0x7
	.byte	0xa2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.uaword	.LASF8
	.byte	0x7
	.byte	0xa3
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF9
	.byte	0x7
	.byte	0xa4
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF10
	.byte	0x7
	.byte	0xa5
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xd
	.uaword	.LASF11
	.byte	0x7
	.byte	0xa6
	.uaword	0x57d
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ERRIRQSS_Bits"
	.byte	0x7
	.byte	0xa7
	.uaword	0x9c8
	.uleb128 0xb
	.string	"_Ifx_I2C_FDIVCFG_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xaa
	.uaword	0xaab
	.uleb128 0xc
	.string	"DEC"
	.byte	0x7
	.byte	0xac
	.uaword	0x57d
	.byte	0x4
	.byte	0xb
	.byte	0x15
	.byte	0
	.uleb128 0xd
	.uaword	.LASF12
	.byte	0x7
	.byte	0xad
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"INC"
	.byte	0x7
	.byte	0xae
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.uaword	.LASF13
	.byte	0x7
	.byte	0xaf
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_FDIVCFG_Bits"
	.byte	0x7
	.byte	0xb0
	.uaword	0xa50
	.uleb128 0xb
	.string	"_Ifx_I2C_FDIVHIGHCFG_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xb3
	.uaword	0xb26
	.uleb128 0xc
	.string	"DEC"
	.byte	0x7
	.byte	0xb5
	.uaword	0x57d
	.byte	0x4
	.byte	0xb
	.byte	0x15
	.byte	0
	.uleb128 0xd
	.uaword	.LASF12
	.byte	0x7
	.byte	0xb6
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"INC"
	.byte	0x7
	.byte	0xb7
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.uaword	.LASF13
	.byte	0x7
	.byte	0xb8
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_FDIVHIGHCFG_Bits"
	.byte	0x7
	.byte	0xb9
	.uaword	0xac7
	.uleb128 0xb
	.string	"_Ifx_I2C_FFSSTAT_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xbc
	.uaword	0xb83
	.uleb128 0xc
	.string	"FFS"
	.byte	0x7
	.byte	0xbe
	.uaword	0x57d
	.byte	0x4
	.byte	0x6
	.byte	0x1a
	.byte	0
	.uleb128 0xd
	.uaword	.LASF4
	.byte	0x7
	.byte	0xbf
	.uaword	0x57d
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_FFSSTAT_Bits"
	.byte	0x7
	.byte	0xc0
	.uaword	0xb46
	.uleb128 0xb
	.string	"_Ifx_I2C_FIFOCFG_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xc3
	.uaword	0xc71
	.uleb128 0xc
	.string	"RXBS"
	.byte	0x7
	.byte	0xc5
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF6
	.byte	0x7
	.byte	0xc6
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"TXBS"
	.byte	0x7
	.byte	0xc7
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x1a
	.byte	0
	.uleb128 0xd
	.uaword	.LASF4
	.byte	0x7
	.byte	0xc8
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"RXFA"
	.byte	0x7
	.byte	0xc9
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0
	.uleb128 0xd
	.uaword	.LASF2
	.byte	0x7
	.byte	0xca
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"TXFA"
	.byte	0x7
	.byte	0xcb
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x12
	.byte	0
	.uleb128 0xd
	.uaword	.LASF14
	.byte	0x7
	.byte	0xcc
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"RXFC"
	.byte	0x7
	.byte	0xcd
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.string	"TXFC"
	.byte	0x7
	.byte	0xce
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.string	"reserved_18"
	.byte	0x7
	.byte	0xcf
	.uaword	0x57d
	.byte	0x4
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_FIFOCFG_Bits"
	.byte	0x7
	.byte	0xd0
	.uaword	0xb9f
	.uleb128 0xb
	.string	"_Ifx_I2C_GPCTL_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xd3
	.uaword	0xcca
	.uleb128 0xc
	.string	"PISEL"
	.byte	0x7
	.byte	0xd5
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF3
	.byte	0x7
	.byte	0xd6
	.uaword	0x57d
	.byte	0x4
	.byte	0x1d
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_GPCTL_Bits"
	.byte	0x7
	.byte	0xd7
	.uaword	0xc8d
	.uleb128 0xb
	.string	"_Ifx_I2C_ICR_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xda
	.uaword	0xd4a
	.uleb128 0xd
	.uaword	.LASF15
	.byte	0x7
	.byte	0xdc
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.uaword	.LASF16
	.byte	0x7
	.byte	0xdd
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF17
	.byte	0x7
	.byte	0xde
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF18
	.byte	0x7
	.byte	0xdf
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xd
	.uaword	.LASF11
	.byte	0x7
	.byte	0xe0
	.uaword	0x57d
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ICR_Bits"
	.byte	0x7
	.byte	0xe1
	.uaword	0xce4
	.uleb128 0xb
	.string	"_Ifx_I2C_ID_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xe4
	.uaword	0xdad
	.uleb128 0xc
	.string	"MOD_REV"
	.byte	0x7
	.byte	0xe6
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.uaword	.LASF19
	.byte	0x7
	.byte	0xe7
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x7
	.byte	0xe8
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_ID_Bits"
	.byte	0x7
	.byte	0xe9
	.uaword	0xd62
	.uleb128 0xb
	.string	"_Ifx_I2C_IMSC_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xec
	.uaword	0xe49
	.uleb128 0xd
	.uaword	.LASF15
	.byte	0x7
	.byte	0xee
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.uaword	.LASF16
	.byte	0x7
	.byte	0xef
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF17
	.byte	0x7
	.byte	0xf0
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF18
	.byte	0x7
	.byte	0xf1
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xd
	.uaword	.LASF20
	.byte	0x7
	.byte	0xf2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xd
	.uaword	.LASF21
	.byte	0x7
	.byte	0xf3
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xd
	.uaword	.LASF4
	.byte	0x7
	.byte	0xf4
	.uaword	0x57d
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_I2C_IMSC_Bits"
	.byte	0x7
	.byte	0xf5
	.uaword	0xdc4
	.uleb128 0xb
	.string	"_Ifx_I2C_ISR_Bits"
	.byte	0x4
	.byte	0x7
	.byte	0xf8
	.uaword	0xee7
	.uleb128 0xd
	.uaword	.LASF15
	.byte	0x7
	.byte	0xfa
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.uaword	.LASF16
	.byte	0x7
	.byte	0xfb
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF17
	.byte	0x7
	.byte	0xfc
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xd
	.uaword	.LASF18
	.byte	0x7
	.byte	0xfd
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xd
	.uaword	.LASF20
	.byte	0x7
	.byte	0xfe
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xd
	.uaword	.LASF21
	.byte	0x7
	.byte	0xff
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xe
	.uaword	.LASF4
	.byte	0x7
	.uahalf	0x100
	.uaword	0x57d
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ISR_Bits"
	.byte	0x7
	.uahalf	0x101
	.uaword	0xe62
	.uleb128 0x10
	.string	"_Ifx_I2C_KRST0_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x104
	.uaword	0xf52
	.uleb128 0x11
	.string	"RST"
	.byte	0x7
	.uahalf	0x106
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"RSTSTAT"
	.byte	0x7
	.uahalf	0x107
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xe
	.uaword	.LASF6
	.byte	0x7
	.uahalf	0x108
	.uaword	0x57d
	.byte	0x4
	.byte	0x1e
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_KRST0_Bits"
	.byte	0x7
	.uahalf	0x109
	.uaword	0xf00
	.uleb128 0x10
	.string	"_Ifx_I2C_KRST1_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x10c
	.uaword	0xfab
	.uleb128 0x11
	.string	"RST"
	.byte	0x7
	.uahalf	0x10e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.uaword	.LASF22
	.byte	0x7
	.uahalf	0x10f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1f
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_KRST1_Bits"
	.byte	0x7
	.uahalf	0x110
	.uaword	0xf6d
	.uleb128 0x10
	.string	"_Ifx_I2C_KRSTCLR_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x113
	.uaword	0x1006
	.uleb128 0x11
	.string	"CLR"
	.byte	0x7
	.uahalf	0x115
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.uaword	.LASF22
	.byte	0x7
	.uahalf	0x116
	.uaword	0x57d
	.byte	0x4
	.byte	0x1f
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_KRSTCLR_Bits"
	.byte	0x7
	.uahalf	0x117
	.uaword	0xfc6
	.uleb128 0x10
	.string	"_Ifx_I2C_MIS_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x11a
	.uaword	0x10af
	.uleb128 0xe
	.uaword	.LASF15
	.byte	0x7
	.uahalf	0x11c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.uaword	.LASF16
	.byte	0x7
	.uahalf	0x11d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xe
	.uaword	.LASF17
	.byte	0x7
	.uahalf	0x11e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xe
	.uaword	.LASF18
	.byte	0x7
	.uahalf	0x11f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xe
	.uaword	.LASF20
	.byte	0x7
	.uahalf	0x120
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xe
	.uaword	.LASF21
	.byte	0x7
	.uahalf	0x121
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xe
	.uaword	.LASF4
	.byte	0x7
	.uahalf	0x122
	.uaword	0x57d
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_MIS_Bits"
	.byte	0x7
	.uahalf	0x123
	.uaword	0x1023
	.uleb128 0x10
	.string	"_Ifx_I2C_MODID_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x126
	.uaword	0x111f
	.uleb128 0x11
	.string	"MOD_REV"
	.byte	0x7
	.uahalf	0x128
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"MOD_TYPE"
	.byte	0x7
	.uahalf	0x129
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.uaword	.LASF19
	.byte	0x7
	.uahalf	0x12a
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_MODID_Bits"
	.byte	0x7
	.uahalf	0x12b
	.uaword	0x10c8
	.uleb128 0x10
	.string	"_Ifx_I2C_MRPSCTRL_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x12e
	.uaword	0x117c
	.uleb128 0x11
	.string	"MRPS"
	.byte	0x7
	.uahalf	0x130
	.uaword	0x57d
	.byte	0x4
	.byte	0xe
	.byte	0x12
	.byte	0
	.uleb128 0xe
	.uaword	.LASF14
	.byte	0x7
	.uahalf	0x131
	.uaword	0x57d
	.byte	0x4
	.byte	0x12
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_MRPSCTRL_Bits"
	.byte	0x7
	.uahalf	0x132
	.uaword	0x113a
	.uleb128 0x10
	.string	"_Ifx_I2C_PIRQSC_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x135
	.uaword	0x1235
	.uleb128 0x11
	.string	"AM"
	.byte	0x7
	.uahalf	0x137
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"GC"
	.byte	0x7
	.uahalf	0x138
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"MC"
	.byte	0x7
	.uahalf	0x139
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"AL"
	.byte	0x7
	.uahalf	0x13a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"NACK"
	.byte	0x7
	.uahalf	0x13b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xe
	.uaword	.LASF23
	.byte	0x7
	.uahalf	0x13c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"RX"
	.byte	0x7
	.uahalf	0x13d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xe
	.uaword	.LASF24
	.byte	0x7
	.uahalf	0x13e
	.uaword	0x57d
	.byte	0x4
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_PIRQSC_Bits"
	.byte	0x7
	.uahalf	0x13f
	.uaword	0x119a
	.uleb128 0x10
	.string	"_Ifx_I2C_PIRQSM_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x142
	.uaword	0x12ec
	.uleb128 0x11
	.string	"AM"
	.byte	0x7
	.uahalf	0x144
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"GC"
	.byte	0x7
	.uahalf	0x145
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"MC"
	.byte	0x7
	.uahalf	0x146
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"AL"
	.byte	0x7
	.uahalf	0x147
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"NACK"
	.byte	0x7
	.uahalf	0x148
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xe
	.uaword	.LASF23
	.byte	0x7
	.uahalf	0x149
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"RX"
	.byte	0x7
	.uahalf	0x14a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xe
	.uaword	.LASF24
	.byte	0x7
	.uahalf	0x14b
	.uaword	0x57d
	.byte	0x4
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_PIRQSM_Bits"
	.byte	0x7
	.uahalf	0x14c
	.uaword	0x1251
	.uleb128 0x10
	.string	"_Ifx_I2C_PIRQSS_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x14f
	.uaword	0x13a3
	.uleb128 0x11
	.string	"AM"
	.byte	0x7
	.uahalf	0x151
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"GC"
	.byte	0x7
	.uahalf	0x152
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"MC"
	.byte	0x7
	.uahalf	0x153
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"AL"
	.byte	0x7
	.uahalf	0x154
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"NACK"
	.byte	0x7
	.uahalf	0x155
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xe
	.uaword	.LASF23
	.byte	0x7
	.uahalf	0x156
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"RX"
	.byte	0x7
	.uahalf	0x157
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xe
	.uaword	.LASF24
	.byte	0x7
	.uahalf	0x158
	.uaword	0x57d
	.byte	0x4
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_PIRQSS_Bits"
	.byte	0x7
	.uahalf	0x159
	.uaword	0x1308
	.uleb128 0x10
	.string	"_Ifx_I2C_RIS_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x15c
	.uaword	0x144b
	.uleb128 0xe
	.uaword	.LASF15
	.byte	0x7
	.uahalf	0x15e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.uaword	.LASF16
	.byte	0x7
	.uahalf	0x15f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xe
	.uaword	.LASF17
	.byte	0x7
	.uahalf	0x160
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xe
	.uaword	.LASF18
	.byte	0x7
	.uahalf	0x161
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xe
	.uaword	.LASF20
	.byte	0x7
	.uahalf	0x162
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xe
	.uaword	.LASF21
	.byte	0x7
	.uahalf	0x163
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xe
	.uaword	.LASF4
	.byte	0x7
	.uahalf	0x164
	.uaword	0x57d
	.byte	0x4
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RIS_Bits"
	.byte	0x7
	.uahalf	0x165
	.uaword	0x13bf
	.uleb128 0x10
	.string	"_Ifx_I2C_RPSSTAT_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x168
	.uaword	0x14a4
	.uleb128 0x11
	.string	"RPS"
	.byte	0x7
	.uahalf	0x16a
	.uaword	0x57d
	.byte	0x4
	.byte	0xe
	.byte	0x12
	.byte	0
	.uleb128 0xe
	.uaword	.LASF14
	.byte	0x7
	.uahalf	0x16b
	.uaword	0x57d
	.byte	0x4
	.byte	0x12
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RPSSTAT_Bits"
	.byte	0x7
	.uahalf	0x16c
	.uaword	0x1464
	.uleb128 0x10
	.string	"_Ifx_I2C_RUNCTRL_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x16f
	.uaword	0x1501
	.uleb128 0x11
	.string	"RUN"
	.byte	0x7
	.uahalf	0x171
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.uaword	.LASF22
	.byte	0x7
	.uahalf	0x172
	.uaword	0x57d
	.byte	0x4
	.byte	0x1f
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RUNCTRL_Bits"
	.byte	0x7
	.uahalf	0x173
	.uaword	0x14c1
	.uleb128 0x10
	.string	"_Ifx_I2C_RXD_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x176
	.uaword	0x154a
	.uleb128 0x11
	.string	"RXD"
	.byte	0x7
	.uahalf	0x178
	.uaword	0x57d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RXD_Bits"
	.byte	0x7
	.uahalf	0x179
	.uaword	0x151e
	.uleb128 0x10
	.string	"_Ifx_I2C_TIMCFG_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x17c
	.uaword	0x165f
	.uleb128 0x11
	.string	"SDA_DEL_HD_DAT"
	.byte	0x7
	.uahalf	0x17e
	.uaword	0x57d
	.byte	0x4
	.byte	0x6
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"HS_SDA_DEL_HD_DAT"
	.byte	0x7
	.uahalf	0x17f
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x17
	.byte	0
	.uleb128 0x11
	.string	"SCL_DEL_HD_STA"
	.byte	0x7
	.uahalf	0x180
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x14
	.byte	0
	.uleb128 0xe
	.uaword	.LASF25
	.byte	0x7
	.uahalf	0x181
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x12
	.byte	0
	.uleb128 0x11
	.string	"EN_SCL_LOW_LEN"
	.byte	0x7
	.uahalf	0x182
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"FS_SCL_LOW"
	.byte	0x7
	.uahalf	0x183
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.string	"HS_SDA_DEL"
	.byte	0x7
	.uahalf	0x184
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0xd
	.byte	0
	.uleb128 0x11
	.string	"reserved_19"
	.byte	0x7
	.uahalf	0x185
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.string	"SCL_LOW_LEN"
	.byte	0x7
	.uahalf	0x186
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_TIMCFG_Bits"
	.byte	0x7
	.uahalf	0x187
	.uaword	0x1563
	.uleb128 0x10
	.string	"_Ifx_I2C_TPSCTRL_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x18a
	.uaword	0x16bb
	.uleb128 0x11
	.string	"TPS"
	.byte	0x7
	.uahalf	0x18c
	.uaword	0x57d
	.byte	0x4
	.byte	0xe
	.byte	0x12
	.byte	0
	.uleb128 0xe
	.uaword	.LASF14
	.byte	0x7
	.uahalf	0x18d
	.uaword	0x57d
	.byte	0x4
	.byte	0x12
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_TPSCTRL_Bits"
	.byte	0x7
	.uahalf	0x18e
	.uaword	0x167b
	.uleb128 0x10
	.string	"_Ifx_I2C_TXD_Bits"
	.byte	0x4
	.byte	0x7
	.uahalf	0x191
	.uaword	0x1704
	.uleb128 0x11
	.string	"TXD"
	.byte	0x7
	.uahalf	0x193
	.uaword	0x57d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_TXD_Bits"
	.byte	0x7
	.uahalf	0x194
	.uaword	0x16d8
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x19c
	.uaword	0x1745
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x19e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x19f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1a0
	.uaword	0x58d
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ACCEN0"
	.byte	0x7
	.uahalf	0x1a1
	.uaword	0x171d
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1a4
	.uaword	0x1784
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1a6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1a7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1a8
	.uaword	0x5d5
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ACCEN1"
	.byte	0x7
	.uahalf	0x1a9
	.uaword	0x175c
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1ac
	.uaword	0x17c3
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1ae
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1af
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1b0
	.uaword	0x6a1
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ADDRCFG"
	.byte	0x7
	.uahalf	0x1b1
	.uaword	0x179b
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1b4
	.uaword	0x1803
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1b6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1b7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1b8
	.uaword	0x708
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_BUSSTAT"
	.byte	0x7
	.uahalf	0x1b9
	.uaword	0x17db
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1bc
	.uaword	0x1843
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1be
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1bf
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1c0
	.uaword	0x830
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_CLC"
	.byte	0x7
	.uahalf	0x1c1
	.uaword	0x181b
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1c4
	.uaword	0x187f
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1c6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1c7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1c8
	.uaword	0x7cd
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_CLC1"
	.byte	0x7
	.uahalf	0x1c9
	.uaword	0x1857
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1cc
	.uaword	0x18bc
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1ce
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1cf
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1d0
	.uaword	0x89b
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ENDDCTRL"
	.byte	0x7
	.uahalf	0x1d1
	.uaword	0x1894
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1d4
	.uaword	0x18fd
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1d6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1d7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1d8
	.uaword	0x923
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ERRIRQSC"
	.byte	0x7
	.uahalf	0x1d9
	.uaword	0x18d5
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1dc
	.uaword	0x193e
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1de
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1df
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1e0
	.uaword	0x9ab
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ERRIRQSM"
	.byte	0x7
	.uahalf	0x1e1
	.uaword	0x1916
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1e4
	.uaword	0x197f
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1e6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1e7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1e8
	.uaword	0xa33
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ERRIRQSS"
	.byte	0x7
	.uahalf	0x1e9
	.uaword	0x1957
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1ec
	.uaword	0x19c0
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1ee
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1ef
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1f0
	.uaword	0xaab
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_FDIVCFG"
	.byte	0x7
	.uahalf	0x1f1
	.uaword	0x1998
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1f4
	.uaword	0x1a00
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1f6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1f7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x1f8
	.uaword	0xb26
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_FDIVHIGHCFG"
	.byte	0x7
	.uahalf	0x1f9
	.uaword	0x19d8
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x1fc
	.uaword	0x1a44
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x1fe
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x1ff
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x200
	.uaword	0xb83
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_FFSSTAT"
	.byte	0x7
	.uahalf	0x201
	.uaword	0x1a1c
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x204
	.uaword	0x1a84
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x206
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x207
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x208
	.uaword	0xc71
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_FIFOCFG"
	.byte	0x7
	.uahalf	0x209
	.uaword	0x1a5c
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x20c
	.uaword	0x1ac4
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x20e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x20f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x210
	.uaword	0xcca
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_GPCTL"
	.byte	0x7
	.uahalf	0x211
	.uaword	0x1a9c
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x214
	.uaword	0x1b02
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x216
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x217
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x218
	.uaword	0xd4a
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ICR"
	.byte	0x7
	.uahalf	0x219
	.uaword	0x1ada
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x21c
	.uaword	0x1b3e
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x21e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x21f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x220
	.uaword	0xdad
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ID"
	.byte	0x7
	.uahalf	0x221
	.uaword	0x1b16
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x224
	.uaword	0x1b79
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x226
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x227
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x228
	.uaword	0xe49
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_IMSC"
	.byte	0x7
	.uahalf	0x229
	.uaword	0x1b51
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x22c
	.uaword	0x1bb6
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x22e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x22f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x230
	.uaword	0xee7
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_ISR"
	.byte	0x7
	.uahalf	0x231
	.uaword	0x1b8e
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x234
	.uaword	0x1bf2
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x236
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x237
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x238
	.uaword	0xf52
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_KRST0"
	.byte	0x7
	.uahalf	0x239
	.uaword	0x1bca
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x23c
	.uaword	0x1c30
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x23e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x23f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x240
	.uaword	0xfab
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_KRST1"
	.byte	0x7
	.uahalf	0x241
	.uaword	0x1c08
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x244
	.uaword	0x1c6e
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x246
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x247
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x248
	.uaword	0x1006
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_KRSTCLR"
	.byte	0x7
	.uahalf	0x249
	.uaword	0x1c46
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x24c
	.uaword	0x1cae
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x24e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x24f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x250
	.uaword	0x10af
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_MIS"
	.byte	0x7
	.uahalf	0x251
	.uaword	0x1c86
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x254
	.uaword	0x1cea
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x256
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x257
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x258
	.uaword	0x111f
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_MODID"
	.byte	0x7
	.uahalf	0x259
	.uaword	0x1cc2
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x25c
	.uaword	0x1d28
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x25e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x25f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x260
	.uaword	0x117c
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_MRPSCTRL"
	.byte	0x7
	.uahalf	0x261
	.uaword	0x1d00
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x264
	.uaword	0x1d69
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x266
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x267
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x268
	.uaword	0x1235
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_PIRQSC"
	.byte	0x7
	.uahalf	0x269
	.uaword	0x1d41
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x26c
	.uaword	0x1da8
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x26e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x26f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x270
	.uaword	0x12ec
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_PIRQSM"
	.byte	0x7
	.uahalf	0x271
	.uaword	0x1d80
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x274
	.uaword	0x1de7
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x276
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x277
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x278
	.uaword	0x13a3
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_PIRQSS"
	.byte	0x7
	.uahalf	0x279
	.uaword	0x1dbf
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x27c
	.uaword	0x1e26
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x27e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x27f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x280
	.uaword	0x144b
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RIS"
	.byte	0x7
	.uahalf	0x281
	.uaword	0x1dfe
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x284
	.uaword	0x1e62
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x286
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x287
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x288
	.uaword	0x14a4
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RPSSTAT"
	.byte	0x7
	.uahalf	0x289
	.uaword	0x1e3a
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x28c
	.uaword	0x1ea2
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x28e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x28f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x290
	.uaword	0x1501
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RUNCTRL"
	.byte	0x7
	.uahalf	0x291
	.uaword	0x1e7a
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x294
	.uaword	0x1ee2
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x296
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x297
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x298
	.uaword	0x154a
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_RXD"
	.byte	0x7
	.uahalf	0x299
	.uaword	0x1eba
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x29c
	.uaword	0x1f1e
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x29e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x29f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x2a0
	.uaword	0x165f
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_TIMCFG"
	.byte	0x7
	.uahalf	0x2a1
	.uaword	0x1ef6
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x2a4
	.uaword	0x1f5d
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x2a6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x2a7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x2a8
	.uaword	0x16bb
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_TPSCTRL"
	.byte	0x7
	.uahalf	0x2a9
	.uaword	0x1f35
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uahalf	0x2ac
	.uaword	0x1f9d
	.uleb128 0x13
	.string	"U"
	.byte	0x7
	.uahalf	0x2ae
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x7
	.uahalf	0x2af
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x7
	.uahalf	0x2b0
	.uaword	0x1704
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C_TXD"
	.byte	0x7
	.uahalf	0x2b1
	.uaword	0x1f75
	.uleb128 0x14
	.string	"_Ifx_I2C"
	.uaword	0x10100
	.byte	0x7
	.uahalf	0x2bc
	.uaword	0x22cd
	.uleb128 0x15
	.string	"CLC1"
	.byte	0x7
	.uahalf	0x2be
	.uaword	0x187f
	.byte	0
	.uleb128 0x16
	.uaword	.LASF11
	.byte	0x7
	.uahalf	0x2bf
	.uaword	0x22cd
	.byte	0x4
	.uleb128 0x15
	.string	"ID"
	.byte	0x7
	.uahalf	0x2c0
	.uaword	0x1b3e
	.byte	0x8
	.uleb128 0x16
	.uaword	.LASF26
	.byte	0x7
	.uahalf	0x2c1
	.uaword	0x22cd
	.byte	0xc
	.uleb128 0x15
	.string	"RUNCTRL"
	.byte	0x7
	.uahalf	0x2c2
	.uaword	0x1ea2
	.byte	0x10
	.uleb128 0x15
	.string	"ENDDCTRL"
	.byte	0x7
	.uahalf	0x2c3
	.uaword	0x18bc
	.byte	0x14
	.uleb128 0x15
	.string	"FDIVCFG"
	.byte	0x7
	.uahalf	0x2c4
	.uaword	0x19c0
	.byte	0x18
	.uleb128 0x15
	.string	"FDIVHIGHCFG"
	.byte	0x7
	.uahalf	0x2c5
	.uaword	0x1a00
	.byte	0x1c
	.uleb128 0x15
	.string	"ADDRCFG"
	.byte	0x7
	.uahalf	0x2c6
	.uaword	0x17c3
	.byte	0x20
	.uleb128 0x15
	.string	"BUSSTAT"
	.byte	0x7
	.uahalf	0x2c7
	.uaword	0x1803
	.byte	0x24
	.uleb128 0x15
	.string	"FIFOCFG"
	.byte	0x7
	.uahalf	0x2c8
	.uaword	0x1a84
	.byte	0x28
	.uleb128 0x15
	.string	"MRPSCTRL"
	.byte	0x7
	.uahalf	0x2c9
	.uaword	0x1d28
	.byte	0x2c
	.uleb128 0x15
	.string	"RPSSTAT"
	.byte	0x7
	.uahalf	0x2ca
	.uaword	0x1e62
	.byte	0x30
	.uleb128 0x15
	.string	"TPSCTRL"
	.byte	0x7
	.uahalf	0x2cb
	.uaword	0x1f5d
	.byte	0x34
	.uleb128 0x15
	.string	"FFSSTAT"
	.byte	0x7
	.uahalf	0x2cc
	.uaword	0x1a44
	.byte	0x38
	.uleb128 0x15
	.string	"reserved_3C"
	.byte	0x7
	.uahalf	0x2cd
	.uaword	0x22cd
	.byte	0x3c
	.uleb128 0x15
	.string	"TIMCFG"
	.byte	0x7
	.uahalf	0x2ce
	.uaword	0x1f1e
	.byte	0x40
	.uleb128 0x15
	.string	"reserved_44"
	.byte	0x7
	.uahalf	0x2cf
	.uaword	0x22e9
	.byte	0x44
	.uleb128 0x15
	.string	"ERRIRQSM"
	.byte	0x7
	.uahalf	0x2d0
	.uaword	0x193e
	.byte	0x60
	.uleb128 0x15
	.string	"ERRIRQSS"
	.byte	0x7
	.uahalf	0x2d1
	.uaword	0x197f
	.byte	0x64
	.uleb128 0x15
	.string	"ERRIRQSC"
	.byte	0x7
	.uahalf	0x2d2
	.uaword	0x18fd
	.byte	0x68
	.uleb128 0x15
	.string	"reserved_6C"
	.byte	0x7
	.uahalf	0x2d3
	.uaword	0x22cd
	.byte	0x6c
	.uleb128 0x15
	.string	"PIRQSM"
	.byte	0x7
	.uahalf	0x2d4
	.uaword	0x1da8
	.byte	0x70
	.uleb128 0x15
	.string	"PIRQSS"
	.byte	0x7
	.uahalf	0x2d5
	.uaword	0x1de7
	.byte	0x74
	.uleb128 0x15
	.string	"PIRQSC"
	.byte	0x7
	.uahalf	0x2d6
	.uaword	0x1d69
	.byte	0x78
	.uleb128 0x15
	.string	"reserved_7C"
	.byte	0x7
	.uahalf	0x2d7
	.uaword	0x22cd
	.byte	0x7c
	.uleb128 0x15
	.string	"RIS"
	.byte	0x7
	.uahalf	0x2d8
	.uaword	0x1e26
	.byte	0x80
	.uleb128 0x15
	.string	"IMSC"
	.byte	0x7
	.uahalf	0x2d9
	.uaword	0x1b79
	.byte	0x84
	.uleb128 0x15
	.string	"MIS"
	.byte	0x7
	.uahalf	0x2da
	.uaword	0x1cae
	.byte	0x88
	.uleb128 0x15
	.string	"ICR"
	.byte	0x7
	.uahalf	0x2db
	.uaword	0x1b02
	.byte	0x8c
	.uleb128 0x15
	.string	"ISR"
	.byte	0x7
	.uahalf	0x2dc
	.uaword	0x1bb6
	.byte	0x90
	.uleb128 0x15
	.string	"reserved_94"
	.byte	0x7
	.uahalf	0x2dd
	.uaword	0x22f9
	.byte	0x94
	.uleb128 0x17
	.string	"TXD"
	.byte	0x7
	.uahalf	0x2de
	.uaword	0x1f9d
	.uahalf	0x8000
	.uleb128 0x17
	.string	"reserved_8004"
	.byte	0x7
	.uahalf	0x2df
	.uaword	0x230a
	.uahalf	0x8004
	.uleb128 0x17
	.string	"RXD"
	.byte	0x7
	.uahalf	0x2e0
	.uaword	0x1ee2
	.uahalf	0xc000
	.uleb128 0x17
	.string	"reserved_C004"
	.byte	0x7
	.uahalf	0x2e1
	.uaword	0x230a
	.uahalf	0xc004
	.uleb128 0x18
	.string	"CLC"
	.byte	0x7
	.uahalf	0x2e2
	.uaword	0x1843
	.uleb128 0x10000
	.uleb128 0x18
	.string	"MODID"
	.byte	0x7
	.uahalf	0x2e3
	.uaword	0x1cea
	.uleb128 0x10004
	.uleb128 0x18
	.string	"GPCTL"
	.byte	0x7
	.uahalf	0x2e4
	.uaword	0x1ac4
	.uleb128 0x10008
	.uleb128 0x18
	.string	"ACCEN0"
	.byte	0x7
	.uahalf	0x2e5
	.uaword	0x1745
	.uleb128 0x1000c
	.uleb128 0x18
	.string	"ACCEN1"
	.byte	0x7
	.uahalf	0x2e6
	.uaword	0x1784
	.uleb128 0x10010
	.uleb128 0x18
	.string	"KRST0"
	.byte	0x7
	.uahalf	0x2e7
	.uaword	0x1bf2
	.uleb128 0x10014
	.uleb128 0x18
	.string	"KRST1"
	.byte	0x7
	.uahalf	0x2e8
	.uaword	0x1c30
	.uleb128 0x10018
	.uleb128 0x18
	.string	"KRSTCLR"
	.byte	0x7
	.uahalf	0x2e9
	.uaword	0x1c6e
	.uleb128 0x1001c
	.uleb128 0x18
	.string	"reserved_10020"
	.byte	0x7
	.uahalf	0x2ea
	.uaword	0x231b
	.uleb128 0x10020
	.byte	0
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x22dd
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.string	"sizetype"
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x22f9
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0x1b
	.byte	0
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x230a
	.uleb128 0x1b
	.uaword	0x22dd
	.uahalf	0x7f6b
	.byte	0
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x231b
	.uleb128 0x1b
	.uaword	0x22dd
	.uahalf	0x3ffb
	.byte	0
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x232b
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0xdf
	.byte	0
	.uleb128 0xf
	.string	"Ifx_I2C"
	.byte	0x7
	.uahalf	0x2eb
	.uaword	0x233b
	.uleb128 0x1c
	.uaword	0x1fb1
	.uleb128 0x1c
	.uaword	0x57d
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x2355
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0x7
	.byte	0
	.uleb128 0x10
	.string	"_Ifx_CPU_ICR_Bits"
	.byte	0x4
	.byte	0x8
	.uahalf	0x176
	.uaword	0x23ca
	.uleb128 0x11
	.string	"CCPN"
	.byte	0x8
	.uahalf	0x178
	.uaword	0x2340
	.byte	0x4
	.byte	0xa
	.byte	0x16
	.byte	0
	.uleb128 0xe
	.uaword	.LASF2
	.byte	0x8
	.uahalf	0x179
	.uaword	0x2340
	.byte	0x4
	.byte	0x5
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"IE"
	.byte	0x8
	.uahalf	0x17a
	.uaword	0x2340
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.string	"PIPN"
	.byte	0x8
	.uahalf	0x17b
	.uaword	0x2340
	.byte	0x4
	.byte	0xa
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.string	"reserved_26"
	.byte	0x8
	.uahalf	0x17c
	.uaword	0x2340
	.byte	0x4
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_CPU_ICR_Bits"
	.byte	0x8
	.uahalf	0x17d
	.uaword	0x2355
	.uleb128 0x12
	.byte	0x4
	.byte	0x8
	.uahalf	0x3e2
	.uaword	0x240b
	.uleb128 0x13
	.string	"U"
	.byte	0x8
	.uahalf	0x3e4
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x8
	.uahalf	0x3e5
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x8
	.uahalf	0x3e6
	.uaword	0x23ca
	.byte	0
	.uleb128 0xf
	.string	"Ifx_CPU_ICR"
	.byte	0x8
	.uahalf	0x3e7
	.uaword	0x23e3
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x242f
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0x17
	.byte	0
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x243f
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0xb
	.byte	0
	.uleb128 0xb
	.string	"_Ifx_P_ACCEN0_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x2d
	.uaword	0x2651
	.uleb128 0xc
	.string	"EN0"
	.byte	0x9
	.byte	0x2f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"EN1"
	.byte	0x9
	.byte	0x30
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"EN2"
	.byte	0x9
	.byte	0x31
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"EN3"
	.byte	0x9
	.byte	0x32
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"EN4"
	.byte	0x9
	.byte	0x33
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"EN5"
	.byte	0x9
	.byte	0x34
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xc
	.string	"EN6"
	.byte	0x9
	.byte	0x35
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.string	"EN7"
	.byte	0x9
	.byte	0x36
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"EN8"
	.byte	0x9
	.byte	0x37
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0xc
	.string	"EN9"
	.byte	0x9
	.byte	0x38
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0xc
	.string	"EN10"
	.byte	0x9
	.byte	0x39
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"EN11"
	.byte	0x9
	.byte	0x3a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"EN12"
	.byte	0x9
	.byte	0x3b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.string	"EN13"
	.byte	0x9
	.byte	0x3c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0xc
	.string	"EN14"
	.byte	0x9
	.byte	0x3d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0xc
	.string	"EN15"
	.byte	0x9
	.byte	0x3e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"EN16"
	.byte	0x9
	.byte	0x3f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.string	"EN17"
	.byte	0x9
	.byte	0x40
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.string	"EN18"
	.byte	0x9
	.byte	0x41
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"EN19"
	.byte	0x9
	.byte	0x42
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.string	"EN20"
	.byte	0x9
	.byte	0x43
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0xc
	.string	"EN21"
	.byte	0x9
	.byte	0x44
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0xc
	.string	"EN22"
	.byte	0x9
	.byte	0x45
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0
	.uleb128 0xc
	.string	"EN23"
	.byte	0x9
	.byte	0x46
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.string	"EN24"
	.byte	0x9
	.byte	0x47
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.string	"EN25"
	.byte	0x9
	.byte	0x48
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.string	"EN26"
	.byte	0x9
	.byte	0x49
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.string	"EN27"
	.byte	0x9
	.byte	0x4a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.string	"EN28"
	.byte	0x9
	.byte	0x4b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.string	"EN29"
	.byte	0x9
	.byte	0x4c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.string	"EN30"
	.byte	0x9
	.byte	0x4d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.string	"EN31"
	.byte	0x9
	.byte	0x4e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_ACCEN0_Bits"
	.byte	0x9
	.byte	0x4f
	.uaword	0x243f
	.uleb128 0xb
	.string	"_Ifx_P_ACCEN1_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x52
	.uaword	0x2695
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0x54
	.uaword	0x57d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_ACCEN1_Bits"
	.byte	0x9
	.byte	0x55
	.uaword	0x266a
	.uleb128 0xb
	.string	"_Ifx_P_ESR_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x58
	.uaword	0x27cc
	.uleb128 0xc
	.string	"EN0"
	.byte	0x9
	.byte	0x5a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"EN1"
	.byte	0x9
	.byte	0x5b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"EN2"
	.byte	0x9
	.byte	0x5c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"EN3"
	.byte	0x9
	.byte	0x5d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"EN4"
	.byte	0x9
	.byte	0x5e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"EN5"
	.byte	0x9
	.byte	0x5f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xc
	.string	"EN6"
	.byte	0x9
	.byte	0x60
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.string	"EN7"
	.byte	0x9
	.byte	0x61
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"EN8"
	.byte	0x9
	.byte	0x62
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0xc
	.string	"EN9"
	.byte	0x9
	.byte	0x63
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0xc
	.string	"EN10"
	.byte	0x9
	.byte	0x64
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"EN11"
	.byte	0x9
	.byte	0x65
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"EN12"
	.byte	0x9
	.byte	0x66
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.string	"EN13"
	.byte	0x9
	.byte	0x67
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0xc
	.string	"EN14"
	.byte	0x9
	.byte	0x68
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0xc
	.string	"EN15"
	.byte	0x9
	.byte	0x69
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x9
	.byte	0x6a
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_ESR_Bits"
	.byte	0x9
	.byte	0x6b
	.uaword	0x26ae
	.uleb128 0xb
	.string	"_Ifx_P_ID_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x6e
	.uaword	0x282e
	.uleb128 0xc
	.string	"MODREV"
	.byte	0x9
	.byte	0x70
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"MODTYPE"
	.byte	0x9
	.byte	0x71
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF19
	.byte	0x9
	.byte	0x72
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_ID_Bits"
	.byte	0x9
	.byte	0x73
	.uaword	0x27e2
	.uleb128 0xb
	.string	"_Ifx_P_IN_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x76
	.uaword	0x2950
	.uleb128 0xc
	.string	"P0"
	.byte	0x9
	.byte	0x78
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"P1"
	.byte	0x9
	.byte	0x79
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"P2"
	.byte	0x9
	.byte	0x7a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"P3"
	.byte	0x9
	.byte	0x7b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"P4"
	.byte	0x9
	.byte	0x7c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"P5"
	.byte	0x9
	.byte	0x7d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xc
	.string	"P6"
	.byte	0x9
	.byte	0x7e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.string	"P7"
	.byte	0x9
	.byte	0x7f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"P8"
	.byte	0x9
	.byte	0x80
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0xc
	.string	"P9"
	.byte	0x9
	.byte	0x81
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0xc
	.string	"P10"
	.byte	0x9
	.byte	0x82
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"P11"
	.byte	0x9
	.byte	0x83
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"P12"
	.byte	0x9
	.byte	0x84
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.string	"P13"
	.byte	0x9
	.byte	0x85
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0xc
	.string	"P14"
	.byte	0x9
	.byte	0x86
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0xc
	.string	"P15"
	.byte	0x9
	.byte	0x87
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x9
	.byte	0x88
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_IN_Bits"
	.byte	0x9
	.byte	0x89
	.uaword	0x2843
	.uleb128 0xb
	.string	"_Ifx_P_IOCR0_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x8c
	.uaword	0x29f8
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0x8e
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"PC0"
	.byte	0x9
	.byte	0x8f
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.uaword	.LASF27
	.byte	0x9
	.byte	0x90
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"PC1"
	.byte	0x9
	.byte	0x91
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x9
	.byte	0x92
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"PC2"
	.byte	0x9
	.byte	0x93
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.uaword	.LASF13
	.byte	0x9
	.byte	0x94
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.string	"PC3"
	.byte	0x9
	.byte	0x95
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_IOCR0_Bits"
	.byte	0x9
	.byte	0x96
	.uaword	0x2965
	.uleb128 0xb
	.string	"_Ifx_P_IOCR12_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x99
	.uaword	0x2aa8
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0x9b
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"PC12"
	.byte	0x9
	.byte	0x9c
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.uaword	.LASF27
	.byte	0x9
	.byte	0x9d
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"PC13"
	.byte	0x9
	.byte	0x9e
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x9
	.byte	0x9f
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"PC14"
	.byte	0x9
	.byte	0xa0
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.uaword	.LASF13
	.byte	0x9
	.byte	0xa1
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.string	"PC15"
	.byte	0x9
	.byte	0xa2
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_IOCR12_Bits"
	.byte	0x9
	.byte	0xa3
	.uaword	0x2a10
	.uleb128 0xb
	.string	"_Ifx_P_IOCR4_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xa6
	.uaword	0x2b54
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xa8
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"PC4"
	.byte	0x9
	.byte	0xa9
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.uaword	.LASF27
	.byte	0x9
	.byte	0xaa
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"PC5"
	.byte	0x9
	.byte	0xab
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x9
	.byte	0xac
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"PC6"
	.byte	0x9
	.byte	0xad
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.uaword	.LASF13
	.byte	0x9
	.byte	0xae
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.string	"PC7"
	.byte	0x9
	.byte	0xaf
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_IOCR4_Bits"
	.byte	0x9
	.byte	0xb0
	.uaword	0x2ac1
	.uleb128 0xb
	.string	"_Ifx_P_IOCR8_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xb3
	.uaword	0x2c01
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xb5
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"PC8"
	.byte	0x9
	.byte	0xb6
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.uaword	.LASF27
	.byte	0x9
	.byte	0xb7
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"PC9"
	.byte	0x9
	.byte	0xb8
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x9
	.byte	0xb9
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"PC10"
	.byte	0x9
	.byte	0xba
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.uaword	.LASF13
	.byte	0x9
	.byte	0xbb
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.string	"PC11"
	.byte	0x9
	.byte	0xbc
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_IOCR8_Bits"
	.byte	0x9
	.byte	0xbd
	.uaword	0x2b6c
	.uleb128 0xb
	.string	"_Ifx_P_LPCR0_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xc0
	.uaword	0x2c61
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xc2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"PS1"
	.byte	0x9
	.byte	0xc3
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF6
	.byte	0x9
	.byte	0xc4
	.uaword	0x57d
	.byte	0x4
	.byte	0x1e
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_LPCR0_Bits"
	.byte	0x9
	.byte	0xc5
	.uaword	0x2c19
	.uleb128 0xb
	.string	"_Ifx_P_LPCR1_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xc8
	.uaword	0x2cc1
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xca
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"PS1"
	.byte	0x9
	.byte	0xcb
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.uaword	.LASF6
	.byte	0x9
	.byte	0xcc
	.uaword	0x57d
	.byte	0x4
	.byte	0x1e
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_LPCR1_Bits"
	.byte	0x9
	.byte	0xcd
	.uaword	0x2c79
	.uleb128 0xb
	.string	"_Ifx_P_LPCR1_P21_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xd0
	.uaword	0x2d51
	.uleb128 0xc
	.string	"RDIS_CTRL"
	.byte	0x9
	.byte	0xd2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"RX_DIS"
	.byte	0x9
	.byte	0xd3
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"TERM"
	.byte	0x9
	.byte	0xd4
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"LRXTERM"
	.byte	0x9
	.byte	0xd5
	.uaword	0x57d
	.byte	0x4
	.byte	0x5
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.uaword	.LASF27
	.byte	0x9
	.byte	0xd6
	.uaword	0x57d
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_LPCR1_P21_Bits"
	.byte	0x9
	.byte	0xd7
	.uaword	0x2cd9
	.uleb128 0xb
	.string	"_Ifx_P_LPCR2_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xda
	.uaword	0x2e24
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xdc
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"LVDSR"
	.byte	0x9
	.byte	0xdd
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0xc
	.string	"LVDSRL"
	.byte	0x9
	.byte	0xde
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0xd
	.uaword	.LASF2
	.byte	0x9
	.byte	0xdf
	.uaword	0x57d
	.byte	0x4
	.byte	0x2
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"TDIS_CTRL"
	.byte	0x9
	.byte	0xe0
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.string	"TX_DIS"
	.byte	0x9
	.byte	0xe1
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0xc
	.string	"TX_PD"
	.byte	0x9
	.byte	0xe2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0xc
	.string	"TX_PWDPD"
	.byte	0x9
	.byte	0xe3
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.uaword	.LASF5
	.byte	0x9
	.byte	0xe4
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_LPCR2_Bits"
	.byte	0x9
	.byte	0xe5
	.uaword	0x2d6d
	.uleb128 0xb
	.string	"_Ifx_P_OMCR0_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xe8
	.uaword	0x2eb5
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xea
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"PCL0"
	.byte	0x9
	.byte	0xeb
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.string	"PCL1"
	.byte	0x9
	.byte	0xec
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.string	"PCL2"
	.byte	0x9
	.byte	0xed
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"PCL3"
	.byte	0x9
	.byte	0xee
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0xd
	.uaword	.LASF28
	.byte	0x9
	.byte	0xef
	.uaword	0x57d
	.byte	0x4
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_OMCR0_Bits"
	.byte	0x9
	.byte	0xf0
	.uaword	0x2e3c
	.uleb128 0xb
	.string	"_Ifx_P_OMCR12_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xf3
	.uaword	0x2f3c
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xf5
	.uaword	0x57d
	.byte	0x4
	.byte	0x1c
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.string	"PCL12"
	.byte	0x9
	.byte	0xf6
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.string	"PCL13"
	.byte	0x9
	.byte	0xf7
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.string	"PCL14"
	.byte	0x9
	.byte	0xf8
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.string	"PCL15"
	.byte	0x9
	.byte	0xf9
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_P_OMCR12_Bits"
	.byte	0x9
	.byte	0xfa
	.uaword	0x2ecd
	.uleb128 0xb
	.string	"_Ifx_P_OMCR4_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xfd
	.uaword	0x2fd3
	.uleb128 0xd
	.uaword	.LASF1
	.byte	0x9
	.byte	0xff
	.uaword	0x57d
	.byte	0x4
	.byte	0x14
	.byte	0xc
	.byte	0
	.uleb128 0x11
	.string	"PCL4"
	.byte	0x9
	.uahalf	0x100
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.string	"PCL5"
	.byte	0x9
	.uahalf	0x101
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0x11
	.string	"PCL6"
	.byte	0x9
	.uahalf	0x102
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0
	.uleb128 0x11
	.string	"PCL7"
	.byte	0x9
	.uahalf	0x103
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.uaword	.LASF13
	.byte	0x9
	.uahalf	0x104
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR4_Bits"
	.byte	0x9
	.uahalf	0x105
	.uaword	0x2f55
	.uleb128 0x10
	.string	"_Ifx_P_OMCR8_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x108
	.uaword	0x306e
	.uleb128 0xe
	.uaword	.LASF1
	.byte	0x9
	.uahalf	0x10a
	.uaword	0x57d
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.string	"PCL8"
	.byte	0x9
	.uahalf	0x10b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0
	.uleb128 0x11
	.string	"PCL9"
	.byte	0x9
	.uahalf	0x10c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.string	"PCL10"
	.byte	0x9
	.uahalf	0x10d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0x11
	.string	"PCL11"
	.byte	0x9
	.uahalf	0x10e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.uaword	.LASF29
	.byte	0x9
	.uahalf	0x10f
	.uaword	0x57d
	.byte	0x4
	.byte	0x4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR8_Bits"
	.byte	0x9
	.uahalf	0x110
	.uaword	0x2fec
	.uleb128 0x10
	.string	"_Ifx_P_OMCR_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x113
	.uaword	0x31c8
	.uleb128 0xe
	.uaword	.LASF1
	.byte	0x9
	.uahalf	0x115
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.string	"PCL0"
	.byte	0x9
	.uahalf	0x116
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0x11
	.string	"PCL1"
	.byte	0x9
	.uahalf	0x117
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0x11
	.string	"PCL2"
	.byte	0x9
	.uahalf	0x118
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0
	.uleb128 0x11
	.string	"PCL3"
	.byte	0x9
	.uahalf	0x119
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0x11
	.string	"PCL4"
	.byte	0x9
	.uahalf	0x11a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.string	"PCL5"
	.byte	0x9
	.uahalf	0x11b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0x11
	.string	"PCL6"
	.byte	0x9
	.uahalf	0x11c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0
	.uleb128 0x11
	.string	"PCL7"
	.byte	0x9
	.uahalf	0x11d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.string	"PCL8"
	.byte	0x9
	.uahalf	0x11e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0
	.uleb128 0x11
	.string	"PCL9"
	.byte	0x9
	.uahalf	0x11f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.string	"PCL10"
	.byte	0x9
	.uahalf	0x120
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0x11
	.string	"PCL11"
	.byte	0x9
	.uahalf	0x121
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.string	"PCL12"
	.byte	0x9
	.uahalf	0x122
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0x11
	.string	"PCL13"
	.byte	0x9
	.uahalf	0x123
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0x11
	.string	"PCL14"
	.byte	0x9
	.uahalf	0x124
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.string	"PCL15"
	.byte	0x9
	.uahalf	0x125
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR_Bits"
	.byte	0x9
	.uahalf	0x126
	.uaword	0x3087
	.uleb128 0x10
	.string	"_Ifx_P_OMR_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x129
	.uaword	0x3416
	.uleb128 0x11
	.string	"PS0"
	.byte	0x9
	.uahalf	0x12b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"PS1"
	.byte	0x9
	.uahalf	0x12c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"PS2"
	.byte	0x9
	.uahalf	0x12d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"PS3"
	.byte	0x9
	.uahalf	0x12e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"PS4"
	.byte	0x9
	.uahalf	0x12f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0x11
	.string	"PS5"
	.byte	0x9
	.uahalf	0x130
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"PS6"
	.byte	0x9
	.uahalf	0x131
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0x11
	.string	"PS7"
	.byte	0x9
	.uahalf	0x132
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"PS8"
	.byte	0x9
	.uahalf	0x133
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0x11
	.string	"PS9"
	.byte	0x9
	.uahalf	0x134
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0x11
	.string	"PS10"
	.byte	0x9
	.uahalf	0x135
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"PS11"
	.byte	0x9
	.uahalf	0x136
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.string	"PS12"
	.byte	0x9
	.uahalf	0x137
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0x11
	.string	"PS13"
	.byte	0x9
	.uahalf	0x138
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0x11
	.string	"PS14"
	.byte	0x9
	.uahalf	0x139
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"PS15"
	.byte	0x9
	.uahalf	0x13a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.string	"PCL0"
	.byte	0x9
	.uahalf	0x13b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0x11
	.string	"PCL1"
	.byte	0x9
	.uahalf	0x13c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0x11
	.string	"PCL2"
	.byte	0x9
	.uahalf	0x13d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0
	.uleb128 0x11
	.string	"PCL3"
	.byte	0x9
	.uahalf	0x13e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0x11
	.string	"PCL4"
	.byte	0x9
	.uahalf	0x13f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.string	"PCL5"
	.byte	0x9
	.uahalf	0x140
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0x11
	.string	"PCL6"
	.byte	0x9
	.uahalf	0x141
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0
	.uleb128 0x11
	.string	"PCL7"
	.byte	0x9
	.uahalf	0x142
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.string	"PCL8"
	.byte	0x9
	.uahalf	0x143
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0
	.uleb128 0x11
	.string	"PCL9"
	.byte	0x9
	.uahalf	0x144
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.string	"PCL10"
	.byte	0x9
	.uahalf	0x145
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0x11
	.string	"PCL11"
	.byte	0x9
	.uahalf	0x146
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.string	"PCL12"
	.byte	0x9
	.uahalf	0x147
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0x11
	.string	"PCL13"
	.byte	0x9
	.uahalf	0x148
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0x11
	.string	"PCL14"
	.byte	0x9
	.uahalf	0x149
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.string	"PCL15"
	.byte	0x9
	.uahalf	0x14a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMR_Bits"
	.byte	0x9
	.uahalf	0x14b
	.uaword	0x31e0
	.uleb128 0x10
	.string	"_Ifx_P_OMSR0_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x14e
	.uaword	0x3499
	.uleb128 0x11
	.string	"PS0"
	.byte	0x9
	.uahalf	0x150
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"PS1"
	.byte	0x9
	.uahalf	0x151
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"PS2"
	.byte	0x9
	.uahalf	0x152
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"PS3"
	.byte	0x9
	.uahalf	0x153
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xe
	.uaword	.LASF11
	.byte	0x9
	.uahalf	0x154
	.uaword	0x57d
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR0_Bits"
	.byte	0x9
	.uahalf	0x155
	.uaword	0x342d
	.uleb128 0x10
	.string	"_Ifx_P_OMSR12_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x158
	.uaword	0x3533
	.uleb128 0xe
	.uaword	.LASF1
	.byte	0x9
	.uahalf	0x15a
	.uaword	0x57d
	.byte	0x4
	.byte	0xc
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.string	"PS12"
	.byte	0x9
	.uahalf	0x15b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0x11
	.string	"PS13"
	.byte	0x9
	.uahalf	0x15c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0x11
	.string	"PS14"
	.byte	0x9
	.uahalf	0x15d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"PS15"
	.byte	0x9
	.uahalf	0x15e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.uaword	.LASF5
	.byte	0x9
	.uahalf	0x15f
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR12_Bits"
	.byte	0x9
	.uahalf	0x160
	.uaword	0x34b2
	.uleb128 0x10
	.string	"_Ifx_P_OMSR4_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x163
	.uaword	0x35c9
	.uleb128 0xe
	.uaword	.LASF1
	.byte	0x9
	.uahalf	0x165
	.uaword	0x57d
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"PS4"
	.byte	0x9
	.uahalf	0x166
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0x11
	.string	"PS5"
	.byte	0x9
	.uahalf	0x167
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"PS6"
	.byte	0x9
	.uahalf	0x168
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0x11
	.string	"PS7"
	.byte	0x9
	.uahalf	0x169
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.uaword	.LASF27
	.byte	0x9
	.uahalf	0x16a
	.uaword	0x57d
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR4_Bits"
	.byte	0x9
	.uahalf	0x16b
	.uaword	0x354d
	.uleb128 0x10
	.string	"_Ifx_P_OMSR8_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x16e
	.uaword	0x3660
	.uleb128 0xe
	.uaword	.LASF1
	.byte	0x9
	.uahalf	0x170
	.uaword	0x57d
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"PS8"
	.byte	0x9
	.uahalf	0x171
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0x11
	.string	"PS9"
	.byte	0x9
	.uahalf	0x172
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0x11
	.string	"PS10"
	.byte	0x9
	.uahalf	0x173
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"PS11"
	.byte	0x9
	.uahalf	0x174
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0xe
	.uaword	.LASF25
	.byte	0x9
	.uahalf	0x175
	.uaword	0x57d
	.byte	0x4
	.byte	0x14
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR8_Bits"
	.byte	0x9
	.uahalf	0x176
	.uaword	0x35e2
	.uleb128 0x10
	.string	"_Ifx_P_OMSR_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x179
	.uaword	0x37aa
	.uleb128 0x11
	.string	"PS0"
	.byte	0x9
	.uahalf	0x17b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"PS1"
	.byte	0x9
	.uahalf	0x17c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"PS2"
	.byte	0x9
	.uahalf	0x17d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"PS3"
	.byte	0x9
	.uahalf	0x17e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"PS4"
	.byte	0x9
	.uahalf	0x17f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0x11
	.string	"PS5"
	.byte	0x9
	.uahalf	0x180
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"PS6"
	.byte	0x9
	.uahalf	0x181
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0x11
	.string	"PS7"
	.byte	0x9
	.uahalf	0x182
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"PS8"
	.byte	0x9
	.uahalf	0x183
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0x11
	.string	"PS9"
	.byte	0x9
	.uahalf	0x184
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0x11
	.string	"PS10"
	.byte	0x9
	.uahalf	0x185
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"PS11"
	.byte	0x9
	.uahalf	0x186
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.string	"PS12"
	.byte	0x9
	.uahalf	0x187
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0x11
	.string	"PS13"
	.byte	0x9
	.uahalf	0x188
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0x11
	.string	"PS14"
	.byte	0x9
	.uahalf	0x189
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"PS15"
	.byte	0x9
	.uahalf	0x18a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.uaword	.LASF5
	.byte	0x9
	.uahalf	0x18b
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR_Bits"
	.byte	0x9
	.uahalf	0x18c
	.uaword	0x3679
	.uleb128 0x10
	.string	"_Ifx_P_OUT_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x18f
	.uaword	0x38e2
	.uleb128 0x11
	.string	"P0"
	.byte	0x9
	.uahalf	0x191
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"P1"
	.byte	0x9
	.uahalf	0x192
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"P2"
	.byte	0x9
	.uahalf	0x193
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"P3"
	.byte	0x9
	.uahalf	0x194
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"P4"
	.byte	0x9
	.uahalf	0x195
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0x11
	.string	"P5"
	.byte	0x9
	.uahalf	0x196
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"P6"
	.byte	0x9
	.uahalf	0x197
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0x11
	.string	"P7"
	.byte	0x9
	.uahalf	0x198
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"P8"
	.byte	0x9
	.uahalf	0x199
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0x11
	.string	"P9"
	.byte	0x9
	.uahalf	0x19a
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0x11
	.string	"P10"
	.byte	0x9
	.uahalf	0x19b
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"P11"
	.byte	0x9
	.uahalf	0x19c
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.string	"P12"
	.byte	0x9
	.uahalf	0x19d
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0x11
	.string	"P13"
	.byte	0x9
	.uahalf	0x19e
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0x11
	.string	"P14"
	.byte	0x9
	.uahalf	0x19f
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"P15"
	.byte	0x9
	.uahalf	0x1a0
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.uaword	.LASF5
	.byte	0x9
	.uahalf	0x1a1
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OUT_Bits"
	.byte	0x9
	.uahalf	0x1a2
	.uaword	0x37c2
	.uleb128 0x10
	.string	"_Ifx_P_PCSR_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x1a5
	.uaword	0x39df
	.uleb128 0x11
	.string	"SEL0"
	.byte	0x9
	.uahalf	0x1a7
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"SEL1"
	.byte	0x9
	.uahalf	0x1a8
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"SEL2"
	.byte	0x9
	.uahalf	0x1a9
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"SEL3"
	.byte	0x9
	.uahalf	0x1aa
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"SEL4"
	.byte	0x9
	.uahalf	0x1ab
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0x11
	.string	"SEL5"
	.byte	0x9
	.uahalf	0x1ac
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"SEL6"
	.byte	0x9
	.uahalf	0x1ad
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xe
	.uaword	.LASF24
	.byte	0x9
	.uahalf	0x1ae
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x16
	.byte	0
	.uleb128 0x11
	.string	"SEL10"
	.byte	0x9
	.uahalf	0x1af
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"SEL11"
	.byte	0x9
	.uahalf	0x1b0
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0xe
	.uaword	.LASF25
	.byte	0x9
	.uahalf	0x1b1
	.uaword	0x57d
	.byte	0x4
	.byte	0x13
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.string	"LCK"
	.byte	0x9
	.uahalf	0x1b2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PCSR_Bits"
	.byte	0x9
	.uahalf	0x1b3
	.uaword	0x38f9
	.uleb128 0x10
	.string	"_Ifx_P_PDISC_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x1b6
	.uaword	0x3b49
	.uleb128 0x11
	.string	"PDIS0"
	.byte	0x9
	.uahalf	0x1b8
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x11
	.string	"PDIS1"
	.byte	0x9
	.uahalf	0x1b9
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x11
	.string	"PDIS2"
	.byte	0x9
	.uahalf	0x1ba
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"PDIS3"
	.byte	0x9
	.uahalf	0x1bb
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"PDIS4"
	.byte	0x9
	.uahalf	0x1bc
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0x11
	.string	"PDIS5"
	.byte	0x9
	.uahalf	0x1bd
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0x11
	.string	"PDIS6"
	.byte	0x9
	.uahalf	0x1be
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0x11
	.string	"PDIS7"
	.byte	0x9
	.uahalf	0x1bf
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"PDIS8"
	.byte	0x9
	.uahalf	0x1c0
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0x11
	.string	"PDIS9"
	.byte	0x9
	.uahalf	0x1c1
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0x11
	.string	"PDIS10"
	.byte	0x9
	.uahalf	0x1c2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"PDIS11"
	.byte	0x9
	.uahalf	0x1c3
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.string	"PDIS12"
	.byte	0x9
	.uahalf	0x1c4
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0x11
	.string	"PDIS13"
	.byte	0x9
	.uahalf	0x1c5
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0x11
	.string	"PDIS14"
	.byte	0x9
	.uahalf	0x1c6
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"PDIS15"
	.byte	0x9
	.uahalf	0x1c7
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.uaword	.LASF5
	.byte	0x9
	.uahalf	0x1c8
	.uaword	0x57d
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PDISC_Bits"
	.byte	0x9
	.uahalf	0x1c9
	.uaword	0x39f7
	.uleb128 0x10
	.string	"_Ifx_P_PDR0_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x1cc
	.uaword	0x3c7d
	.uleb128 0x11
	.string	"PD0"
	.byte	0x9
	.uahalf	0x1ce
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"PL0"
	.byte	0x9
	.uahalf	0x1cf
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"PD1"
	.byte	0x9
	.uahalf	0x1d0
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x19
	.byte	0
	.uleb128 0x11
	.string	"PL1"
	.byte	0x9
	.uahalf	0x1d1
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"PD2"
	.byte	0x9
	.uahalf	0x1d2
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"PL2"
	.byte	0x9
	.uahalf	0x1d3
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.string	"PD3"
	.byte	0x9
	.uahalf	0x1d4
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"PL3"
	.byte	0x9
	.uahalf	0x1d5
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.string	"PD4"
	.byte	0x9
	.uahalf	0x1d6
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0xd
	.byte	0
	.uleb128 0x11
	.string	"PL4"
	.byte	0x9
	.uahalf	0x1d7
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0x11
	.string	"PD5"
	.byte	0x9
	.uahalf	0x1d8
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x9
	.byte	0
	.uleb128 0x11
	.string	"PL5"
	.byte	0x9
	.uahalf	0x1d9
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.string	"PD6"
	.byte	0x9
	.uahalf	0x1da
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0
	.uleb128 0x11
	.string	"PL6"
	.byte	0x9
	.uahalf	0x1db
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.string	"PD7"
	.byte	0x9
	.uahalf	0x1dc
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.string	"PL7"
	.byte	0x9
	.uahalf	0x1dd
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PDR0_Bits"
	.byte	0x9
	.uahalf	0x1de
	.uaword	0x3b62
	.uleb128 0x10
	.string	"_Ifx_P_PDR1_Bits"
	.byte	0x4
	.byte	0x9
	.uahalf	0x1e1
	.uaword	0x3dbc
	.uleb128 0x11
	.string	"PD8"
	.byte	0x9
	.uahalf	0x1e3
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1d
	.byte	0
	.uleb128 0x11
	.string	"PL8"
	.byte	0x9
	.uahalf	0x1e4
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.string	"PD9"
	.byte	0x9
	.uahalf	0x1e5
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x19
	.byte	0
	.uleb128 0x11
	.string	"PL9"
	.byte	0x9
	.uahalf	0x1e6
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0x11
	.string	"PD10"
	.byte	0x9
	.uahalf	0x1e7
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x15
	.byte	0
	.uleb128 0x11
	.string	"PL10"
	.byte	0x9
	.uahalf	0x1e8
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.string	"PD11"
	.byte	0x9
	.uahalf	0x1e9
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x11
	.byte	0
	.uleb128 0x11
	.string	"PL11"
	.byte	0x9
	.uahalf	0x1ea
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.string	"PD12"
	.byte	0x9
	.uahalf	0x1eb
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0xd
	.byte	0
	.uleb128 0x11
	.string	"PL12"
	.byte	0x9
	.uahalf	0x1ec
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0x11
	.string	"PD13"
	.byte	0x9
	.uahalf	0x1ed
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x9
	.byte	0
	.uleb128 0x11
	.string	"PL13"
	.byte	0x9
	.uahalf	0x1ee
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.string	"PD14"
	.byte	0x9
	.uahalf	0x1ef
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0
	.uleb128 0x11
	.string	"PL14"
	.byte	0x9
	.uahalf	0x1f0
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.string	"PD15"
	.byte	0x9
	.uahalf	0x1f1
	.uaword	0x57d
	.byte	0x4
	.byte	0x3
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.string	"PL15"
	.byte	0x9
	.uahalf	0x1f2
	.uaword	0x57d
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PDR1_Bits"
	.byte	0x9
	.uahalf	0x1f3
	.uaword	0x3c95
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x1fb
	.uaword	0x3dfc
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x1fd
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x1fe
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x1ff
	.uaword	0x2651
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_ACCEN0"
	.byte	0x9
	.uahalf	0x200
	.uaword	0x3dd4
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x203
	.uaword	0x3e39
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x205
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x206
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x207
	.uaword	0x2695
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_ACCEN1"
	.byte	0x9
	.uahalf	0x208
	.uaword	0x3e11
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x20b
	.uaword	0x3e76
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x20d
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x20e
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x20f
	.uaword	0x27cc
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_ESR"
	.byte	0x9
	.uahalf	0x210
	.uaword	0x3e4e
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x213
	.uaword	0x3eb0
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x215
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x216
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x217
	.uaword	0x282e
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_ID"
	.byte	0x9
	.uahalf	0x218
	.uaword	0x3e88
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x21b
	.uaword	0x3ee9
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x21d
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x21e
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x21f
	.uaword	0x2950
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_IN"
	.byte	0x9
	.uahalf	0x220
	.uaword	0x3ec1
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x223
	.uaword	0x3f22
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x225
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x226
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x227
	.uaword	0x29f8
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_IOCR0"
	.byte	0x9
	.uahalf	0x228
	.uaword	0x3efa
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x22b
	.uaword	0x3f5e
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x22d
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x22e
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x22f
	.uaword	0x2aa8
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_IOCR12"
	.byte	0x9
	.uahalf	0x230
	.uaword	0x3f36
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x233
	.uaword	0x3f9b
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x235
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x236
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x237
	.uaword	0x2b54
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_IOCR4"
	.byte	0x9
	.uahalf	0x238
	.uaword	0x3f73
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x23b
	.uaword	0x3fd7
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x23d
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x23e
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x23f
	.uaword	0x2c01
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_IOCR8"
	.byte	0x9
	.uahalf	0x240
	.uaword	0x3faf
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x243
	.uaword	0x4013
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x245
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x246
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x247
	.uaword	0x2c61
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_LPCR0"
	.byte	0x9
	.uahalf	0x248
	.uaword	0x3feb
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x24b
	.uaword	0x405d
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x24d
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x24e
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x24f
	.uaword	0x2cc1
	.uleb128 0x13
	.string	"B_P21"
	.byte	0x9
	.uahalf	0x250
	.uaword	0x2d51
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_LPCR1"
	.byte	0x9
	.uahalf	0x251
	.uaword	0x4027
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x254
	.uaword	0x4099
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x256
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x257
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x258
	.uaword	0x2e24
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_LPCR2"
	.byte	0x9
	.uahalf	0x259
	.uaword	0x4071
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x25c
	.uaword	0x40d5
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x25e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x25f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x260
	.uaword	0x31c8
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR"
	.byte	0x9
	.uahalf	0x261
	.uaword	0x40ad
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x264
	.uaword	0x4110
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x266
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x267
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x268
	.uaword	0x2eb5
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR0"
	.byte	0x9
	.uahalf	0x269
	.uaword	0x40e8
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x26c
	.uaword	0x414c
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x26e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x26f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x270
	.uaword	0x2f3c
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR12"
	.byte	0x9
	.uahalf	0x271
	.uaword	0x4124
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x274
	.uaword	0x4189
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x276
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x277
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x278
	.uaword	0x2fd3
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR4"
	.byte	0x9
	.uahalf	0x279
	.uaword	0x4161
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x27c
	.uaword	0x41c5
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x27e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x27f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x280
	.uaword	0x306e
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMCR8"
	.byte	0x9
	.uahalf	0x281
	.uaword	0x419d
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x284
	.uaword	0x4201
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x286
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x287
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x288
	.uaword	0x3416
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMR"
	.byte	0x9
	.uahalf	0x289
	.uaword	0x41d9
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x28c
	.uaword	0x423b
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x28e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x28f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x290
	.uaword	0x37aa
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR"
	.byte	0x9
	.uahalf	0x291
	.uaword	0x4213
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x294
	.uaword	0x4276
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x296
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x297
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x298
	.uaword	0x3499
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR0"
	.byte	0x9
	.uahalf	0x299
	.uaword	0x424e
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x29c
	.uaword	0x42b2
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x29e
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x29f
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2a0
	.uaword	0x3533
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR12"
	.byte	0x9
	.uahalf	0x2a1
	.uaword	0x428a
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x2a4
	.uaword	0x42ef
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x2a6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x2a7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2a8
	.uaword	0x35c9
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR4"
	.byte	0x9
	.uahalf	0x2a9
	.uaword	0x42c7
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x2ac
	.uaword	0x432b
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x2ae
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x2af
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2b0
	.uaword	0x3660
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OMSR8"
	.byte	0x9
	.uahalf	0x2b1
	.uaword	0x4303
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x2b4
	.uaword	0x4367
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x2b6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x2b7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2b8
	.uaword	0x38e2
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_OUT"
	.byte	0x9
	.uahalf	0x2b9
	.uaword	0x433f
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x2bc
	.uaword	0x43a1
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x2be
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x2bf
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2c0
	.uaword	0x39df
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PCSR"
	.byte	0x9
	.uahalf	0x2c1
	.uaword	0x4379
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x2c4
	.uaword	0x43dc
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x2c6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x2c7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2c8
	.uaword	0x3b49
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PDISC"
	.byte	0x9
	.uahalf	0x2c9
	.uaword	0x43b4
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x2cc
	.uaword	0x4418
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x2ce
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x2cf
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2d0
	.uaword	0x3c7d
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PDR0"
	.byte	0x9
	.uahalf	0x2d1
	.uaword	0x43f0
	.uleb128 0x12
	.byte	0x4
	.byte	0x9
	.uahalf	0x2d4
	.uaword	0x4453
	.uleb128 0x13
	.string	"U"
	.byte	0x9
	.uahalf	0x2d6
	.uaword	0x57d
	.uleb128 0x13
	.string	"I"
	.byte	0x9
	.uahalf	0x2d7
	.uaword	0x1a5
	.uleb128 0x13
	.string	"B"
	.byte	0x9
	.uahalf	0x2d8
	.uaword	0x3dbc
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P_PDR1"
	.byte	0x9
	.uahalf	0x2d9
	.uaword	0x442b
	.uleb128 0x1d
	.string	"_Ifx_P"
	.uahalf	0x100
	.byte	0x9
	.uahalf	0x2e4
	.uaword	0x46a0
	.uleb128 0x15
	.string	"OUT"
	.byte	0x9
	.uahalf	0x2e6
	.uaword	0x4367
	.byte	0
	.uleb128 0x15
	.string	"OMR"
	.byte	0x9
	.uahalf	0x2e7
	.uaword	0x4201
	.byte	0x4
	.uleb128 0x15
	.string	"ID"
	.byte	0x9
	.uahalf	0x2e8
	.uaword	0x3eb0
	.byte	0x8
	.uleb128 0x16
	.uaword	.LASF26
	.byte	0x9
	.uahalf	0x2e9
	.uaword	0x22cd
	.byte	0xc
	.uleb128 0x15
	.string	"IOCR0"
	.byte	0x9
	.uahalf	0x2ea
	.uaword	0x3f22
	.byte	0x10
	.uleb128 0x15
	.string	"IOCR4"
	.byte	0x9
	.uahalf	0x2eb
	.uaword	0x3f9b
	.byte	0x14
	.uleb128 0x15
	.string	"IOCR8"
	.byte	0x9
	.uahalf	0x2ec
	.uaword	0x3fd7
	.byte	0x18
	.uleb128 0x15
	.string	"IOCR12"
	.byte	0x9
	.uahalf	0x2ed
	.uaword	0x3f5e
	.byte	0x1c
	.uleb128 0x16
	.uaword	.LASF28
	.byte	0x9
	.uahalf	0x2ee
	.uaword	0x22cd
	.byte	0x20
	.uleb128 0x15
	.string	"IN"
	.byte	0x9
	.uahalf	0x2ef
	.uaword	0x3ee9
	.byte	0x24
	.uleb128 0x16
	.uaword	.LASF29
	.byte	0x9
	.uahalf	0x2f0
	.uaword	0x241f
	.byte	0x28
	.uleb128 0x15
	.string	"PDR0"
	.byte	0x9
	.uahalf	0x2f1
	.uaword	0x4418
	.byte	0x40
	.uleb128 0x15
	.string	"PDR1"
	.byte	0x9
	.uahalf	0x2f2
	.uaword	0x4453
	.byte	0x44
	.uleb128 0x15
	.string	"reserved_48"
	.byte	0x9
	.uahalf	0x2f3
	.uaword	0x2345
	.byte	0x48
	.uleb128 0x15
	.string	"ESR"
	.byte	0x9
	.uahalf	0x2f4
	.uaword	0x3e76
	.byte	0x50
	.uleb128 0x15
	.string	"reserved_54"
	.byte	0x9
	.uahalf	0x2f5
	.uaword	0x242f
	.byte	0x54
	.uleb128 0x15
	.string	"PDISC"
	.byte	0x9
	.uahalf	0x2f6
	.uaword	0x43dc
	.byte	0x60
	.uleb128 0x15
	.string	"PCSR"
	.byte	0x9
	.uahalf	0x2f7
	.uaword	0x43a1
	.byte	0x64
	.uleb128 0x15
	.string	"reserved_68"
	.byte	0x9
	.uahalf	0x2f8
	.uaword	0x2345
	.byte	0x68
	.uleb128 0x15
	.string	"OMSR0"
	.byte	0x9
	.uahalf	0x2f9
	.uaword	0x4276
	.byte	0x70
	.uleb128 0x15
	.string	"OMSR4"
	.byte	0x9
	.uahalf	0x2fa
	.uaword	0x42ef
	.byte	0x74
	.uleb128 0x15
	.string	"OMSR8"
	.byte	0x9
	.uahalf	0x2fb
	.uaword	0x432b
	.byte	0x78
	.uleb128 0x15
	.string	"OMSR12"
	.byte	0x9
	.uahalf	0x2fc
	.uaword	0x42b2
	.byte	0x7c
	.uleb128 0x15
	.string	"OMCR0"
	.byte	0x9
	.uahalf	0x2fd
	.uaword	0x4110
	.byte	0x80
	.uleb128 0x15
	.string	"OMCR4"
	.byte	0x9
	.uahalf	0x2fe
	.uaword	0x4189
	.byte	0x84
	.uleb128 0x15
	.string	"OMCR8"
	.byte	0x9
	.uahalf	0x2ff
	.uaword	0x41c5
	.byte	0x88
	.uleb128 0x15
	.string	"OMCR12"
	.byte	0x9
	.uahalf	0x300
	.uaword	0x414c
	.byte	0x8c
	.uleb128 0x15
	.string	"OMSR"
	.byte	0x9
	.uahalf	0x301
	.uaword	0x423b
	.byte	0x90
	.uleb128 0x15
	.string	"OMCR"
	.byte	0x9
	.uahalf	0x302
	.uaword	0x40d5
	.byte	0x94
	.uleb128 0x15
	.string	"reserved_98"
	.byte	0x9
	.uahalf	0x303
	.uaword	0x2345
	.byte	0x98
	.uleb128 0x15
	.string	"LPCR0"
	.byte	0x9
	.uahalf	0x304
	.uaword	0x4013
	.byte	0xa0
	.uleb128 0x15
	.string	"LPCR1"
	.byte	0x9
	.uahalf	0x305
	.uaword	0x405d
	.byte	0xa4
	.uleb128 0x15
	.string	"LPCR2"
	.byte	0x9
	.uahalf	0x306
	.uaword	0x4099
	.byte	0xa8
	.uleb128 0x15
	.string	"reserved_A4"
	.byte	0x9
	.uahalf	0x307
	.uaword	0x46a0
	.byte	0xac
	.uleb128 0x15
	.string	"ACCEN1"
	.byte	0x9
	.uahalf	0x308
	.uaword	0x3e39
	.byte	0xf8
	.uleb128 0x15
	.string	"ACCEN0"
	.byte	0x9
	.uahalf	0x309
	.uaword	0x3dfc
	.byte	0xfc
	.byte	0
	.uleb128 0x19
	.uaword	0x1c8
	.uaword	0x46b0
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0x4b
	.byte	0
	.uleb128 0xf
	.string	"Ifx_P"
	.byte	0x9
	.uahalf	0x30a
	.uaword	0x46be
	.uleb128 0x1c
	.uaword	0x4466
	.uleb128 0x4
	.byte	0x4
	.uaword	0x46b0
	.uleb128 0x6
	.byte	0x1
	.byte	0xa
	.byte	0x65
	.uaword	0x47a5
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_general"
	.sleb128 128
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_alt1"
	.sleb128 136
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_alt2"
	.sleb128 144
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_alt3"
	.sleb128 152
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_alt4"
	.sleb128 160
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_alt5"
	.sleb128 168
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_alt6"
	.sleb128 176
	.uleb128 0x7
	.string	"IfxPort_OutputIdx_alt7"
	.sleb128 184
	.byte	0
	.uleb128 0x3
	.string	"IfxPort_OutputIdx"
	.byte	0xa
	.byte	0x6e
	.uaword	0x46c9
	.uleb128 0x6
	.byte	0x1
	.byte	0xa
	.byte	0x7d
	.uaword	0x495f
	.uleb128 0x7
	.string	"IfxPort_PadDriver_cmosAutomotiveSpeed1"
	.sleb128 0
	.uleb128 0x7
	.string	"IfxPort_PadDriver_cmosAutomotiveSpeed2"
	.sleb128 1
	.uleb128 0x7
	.string	"IfxPort_PadDriver_cmosAutomotiveSpeed3"
	.sleb128 2
	.uleb128 0x7
	.string	"IfxPort_PadDriver_cmosAutomotiveSpeed4"
	.sleb128 3
	.uleb128 0x7
	.string	"IfxPort_PadDriver_lvdsSpeed1"
	.sleb128 4
	.uleb128 0x7
	.string	"IfxPort_PadDriver_lvdsSpeed2"
	.sleb128 5
	.uleb128 0x7
	.string	"IfxPort_PadDriver_lvdsSpeed3"
	.sleb128 6
	.uleb128 0x7
	.string	"IfxPort_PadDriver_lvdsSpeed4"
	.sleb128 7
	.uleb128 0x7
	.string	"IfxPort_PadDriver_ttlSpeed1"
	.sleb128 8
	.uleb128 0x7
	.string	"IfxPort_PadDriver_ttlSpeed2"
	.sleb128 9
	.uleb128 0x7
	.string	"IfxPort_PadDriver_ttlSpeed3"
	.sleb128 10
	.uleb128 0x7
	.string	"IfxPort_PadDriver_ttlSpeed4"
	.sleb128 11
	.byte	0
	.uleb128 0x3
	.string	"IfxPort_PadDriver"
	.byte	0xa
	.byte	0x8a
	.uaword	0x47be
	.uleb128 0x8
	.byte	0x8
	.byte	0xa
	.byte	0xaa
	.uaword	0x499f
	.uleb128 0xa
	.string	"port"
	.byte	0xa
	.byte	0xac
	.uaword	0x46c3
	.byte	0
	.uleb128 0xa
	.string	"pinIndex"
	.byte	0xa
	.byte	0xad
	.uaword	0x1bb
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.string	"IfxPort_Pin"
	.byte	0xa
	.byte	0xae
	.uaword	0x4978
	.uleb128 0x8
	.byte	0x10
	.byte	0xb
	.byte	0x27
	.uaword	0x49eb
	.uleb128 0x9
	.uaword	.LASF0
	.byte	0xb
	.byte	0x29
	.uaword	0x49eb
	.byte	0
	.uleb128 0xa
	.string	"pin"
	.byte	0xb
	.byte	0x2a
	.uaword	0x499f
	.byte	0x4
	.uleb128 0x9
	.uaword	.LASF30
	.byte	0xb
	.byte	0x2b
	.uaword	0x31b
	.byte	0xc
	.uleb128 0x9
	.uaword	.LASF31
	.byte	0xb
	.byte	0x2c
	.uaword	0x47a5
	.byte	0xd
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x232b
	.uleb128 0x3
	.string	"IfxI2c_Scl_InOut"
	.byte	0xb
	.byte	0x2d
	.uaword	0x4a09
	.uleb128 0x1e
	.uaword	0x49b2
	.uleb128 0x8
	.byte	0x10
	.byte	0xb
	.byte	0x30
	.uaword	0x4a47
	.uleb128 0x9
	.uaword	.LASF0
	.byte	0xb
	.byte	0x32
	.uaword	0x49eb
	.byte	0
	.uleb128 0xa
	.string	"pin"
	.byte	0xb
	.byte	0x33
	.uaword	0x499f
	.byte	0x4
	.uleb128 0x9
	.uaword	.LASF30
	.byte	0xb
	.byte	0x34
	.uaword	0x31b
	.byte	0xc
	.uleb128 0x9
	.uaword	.LASF31
	.byte	0xb
	.byte	0x35
	.uaword	0x47a5
	.byte	0xd
	.byte	0
	.uleb128 0x3
	.string	"IfxI2c_Sda_InOut"
	.byte	0xb
	.byte	0x36
	.uaword	0x4a5f
	.uleb128 0x1e
	.uaword	0x4a0e
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.byte	0x35
	.uaword	0x4add
	.uleb128 0x7
	.string	"IfxI2c_BusStatus_idle"
	.sleb128 0
	.uleb128 0x7
	.string	"IfxI2c_BusStatus_started"
	.sleb128 1
	.uleb128 0x7
	.string	"IfxI2c_BusStatus_busyMaster"
	.sleb128 2
	.uleb128 0x7
	.string	"IfxI2c_BusStatus_remoteSlave"
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.string	"IfxI2c_BusStatus"
	.byte	0x2
	.byte	0x3a
	.uaword	0x4a64
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.byte	0x57
	.uaword	0x4c4c
	.uleb128 0x7
	.string	"IfxI2c_ProtocolInterruptSource_addressMatch"
	.sleb128 0
	.uleb128 0x7
	.string	"IfxI2c_ProtocolInterruptSource_generalCall"
	.sleb128 1
	.uleb128 0x7
	.string	"IfxI2c_ProtocolInterruptSource_masterCode"
	.sleb128 2
	.uleb128 0x7
	.string	"IfxI2c_ProtocolInterruptSource_arbitrationLost"
	.sleb128 3
	.uleb128 0x7
	.string	"IfxI2c_ProtocolInterruptSource_notAcknowledgeReceived"
	.sleb128 4
	.uleb128 0x7
	.string	"IfxI2c_ProtocolInterruptSource_transmissionEnd"
	.sleb128 5
	.uleb128 0x7
	.string	"IfxI2c_ProtocolInterruptSource_receiveMode"
	.sleb128 6
	.byte	0
	.uleb128 0x3
	.string	"IfxI2c_ProtocolInterruptSource"
	.byte	0x2
	.byte	0x5f
	.uaword	0x4af5
	.uleb128 0x8
	.byte	0xc
	.byte	0x2
	.byte	0x74
	.uaword	0x4ca5
	.uleb128 0xa
	.string	"scl"
	.byte	0x2
	.byte	0x76
	.uaword	0x4ca5
	.byte	0
	.uleb128 0xa
	.string	"sda"
	.byte	0x2
	.byte	0x77
	.uaword	0x4cab
	.byte	0x4
	.uleb128 0xa
	.string	"padDriver"
	.byte	0x2
	.byte	0x78
	.uaword	0x495f
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x49f1
	.uleb128 0x4
	.byte	0x4
	.uaword	0x4a47
	.uleb128 0x3
	.string	"IfxI2c_Pins"
	.byte	0x2
	.byte	0x79
	.uaword	0x4c72
	.uleb128 0x1f
	.byte	0x1
	.byte	0xc
	.uahalf	0x12b
	.uaword	0x4d4d
	.uleb128 0x7
	.string	"IfxI2c_I2c_Status_ok"
	.sleb128 0
	.uleb128 0x7
	.string	"IfxI2c_I2c_Status_nak"
	.sleb128 1
	.uleb128 0x7
	.string	"IfxI2c_I2c_Status_al"
	.sleb128 2
	.uleb128 0x7
	.string	"IfxI2c_I2c_Status_busNotFree"
	.sleb128 3
	.uleb128 0x7
	.string	"IfxI2c_I2c_Status_error"
	.sleb128 4
	.byte	0
	.uleb128 0xf
	.string	"IfxI2c_I2c_Status"
	.byte	0xc
	.uahalf	0x131
	.uaword	0x4cc4
	.uleb128 0x20
	.byte	0xc
	.byte	0xc
	.uahalf	0x13d
	.uaword	0x4dab
	.uleb128 0x15
	.string	"i2c"
	.byte	0xc
	.uahalf	0x13f
	.uaword	0x49eb
	.byte	0
	.uleb128 0x15
	.string	"busStatus"
	.byte	0xc
	.uahalf	0x140
	.uaword	0x4add
	.byte	0x4
	.uleb128 0x16
	.uaword	.LASF32
	.byte	0xc
	.uahalf	0x141
	.uaword	0x4d4d
	.byte	0x5
	.uleb128 0x16
	.uaword	.LASF33
	.byte	0xc
	.uahalf	0x142
	.uaword	0x226
	.byte	0x8
	.byte	0
	.uleb128 0xf
	.string	"IfxI2c_I2c"
	.byte	0xc
	.uahalf	0x143
	.uaword	0x4d67
	.uleb128 0x20
	.byte	0xc
	.byte	0xc
	.uahalf	0x147
	.uaword	0x4df0
	.uleb128 0x15
	.string	"i2c"
	.byte	0xc
	.uahalf	0x149
	.uaword	0x49eb
	.byte	0
	.uleb128 0x16
	.uaword	.LASF33
	.byte	0xc
	.uahalf	0x14a
	.uaword	0x226
	.byte	0x4
	.uleb128 0x15
	.string	"pins"
	.byte	0xc
	.uahalf	0x14b
	.uaword	0x4df0
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x4df6
	.uleb128 0x1e
	.uaword	0x4cb1
	.uleb128 0xf
	.string	"IfxI2c_I2c_Config"
	.byte	0xc
	.uahalf	0x14c
	.uaword	0x4dbe
	.uleb128 0x20
	.byte	0x8
	.byte	0xc
	.uahalf	0x150
	.uaword	0x4e39
	.uleb128 0x15
	.string	"i2c"
	.byte	0xc
	.uahalf	0x152
	.uaword	0x4e39
	.byte	0
	.uleb128 0x16
	.uaword	.LASF34
	.byte	0xc
	.uahalf	0x153
	.uaword	0x1bb
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x4dab
	.uleb128 0xf
	.string	"IfxI2c_I2c_Device"
	.byte	0xc
	.uahalf	0x154
	.uaword	0x4e15
	.uleb128 0x20
	.byte	0x8
	.byte	0xc
	.uahalf	0x158
	.uaword	0x4e7d
	.uleb128 0x15
	.string	"i2c"
	.byte	0xc
	.uahalf	0x15a
	.uaword	0x4e39
	.byte	0
	.uleb128 0x16
	.uaword	.LASF34
	.byte	0xc
	.uahalf	0x15b
	.uaword	0x1bb
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.string	"IfxI2c_I2c_deviceConfig"
	.byte	0xc
	.uahalf	0x15c
	.uaword	0x4e59
	.uleb128 0x21
	.string	"IfxCpu_areInterruptsEnabled"
	.byte	0x3
	.uahalf	0x275
	.byte	0x1
	.uaword	0x248
	.byte	0x3
	.uaword	0x4ee4
	.uleb128 0x22
	.string	"reg"
	.byte	0x3
	.uahalf	0x277
	.uaword	0x240b
	.uleb128 0x23
	.uleb128 0x22
	.string	"__res"
	.byte	0x3
	.uahalf	0x278
	.uaword	0x57d
	.byte	0
	.byte	0
	.uleb128 0x24
	.string	"__nop"
	.byte	0x4
	.uahalf	0x59a
	.byte	0x1
	.byte	0x3
	.uleb128 0x25
	.string	"IfxI2c_stop"
	.byte	0x2
	.uahalf	0x38a
	.byte	0x1
	.byte	0x3
	.uaword	0x4f13
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x38a
	.uaword	0x49eb
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_run"
	.byte	0x2
	.uahalf	0x366
	.byte	0x1
	.byte	0x3
	.uaword	0x4f35
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x366
	.uaword	0x49eb
	.byte	0
	.uleb128 0x21
	.string	"IfxI2c_getBusStatus"
	.byte	0x2
	.uahalf	0x2ef
	.byte	0x1
	.uaword	0x4add
	.byte	0x3
	.uaword	0x4f64
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x2ef
	.uaword	0x49eb
	.byte	0
	.uleb128 0x21
	.string	"IfxI2c_busIsFree"
	.byte	0x2
	.uahalf	0x239
	.byte	0x1
	.uaword	0x248
	.byte	0x3
	.uaword	0x4f9d
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x239
	.uaword	0x49eb
	.uleb128 0x22
	.string	"free"
	.byte	0x2
	.uahalf	0x23b
	.uaword	0x248
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_clearAllProtocolInterruptSources"
	.byte	0x2
	.uahalf	0x252
	.byte	0x1
	.byte	0x3
	.uaword	0x4fdc
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x252
	.uaword	0x49eb
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_clearAllErrorInterruptSources"
	.byte	0x2
	.uahalf	0x24c
	.byte	0x1
	.byte	0x3
	.uaword	0x5018
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x24c
	.uaword	0x49eb
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_setTransmitPacketSize"
	.byte	0x2
	.uahalf	0x384
	.byte	0x1
	.byte	0x3
	.uaword	0x5059
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x384
	.uaword	0x49eb
	.uleb128 0x26
	.string	"size"
	.byte	0x2
	.uahalf	0x384
	.uaword	0x291
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_setReceivePacketSize"
	.byte	0x2
	.uahalf	0x372
	.byte	0x1
	.byte	0x3
	.uaword	0x5099
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x372
	.uaword	0x49eb
	.uleb128 0x26
	.string	"size"
	.byte	0x2
	.uahalf	0x372
	.uaword	0x291
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_writeFifo"
	.byte	0x2
	.uahalf	0x397
	.byte	0x1
	.byte	0x3
	.uaword	0x50cd
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x397
	.uaword	0x49eb
	.uleb128 0x27
	.uaword	.LASF35
	.byte	0x2
	.uahalf	0x397
	.uaword	0x218
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_clearLastSingleRequestInterruptSource"
	.byte	0x2
	.uahalf	0x26a
	.byte	0x1
	.byte	0x3
	.uaword	0x5111
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x26a
	.uaword	0x49eb
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_clearSingleRequestInterruptSource"
	.byte	0x2
	.uahalf	0x276
	.byte	0x1
	.byte	0x3
	.uaword	0x5151
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x276
	.uaword	0x49eb
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_clearLastBurstRequestInterruptSource"
	.byte	0x2
	.uahalf	0x264
	.byte	0x1
	.byte	0x3
	.uaword	0x5194
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x264
	.uaword	0x49eb
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_clearBurstRequestInterruptSource"
	.byte	0x2
	.uahalf	0x258
	.byte	0x1
	.byte	0x3
	.uaword	0x51d3
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x258
	.uaword	0x49eb
	.byte	0
	.uleb128 0x21
	.string	"IfxI2c_getProtocolInterruptSourceStatus"
	.byte	0x2
	.uahalf	0x33a
	.byte	0x1
	.uaword	0x248
	.byte	0x3
	.uaword	0x5225
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x33a
	.uaword	0x49eb
	.uleb128 0x26
	.string	"source"
	.byte	0x2
	.uahalf	0x33a
	.uaword	0x4c4c
	.byte	0
	.uleb128 0x25
	.string	"IfxI2c_clearProtocolInterruptSource"
	.byte	0x2
	.uahalf	0x270
	.byte	0x1
	.byte	0x3
	.uaword	0x526f
	.uleb128 0x26
	.string	"i2c"
	.byte	0x2
	.uahalf	0x270
	.uaword	0x49eb
	.uleb128 0x26
	.string	"source"
	.byte	0x2
	.uahalf	0x270
	.uaword	0x4c4c
	.byte	0
	.uleb128 0x21
	.string	"IfxCpu_disableInterrupts"
	.byte	0x3
	.uahalf	0x27d
	.byte	0x1
	.uaword	0x248
	.byte	0x3
	.uaword	0x52a7
	.uleb128 0x22
	.string	"enabled"
	.byte	0x3
	.uahalf	0x27f
	.uaword	0x248
	.byte	0
	.uleb128 0x25
	.string	"IfxCpu_restoreInterrupts"
	.byte	0x3
	.uahalf	0x392
	.byte	0x1
	.byte	0x3
	.uaword	0x52db
	.uleb128 0x26
	.string	"enabled"
	.byte	0x3
	.uahalf	0x392
	.uaword	0x248
	.byte	0
	.uleb128 0x28
	.byte	0x1
	.string	"IfxI2c_I2c_initConfig"
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.uaword	.LFB277
	.uaword	.LFE277
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x5323
	.uleb128 0x29
	.string	"config"
	.byte	0x1
	.byte	0x22
	.uaword	0x5323
	.byte	0x1
	.byte	0x64
	.uleb128 0x29
	.string	"i2c"
	.byte	0x1
	.byte	0x22
	.uaword	0x49eb
	.byte	0x1
	.byte	0x65
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x4dfb
	.uleb128 0x28
	.byte	0x1
	.string	"IfxI2c_I2c_initDevice"
	.byte	0x1
	.byte	0x2a
	.byte	0x1
	.uaword	.LFB278
	.uaword	.LFE278
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x536e
	.uleb128 0x2a
	.uaword	.LASF36
	.byte	0x1
	.byte	0x2a
	.uaword	0x536e
	.byte	0x1
	.byte	0x64
	.uleb128 0x2a
	.uaword	.LASF37
	.byte	0x1
	.byte	0x2a
	.uaword	0x5374
	.byte	0x1
	.byte	0x65
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x4e3f
	.uleb128 0x4
	.byte	0x4
	.uaword	0x537a
	.uleb128 0x1e
	.uaword	0x4e7d
	.uleb128 0x28
	.byte	0x1
	.string	"IfxI2c_I2c_initDeviceConfig"
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.uaword	.LFB279
	.uaword	.LFE279
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x53ca
	.uleb128 0x2a
	.uaword	.LASF37
	.byte	0x1
	.byte	0x31
	.uaword	0x53ca
	.byte	0x1
	.byte	0x64
	.uleb128 0x29
	.string	"i2c"
	.byte	0x1
	.byte	0x31
	.uaword	0x4e39
	.byte	0x1
	.byte	0x65
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x4e7d
	.uleb128 0x28
	.byte	0x1
	.string	"IfxI2c_I2c_initModule"
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.uaword	.LFB280
	.uaword	.LFE280
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x54d2
	.uleb128 0x2b
	.string	"i2c"
	.byte	0x1
	.byte	0x38
	.uaword	0x4e39
	.uaword	.LLST0
	.uleb128 0x2b
	.string	"config"
	.byte	0x1
	.byte	0x38
	.uaword	0x54d2
	.uaword	.LLST1
	.uleb128 0x2c
	.string	"i2cSFR"
	.byte	0x1
	.byte	0x3a
	.uaword	0x49eb
	.byte	0x1
	.byte	0x6f
	.uleb128 0x2d
	.uaword	0x4ef0
	.uaword	.LBB168
	.uaword	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x3e
	.uaword	0x5446
	.uleb128 0x2e
	.uaword	0x4f06
	.byte	0x1
	.byte	0x6f
	.byte	0
	.uleb128 0x2f
	.uaword	0x4f13
	.uaword	.LBB172
	.uaword	.LBE172
	.byte	0x1
	.byte	0x42
	.uaword	0x5461
	.uleb128 0x2e
	.uaword	0x4f28
	.byte	0x1
	.byte	0x6f
	.byte	0
	.uleb128 0x2d
	.uaword	0x4f35
	.uaword	.LBB174
	.uaword	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0x44
	.uaword	0x547c
	.uleb128 0x2e
	.uaword	0x4f57
	.byte	0x1
	.byte	0x6f
	.byte	0
	.uleb128 0x30
	.uaword	.LVL6
	.uaword	0x6123
	.uaword	0x5490
	.uleb128 0x31
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.uaword	.LVL7
	.uaword	0x6148
	.uaword	0x54a4
	.uleb128 0x31
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.uaword	.LVL8
	.uaword	0x6172
	.uaword	0x54b8
	.uleb128 0x31
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x32
	.uaword	.LVL9
	.uaword	0x619b
	.uleb128 0x33
	.uaword	.LVL10
	.uaword	0x61cb
	.uleb128 0x31
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x54d8
	.uleb128 0x1e
	.uaword	0x4dfb
	.uleb128 0x34
	.byte	0x1
	.string	"IfxI2c_I2c_read"
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.uaword	0x4d4d
	.uaword	.LFB281
	.uaword	.LFE281
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x5b31
	.uleb128 0x35
	.uaword	.LASF36
	.byte	0x1
	.byte	0x49
	.uaword	0x536e
	.uaword	.LLST2
	.uleb128 0x2b
	.string	"data"
	.byte	0x1
	.byte	0x49
	.uaword	0x5b31
	.uaword	.LLST3
	.uleb128 0x2b
	.string	"size"
	.byte	0x1
	.byte	0x49
	.uaword	0x291
	.uaword	.LLST4
	.uleb128 0x36
	.uaword	.LASF32
	.byte	0x1
	.byte	0x4b
	.uaword	0x4d4d
	.uaword	.LLST5
	.uleb128 0x2c
	.string	"i2c"
	.byte	0x1
	.byte	0x4c
	.uaword	0x49eb
	.byte	0x1
	.byte	0x6f
	.uleb128 0x36
	.uaword	.LASF35
	.byte	0x1
	.byte	0x4d
	.uaword	0x218
	.uaword	.LLST6
	.uleb128 0x37
	.string	"slAddr"
	.byte	0x1
	.byte	0x4e
	.uaword	0x1bb
	.uaword	.LLST7
	.uleb128 0x2c
	.string	"rxData"
	.byte	0x1
	.byte	0x50
	.uaword	0x218
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x37
	.string	"bytesToReceive"
	.byte	0x1
	.byte	0x51
	.uaword	0x20a
	.uaword	.LLST8
	.uleb128 0x37
	.string	"bytePtrRxData"
	.byte	0x1
	.byte	0x52
	.uaword	0x5b3c
	.uaword	.LLST9
	.uleb128 0x37
	.string	"bytes"
	.byte	0x1
	.byte	0x53
	.uaword	0x218
	.uaword	.LLST10
	.uleb128 0x2d
	.uaword	0x4f64
	.uaword	.LBB178
	.uaword	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x56
	.uaword	0x55f0
	.uleb128 0x2e
	.uaword	0x4f83
	.byte	0x1
	.byte	0x6f
	.uleb128 0x38
	.uaword	.Ldebug_ranges0+0x30
	.uleb128 0x39
	.uaword	0x4f8f
	.uaword	.LLST11
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uaword	0x4f9d
	.uaword	.LBB182
	.uaword	.LBE182
	.byte	0x1
	.byte	0x5e
	.uaword	0x560d
	.uleb128 0x3a
	.uaword	0x4fcf
	.uaword	.LLST12
	.byte	0
	.uleb128 0x2f
	.uaword	0x4fdc
	.uaword	.LBB184
	.uaword	.LBE184
	.byte	0x1
	.byte	0x5f
	.uaword	0x562a
	.uleb128 0x3a
	.uaword	0x500b
	.uaword	.LLST13
	.byte	0
	.uleb128 0x2d
	.uaword	0x5018
	.uaword	.LBB186
	.uaword	.Ldebug_ranges0+0x48
	.byte	0x1
	.byte	0x63
	.uaword	0x5650
	.uleb128 0x3a
	.uaword	0x504b
	.uaword	.LLST14
	.uleb128 0x3a
	.uaword	0x503f
	.uaword	.LLST15
	.byte	0
	.uleb128 0x2d
	.uaword	0x5099
	.uaword	.LBB190
	.uaword	.Ldebug_ranges0+0x68
	.byte	0x1
	.byte	0x65
	.uaword	0x5676
	.uleb128 0x3a
	.uaword	0x50c0
	.uaword	.LLST16
	.uleb128 0x3a
	.uaword	0x50b4
	.uaword	.LLST17
	.byte	0
	.uleb128 0x2f
	.uaword	0x5059
	.uaword	.LBB197
	.uaword	.LBE197
	.byte	0x1
	.byte	0x64
	.uaword	0x569c
	.uleb128 0x3a
	.uaword	0x508b
	.uaword	.LLST18
	.uleb128 0x3a
	.uaword	0x507f
	.uaword	.LLST19
	.byte	0
	.uleb128 0x2f
	.uaword	0x50cd
	.uaword	.LBB200
	.uaword	.LBE200
	.byte	0x1
	.byte	0x66
	.uaword	0x56b9
	.uleb128 0x3a
	.uaword	0x5104
	.uaword	.LLST20
	.byte	0
	.uleb128 0x2f
	.uaword	0x5111
	.uaword	.LBB202
	.uaword	.LBE202
	.byte	0x1
	.byte	0x67
	.uaword	0x56d6
	.uleb128 0x3a
	.uaword	0x5144
	.uaword	.LLST21
	.byte	0
	.uleb128 0x2f
	.uaword	0x5151
	.uaword	.LBB204
	.uaword	.LBE204
	.byte	0x1
	.byte	0x68
	.uaword	0x56f3
	.uleb128 0x3a
	.uaword	0x5187
	.uaword	.LLST22
	.byte	0
	.uleb128 0x2f
	.uaword	0x5194
	.uaword	.LBB206
	.uaword	.LBE206
	.byte	0x1
	.byte	0x69
	.uaword	0x5710
	.uleb128 0x3a
	.uaword	0x51c6
	.uaword	.LLST23
	.byte	0
	.uleb128 0x3b
	.uaword	.Ldebug_ranges0+0x88
	.uaword	0x5a57
	.uleb128 0x37
	.string	"ris"
	.byte	0x1
	.byte	0xfd
	.uaword	0x218
	.uaword	.LLST24
	.uleb128 0x3c
	.uaword	0x4fdc
	.uaword	.LBB209
	.uaword	.LBE209
	.byte	0x1
	.uahalf	0x108
	.uaword	0x5746
	.uleb128 0x3a
	.uaword	0x500b
	.uaword	.LLST25
	.byte	0
	.uleb128 0x3b
	.uaword	.Ldebug_ranges0+0xc0
	.uaword	0x5907
	.uleb128 0x3d
	.uaword	.LASF38
	.byte	0x1
	.byte	0x84
	.uaword	0x248
	.uleb128 0x37
	.string	"i"
	.byte	0x1
	.byte	0x85
	.uaword	0x218
	.uaword	.LLST26
	.uleb128 0x2f
	.uaword	0x526f
	.uaword	.LBB212
	.uaword	.LBE212
	.byte	0x1
	.byte	0x84
	.uaword	0x57d1
	.uleb128 0x3e
	.uaword	.LBB213
	.uaword	.LBE213
	.uleb128 0x3f
	.uaword	0x5296
	.uleb128 0x3c
	.uaword	0x4e9d
	.uaword	.LBB214
	.uaword	.LBE214
	.byte	0x3
	.uahalf	0x280
	.uaword	0x57bf
	.uleb128 0x3e
	.uaword	.LBB215
	.uaword	.LBE215
	.uleb128 0x3f
	.uaword	0x4ec7
	.uleb128 0x3e
	.uaword	.LBB216
	.uaword	.LBE216
	.uleb128 0x39
	.uaword	0x4ed4
	.uaword	.LLST27
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x40
	.uaword	0x4ee4
	.uaword	.LBB217
	.uaword	.LBE217
	.byte	0x3
	.uahalf	0x282
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uaword	.Ldebug_ranges0+0xe8
	.uaword	0x58a5
	.uleb128 0x37
	.string	"ris"
	.byte	0x1
	.byte	0x94
	.uaword	0x218
	.uaword	.LLST28
	.uleb128 0x3b
	.uaword	.Ldebug_ranges0+0x110
	.uaword	0x5870
	.uleb128 0x37
	.string	"k"
	.byte	0x1
	.byte	0x9e
	.uaword	0x218
	.uaword	.LLST29
	.uleb128 0x2f
	.uaword	0x50cd
	.uaword	.LBB221
	.uaword	.LBE221
	.byte	0x1
	.byte	0xa5
	.uaword	0x581c
	.uleb128 0x3a
	.uaword	0x5104
	.uaword	.LLST30
	.byte	0
	.uleb128 0x2f
	.uaword	0x5111
	.uaword	.LBB223
	.uaword	.LBE223
	.byte	0x1
	.byte	0xa6
	.uaword	0x5839
	.uleb128 0x3a
	.uaword	0x5144
	.uaword	.LLST31
	.byte	0
	.uleb128 0x2f
	.uaword	0x5151
	.uaword	.LBB225
	.uaword	.LBE225
	.byte	0x1
	.byte	0xa7
	.uaword	0x5856
	.uleb128 0x3a
	.uaword	0x5187
	.uaword	.LLST32
	.byte	0
	.uleb128 0x41
	.uaword	0x5194
	.uaword	.LBB227
	.uaword	.LBE227
	.byte	0x1
	.byte	0xa8
	.uleb128 0x3a
	.uaword	0x51c6
	.uaword	.LLST33
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uaword	0x4f9d
	.uaword	.LBB231
	.uaword	.LBE231
	.byte	0x1
	.byte	0xae
	.uaword	0x588d
	.uleb128 0x3a
	.uaword	0x4fcf
	.uaword	.LLST34
	.byte	0
	.uleb128 0x41
	.uaword	0x4fdc
	.uaword	.LBB233
	.uaword	.LBE233
	.byte	0x1
	.byte	0xb5
	.uleb128 0x2e
	.uaword	0x500b
	.byte	0x1
	.byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uaword	0x52a7
	.uaword	.LBB236
	.uaword	.LBE236
	.byte	0x1
	.byte	0xbb
	.uaword	0x58be
	.uleb128 0x42
	.uaword	0x52ca
	.byte	0
	.uleb128 0x2f
	.uaword	0x51d3
	.uaword	.LBB238
	.uaword	.LBE238
	.byte	0x1
	.byte	0xbe
	.uaword	0x58e4
	.uleb128 0x3a
	.uaword	0x5215
	.uaword	.LLST35
	.uleb128 0x3a
	.uaword	0x5209
	.uaword	.LLST36
	.byte	0
	.uleb128 0x41
	.uaword	0x5225
	.uaword	.LBB240
	.uaword	.LBE240
	.byte	0x1
	.byte	0xc1
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST37
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST38
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uaword	.Ldebug_ranges0+0x130
	.uaword	0x5a3c
	.uleb128 0x37
	.string	"ris"
	.byte	0x1
	.byte	0xcc
	.uaword	0x218
	.uaword	.LLST39
	.uleb128 0x2f
	.uaword	0x51d3
	.uaword	.LBB246
	.uaword	.LBE246
	.byte	0x1
	.byte	0xc6
	.uaword	0x5945
	.uleb128 0x3a
	.uaword	0x5215
	.uaword	.LLST40
	.uleb128 0x3a
	.uaword	0x5209
	.uaword	.LLST41
	.byte	0
	.uleb128 0x2f
	.uaword	0x5225
	.uaword	.LBB248
	.uaword	.LBE248
	.byte	0x1
	.byte	0xc9
	.uaword	0x596b
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST42
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST43
	.byte	0
	.uleb128 0x2f
	.uaword	0x4f9d
	.uaword	.LBB250
	.uaword	.LBE250
	.byte	0x1
	.byte	0xd1
	.uaword	0x5988
	.uleb128 0x3a
	.uaword	0x4fcf
	.uaword	.LLST44
	.byte	0
	.uleb128 0x2f
	.uaword	0x4fdc
	.uaword	.LBB252
	.uaword	.LBE252
	.byte	0x1
	.byte	0xd7
	.uaword	0x59a5
	.uleb128 0x3a
	.uaword	0x500b
	.uaword	.LLST45
	.byte	0
	.uleb128 0x38
	.uaword	.Ldebug_ranges0+0x150
	.uleb128 0x37
	.string	"i"
	.byte	0x1
	.byte	0xde
	.uaword	0x218
	.uaword	.LLST46
	.uleb128 0x38
	.uaword	.Ldebug_ranges0+0x168
	.uleb128 0x37
	.string	"k"
	.byte	0x1
	.byte	0xed
	.uaword	0x218
	.uaword	.LLST47
	.uleb128 0x2d
	.uaword	0x50cd
	.uaword	.LBB256
	.uaword	.Ldebug_ranges0+0x180
	.byte	0x1
	.byte	0xef
	.uaword	0x59e6
	.uleb128 0x3a
	.uaword	0x5104
	.uaword	.LLST48
	.byte	0
	.uleb128 0x2d
	.uaword	0x5111
	.uaword	.LBB259
	.uaword	.Ldebug_ranges0+0x198
	.byte	0x1
	.byte	0xf0
	.uaword	0x5a03
	.uleb128 0x3a
	.uaword	0x5144
	.uaword	.LLST49
	.byte	0
	.uleb128 0x2d
	.uaword	0x5151
	.uaword	.LBB262
	.uaword	.Ldebug_ranges0+0x1b0
	.byte	0x1
	.byte	0xf1
	.uaword	0x5a20
	.uleb128 0x3a
	.uaword	0x5187
	.uaword	.LLST50
	.byte	0
	.uleb128 0x43
	.uaword	0x5194
	.uaword	.LBB265
	.uaword	.Ldebug_ranges0+0x1c8
	.byte	0x1
	.byte	0xf2
	.uleb128 0x3a
	.uaword	0x51c6
	.uaword	.LLST51
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x44
	.uaword	0x4f9d
	.uaword	.LBB274
	.uaword	.LBE274
	.byte	0x1
	.uahalf	0x102
	.uleb128 0x3a
	.uaword	0x4fcf
	.uaword	.LLST52
	.byte	0
	.byte	0
	.uleb128 0x45
	.uaword	0x4f35
	.uaword	.LBB280
	.uaword	.Ldebug_ranges0+0x1e0
	.byte	0x1
	.uahalf	0x10e
	.uaword	0x5a75
	.uleb128 0x3a
	.uaword	0x4f57
	.uaword	.LLST53
	.byte	0
	.uleb128 0x2d
	.uaword	0x4f35
	.uaword	.LBB284
	.uaword	.Ldebug_ranges0+0x1f8
	.byte	0x1
	.byte	0x59
	.uaword	0x5a92
	.uleb128 0x3a
	.uaword	0x4f57
	.uaword	.LLST54
	.byte	0
	.uleb128 0x2f
	.uaword	0x51d3
	.uaword	.LBB288
	.uaword	.LBE288
	.byte	0x1
	.byte	0x75
	.uaword	0x5ab3
	.uleb128 0x46
	.uaword	0x5215
	.byte	0x3
	.uleb128 0x2e
	.uaword	0x5209
	.byte	0x1
	.byte	0x6f
	.byte	0
	.uleb128 0x2f
	.uaword	0x5225
	.uaword	.LBB290
	.uaword	.LBE290
	.byte	0x1
	.byte	0x77
	.uaword	0x5ad9
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST55
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST56
	.byte	0
	.uleb128 0x2f
	.uaword	0x51d3
	.uaword	.LBB292
	.uaword	.LBE292
	.byte	0x1
	.byte	0x7a
	.uaword	0x5afa
	.uleb128 0x46
	.uaword	0x5215
	.byte	0x4
	.uleb128 0x2e
	.uaword	0x5209
	.byte	0x1
	.byte	0x6f
	.byte	0
	.uleb128 0x2f
	.uaword	0x5225
	.uaword	.LBB297
	.uaword	.LBE297
	.byte	0x1
	.byte	0x7c
	.uaword	0x5b20
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST57
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST58
	.byte	0
	.uleb128 0x33
	.uaword	.LVL31
	.uaword	0x61f3
	.uleb128 0x31
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x5b37
	.uleb128 0x1c
	.uaword	0x1bb
	.uleb128 0x4
	.byte	0x4
	.uaword	0x1bb
	.uleb128 0x47
	.byte	0x1
	.string	"IfxI2c_I2c_write"
	.byte	0x1
	.uahalf	0x114
	.byte	0x1
	.uaword	0x4d4d
	.uaword	.LFB282
	.uaword	.LFE282
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x60f1
	.uleb128 0x48
	.uaword	.LASF36
	.byte	0x1
	.uahalf	0x114
	.uaword	0x536e
	.uaword	.LLST59
	.uleb128 0x49
	.string	"data"
	.byte	0x1
	.uahalf	0x114
	.uaword	0x5b31
	.uaword	.LLST60
	.uleb128 0x49
	.string	"size"
	.byte	0x1
	.uahalf	0x114
	.uaword	0x291
	.uaword	.LLST61
	.uleb128 0x4a
	.uaword	.LASF32
	.byte	0x1
	.uahalf	0x116
	.uaword	0x4d4d
	.uaword	.LLST62
	.uleb128 0x4b
	.string	"i2c"
	.byte	0x1
	.uahalf	0x117
	.uaword	0x49eb
	.byte	0x1
	.byte	0x6f
	.uleb128 0x4c
	.string	"slAddr"
	.byte	0x1
	.uahalf	0x118
	.uaword	0x1bb
	.uaword	.LLST63
	.uleb128 0x4d
	.uaword	.LASF35
	.byte	0x1
	.uahalf	0x119
	.uaword	0x218
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x4c
	.string	"bytesToSend"
	.byte	0x1
	.uahalf	0x11a
	.uaword	0x20a
	.uaword	.LLST64
	.uleb128 0x4c
	.string	"bytes"
	.byte	0x1
	.uahalf	0x11b
	.uaword	0x218
	.uaword	.LLST65
	.uleb128 0x4c
	.string	"bytePtrPacket"
	.byte	0x1
	.uahalf	0x11c
	.uaword	0x5b3c
	.uaword	.LLST66
	.uleb128 0x3c
	.uaword	0x4f64
	.uaword	.LBB301
	.uaword	.LBE301
	.byte	0x1
	.uahalf	0x11e
	.uaword	0x5c51
	.uleb128 0x2e
	.uaword	0x4f83
	.byte	0x1
	.byte	0x6f
	.uleb128 0x3e
	.uaword	.LBB302
	.uaword	.LBE302
	.uleb128 0x39
	.uaword	0x4f8f
	.uaword	.LLST67
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uaword	0x4f9d
	.uaword	.LBB303
	.uaword	.LBE303
	.byte	0x1
	.uahalf	0x128
	.uaword	0x5c6f
	.uleb128 0x3a
	.uaword	0x4fcf
	.uaword	.LLST68
	.byte	0
	.uleb128 0x3c
	.uaword	0x4fdc
	.uaword	.LBB305
	.uaword	.LBE305
	.byte	0x1
	.uahalf	0x129
	.uaword	0x5c8d
	.uleb128 0x3a
	.uaword	0x500b
	.uaword	.LLST69
	.byte	0
	.uleb128 0x45
	.uaword	0x5018
	.uaword	.LBB307
	.uaword	.Ldebug_ranges0+0x210
	.byte	0x1
	.uahalf	0x12e
	.uaword	0x5cb4
	.uleb128 0x3a
	.uaword	0x504b
	.uaword	.LLST70
	.uleb128 0x3a
	.uaword	0x503f
	.uaword	.LLST71
	.byte	0
	.uleb128 0x45
	.uaword	0x5099
	.uaword	.LBB311
	.uaword	.Ldebug_ranges0+0x230
	.byte	0x1
	.uahalf	0x12f
	.uaword	0x5cdb
	.uleb128 0x3a
	.uaword	0x50c0
	.uaword	.LLST72
	.uleb128 0x3a
	.uaword	0x50b4
	.uaword	.LLST73
	.byte	0
	.uleb128 0x3c
	.uaword	0x50cd
	.uaword	.LBB319
	.uaword	.LBE319
	.byte	0x1
	.uahalf	0x130
	.uaword	0x5cf9
	.uleb128 0x3a
	.uaword	0x5104
	.uaword	.LLST74
	.byte	0
	.uleb128 0x3c
	.uaword	0x5111
	.uaword	.LBB321
	.uaword	.LBE321
	.byte	0x1
	.uahalf	0x131
	.uaword	0x5d17
	.uleb128 0x3a
	.uaword	0x5144
	.uaword	.LLST75
	.byte	0
	.uleb128 0x3c
	.uaword	0x5151
	.uaword	.LBB323
	.uaword	.LBE323
	.byte	0x1
	.uahalf	0x132
	.uaword	0x5d35
	.uleb128 0x3a
	.uaword	0x5187
	.uaword	.LLST76
	.byte	0
	.uleb128 0x3c
	.uaword	0x5194
	.uaword	.LBB325
	.uaword	.LBE325
	.byte	0x1
	.uahalf	0x133
	.uaword	0x5d53
	.uleb128 0x3a
	.uaword	0x51c6
	.uaword	.LLST77
	.byte	0
	.uleb128 0x3c
	.uaword	0x51d3
	.uaword	.LBB327
	.uaword	.LBE327
	.byte	0x1
	.uahalf	0x136
	.uaword	0x5d7a
	.uleb128 0x3a
	.uaword	0x5215
	.uaword	.LLST78
	.uleb128 0x3a
	.uaword	0x5209
	.uaword	.LLST79
	.byte	0
	.uleb128 0x3c
	.uaword	0x5225
	.uaword	.LBB329
	.uaword	.LBE329
	.byte	0x1
	.uahalf	0x139
	.uaword	0x5da1
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST80
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST81
	.byte	0
	.uleb128 0x3c
	.uaword	0x51d3
	.uaword	.LBB331
	.uaword	.LBE331
	.byte	0x1
	.uahalf	0x13c
	.uaword	0x5dc8
	.uleb128 0x3a
	.uaword	0x5215
	.uaword	.LLST82
	.uleb128 0x3a
	.uaword	0x5209
	.uaword	.LLST83
	.byte	0
	.uleb128 0x3c
	.uaword	0x51d3
	.uaword	.LBB333
	.uaword	.LBE333
	.byte	0x1
	.uahalf	0x141
	.uaword	0x5def
	.uleb128 0x3a
	.uaword	0x5215
	.uaword	.LLST84
	.uleb128 0x3a
	.uaword	0x5209
	.uaword	.LLST85
	.byte	0
	.uleb128 0x3c
	.uaword	0x5225
	.uaword	.LBB335
	.uaword	.LBE335
	.byte	0x1
	.uahalf	0x143
	.uaword	0x5e16
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST86
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST87
	.byte	0
	.uleb128 0x45
	.uaword	0x4f35
	.uaword	.LBB337
	.uaword	.Ldebug_ranges0+0x250
	.byte	0x1
	.uahalf	0x1a4
	.uaword	0x5e34
	.uleb128 0x3a
	.uaword	0x4f57
	.uaword	.LLST88
	.byte	0
	.uleb128 0x45
	.uaword	0x4f35
	.uaword	.LBB341
	.uaword	.Ldebug_ranges0+0x268
	.byte	0x1
	.uahalf	0x121
	.uaword	0x5e52
	.uleb128 0x3a
	.uaword	0x4f57
	.uaword	.LLST89
	.byte	0
	.uleb128 0x3c
	.uaword	0x5225
	.uaword	.LBB345
	.uaword	.LBE345
	.byte	0x1
	.uahalf	0x13e
	.uaword	0x5e79
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST90
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST91
	.byte	0
	.uleb128 0x4e
	.uaword	.LBB347
	.uaword	.LBE347
	.uaword	0x60e0
	.uleb128 0x4c
	.string	"i"
	.byte	0x1
	.uahalf	0x149
	.uaword	0x218
	.uaword	.LLST92
	.uleb128 0x4c
	.string	"j"
	.byte	0x1
	.uahalf	0x149
	.uaword	0x218
	.uaword	.LLST93
	.uleb128 0x4f
	.uaword	.LASF38
	.byte	0x1
	.uahalf	0x14c
	.uaword	0x248
	.uleb128 0x4c
	.string	"ris"
	.byte	0x1
	.uahalf	0x193
	.uaword	0x218
	.uaword	.LLST94
	.uleb128 0x3c
	.uaword	0x526f
	.uaword	.LBB348
	.uaword	.LBE348
	.byte	0x1
	.uahalf	0x14c
	.uaword	0x5f29
	.uleb128 0x3e
	.uaword	.LBB349
	.uaword	.LBE349
	.uleb128 0x3f
	.uaword	0x5296
	.uleb128 0x3c
	.uaword	0x4e9d
	.uaword	.LBB350
	.uaword	.LBE350
	.byte	0x3
	.uahalf	0x280
	.uaword	0x5f17
	.uleb128 0x3e
	.uaword	.LBB351
	.uaword	.LBE351
	.uleb128 0x3f
	.uaword	0x4ec7
	.uleb128 0x3e
	.uaword	.LBB352
	.uaword	.LBE352
	.uleb128 0x39
	.uaword	0x4ed4
	.uaword	.LLST95
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x40
	.uaword	0x4ee4
	.uaword	.LBB353
	.uaword	.LBE353
	.byte	0x3
	.uahalf	0x282
	.byte	0
	.byte	0
	.uleb128 0x45
	.uaword	0x5018
	.uaword	.LBB355
	.uaword	.Ldebug_ranges0+0x280
	.byte	0x1
	.uahalf	0x14d
	.uaword	0x5f4e
	.uleb128 0x3a
	.uaword	0x504b
	.uaword	.LLST96
	.uleb128 0x2e
	.uaword	0x503f
	.byte	0x1
	.byte	0x6f
	.byte	0
	.uleb128 0x3b
	.uaword	.Ldebug_ranges0+0x2a0
	.uaword	0x5fa0
	.uleb128 0x4c
	.string	"ris"
	.byte	0x1
	.uahalf	0x16e
	.uaword	0x218
	.uaword	.LLST97
	.uleb128 0x45
	.uaword	0x4f9d
	.uaword	.LBB362
	.uaword	.Ldebug_ranges0+0x2b8
	.byte	0x1
	.uahalf	0x173
	.uaword	0x5f85
	.uleb128 0x3a
	.uaword	0x4fcf
	.uaword	.LLST98
	.byte	0
	.uleb128 0x44
	.uaword	0x4fdc
	.uaword	.LBB366
	.uaword	.LBE366
	.byte	0x1
	.uahalf	0x179
	.uleb128 0x3a
	.uaword	0x500b
	.uaword	.LLST99
	.byte	0
	.byte	0
	.uleb128 0x45
	.uaword	0x5099
	.uaword	.LBB368
	.uaword	.Ldebug_ranges0+0x2d0
	.byte	0x1
	.uahalf	0x183
	.uaword	0x5fc7
	.uleb128 0x3a
	.uaword	0x50c0
	.uaword	.LLST100
	.uleb128 0x3a
	.uaword	0x50b4
	.uaword	.LLST101
	.byte	0
	.uleb128 0x3c
	.uaword	0x52a7
	.uaword	.LBB373
	.uaword	.LBE373
	.byte	0x1
	.uahalf	0x18a
	.uaword	0x5fe1
	.uleb128 0x42
	.uaword	0x52ca
	.byte	0
	.uleb128 0x3c
	.uaword	0x51d3
	.uaword	.LBB375
	.uaword	.LBE375
	.byte	0x1
	.uahalf	0x18d
	.uaword	0x6008
	.uleb128 0x3a
	.uaword	0x5215
	.uaword	.LLST102
	.uleb128 0x3a
	.uaword	0x5209
	.uaword	.LLST103
	.byte	0
	.uleb128 0x3c
	.uaword	0x5225
	.uaword	.LBB377
	.uaword	.LBE377
	.byte	0x1
	.uahalf	0x190
	.uaword	0x602f
	.uleb128 0x3a
	.uaword	0x525f
	.uaword	.LLST104
	.uleb128 0x3a
	.uaword	0x5253
	.uaword	.LLST105
	.byte	0
	.uleb128 0x3c
	.uaword	0x4f9d
	.uaword	.LBB379
	.uaword	.LBE379
	.byte	0x1
	.uahalf	0x198
	.uaword	0x604d
	.uleb128 0x3a
	.uaword	0x4fcf
	.uaword	.LLST106
	.byte	0
	.uleb128 0x3c
	.uaword	0x4fdc
	.uaword	.LBB381
	.uaword	.LBE381
	.byte	0x1
	.uahalf	0x19e
	.uaword	0x606b
	.uleb128 0x3a
	.uaword	0x500b
	.uaword	.LLST107
	.byte	0
	.uleb128 0x3c
	.uaword	0x50cd
	.uaword	.LBB385
	.uaword	.LBE385
	.byte	0x1
	.uahalf	0x184
	.uaword	0x6089
	.uleb128 0x3a
	.uaword	0x5104
	.uaword	.LLST108
	.byte	0
	.uleb128 0x3c
	.uaword	0x5111
	.uaword	.LBB387
	.uaword	.LBE387
	.byte	0x1
	.uahalf	0x185
	.uaword	0x60a7
	.uleb128 0x3a
	.uaword	0x5144
	.uaword	.LLST109
	.byte	0
	.uleb128 0x3c
	.uaword	0x5151
	.uaword	.LBB389
	.uaword	.LBE389
	.byte	0x1
	.uahalf	0x186
	.uaword	0x60c5
	.uleb128 0x3a
	.uaword	0x5187
	.uaword	.LLST110
	.byte	0
	.uleb128 0x44
	.uaword	0x5194
	.uaword	.LBB391
	.uaword	.LBE391
	.byte	0x1
	.uahalf	0x187
	.uleb128 0x3a
	.uaword	0x51c6
	.uaword	.LLST111
	.byte	0
	.byte	0
	.uleb128 0x33
	.uaword	.LVL131
	.uaword	0x61f3
	.uleb128 0x31
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uaword	0x34f
	.uaword	0x6101
	.uleb128 0x1a
	.uaword	0x22dd
	.byte	0x2
	.byte	0
	.uleb128 0x50
	.string	"IfxCpu_cfg_indexMap"
	.byte	0xd
	.byte	0x96
	.uaword	0x611e
	.byte	0x1
	.byte	0x1
	.uleb128 0x1e
	.uaword	0x60f1
	.uleb128 0x51
	.byte	0x1
	.string	"IfxI2c_enableModule"
	.byte	0x2
	.uahalf	0x1f4
	.byte	0x1
	.byte	0x1
	.uaword	0x6148
	.uleb128 0x52
	.uaword	0x49eb
	.byte	0
	.uleb128 0x51
	.byte	0x1
	.string	"IfxI2c_configureAsMaster"
	.byte	0x2
	.uahalf	0x1c8
	.byte	0x1
	.byte	0x1
	.uaword	0x6172
	.uleb128 0x52
	.uaword	0x49eb
	.byte	0
	.uleb128 0x51
	.byte	0x1
	.string	"IfxI2c_setBaudrate"
	.byte	0x2
	.uahalf	0x231
	.byte	0x1
	.byte	0x1
	.uaword	0x619b
	.uleb128 0x52
	.uaword	0x49eb
	.uleb128 0x52
	.uaword	0x226
	.byte	0
	.uleb128 0x51
	.byte	0x1
	.string	"IfxI2c_initSclSdaPin"
	.byte	0x2
	.uahalf	0x21a
	.byte	0x1
	.byte	0x1
	.uaword	0x61cb
	.uleb128 0x52
	.uaword	0x4ca5
	.uleb128 0x52
	.uaword	0x4cab
	.uleb128 0x52
	.uaword	0x495f
	.byte	0
	.uleb128 0x53
	.byte	0x1
	.string	"IfxI2c_getBaudrate"
	.byte	0x2
	.uahalf	0x20f
	.byte	0x1
	.uaword	0x226
	.byte	0x1
	.uaword	0x61f3
	.uleb128 0x52
	.uaword	0x49eb
	.byte	0
	.uleb128 0x54
	.byte	0x1
	.string	"IfxI2c_releaseBus"
	.byte	0x2
	.uahalf	0x21f
	.byte	0x1
	.byte	0x1
	.uleb128 0x52
	.uaword	0x49eb
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x6
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0xf
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x31
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x36
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
	.uleb128 0x37
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
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
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x1d
	.byte	0
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
	.uleb128 0x41
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
	.uleb128 0x42
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
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
	.uleb128 0x44
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
	.uleb128 0x45
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
	.uleb128 0x46
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x47
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
	.uleb128 0x48
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x49
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
	.uleb128 0x4a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x4b
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x4c
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x4d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x4e
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
	.uleb128 0x4f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x50
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
	.uleb128 0x51
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x52
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x53
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x54
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
.section .debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LVL3
	.uaword	.LVL5
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL5
	.uaword	.LFE280
	.uahalf	0x1
	.byte	0x6c
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LVL3
	.uaword	.LVL6-1
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL6-1
	.uaword	.LFE280
	.uahalf	0x1
	.byte	0x6d
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LVL12
	.uaword	.LVL30
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL30
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6c
	.uaword	.LVL33
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x64
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LVL12
	.uaword	.LVL31-1
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL31-1
	.uaword	.LVL33
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	.LVL33
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x65
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LVL12
	.uaword	.LVL31-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL31-1
	.uaword	.LVL33
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	.LVL33
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x54
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LVL12
	.uaword	.LVL26
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL27
	.uaword	.LVL28
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL29
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL33
	.uaword	.LVL35
	.uahalf	0x2
	.byte	0x33
	.byte	0x9f
	.uaword	.LVL35
	.uaword	.LVL37
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL37
	.uaword	.LVL38
	.uahalf	0x2
	.byte	0x32
	.byte	0x9f
	.uaword	.LVL38
	.uaword	.LVL59
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL59
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL62
	.uaword	.LVL66
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL66
	.uaword	.LVL67
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL68
	.uaword	.LVL69
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL69
	.uaword	.LVL72
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL73
	.uaword	.LVL74
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL74
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL75
	.uaword	.LVL76
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL76
	.uaword	.LVL77
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL77
	.uaword	.LVL107
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL107
	.uaword	.LVL108
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL108
	.uaword	.LVL110
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL110
	.uaword	.LFE281
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LVL17
	.uaword	.LVL22
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL22
	.uaword	.LVL23
	.uahalf	0x2
	.byte	0x82
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LVL14
	.uaword	.LVL16
	.uahalf	0x2
	.byte	0x84
	.sleb128 4
	.uaword	.LVL16
	.uaword	.LVL18
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL33
	.uaword	.LVL34
	.uahalf	0x2
	.byte	0x84
	.sleb128 4
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LVL14
	.uaword	.LVL26
	.uahalf	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.uaword	.LVL33
	.uaword	.LVL39
	.uahalf	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.uaword	.LVL39
	.uaword	.LVL43
	.uahalf	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.uaword	.LVL43
	.uaword	.LVL46
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL58
	.uaword	.LVL59
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL62
	.uaword	.LVL69
	.uahalf	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.uaword	.LVL75
	.uaword	.LVL77
	.uahalf	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.uaword	.LVL77
	.uaword	.LVL78
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL78
	.uaword	.LVL79
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL79
	.uaword	.LVL82
	.uahalf	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.uaword	.LVL82
	.uaword	.LVL95
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL96
	.uaword	.LVL97
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL97
	.uaword	.LVL105
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST9:
	.uaword	.LVL14
	.uaword	.LVL50
	.uahalf	0x3
	.byte	0x91
	.sleb128 -4
	.byte	0x9f
	.uaword	.LVL50
	.uaword	.LVL51
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL51
	.uaword	.LVL92
	.uahalf	0x3
	.byte	0x91
	.sleb128 -4
	.byte	0x9f
	.uaword	.LVL92
	.uaword	.LVL93
	.uahalf	0x1
	.byte	0x66
	.uaword	.LVL93
	.uaword	.LFE281
	.uahalf	0x3
	.byte	0x91
	.sleb128 -4
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST10:
	.uaword	.LVL44
	.uaword	.LVL46
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL78
	.uaword	.LVL79
	.uahalf	0x1
	.byte	0x56
	.uaword	.LVL83
	.uaword	.LVL90
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL90
	.uaword	.LVL91
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL97
	.uaword	.LVL103
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL103
	.uaword	.LVL104
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL104
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST11:
	.uaword	.LVL14
	.uaword	.LVL15
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL15
	.uaword	.LVL33
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL33
	.uaword	.LVL35
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST12:
	.uaword	.LVL15
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST13:
	.uaword	.LVL16
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST14:
	.uaword	.LVL17
	.uaword	.LVL33
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST15:
	.uaword	.LVL17
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST16:
	.uaword	.LVL20
	.uaword	.LVL22
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL22
	.uaword	.LVL23
	.uahalf	0x2
	.byte	0x82
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST17:
	.uaword	.LVL20
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST18:
	.uaword	.LVL19
	.uaword	.LVL31-1
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL35
	.uaword	.LVL39
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL39
	.uaword	.LVL43
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL43
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL62
	.uaword	.LVL69
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL69
	.uaword	.LVL79
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL79
	.uaword	.LVL82
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL82
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x54
	.uaword	0
	.uaword	0
.LLST19:
	.uaword	.LVL19
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST20:
	.uaword	.LVL21
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST21:
	.uaword	.LVL23
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST22:
	.uaword	.LVL24
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST23:
	.uaword	.LVL25
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL35
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST24:
	.uaword	.LVL70
	.uaword	.LVL75
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST25:
	.uaword	.LVL26
	.uaword	.LVL28
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST26:
	.uaword	.LVL42
	.uaword	.LVL43
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL43
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL77
	.uaword	.LVL79
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL105
	.uaword	.LFE281
	.uahalf	0x1
	.byte	0x55
	.uaword	0
	.uaword	0
.LLST27:
	.uaword	.LVL40
	.uaword	.LVL41
	.uahalf	0x1
	.byte	0x57
	.uaword	0
	.uaword	0
.LLST28:
	.uaword	.LVL47
	.uaword	.LVL59
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL105
	.uaword	.LVL106
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL108
	.uaword	.LVL109
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST29:
	.uaword	.LVL48
	.uaword	.LVL49
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL49
	.uaword	.LVL53
	.uahalf	0x1
	.byte	0x63
	.uaword	0
	.uaword	0
.LLST30:
	.uaword	.LVL53
	.uaword	.LVL57
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST31:
	.uaword	.LVL54
	.uaword	.LVL57
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST32:
	.uaword	.LVL55
	.uaword	.LVL57
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST33:
	.uaword	.LVL56
	.uaword	.LVL57
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST34:
	.uaword	.LVL105
	.uaword	.LVL108
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST35:
	.uaword	.LVL60
	.uaword	.LVL62
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST36:
	.uaword	.LVL60
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST37:
	.uaword	.LVL61
	.uaword	.LVL62
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST38:
	.uaword	.LVL61
	.uaword	.LVL62
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST39:
	.uaword	.LVL64
	.uaword	.LVL69
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL79
	.uaword	.LVL81
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST40:
	.uaword	.LVL62
	.uaword	.LVL69
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	.LVL79
	.uaword	.LVL105
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST41:
	.uaword	.LVL62
	.uaword	.LVL69
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL79
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST42:
	.uaword	.LVL63
	.uaword	.LVL69
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	.LVL79
	.uaword	.LVL105
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST43:
	.uaword	.LVL63
	.uaword	.LVL69
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL79
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST44:
	.uaword	.LVL65
	.uaword	.LVL67
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST45:
	.uaword	.LVL67
	.uaword	.LVL69
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST46:
	.uaword	.LVL80
	.uaword	.LVL82
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL82
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST47:
	.uaword	.LVL89
	.uaword	.LVL91
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL91
	.uaword	.LVL95
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL102
	.uaword	.LVL105
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST48:
	.uaword	.LVL85
	.uaword	.LVL90
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL98
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST49:
	.uaword	.LVL86
	.uaword	.LVL90
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL99
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST50:
	.uaword	.LVL87
	.uaword	.LVL90
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL100
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST51:
	.uaword	.LVL88
	.uaword	.LVL90
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL101
	.uaword	.LVL105
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST52:
	.uaword	.LVL71
	.uaword	.LVL74
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST53:
	.uaword	.LVL32
	.uaword	.LVL33
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST54:
	.uaword	.LVL33
	.uaword	.LVL35
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST55:
	.uaword	.LVL36
	.uaword	.LVL38
	.uahalf	0x2
	.byte	0x33
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST56:
	.uaword	.LVL36
	.uaword	.LVL38
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST57:
	.uaword	.LVL75
	.uaword	.LVL77
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST58:
	.uaword	.LVL75
	.uaword	.LVL77
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST59:
	.uaword	.LVL111
	.uaword	.LVL130
	.uahalf	0x1
	.byte	0x64
	.uaword	.LVL130
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6c
	.uaword	.LVL133
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x64
	.uaword	0
	.uaword	0
.LLST60:
	.uaword	.LVL111
	.uaword	.LVL131-1
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL131-1
	.uaword	.LVL133
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	.LVL133
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x65
	.uaword	0
	.uaword	0
.LLST61:
	.uaword	.LVL111
	.uaword	.LVL128
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL128
	.uaword	.LVL133
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	.LVL133
	.uaword	.LVL138
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL138
	.uaword	.LFE282
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST62:
	.uaword	.LVL111
	.uaword	.LVL127
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL127
	.uaword	.LVL128
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL129
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL133
	.uaword	.LVL135
	.uahalf	0x2
	.byte	0x33
	.byte	0x9f
	.uaword	.LVL135
	.uaword	.LVL136
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL136
	.uaword	.LVL137
	.uahalf	0x2
	.byte	0x32
	.byte	0x9f
	.uaword	.LVL137
	.uaword	.LVL143
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL143
	.uaword	.LVL144
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL150
	.uaword	.LVL153
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL153
	.uaword	.LVL154
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL154
	.uaword	.LVL157
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL157
	.uaword	.LVL158
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL159
	.uaword	.LVL164
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL164
	.uaword	.LVL165
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL165
	.uaword	.LVL168
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL168
	.uaword	.LVL169
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL169
	.uaword	.LVL171
	.uahalf	0x1
	.byte	0x58
	.uaword	.LVL174
	.uaword	.LVL181
	.uahalf	0x1
	.byte	0x58
	.uaword	0
	.uaword	0
.LLST63:
	.uaword	.LVL113
	.uaword	.LVL115
	.uahalf	0x2
	.byte	0x84
	.sleb128 4
	.uaword	.LVL115
	.uaword	.LVL131-1
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL133
	.uaword	.LVL134
	.uahalf	0x2
	.byte	0x84
	.sleb128 4
	.uaword	.LVL134
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x55
	.uaword	0
	.uaword	0
.LLST64:
	.uaword	.LVL113
	.uaword	.LVL128
	.uahalf	0x9
	.byte	0x74
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.uaword	.LVL133
	.uaword	.LVL138
	.uahalf	0x9
	.byte	0x74
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.uaword	.LVL138
	.uaword	.LVL143
	.uahalf	0x9
	.byte	0x74
	.sleb128 -1
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.uaword	.LVL143
	.uaword	.LVL150
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL172
	.uaword	.LVL174
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL180
	.uaword	.LVL182
	.uahalf	0x1
	.byte	0x54
	.uaword	.LVL182
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST65:
	.uaword	.LVL144
	.uaword	.LVL147
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL147
	.uaword	.LVL148
	.uahalf	0x1
	.byte	0x52
	.uaword	.LVL182
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x52
	.uaword	0
	.uaword	0
.LLST66:
	.uaword	.LVL113
	.uaword	.LVL173
	.uahalf	0x3
	.byte	0x91
	.sleb128 -4
	.byte	0x9f
	.uaword	.LVL173
	.uaword	.LVL174
	.uahalf	0x1
	.byte	0x67
	.uaword	.LVL174
	.uaword	.LFE282
	.uahalf	0x3
	.byte	0x91
	.sleb128 -4
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST67:
	.uaword	.LVL113
	.uaword	.LVL114
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL114
	.uaword	.LVL133
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL133
	.uaword	.LVL135
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST68:
	.uaword	.LVL114
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST69:
	.uaword	.LVL115
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST70:
	.uaword	.LVL116
	.uaword	.LVL133
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x31
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST71:
	.uaword	.LVL116
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST72:
	.uaword	.LVL117
	.uaword	.LVL131-1
	.uahalf	0x1
	.byte	0x55
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x55
	.uaword	0
	.uaword	0
.LLST73:
	.uaword	.LVL117
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST74:
	.uaword	.LVL118
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST75:
	.uaword	.LVL119
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST76:
	.uaword	.LVL120
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST77:
	.uaword	.LVL121
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST78:
	.uaword	.LVL122
	.uaword	.LVL133
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST79:
	.uaword	.LVL122
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST80:
	.uaword	.LVL123
	.uaword	.LVL133
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST81:
	.uaword	.LVL123
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST82:
	.uaword	.LVL124
	.uaword	.LVL133
	.uahalf	0x2
	.byte	0x33
	.byte	0x9f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x33
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST83:
	.uaword	.LVL124
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL135
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST84:
	.uaword	.LVL125
	.uaword	.LVL128
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	.LVL137
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST85:
	.uaword	.LVL125
	.uaword	.LVL128
	.uahalf	0x1
	.byte	0x6f
	.uaword	.LVL137
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST86:
	.uaword	.LVL126
	.uaword	.LVL128
	.uahalf	0x2
	.byte	0x34
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST87:
	.uaword	.LVL126
	.uaword	.LVL128
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST88:
	.uaword	.LVL132
	.uaword	.LVL133
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST89:
	.uaword	.LVL133
	.uaword	.LVL135
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST90:
	.uaword	.LVL135
	.uaword	.LVL137
	.uahalf	0x2
	.byte	0x33
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST91:
	.uaword	.LVL135
	.uaword	.LVL137
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST92:
	.uaword	.LVL142
	.uaword	.LVL143
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL143
	.uaword	.LVL176
	.uahalf	0x1
	.byte	0x53
	.uaword	.LVL176
	.uaword	.LVL180
	.uahalf	0x3
	.byte	0x73
	.sleb128 -4
	.byte	0x9f
	.uaword	.LVL180
	.uaword	.LFE282
	.uahalf	0x1
	.byte	0x53
	.uaword	0
	.uaword	0
.LLST93:
	.uaword	.LVL138
	.uaword	.LVL144
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL146
	.uaword	.LVL148
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	.LVL148
	.uaword	.LVL150
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL172
	.uaword	.LVL174
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL182
	.uaword	.LFE282
	.uahalf	0x2
	.byte	0x30
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST94:
	.uaword	.LVL162
	.uaword	.LVL167
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST95:
	.uaword	.LVL139
	.uaword	.LVL140
	.uahalf	0x1
	.byte	0x5a
	.uaword	0
	.uaword	0
.LLST96:
	.uaword	.LVL141
	.uaword	.LVL144
	.uahalf	0x3
	.byte	0x74
	.sleb128 0
	.byte	0x9f
	.uaword	.LVL144
	.uaword	.LFE282
	.uahalf	0x3
	.byte	0x71
	.sleb128 0
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST97:
	.uaword	.LVL151
	.uaword	.LVL156
	.uahalf	0x1
	.byte	0x5f
	.uaword	.LVL169
	.uaword	.LVL170
	.uahalf	0x1
	.byte	0x5f
	.uaword	0
	.uaword	0
.LLST98:
	.uaword	.LVL152
	.uaword	.LVL154
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST99:
	.uaword	.LVL155
	.uaword	.LVL158
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST100:
	.uaword	.LVL175
	.uaword	.LVL178
	.uahalf	0x2
	.byte	0x91
	.sleb128 -4
	.uaword	0
	.uaword	0
.LLST101:
	.uaword	.LVL175
	.uaword	.LVL181
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST102:
	.uaword	.LVL160
	.uaword	.LVL169
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST103:
	.uaword	.LVL160
	.uaword	.LVL169
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST104:
	.uaword	.LVL161
	.uaword	.LVL169
	.uahalf	0x2
	.byte	0x35
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST105:
	.uaword	.LVL161
	.uaword	.LVL169
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST106:
	.uaword	.LVL163
	.uaword	.LVL165
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST107:
	.uaword	.LVL166
	.uaword	.LVL169
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST108:
	.uaword	.LVL177
	.uaword	.LVL181
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST109:
	.uaword	.LVL178
	.uaword	.LVL181
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST110:
	.uaword	.LVL179
	.uaword	.LVL181
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.LLST111:
	.uaword	.LVL180
	.uaword	.LVL181
	.uahalf	0x1
	.byte	0x6f
	.uaword	0
	.uaword	0
.section .debug_aranges,"",@progbits
	.uaword	0x44
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.LFB277
	.uaword	.LFE277-.LFB277
	.uaword	.LFB278
	.uaword	.LFE278-.LFB278
	.uaword	.LFB279
	.uaword	.LFE279-.LFB279
	.uaword	.LFB280
	.uaword	.LFE280-.LFB280
	.uaword	.LFB281
	.uaword	.LFE281-.LFB281
	.uaword	.LFB282
	.uaword	.LFE282-.LFB282
	.uaword	0
	.uaword	0
.section .debug_ranges,"",@progbits
.Ldebug_ranges0:
	.uaword	.LBB168
	.uaword	.LBE168
	.uaword	.LBB171
	.uaword	.LBE171
	.uaword	0
	.uaword	0
	.uaword	.LBB174
	.uaword	.LBE174
	.uaword	.LBB177
	.uaword	.LBE177
	.uaword	0
	.uaword	0
	.uaword	.LBB178
	.uaword	.LBE178
	.uaword	.LBB181
	.uaword	.LBE181
	.uaword	0
	.uaword	0
	.uaword	.LBB186
	.uaword	.LBE186
	.uaword	.LBB194
	.uaword	.LBE194
	.uaword	.LBB196
	.uaword	.LBE196
	.uaword	0
	.uaword	0
	.uaword	.LBB190
	.uaword	.LBE190
	.uaword	.LBB195
	.uaword	.LBE195
	.uaword	.LBB199
	.uaword	.LBE199
	.uaword	0
	.uaword	0
	.uaword	.LBB208
	.uaword	.LBE208
	.uaword	.LBB294
	.uaword	.LBE294
	.uaword	.LBB295
	.uaword	.LBE295
	.uaword	.LBB296
	.uaword	.LBE296
	.uaword	.LBB299
	.uaword	.LBE299
	.uaword	.LBB300
	.uaword	.LBE300
	.uaword	0
	.uaword	0
	.uaword	.LBB211
	.uaword	.LBE211
	.uaword	.LBB244
	.uaword	.LBE244
	.uaword	.LBB276
	.uaword	.LBE276
	.uaword	.LBB279
	.uaword	.LBE279
	.uaword	0
	.uaword	0
	.uaword	.LBB219
	.uaword	.LBE219
	.uaword	.LBB235
	.uaword	.LBE235
	.uaword	.LBB242
	.uaword	.LBE242
	.uaword	.LBB243
	.uaword	.LBE243
	.uaword	0
	.uaword	0
	.uaword	.LBB220
	.uaword	.LBE220
	.uaword	.LBB229
	.uaword	.LBE229
	.uaword	.LBB230
	.uaword	.LBE230
	.uaword	0
	.uaword	0
	.uaword	.LBB245
	.uaword	.LBE245
	.uaword	.LBB277
	.uaword	.LBE277
	.uaword	.LBB278
	.uaword	.LBE278
	.uaword	0
	.uaword	0
	.uaword	.LBB254
	.uaword	.LBE254
	.uaword	.LBB273
	.uaword	.LBE273
	.uaword	0
	.uaword	0
	.uaword	.LBB255
	.uaword	.LBE255
	.uaword	.LBB272
	.uaword	.LBE272
	.uaword	0
	.uaword	0
	.uaword	.LBB256
	.uaword	.LBE256
	.uaword	.LBB268
	.uaword	.LBE268
	.uaword	0
	.uaword	0
	.uaword	.LBB259
	.uaword	.LBE259
	.uaword	.LBB269
	.uaword	.LBE269
	.uaword	0
	.uaword	0
	.uaword	.LBB262
	.uaword	.LBE262
	.uaword	.LBB270
	.uaword	.LBE270
	.uaword	0
	.uaword	0
	.uaword	.LBB265
	.uaword	.LBE265
	.uaword	.LBB271
	.uaword	.LBE271
	.uaword	0
	.uaword	0
	.uaword	.LBB280
	.uaword	.LBE280
	.uaword	.LBB283
	.uaword	.LBE283
	.uaword	0
	.uaword	0
	.uaword	.LBB284
	.uaword	.LBE284
	.uaword	.LBB287
	.uaword	.LBE287
	.uaword	0
	.uaword	0
	.uaword	.LBB307
	.uaword	.LBE307
	.uaword	.LBB315
	.uaword	.LBE315
	.uaword	.LBB317
	.uaword	.LBE317
	.uaword	0
	.uaword	0
	.uaword	.LBB311
	.uaword	.LBE311
	.uaword	.LBB316
	.uaword	.LBE316
	.uaword	.LBB318
	.uaword	.LBE318
	.uaword	0
	.uaword	0
	.uaword	.LBB337
	.uaword	.LBE337
	.uaword	.LBB340
	.uaword	.LBE340
	.uaword	0
	.uaword	0
	.uaword	.LBB341
	.uaword	.LBE341
	.uaword	.LBB344
	.uaword	.LBE344
	.uaword	0
	.uaword	0
	.uaword	.LBB355
	.uaword	.LBE355
	.uaword	.LBB359
	.uaword	.LBE359
	.uaword	.LBB360
	.uaword	.LBE360
	.uaword	0
	.uaword	0
	.uaword	.LBB361
	.uaword	.LBE361
	.uaword	.LBB372
	.uaword	.LBE372
	.uaword	0
	.uaword	0
	.uaword	.LBB362
	.uaword	.LBE362
	.uaword	.LBB365
	.uaword	.LBE365
	.uaword	0
	.uaword	0
	.uaword	.LBB368
	.uaword	.LBE368
	.uaword	.LBB383
	.uaword	.LBE383
	.uaword	.LBB384
	.uaword	.LBE384
	.uaword	0
	.uaword	0
	.uaword	.LFB277
	.uaword	.LFE277
	.uaword	.LFB278
	.uaword	.LFE278
	.uaword	.LFB279
	.uaword	.LFE279
	.uaword	.LFB280
	.uaword	.LFE280
	.uaword	.LFB281
	.uaword	.LFE281
	.uaword	.LFB282
	.uaword	.LFE282
	.uaword	0
	.uaword	0
.section .debug_line,"",@progbits
.Ldebug_line0:
.section .debug_str,"",@progbits
.LASF19:
	.string	"MODNUMBER"
.LASF27:
	.string	"reserved_8"
.LASF16:
	.string	"SREQ_INT"
.LASF33:
	.string	"baudrate"
.LASF35:
	.string	"packet"
.LASF30:
	.string	"inSelect"
.LASF37:
	.string	"i2cDeviceConfig"
.LASF7:
	.string	"RXF_UFL"
.LASF9:
	.string	"TXF_UFL"
.LASF34:
	.string	"deviceAddress"
.LASF8:
	.string	"RXF_OFL"
.LASF2:
	.string	"reserved_10"
.LASF12:
	.string	"reserved_11"
.LASF25:
	.string	"reserved_12"
.LASF14:
	.string	"reserved_14"
.LASF5:
	.string	"reserved_16"
.LASF10:
	.string	"TXF_OFL"
.LASF20:
	.string	"I2C_ERR_INT"
.LASF28:
	.string	"reserved_20"
.LASF13:
	.string	"reserved_24"
.LASF29:
	.string	"reserved_28"
.LASF1:
	.string	"reserved_0"
.LASF22:
	.string	"reserved_1"
.LASF6:
	.string	"reserved_2"
.LASF3:
	.string	"reserved_3"
.LASF11:
	.string	"reserved_4"
.LASF4:
	.string	"reserved_6"
.LASF24:
	.string	"reserved_7"
.LASF38:
	.string	"intEnabled"
.LASF26:
	.string	"reserved_C"
.LASF15:
	.string	"LSREQ_INT"
.LASF0:
	.string	"module"
.LASF36:
	.string	"i2cDevice"
.LASF17:
	.string	"LBREQ_INT"
.LASF18:
	.string	"BREQ_INT"
.LASF21:
	.string	"I2C_P_INT"
.LASF32:
	.string	"status"
.LASF23:
	.string	"TX_END"
.LASF31:
	.string	"outSelect"
	.extern	IfxI2c_releaseBus,STT_FUNC,0
	.extern	IfxI2c_getBaudrate,STT_FUNC,0
	.extern	IfxI2c_initSclSdaPin,STT_FUNC,0
	.extern	IfxI2c_setBaudrate,STT_FUNC,0
	.extern	IfxI2c_configureAsMaster,STT_FUNC,0
	.extern	IfxI2c_enableModule,STT_FUNC,0
	.ident	"GCC: (HighTec Release HDP-v4.9.3.0-infineon-1.0-fb21a99) 4.9.4 build on 2019-06-07"
