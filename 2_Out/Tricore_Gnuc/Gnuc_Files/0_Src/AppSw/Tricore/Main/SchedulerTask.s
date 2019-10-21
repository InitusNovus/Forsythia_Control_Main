	.file	"SchedulerTask.c"
.section .text,"ax",@progbits
.Ltext0:
.section .text.Task_startButtonRoutine,"ax",@progbits
	.align 1
	.type	Task_startButtonRoutine, @function
Task_startButtonRoutine:
.LFB568:
	.file 1 "0_Src/AppSw/Tricore/Main/SchedulerTask.c"
	.loc 1 96 0
	ret
.LFE568:
	.size	Task_startButtonRoutine, .-Task_startButtonRoutine
.section .text.Task_init,"ax",@progbits
	.align 1
	.global	Task_init
	.type	Task_init, @function
Task_init:
.LFB569:
	.loc 1 134 0
	.loc 1 137 0
	call	HLD_GtmTom_init
.LVL0:
	.loc 1 138 0
	call	HLD_GtmTim_init
.LVL1:
	.loc 1 139 0
	call	HLD_Qspi_init
.LVL2:
	.loc 1 140 0
	call	HLD_Multican_init
.LVL3:
	.loc 1 144 0
	call	HLD_Imu_init
.LVL4:
	.loc 1 148 0
	movh.a	%a4, hi:Task_startButtonRoutine
	lea	%a4, [%a4] lo:Task_startButtonRoutine
	call	HLD_UserInterface_init
.LVL5:
	.loc 1 152 0
	call	SDP_PedalBox_init
.LVL6:
	.loc 1 153 0
	call	SDP_SteeringAngle_init
.LVL7:
	.loc 1 154 0
	call	SDP_WheelSpeed_init
.LVL8:
	movh.a	%a15, hi:Task_core1
	lea	%a15, [%a15] lo:Task_core1
.L3:
	.loc 1 158 0 discriminator 1
	mov.aa	%a4, %a15
	call	IfxCpu_acquireMutex
.LVL9:
	jnz	%d2, .L3
	.loc 1 161 0
	mov.aa	%a4, %a15
	.loc 1 160 0
	mov	%d15, 1
	st.b	[%a15] 4, %d15
	.loc 1 161 0
	call	IfxCpu_releaseMutex
.LVL10:
	.loc 1 163 0
	movh.a	%a4, hi:Beep_pattern4
	lea	%a4, [%a4] lo:Beep_pattern4
	j	HLD_GtmTomBeeper_start
.LVL11:
.LFE569:
	.size	Task_init, .-Task_init
.section .text.Task_1ms,"ax",@progbits
	.align 1
	.global	Task_1ms
	.type	Task_1ms, @function
Task_1ms:
.LFB570:
	.loc 1 176 0
	ret
.LFE570:
	.size	Task_1ms, .-Task_1ms
	.global	__floatundisf
	.global	__fixunssfdi
.section .text.Task_IsrCb_1ms,"ax",@progbits
	.align 1
	.global	Task_IsrCb_1ms
	.type	Task_IsrCb_1ms, @function
Task_IsrCb_1ms:
.LFB571:
	.loc 1 184 0
.LVL12:
.LBB52:
.LBB53:
	.file 2 "0_Src/BaseSw/iLLD/TC27D/Tricore/Stm/Std/IfxStm.h"
	.loc 2 530 0
	ld.w	%d15, 0xf0000010
.LBE53:
.LBE52:
	.loc 1 185 0
	movh.a	%a15, hi:stm_buf_1ms
.LBB56:
.LBB54:
	.loc 2 530 0
	mul.u	%e2, %d15, 1
	.loc 2 531 0
	ld.w	%d2, 0xf000002c
.LVL13:
.LBE54:
.LBE56:
	.loc 1 185 0
	lea	%a12, [%a15] lo:stm_buf_1ms
.LBB57:
.LBB55:
	.loc 2 531 0
	st.w	[%a15] lo:stm_buf_1ms, %d15
	or	%d15, %d2, %d3
	movh.a	%a15, hi:Task_core1
	st.w	[%a12] 4, %d15
	lea	%a15, [%a15] lo:Task_core1
.LVL14:
.L8:
.LBE55:
.LBE57:
	.loc 1 187 0 discriminator 1
	mov.aa	%a4, %a15
	call	IfxCpu_acquireMutex
.LVL15:
	jnz	%d2, .L8
	.loc 1 189 0
	ld.bu	%d15, [%a15] 4
	.loc 1 190 0
	mov.aa	%a4, %a15
	.loc 1 189 0
	ne	%d15, %d15, 0
	st.b	[%a15] 5, %d15
	.loc 1 190 0
	call	IfxCpu_releaseMutex
.LVL16:
	.loc 1 194 0
	call	HLD_GtmTim_run_1ms
.LVL17:
	.loc 1 197 0
	call	SDP_PedalBox_run_1ms
.LVL18:
	.loc 1 198 0
	call	SDP_SteeringAngle_run_1ms
.LVL19:
	.loc 1 199 0
	call	SDP_WheelSpeed_run_1ms
.LVL20:
	.loc 1 201 0
	call	HLD_GtmTomBeeper_run_1ms
.LVL21:
.LBB58:
.LBB59:
	.loc 2 530 0
	ld.w	%d15, 0xf0000010
.LBE59:
.LBE58:
.LBB61:
.LBB62:
.LBB63:
.LBB64:
	.file 3 "0_Src/BaseSw/iLLD/TC27D/Tricore/Scu/Std/IfxScuCcu.h"
	.loc 3 1105 0
	movh.a	%a15, 61443
.LBE64:
.LBE63:
.LBE62:
.LBE61:
.LBB77:
.LBB60:
	.loc 2 530 0
	mul.u	%e4, %d15, 1
	.loc 2 531 0
	ld.w	%d4, 0xf000002c
.LVL22:
	or	%d2, %d15, 0
	or	%d3, %d4, %d5
.LBE60:
.LBE77:
	.loc 1 203 0
	ld.d	%e4, [%a12]0
.LVL23:
	movh	%d15, 15
	subx	%d2, %d2, %d4
	addi	%d15, %d15, 16960
	subc	%d3, %d3, %d5
	mul.u	%e4, %d2, %d15
	madd	%d5, %d5, %d3, %d15
.LBB78:
.LBB73:
.LBB69:
.LBB65:
	.loc 3 1105 0
	lea	%a15, [%a15] 24628
.LBE65:
.LBE69:
.LBE73:
.LBE78:
	.loc 1 203 0
	call	__floatundisf
.LVL24:
	mov	%d15, %d2
.LVL25:
.LBB79:
.LBB74:
.LBB70:
.LBB66:
	.loc 3 1105 0
	call	IfxScuCcu_getSourceFrequency
.LVL26:
	ld.w	%d3, [%a15]0
.LBE66:
.LBE70:
.LBE74:
.LBE79:
	.loc 1 203 0
	movh.a	%a15, hi:ticToc_1ms
.LBB80:
.LBB75:
.LBB71:
.LBB67:
	.loc 3 1105 0
	extr.u	%d3, %d3, 8, 4
.LBE67:
.LBE71:
.LBE75:
.LBE80:
	.loc 1 203 0
	lea	%a15, [%a15] lo:ticToc_1ms
.LBB81:
.LBB76:
.LBB72:
.LBB68:
	.loc 3 1105 0
	itof	%d3, %d3
	div.f	%d2, %d2, %d3
.LBE68:
.LBE72:
.LBE76:
.LBE81:
	.loc 1 203 0
	div.f	%d4, %d15, %d2
	call	__fixunssfdi
.LVL27:
	st.d	[%a15]0, %e2
	ret
.LFE571:
	.size	Task_IsrCb_1ms, .-Task_IsrCb_1ms
.section .text.Task_10ms,"ax",@progbits
	.align 1
	.global	Task_10ms
	.type	Task_10ms, @function
Task_10ms:
.LFB572:
	.loc 1 209 0
.LVL28:
.LBB82:
.LBB83:
	.loc 2 530 0
	ld.w	%d15, 0xf0000010
.LBE83:
.LBE82:
	.loc 1 210 0
	movh.a	%a15, hi:stm_buf
.LBB88:
.LBB84:
	.loc 2 530 0
	mul.u	%e2, %d15, 1
	.loc 2 531 0
	ld.w	%d2, 0xf000002c
.LVL29:
.LBE84:
.LBE88:
	.loc 1 210 0
	lea	%a12, [%a15] lo:stm_buf
.LBB89:
.LBB85:
	.loc 2 531 0
	st.w	[%a15] lo:stm_buf, %d15
.LBE85:
.LBE89:
.LBB90:
.LBB91:
	.loc 1 289 0
	movh.a	%a15, hi:Task
.LBE91:
.LBE90:
.LBB94:
.LBB86:
	.loc 2 531 0
	or	%d15, %d2, %d3
.LBE86:
.LBE94:
.LBB95:
.LBB92:
	.loc 1 289 0
	lea	%a15, [%a15] lo:Task
.LBE92:
.LBE95:
.LBB96:
.LBB87:
	.loc 2 531 0
	st.w	[%a12] 4, %d15
.LBE87:
.LBE96:
.LBB97:
.LBB93:
	.loc 1 289 0
	ld.h	%d15, [%a15] 2
	.loc 1 290 0
	mov	%d2, 1000
.LVL30:
	.loc 1 289 0
	add	%d15, 1
	extr	%d15, %d15, 0, 16
	.loc 1 290 0
	jne	%d15, %d2, .L13
	.loc 1 292 0
	mov	%d15, 0
.L13:
	st.h	[%a15] 2, %d15
.LBE93:
.LBE97:
	.loc 1 213 0
	call	HLD_UserInterface_run_10ms
.LVL31:
.LBB98:
.LBB99:
	.loc 2 530 0
	ld.w	%d15, 0xf0000010
.LBE99:
.LBE98:
.LBB101:
.LBB102:
.LBB103:
.LBB104:
	.loc 3 1105 0
	movh.a	%a15, 61443
.LBE104:
.LBE103:
.LBE102:
.LBE101:
.LBB117:
.LBB100:
	.loc 2 530 0
	mul.u	%e4, %d15, 1
	.loc 2 531 0
	ld.w	%d4, 0xf000002c
.LVL32:
	or	%d2, %d15, 0
	or	%d3, %d4, %d5
.LBE100:
.LBE117:
	.loc 1 215 0
	ld.d	%e4, [%a12]0
.LVL33:
	movh	%d15, 15
	subx	%d2, %d2, %d4
	addi	%d15, %d15, 16960
	subc	%d3, %d3, %d5
	mul.u	%e4, %d2, %d15
	madd	%d5, %d5, %d3, %d15
.LBB118:
.LBB113:
.LBB109:
.LBB105:
	.loc 3 1105 0
	lea	%a15, [%a15] 24628
.LBE105:
.LBE109:
.LBE113:
.LBE118:
	.loc 1 215 0
	call	__floatundisf
.LVL34:
	mov	%d15, %d2
.LVL35:
.LBB119:
.LBB114:
.LBB110:
.LBB106:
	.loc 3 1105 0
	call	IfxScuCcu_getSourceFrequency
.LVL36:
	ld.w	%d3, [%a15]0
.LBE106:
.LBE110:
.LBE114:
.LBE119:
	.loc 1 215 0
	movh.a	%a15, hi:ticToc_10ms_s0
.LBB120:
.LBB115:
.LBB111:
.LBB107:
	.loc 3 1105 0
	extr.u	%d3, %d3, 8, 4
.LBE107:
.LBE111:
.LBE115:
.LBE120:
	.loc 1 215 0
	lea	%a15, [%a15] lo:ticToc_10ms_s0
.LBB121:
.LBB116:
.LBB112:
.LBB108:
	.loc 3 1105 0
	itof	%d3, %d3
	div.f	%d2, %d2, %d3
.LBE108:
.LBE112:
.LBE116:
.LBE121:
	.loc 1 215 0
	div.f	%d4, %d15, %d2
	call	__fixunssfdi
.LVL37:
	st.d	[%a15]0, %e2
	ret
.LFE572:
	.size	Task_10ms, .-Task_10ms
.section .text.Task_10ms_slot1,"ax",@progbits
	.align 1
	.global	Task_10ms_slot1
	.type	Task_10ms_slot1, @function
Task_10ms_slot1:
.LFB573:
	.loc 1 218 0
.LVL38:
.LBB122:
.LBB123:
	.loc 2 530 0
	lea	%a15, -268435456
	ld.w	%d15, [%a15] 16
.LBE123:
.LBE122:
	.loc 1 219 0
	movh.a	%a2, hi:stm_buf
.LBB126:
.LBB124:
	.loc 2 530 0
	mul.u	%e2, %d15, 1
	.loc 2 531 0
	ld.w	%d2, [%a15] 44
.LBE124:
.LBE126:
	.loc 1 219 0
	lea	%a2, [%a2] lo:stm_buf
.LBB127:
.LBB125:
	.loc 2 531 0
	or	%d9, %d2, %d3
	or	%d8, %d15, 0
.LVL39:
.LBE125:
.LBE127:
	.loc 1 219 0
	st.d	[%a2]0, %e8
.LVL40:
.LBB128:
.LBB129:
	.loc 2 530 0
	ld.w	%d15, [%a15] 16
	.loc 2 531 0
	ld.w	%d13, [%a15] 44
.LBE129:
.LBE128:
.LBB132:
.LBB133:
.LBB134:
.LBB135:
	.loc 3 1105 0
	call	IfxScuCcu_getSourceFrequency
.LVL41:
.LBE135:
.LBE134:
.LBE133:
.LBE132:
.LBB154:
.LBB130:
	.loc 2 530 0
	mul.u	%e10, %d15, 1
.LVL42:
	.loc 2 531 0
	or	%d4, %d15, 0
.LBE130:
.LBE154:
.LBB155:
.LBB148:
.LBB142:
.LBB136:
	.loc 3 1105 0
	movh.a	%a15, 61443
.LBE136:
.LBE142:
.LBE148:
.LBE155:
	.loc 1 223 0
	movh	%d15, 15
	addi	%d15, %d15, 16960
.LBB156:
.LBB149:
.LBB143:
.LBB137:
	.loc 3 1105 0
	lea	%a15, [%a15] 24628
.LBE137:
.LBE143:
.LBE149:
.LBE156:
.LBB157:
.LBB131:
	.loc 2 531 0
	or	%d5, %d13, %d11
.LBE131:
.LBE157:
	.loc 1 223 0
	subx	%d8, %d4, %d8
.LVL43:
	subc	%d9, %d5, %d9
.LBB158:
.LBB150:
.LBB144:
.LBB138:
	.loc 3 1105 0
	ld.w	%d12, [%a15]0
.LBE138:
.LBE144:
.LBE150:
.LBE158:
	.loc 1 223 0
	mul.u	%e4, %d8, %d15
	madd	%d5, %d5, %d9, %d15
.LBB159:
.LBB151:
.LBB145:
.LBB139:
	.loc 3 1105 0
	extr.u	%d12, %d12, 8, 4
	mov	%d10, %d2
.LBE139:
.LBE145:
.LBE151:
.LBE159:
	.loc 1 223 0
	call	__floatundisf
.LVL44:
.LBB160:
.LBB152:
.LBB146:
.LBB140:
	.loc 3 1105 0
	itof	%d15, %d12
.LBE140:
.LBE146:
.LBE152:
.LBE160:
	.loc 1 223 0
	movh.a	%a15, hi:ticToc_10ms_s1
.LBB161:
.LBB153:
.LBB147:
.LBB141:
	.loc 3 1105 0
	div.f	%d4, %d10, %d15
.LBE141:
.LBE147:
.LBE153:
.LBE161:
	.loc 1 223 0
	lea	%a15, [%a15] lo:ticToc_10ms_s1
	div.f	%d4, %d2, %d4
	call	__fixunssfdi
.LVL45:
	st.d	[%a15]0, %e2
	ret
.LFE573:
	.size	Task_10ms_slot1, .-Task_10ms_slot1
.section .text.Task_100ms,"ax",@progbits
	.align 1
	.global	Task_100ms
	.type	Task_100ms, @function
Task_100ms:
.LFB574:
	.loc 1 229 0
.LBB162:
.LBB163:
	.loc 1 297 0
	movh.a	%a15, hi:Task
	lea	%a15, [%a15] lo:Task
	ld.h	%d15, [%a15] 4
	.loc 1 298 0
	mov	%d2, 1000
	.loc 1 297 0
	add	%d15, 1
	extr	%d15, %d15, 0, 16
	.loc 1 298 0
	jne	%d15, %d2, .L18
	.loc 1 300 0
	mov	%d15, 0
.L18:
	st.h	[%a15] 4, %d15
	ret
.LBE163:
.LBE162:
.LFE574:
	.size	Task_100ms, .-Task_100ms
.section .text.Task_100ms_slot4,"ax",@progbits
	.align 1
	.global	Task_100ms_slot4
	.type	Task_100ms_slot4, @function
Task_100ms_slot4:
.LFB575:
	.loc 1 237 0
.LVL46:
.LBB164:
.LBB165:
	.loc 2 530 0
	lea	%a15, -268435456
	ld.w	%d15, [%a15] 16
.LBE165:
.LBE164:
	.loc 1 238 0
	movh.a	%a2, hi:stm_buf
.LBB168:
.LBB166:
	.loc 2 530 0
	mul.u	%e2, %d15, 1
	.loc 2 531 0
	ld.w	%d2, [%a15] 44
.LBE166:
.LBE168:
	.loc 1 238 0
	lea	%a2, [%a2] lo:stm_buf
.LBB169:
.LBB167:
	.loc 2 531 0
	or	%d9, %d2, %d3
	or	%d8, %d15, 0
.LVL47:
.LBE167:
.LBE169:
	.loc 1 238 0
	st.d	[%a2]0, %e8
.LVL48:
.LBB170:
.LBB171:
	.loc 2 530 0
	ld.w	%d15, [%a15] 16
	.loc 2 531 0
	ld.w	%d13, [%a15] 44
.LBE171:
.LBE170:
.LBB174:
.LBB175:
.LBB176:
.LBB177:
	.loc 3 1105 0
	call	IfxScuCcu_getSourceFrequency
.LVL49:
.LBE177:
.LBE176:
.LBE175:
.LBE174:
.LBB196:
.LBB172:
	.loc 2 530 0
	mul.u	%e10, %d15, 1
.LVL50:
	.loc 2 531 0
	or	%d4, %d15, 0
.LBE172:
.LBE196:
.LBB197:
.LBB190:
.LBB184:
.LBB178:
	.loc 3 1105 0
	movh.a	%a15, 61443
.LBE178:
.LBE184:
.LBE190:
.LBE197:
	.loc 1 240 0
	movh	%d15, 15
	addi	%d15, %d15, 16960
.LBB198:
.LBB191:
.LBB185:
.LBB179:
	.loc 3 1105 0
	lea	%a15, [%a15] 24628
.LBE179:
.LBE185:
.LBE191:
.LBE198:
.LBB199:
.LBB173:
	.loc 2 531 0
	or	%d5, %d13, %d11
.LBE173:
.LBE199:
	.loc 1 240 0
	subx	%d8, %d4, %d8
.LVL51:
	subc	%d9, %d5, %d9
.LBB200:
.LBB192:
.LBB186:
.LBB180:
	.loc 3 1105 0
	ld.w	%d12, [%a15]0
.LBE180:
.LBE186:
.LBE192:
.LBE200:
	.loc 1 240 0
	mul.u	%e4, %d8, %d15
	madd	%d5, %d5, %d9, %d15
.LBB201:
.LBB193:
.LBB187:
.LBB181:
	.loc 3 1105 0
	extr.u	%d12, %d12, 8, 4
	mov	%d10, %d2
.LBE181:
.LBE187:
.LBE193:
.LBE201:
	.loc 1 240 0
	call	__floatundisf
.LVL52:
.LBB202:
.LBB194:
.LBB188:
.LBB182:
	.loc 3 1105 0
	itof	%d15, %d12
.LBE182:
.LBE188:
.LBE194:
.LBE202:
	.loc 1 240 0
	movh.a	%a15, hi:ticToc_100ms_s4
.LBB203:
.LBB195:
.LBB189:
.LBB183:
	.loc 3 1105 0
	div.f	%d4, %d10, %d15
.LBE183:
.LBE189:
.LBE195:
.LBE203:
	.loc 1 240 0
	lea	%a15, [%a15] lo:ticToc_100ms_s4
	div.f	%d4, %d2, %d4
	call	__fixunssfdi
.LVL53:
	st.d	[%a15]0, %e2
	ret
.LFE575:
	.size	Task_100ms_slot4, .-Task_100ms_slot4
.section .text.Task_100ms_slot14,"ax",@progbits
	.align 1
	.global	Task_100ms_slot14
	.type	Task_100ms_slot14, @function
Task_100ms_slot14:
.LFB576:
	.loc 1 243 0
.LVL54:
.LBB204:
.LBB205:
	.loc 2 530 0
	lea	%a15, -268435456
	ld.w	%d15, [%a15] 16
.LBE205:
.LBE204:
	.loc 1 244 0
	movh.a	%a2, hi:stm_buf
.LBB208:
.LBB206:
	.loc 2 530 0
	mul.u	%e2, %d15, 1
	.loc 2 531 0
	ld.w	%d2, [%a15] 44
.LBE206:
.LBE208:
	.loc 1 244 0
	lea	%a2, [%a2] lo:stm_buf
.LBB209:
.LBB207:
	.loc 2 531 0
	or	%d9, %d2, %d3
	or	%d8, %d15, 0
.LVL55:
.LBE207:
.LBE209:
	.loc 1 244 0
	st.d	[%a2]0, %e8
.LVL56:
.LBB210:
.LBB211:
	.loc 2 530 0
	ld.w	%d15, [%a15] 16
	.loc 2 531 0
	ld.w	%d13, [%a15] 44
.LBE211:
.LBE210:
.LBB214:
.LBB215:
.LBB216:
.LBB217:
	.loc 3 1105 0
	call	IfxScuCcu_getSourceFrequency
.LVL57:
.LBE217:
.LBE216:
.LBE215:
.LBE214:
.LBB236:
.LBB212:
	.loc 2 530 0
	mul.u	%e10, %d15, 1
.LVL58:
	.loc 2 531 0
	or	%d4, %d15, 0
.LBE212:
.LBE236:
.LBB237:
.LBB230:
.LBB224:
.LBB218:
	.loc 3 1105 0
	movh.a	%a15, 61443
.LBE218:
.LBE224:
.LBE230:
.LBE237:
	.loc 1 246 0
	movh	%d15, 15
	addi	%d15, %d15, 16960
.LBB238:
.LBB231:
.LBB225:
.LBB219:
	.loc 3 1105 0
	lea	%a15, [%a15] 24628
.LBE219:
.LBE225:
.LBE231:
.LBE238:
.LBB239:
.LBB213:
	.loc 2 531 0
	or	%d5, %d13, %d11
.LBE213:
.LBE239:
	.loc 1 246 0
	subx	%d8, %d4, %d8
.LVL59:
	subc	%d9, %d5, %d9
.LBB240:
.LBB232:
.LBB226:
.LBB220:
	.loc 3 1105 0
	ld.w	%d12, [%a15]0
.LBE220:
.LBE226:
.LBE232:
.LBE240:
	.loc 1 246 0
	mul.u	%e4, %d8, %d15
	madd	%d5, %d5, %d9, %d15
.LBB241:
.LBB233:
.LBB227:
.LBB221:
	.loc 3 1105 0
	extr.u	%d12, %d12, 8, 4
	mov	%d10, %d2
.LBE221:
.LBE227:
.LBE233:
.LBE241:
	.loc 1 246 0
	call	__floatundisf
.LVL60:
.LBB242:
.LBB234:
.LBB228:
.LBB222:
	.loc 3 1105 0
	itof	%d15, %d12
.LBE222:
.LBE228:
.LBE234:
.LBE242:
	.loc 1 246 0
	movh.a	%a15, hi:ticToc_100ms_s14
.LBB243:
.LBB235:
.LBB229:
.LBB223:
	.loc 3 1105 0
	div.f	%d4, %d10, %d15
.LBE223:
.LBE229:
.LBE235:
.LBE243:
	.loc 1 246 0
	lea	%a15, [%a15] lo:ticToc_100ms_s14
	div.f	%d4, %d2, %d4
	call	__fixunssfdi
.LVL61:
	st.d	[%a15]0, %e2
	ret
.LFE576:
	.size	Task_100ms_slot14, .-Task_100ms_slot14
.section .text.Task_100ms_slot24,"ax",@progbits
	.align 1
	.global	Task_100ms_slot24
	.type	Task_100ms_slot24, @function
Task_100ms_slot24:
.LFB577:
	.loc 1 249 0
	ret
.LFE577:
	.size	Task_100ms_slot24, .-Task_100ms_slot24
.section .text.Task_100ms_slot34,"ax",@progbits
	.align 1
	.global	Task_100ms_slot34
	.type	Task_100ms_slot34, @function
Task_100ms_slot34:
.LFB578:
	.loc 1 253 0
	ret
.LFE578:
	.size	Task_100ms_slot34, .-Task_100ms_slot34
.section .text.Task_100ms_slot44,"ax",@progbits
	.align 1
	.global	Task_100ms_slot44
	.type	Task_100ms_slot44, @function
Task_100ms_slot44:
.LFB579:
	.loc 1 257 0
	ret
.LFE579:
	.size	Task_100ms_slot44, .-Task_100ms_slot44
.section .text.Task_100ms_slot5,"ax",@progbits
	.align 1
	.global	Task_100ms_slot5
	.type	Task_100ms_slot5, @function
Task_100ms_slot5:
.LFB580:
	.loc 1 261 0
	ret
.LFE580:
	.size	Task_100ms_slot5, .-Task_100ms_slot5
.section .text.Task_1000ms,"ax",@progbits
	.align 1
	.global	Task_1000ms
	.type	Task_1000ms, @function
Task_1000ms:
.LFB581:
	.loc 1 268 0
.LBB244:
.LBB245:
	.loc 1 305 0
	movh.a	%a15, hi:Task
	lea	%a15, [%a15] lo:Task
	ld.h	%d15, [%a15] 6
	.loc 1 306 0
	mov	%d2, 1000
	.loc 1 305 0
	add	%d15, 1
	extr	%d15, %d15, 0, 16
	.loc 1 306 0
	jne	%d15, %d2, .L28
	.loc 1 308 0
	mov	%d15, 0
.L28:
	st.h	[%a15] 6, %d15
	ret
.LBE245:
.LBE244:
.LFE581:
	.size	Task_1000ms, .-Task_1000ms
.section .text.Task_1000ms_slot3,"ax",@progbits
	.align 1
	.global	Task_1000ms_slot3
	.type	Task_1000ms_slot3, @function
Task_1000ms_slot3:
.LFB582:
	.loc 1 272 0
	ret
.LFE582:
	.size	Task_1000ms_slot3, .-Task_1000ms_slot3
	.global	ticToc_100ms_s14
.section .bss.ticToc_100ms_s14,"aw",@nobits
	.align 2
	.type	ticToc_100ms_s14, @object
	.size	ticToc_100ms_s14, 8
ticToc_100ms_s14:
	.zero	8
	.global	ticToc_100ms_s4
.section .bss.ticToc_100ms_s4,"aw",@nobits
	.align 2
	.type	ticToc_100ms_s4, @object
	.size	ticToc_100ms_s4, 8
ticToc_100ms_s4:
	.zero	8
	.global	ticToc_10ms_s1
.section .bss.ticToc_10ms_s1,"aw",@nobits
	.align 2
	.type	ticToc_10ms_s1, @object
	.size	ticToc_10ms_s1, 8
ticToc_10ms_s1:
	.zero	8
	.global	ticToc_10ms_s0
.section .bss.ticToc_10ms_s0,"aw",@nobits
	.align 2
	.type	ticToc_10ms_s0, @object
	.size	ticToc_10ms_s0, 8
ticToc_10ms_s0:
	.zero	8
	.global	ticToc_1ms
.section .bss.ticToc_1ms,"aw",@nobits
	.align 2
	.type	ticToc_1ms, @object
	.size	ticToc_1ms, 8
ticToc_1ms:
	.zero	8
	.global	ticToc_1ms_flag
.section .bss.ticToc_1ms_flag,"aw",@nobits
	.align 2
	.type	ticToc_1ms_flag, @object
	.size	ticToc_1ms_flag, 8
ticToc_1ms_flag:
	.zero	8
	.global	stm_buf_1ms
.section .bss.stm_buf_1ms,"aw",@nobits
	.align 2
	.type	stm_buf_1ms, @object
	.size	stm_buf_1ms, 8
stm_buf_1ms:
	.zero	8
	.global	stm_buf
.section .bss.stm_buf,"aw",@nobits
	.align 2
	.type	stm_buf, @object
	.size	stm_buf, 8
stm_buf:
	.zero	8
	.global	readySound
.section .data.readySound,"aw",@progbits
	.align 1
	.type	readySound, @object
	.size	readySound, 12
readySound:
	.byte	5
	.byte	13
	.byte	1
	.zero	1
	.byte	5
	.byte	8
	.byte	1
	.zero	1
	.byte	0
	.byte	0
	.byte	0
	.zero	1
	.global	Task
.section .bss.Task,"aw",@nobits
	.align 2
	.type	Task, @object
	.size	Task, 16
Task:
	.zero	16
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
	.uaword	.LFB568
	.uaword	.LFE568-.LFB568
	.align 2
.LEFDE0:
.LSFDE2:
	.uaword	.LEFDE2-.LASFDE2
.LASFDE2:
	.uaword	.Lframe0
	.uaword	.LFB569
	.uaword	.LFE569-.LFB569
	.align 2
.LEFDE2:
.LSFDE4:
	.uaword	.LEFDE4-.LASFDE4
.LASFDE4:
	.uaword	.Lframe0
	.uaword	.LFB570
	.uaword	.LFE570-.LFB570
	.align 2
.LEFDE4:
.LSFDE6:
	.uaword	.LEFDE6-.LASFDE6
.LASFDE6:
	.uaword	.Lframe0
	.uaword	.LFB571
	.uaword	.LFE571-.LFB571
	.align 2
.LEFDE6:
.LSFDE8:
	.uaword	.LEFDE8-.LASFDE8
.LASFDE8:
	.uaword	.Lframe0
	.uaword	.LFB572
	.uaword	.LFE572-.LFB572
	.align 2
.LEFDE8:
.LSFDE10:
	.uaword	.LEFDE10-.LASFDE10
.LASFDE10:
	.uaword	.Lframe0
	.uaword	.LFB573
	.uaword	.LFE573-.LFB573
	.align 2
.LEFDE10:
.LSFDE12:
	.uaword	.LEFDE12-.LASFDE12
.LASFDE12:
	.uaword	.Lframe0
	.uaword	.LFB574
	.uaword	.LFE574-.LFB574
	.align 2
.LEFDE12:
.LSFDE14:
	.uaword	.LEFDE14-.LASFDE14
.LASFDE14:
	.uaword	.Lframe0
	.uaword	.LFB575
	.uaword	.LFE575-.LFB575
	.align 2
.LEFDE14:
.LSFDE16:
	.uaword	.LEFDE16-.LASFDE16
.LASFDE16:
	.uaword	.Lframe0
	.uaword	.LFB576
	.uaword	.LFE576-.LFB576
	.align 2
.LEFDE16:
.LSFDE18:
	.uaword	.LEFDE18-.LASFDE18
.LASFDE18:
	.uaword	.Lframe0
	.uaword	.LFB577
	.uaword	.LFE577-.LFB577
	.align 2
.LEFDE18:
.LSFDE20:
	.uaword	.LEFDE20-.LASFDE20
.LASFDE20:
	.uaword	.Lframe0
	.uaword	.LFB578
	.uaword	.LFE578-.LFB578
	.align 2
.LEFDE20:
.LSFDE22:
	.uaword	.LEFDE22-.LASFDE22
.LASFDE22:
	.uaword	.Lframe0
	.uaword	.LFB579
	.uaword	.LFE579-.LFB579
	.align 2
.LEFDE22:
.LSFDE24:
	.uaword	.LEFDE24-.LASFDE24
.LASFDE24:
	.uaword	.Lframe0
	.uaword	.LFB580
	.uaword	.LFE580-.LFB580
	.align 2
.LEFDE24:
.LSFDE26:
	.uaword	.LEFDE26-.LASFDE26
.LASFDE26:
	.uaword	.Lframe0
	.uaword	.LFB581
	.uaword	.LFE581-.LFB581
	.align 2
.LEFDE26:
.LSFDE28:
	.uaword	.LEFDE28-.LASFDE28
.LASFDE28:
	.uaword	.Lframe0
	.uaword	.LFB582
	.uaword	.LFE582-.LFB582
	.align 2
.LEFDE28:
.section .text,"ax",@progbits
.Letext0:
	.file 4 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/Platform_Types.h"
	.file 5 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/Ifx_Types.h"
	.file 6 "0_Src/BaseSw/Infra/Sfr/TC27D/_Reg/IfxScu_regdef.h"
	.file 7 "0_Src/BaseSw/iLLD/TC27D/Tricore/_Impl/IfxSrc_cfg.h"
	.file 8 "0_Src/BaseSw/iLLD/TC27D/Tricore/_Impl/IfxCpu_cfg.h"
	.file 9 "0_Src/BaseSw/Infra/Sfr/TC27D/_Reg/IfxStm_regdef.h"
	.file 10 "0_Src/BaseSw/iLLD/TC27D/Tricore/Cpu/Std/IfxCpu.h"
	.file 11 "0_Src/AppSw/Tricore/HLD/BasicModules/Gtm/Tom/Beeper/GtmTomBeeper.h"
	.file 12 "0_Src/AppSw/Tricore/HLD/BasicModules/Stm/Stm.h"
	.file 13 "0_Src/AppSw/Tricore/HLD/AbstractionLayer/IMU/IMU.h"
	.file 14 "0_Src/AppSw/Tricore/Main/SchedulerTask_Cpu1.h"
	.file 15 "0_Src/AppSw/Tricore/Main/SchedulerTask.h"
	.file 16 "0_Src/AppSw/Tricore/HLD/AbstractionLayer/Led.h"
	.file 17 "0_Src/AppSw/Tricore/HLD/BasicModules/Gtm/Tom/GtmTom.h"
	.file 18 "0_Src/AppSw/Tricore/HLD/BasicModules/Gtm/Tim/GtmTim.h"
	.file 19 "0_Src/AppSw/Tricore/HLD/BasicModules/Qspi/Qspi.h"
	.file 20 "0_Src/AppSw/Tricore/HLD/BasicModules/MultiCAN/Multican.h"
	.file 21 "0_Src/AppSw/Tricore/SDP/PedalBox/PedalBox.h"
	.file 22 "0_Src/AppSw/Tricore/SDP/SteeringAngle/SteeringAngle.h"
	.file 23 "0_Src/AppSw/Tricore/SDP/WheelSpeed/WheelSpeed.h"
	.file 24 "0_Src/AppSw/Tricore/HLD/UserInterface/UserInterface.h"
.section .debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x2fd9
	.uahalf	0x3
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.string	"GNU C 4.9.4 build on 2019-06-07 -mlicense-dir=c:\\hightec\\toolchains\\tricore\\v4.9.3.0-infineon-1.0\\bin\\../lib/gcc/tricore/4.9.4/../../../../licenses -mtc161 -g -O2 -std=c99 -fno-common -fstrict-volatile-bitfields -ffunction-sections -fdata-sections"
	.byte	0x1
	.string	"0_Src/AppSw/Tricore/Main/SchedulerTask.c"
	.string	"C:\\\\Google drive\\\\RH_Workspace\\\\__RH26_Control_Base_TC275"
	.uaword	.Ldebug_ranges0+0x280
	.uaword	0
	.uaword	0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.string	"long long unsigned int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.string	"unsigned int"
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
	.byte	0x4
	.byte	0x59
	.uaword	0x1e6
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.string	"unsigned char"
	.uleb128 0x3
	.string	"sint16"
	.byte	0x4
	.byte	0x5a
	.uaword	0x205
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.string	"short int"
	.uleb128 0x3
	.string	"uint16"
	.byte	0x4
	.byte	0x5b
	.uaword	0x220
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.string	"short unsigned int"
	.uleb128 0x3
	.string	"sint32"
	.byte	0x4
	.byte	0x5c
	.uaword	0x1a2
	.uleb128 0x3
	.string	"uint32"
	.byte	0x4
	.byte	0x5d
	.uaword	0x1ae
	.uleb128 0x3
	.string	"float32"
	.byte	0x4
	.byte	0x5e
	.uaword	0x261
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
	.byte	0x4
	.byte	0x68
	.uaword	0x1e6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.string	"long long int"
	.uleb128 0x3
	.string	"uint64"
	.byte	0x5
	.byte	0x25
	.uaword	0x178
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.string	"char"
	.uleb128 0x4
	.byte	0x4
	.uaword	0x2b0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x4
	.uaword	0x2b7
	.uleb128 0x6
	.byte	0x1
	.uleb128 0x3
	.string	"Ifx_Priority"
	.byte	0x5
	.byte	0x56
	.uaword	0x212
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.byte	0x7e
	.uaword	0x2f3
	.uleb128 0x8
	.string	"module"
	.byte	0x5
	.byte	0x80
	.uaword	0x2aa
	.byte	0
	.uleb128 0x8
	.string	"index"
	.byte	0x5
	.byte	0x81
	.uaword	0x236
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.string	"IfxModule_IndexMap"
	.byte	0x5
	.byte	0x82
	.uaword	0x2cd
	.uleb128 0x9
	.uaword	0x1e6
	.uaword	0x31d
	.uleb128 0xa
	.uaword	0x31d
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.string	"sizetype"
	.uleb128 0x9
	.uaword	0x1e6
	.uaword	0x339
	.uleb128 0xa
	.uaword	0x31d
	.byte	0xb
	.byte	0
	.uleb128 0xb
	.string	"_Ifx_SCU_CCUCON1_Bits"
	.byte	0x4
	.byte	0x6
	.byte	0x72
	.uaword	0x40d
	.uleb128 0xc
	.string	"CANDIV"
	.byte	0x6
	.byte	0x74
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"ERAYDIV"
	.byte	0x6
	.byte	0x75
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"STMDIV"
	.byte	0x6
	.byte	0x76
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"GTMDIV"
	.byte	0x6
	.byte	0x77
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"ETHDIV"
	.byte	0x6
	.byte	0x78
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.string	"ASCLINFDIV"
	.byte	0x6
	.byte	0x79
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.string	"ASCLINSDIV"
	.byte	0x6
	.byte	0x7a
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.string	"INSEL"
	.byte	0x6
	.byte	0x7b
	.uaword	0x192
	.byte	0x4
	.byte	0x2
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.string	"UP"
	.byte	0x6
	.byte	0x7c
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.string	"LCK"
	.byte	0x6
	.byte	0x7d
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_SCU_CCUCON1_Bits"
	.byte	0x6
	.byte	0x7e
	.uaword	0x339
	.uleb128 0xd
	.byte	0x4
	.byte	0x6
	.uahalf	0x4cd
	.uaword	0x451
	.uleb128 0xe
	.string	"U"
	.byte	0x6
	.uahalf	0x4cf
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x6
	.uahalf	0x4d0
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x6
	.uahalf	0x4d1
	.uaword	0x40d
	.byte	0
	.uleb128 0xf
	.string	"Ifx_SCU_CCUCON1"
	.byte	0x6
	.uahalf	0x4d2
	.uaword	0x429
	.uleb128 0x9
	.uaword	0x1e6
	.uaword	0x479
	.uleb128 0xa
	.uaword	0x31d
	.byte	0x8f
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.byte	0x7
	.byte	0x32
	.uaword	0x4c9
	.uleb128 0x11
	.string	"IfxSrc_Tos_cpu0"
	.sleb128 0
	.uleb128 0x11
	.string	"IfxSrc_Tos_cpu1"
	.sleb128 1
	.uleb128 0x11
	.string	"IfxSrc_Tos_cpu2"
	.sleb128 2
	.uleb128 0x11
	.string	"IfxSrc_Tos_dma"
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.string	"IfxSrc_Tos"
	.byte	0x7
	.byte	0x37
	.uaword	0x479
	.uleb128 0x10
	.byte	0x1
	.byte	0x8
	.byte	0x76
	.uaword	0x52b
	.uleb128 0x11
	.string	"IfxCpu_Index_0"
	.sleb128 0
	.uleb128 0x11
	.string	"IfxCpu_Index_1"
	.sleb128 1
	.uleb128 0x11
	.string	"IfxCpu_Index_2"
	.sleb128 2
	.uleb128 0x11
	.string	"IfxCpu_Index_none"
	.sleb128 3
	.byte	0
	.uleb128 0xb
	.string	"_Ifx_STM_ACCEN0_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x2d
	.uaword	0x73f
	.uleb128 0xc
	.string	"EN0"
	.byte	0x9
	.byte	0x2f
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"EN1"
	.byte	0x9
	.byte	0x30
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"EN2"
	.byte	0x9
	.byte	0x31
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"EN3"
	.byte	0x9
	.byte	0x32
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"EN4"
	.byte	0x9
	.byte	0x33
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"EN5"
	.byte	0x9
	.byte	0x34
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xc
	.string	"EN6"
	.byte	0x9
	.byte	0x35
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.string	"EN7"
	.byte	0x9
	.byte	0x36
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"EN8"
	.byte	0x9
	.byte	0x37
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0
	.uleb128 0xc
	.string	"EN9"
	.byte	0x9
	.byte	0x38
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0
	.uleb128 0xc
	.string	"EN10"
	.byte	0x9
	.byte	0x39
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0
	.uleb128 0xc
	.string	"EN11"
	.byte	0x9
	.byte	0x3a
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.string	"EN12"
	.byte	0x9
	.byte	0x3b
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.string	"EN13"
	.byte	0x9
	.byte	0x3c
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0
	.uleb128 0xc
	.string	"EN14"
	.byte	0x9
	.byte	0x3d
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0
	.uleb128 0xc
	.string	"EN15"
	.byte	0x9
	.byte	0x3e
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"EN16"
	.byte	0x9
	.byte	0x3f
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.string	"EN17"
	.byte	0x9
	.byte	0x40
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.string	"EN18"
	.byte	0x9
	.byte	0x41
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.string	"EN19"
	.byte	0x9
	.byte	0x42
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.string	"EN20"
	.byte	0x9
	.byte	0x43
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0
	.uleb128 0xc
	.string	"EN21"
	.byte	0x9
	.byte	0x44
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0
	.uleb128 0xc
	.string	"EN22"
	.byte	0x9
	.byte	0x45
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0
	.uleb128 0xc
	.string	"EN23"
	.byte	0x9
	.byte	0x46
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.string	"EN24"
	.byte	0x9
	.byte	0x47
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.string	"EN25"
	.byte	0x9
	.byte	0x48
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.string	"EN26"
	.byte	0x9
	.byte	0x49
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.string	"EN27"
	.byte	0x9
	.byte	0x4a
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.string	"EN28"
	.byte	0x9
	.byte	0x4b
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.string	"EN29"
	.byte	0x9
	.byte	0x4c
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.string	"EN30"
	.byte	0x9
	.byte	0x4d
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.string	"EN31"
	.byte	0x9
	.byte	0x4e
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_ACCEN0_Bits"
	.byte	0x9
	.byte	0x4f
	.uaword	0x52b
	.uleb128 0xb
	.string	"_Ifx_STM_ACCEN1_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x52
	.uaword	0x787
	.uleb128 0x12
	.uaword	.LASF0
	.byte	0x9
	.byte	0x54
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_ACCEN1_Bits"
	.byte	0x9
	.byte	0x55
	.uaword	0x75a
	.uleb128 0xb
	.string	"_Ifx_STM_CAP_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x58
	.uaword	0x7cc
	.uleb128 0x12
	.uaword	.LASF1
	.byte	0x9
	.byte	0x5a
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_CAP_Bits"
	.byte	0x9
	.byte	0x5b
	.uaword	0x7a2
	.uleb128 0xb
	.string	"_Ifx_STM_CAPSV_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x5e
	.uaword	0x810
	.uleb128 0x12
	.uaword	.LASF1
	.byte	0x9
	.byte	0x60
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_CAPSV_Bits"
	.byte	0x9
	.byte	0x61
	.uaword	0x7e4
	.uleb128 0xb
	.string	"_Ifx_STM_CLC_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x64
	.uaword	0x893
	.uleb128 0xc
	.string	"DISR"
	.byte	0x9
	.byte	0x66
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"DISS"
	.byte	0x9
	.byte	0x67
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x12
	.uaword	.LASF2
	.byte	0x9
	.byte	0x68
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"EDIS"
	.byte	0x9
	.byte	0x69
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x12
	.uaword	.LASF3
	.byte	0x9
	.byte	0x6a
	.uaword	0x192
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_CLC_Bits"
	.byte	0x9
	.byte	0x6b
	.uaword	0x82a
	.uleb128 0xb
	.string	"_Ifx_STM_CMCON_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x6e
	.uaword	0x96d
	.uleb128 0xc
	.string	"MSIZE0"
	.byte	0x9
	.byte	0x70
	.uaword	0x192
	.byte	0x4
	.byte	0x5
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"reserved_5"
	.byte	0x9
	.byte	0x71
	.uaword	0x192
	.byte	0x4
	.byte	0x3
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"MSTART0"
	.byte	0x9
	.byte	0x72
	.uaword	0x192
	.byte	0x4
	.byte	0x5
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.string	"reserved_13"
	.byte	0x9
	.byte	0x73
	.uaword	0x192
	.byte	0x4
	.byte	0x3
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"MSIZE1"
	.byte	0x9
	.byte	0x74
	.uaword	0x192
	.byte	0x4
	.byte	0x5
	.byte	0xb
	.byte	0
	.uleb128 0xc
	.string	"reserved_21"
	.byte	0x9
	.byte	0x75
	.uaword	0x192
	.byte	0x4
	.byte	0x3
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.string	"MSTART1"
	.byte	0x9
	.byte	0x76
	.uaword	0x192
	.byte	0x4
	.byte	0x5
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.string	"reserved_29"
	.byte	0x9
	.byte	0x77
	.uaword	0x192
	.byte	0x4
	.byte	0x3
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_CMCON_Bits"
	.byte	0x9
	.byte	0x78
	.uaword	0x8ab
	.uleb128 0xb
	.string	"_Ifx_STM_CMP_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x7b
	.uaword	0x9b4
	.uleb128 0xc
	.string	"CMPVAL"
	.byte	0x9
	.byte	0x7d
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_CMP_Bits"
	.byte	0x9
	.byte	0x7e
	.uaword	0x987
	.uleb128 0xb
	.string	"_Ifx_STM_ICR_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x81
	.uaword	0xa7f
	.uleb128 0xc
	.string	"CMP0EN"
	.byte	0x9
	.byte	0x83
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"CMP0IR"
	.byte	0x9
	.byte	0x84
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"CMP0OS"
	.byte	0x9
	.byte	0x85
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"reserved_3"
	.byte	0x9
	.byte	0x86
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0xc
	.string	"CMP1EN"
	.byte	0x9
	.byte	0x87
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0
	.uleb128 0xc
	.string	"CMP1IR"
	.byte	0x9
	.byte	0x88
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0
	.uleb128 0xc
	.string	"CMP1OS"
	.byte	0x9
	.byte	0x89
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.string	"reserved_7"
	.byte	0x9
	.byte	0x8a
	.uaword	0x192
	.byte	0x4
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_ICR_Bits"
	.byte	0x9
	.byte	0x8b
	.uaword	0x9cc
	.uleb128 0xb
	.string	"_Ifx_STM_ID_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x8e
	.uaword	0xaeb
	.uleb128 0xc
	.string	"MODREV"
	.byte	0x9
	.byte	0x90
	.uaword	0x192
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.string	"MODTYPE"
	.byte	0x9
	.byte	0x91
	.uaword	0x192
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.string	"MODNUMBER"
	.byte	0x9
	.byte	0x92
	.uaword	0x192
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_ID_Bits"
	.byte	0x9
	.byte	0x93
	.uaword	0xa97
	.uleb128 0xb
	.string	"_Ifx_STM_ISCR_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0x96
	.uaword	0xb79
	.uleb128 0xc
	.string	"CMP0IRR"
	.byte	0x9
	.byte	0x98
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"CMP0IRS"
	.byte	0x9
	.byte	0x99
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.string	"CMP1IRR"
	.byte	0x9
	.byte	0x9a
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0
	.uleb128 0xc
	.string	"CMP1IRS"
	.byte	0x9
	.byte	0x9b
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x12
	.uaword	.LASF3
	.byte	0x9
	.byte	0x9c
	.uaword	0x192
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_ISCR_Bits"
	.byte	0x9
	.byte	0x9d
	.uaword	0xb02
	.uleb128 0xb
	.string	"_Ifx_STM_KRST0_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xa0
	.uaword	0xbe0
	.uleb128 0xc
	.string	"RST"
	.byte	0x9
	.byte	0xa2
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.string	"RSTSTAT"
	.byte	0x9
	.byte	0xa3
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0
	.uleb128 0x12
	.uaword	.LASF2
	.byte	0x9
	.byte	0xa4
	.uaword	0x192
	.byte	0x4
	.byte	0x1e
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_KRST0_Bits"
	.byte	0x9
	.byte	0xa5
	.uaword	0xb92
	.uleb128 0xb
	.string	"_Ifx_STM_KRST1_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xa8
	.uaword	0xc35
	.uleb128 0xc
	.string	"RST"
	.byte	0x9
	.byte	0xaa
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x12
	.uaword	.LASF4
	.byte	0x9
	.byte	0xab
	.uaword	0x192
	.byte	0x4
	.byte	0x1f
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_KRST1_Bits"
	.byte	0x9
	.byte	0xac
	.uaword	0xbfa
	.uleb128 0xb
	.string	"_Ifx_STM_KRSTCLR_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xaf
	.uaword	0xc8c
	.uleb128 0xc
	.string	"CLR"
	.byte	0x9
	.byte	0xb1
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0
	.uleb128 0x12
	.uaword	.LASF4
	.byte	0x9
	.byte	0xb2
	.uaword	0x192
	.byte	0x4
	.byte	0x1f
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_KRSTCLR_Bits"
	.byte	0x9
	.byte	0xb3
	.uaword	0xc4f
	.uleb128 0xb
	.string	"_Ifx_STM_OCS_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xb6
	.uaword	0xd1b
	.uleb128 0x12
	.uaword	.LASF0
	.byte	0x9
	.byte	0xb8
	.uaword	0x192
	.byte	0x4
	.byte	0x18
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.string	"SUS"
	.byte	0x9
	.byte	0xb9
	.uaword	0x192
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.string	"SUS_P"
	.byte	0x9
	.byte	0xba
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.string	"SUSSTA"
	.byte	0x9
	.byte	0xbb
	.uaword	0x192
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.string	"reserved_30"
	.byte	0x9
	.byte	0xbc
	.uaword	0x192
	.byte	0x4
	.byte	0x2
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_OCS_Bits"
	.byte	0x9
	.byte	0xbd
	.uaword	0xca8
	.uleb128 0xb
	.string	"_Ifx_STM_TIM0_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xc0
	.uaword	0xd62
	.uleb128 0xc
	.string	"STM31_0"
	.byte	0x9
	.byte	0xc2
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM0_Bits"
	.byte	0x9
	.byte	0xc3
	.uaword	0xd33
	.uleb128 0xb
	.string	"_Ifx_STM_TIM0SV_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xc6
	.uaword	0xdac
	.uleb128 0xc
	.string	"STM31_0"
	.byte	0x9
	.byte	0xc8
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM0SV_Bits"
	.byte	0x9
	.byte	0xc9
	.uaword	0xd7b
	.uleb128 0xb
	.string	"_Ifx_STM_TIM1_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xcc
	.uaword	0xdf6
	.uleb128 0xc
	.string	"STM35_4"
	.byte	0x9
	.byte	0xce
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM1_Bits"
	.byte	0x9
	.byte	0xcf
	.uaword	0xdc7
	.uleb128 0xb
	.string	"_Ifx_STM_TIM2_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xd2
	.uaword	0xe3e
	.uleb128 0xc
	.string	"STM39_8"
	.byte	0x9
	.byte	0xd4
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM2_Bits"
	.byte	0x9
	.byte	0xd5
	.uaword	0xe0f
	.uleb128 0xb
	.string	"_Ifx_STM_TIM3_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xd8
	.uaword	0xe87
	.uleb128 0xc
	.string	"STM43_12"
	.byte	0x9
	.byte	0xda
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM3_Bits"
	.byte	0x9
	.byte	0xdb
	.uaword	0xe57
	.uleb128 0xb
	.string	"_Ifx_STM_TIM4_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xde
	.uaword	0xed0
	.uleb128 0xc
	.string	"STM47_16"
	.byte	0x9
	.byte	0xe0
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM4_Bits"
	.byte	0x9
	.byte	0xe1
	.uaword	0xea0
	.uleb128 0xb
	.string	"_Ifx_STM_TIM5_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xe4
	.uaword	0xf19
	.uleb128 0xc
	.string	"STM51_20"
	.byte	0x9
	.byte	0xe6
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM5_Bits"
	.byte	0x9
	.byte	0xe7
	.uaword	0xee9
	.uleb128 0xb
	.string	"_Ifx_STM_TIM6_Bits"
	.byte	0x4
	.byte	0x9
	.byte	0xea
	.uaword	0xf62
	.uleb128 0xc
	.string	"STM63_32"
	.byte	0x9
	.byte	0xec
	.uaword	0x192
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_TIM6_Bits"
	.byte	0x9
	.byte	0xed
	.uaword	0xf32
	.uleb128 0x13
	.byte	0x4
	.byte	0x9
	.byte	0xf5
	.uaword	0xf9f
	.uleb128 0x14
	.string	"U"
	.byte	0x9
	.byte	0xf7
	.uaword	0x192
	.uleb128 0x14
	.string	"I"
	.byte	0x9
	.byte	0xf8
	.uaword	0x1c3
	.uleb128 0x14
	.string	"B"
	.byte	0x9
	.byte	0xf9
	.uaword	0x73f
	.byte	0
	.uleb128 0x3
	.string	"Ifx_STM_ACCEN0"
	.byte	0x9
	.byte	0xfa
	.uaword	0xf7b
	.uleb128 0x13
	.byte	0x4
	.byte	0x9
	.byte	0xfd
	.uaword	0xfdb
	.uleb128 0x14
	.string	"U"
	.byte	0x9
	.byte	0xff
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x100
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x101
	.uaword	0x787
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_ACCEN1"
	.byte	0x9
	.uahalf	0x102
	.uaword	0xfb5
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x105
	.uaword	0x101a
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x107
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x108
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x109
	.uaword	0x7cc
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_CAP"
	.byte	0x9
	.uahalf	0x10a
	.uaword	0xff2
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x10d
	.uaword	0x1056
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x10f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x110
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x111
	.uaword	0x810
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_CAPSV"
	.byte	0x9
	.uahalf	0x112
	.uaword	0x102e
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x115
	.uaword	0x1094
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x117
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x118
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x119
	.uaword	0x893
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_CLC"
	.byte	0x9
	.uahalf	0x11a
	.uaword	0x106c
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x11d
	.uaword	0x10d0
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x11f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x120
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x121
	.uaword	0x96d
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_CMCON"
	.byte	0x9
	.uahalf	0x122
	.uaword	0x10a8
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x125
	.uaword	0x110e
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x127
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x128
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x129
	.uaword	0x9b4
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_CMP"
	.byte	0x9
	.uahalf	0x12a
	.uaword	0x10e6
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x12d
	.uaword	0x114a
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x12f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x130
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x131
	.uaword	0xa7f
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_ICR"
	.byte	0x9
	.uahalf	0x132
	.uaword	0x1122
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x135
	.uaword	0x1186
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x137
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x138
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x139
	.uaword	0xaeb
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_ID"
	.byte	0x9
	.uahalf	0x13a
	.uaword	0x115e
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x13d
	.uaword	0x11c1
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x13f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x140
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x141
	.uaword	0xb79
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_ISCR"
	.byte	0x9
	.uahalf	0x142
	.uaword	0x1199
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x145
	.uaword	0x11fe
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x147
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x148
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x149
	.uaword	0xbe0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_KRST0"
	.byte	0x9
	.uahalf	0x14a
	.uaword	0x11d6
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x14d
	.uaword	0x123c
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x14f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x150
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x151
	.uaword	0xc35
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_KRST1"
	.byte	0x9
	.uahalf	0x152
	.uaword	0x1214
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x155
	.uaword	0x127a
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x157
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x158
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x159
	.uaword	0xc8c
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_KRSTCLR"
	.byte	0x9
	.uahalf	0x15a
	.uaword	0x1252
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x15d
	.uaword	0x12ba
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x15f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x160
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x161
	.uaword	0xd1b
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_OCS"
	.byte	0x9
	.uahalf	0x162
	.uaword	0x1292
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x165
	.uaword	0x12f6
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x167
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x168
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x169
	.uaword	0xd62
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM0"
	.byte	0x9
	.uahalf	0x16a
	.uaword	0x12ce
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x16d
	.uaword	0x1333
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x16f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x170
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x171
	.uaword	0xdac
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM0SV"
	.byte	0x9
	.uahalf	0x172
	.uaword	0x130b
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x175
	.uaword	0x1372
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x177
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x178
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x179
	.uaword	0xdf6
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM1"
	.byte	0x9
	.uahalf	0x17a
	.uaword	0x134a
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x17d
	.uaword	0x13af
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x17f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x180
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x181
	.uaword	0xe3e
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM2"
	.byte	0x9
	.uahalf	0x182
	.uaword	0x1387
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x185
	.uaword	0x13ec
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x187
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x188
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x189
	.uaword	0xe87
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM3"
	.byte	0x9
	.uahalf	0x18a
	.uaword	0x13c4
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x18d
	.uaword	0x1429
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x18f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x190
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x191
	.uaword	0xed0
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM4"
	.byte	0x9
	.uahalf	0x192
	.uaword	0x1401
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x195
	.uaword	0x1466
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x197
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x198
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x199
	.uaword	0xf19
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM5"
	.byte	0x9
	.uahalf	0x19a
	.uaword	0x143e
	.uleb128 0xd
	.byte	0x4
	.byte	0x9
	.uahalf	0x19d
	.uaword	0x14a3
	.uleb128 0xe
	.string	"U"
	.byte	0x9
	.uahalf	0x19f
	.uaword	0x192
	.uleb128 0xe
	.string	"I"
	.byte	0x9
	.uahalf	0x1a0
	.uaword	0x1c3
	.uleb128 0xe
	.string	"B"
	.byte	0x9
	.uahalf	0x1a1
	.uaword	0xf62
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM_TIM6"
	.byte	0x9
	.uahalf	0x1a2
	.uaword	0x147b
	.uleb128 0x15
	.string	"_Ifx_STM"
	.uahalf	0x100
	.byte	0x9
	.uahalf	0x1ad
	.uaword	0x1651
	.uleb128 0x16
	.string	"CLC"
	.byte	0x9
	.uahalf	0x1af
	.uaword	0x1094
	.byte	0
	.uleb128 0x17
	.uaword	.LASF3
	.byte	0x9
	.uahalf	0x1b0
	.uaword	0x30d
	.byte	0x4
	.uleb128 0x16
	.string	"ID"
	.byte	0x9
	.uahalf	0x1b1
	.uaword	0x1186
	.byte	0x8
	.uleb128 0x16
	.string	"reserved_C"
	.byte	0x9
	.uahalf	0x1b2
	.uaword	0x30d
	.byte	0xc
	.uleb128 0x16
	.string	"TIM0"
	.byte	0x9
	.uahalf	0x1b3
	.uaword	0x12f6
	.byte	0x10
	.uleb128 0x16
	.string	"TIM1"
	.byte	0x9
	.uahalf	0x1b4
	.uaword	0x1372
	.byte	0x14
	.uleb128 0x16
	.string	"TIM2"
	.byte	0x9
	.uahalf	0x1b5
	.uaword	0x13af
	.byte	0x18
	.uleb128 0x16
	.string	"TIM3"
	.byte	0x9
	.uahalf	0x1b6
	.uaword	0x13ec
	.byte	0x1c
	.uleb128 0x16
	.string	"TIM4"
	.byte	0x9
	.uahalf	0x1b7
	.uaword	0x1429
	.byte	0x20
	.uleb128 0x16
	.string	"TIM5"
	.byte	0x9
	.uahalf	0x1b8
	.uaword	0x1466
	.byte	0x24
	.uleb128 0x16
	.string	"TIM6"
	.byte	0x9
	.uahalf	0x1b9
	.uaword	0x14a3
	.byte	0x28
	.uleb128 0x16
	.string	"CAP"
	.byte	0x9
	.uahalf	0x1ba
	.uaword	0x101a
	.byte	0x2c
	.uleb128 0x16
	.string	"CMP"
	.byte	0x9
	.uahalf	0x1bb
	.uaword	0x1651
	.byte	0x30
	.uleb128 0x16
	.string	"CMCON"
	.byte	0x9
	.uahalf	0x1bc
	.uaword	0x10d0
	.byte	0x38
	.uleb128 0x16
	.string	"ICR"
	.byte	0x9
	.uahalf	0x1bd
	.uaword	0x114a
	.byte	0x3c
	.uleb128 0x16
	.string	"ISCR"
	.byte	0x9
	.uahalf	0x1be
	.uaword	0x11c1
	.byte	0x40
	.uleb128 0x16
	.string	"reserved_44"
	.byte	0x9
	.uahalf	0x1bf
	.uaword	0x329
	.byte	0x44
	.uleb128 0x16
	.string	"TIM0SV"
	.byte	0x9
	.uahalf	0x1c0
	.uaword	0x1333
	.byte	0x50
	.uleb128 0x16
	.string	"CAPSV"
	.byte	0x9
	.uahalf	0x1c1
	.uaword	0x1056
	.byte	0x54
	.uleb128 0x16
	.string	"reserved_58"
	.byte	0x9
	.uahalf	0x1c2
	.uaword	0x469
	.byte	0x58
	.uleb128 0x16
	.string	"OCS"
	.byte	0x9
	.uahalf	0x1c3
	.uaword	0x12ba
	.byte	0xe8
	.uleb128 0x16
	.string	"KRSTCLR"
	.byte	0x9
	.uahalf	0x1c4
	.uaword	0x127a
	.byte	0xec
	.uleb128 0x16
	.string	"KRST1"
	.byte	0x9
	.uahalf	0x1c5
	.uaword	0x123c
	.byte	0xf0
	.uleb128 0x16
	.string	"KRST0"
	.byte	0x9
	.uahalf	0x1c6
	.uaword	0x11fe
	.byte	0xf4
	.uleb128 0x16
	.string	"ACCEN1"
	.byte	0x9
	.uahalf	0x1c7
	.uaword	0xfdb
	.byte	0xf8
	.uleb128 0x16
	.string	"ACCEN0"
	.byte	0x9
	.uahalf	0x1c8
	.uaword	0xf9f
	.byte	0xfc
	.byte	0
	.uleb128 0x9
	.uaword	0x110e
	.uaword	0x1661
	.uleb128 0xa
	.uaword	0x31d
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.string	"Ifx_STM"
	.byte	0x9
	.uahalf	0x1c9
	.uaword	0x1671
	.uleb128 0x18
	.uaword	0x14b8
	.uleb128 0x3
	.string	"IfxCpu_mutexLock"
	.byte	0xa
	.byte	0x62
	.uaword	0x192
	.uleb128 0x10
	.byte	0x1
	.byte	0x2
	.byte	0x84
	.uaword	0x16c3
	.uleb128 0x11
	.string	"IfxStm_Comparator_0"
	.sleb128 0
	.uleb128 0x11
	.string	"IfxStm_Comparator_1"
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.string	"IfxStm_Comparator"
	.byte	0x2
	.byte	0x87
	.uaword	0x168e
	.uleb128 0x10
	.byte	0x1
	.byte	0x2
	.byte	0x8c
	.uaword	0x1727
	.uleb128 0x11
	.string	"IfxStm_ComparatorInterrupt_ir0"
	.sleb128 0
	.uleb128 0x11
	.string	"IfxStm_ComparatorInterrupt_ir1"
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.string	"IfxStm_ComparatorInterrupt"
	.byte	0x2
	.byte	0x8f
	.uaword	0x16dc
	.uleb128 0x10
	.byte	0x1
	.byte	0x2
	.byte	0x94
	.uaword	0x1ae8
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_0"
	.sleb128 0
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_1"
	.sleb128 1
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_2"
	.sleb128 2
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_3"
	.sleb128 3
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_4"
	.sleb128 4
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_5"
	.sleb128 5
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_6"
	.sleb128 6
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_7"
	.sleb128 7
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_8"
	.sleb128 8
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_9"
	.sleb128 9
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_10"
	.sleb128 10
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_11"
	.sleb128 11
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_12"
	.sleb128 12
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_13"
	.sleb128 13
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_14"
	.sleb128 14
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_15"
	.sleb128 15
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_16"
	.sleb128 16
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_17"
	.sleb128 17
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_18"
	.sleb128 18
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_19"
	.sleb128 19
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_20"
	.sleb128 20
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_21"
	.sleb128 21
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_22"
	.sleb128 22
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_23"
	.sleb128 23
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_24"
	.sleb128 24
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_25"
	.sleb128 25
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_26"
	.sleb128 26
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_27"
	.sleb128 27
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_28"
	.sleb128 28
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_29"
	.sleb128 29
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_30"
	.sleb128 30
	.uleb128 0x11
	.string	"IfxStm_ComparatorOffset_31"
	.sleb128 31
	.byte	0
	.uleb128 0x3
	.string	"IfxStm_ComparatorOffset"
	.byte	0x2
	.byte	0xb5
	.uaword	0x1749
	.uleb128 0x10
	.byte	0x1
	.byte	0x2
	.byte	0xba
	.uaword	0x1ee6
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_1Bit"
	.sleb128 0
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_2Bits"
	.sleb128 1
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_3Bits"
	.sleb128 2
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_4Bits"
	.sleb128 3
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_5Bits"
	.sleb128 4
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_6Bits"
	.sleb128 5
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_7Bits"
	.sleb128 6
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_8Bits"
	.sleb128 7
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_9Bits"
	.sleb128 8
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_10Bits"
	.sleb128 9
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_11Bits"
	.sleb128 10
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_12Bits"
	.sleb128 11
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_13Bits"
	.sleb128 12
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_14Bits"
	.sleb128 13
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_15Bits"
	.sleb128 14
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_16Bits"
	.sleb128 15
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_17Bits"
	.sleb128 16
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_18Bits"
	.sleb128 17
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_19Bits"
	.sleb128 18
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_20Bits"
	.sleb128 19
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_21Bits"
	.sleb128 20
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_22Bits"
	.sleb128 21
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_23Bits"
	.sleb128 22
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_24Bits"
	.sleb128 23
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_25Bits"
	.sleb128 24
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_26Bits"
	.sleb128 25
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_27Bits"
	.sleb128 26
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_28Bits"
	.sleb128 27
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_29Bits"
	.sleb128 28
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_30Bits"
	.sleb128 29
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_31Bits"
	.sleb128 30
	.uleb128 0x11
	.string	"IfxStm_ComparatorSize_32Bits"
	.sleb128 31
	.byte	0
	.uleb128 0x3
	.string	"IfxStm_ComparatorSize"
	.byte	0x2
	.byte	0xdb
	.uaword	0x1b07
	.uleb128 0x7
	.byte	0xc
	.byte	0x2
	.byte	0xf9
	.uaword	0x1fa3
	.uleb128 0x8
	.string	"comparator"
	.byte	0x2
	.byte	0xfb
	.uaword	0x16c3
	.byte	0
	.uleb128 0x8
	.string	"comparatorInterrupt"
	.byte	0x2
	.byte	0xfc
	.uaword	0x1727
	.byte	0x1
	.uleb128 0x8
	.string	"compareOffset"
	.byte	0x2
	.byte	0xfd
	.uaword	0x1ae8
	.byte	0x2
	.uleb128 0x8
	.string	"compareSize"
	.byte	0x2
	.byte	0xfe
	.uaword	0x1ee6
	.byte	0x3
	.uleb128 0x8
	.string	"ticks"
	.byte	0x2
	.byte	0xff
	.uaword	0x244
	.byte	0x4
	.uleb128 0x16
	.string	"triggerPriority"
	.byte	0x2
	.uahalf	0x100
	.uaword	0x2b9
	.byte	0x8
	.uleb128 0x16
	.string	"typeOfService"
	.byte	0x2
	.uahalf	0x101
	.uaword	0x4c9
	.byte	0xa
	.byte	0
	.uleb128 0xf
	.string	"IfxStm_CompareConfig"
	.byte	0x2
	.uahalf	0x102
	.uaword	0x1f03
	.uleb128 0x10
	.byte	0x1
	.byte	0xb
	.byte	0x1e
	.uaword	0x2033
	.uleb128 0x11
	.string	"end"
	.sleb128 0
	.uleb128 0x11
	.string	"repeat"
	.sleb128 1
	.uleb128 0x11
	.string	"note_whole"
	.sleb128 2
	.uleb128 0x11
	.string	"note_half"
	.sleb128 3
	.uleb128 0x11
	.string	"note_quarter"
	.sleb128 4
	.uleb128 0x11
	.string	"note_eighth"
	.sleb128 5
	.uleb128 0x11
	.string	"note_sixteenth"
	.sleb128 6
	.uleb128 0x11
	.string	"note_thirtysecond"
	.sleb128 7
	.byte	0
	.uleb128 0x3
	.string	"noteBeat_t"
	.byte	0xb
	.byte	0x27
	.uaword	0x1fc0
	.uleb128 0x10
	.byte	0x1
	.byte	0xb
	.byte	0x2a
	.uaword	0x2144
	.uleb128 0x11
	.string	"rest"
	.sleb128 0
	.uleb128 0x11
	.string	"note_C5"
	.sleb128 1
	.uleb128 0x11
	.string	"note_Cs5"
	.sleb128 2
	.uleb128 0x11
	.string	"note_D5"
	.sleb128 3
	.uleb128 0x11
	.string	"note_Ds5"
	.sleb128 4
	.uleb128 0x11
	.string	"note_E5"
	.sleb128 5
	.uleb128 0x11
	.string	"note_F5"
	.sleb128 6
	.uleb128 0x11
	.string	"note_Fs5"
	.sleb128 7
	.uleb128 0x11
	.string	"note_G5"
	.sleb128 8
	.uleb128 0x11
	.string	"note_Gs5"
	.sleb128 9
	.uleb128 0x11
	.string	"note_A5"
	.sleb128 10
	.uleb128 0x11
	.string	"note_As5"
	.sleb128 11
	.uleb128 0x11
	.string	"note_B5"
	.sleb128 12
	.uleb128 0x11
	.string	"note_C6"
	.sleb128 13
	.uleb128 0x11
	.string	"note_Cs6"
	.sleb128 14
	.uleb128 0x11
	.string	"note_D6"
	.sleb128 15
	.uleb128 0x11
	.string	"note_Ds6"
	.sleb128 16
	.uleb128 0x11
	.string	"note_E6"
	.sleb128 17
	.uleb128 0x11
	.string	"note_F6"
	.sleb128 18
	.uleb128 0x11
	.string	"note_Fs6"
	.sleb128 19
	.uleb128 0x11
	.string	"note_G6"
	.sleb128 20
	.uleb128 0x11
	.string	"note_Gs6"
	.sleb128 21
	.uleb128 0x11
	.string	"note_A6"
	.sleb128 22
	.uleb128 0x11
	.string	"note_C7"
	.sleb128 23
	.byte	0
	.uleb128 0x3
	.string	"notePitch_t"
	.byte	0xb
	.byte	0x2e
	.uaword	0x2045
	.uleb128 0x7
	.byte	0x4
	.byte	0xb
	.byte	0x34
	.uaword	0x2186
	.uleb128 0x8
	.string	"beat"
	.byte	0xb
	.byte	0x36
	.uaword	0x2033
	.byte	0
	.uleb128 0x8
	.string	"note"
	.byte	0xb
	.byte	0x37
	.uaword	0x2144
	.byte	0x1
	.uleb128 0x8
	.string	"tie"
	.byte	0xb
	.byte	0x38
	.uaword	0x274
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.string	"note_t"
	.byte	0xb
	.byte	0x39
	.uaword	0x2157
	.uleb128 0x18
	.uaword	0x274
	.uleb128 0x7
	.byte	0x1
	.byte	0xc
	.byte	0x2a
	.uaword	0x21b6
	.uleb128 0x8
	.string	"Led_Onboard"
	.byte	0xc
	.byte	0x2c
	.uaword	0x2194
	.byte	0
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.byte	0xc
	.byte	0x27
	.uaword	0x21d1
	.uleb128 0x14
	.string	"U"
	.byte	0xc
	.byte	0x29
	.uaword	0x1d9
	.uleb128 0x14
	.string	"B"
	.byte	0xc
	.byte	0x2d
	.uaword	0x2199
	.byte	0
	.uleb128 0x3
	.string	"Stm_LedState"
	.byte	0xc
	.byte	0x2e
	.uaword	0x21b6
	.uleb128 0x7
	.byte	0x18
	.byte	0xc
	.byte	0x30
	.uaword	0x2230
	.uleb128 0x8
	.string	"stmSfr"
	.byte	0xc
	.byte	0x32
	.uaword	0x2230
	.byte	0
	.uleb128 0x8
	.string	"stmConfig"
	.byte	0xc
	.byte	0x33
	.uaword	0x1fa3
	.byte	0x4
	.uleb128 0x8
	.string	"LedState"
	.byte	0xc
	.byte	0x34
	.uaword	0x21d1
	.byte	0x10
	.uleb128 0x8
	.string	"counter"
	.byte	0xc
	.byte	0x35
	.uaword	0x2236
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x1661
	.uleb128 0x18
	.uaword	0x236
	.uleb128 0x3
	.string	"Stm_data"
	.byte	0xc
	.byte	0x36
	.uaword	0x21e5
	.uleb128 0x7
	.byte	0x1c
	.byte	0xd
	.byte	0x22
	.uaword	0x22be
	.uleb128 0x8
	.string	"Gyro_x"
	.byte	0xd
	.byte	0x24
	.uaword	0x252
	.byte	0
	.uleb128 0x8
	.string	"Gyro_y"
	.byte	0xd
	.byte	0x25
	.uaword	0x252
	.byte	0x4
	.uleb128 0x8
	.string	"Gyro_z"
	.byte	0xd
	.byte	0x26
	.uaword	0x252
	.byte	0x8
	.uleb128 0x8
	.string	"Accel_x"
	.byte	0xd
	.byte	0x28
	.uaword	0x252
	.byte	0xc
	.uleb128 0x8
	.string	"Accel_y"
	.byte	0xd
	.byte	0x29
	.uaword	0x252
	.byte	0x10
	.uleb128 0x8
	.string	"Accel_z"
	.byte	0xd
	.byte	0x2a
	.uaword	0x252
	.byte	0x14
	.uleb128 0x8
	.string	"isOk"
	.byte	0xd
	.byte	0x2c
	.uaword	0x274
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.string	"HLD_Imu_data_t"
	.byte	0xd
	.byte	0x2d
	.uaword	0x224b
	.uleb128 0x7
	.byte	0x20
	.byte	0xd
	.byte	0x42
	.uaword	0x22f8
	.uleb128 0x8
	.string	"mutex"
	.byte	0xd
	.byte	0x44
	.uaword	0x1676
	.byte	0
	.uleb128 0x8
	.string	"data"
	.byte	0xd
	.byte	0x45
	.uaword	0x22be
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.byte	0xe
	.byte	0xd
	.byte	0x48
	.uaword	0x236d
	.uleb128 0x8
	.string	"Gyro_x"
	.byte	0xd
	.byte	0x4b
	.uaword	0x1f7
	.byte	0
	.uleb128 0x8
	.string	"Gyro_y"
	.byte	0xd
	.byte	0x4c
	.uaword	0x1f7
	.byte	0x2
	.uleb128 0x8
	.string	"Gyro_z"
	.byte	0xd
	.byte	0x4d
	.uaword	0x1f7
	.byte	0x4
	.uleb128 0x8
	.string	"Accel_x"
	.byte	0xd
	.byte	0x4f
	.uaword	0x1f7
	.byte	0x6
	.uleb128 0x8
	.string	"Accel_y"
	.byte	0xd
	.byte	0x50
	.uaword	0x1f7
	.byte	0x8
	.uleb128 0x8
	.string	"Accel_z"
	.byte	0xd
	.byte	0x51
	.uaword	0x1f7
	.byte	0xa
	.uleb128 0x8
	.string	"WhoAmI"
	.byte	0xd
	.byte	0x53
	.uaword	0x212
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.byte	0x4c
	.byte	0xd
	.byte	0x30
	.uaword	0x239e
	.uleb128 0x8
	.string	"data"
	.byte	0xd
	.byte	0x41
	.uaword	0x22be
	.byte	0
	.uleb128 0x8
	.string	"shared"
	.byte	0xd
	.byte	0x46
	.uaword	0x22d4
	.byte	0x1c
	.uleb128 0x8
	.string	"MPU"
	.byte	0xd
	.byte	0x54
	.uaword	0x22f8
	.byte	0x3c
	.byte	0
	.uleb128 0x3
	.string	"HLD_Imu_t"
	.byte	0xd
	.byte	0x57
	.uaword	0x236d
	.uleb128 0x7
	.byte	0x8
	.byte	0xe
	.byte	0x21
	.uaword	0x23e1
	.uleb128 0x8
	.string	"mutex"
	.byte	0xe
	.byte	0x23
	.uaword	0x1676
	.byte	0
	.uleb128 0x8
	.string	"start"
	.byte	0xe
	.byte	0x24
	.uaword	0x274
	.byte	0x4
	.uleb128 0x8
	.string	"flag"
	.byte	0xe
	.byte	0x25
	.uaword	0x274
	.byte	0x5
	.byte	0
	.uleb128 0x3
	.string	"Task_cpu1"
	.byte	0xe
	.byte	0x26
	.uaword	0x23af
	.uleb128 0x10
	.byte	0x1
	.byte	0xf
	.byte	0x24
	.uaword	0x2433
	.uleb128 0x11
	.string	"initialized"
	.sleb128 0
	.uleb128 0x11
	.string	"tsActivated"
	.sleb128 1
	.uleb128 0x11
	.string	"ppsChecked"
	.sleb128 2
	.uleb128 0x11
	.string	"readyToDrive"
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.string	"Task_state"
	.byte	0xf
	.byte	0x30
	.uaword	0x23f2
	.uleb128 0x7
	.byte	0x4
	.byte	0xf
	.byte	0x3b
	.uaword	0x245b
	.uleb128 0x8
	.string	"test"
	.byte	0xf
	.byte	0x3f
	.uaword	0x244
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0xf
	.byte	0x32
	.uaword	0x24dc
	.uleb128 0x8
	.string	"counter_1ms"
	.byte	0xf
	.byte	0x34
	.uaword	0x1f7
	.byte	0
	.uleb128 0x8
	.string	"counter_10ms"
	.byte	0xf
	.byte	0x35
	.uaword	0x1f7
	.byte	0x2
	.uleb128 0x8
	.string	"counter_100ms"
	.byte	0xf
	.byte	0x36
	.uaword	0x1f7
	.byte	0x4
	.uleb128 0x8
	.string	"counter_1000ms"
	.byte	0xf
	.byte	0x37
	.uaword	0x1f7
	.byte	0x6
	.uleb128 0x8
	.string	"systemState"
	.byte	0xf
	.byte	0x39
	.uaword	0x2433
	.byte	0x8
	.uleb128 0x8
	.string	"core1"
	.byte	0xf
	.byte	0x40
	.uaword	0x2445
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.string	"Task_data"
	.byte	0xf
	.byte	0x42
	.uaword	0x245b
	.uleb128 0x19
	.string	"IfxScuCcu_getStmFrequency"
	.byte	0x3
	.uahalf	0x44f
	.byte	0x1
	.uaword	0x252
	.byte	0x3
	.uleb128 0x1a
	.string	"IfxStm_getFrequency"
	.byte	0x2
	.uahalf	0x21f
	.byte	0x1
	.uaword	0x252
	.byte	0x3
	.uaword	0x254f
	.uleb128 0x1b
	.string	"stm"
	.byte	0x2
	.uahalf	0x21f
	.uaword	0x2230
	.uleb128 0x1c
	.string	"result"
	.byte	0x2
	.uahalf	0x221
	.uaword	0x252
	.byte	0
	.uleb128 0x1a
	.string	"IfxStm_get"
	.byte	0x2
	.uahalf	0x20e
	.byte	0x1
	.uaword	0x294
	.byte	0x3
	.uaword	0x2584
	.uleb128 0x1b
	.string	"stm"
	.byte	0x2
	.uahalf	0x20e
	.uaword	0x2230
	.uleb128 0x1c
	.string	"result"
	.byte	0x2
	.uahalf	0x210
	.uaword	0x294
	.byte	0
	.uleb128 0x1d
	.string	"Task_counter_service_10ms"
	.byte	0x1
	.uahalf	0x11f
	.byte	0x1
	.byte	0x1
	.uleb128 0x1d
	.string	"Task_counter_service_100ms"
	.byte	0x1
	.uahalf	0x127
	.byte	0x1
	.byte	0x1
	.uleb128 0x1d
	.string	"Task_counter_service_1000ms"
	.byte	0x1
	.uahalf	0x12f
	.byte	0x1
	.byte	0x1
	.uleb128 0x1e
	.string	"Task_startButtonRoutine"
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.uaword	.LFB568
	.uaword	.LFE568
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x1f
	.byte	0x1
	.string	"Task_init"
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.uaword	.LFB569
	.uaword	.LFE569
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x26be
	.uleb128 0x20
	.uaword	.LVL0
	.uaword	0x2da1
	.uleb128 0x20
	.uaword	.LVL1
	.uaword	0x2db7
	.uleb128 0x20
	.uaword	.LVL2
	.uaword	0x2dcd
	.uleb128 0x20
	.uaword	.LVL3
	.uaword	0x2de1
	.uleb128 0x20
	.uaword	.LVL4
	.uaword	0x2df9
	.uleb128 0x21
	.uaword	.LVL5
	.uaword	0x2e0c
	.uaword	0x2670
	.uleb128 0x22
	.byte	0x1
	.byte	0x64
	.byte	0x5
	.byte	0x3
	.uaword	Task_startButtonRoutine
	.byte	0
	.uleb128 0x20
	.uaword	.LVL6
	.uaword	0x2e33
	.uleb128 0x20
	.uaword	.LVL7
	.uaword	0x2e4b
	.uleb128 0x20
	.uaword	.LVL8
	.uaword	0x2e68
	.uleb128 0x21
	.uaword	.LVL9
	.uaword	0x2e82
	.uaword	0x269f
	.uleb128 0x22
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.uaword	.LVL10
	.uaword	0x2eb1
	.uaword	0x26b3
	.uleb128 0x22
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.uaword	.LVL11
	.byte	0x1
	.uaword	0x2ed6
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.string	"Task_1ms"
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.uaword	.LFB570
	.uaword	.LFE570
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x25
	.byte	0x1
	.string	"Task_IsrCb_1ms"
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.uaword	.LFB571
	.uaword	.LFE571
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x27ed
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB52
	.uaword	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0xb9
	.uaword	0x2727
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0
	.uleb128 0x29
	.uaword	0x2574
	.uaword	.LLST0
	.byte	0
	.byte	0
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB58
	.uaword	.Ldebug_ranges0+0x20
	.byte	0x1
	.byte	0xcb
	.uaword	0x2754
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x20
	.uleb128 0x29
	.uaword	0x2574
	.uaword	.LLST1
	.byte	0
	.byte	0
	.uleb128 0x26
	.uaword	0x2511
	.uaword	.LBB61
	.uaword	.Ldebug_ranges0+0x38
	.byte	0x1
	.byte	0xcb
	.uaword	0x2797
	.uleb128 0x27
	.uaword	0x2533
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x38
	.uleb128 0x2a
	.uaword	0x253f
	.uleb128 0x2b
	.uaword	0x24ed
	.uaword	.LBB63
	.uaword	.Ldebug_ranges0+0x38
	.byte	0x2
	.uahalf	0x223
	.uleb128 0x20
	.uaword	.LVL26
	.uaword	0x2f03
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.uaword	.LVL15
	.uaword	0x2e82
	.uaword	0x27ab
	.uleb128 0x22
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.uaword	.LVL16
	.uaword	0x2eb1
	.uaword	0x27bf
	.uleb128 0x22
	.byte	0x1
	.byte	0x64
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.uaword	.LVL17
	.uaword	0x2f2b
	.uleb128 0x20
	.uaword	.LVL18
	.uaword	0x2f44
	.uleb128 0x20
	.uaword	.LVL19
	.uaword	0x2f5f
	.uleb128 0x20
	.uaword	.LVL20
	.uaword	0x2f7f
	.uleb128 0x20
	.uaword	.LVL21
	.uaword	0x2f9c
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.string	"Task_10ms"
	.byte	0x1
	.byte	0xd0
	.byte	0x1
	.uaword	.LFB572
	.uaword	.LFE572
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x28c1
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB82
	.uaword	.Ldebug_ranges0+0x68
	.byte	0x1
	.byte	0xd2
	.uaword	0x2838
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x68
	.uleb128 0x29
	.uaword	0x2574
	.uaword	.LLST2
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uaword	0x2584
	.uaword	.LBB90
	.uaword	.Ldebug_ranges0+0x98
	.byte	0x1
	.byte	0xd3
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB98
	.uaword	.Ldebug_ranges0+0xb8
	.byte	0x1
	.byte	0xd7
	.uaword	0x2874
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0xb8
	.uleb128 0x29
	.uaword	0x2574
	.uaword	.LLST3
	.byte	0
	.byte	0
	.uleb128 0x26
	.uaword	0x2511
	.uaword	.LBB101
	.uaword	.Ldebug_ranges0+0xd0
	.byte	0x1
	.byte	0xd7
	.uaword	0x28b7
	.uleb128 0x27
	.uaword	0x2533
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0xd0
	.uleb128 0x2a
	.uaword	0x253f
	.uleb128 0x2b
	.uaword	0x24ed
	.uaword	.LBB103
	.uaword	.Ldebug_ranges0+0xd0
	.byte	0x2
	.uahalf	0x223
	.uleb128 0x20
	.uaword	.LVL36
	.uaword	0x2f03
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.uaword	.LVL31
	.uaword	0x2fbb
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.string	"Task_10ms_slot1"
	.byte	0x1
	.byte	0xd9
	.byte	0x1
	.uaword	.LFB573
	.uaword	.LFE573
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x297b
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB122
	.uaword	.Ldebug_ranges0+0x100
	.byte	0x1
	.byte	0xdb
	.uaword	0x2912
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x100
	.uleb128 0x29
	.uaword	0x2574
	.uaword	.LLST4
	.byte	0
	.byte	0
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB128
	.uaword	.Ldebug_ranges0+0x120
	.byte	0x1
	.byte	0xdf
	.uaword	0x293b
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x120
	.uleb128 0x2a
	.uaword	0x2574
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uaword	0x2511
	.uaword	.LBB132
	.uaword	.Ldebug_ranges0+0x140
	.byte	0x1
	.byte	0xdf
	.uleb128 0x27
	.uaword	0x2533
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x140
	.uleb128 0x2a
	.uaword	0x253f
	.uleb128 0x2b
	.uaword	0x24ed
	.uaword	.LBB134
	.uaword	.Ldebug_ranges0+0x140
	.byte	0x2
	.uahalf	0x223
	.uleb128 0x20
	.uaword	.LVL41
	.uaword	0x2f03
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.string	"Task_100ms"
	.byte	0x1
	.byte	0xe4
	.byte	0x1
	.uaword	.LFB574
	.uaword	.LFE574
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x29aa
	.uleb128 0x2e
	.uaword	0x25a4
	.uaword	.LBB162
	.uaword	.LBE162
	.byte	0x1
	.byte	0xe6
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.string	"Task_100ms_slot4"
	.byte	0x1
	.byte	0xec
	.byte	0x1
	.uaword	.LFB575
	.uaword	.LFE575
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x2a65
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB164
	.uaword	.Ldebug_ranges0+0x180
	.byte	0x1
	.byte	0xee
	.uaword	0x29fc
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x180
	.uleb128 0x29
	.uaword	0x2574
	.uaword	.LLST5
	.byte	0
	.byte	0
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB170
	.uaword	.Ldebug_ranges0+0x1a0
	.byte	0x1
	.byte	0xf0
	.uaword	0x2a25
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x1a0
	.uleb128 0x2a
	.uaword	0x2574
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uaword	0x2511
	.uaword	.LBB174
	.uaword	.Ldebug_ranges0+0x1c0
	.byte	0x1
	.byte	0xf0
	.uleb128 0x27
	.uaword	0x2533
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x1c0
	.uleb128 0x2a
	.uaword	0x253f
	.uleb128 0x2b
	.uaword	0x24ed
	.uaword	.LBB176
	.uaword	.Ldebug_ranges0+0x1c0
	.byte	0x2
	.uahalf	0x223
	.uleb128 0x20
	.uaword	.LVL49
	.uaword	0x2f03
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.string	"Task_100ms_slot14"
	.byte	0x1
	.byte	0xf2
	.byte	0x1
	.uaword	.LFB576
	.uaword	.LFE576
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x2b21
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB204
	.uaword	.Ldebug_ranges0+0x200
	.byte	0x1
	.byte	0xf4
	.uaword	0x2ab8
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x200
	.uleb128 0x29
	.uaword	0x2574
	.uaword	.LLST6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uaword	0x254f
	.uaword	.LBB210
	.uaword	.Ldebug_ranges0+0x220
	.byte	0x1
	.byte	0xf6
	.uaword	0x2ae1
	.uleb128 0x27
	.uaword	0x2568
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x220
	.uleb128 0x2a
	.uaword	0x2574
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uaword	0x2511
	.uaword	.LBB214
	.uaword	.Ldebug_ranges0+0x240
	.byte	0x1
	.byte	0xf6
	.uleb128 0x27
	.uaword	0x2533
	.sleb128 -268435456
	.uleb128 0x28
	.uaword	.Ldebug_ranges0+0x240
	.uleb128 0x2a
	.uaword	0x253f
	.uleb128 0x2b
	.uaword	0x24ed
	.uaword	.LBB216
	.uaword	.Ldebug_ranges0+0x240
	.byte	0x2
	.uahalf	0x223
	.uleb128 0x20
	.uaword	.LVL57
	.uaword	0x2f03
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.string	"Task_100ms_slot24"
	.byte	0x1
	.byte	0xf8
	.byte	0x1
	.uaword	.LFB577
	.uaword	.LFE577
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x24
	.byte	0x1
	.string	"Task_100ms_slot34"
	.byte	0x1
	.byte	0xfc
	.byte	0x1
	.uaword	.LFB578
	.uaword	.LFE578
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x2f
	.byte	0x1
	.string	"Task_100ms_slot44"
	.byte	0x1
	.uahalf	0x100
	.byte	0x1
	.uaword	.LFB579
	.uaword	.LFE579
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x2f
	.byte	0x1
	.string	"Task_100ms_slot5"
	.byte	0x1
	.uahalf	0x104
	.byte	0x1
	.uaword	.LFB580
	.uaword	.LFE580
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x30
	.byte	0x1
	.string	"Task_1000ms"
	.byte	0x1
	.uahalf	0x10b
	.byte	0x1
	.uaword	.LFB581
	.uaword	.LFE581
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x2bdc
	.uleb128 0x31
	.uaword	0x25c5
	.uaword	.LBB244
	.uaword	.LBE244
	.byte	0x1
	.uahalf	0x10d
	.byte	0
	.uleb128 0x2f
	.byte	0x1
	.string	"Task_1000ms_slot3"
	.byte	0x1
	.uahalf	0x10f
	.byte	0x1
	.uaword	.LFB582
	.uaword	.LFE582
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x9
	.uaword	0x2f3
	.uaword	0x2c0f
	.uleb128 0xa
	.uaword	0x31d
	.byte	0x2
	.byte	0
	.uleb128 0x32
	.string	"IfxCpu_cfg_indexMap"
	.byte	0x8
	.byte	0x96
	.uaword	0x2c2c
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.uaword	0x2bff
	.uleb128 0x9
	.uaword	0x2186
	.uaword	0x2c3c
	.uleb128 0x34
	.byte	0
	.uleb128 0x32
	.string	"Beep_pattern4"
	.byte	0xb
	.byte	0x4c
	.uaword	0x2c31
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.string	"g_Stm"
	.byte	0x10
	.byte	0x2a
	.uaword	0x223b
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.string	"HLD_Imu"
	.byte	0xd
	.byte	0x5b
	.uaword	0x239e
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.string	"Task_core1"
	.byte	0xe
	.byte	0x2c
	.uaword	0x23e1
	.byte	0x1
	.byte	0x1
	.uleb128 0x35
	.string	"Task"
	.byte	0x1
	.byte	0x3b
	.uaword	0x24dc
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	Task
	.uleb128 0x9
	.uaword	0x2186
	.uaword	0x2caa
	.uleb128 0xa
	.uaword	0x31d
	.byte	0x2
	.byte	0
	.uleb128 0x35
	.string	"readySound"
	.byte	0x1
	.byte	0x49
	.uaword	0x2c9a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	readySound
	.uleb128 0x35
	.string	"stm_buf"
	.byte	0x1
	.byte	0x4d
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	stm_buf
	.uleb128 0x35
	.string	"stm_buf_1ms"
	.byte	0x1
	.byte	0x4e
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	stm_buf_1ms
	.uleb128 0x35
	.string	"ticToc_1ms_flag"
	.byte	0x1
	.byte	0x4f
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	ticToc_1ms_flag
	.uleb128 0x35
	.string	"ticToc_1ms"
	.byte	0x1
	.byte	0x50
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	ticToc_1ms
	.uleb128 0x35
	.string	"ticToc_10ms_s0"
	.byte	0x1
	.byte	0x51
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	ticToc_10ms_s0
	.uleb128 0x35
	.string	"ticToc_10ms_s1"
	.byte	0x1
	.byte	0x52
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	ticToc_10ms_s1
	.uleb128 0x35
	.string	"ticToc_100ms_s4"
	.byte	0x1
	.byte	0x53
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	ticToc_100ms_s4
	.uleb128 0x35
	.string	"ticToc_100ms_s14"
	.byte	0x1
	.byte	0x54
	.uaword	0x294
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	ticToc_100ms_s14
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_GtmTom_init"
	.byte	0x11
	.byte	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_GtmTim_init"
	.byte	0x12
	.byte	0x3a
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_Qspi_init"
	.byte	0x13
	.byte	0x39
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_Multican_init"
	.byte	0x14
	.byte	0x71
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_Imu_init"
	.byte	0xd
	.byte	0x5f
	.byte	0x1
	.byte	0x1
	.uleb128 0x37
	.byte	0x1
	.string	"HLD_UserInterface_init"
	.byte	0x18
	.byte	0x42
	.byte	0x1
	.byte	0x1
	.uaword	0x2e33
	.uleb128 0x38
	.uaword	0x2b1
	.byte	0
	.uleb128 0x36
	.byte	0x1
	.string	"SDP_PedalBox_init"
	.byte	0x15
	.byte	0x68
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"SDP_SteeringAngle_init"
	.byte	0x16
	.byte	0x53
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"SDP_WheelSpeed_init"
	.byte	0x17
	.byte	0x2b
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.byte	0x1
	.string	"IfxCpu_acquireMutex"
	.byte	0xa
	.uahalf	0x1f5
	.byte	0x1
	.uaword	0x274
	.byte	0x1
	.uaword	0x2eab
	.uleb128 0x38
	.uaword	0x2eab
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x1676
	.uleb128 0x3a
	.byte	0x1
	.string	"IfxCpu_releaseMutex"
	.byte	0xa
	.uahalf	0x207
	.byte	0x1
	.byte	0x1
	.uaword	0x2ed6
	.uleb128 0x38
	.uaword	0x2eab
	.byte	0
	.uleb128 0x37
	.byte	0x1
	.string	"HLD_GtmTomBeeper_start"
	.byte	0xb
	.byte	0x69
	.byte	0x1
	.byte	0x1
	.uaword	0x2efd
	.uleb128 0x38
	.uaword	0x2efd
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uaword	0x2186
	.uleb128 0x3b
	.byte	0x1
	.string	"IfxScuCcu_getSourceFrequency"
	.byte	0x3
	.uahalf	0x39a
	.byte	0x1
	.uaword	0x252
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_GtmTim_run_1ms"
	.byte	0x12
	.byte	0x3d
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"SDP_PedalBox_run_1ms"
	.byte	0x15
	.byte	0x67
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"SDP_SteeringAngle_run_1ms"
	.byte	0x16
	.byte	0x54
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"SDP_WheelSpeed_run_1ms"
	.byte	0x17
	.byte	0x2c
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_GtmTomBeeper_run_1ms"
	.byte	0xb
	.byte	0x5e
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.byte	0x1
	.string	"HLD_UserInterface_run_10ms"
	.byte	0x18
	.byte	0x52
	.byte	0x1
	.byte	0x1
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
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x18
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0x1d
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x21
	.byte	0
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x36
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x37
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.uleb128 0x3a
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
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0
.section .debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LVL13
	.uaword	.LVL14
	.uahalf	0x14
	.byte	0x72
	.sleb128 0
	.byte	0xf7
	.uleb128 0x192
	.byte	0xf7
	.uleb128 0x178
	.byte	0x8
	.byte	0x20
	.byte	0xf7
	.uleb128 0x178
	.byte	0x24
	.byte	0xf5
	.uleb128 0x2
	.uleb128 0x178
	.byte	0x21
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LVL22
	.uaword	.LVL23
	.uahalf	0x14
	.byte	0x74
	.sleb128 0
	.byte	0xf7
	.uleb128 0x192
	.byte	0xf7
	.uleb128 0x178
	.byte	0x8
	.byte	0x20
	.byte	0xf7
	.uleb128 0x178
	.byte	0x24
	.byte	0xf5
	.uleb128 0x4
	.uleb128 0x178
	.byte	0x21
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LVL29
	.uaword	.LVL30
	.uahalf	0x14
	.byte	0x72
	.sleb128 0
	.byte	0xf7
	.uleb128 0x192
	.byte	0xf7
	.uleb128 0x178
	.byte	0x8
	.byte	0x20
	.byte	0xf7
	.uleb128 0x178
	.byte	0x24
	.byte	0xf5
	.uleb128 0x2
	.uleb128 0x178
	.byte	0x21
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LVL32
	.uaword	.LVL33
	.uahalf	0x14
	.byte	0x74
	.sleb128 0
	.byte	0xf7
	.uleb128 0x192
	.byte	0xf7
	.uleb128 0x178
	.byte	0x8
	.byte	0x20
	.byte	0xf7
	.uleb128 0x178
	.byte	0x24
	.byte	0xf5
	.uleb128 0x4
	.uleb128 0x178
	.byte	0x21
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LVL39
	.uaword	.LVL43
	.uahalf	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.byte	0x59
	.byte	0x93
	.uleb128 0x4
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LVL47
	.uaword	.LVL51
	.uahalf	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.byte	0x59
	.byte	0x93
	.uleb128 0x4
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LVL55
	.uaword	.LVL59
	.uahalf	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.byte	0x59
	.byte	0x93
	.uleb128 0x4
	.uaword	0
	.uaword	0
.section .debug_aranges,"",@progbits
	.uaword	0x8c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.LFB568
	.uaword	.LFE568-.LFB568
	.uaword	.LFB569
	.uaword	.LFE569-.LFB569
	.uaword	.LFB570
	.uaword	.LFE570-.LFB570
	.uaword	.LFB571
	.uaword	.LFE571-.LFB571
	.uaword	.LFB572
	.uaword	.LFE572-.LFB572
	.uaword	.LFB573
	.uaword	.LFE573-.LFB573
	.uaword	.LFB574
	.uaword	.LFE574-.LFB574
	.uaword	.LFB575
	.uaword	.LFE575-.LFB575
	.uaword	.LFB576
	.uaword	.LFE576-.LFB576
	.uaword	.LFB577
	.uaword	.LFE577-.LFB577
	.uaword	.LFB578
	.uaword	.LFE578-.LFB578
	.uaword	.LFB579
	.uaword	.LFE579-.LFB579
	.uaword	.LFB580
	.uaword	.LFE580-.LFB580
	.uaword	.LFB581
	.uaword	.LFE581-.LFB581
	.uaword	.LFB582
	.uaword	.LFE582-.LFB582
	.uaword	0
	.uaword	0
.section .debug_ranges,"",@progbits
.Ldebug_ranges0:
	.uaword	.LBB52
	.uaword	.LBE52
	.uaword	.LBB56
	.uaword	.LBE56
	.uaword	.LBB57
	.uaword	.LBE57
	.uaword	0
	.uaword	0
	.uaword	.LBB58
	.uaword	.LBE58
	.uaword	.LBB77
	.uaword	.LBE77
	.uaword	0
	.uaword	0
	.uaword	.LBB61
	.uaword	.LBE61
	.uaword	.LBB78
	.uaword	.LBE78
	.uaword	.LBB79
	.uaword	.LBE79
	.uaword	.LBB80
	.uaword	.LBE80
	.uaword	.LBB81
	.uaword	.LBE81
	.uaword	0
	.uaword	0
	.uaword	.LBB82
	.uaword	.LBE82
	.uaword	.LBB88
	.uaword	.LBE88
	.uaword	.LBB89
	.uaword	.LBE89
	.uaword	.LBB94
	.uaword	.LBE94
	.uaword	.LBB96
	.uaword	.LBE96
	.uaword	0
	.uaword	0
	.uaword	.LBB90
	.uaword	.LBE90
	.uaword	.LBB95
	.uaword	.LBE95
	.uaword	.LBB97
	.uaword	.LBE97
	.uaword	0
	.uaword	0
	.uaword	.LBB98
	.uaword	.LBE98
	.uaword	.LBB117
	.uaword	.LBE117
	.uaword	0
	.uaword	0
	.uaword	.LBB101
	.uaword	.LBE101
	.uaword	.LBB118
	.uaword	.LBE118
	.uaword	.LBB119
	.uaword	.LBE119
	.uaword	.LBB120
	.uaword	.LBE120
	.uaword	.LBB121
	.uaword	.LBE121
	.uaword	0
	.uaword	0
	.uaword	.LBB122
	.uaword	.LBE122
	.uaword	.LBB126
	.uaword	.LBE126
	.uaword	.LBB127
	.uaword	.LBE127
	.uaword	0
	.uaword	0
	.uaword	.LBB128
	.uaword	.LBE128
	.uaword	.LBB154
	.uaword	.LBE154
	.uaword	.LBB157
	.uaword	.LBE157
	.uaword	0
	.uaword	0
	.uaword	.LBB132
	.uaword	.LBE132
	.uaword	.LBB155
	.uaword	.LBE155
	.uaword	.LBB156
	.uaword	.LBE156
	.uaword	.LBB158
	.uaword	.LBE158
	.uaword	.LBB159
	.uaword	.LBE159
	.uaword	.LBB160
	.uaword	.LBE160
	.uaword	.LBB161
	.uaword	.LBE161
	.uaword	0
	.uaword	0
	.uaword	.LBB164
	.uaword	.LBE164
	.uaword	.LBB168
	.uaword	.LBE168
	.uaword	.LBB169
	.uaword	.LBE169
	.uaword	0
	.uaword	0
	.uaword	.LBB170
	.uaword	.LBE170
	.uaword	.LBB196
	.uaword	.LBE196
	.uaword	.LBB199
	.uaword	.LBE199
	.uaword	0
	.uaword	0
	.uaword	.LBB174
	.uaword	.LBE174
	.uaword	.LBB197
	.uaword	.LBE197
	.uaword	.LBB198
	.uaword	.LBE198
	.uaword	.LBB200
	.uaword	.LBE200
	.uaword	.LBB201
	.uaword	.LBE201
	.uaword	.LBB202
	.uaword	.LBE202
	.uaword	.LBB203
	.uaword	.LBE203
	.uaword	0
	.uaword	0
	.uaword	.LBB204
	.uaword	.LBE204
	.uaword	.LBB208
	.uaword	.LBE208
	.uaword	.LBB209
	.uaword	.LBE209
	.uaword	0
	.uaword	0
	.uaword	.LBB210
	.uaword	.LBE210
	.uaword	.LBB236
	.uaword	.LBE236
	.uaword	.LBB239
	.uaword	.LBE239
	.uaword	0
	.uaword	0
	.uaword	.LBB214
	.uaword	.LBE214
	.uaword	.LBB237
	.uaword	.LBE237
	.uaword	.LBB238
	.uaword	.LBE238
	.uaword	.LBB240
	.uaword	.LBE240
	.uaword	.LBB241
	.uaword	.LBE241
	.uaword	.LBB242
	.uaword	.LBE242
	.uaword	.LBB243
	.uaword	.LBE243
	.uaword	0
	.uaword	0
	.uaword	.LFB568
	.uaword	.LFE568
	.uaword	.LFB569
	.uaword	.LFE569
	.uaword	.LFB570
	.uaword	.LFE570
	.uaword	.LFB571
	.uaword	.LFE571
	.uaword	.LFB572
	.uaword	.LFE572
	.uaword	.LFB573
	.uaword	.LFE573
	.uaword	.LFB574
	.uaword	.LFE574
	.uaword	.LFB575
	.uaword	.LFE575
	.uaword	.LFB576
	.uaword	.LFE576
	.uaword	.LFB577
	.uaword	.LFE577
	.uaword	.LFB578
	.uaword	.LFE578
	.uaword	.LFB579
	.uaword	.LFE579
	.uaword	.LFB580
	.uaword	.LFE580
	.uaword	.LFB581
	.uaword	.LFE581
	.uaword	.LFB582
	.uaword	.LFE582
	.uaword	0
	.uaword	0
.section .debug_line,"",@progbits
.Ldebug_line0:
.section .debug_str,"",@progbits
.LASF0:
	.string	"reserved_0"
.LASF4:
	.string	"reserved_1"
.LASF2:
	.string	"reserved_2"
.LASF3:
	.string	"reserved_4"
.LASF1:
	.string	"STMCAP63_32"
	.extern	HLD_UserInterface_run_10ms,STT_FUNC,0
	.extern	IfxScuCcu_getSourceFrequency,STT_FUNC,0
	.extern	HLD_GtmTomBeeper_run_1ms,STT_FUNC,0
	.extern	SDP_WheelSpeed_run_1ms,STT_FUNC,0
	.extern	SDP_SteeringAngle_run_1ms,STT_FUNC,0
	.extern	SDP_PedalBox_run_1ms,STT_FUNC,0
	.extern	HLD_GtmTim_run_1ms,STT_FUNC,0
	.extern	HLD_GtmTomBeeper_start,STT_FUNC,0
	.extern	Beep_pattern4,STT_OBJECT,-1
	.extern	IfxCpu_releaseMutex,STT_FUNC,0
	.extern	IfxCpu_acquireMutex,STT_FUNC,0
	.extern	Task_core1,STT_OBJECT,8
	.extern	SDP_WheelSpeed_init,STT_FUNC,0
	.extern	SDP_SteeringAngle_init,STT_FUNC,0
	.extern	SDP_PedalBox_init,STT_FUNC,0
	.extern	HLD_UserInterface_init,STT_FUNC,0
	.extern	HLD_Imu_init,STT_FUNC,0
	.extern	HLD_Multican_init,STT_FUNC,0
	.extern	HLD_Qspi_init,STT_FUNC,0
	.extern	HLD_GtmTim_init,STT_FUNC,0
	.extern	HLD_GtmTom_init,STT_FUNC,0
	.ident	"GCC: (HighTec Release HDP-v4.9.3.0-infineon-1.0-fb21a99) 4.9.4 build on 2019-06-07"
