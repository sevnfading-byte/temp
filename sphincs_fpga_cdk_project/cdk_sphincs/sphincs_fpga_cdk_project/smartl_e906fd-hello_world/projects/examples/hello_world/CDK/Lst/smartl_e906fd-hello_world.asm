
.//Obj/smartl_e906fd-hello_world.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <Reset_Handler>:
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
.option push
.option norelax
    la      gp, __global_pointer$
       0:	20000197          	auipc	gp,0x20000
       4:	0c418193          	addi	gp,gp,196 # 200000c4 <__global_pointer$>
.option pop
    la      a0, Default_Handler
       8:	00000517          	auipc	a0,0x0
       c:	17850513          	addi	a0,a0,376 # 180 <Default_Handler>
    ori     a0, a0, 3
      10:	00356513          	ori	a0,a0,3
    csrw    mtvec, a0
      14:	30551073          	csrw	mtvec,a0

    la      a0, __Vectors
      18:	20000517          	auipc	a0,0x20000
      1c:	fe850513          	addi	a0,a0,-24 # 20000000 <__Vectors>
    csrw    mtvt, a0
      20:	30751073          	csrw	mtvt,a0

    la      sp, g_top_irqstack
      24:	2000a117          	auipc	sp,0x2000a
      28:	0a410113          	addi	sp,sp,164 # 2000a0c8 <g_top_irqstack>
    csrw    mscratch, sp
      2c:	34011073          	csrw	mscratch,sp

    /* Load data section */
    la      a0, __erodata
      30:	00009517          	auipc	a0,0x9
      34:	81050513          	addi	a0,a0,-2032 # 8840 <__ctor_end__>
    la      a1, __data_start__
      38:	20000597          	auipc	a1,0x20000
      3c:	fc858593          	addi	a1,a1,-56 # 20000000 <__Vectors>
    la      a2, __data_end__
      40:	20000617          	auipc	a2,0x20000
      44:	08460613          	addi	a2,a2,132 # 200000c4 <__global_pointer$>
    bgeu    a1, a2, 2f
      48:	00c5fa63          	bgeu	a1,a2,5c <Reset_Handler+0x5c>
1:
    lw      t0, (a0)
      4c:	00052283          	lw	t0,0(a0)
    sw      t0, (a1)
      50:	0055a023          	sw	t0,0(a1)
    addi    a0, a0, 4
      54:	0511                	addi	a0,a0,4
    addi    a1, a1, 4
      56:	0591                	addi	a1,a1,4
    bltu    a1, a2, 1b
      58:	fec5eae3          	bltu	a1,a2,4c <Reset_Handler+0x4c>
2:

    /* Clear bss section */
    la      a0, __bss_start__
      5c:	20000517          	auipc	a0,0x20000
      60:	06c50513          	addi	a0,a0,108 # 200000c8 <__bss_start__>
    la      a1, __bss_end__
      64:	2000c597          	auipc	a1,0x2000c
      68:	98858593          	addi	a1,a1,-1656 # 2000b9ec <__bss_end__>
    bgeu    a0, a1, 2f
      6c:	00b57763          	bgeu	a0,a1,7a <Reset_Handler+0x7a>
1:
    sw      zero, (a0)
      70:	00052023          	sw	zero,0(a0)
    addi    a0, a0, 4
      74:	0511                	addi	a0,a0,4
    bltu    a0, a1, 1b
      76:	feb56de3          	bltu	a0,a1,70 <Reset_Handler+0x70>
2:

#ifndef __NO_SYSTEM_INIT
    jal     SystemInit
      7a:	3f1030ef          	jal	ra,3c6a <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      7e:	218020ef          	jal	ra,2296 <board_init>
#endif

    jal     main
      82:	47a060ef          	jal	ra,64fc <main>

00000086 <__exit>:

    .size   Reset_Handler, . - Reset_Handler

__exit:
    j      __exit
      86:	a001                	j	86 <__exit>
	...

000000c0 <trap>:

    .align  2
    .global trap
    .type   trap, %function
trap:
    la      t0, g_trap_sp
      c0:	2000a297          	auipc	t0,0x2000a
      c4:	30828293          	addi	t0,t0,776 # 2000a3c8 <g_trap_sp>
    addi    t0, t0, -132
      c8:	f7c28293          	addi	t0,t0,-132
    sw      x1, 0(t0)
      cc:	0012a023          	sw	ra,0(t0)
    sw      x2, 4(t0)
      d0:	0022a223          	sw	sp,4(t0)
    sw      x3, 8(t0)
      d4:	0032a423          	sw	gp,8(t0)
    sw      x4, 12(t0)
      d8:	0042a623          	sw	tp,12(t0)
    sw      x6, 20(t0)
      dc:	0062aa23          	sw	t1,20(t0)
    sw      x7, 24(t0)
      e0:	0072ac23          	sw	t2,24(t0)
    sw      x8, 28(t0)
      e4:	0082ae23          	sw	s0,28(t0)
    sw      x9, 32(t0)
      e8:	0292a023          	sw	s1,32(t0)
    sw      x10, 36(t0)
      ec:	02a2a223          	sw	a0,36(t0)
    sw      x11, 40(t0)
      f0:	02b2a423          	sw	a1,40(t0)
    sw      x12, 44(t0)
      f4:	02c2a623          	sw	a2,44(t0)
    sw      x13, 48(t0)
      f8:	02d2a823          	sw	a3,48(t0)
    sw      x14, 52(t0)
      fc:	02e2aa23          	sw	a4,52(t0)
    sw      x15, 56(t0)
     100:	02f2ac23          	sw	a5,56(t0)
    sw      x16, 60(t0)
     104:	0302ae23          	sw	a6,60(t0)
    sw      x17, 64(t0)
     108:	0512a023          	sw	a7,64(t0)
    sw      x18, 68(t0)
     10c:	0522a223          	sw	s2,68(t0)
    sw      x19, 72(t0)
     110:	0532a423          	sw	s3,72(t0)
    sw      x20, 76(t0)
     114:	0542a623          	sw	s4,76(t0)
    sw      x21, 80(t0)
     118:	0552a823          	sw	s5,80(t0)
    sw      x22, 84(t0)
     11c:	0562aa23          	sw	s6,84(t0)
    sw      x23, 88(t0)
     120:	0572ac23          	sw	s7,88(t0)
    sw      x24, 92(t0)
     124:	0582ae23          	sw	s8,92(t0)
    sw      x25, 96(t0)
     128:	0792a023          	sw	s9,96(t0)
    sw      x26, 100(t0)
     12c:	07a2a223          	sw	s10,100(t0)
    sw      x27, 104(t0)
     130:	07b2a423          	sw	s11,104(t0)
    sw      x28, 108(t0)
     134:	07c2a623          	sw	t3,108(t0)
    sw      x29, 112(t0)
     138:	07d2a823          	sw	t4,112(t0)
    sw      x30, 116(t0)
     13c:	07e2aa23          	sw	t5,116(t0)
    sw      x31, 120(t0)
     140:	07f2ac23          	sw	t6,120(t0)
    csrr    a0, mepc
     144:	34102573          	csrr	a0,mepc
    sw      a0, 124(t0)
     148:	06a2ae23          	sw	a0,124(t0)
    csrr    a0, mstatus
     14c:	30002573          	csrr	a0,mstatus
    sw      a0, 128(t0)
     150:	08a2a023          	sw	a0,128(t0)

    mv      a0, t0
     154:	8516                	mv	a0,t0
    lw      t0, -4(sp)
     156:	ffc12283          	lw	t0,-4(sp)
    mv      sp, a0
     15a:	812a                	mv	sp,a0
    sw      t0, 16(sp)
     15c:	c816                	sw	t0,16(sp)

    jal     trap_c
     15e:	3b9030ef          	jal	ra,3d16 <trap_c>
     162:	00000013          	nop
     166:	00000013          	nop
     16a:	00000013          	nop
     16e:	00000013          	nop
     172:	00000013          	nop
     176:	00000013          	nop
     17a:	00000013          	nop
     17e:	0001                	nop

00000180 <Default_Handler>:
    .weak   Default_Handler
    .global Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    /* Check for nmi */
    addi    sp, sp, -8
     180:	1161                	addi	sp,sp,-8
    sw      t0, 0x0(sp)
     182:	c016                	sw	t0,0(sp)
    sw      t1, 0x4(sp)
     184:	c21a                	sw	t1,4(sp)
    csrr    t0, mcause
     186:	342022f3          	csrr	t0,mcause
    andi    t0, t0, 0x3FF
     18a:	3ff2f293          	andi	t0,t0,1023
    li      t1, 24
     18e:	4361                	li	t1,24
    beq     t0, t1, .NMI_Handler
     190:	00628663          	beq	t0,t1,19c <.NMI_Handler>
    lw      t0, 0x0(sp)
     194:	4282                	lw	t0,0(sp)
    lw      t1, 0x4(sp)
     196:	4312                	lw	t1,4(sp)
    addi    sp, sp, 8
     198:	0121                	addi	sp,sp,8
    j      trap
     19a:	b71d                	j	c0 <trap>

0000019c <.NMI_Handler>:

.NMI_Handler:
    lw      t0, 0x0(sp)
     19c:	4282                	lw	t0,0(sp)
    lw      t1, 0x4(sp)
     19e:	4312                	lw	t1,4(sp)
    addi    sp, sp, 8
     1a0:	0121                	addi	sp,sp,8
    j       TIM4_NMIHandler
     1a2:	5be0306f          	j	3760 <TIM4_NMIHandler>
	...

000001de <__udivdi3>:
     1de:	88aa                	mv	a7,a0
     1e0:	87ae                	mv	a5,a1
     1e2:	8832                	mv	a6,a2
     1e4:	8536                	mv	a0,a3
     1e6:	8346                	mv	t1,a7
     1e8:	20069663          	bnez	a3,3f4 <__udivdi3+0x216>
     1ec:	00008697          	auipc	a3,0x8
     1f0:	24868693          	addi	a3,a3,584 # 8434 <__clz_tab>
     1f4:	0ac5ff63          	bgeu	a1,a2,2b2 <__udivdi3+0xd4>
     1f8:	6741                	lui	a4,0x10
     1fa:	0ae67563          	bgeu	a2,a4,2a4 <__udivdi3+0xc6>
     1fe:	0ff00713          	li	a4,255
     202:	00c73733          	sltu	a4,a4,a2
     206:	070e                	slli	a4,a4,0x3
     208:	00e65533          	srl	a0,a2,a4
     20c:	96aa                	add	a3,a3,a0
     20e:	0006c683          	lbu	a3,0(a3)
     212:	02000513          	li	a0,32
     216:	9736                	add	a4,a4,a3
     218:	40e506b3          	sub	a3,a0,a4
     21c:	00e50b63          	beq	a0,a4,232 <__udivdi3+0x54>
     220:	00d795b3          	sll	a1,a5,a3
     224:	00e8d733          	srl	a4,a7,a4
     228:	00d61833          	sll	a6,a2,a3
     22c:	8dd9                	or	a1,a1,a4
     22e:	00d89333          	sll	t1,a7,a3
     232:	01085893          	srli	a7,a6,0x10
     236:	0315d6b3          	divu	a3,a1,a7
     23a:	01081613          	slli	a2,a6,0x10
     23e:	8241                	srli	a2,a2,0x10
     240:	01035793          	srli	a5,t1,0x10
     244:	0315f733          	remu	a4,a1,a7
     248:	8536                	mv	a0,a3
     24a:	02d605b3          	mul	a1,a2,a3
     24e:	0742                	slli	a4,a4,0x10
     250:	8fd9                	or	a5,a5,a4
     252:	00b7fc63          	bgeu	a5,a1,26a <__udivdi3+0x8c>
     256:	97c2                	add	a5,a5,a6
     258:	fff68513          	addi	a0,a3,-1
     25c:	0107e763          	bltu	a5,a6,26a <__udivdi3+0x8c>
     260:	00b7f563          	bgeu	a5,a1,26a <__udivdi3+0x8c>
     264:	ffe68513          	addi	a0,a3,-2
     268:	97c2                	add	a5,a5,a6
     26a:	8f8d                	sub	a5,a5,a1
     26c:	0317f733          	remu	a4,a5,a7
     270:	0342                	slli	t1,t1,0x10
     272:	01035313          	srli	t1,t1,0x10
     276:	0317d7b3          	divu	a5,a5,a7
     27a:	0742                	slli	a4,a4,0x10
     27c:	00676333          	or	t1,a4,t1
     280:	02f606b3          	mul	a3,a2,a5
     284:	863e                	mv	a2,a5
     286:	00d37b63          	bgeu	t1,a3,29c <__udivdi3+0xbe>
     28a:	9342                	add	t1,t1,a6
     28c:	fff78613          	addi	a2,a5,-1
     290:	01036663          	bltu	t1,a6,29c <__udivdi3+0xbe>
     294:	00d37463          	bgeu	t1,a3,29c <__udivdi3+0xbe>
     298:	ffe78613          	addi	a2,a5,-2
     29c:	0542                	slli	a0,a0,0x10
     29e:	8d51                	or	a0,a0,a2
     2a0:	4581                	li	a1,0
     2a2:	a85d                	j	358 <__udivdi3+0x17a>
     2a4:	01000537          	lui	a0,0x1000
     2a8:	4741                	li	a4,16
     2aa:	f4a66fe3          	bltu	a2,a0,208 <__udivdi3+0x2a>
     2ae:	4761                	li	a4,24
     2b0:	bfa1                	j	208 <__udivdi3+0x2a>
     2b2:	e601                	bnez	a2,2ba <__udivdi3+0xdc>
     2b4:	4705                	li	a4,1
     2b6:	02c75833          	divu	a6,a4,a2
     2ba:	6741                	lui	a4,0x10
     2bc:	08e87f63          	bgeu	a6,a4,35a <__udivdi3+0x17c>
     2c0:	0ff00713          	li	a4,255
     2c4:	01077363          	bgeu	a4,a6,2ca <__udivdi3+0xec>
     2c8:	4521                	li	a0,8
     2ca:	00a85733          	srl	a4,a6,a0
     2ce:	96ba                	add	a3,a3,a4
     2d0:	0006c703          	lbu	a4,0(a3)
     2d4:	02000613          	li	a2,32
     2d8:	972a                	add	a4,a4,a0
     2da:	40e606b3          	sub	a3,a2,a4
     2de:	08e61563          	bne	a2,a4,368 <__udivdi3+0x18a>
     2e2:	410787b3          	sub	a5,a5,a6
     2e6:	4585                	li	a1,1
     2e8:	01085893          	srli	a7,a6,0x10
     2ec:	01081613          	slli	a2,a6,0x10
     2f0:	8241                	srli	a2,a2,0x10
     2f2:	01035713          	srli	a4,t1,0x10
     2f6:	0317f6b3          	remu	a3,a5,a7
     2fa:	0317d7b3          	divu	a5,a5,a7
     2fe:	06c2                	slli	a3,a3,0x10
     300:	8f55                	or	a4,a4,a3
     302:	02f60e33          	mul	t3,a2,a5
     306:	853e                	mv	a0,a5
     308:	01c77c63          	bgeu	a4,t3,320 <__udivdi3+0x142>
     30c:	9742                	add	a4,a4,a6
     30e:	fff78513          	addi	a0,a5,-1
     312:	01076763          	bltu	a4,a6,320 <__udivdi3+0x142>
     316:	01c77563          	bgeu	a4,t3,320 <__udivdi3+0x142>
     31a:	ffe78513          	addi	a0,a5,-2
     31e:	9742                	add	a4,a4,a6
     320:	41c70733          	sub	a4,a4,t3
     324:	031777b3          	remu	a5,a4,a7
     328:	0342                	slli	t1,t1,0x10
     32a:	01035313          	srli	t1,t1,0x10
     32e:	03175733          	divu	a4,a4,a7
     332:	07c2                	slli	a5,a5,0x10
     334:	0067e333          	or	t1,a5,t1
     338:	02e606b3          	mul	a3,a2,a4
     33c:	863a                	mv	a2,a4
     33e:	00d37b63          	bgeu	t1,a3,354 <__udivdi3+0x176>
     342:	9342                	add	t1,t1,a6
     344:	fff70613          	addi	a2,a4,-1 # ffff <__ctor_end__+0x77bf>
     348:	01036663          	bltu	t1,a6,354 <__udivdi3+0x176>
     34c:	00d37463          	bgeu	t1,a3,354 <__udivdi3+0x176>
     350:	ffe70613          	addi	a2,a4,-2
     354:	0542                	slli	a0,a0,0x10
     356:	8d51                	or	a0,a0,a2
     358:	8082                	ret
     35a:	01000737          	lui	a4,0x1000
     35e:	4541                	li	a0,16
     360:	f6e865e3          	bltu	a6,a4,2ca <__udivdi3+0xec>
     364:	4561                	li	a0,24
     366:	b795                	j	2ca <__udivdi3+0xec>
     368:	00d81833          	sll	a6,a6,a3
     36c:	00e7d533          	srl	a0,a5,a4
     370:	00d89333          	sll	t1,a7,a3
     374:	00d797b3          	sll	a5,a5,a3
     378:	00e8d733          	srl	a4,a7,a4
     37c:	01085893          	srli	a7,a6,0x10
     380:	00f76633          	or	a2,a4,a5
     384:	03157733          	remu	a4,a0,a7
     388:	01081793          	slli	a5,a6,0x10
     38c:	83c1                	srli	a5,a5,0x10
     38e:	01065593          	srli	a1,a2,0x10
     392:	03155533          	divu	a0,a0,a7
     396:	0742                	slli	a4,a4,0x10
     398:	8f4d                	or	a4,a4,a1
     39a:	02a786b3          	mul	a3,a5,a0
     39e:	85aa                	mv	a1,a0
     3a0:	00d77c63          	bgeu	a4,a3,3b8 <__udivdi3+0x1da>
     3a4:	9742                	add	a4,a4,a6
     3a6:	fff50593          	addi	a1,a0,-1 # ffffff <__min_heap_size+0xfeffff>
     3aa:	01076763          	bltu	a4,a6,3b8 <__udivdi3+0x1da>
     3ae:	00d77563          	bgeu	a4,a3,3b8 <__udivdi3+0x1da>
     3b2:	ffe50593          	addi	a1,a0,-2
     3b6:	9742                	add	a4,a4,a6
     3b8:	40d706b3          	sub	a3,a4,a3
     3bc:	0316f733          	remu	a4,a3,a7
     3c0:	0642                	slli	a2,a2,0x10
     3c2:	8241                	srli	a2,a2,0x10
     3c4:	0316d6b3          	divu	a3,a3,a7
     3c8:	0742                	slli	a4,a4,0x10
     3ca:	02d78533          	mul	a0,a5,a3
     3ce:	00c767b3          	or	a5,a4,a2
     3d2:	8736                	mv	a4,a3
     3d4:	00a7fc63          	bgeu	a5,a0,3ec <__udivdi3+0x20e>
     3d8:	97c2                	add	a5,a5,a6
     3da:	fff68713          	addi	a4,a3,-1
     3de:	0107e763          	bltu	a5,a6,3ec <__udivdi3+0x20e>
     3e2:	00a7f563          	bgeu	a5,a0,3ec <__udivdi3+0x20e>
     3e6:	ffe68713          	addi	a4,a3,-2
     3ea:	97c2                	add	a5,a5,a6
     3ec:	05c2                	slli	a1,a1,0x10
     3ee:	8f89                	sub	a5,a5,a0
     3f0:	8dd9                	or	a1,a1,a4
     3f2:	bddd                	j	2e8 <__udivdi3+0x10a>
     3f4:	14d5e263          	bltu	a1,a3,538 <__udivdi3+0x35a>
     3f8:	6741                	lui	a4,0x10
     3fa:	02e6ff63          	bgeu	a3,a4,438 <__udivdi3+0x25a>
     3fe:	0ff00713          	li	a4,255
     402:	00d735b3          	sltu	a1,a4,a3
     406:	058e                	slli	a1,a1,0x3
     408:	00b6d533          	srl	a0,a3,a1
     40c:	00008717          	auipc	a4,0x8
     410:	02870713          	addi	a4,a4,40 # 8434 <__clz_tab>
     414:	972a                	add	a4,a4,a0
     416:	00074703          	lbu	a4,0(a4)
     41a:	02000513          	li	a0,32
     41e:	972e                	add	a4,a4,a1
     420:	40e505b3          	sub	a1,a0,a4
     424:	02e51163          	bne	a0,a4,446 <__udivdi3+0x268>
     428:	4505                	li	a0,1
     42a:	f2f6e7e3          	bltu	a3,a5,358 <__udivdi3+0x17a>
     42e:	00c8b533          	sltu	a0,a7,a2
     432:	00154513          	xori	a0,a0,1
     436:	b70d                	j	358 <__udivdi3+0x17a>
     438:	01000737          	lui	a4,0x1000
     43c:	45c1                	li	a1,16
     43e:	fce6e5e3          	bltu	a3,a4,408 <__udivdi3+0x22a>
     442:	45e1                	li	a1,24
     444:	b7d1                	j	408 <__udivdi3+0x22a>
     446:	00e65833          	srl	a6,a2,a4
     44a:	00b696b3          	sll	a3,a3,a1
     44e:	00d86833          	or	a6,a6,a3
     452:	00e7d333          	srl	t1,a5,a4
     456:	01085e93          	srli	t4,a6,0x10
     45a:	03d376b3          	remu	a3,t1,t4
     45e:	00b797b3          	sll	a5,a5,a1
     462:	00e8d733          	srl	a4,a7,a4
     466:	00b61e33          	sll	t3,a2,a1
     46a:	00f76633          	or	a2,a4,a5
     46e:	01081793          	slli	a5,a6,0x10
     472:	83c1                	srli	a5,a5,0x10
     474:	01065713          	srli	a4,a2,0x10
     478:	03d35333          	divu	t1,t1,t4
     47c:	06c2                	slli	a3,a3,0x10
     47e:	8f55                	or	a4,a4,a3
     480:	02678f33          	mul	t5,a5,t1
     484:	851a                	mv	a0,t1
     486:	01e77c63          	bgeu	a4,t5,49e <__udivdi3+0x2c0>
     48a:	9742                	add	a4,a4,a6
     48c:	fff30513          	addi	a0,t1,-1
     490:	01076763          	bltu	a4,a6,49e <__udivdi3+0x2c0>
     494:	01e77563          	bgeu	a4,t5,49e <__udivdi3+0x2c0>
     498:	ffe30513          	addi	a0,t1,-2
     49c:	9742                	add	a4,a4,a6
     49e:	41e70733          	sub	a4,a4,t5
     4a2:	03d776b3          	remu	a3,a4,t4
     4a6:	03d75733          	divu	a4,a4,t4
     4aa:	06c2                	slli	a3,a3,0x10
     4ac:	02e78333          	mul	t1,a5,a4
     4b0:	01061793          	slli	a5,a2,0x10
     4b4:	83c1                	srli	a5,a5,0x10
     4b6:	8fd5                	or	a5,a5,a3
     4b8:	863a                	mv	a2,a4
     4ba:	0067fc63          	bgeu	a5,t1,4d2 <__udivdi3+0x2f4>
     4be:	97c2                	add	a5,a5,a6
     4c0:	fff70613          	addi	a2,a4,-1 # ffffff <__min_heap_size+0xfeffff>
     4c4:	0107e763          	bltu	a5,a6,4d2 <__udivdi3+0x2f4>
     4c8:	0067f563          	bgeu	a5,t1,4d2 <__udivdi3+0x2f4>
     4cc:	ffe70613          	addi	a2,a4,-2
     4d0:	97c2                	add	a5,a5,a6
     4d2:	0542                	slli	a0,a0,0x10
     4d4:	6ec1                	lui	t4,0x10
     4d6:	8d51                	or	a0,a0,a2
     4d8:	fffe8693          	addi	a3,t4,-1 # ffff <__ctor_end__+0x77bf>
     4dc:	010e5613          	srli	a2,t3,0x10
     4e0:	01055813          	srli	a6,a0,0x10
     4e4:	406787b3          	sub	a5,a5,t1
     4e8:	00d57333          	and	t1,a0,a3
     4ec:	00de76b3          	and	a3,t3,a3
     4f0:	02d30e33          	mul	t3,t1,a3
     4f4:	02d806b3          	mul	a3,a6,a3
     4f8:	010e5713          	srli	a4,t3,0x10
     4fc:	02c30333          	mul	t1,t1,a2
     500:	9336                	add	t1,t1,a3
     502:	971a                	add	a4,a4,t1
     504:	02c80833          	mul	a6,a6,a2
     508:	00d77363          	bgeu	a4,a3,50e <__udivdi3+0x330>
     50c:	9876                	add	a6,a6,t4
     50e:	01075693          	srli	a3,a4,0x10
     512:	9836                	add	a6,a6,a3
     514:	0307e063          	bltu	a5,a6,534 <__udivdi3+0x356>
     518:	d90794e3          	bne	a5,a6,2a0 <__udivdi3+0xc2>
     51c:	67c1                	lui	a5,0x10
     51e:	17fd                	addi	a5,a5,-1
     520:	8f7d                	and	a4,a4,a5
     522:	0742                	slli	a4,a4,0x10
     524:	00fe7e33          	and	t3,t3,a5
     528:	00b898b3          	sll	a7,a7,a1
     52c:	9772                	add	a4,a4,t3
     52e:	4581                	li	a1,0
     530:	e2e8f4e3          	bgeu	a7,a4,358 <__udivdi3+0x17a>
     534:	157d                	addi	a0,a0,-1
     536:	b3ad                	j	2a0 <__udivdi3+0xc2>
     538:	4581                	li	a1,0
     53a:	4501                	li	a0,0
     53c:	bd31                	j	358 <__udivdi3+0x17a>

0000053e <__umoddi3>:
     53e:	832a                	mv	t1,a0
     540:	8832                	mv	a6,a2
     542:	87b6                	mv	a5,a3
     544:	872e                	mv	a4,a1
     546:	1c069563          	bnez	a3,710 <__umoddi3+0x1d2>
     54a:	00008697          	auipc	a3,0x8
     54e:	eea68693          	addi	a3,a3,-278 # 8434 <__clz_tab>
     552:	0ac5f663          	bgeu	a1,a2,5fe <__umoddi3+0xc0>
     556:	68c1                	lui	a7,0x10
     558:	09167c63          	bgeu	a2,a7,5f0 <__umoddi3+0xb2>
     55c:	0ff00893          	li	a7,255
     560:	00c8f363          	bgeu	a7,a2,566 <__umoddi3+0x28>
     564:	47a1                	li	a5,8
     566:	00f658b3          	srl	a7,a2,a5
     56a:	96c6                	add	a3,a3,a7
     56c:	0006c683          	lbu	a3,0(a3)
     570:	97b6                	add	a5,a5,a3
     572:	02000693          	li	a3,32
     576:	40f688b3          	sub	a7,a3,a5
     57a:	00f68c63          	beq	a3,a5,592 <__umoddi3+0x54>
     57e:	011595b3          	sll	a1,a1,a7
     582:	00f357b3          	srl	a5,t1,a5
     586:	01161833          	sll	a6,a2,a7
     58a:	00b7e733          	or	a4,a5,a1
     58e:	01131533          	sll	a0,t1,a7
     592:	01085593          	srli	a1,a6,0x10
     596:	02b777b3          	remu	a5,a4,a1
     59a:	01081613          	slli	a2,a6,0x10
     59e:	8241                	srli	a2,a2,0x10
     5a0:	01055693          	srli	a3,a0,0x10
     5a4:	02b75733          	divu	a4,a4,a1
     5a8:	07c2                	slli	a5,a5,0x10
     5aa:	8edd                	or	a3,a3,a5
     5ac:	02e60733          	mul	a4,a2,a4
     5b0:	00e6f863          	bgeu	a3,a4,5c0 <__umoddi3+0x82>
     5b4:	96c2                	add	a3,a3,a6
     5b6:	0106e563          	bltu	a3,a6,5c0 <__umoddi3+0x82>
     5ba:	00e6f363          	bgeu	a3,a4,5c0 <__umoddi3+0x82>
     5be:	96c2                	add	a3,a3,a6
     5c0:	8e99                	sub	a3,a3,a4
     5c2:	02b6f7b3          	remu	a5,a3,a1
     5c6:	0542                	slli	a0,a0,0x10
     5c8:	8141                	srli	a0,a0,0x10
     5ca:	02b6d6b3          	divu	a3,a3,a1
     5ce:	07c2                	slli	a5,a5,0x10
     5d0:	8d5d                	or	a0,a0,a5
     5d2:	02d606b3          	mul	a3,a2,a3
     5d6:	00d57863          	bgeu	a0,a3,5e6 <__umoddi3+0xa8>
     5da:	9542                	add	a0,a0,a6
     5dc:	01056563          	bltu	a0,a6,5e6 <__umoddi3+0xa8>
     5e0:	00d57363          	bgeu	a0,a3,5e6 <__umoddi3+0xa8>
     5e4:	9542                	add	a0,a0,a6
     5e6:	8d15                	sub	a0,a0,a3
     5e8:	01155533          	srl	a0,a0,a7
     5ec:	4581                	li	a1,0
     5ee:	8082                	ret
     5f0:	010008b7          	lui	a7,0x1000
     5f4:	47c1                	li	a5,16
     5f6:	f71668e3          	bltu	a2,a7,566 <__umoddi3+0x28>
     5fa:	47e1                	li	a5,24
     5fc:	b7ad                	j	566 <__umoddi3+0x28>
     5fe:	e601                	bnez	a2,606 <__umoddi3+0xc8>
     600:	4705                	li	a4,1
     602:	02c75833          	divu	a6,a4,a2
     606:	6741                	lui	a4,0x10
     608:	08e87363          	bgeu	a6,a4,68e <__umoddi3+0x150>
     60c:	0ff00713          	li	a4,255
     610:	01077363          	bgeu	a4,a6,616 <__umoddi3+0xd8>
     614:	47a1                	li	a5,8
     616:	00f85733          	srl	a4,a6,a5
     61a:	96ba                	add	a3,a3,a4
     61c:	0006c603          	lbu	a2,0(a3)
     620:	963e                	add	a2,a2,a5
     622:	02000793          	li	a5,32
     626:	40c788b3          	sub	a7,a5,a2
     62a:	06c79963          	bne	a5,a2,69c <__umoddi3+0x15e>
     62e:	410585b3          	sub	a1,a1,a6
     632:	01085693          	srli	a3,a6,0x10
     636:	01081793          	slli	a5,a6,0x10
     63a:	83c1                	srli	a5,a5,0x10
     63c:	01055613          	srli	a2,a0,0x10
     640:	02d5f733          	remu	a4,a1,a3
     644:	02d5d5b3          	divu	a1,a1,a3
     648:	0742                	slli	a4,a4,0x10
     64a:	8f51                	or	a4,a4,a2
     64c:	02b785b3          	mul	a1,a5,a1
     650:	00b77863          	bgeu	a4,a1,660 <__umoddi3+0x122>
     654:	9742                	add	a4,a4,a6
     656:	01076563          	bltu	a4,a6,660 <__umoddi3+0x122>
     65a:	00b77363          	bgeu	a4,a1,660 <__umoddi3+0x122>
     65e:	9742                	add	a4,a4,a6
     660:	40b705b3          	sub	a1,a4,a1
     664:	02d5f733          	remu	a4,a1,a3
     668:	0542                	slli	a0,a0,0x10
     66a:	8141                	srli	a0,a0,0x10
     66c:	02d5d5b3          	divu	a1,a1,a3
     670:	02b785b3          	mul	a1,a5,a1
     674:	01071793          	slli	a5,a4,0x10
     678:	8d5d                	or	a0,a0,a5
     67a:	00b57863          	bgeu	a0,a1,68a <__umoddi3+0x14c>
     67e:	9542                	add	a0,a0,a6
     680:	01056563          	bltu	a0,a6,68a <__umoddi3+0x14c>
     684:	00b57363          	bgeu	a0,a1,68a <__umoddi3+0x14c>
     688:	9542                	add	a0,a0,a6
     68a:	8d0d                	sub	a0,a0,a1
     68c:	bfb1                	j	5e8 <__umoddi3+0xaa>
     68e:	01000737          	lui	a4,0x1000
     692:	47c1                	li	a5,16
     694:	f8e861e3          	bltu	a6,a4,616 <__umoddi3+0xd8>
     698:	47e1                	li	a5,24
     69a:	bfb5                	j	616 <__umoddi3+0xd8>
     69c:	01181833          	sll	a6,a6,a7
     6a0:	00c5d6b3          	srl	a3,a1,a2
     6a4:	01085793          	srli	a5,a6,0x10
     6a8:	02f6f733          	remu	a4,a3,a5
     6ac:	011595b3          	sll	a1,a1,a7
     6b0:	00c35633          	srl	a2,t1,a2
     6b4:	8e4d                	or	a2,a2,a1
     6b6:	01081593          	slli	a1,a6,0x10
     6ba:	81c1                	srli	a1,a1,0x10
     6bc:	01131533          	sll	a0,t1,a7
     6c0:	01065313          	srli	t1,a2,0x10
     6c4:	02f6d6b3          	divu	a3,a3,a5
     6c8:	0742                	slli	a4,a4,0x10
     6ca:	00676733          	or	a4,a4,t1
     6ce:	02d586b3          	mul	a3,a1,a3
     6d2:	00d77863          	bgeu	a4,a3,6e2 <__umoddi3+0x1a4>
     6d6:	9742                	add	a4,a4,a6
     6d8:	01076563          	bltu	a4,a6,6e2 <__umoddi3+0x1a4>
     6dc:	00d77363          	bgeu	a4,a3,6e2 <__umoddi3+0x1a4>
     6e0:	9742                	add	a4,a4,a6
     6e2:	40d706b3          	sub	a3,a4,a3
     6e6:	02f6f733          	remu	a4,a3,a5
     6ea:	0642                	slli	a2,a2,0x10
     6ec:	8241                	srli	a2,a2,0x10
     6ee:	02f6d6b3          	divu	a3,a3,a5
     6f2:	0742                	slli	a4,a4,0x10
     6f4:	02d586b3          	mul	a3,a1,a3
     6f8:	00c765b3          	or	a1,a4,a2
     6fc:	00d5f863          	bgeu	a1,a3,70c <__umoddi3+0x1ce>
     700:	95c2                	add	a1,a1,a6
     702:	0105e563          	bltu	a1,a6,70c <__umoddi3+0x1ce>
     706:	00d5f363          	bgeu	a1,a3,70c <__umoddi3+0x1ce>
     70a:	95c2                	add	a1,a1,a6
     70c:	8d95                	sub	a1,a1,a3
     70e:	b715                	j	632 <__umoddi3+0xf4>
     710:	ecd5efe3          	bltu	a1,a3,5ee <__umoddi3+0xb0>
     714:	67c1                	lui	a5,0x10
     716:	04f6f463          	bgeu	a3,a5,75e <__umoddi3+0x220>
     71a:	0ff00893          	li	a7,255
     71e:	00d8b7b3          	sltu	a5,a7,a3
     722:	078e                	slli	a5,a5,0x3
     724:	00f6d8b3          	srl	a7,a3,a5
     728:	00008817          	auipc	a6,0x8
     72c:	d0c80813          	addi	a6,a6,-756 # 8434 <__clz_tab>
     730:	9846                	add	a6,a6,a7
     732:	00084883          	lbu	a7,0(a6)
     736:	98be                	add	a7,a7,a5
     738:	02000793          	li	a5,32
     73c:	41178833          	sub	a6,a5,a7
     740:	03179663          	bne	a5,a7,76c <__umoddi3+0x22e>
     744:	00b6e463          	bltu	a3,a1,74c <__umoddi3+0x20e>
     748:	00c36963          	bltu	t1,a2,75a <__umoddi3+0x21c>
     74c:	40c30533          	sub	a0,t1,a2
     750:	8d95                	sub	a1,a1,a3
     752:	00a33733          	sltu	a4,t1,a0
     756:	40e58733          	sub	a4,a1,a4
     75a:	85ba                	mv	a1,a4
     75c:	bd49                	j	5ee <__umoddi3+0xb0>
     75e:	01000837          	lui	a6,0x1000
     762:	47c1                	li	a5,16
     764:	fd06e0e3          	bltu	a3,a6,724 <__umoddi3+0x1e6>
     768:	47e1                	li	a5,24
     76a:	bf6d                	j	724 <__umoddi3+0x1e6>
     76c:	011657b3          	srl	a5,a2,a7
     770:	010696b3          	sll	a3,a3,a6
     774:	00d7ee33          	or	t3,a5,a3
     778:	0115d733          	srl	a4,a1,a7
     77c:	010e5f13          	srli	t5,t3,0x10
     780:	01061eb3          	sll	t4,a2,a6
     784:	03e77633          	remu	a2,a4,t5
     788:	010595b3          	sll	a1,a1,a6
     78c:	011357b3          	srl	a5,t1,a7
     790:	8fcd                	or	a5,a5,a1
     792:	010e1593          	slli	a1,t3,0x10
     796:	81c1                	srli	a1,a1,0x10
     798:	01031533          	sll	a0,t1,a6
     79c:	0107d693          	srli	a3,a5,0x10
     7a0:	03e75733          	divu	a4,a4,t5
     7a4:	0642                	slli	a2,a2,0x10
     7a6:	8ed1                	or	a3,a3,a2
     7a8:	02e58333          	mul	t1,a1,a4
     7ac:	863a                	mv	a2,a4
     7ae:	0066fc63          	bgeu	a3,t1,7c6 <__umoddi3+0x288>
     7b2:	96f2                	add	a3,a3,t3
     7b4:	fff70613          	addi	a2,a4,-1 # ffffff <__min_heap_size+0xfeffff>
     7b8:	01c6e763          	bltu	a3,t3,7c6 <__umoddi3+0x288>
     7bc:	0066f563          	bgeu	a3,t1,7c6 <__umoddi3+0x288>
     7c0:	ffe70613          	addi	a2,a4,-2
     7c4:	96f2                	add	a3,a3,t3
     7c6:	406686b3          	sub	a3,a3,t1
     7ca:	03e6f333          	remu	t1,a3,t5
     7ce:	03e6d6b3          	divu	a3,a3,t5
     7d2:	0342                	slli	t1,t1,0x10
     7d4:	02d58733          	mul	a4,a1,a3
     7d8:	01079593          	slli	a1,a5,0x10
     7dc:	81c1                	srli	a1,a1,0x10
     7de:	00b365b3          	or	a1,t1,a1
     7e2:	87b6                	mv	a5,a3
     7e4:	00e5fc63          	bgeu	a1,a4,7fc <__umoddi3+0x2be>
     7e8:	95f2                	add	a1,a1,t3
     7ea:	fff68793          	addi	a5,a3,-1
     7ee:	01c5e763          	bltu	a1,t3,7fc <__umoddi3+0x2be>
     7f2:	00e5f563          	bgeu	a1,a4,7fc <__umoddi3+0x2be>
     7f6:	ffe68793          	addi	a5,a3,-2
     7fa:	95f2                	add	a1,a1,t3
     7fc:	0642                	slli	a2,a2,0x10
     7fe:	6f41                	lui	t5,0x10
     800:	8e5d                	or	a2,a2,a5
     802:	ffff0693          	addi	a3,t5,-1 # ffff <__ctor_end__+0x77bf>
     806:	00d67333          	and	t1,a2,a3
     80a:	8d99                	sub	a1,a1,a4
     80c:	8241                	srli	a2,a2,0x10
     80e:	010ed713          	srli	a4,t4,0x10
     812:	00def6b3          	and	a3,t4,a3
     816:	02d307b3          	mul	a5,t1,a3
     81a:	02d606b3          	mul	a3,a2,a3
     81e:	02e30333          	mul	t1,t1,a4
     822:	02e60633          	mul	a2,a2,a4
     826:	9336                	add	t1,t1,a3
     828:	0107d713          	srli	a4,a5,0x10
     82c:	971a                	add	a4,a4,t1
     82e:	00d77363          	bgeu	a4,a3,834 <__umoddi3+0x2f6>
     832:	967a                	add	a2,a2,t5
     834:	01075693          	srli	a3,a4,0x10
     838:	96b2                	add	a3,a3,a2
     83a:	6641                	lui	a2,0x10
     83c:	167d                	addi	a2,a2,-1
     83e:	8f71                	and	a4,a4,a2
     840:	0742                	slli	a4,a4,0x10
     842:	8ff1                	and	a5,a5,a2
     844:	97ba                	add	a5,a5,a4
     846:	00d5e663          	bltu	a1,a3,852 <__umoddi3+0x314>
     84a:	00d59b63          	bne	a1,a3,860 <__umoddi3+0x322>
     84e:	00f57963          	bgeu	a0,a5,860 <__umoddi3+0x322>
     852:	41d78633          	sub	a2,a5,t4
     856:	00c7b7b3          	sltu	a5,a5,a2
     85a:	97f2                	add	a5,a5,t3
     85c:	8e9d                	sub	a3,a3,a5
     85e:	87b2                	mv	a5,a2
     860:	40f507b3          	sub	a5,a0,a5
     864:	00f53533          	sltu	a0,a0,a5
     868:	8d95                	sub	a1,a1,a3
     86a:	8d89                	sub	a1,a1,a0
     86c:	011598b3          	sll	a7,a1,a7
     870:	0107d533          	srl	a0,a5,a6
     874:	00a8e533          	or	a0,a7,a0
     878:	0105d5b3          	srl	a1,a1,a6
     87c:	bb8d                	j	5ee <__umoddi3+0xb0>

0000087e <__adddf3>:
     87e:	00100837          	lui	a6,0x100
     882:	187d                	addi	a6,a6,-1
     884:	1101                	addi	sp,sp,-32
     886:	00b877b3          	and	a5,a6,a1
     88a:	0145d713          	srli	a4,a1,0x14
     88e:	00d87833          	and	a6,a6,a3
     892:	0146d313          	srli	t1,a3,0x14
     896:	cc22                	sw	s0,24(sp)
     898:	078e                	slli	a5,a5,0x3
     89a:	7ff77413          	andi	s0,a4,2047
     89e:	01d55713          	srli	a4,a0,0x1d
     8a2:	080e                	slli	a6,a6,0x3
     8a4:	ca26                	sw	s1,20(sp)
     8a6:	8fd9                	or	a5,a5,a4
     8a8:	01f5d493          	srli	s1,a1,0x1f
     8ac:	01d65713          	srli	a4,a2,0x1d
     8b0:	7ff37313          	andi	t1,t1,2047
     8b4:	ce06                	sw	ra,28(sp)
     8b6:	c84a                	sw	s2,16(sp)
     8b8:	c64e                	sw	s3,12(sp)
     8ba:	82fd                	srli	a3,a3,0x1f
     8bc:	01076733          	or	a4,a4,a6
     8c0:	00351593          	slli	a1,a0,0x3
     8c4:	060e                	slli	a2,a2,0x3
     8c6:	40640833          	sub	a6,s0,t1
     8ca:	22d49863          	bne	s1,a3,afa <__adddf3+0x27c>
     8ce:	0f005363          	blez	a6,9b4 <__adddf3+0x136>
     8d2:	02031863          	bnez	t1,902 <__adddf3+0x84>
     8d6:	00c766b3          	or	a3,a4,a2
     8da:	58068763          	beqz	a3,e68 <__adddf3+0x5ea>
     8de:	fff80513          	addi	a0,a6,-1 # fffff <__min_heap_size+0xeffff>
     8e2:	e909                	bnez	a0,8f4 <__adddf3+0x76>
     8e4:	962e                	add	a2,a2,a1
     8e6:	00b63533          	sltu	a0,a2,a1
     8ea:	97ba                	add	a5,a5,a4
     8ec:	97aa                	add	a5,a5,a0
     8ee:	85b2                	mv	a1,a2
     8f0:	4405                	li	s0,1
     8f2:	a8b9                	j	950 <__adddf3+0xd2>
     8f4:	7ff00693          	li	a3,2047
     8f8:	00d81d63          	bne	a6,a3,912 <__adddf3+0x94>
     8fc:	7ff00413          	li	s0,2047
     900:	a24d                	j	aa2 <__adddf3+0x224>
     902:	7ff00693          	li	a3,2047
     906:	18d40e63          	beq	s0,a3,aa2 <__adddf3+0x224>
     90a:	008006b7          	lui	a3,0x800
     90e:	8f55                	or	a4,a4,a3
     910:	8542                	mv	a0,a6
     912:	03800693          	li	a3,56
     916:	08a6cb63          	blt	a3,a0,9ac <__adddf3+0x12e>
     91a:	46fd                	li	a3,31
     91c:	06a6c263          	blt	a3,a0,980 <__adddf3+0x102>
     920:	02000813          	li	a6,32
     924:	40a80833          	sub	a6,a6,a0
     928:	010716b3          	sll	a3,a4,a6
     92c:	00a658b3          	srl	a7,a2,a0
     930:	01061633          	sll	a2,a2,a6
     934:	0116e6b3          	or	a3,a3,a7
     938:	00c03633          	snez	a2,a2
     93c:	8e55                	or	a2,a2,a3
     93e:	00a75733          	srl	a4,a4,a0
     942:	962e                	add	a2,a2,a1
     944:	00b63533          	sltu	a0,a2,a1
     948:	973e                	add	a4,a4,a5
     94a:	00a707b3          	add	a5,a4,a0
     94e:	85b2                	mv	a1,a2
     950:	00800737          	lui	a4,0x800
     954:	8f7d                	and	a4,a4,a5
     956:	14070663          	beqz	a4,aa2 <__adddf3+0x224>
     95a:	0405                	addi	s0,s0,1
     95c:	7ff00713          	li	a4,2047
     960:	4ae40163          	beq	s0,a4,e02 <__adddf3+0x584>
     964:	ff800737          	lui	a4,0xff800
     968:	177d                	addi	a4,a4,-1
     96a:	8ff9                	and	a5,a5,a4
     96c:	0015f513          	andi	a0,a1,1
     970:	0015d713          	srli	a4,a1,0x1
     974:	8d59                	or	a0,a0,a4
     976:	01f79593          	slli	a1,a5,0x1f
     97a:	8dc9                	or	a1,a1,a0
     97c:	8385                	srli	a5,a5,0x1
     97e:	a215                	j	aa2 <__adddf3+0x224>
     980:	fe050693          	addi	a3,a0,-32
     984:	02000893          	li	a7,32
     988:	00d756b3          	srl	a3,a4,a3
     98c:	4801                	li	a6,0
     98e:	01150863          	beq	a0,a7,99e <__adddf3+0x120>
     992:	04000813          	li	a6,64
     996:	40a80533          	sub	a0,a6,a0
     99a:	00a71833          	sll	a6,a4,a0
     99e:	00c86633          	or	a2,a6,a2
     9a2:	00c03633          	snez	a2,a2
     9a6:	8e55                	or	a2,a2,a3
     9a8:	4701                	li	a4,0
     9aa:	bf61                	j	942 <__adddf3+0xc4>
     9ac:	8e59                	or	a2,a2,a4
     9ae:	00c03633          	snez	a2,a2
     9b2:	bfdd                	j	9a8 <__adddf3+0x12a>
     9b4:	0a080b63          	beqz	a6,a6a <__adddf3+0x1ec>
     9b8:	40830533          	sub	a0,t1,s0
     9bc:	e40d                	bnez	s0,9e6 <__adddf3+0x168>
     9be:	00b7e6b3          	or	a3,a5,a1
     9c2:	42068763          	beqz	a3,df0 <__adddf3+0x572>
     9c6:	fff50693          	addi	a3,a0,-1
     9ca:	e699                	bnez	a3,9d8 <__adddf3+0x15a>
     9cc:	95b2                	add	a1,a1,a2
     9ce:	97ba                	add	a5,a5,a4
     9d0:	00c5b633          	sltu	a2,a1,a2
     9d4:	97b2                	add	a5,a5,a2
     9d6:	bf29                	j	8f0 <__adddf3+0x72>
     9d8:	7ff00813          	li	a6,2047
     9dc:	01051d63          	bne	a0,a6,9f6 <__adddf3+0x178>
     9e0:	87ba                	mv	a5,a4
     9e2:	85b2                	mv	a1,a2
     9e4:	bf21                	j	8fc <__adddf3+0x7e>
     9e6:	7ff00693          	li	a3,2047
     9ea:	fed30be3          	beq	t1,a3,9e0 <__adddf3+0x162>
     9ee:	008006b7          	lui	a3,0x800
     9f2:	8fd5                	or	a5,a5,a3
     9f4:	86aa                	mv	a3,a0
     9f6:	03800513          	li	a0,56
     9fa:	06d54363          	blt	a0,a3,a60 <__adddf3+0x1e2>
     9fe:	457d                	li	a0,31
     a00:	02d54b63          	blt	a0,a3,a36 <__adddf3+0x1b8>
     a04:	02000813          	li	a6,32
     a08:	40d80833          	sub	a6,a6,a3
     a0c:	01079533          	sll	a0,a5,a6
     a10:	00d5d8b3          	srl	a7,a1,a3
     a14:	010595b3          	sll	a1,a1,a6
     a18:	01156533          	or	a0,a0,a7
     a1c:	00b035b3          	snez	a1,a1
     a20:	8d4d                	or	a0,a0,a1
     a22:	00d7d7b3          	srl	a5,a5,a3
     a26:	00c505b3          	add	a1,a0,a2
     a2a:	97ba                	add	a5,a5,a4
     a2c:	00c5b633          	sltu	a2,a1,a2
     a30:	97b2                	add	a5,a5,a2
     a32:	841a                	mv	s0,t1
     a34:	bf31                	j	950 <__adddf3+0xd2>
     a36:	fe068513          	addi	a0,a3,-32 # 7fffe0 <__min_heap_size+0x7effe0>
     a3a:	02000893          	li	a7,32
     a3e:	00a7d833          	srl	a6,a5,a0
     a42:	4501                	li	a0,0
     a44:	01168763          	beq	a3,a7,a52 <__adddf3+0x1d4>
     a48:	04000513          	li	a0,64
     a4c:	8d15                	sub	a0,a0,a3
     a4e:	00a79533          	sll	a0,a5,a0
     a52:	8d4d                	or	a0,a0,a1
     a54:	00a03533          	snez	a0,a0
     a58:	00a86533          	or	a0,a6,a0
     a5c:	4781                	li	a5,0
     a5e:	b7e1                	j	a26 <__adddf3+0x1a8>
     a60:	00b7e533          	or	a0,a5,a1
     a64:	00a03533          	snez	a0,a0
     a68:	bfd5                	j	a5c <__adddf3+0x1de>
     a6a:	00140693          	addi	a3,s0,1
     a6e:	7fe6f513          	andi	a0,a3,2046
     a72:	e13d                	bnez	a0,ad8 <__adddf3+0x25a>
     a74:	00b7e6b3          	or	a3,a5,a1
     a78:	e429                	bnez	s0,ac2 <__adddf3+0x244>
     a7a:	36068f63          	beqz	a3,df8 <__adddf3+0x57a>
     a7e:	00c766b3          	or	a3,a4,a2
     a82:	c285                	beqz	a3,aa2 <__adddf3+0x224>
     a84:	962e                	add	a2,a2,a1
     a86:	97ba                	add	a5,a5,a4
     a88:	00b63533          	sltu	a0,a2,a1
     a8c:	97aa                	add	a5,a5,a0
     a8e:	00800737          	lui	a4,0x800
     a92:	8f7d                	and	a4,a4,a5
     a94:	85b2                	mv	a1,a2
     a96:	c711                	beqz	a4,aa2 <__adddf3+0x224>
     a98:	ff800737          	lui	a4,0xff800
     a9c:	177d                	addi	a4,a4,-1
     a9e:	8ff9                	and	a5,a5,a4
     aa0:	4405                	li	s0,1
     aa2:	0075f713          	andi	a4,a1,7
     aa6:	36070063          	beqz	a4,e06 <__adddf3+0x588>
     aaa:	00f5f713          	andi	a4,a1,15
     aae:	4691                	li	a3,4
     ab0:	34d70b63          	beq	a4,a3,e06 <__adddf3+0x588>
     ab4:	00458713          	addi	a4,a1,4
     ab8:	00b73533          	sltu	a0,a4,a1
     abc:	97aa                	add	a5,a5,a0
     abe:	85ba                	mv	a1,a4
     ac0:	a699                	j	e06 <__adddf3+0x588>
     ac2:	de99                	beqz	a3,9e0 <__adddf3+0x162>
     ac4:	8e59                	or	a2,a2,a4
     ac6:	e2060be3          	beqz	a2,8fc <__adddf3+0x7e>
     aca:	4481                	li	s1,0
     acc:	004007b7          	lui	a5,0x400
     ad0:	4581                	li	a1,0
     ad2:	7ff00413          	li	s0,2047
     ad6:	ae05                	j	e06 <__adddf3+0x588>
     ad8:	7ff00513          	li	a0,2047
     adc:	32a68163          	beq	a3,a0,dfe <__adddf3+0x580>
     ae0:	962e                	add	a2,a2,a1
     ae2:	00b63533          	sltu	a0,a2,a1
     ae6:	97ba                	add	a5,a5,a4
     ae8:	97aa                	add	a5,a5,a0
     aea:	01f79513          	slli	a0,a5,0x1f
     aee:	8205                	srli	a2,a2,0x1
     af0:	00c565b3          	or	a1,a0,a2
     af4:	8385                	srli	a5,a5,0x1
     af6:	8436                	mv	s0,a3
     af8:	b76d                	j	aa2 <__adddf3+0x224>
     afa:	0d005663          	blez	a6,bc6 <__adddf3+0x348>
     afe:	08031163          	bnez	t1,b80 <__adddf3+0x302>
     b02:	00c766b3          	or	a3,a4,a2
     b06:	36068163          	beqz	a3,e68 <__adddf3+0x5ea>
     b0a:	fff80513          	addi	a0,a6,-1
     b0e:	e911                	bnez	a0,b22 <__adddf3+0x2a4>
     b10:	40c58633          	sub	a2,a1,a2
     b14:	00c5b533          	sltu	a0,a1,a2
     b18:	8f99                	sub	a5,a5,a4
     b1a:	8f89                	sub	a5,a5,a0
     b1c:	85b2                	mv	a1,a2
     b1e:	4405                	li	s0,1
     b20:	a0b1                	j	b6c <__adddf3+0x2ee>
     b22:	7ff00693          	li	a3,2047
     b26:	dcd80be3          	beq	a6,a3,8fc <__adddf3+0x7e>
     b2a:	03800693          	li	a3,56
     b2e:	08a6c863          	blt	a3,a0,bbe <__adddf3+0x340>
     b32:	46fd                	li	a3,31
     b34:	04a6cf63          	blt	a3,a0,b92 <__adddf3+0x314>
     b38:	02000813          	li	a6,32
     b3c:	40a80833          	sub	a6,a6,a0
     b40:	010716b3          	sll	a3,a4,a6
     b44:	00a658b3          	srl	a7,a2,a0
     b48:	01061633          	sll	a2,a2,a6
     b4c:	0116e6b3          	or	a3,a3,a7
     b50:	00c03633          	snez	a2,a2
     b54:	8e55                	or	a2,a2,a3
     b56:	00a75733          	srl	a4,a4,a0
     b5a:	40c58633          	sub	a2,a1,a2
     b5e:	00c5b533          	sltu	a0,a1,a2
     b62:	40e78733          	sub	a4,a5,a4
     b66:	40a707b3          	sub	a5,a4,a0
     b6a:	85b2                	mv	a1,a2
     b6c:	00800937          	lui	s2,0x800
     b70:	0127f733          	and	a4,a5,s2
     b74:	d71d                	beqz	a4,aa2 <__adddf3+0x224>
     b76:	197d                	addi	s2,s2,-1
     b78:	0127f933          	and	s2,a5,s2
     b7c:	89ae                	mv	s3,a1
     b7e:	aa5d                	j	d34 <__adddf3+0x4b6>
     b80:	7ff00693          	li	a3,2047
     b84:	f0d40fe3          	beq	s0,a3,aa2 <__adddf3+0x224>
     b88:	008006b7          	lui	a3,0x800
     b8c:	8f55                	or	a4,a4,a3
     b8e:	8542                	mv	a0,a6
     b90:	bf69                	j	b2a <__adddf3+0x2ac>
     b92:	fe050693          	addi	a3,a0,-32
     b96:	02000893          	li	a7,32
     b9a:	00d756b3          	srl	a3,a4,a3
     b9e:	4801                	li	a6,0
     ba0:	01150863          	beq	a0,a7,bb0 <__adddf3+0x332>
     ba4:	04000813          	li	a6,64
     ba8:	40a80533          	sub	a0,a6,a0
     bac:	00a71833          	sll	a6,a4,a0
     bb0:	00c86633          	or	a2,a6,a2
     bb4:	00c03633          	snez	a2,a2
     bb8:	8e55                	or	a2,a2,a3
     bba:	4701                	li	a4,0
     bbc:	bf79                	j	b5a <__adddf3+0x2dc>
     bbe:	8e59                	or	a2,a2,a4
     bc0:	00c03633          	snez	a2,a2
     bc4:	bfdd                	j	bba <__adddf3+0x33c>
     bc6:	0c080563          	beqz	a6,c90 <__adddf3+0x412>
     bca:	40830533          	sub	a0,t1,s0
     bce:	e81d                	bnez	s0,c04 <__adddf3+0x386>
     bd0:	00b7e833          	or	a6,a5,a1
     bd4:	28080c63          	beqz	a6,e6c <__adddf3+0x5ee>
     bd8:	fff50813          	addi	a6,a0,-1
     bdc:	00081b63          	bnez	a6,bf2 <__adddf3+0x374>
     be0:	40b605b3          	sub	a1,a2,a1
     be4:	40f707b3          	sub	a5,a4,a5
     be8:	00b63633          	sltu	a2,a2,a1
     bec:	8f91                	sub	a5,a5,a2
     bee:	84b6                	mv	s1,a3
     bf0:	b73d                	j	b1e <__adddf3+0x2a0>
     bf2:	7ff00893          	li	a7,2047
     bf6:	03151063          	bne	a0,a7,c16 <__adddf3+0x398>
     bfa:	87ba                	mv	a5,a4
     bfc:	85b2                	mv	a1,a2
     bfe:	7ff00413          	li	s0,2047
     c02:	a07d                	j	cb0 <__adddf3+0x432>
     c04:	7ff00813          	li	a6,2047
     c08:	ff0309e3          	beq	t1,a6,bfa <__adddf3+0x37c>
     c0c:	00800837          	lui	a6,0x800
     c10:	0107e7b3          	or	a5,a5,a6
     c14:	882a                	mv	a6,a0
     c16:	03800513          	li	a0,56
     c1a:	07054663          	blt	a0,a6,c86 <__adddf3+0x408>
     c1e:	457d                	li	a0,31
     c20:	03054d63          	blt	a0,a6,c5a <__adddf3+0x3dc>
     c24:	02000893          	li	a7,32
     c28:	410888b3          	sub	a7,a7,a6
     c2c:	01179533          	sll	a0,a5,a7
     c30:	0105de33          	srl	t3,a1,a6
     c34:	011595b3          	sll	a1,a1,a7
     c38:	01c56533          	or	a0,a0,t3
     c3c:	00b035b3          	snez	a1,a1
     c40:	8d4d                	or	a0,a0,a1
     c42:	0107d7b3          	srl	a5,a5,a6
     c46:	40a605b3          	sub	a1,a2,a0
     c4a:	40f707b3          	sub	a5,a4,a5
     c4e:	00b63633          	sltu	a2,a2,a1
     c52:	8f91                	sub	a5,a5,a2
     c54:	841a                	mv	s0,t1
     c56:	84b6                	mv	s1,a3
     c58:	bf11                	j	b6c <__adddf3+0x2ee>
     c5a:	fe080513          	addi	a0,a6,-32 # 7fffe0 <__min_heap_size+0x7effe0>
     c5e:	02000e13          	li	t3,32
     c62:	00a7d8b3          	srl	a7,a5,a0
     c66:	4501                	li	a0,0
     c68:	01c80863          	beq	a6,t3,c78 <__adddf3+0x3fa>
     c6c:	04000513          	li	a0,64
     c70:	41050533          	sub	a0,a0,a6
     c74:	00a79533          	sll	a0,a5,a0
     c78:	8d4d                	or	a0,a0,a1
     c7a:	00a03533          	snez	a0,a0
     c7e:	00a8e533          	or	a0,a7,a0
     c82:	4781                	li	a5,0
     c84:	b7c9                	j	c46 <__adddf3+0x3c8>
     c86:	00b7e533          	or	a0,a5,a1
     c8a:	00a03533          	snez	a0,a0
     c8e:	bfd5                	j	c82 <__adddf3+0x404>
     c90:	00140513          	addi	a0,s0,1
     c94:	7fe57513          	andi	a0,a0,2046
     c98:	e925                	bnez	a0,d08 <__adddf3+0x48a>
     c9a:	00b7e833          	or	a6,a5,a1
     c9e:	00c76533          	or	a0,a4,a2
     ca2:	e821                	bnez	s0,cf2 <__adddf3+0x474>
     ca4:	00081863          	bnez	a6,cb4 <__adddf3+0x436>
     ca8:	1c050663          	beqz	a0,e74 <__adddf3+0x5f6>
     cac:	87ba                	mv	a5,a4
     cae:	85b2                	mv	a1,a2
     cb0:	84b6                	mv	s1,a3
     cb2:	bbc5                	j	aa2 <__adddf3+0x224>
     cb4:	de0507e3          	beqz	a0,aa2 <__adddf3+0x224>
     cb8:	40c58833          	sub	a6,a1,a2
     cbc:	0105b8b3          	sltu	a7,a1,a6
     cc0:	40e78533          	sub	a0,a5,a4
     cc4:	41150533          	sub	a0,a0,a7
     cc8:	008008b7          	lui	a7,0x800
     ccc:	011578b3          	and	a7,a0,a7
     cd0:	00088a63          	beqz	a7,ce4 <__adddf3+0x466>
     cd4:	40b605b3          	sub	a1,a2,a1
     cd8:	40f707b3          	sub	a5,a4,a5
     cdc:	00b63633          	sltu	a2,a2,a1
     ce0:	8f91                	sub	a5,a5,a2
     ce2:	b7f9                	j	cb0 <__adddf3+0x432>
     ce4:	00a865b3          	or	a1,a6,a0
     ce8:	18058a63          	beqz	a1,e7c <__adddf3+0x5fe>
     cec:	87aa                	mv	a5,a0
     cee:	85c2                	mv	a1,a6
     cf0:	bb4d                	j	aa2 <__adddf3+0x224>
     cf2:	00081863          	bnez	a6,d02 <__adddf3+0x484>
     cf6:	18050563          	beqz	a0,e80 <__adddf3+0x602>
     cfa:	87ba                	mv	a5,a4
     cfc:	85b2                	mv	a1,a2
     cfe:	84b6                	mv	s1,a3
     d00:	bef5                	j	8fc <__adddf3+0x7e>
     d02:	be050de3          	beqz	a0,8fc <__adddf3+0x7e>
     d06:	b3d1                	j	aca <__adddf3+0x24c>
     d08:	40c589b3          	sub	s3,a1,a2
     d0c:	0135b533          	sltu	a0,a1,s3
     d10:	40e78933          	sub	s2,a5,a4
     d14:	40a90933          	sub	s2,s2,a0
     d18:	00800537          	lui	a0,0x800
     d1c:	00a97533          	and	a0,s2,a0
     d20:	c935                	beqz	a0,d94 <__adddf3+0x516>
     d22:	40b609b3          	sub	s3,a2,a1
     d26:	40f707b3          	sub	a5,a4,a5
     d2a:	01363633          	sltu	a2,a2,s3
     d2e:	40c78933          	sub	s2,a5,a2
     d32:	84b6                	mv	s1,a3
     d34:	06090663          	beqz	s2,da0 <__adddf3+0x522>
     d38:	854a                	mv	a0,s2
     d3a:	00001097          	auipc	ra,0x1
     d3e:	470080e7          	jalr	1136(ra) # 21aa <__clzsi2>
     d42:	ff850713          	addi	a4,a0,-8 # 7ffff8 <__min_heap_size+0x7efff8>
     d46:	47fd                	li	a5,31
     d48:	06e7c463          	blt	a5,a4,db0 <__adddf3+0x532>
     d4c:	02000793          	li	a5,32
     d50:	8f99                	sub	a5,a5,a4
     d52:	00e91933          	sll	s2,s2,a4
     d56:	00f9d7b3          	srl	a5,s3,a5
     d5a:	0127e7b3          	or	a5,a5,s2
     d5e:	00e995b3          	sll	a1,s3,a4
     d62:	08874163          	blt	a4,s0,de4 <__adddf3+0x566>
     d66:	8f01                	sub	a4,a4,s0
     d68:	00170693          	addi	a3,a4,1 # ff800001 <__heap_end+0xdf7e0001>
     d6c:	467d                	li	a2,31
     d6e:	04d64763          	blt	a2,a3,dbc <__adddf3+0x53e>
     d72:	02000713          	li	a4,32
     d76:	8f15                	sub	a4,a4,a3
     d78:	00e79633          	sll	a2,a5,a4
     d7c:	00d5d533          	srl	a0,a1,a3
     d80:	00e595b3          	sll	a1,a1,a4
     d84:	8e49                	or	a2,a2,a0
     d86:	00b035b3          	snez	a1,a1
     d8a:	8dd1                	or	a1,a1,a2
     d8c:	00d7d7b3          	srl	a5,a5,a3
     d90:	4401                	li	s0,0
     d92:	bb01                	j	aa2 <__adddf3+0x224>
     d94:	0129e5b3          	or	a1,s3,s2
     d98:	fdd1                	bnez	a1,d34 <__adddf3+0x4b6>
     d9a:	4781                	li	a5,0
     d9c:	4401                	li	s0,0
     d9e:	a8e9                	j	e78 <__adddf3+0x5fa>
     da0:	854e                	mv	a0,s3
     da2:	00001097          	auipc	ra,0x1
     da6:	408080e7          	jalr	1032(ra) # 21aa <__clzsi2>
     daa:	02050513          	addi	a0,a0,32
     dae:	bf51                	j	d42 <__adddf3+0x4c4>
     db0:	fd850793          	addi	a5,a0,-40
     db4:	00f997b3          	sll	a5,s3,a5
     db8:	4581                	li	a1,0
     dba:	b765                	j	d62 <__adddf3+0x4e4>
     dbc:	1705                	addi	a4,a4,-31
     dbe:	02000613          	li	a2,32
     dc2:	00e7d733          	srl	a4,a5,a4
     dc6:	4501                	li	a0,0
     dc8:	00c68763          	beq	a3,a2,dd6 <__adddf3+0x558>
     dcc:	04000513          	li	a0,64
     dd0:	8d15                	sub	a0,a0,a3
     dd2:	00a79533          	sll	a0,a5,a0
     dd6:	8d4d                	or	a0,a0,a1
     dd8:	00a03533          	snez	a0,a0
     ddc:	00a765b3          	or	a1,a4,a0
     de0:	4781                	li	a5,0
     de2:	b77d                	j	d90 <__adddf3+0x512>
     de4:	8c19                	sub	s0,s0,a4
     de6:	ff800737          	lui	a4,0xff800
     dea:	177d                	addi	a4,a4,-1
     dec:	8ff9                	and	a5,a5,a4
     dee:	b955                	j	aa2 <__adddf3+0x224>
     df0:	87ba                	mv	a5,a4
     df2:	85b2                	mv	a1,a2
     df4:	842a                	mv	s0,a0
     df6:	b175                	j	aa2 <__adddf3+0x224>
     df8:	87ba                	mv	a5,a4
     dfa:	85b2                	mv	a1,a2
     dfc:	b15d                	j	aa2 <__adddf3+0x224>
     dfe:	7ff00413          	li	s0,2047
     e02:	4781                	li	a5,0
     e04:	4581                	li	a1,0
     e06:	00800737          	lui	a4,0x800
     e0a:	8f7d                	and	a4,a4,a5
     e0c:	cb11                	beqz	a4,e20 <__adddf3+0x5a2>
     e0e:	0405                	addi	s0,s0,1
     e10:	7ff00713          	li	a4,2047
     e14:	06e40b63          	beq	s0,a4,e8a <__adddf3+0x60c>
     e18:	ff800737          	lui	a4,0xff800
     e1c:	177d                	addi	a4,a4,-1
     e1e:	8ff9                	and	a5,a5,a4
     e20:	01d79713          	slli	a4,a5,0x1d
     e24:	0035d513          	srli	a0,a1,0x3
     e28:	8d59                	or	a0,a0,a4
     e2a:	7ff00713          	li	a4,2047
     e2e:	838d                	srli	a5,a5,0x3
     e30:	00e41963          	bne	s0,a4,e42 <__adddf3+0x5c4>
     e34:	8d5d                	or	a0,a0,a5
     e36:	4781                	li	a5,0
     e38:	c509                	beqz	a0,e42 <__adddf3+0x5c4>
     e3a:	000807b7          	lui	a5,0x80
     e3e:	4501                	li	a0,0
     e40:	4481                	li	s1,0
     e42:	01441713          	slli	a4,s0,0x14
     e46:	7ff006b7          	lui	a3,0x7ff00
     e4a:	07b2                	slli	a5,a5,0xc
     e4c:	40f2                	lw	ra,28(sp)
     e4e:	4462                	lw	s0,24(sp)
     e50:	8f75                	and	a4,a4,a3
     e52:	83b1                	srli	a5,a5,0xc
     e54:	04fe                	slli	s1,s1,0x1f
     e56:	8fd9                	or	a5,a5,a4
     e58:	0097e733          	or	a4,a5,s1
     e5c:	4942                	lw	s2,16(sp)
     e5e:	44d2                	lw	s1,20(sp)
     e60:	49b2                	lw	s3,12(sp)
     e62:	85ba                	mv	a1,a4
     e64:	6105                	addi	sp,sp,32
     e66:	8082                	ret
     e68:	8442                	mv	s0,a6
     e6a:	b925                	j	aa2 <__adddf3+0x224>
     e6c:	87ba                	mv	a5,a4
     e6e:	85b2                	mv	a1,a2
     e70:	842a                	mv	s0,a0
     e72:	bd3d                	j	cb0 <__adddf3+0x432>
     e74:	4781                	li	a5,0
     e76:	4581                	li	a1,0
     e78:	4481                	li	s1,0
     e7a:	b771                	j	e06 <__adddf3+0x588>
     e7c:	4781                	li	a5,0
     e7e:	bfed                	j	e78 <__adddf3+0x5fa>
     e80:	4581                	li	a1,0
     e82:	4481                	li	s1,0
     e84:	004007b7          	lui	a5,0x400
     e88:	b1a9                	j	ad2 <__adddf3+0x254>
     e8a:	4781                	li	a5,0
     e8c:	4581                	li	a1,0
     e8e:	bf49                	j	e20 <__adddf3+0x5a2>

00000e90 <__divdf3>:
     e90:	7179                	addi	sp,sp,-48
     e92:	d04a                	sw	s2,32(sp)
     e94:	0145d913          	srli	s2,a1,0x14
     e98:	d226                	sw	s1,36(sp)
     e9a:	ce4e                	sw	s3,28(sp)
     e9c:	cc52                	sw	s4,24(sp)
     e9e:	c85a                	sw	s6,16(sp)
     ea0:	c462                	sw	s8,8(sp)
     ea2:	00c59493          	slli	s1,a1,0xc
     ea6:	d606                	sw	ra,44(sp)
     ea8:	d422                	sw	s0,40(sp)
     eaa:	ca56                	sw	s5,20(sp)
     eac:	c65e                	sw	s7,12(sp)
     eae:	7ff97913          	andi	s2,s2,2047
     eb2:	8a2a                	mv	s4,a0
     eb4:	8b32                	mv	s6,a2
     eb6:	8c36                	mv	s8,a3
     eb8:	80b1                	srli	s1,s1,0xc
     eba:	01f5d993          	srli	s3,a1,0x1f
     ebe:	08090463          	beqz	s2,f46 <__divdf3+0xb6>
     ec2:	7ff00793          	li	a5,2047
     ec6:	0cf90f63          	beq	s2,a5,fa4 <__divdf3+0x114>
     eca:	01d55a93          	srli	s5,a0,0x1d
     ece:	048e                	slli	s1,s1,0x3
     ed0:	009ae4b3          	or	s1,s5,s1
     ed4:	00800ab7          	lui	s5,0x800
     ed8:	0154eab3          	or	s5,s1,s5
     edc:	00351413          	slli	s0,a0,0x3
     ee0:	c0190913          	addi	s2,s2,-1023 # 7ffc01 <__min_heap_size+0x7efc01>
     ee4:	4b81                	li	s7,0
     ee6:	00cc1513          	slli	a0,s8,0xc
     eea:	00c55493          	srli	s1,a0,0xc
     eee:	014c5513          	srli	a0,s8,0x14
     ef2:	7ff57593          	andi	a1,a0,2047
     ef6:	01fc5c13          	srli	s8,s8,0x1f
     efa:	c9e1                	beqz	a1,fca <__divdf3+0x13a>
     efc:	7ff00793          	li	a5,2047
     f00:	12f58563          	beq	a1,a5,102a <__divdf3+0x19a>
     f04:	00349513          	slli	a0,s1,0x3
     f08:	01db5793          	srli	a5,s6,0x1d
     f0c:	8d5d                	or	a0,a0,a5
     f0e:	008004b7          	lui	s1,0x800
     f12:	8cc9                	or	s1,s1,a0
     f14:	003b1f93          	slli	t6,s6,0x3
     f18:	c0158513          	addi	a0,a1,-1023
     f1c:	4781                	li	a5,0
     f1e:	002b9713          	slli	a4,s7,0x2
     f22:	8f5d                	or	a4,a4,a5
     f24:	177d                	addi	a4,a4,-1
     f26:	4639                	li	a2,14
     f28:	0189c6b3          	xor	a3,s3,s8
     f2c:	40a905b3          	sub	a1,s2,a0
     f30:	10e66f63          	bltu	a2,a4,104e <__divdf3+0x1be>
     f34:	00007617          	auipc	a2,0x7
     f38:	48860613          	addi	a2,a2,1160 # 83bc <__srodata+0x10c>
     f3c:	070a                	slli	a4,a4,0x2
     f3e:	9732                	add	a4,a4,a2
     f40:	4318                	lw	a4,0(a4)
     f42:	9732                	add	a4,a4,a2
     f44:	8702                	jr	a4
     f46:	00a4eab3          	or	s5,s1,a0
     f4a:	060a8763          	beqz	s5,fb8 <__divdf3+0x128>
     f4e:	02048e63          	beqz	s1,f8a <__divdf3+0xfa>
     f52:	8526                	mv	a0,s1
     f54:	00001097          	auipc	ra,0x1
     f58:	256080e7          	jalr	598(ra) # 21aa <__clzsi2>
     f5c:	ff550793          	addi	a5,a0,-11
     f60:	4771                	li	a4,28
     f62:	02f74b63          	blt	a4,a5,f98 <__divdf3+0x108>
     f66:	4af5                	li	s5,29
     f68:	ff850413          	addi	s0,a0,-8
     f6c:	40fa8ab3          	sub	s5,s5,a5
     f70:	008494b3          	sll	s1,s1,s0
     f74:	015a5ab3          	srl	s5,s4,s5
     f78:	009aeab3          	or	s5,s5,s1
     f7c:	008a1433          	sll	s0,s4,s0
     f80:	c0d00593          	li	a1,-1011
     f84:	40a58933          	sub	s2,a1,a0
     f88:	bfb1                	j	ee4 <__divdf3+0x54>
     f8a:	00001097          	auipc	ra,0x1
     f8e:	220080e7          	jalr	544(ra) # 21aa <__clzsi2>
     f92:	02050513          	addi	a0,a0,32
     f96:	b7d9                	j	f5c <__divdf3+0xcc>
     f98:	fd850493          	addi	s1,a0,-40
     f9c:	009a1ab3          	sll	s5,s4,s1
     fa0:	4401                	li	s0,0
     fa2:	bff9                	j	f80 <__divdf3+0xf0>
     fa4:	00a4eab3          	or	s5,s1,a0
     fa8:	000a8c63          	beqz	s5,fc0 <__divdf3+0x130>
     fac:	842a                	mv	s0,a0
     fae:	8aa6                	mv	s5,s1
     fb0:	7ff00913          	li	s2,2047
     fb4:	4b8d                	li	s7,3
     fb6:	bf05                	j	ee6 <__divdf3+0x56>
     fb8:	4401                	li	s0,0
     fba:	4901                	li	s2,0
     fbc:	4b85                	li	s7,1
     fbe:	b725                	j	ee6 <__divdf3+0x56>
     fc0:	4401                	li	s0,0
     fc2:	7ff00913          	li	s2,2047
     fc6:	4b89                	li	s7,2
     fc8:	bf39                	j	ee6 <__divdf3+0x56>
     fca:	0164efb3          	or	t6,s1,s6
     fce:	060f8763          	beqz	t6,103c <__divdf3+0x1ac>
     fd2:	02048e63          	beqz	s1,100e <__divdf3+0x17e>
     fd6:	8526                	mv	a0,s1
     fd8:	00001097          	auipc	ra,0x1
     fdc:	1d2080e7          	jalr	466(ra) # 21aa <__clzsi2>
     fe0:	85aa                	mv	a1,a0
     fe2:	ff558793          	addi	a5,a1,-11
     fe6:	4771                	li	a4,28
     fe8:	02f74b63          	blt	a4,a5,101e <__divdf3+0x18e>
     fec:	46f5                	li	a3,29
     fee:	ff858f93          	addi	t6,a1,-8
     ff2:	8e9d                	sub	a3,a3,a5
     ff4:	01f49533          	sll	a0,s1,t6
     ff8:	00db56b3          	srl	a3,s6,a3
     ffc:	00a6e4b3          	or	s1,a3,a0
    1000:	01fb1fb3          	sll	t6,s6,t6
    1004:	c0d00693          	li	a3,-1011
    1008:	40b68533          	sub	a0,a3,a1
    100c:	bf01                	j	f1c <__divdf3+0x8c>
    100e:	855a                	mv	a0,s6
    1010:	00001097          	auipc	ra,0x1
    1014:	19a080e7          	jalr	410(ra) # 21aa <__clzsi2>
    1018:	02050593          	addi	a1,a0,32
    101c:	b7d9                	j	fe2 <__divdf3+0x152>
    101e:	fd858513          	addi	a0,a1,-40
    1022:	00ab14b3          	sll	s1,s6,a0
    1026:	4f81                	li	t6,0
    1028:	bff1                	j	1004 <__divdf3+0x174>
    102a:	0164efb3          	or	t6,s1,s6
    102e:	000f8b63          	beqz	t6,1044 <__divdf3+0x1b4>
    1032:	8fda                	mv	t6,s6
    1034:	7ff00513          	li	a0,2047
    1038:	478d                	li	a5,3
    103a:	b5d5                	j	f1e <__divdf3+0x8e>
    103c:	4481                	li	s1,0
    103e:	4501                	li	a0,0
    1040:	4785                	li	a5,1
    1042:	bdf1                	j	f1e <__divdf3+0x8e>
    1044:	4481                	li	s1,0
    1046:	7ff00513          	li	a0,2047
    104a:	4789                	li	a5,2
    104c:	bdc9                	j	f1e <__divdf3+0x8e>
    104e:	0154e663          	bltu	s1,s5,105a <__divdf3+0x1ca>
    1052:	2a9a9663          	bne	s5,s1,12fe <__divdf3+0x46e>
    1056:	2bf46463          	bltu	s0,t6,12fe <__divdf3+0x46e>
    105a:	01fa9613          	slli	a2,s5,0x1f
    105e:	00145713          	srli	a4,s0,0x1
    1062:	01f41793          	slli	a5,s0,0x1f
    1066:	001ada93          	srli	s5,s5,0x1
    106a:	00e66433          	or	s0,a2,a4
    106e:	00849513          	slli	a0,s1,0x8
    1072:	018fd893          	srli	a7,t6,0x18
    1076:	00a8e8b3          	or	a7,a7,a0
    107a:	8141                	srli	a0,a0,0x10
    107c:	02aade33          	divu	t3,s5,a0
    1080:	01089e93          	slli	t4,a7,0x10
    1084:	010ede93          	srli	t4,t4,0x10
    1088:	01045713          	srli	a4,s0,0x10
    108c:	008f9313          	slli	t1,t6,0x8
    1090:	02aafab3          	remu	s5,s5,a0
    1094:	8672                	mv	a2,t3
    1096:	03ce8833          	mul	a6,t4,t3
    109a:	0ac2                	slli	s5,s5,0x10
    109c:	01576733          	or	a4,a4,s5
    10a0:	01077c63          	bgeu	a4,a6,10b8 <__divdf3+0x228>
    10a4:	9746                	add	a4,a4,a7
    10a6:	fffe0613          	addi	a2,t3,-1
    10aa:	01176763          	bltu	a4,a7,10b8 <__divdf3+0x228>
    10ae:	01077563          	bgeu	a4,a6,10b8 <__divdf3+0x228>
    10b2:	ffee0613          	addi	a2,t3,-2
    10b6:	9746                	add	a4,a4,a7
    10b8:	41070733          	sub	a4,a4,a6
    10bc:	02a75e33          	divu	t3,a4,a0
    10c0:	0442                	slli	s0,s0,0x10
    10c2:	8041                	srli	s0,s0,0x10
    10c4:	02a77733          	remu	a4,a4,a0
    10c8:	82f2                	mv	t0,t3
    10ca:	03ce8833          	mul	a6,t4,t3
    10ce:	0742                	slli	a4,a4,0x10
    10d0:	8f41                	or	a4,a4,s0
    10d2:	01077c63          	bgeu	a4,a6,10ea <__divdf3+0x25a>
    10d6:	9746                	add	a4,a4,a7
    10d8:	fffe0293          	addi	t0,t3,-1
    10dc:	01176763          	bltu	a4,a7,10ea <__divdf3+0x25a>
    10e0:	01077563          	bgeu	a4,a6,10ea <__divdf3+0x25a>
    10e4:	ffee0293          	addi	t0,t3,-2
    10e8:	9746                	add	a4,a4,a7
    10ea:	41070433          	sub	s0,a4,a6
    10ee:	0642                	slli	a2,a2,0x10
    10f0:	6841                	lui	a6,0x10
    10f2:	005662b3          	or	t0,a2,t0
    10f6:	fff80e13          	addi	t3,a6,-1 # ffff <__ctor_end__+0x77bf>
    10fa:	0102d613          	srli	a2,t0,0x10
    10fe:	01c2f733          	and	a4,t0,t3
    1102:	01035f13          	srli	t5,t1,0x10
    1106:	01c37e33          	and	t3,t1,t3
    110a:	02ee03b3          	mul	t2,t3,a4
    110e:	03c604b3          	mul	s1,a2,t3
    1112:	02ef0733          	mul	a4,t5,a4
    1116:	03e60fb3          	mul	t6,a2,t5
    111a:	00970633          	add	a2,a4,s1
    111e:	0103d713          	srli	a4,t2,0x10
    1122:	9732                	add	a4,a4,a2
    1124:	00977363          	bgeu	a4,s1,112a <__divdf3+0x29a>
    1128:	9fc2                	add	t6,t6,a6
    112a:	01075613          	srli	a2,a4,0x10
    112e:	967e                	add	a2,a2,t6
    1130:	6fc1                	lui	t6,0x10
    1132:	1ffd                	addi	t6,t6,-1
    1134:	01f77833          	and	a6,a4,t6
    1138:	0842                	slli	a6,a6,0x10
    113a:	01f3f3b3          	and	t2,t2,t6
    113e:	981e                	add	a6,a6,t2
    1140:	00c46763          	bltu	s0,a2,114e <__divdf3+0x2be>
    1144:	8496                	mv	s1,t0
    1146:	02c41e63          	bne	s0,a2,1182 <__divdf3+0x2f2>
    114a:	0307fc63          	bgeu	a5,a6,1182 <__divdf3+0x2f2>
    114e:	979a                	add	a5,a5,t1
    1150:	0067b733          	sltu	a4,a5,t1
    1154:	9746                	add	a4,a4,a7
    1156:	943a                	add	s0,s0,a4
    1158:	fff28493          	addi	s1,t0,-1
    115c:	0088e663          	bltu	a7,s0,1168 <__divdf3+0x2d8>
    1160:	02889163          	bne	a7,s0,1182 <__divdf3+0x2f2>
    1164:	0067ef63          	bltu	a5,t1,1182 <__divdf3+0x2f2>
    1168:	00c46663          	bltu	s0,a2,1174 <__divdf3+0x2e4>
    116c:	00861b63          	bne	a2,s0,1182 <__divdf3+0x2f2>
    1170:	0107f963          	bgeu	a5,a6,1182 <__divdf3+0x2f2>
    1174:	979a                	add	a5,a5,t1
    1176:	0067b733          	sltu	a4,a5,t1
    117a:	9746                	add	a4,a4,a7
    117c:	ffe28493          	addi	s1,t0,-2
    1180:	943a                	add	s0,s0,a4
    1182:	41078833          	sub	a6,a5,a6
    1186:	8c11                	sub	s0,s0,a2
    1188:	0107b7b3          	sltu	a5,a5,a6
    118c:	8c1d                	sub	s0,s0,a5
    118e:	5ffd                	li	t6,-1
    1190:	0e888763          	beq	a7,s0,127e <__divdf3+0x3ee>
    1194:	02a45fb3          	divu	t6,s0,a0
    1198:	01085713          	srli	a4,a6,0x10
    119c:	02a47433          	remu	s0,s0,a0
    11a0:	867e                	mv	a2,t6
    11a2:	03fe87b3          	mul	a5,t4,t6
    11a6:	0442                	slli	s0,s0,0x10
    11a8:	8c59                	or	s0,s0,a4
    11aa:	00f47c63          	bgeu	s0,a5,11c2 <__divdf3+0x332>
    11ae:	9446                	add	s0,s0,a7
    11b0:	ffff8613          	addi	a2,t6,-1 # ffff <__ctor_end__+0x77bf>
    11b4:	01146763          	bltu	s0,a7,11c2 <__divdf3+0x332>
    11b8:	00f47563          	bgeu	s0,a5,11c2 <__divdf3+0x332>
    11bc:	ffef8613          	addi	a2,t6,-2
    11c0:	9446                	add	s0,s0,a7
    11c2:	8c1d                	sub	s0,s0,a5
    11c4:	02a45733          	divu	a4,s0,a0
    11c8:	0842                	slli	a6,a6,0x10
    11ca:	01085813          	srli	a6,a6,0x10
    11ce:	02a47433          	remu	s0,s0,a0
    11d2:	87ba                	mv	a5,a4
    11d4:	02ee8eb3          	mul	t4,t4,a4
    11d8:	0442                	slli	s0,s0,0x10
    11da:	00886433          	or	s0,a6,s0
    11de:	01d47c63          	bgeu	s0,t4,11f6 <__divdf3+0x366>
    11e2:	9446                	add	s0,s0,a7
    11e4:	fff70793          	addi	a5,a4,-1 # ff7fffff <__heap_end+0xdf7dffff>
    11e8:	01146763          	bltu	s0,a7,11f6 <__divdf3+0x366>
    11ec:	01d47563          	bgeu	s0,t4,11f6 <__divdf3+0x366>
    11f0:	ffe70793          	addi	a5,a4,-2
    11f4:	9446                	add	s0,s0,a7
    11f6:	0642                	slli	a2,a2,0x10
    11f8:	8e5d                	or	a2,a2,a5
    11fa:	01061793          	slli	a5,a2,0x10
    11fe:	83c1                	srli	a5,a5,0x10
    1200:	01065713          	srli	a4,a2,0x10
    1204:	02ef0833          	mul	a6,t5,a4
    1208:	41d40433          	sub	s0,s0,t4
    120c:	02ff0f33          	mul	t5,t5,a5
    1210:	03c78eb3          	mul	t4,a5,t3
    1214:	03c70e33          	mul	t3,a4,t3
    1218:	010ed793          	srli	a5,t4,0x10
    121c:	9f72                	add	t5,t5,t3
    121e:	97fa                	add	a5,a5,t5
    1220:	01c7f463          	bgeu	a5,t3,1228 <__divdf3+0x398>
    1224:	6741                	lui	a4,0x10
    1226:	983a                	add	a6,a6,a4
    1228:	0107d713          	srli	a4,a5,0x10
    122c:	9742                	add	a4,a4,a6
    122e:	6841                	lui	a6,0x10
    1230:	187d                	addi	a6,a6,-1
    1232:	0107f533          	and	a0,a5,a6
    1236:	0542                	slli	a0,a0,0x10
    1238:	010efeb3          	and	t4,t4,a6
    123c:	9576                	add	a0,a0,t4
    123e:	00e46663          	bltu	s0,a4,124a <__divdf3+0x3ba>
    1242:	18e41f63          	bne	s0,a4,13e0 <__divdf3+0x550>
    1246:	8fb2                	mv	t6,a2
    1248:	c91d                	beqz	a0,127e <__divdf3+0x3ee>
    124a:	9446                	add	s0,s0,a7
    124c:	fff60f93          	addi	t6,a2,-1
    1250:	03146163          	bltu	s0,a7,1272 <__divdf3+0x3e2>
    1254:	00e46663          	bltu	s0,a4,1260 <__divdf3+0x3d0>
    1258:	18e41363          	bne	s0,a4,13de <__divdf3+0x54e>
    125c:	00a37d63          	bgeu	t1,a0,1276 <__divdf3+0x3e6>
    1260:	00131793          	slli	a5,t1,0x1
    1264:	0067b333          	sltu	t1,a5,t1
    1268:	989a                	add	a7,a7,t1
    126a:	ffe60f93          	addi	t6,a2,-2
    126e:	9446                	add	s0,s0,a7
    1270:	833e                	mv	t1,a5
    1272:	00e41463          	bne	s0,a4,127a <__divdf3+0x3ea>
    1276:	00650463          	beq	a0,t1,127e <__divdf3+0x3ee>
    127a:	001fef93          	ori	t6,t6,1
    127e:	3ff58793          	addi	a5,a1,1023
    1282:	0af05b63          	blez	a5,1338 <__divdf3+0x4a8>
    1286:	007ff713          	andi	a4,t6,7
    128a:	cf01                	beqz	a4,12a2 <__divdf3+0x412>
    128c:	00fff713          	andi	a4,t6,15
    1290:	4611                	li	a2,4
    1292:	00c70863          	beq	a4,a2,12a2 <__divdf3+0x412>
    1296:	004f8613          	addi	a2,t6,4
    129a:	01f63fb3          	sltu	t6,a2,t6
    129e:	94fe                	add	s1,s1,t6
    12a0:	8fb2                	mv	t6,a2
    12a2:	01000737          	lui	a4,0x1000
    12a6:	8f65                	and	a4,a4,s1
    12a8:	c719                	beqz	a4,12b6 <__divdf3+0x426>
    12aa:	ff0007b7          	lui	a5,0xff000
    12ae:	17fd                	addi	a5,a5,-1
    12b0:	8cfd                	and	s1,s1,a5
    12b2:	40058793          	addi	a5,a1,1024
    12b6:	7fe00713          	li	a4,2046
    12ba:	06f74263          	blt	a4,a5,131e <__divdf3+0x48e>
    12be:	003fdf93          	srli	t6,t6,0x3
    12c2:	01d49713          	slli	a4,s1,0x1d
    12c6:	01f76733          	or	a4,a4,t6
    12ca:	0034d513          	srli	a0,s1,0x3
    12ce:	07d2                	slli	a5,a5,0x14
    12d0:	7ff00637          	lui	a2,0x7ff00
    12d4:	0532                	slli	a0,a0,0xc
    12d6:	50b2                	lw	ra,44(sp)
    12d8:	5422                	lw	s0,40(sp)
    12da:	8ff1                	and	a5,a5,a2
    12dc:	8131                	srli	a0,a0,0xc
    12de:	8d5d                	or	a0,a0,a5
    12e0:	06fe                	slli	a3,a3,0x1f
    12e2:	00d567b3          	or	a5,a0,a3
    12e6:	5492                	lw	s1,36(sp)
    12e8:	5902                	lw	s2,32(sp)
    12ea:	49f2                	lw	s3,28(sp)
    12ec:	4a62                	lw	s4,24(sp)
    12ee:	4ad2                	lw	s5,20(sp)
    12f0:	4b42                	lw	s6,16(sp)
    12f2:	4bb2                	lw	s7,12(sp)
    12f4:	4c22                	lw	s8,8(sp)
    12f6:	853a                	mv	a0,a4
    12f8:	85be                	mv	a1,a5
    12fa:	6145                	addi	sp,sp,48
    12fc:	8082                	ret
    12fe:	15fd                	addi	a1,a1,-1
    1300:	4781                	li	a5,0
    1302:	b3b5                	j	106e <__divdf3+0x1de>
    1304:	86ce                	mv	a3,s3
    1306:	84d6                	mv	s1,s5
    1308:	8fa2                	mv	t6,s0
    130a:	87de                	mv	a5,s7
    130c:	470d                	li	a4,3
    130e:	0ae78a63          	beq	a5,a4,13c2 <__divdf3+0x532>
    1312:	4705                	li	a4,1
    1314:	0ae78e63          	beq	a5,a4,13d0 <__divdf3+0x540>
    1318:	4709                	li	a4,2
    131a:	f6e792e3          	bne	a5,a4,127e <__divdf3+0x3ee>
    131e:	4501                	li	a0,0
    1320:	4701                	li	a4,0
    1322:	7ff00793          	li	a5,2047
    1326:	b765                	j	12ce <__divdf3+0x43e>
    1328:	86e2                	mv	a3,s8
    132a:	b7cd                	j	130c <__divdf3+0x47c>
    132c:	000804b7          	lui	s1,0x80
    1330:	4f81                	li	t6,0
    1332:	4681                	li	a3,0
    1334:	478d                	li	a5,3
    1336:	bfd9                	j	130c <__divdf3+0x47c>
    1338:	4505                	li	a0,1
    133a:	8d1d                	sub	a0,a0,a5
    133c:	03800713          	li	a4,56
    1340:	08a74863          	blt	a4,a0,13d0 <__divdf3+0x540>
    1344:	477d                	li	a4,31
    1346:	04a74963          	blt	a4,a0,1398 <__divdf3+0x508>
    134a:	41e58593          	addi	a1,a1,1054
    134e:	00b497b3          	sll	a5,s1,a1
    1352:	00afd733          	srl	a4,t6,a0
    1356:	00bf95b3          	sll	a1,t6,a1
    135a:	8fd9                	or	a5,a5,a4
    135c:	00b035b3          	snez	a1,a1
    1360:	8fcd                	or	a5,a5,a1
    1362:	00a4d533          	srl	a0,s1,a0
    1366:	0077f713          	andi	a4,a5,7
    136a:	cf01                	beqz	a4,1382 <__divdf3+0x4f2>
    136c:	00f7f713          	andi	a4,a5,15
    1370:	4611                	li	a2,4
    1372:	00c70863          	beq	a4,a2,1382 <__divdf3+0x4f2>
    1376:	00478713          	addi	a4,a5,4 # ff000004 <__heap_end+0xdefe0004>
    137a:	00f737b3          	sltu	a5,a4,a5
    137e:	953e                	add	a0,a0,a5
    1380:	87ba                	mv	a5,a4
    1382:	00800737          	lui	a4,0x800
    1386:	8f69                	and	a4,a4,a0
    1388:	e739                	bnez	a4,13d6 <__divdf3+0x546>
    138a:	01d51713          	slli	a4,a0,0x1d
    138e:	838d                	srli	a5,a5,0x3
    1390:	8f5d                	or	a4,a4,a5
    1392:	810d                	srli	a0,a0,0x3
    1394:	4781                	li	a5,0
    1396:	bf25                	j	12ce <__divdf3+0x43e>
    1398:	5705                	li	a4,-31
    139a:	40f707b3          	sub	a5,a4,a5
    139e:	02000613          	li	a2,32
    13a2:	00f4d7b3          	srl	a5,s1,a5
    13a6:	4701                	li	a4,0
    13a8:	00c50663          	beq	a0,a2,13b4 <__divdf3+0x524>
    13ac:	43e58713          	addi	a4,a1,1086
    13b0:	00e49733          	sll	a4,s1,a4
    13b4:	01f76733          	or	a4,a4,t6
    13b8:	00e03733          	snez	a4,a4
    13bc:	8fd9                	or	a5,a5,a4
    13be:	4501                	li	a0,0
    13c0:	b75d                	j	1366 <__divdf3+0x4d6>
    13c2:	00080537          	lui	a0,0x80
    13c6:	4701                	li	a4,0
    13c8:	7ff00793          	li	a5,2047
    13cc:	4681                	li	a3,0
    13ce:	b701                	j	12ce <__divdf3+0x43e>
    13d0:	4501                	li	a0,0
    13d2:	4701                	li	a4,0
    13d4:	b7c1                	j	1394 <__divdf3+0x504>
    13d6:	4501                	li	a0,0
    13d8:	4701                	li	a4,0
    13da:	4785                	li	a5,1
    13dc:	bdcd                	j	12ce <__divdf3+0x43e>
    13de:	867e                	mv	a2,t6
    13e0:	8fb2                	mv	t6,a2
    13e2:	bd61                	j	127a <__divdf3+0x3ea>

000013e4 <__eqdf2>:
    13e4:	0145d713          	srli	a4,a1,0x14
    13e8:	001007b7          	lui	a5,0x100
    13ec:	17fd                	addi	a5,a5,-1
    13ee:	0146d813          	srli	a6,a3,0x14
    13f2:	832a                	mv	t1,a0
    13f4:	8eaa                	mv	t4,a0
    13f6:	7ff77713          	andi	a4,a4,2047
    13fa:	7ff00513          	li	a0,2047
    13fe:	00b7f8b3          	and	a7,a5,a1
    1402:	8f32                	mv	t5,a2
    1404:	8ff5                	and	a5,a5,a3
    1406:	81fd                	srli	a1,a1,0x1f
    1408:	7ff87813          	andi	a6,a6,2047
    140c:	82fd                	srli	a3,a3,0x1f
    140e:	00a71a63          	bne	a4,a0,1422 <__eqdf2+0x3e>
    1412:	0068ee33          	or	t3,a7,t1
    1416:	4505                	li	a0,1
    1418:	000e1463          	bnez	t3,1420 <__eqdf2+0x3c>
    141c:	00e80563          	beq	a6,a4,1426 <__eqdf2+0x42>
    1420:	8082                	ret
    1422:	00a81563          	bne	a6,a0,142c <__eqdf2+0x48>
    1426:	8e5d                	or	a2,a2,a5
    1428:	4505                	li	a0,1
    142a:	fa7d                	bnez	a2,1420 <__eqdf2+0x3c>
    142c:	4505                	li	a0,1
    142e:	ff0719e3          	bne	a4,a6,1420 <__eqdf2+0x3c>
    1432:	fef897e3          	bne	a7,a5,1420 <__eqdf2+0x3c>
    1436:	ffee95e3          	bne	t4,t5,1420 <__eqdf2+0x3c>
    143a:	00d58963          	beq	a1,a3,144c <__eqdf2+0x68>
    143e:	fe0711e3          	bnez	a4,1420 <__eqdf2+0x3c>
    1442:	0068e533          	or	a0,a7,t1
    1446:	00a03533          	snez	a0,a0
    144a:	8082                	ret
    144c:	4501                	li	a0,0
    144e:	8082                	ret

00001450 <__gedf2>:
    1450:	00100737          	lui	a4,0x100
    1454:	177d                	addi	a4,a4,-1
    1456:	0145d813          	srli	a6,a1,0x14
    145a:	00b778b3          	and	a7,a4,a1
    145e:	87aa                	mv	a5,a0
    1460:	832a                	mv	t1,a0
    1462:	7ff87813          	andi	a6,a6,2047
    1466:	01f5d513          	srli	a0,a1,0x1f
    146a:	7ff00e93          	li	t4,2047
    146e:	0146d593          	srli	a1,a3,0x14
    1472:	8f75                	and	a4,a4,a3
    1474:	8e32                	mv	t3,a2
    1476:	7ff5f593          	andi	a1,a1,2047
    147a:	82fd                	srli	a3,a3,0x1f
    147c:	01d81863          	bne	a6,t4,148c <__gedf2+0x3c>
    1480:	00f8eeb3          	or	t4,a7,a5
    1484:	060e8763          	beqz	t4,14f2 <__gedf2+0xa2>
    1488:	5579                	li	a0,-2
    148a:	8082                	ret
    148c:	01d59663          	bne	a1,t4,1498 <__gedf2+0x48>
    1490:	00c76eb3          	or	t4,a4,a2
    1494:	fe0e9ae3          	bnez	t4,1488 <__gedf2+0x38>
    1498:	04081f63          	bnez	a6,14f6 <__gedf2+0xa6>
    149c:	00f8e7b3          	or	a5,a7,a5
    14a0:	0017b793          	seqz	a5,a5
    14a4:	e199                	bnez	a1,14aa <__gedf2+0x5a>
    14a6:	8e59                	or	a2,a2,a4
    14a8:	c221                	beqz	a2,14e8 <__gedf2+0x98>
    14aa:	00079a63          	bnez	a5,14be <__gedf2+0x6e>
    14ae:	00d51463          	bne	a0,a3,14b6 <__gedf2+0x66>
    14b2:	0105da63          	bge	a1,a6,14c6 <__gedf2+0x76>
    14b6:	02050763          	beqz	a0,14e4 <__gedf2+0x94>
    14ba:	557d                	li	a0,-1
    14bc:	8082                	ret
    14be:	557d                	li	a0,-1
    14c0:	c699                	beqz	a3,14ce <__gedf2+0x7e>
    14c2:	8536                	mv	a0,a3
    14c4:	8082                	ret
    14c6:	00b85563          	bge	a6,a1,14d0 <__gedf2+0x80>
    14ca:	fe0508e3          	beqz	a0,14ba <__gedf2+0x6a>
    14ce:	8082                	ret
    14d0:	ff1763e3          	bltu	a4,a7,14b6 <__gedf2+0x66>
    14d4:	00e89c63          	bne	a7,a4,14ec <__gedf2+0x9c>
    14d8:	fc6e6fe3          	bltu	t3,t1,14b6 <__gedf2+0x66>
    14dc:	ffc367e3          	bltu	t1,t3,14ca <__gedf2+0x7a>
    14e0:	4501                	li	a0,0
    14e2:	8082                	ret
    14e4:	4505                	li	a0,1
    14e6:	8082                	ret
    14e8:	ffe5                	bnez	a5,14e0 <__gedf2+0x90>
    14ea:	b7f1                	j	14b6 <__gedf2+0x66>
    14ec:	fce8efe3          	bltu	a7,a4,14ca <__gedf2+0x7a>
    14f0:	bfc5                	j	14e0 <__gedf2+0x90>
    14f2:	f9058fe3          	beq	a1,a6,1490 <__gedf2+0x40>
    14f6:	fa059ce3          	bnez	a1,14ae <__gedf2+0x5e>
    14fa:	4781                	li	a5,0
    14fc:	b76d                	j	14a6 <__gedf2+0x56>

000014fe <__ledf2>:
    14fe:	00100737          	lui	a4,0x100
    1502:	177d                	addi	a4,a4,-1
    1504:	0145d813          	srli	a6,a1,0x14
    1508:	00b778b3          	and	a7,a4,a1
    150c:	87aa                	mv	a5,a0
    150e:	832a                	mv	t1,a0
    1510:	7ff87813          	andi	a6,a6,2047
    1514:	01f5d513          	srli	a0,a1,0x1f
    1518:	7ff00e93          	li	t4,2047
    151c:	0146d593          	srli	a1,a3,0x14
    1520:	8f75                	and	a4,a4,a3
    1522:	8e32                	mv	t3,a2
    1524:	7ff5f593          	andi	a1,a1,2047
    1528:	82fd                	srli	a3,a3,0x1f
    152a:	01d81863          	bne	a6,t4,153a <__ledf2+0x3c>
    152e:	00f8eeb3          	or	t4,a7,a5
    1532:	060e8763          	beqz	t4,15a0 <__ledf2+0xa2>
    1536:	4509                	li	a0,2
    1538:	8082                	ret
    153a:	01d59663          	bne	a1,t4,1546 <__ledf2+0x48>
    153e:	00c76eb3          	or	t4,a4,a2
    1542:	fe0e9ae3          	bnez	t4,1536 <__ledf2+0x38>
    1546:	04081f63          	bnez	a6,15a4 <__ledf2+0xa6>
    154a:	00f8e7b3          	or	a5,a7,a5
    154e:	0017b793          	seqz	a5,a5
    1552:	e199                	bnez	a1,1558 <__ledf2+0x5a>
    1554:	8e59                	or	a2,a2,a4
    1556:	c221                	beqz	a2,1596 <__ledf2+0x98>
    1558:	00079a63          	bnez	a5,156c <__ledf2+0x6e>
    155c:	00d51463          	bne	a0,a3,1564 <__ledf2+0x66>
    1560:	0105da63          	bge	a1,a6,1574 <__ledf2+0x76>
    1564:	02050763          	beqz	a0,1592 <__ledf2+0x94>
    1568:	557d                	li	a0,-1
    156a:	8082                	ret
    156c:	557d                	li	a0,-1
    156e:	c699                	beqz	a3,157c <__ledf2+0x7e>
    1570:	8536                	mv	a0,a3
    1572:	8082                	ret
    1574:	00b85563          	bge	a6,a1,157e <__ledf2+0x80>
    1578:	fe0508e3          	beqz	a0,1568 <__ledf2+0x6a>
    157c:	8082                	ret
    157e:	ff1763e3          	bltu	a4,a7,1564 <__ledf2+0x66>
    1582:	00e89c63          	bne	a7,a4,159a <__ledf2+0x9c>
    1586:	fc6e6fe3          	bltu	t3,t1,1564 <__ledf2+0x66>
    158a:	ffc367e3          	bltu	t1,t3,1578 <__ledf2+0x7a>
    158e:	4501                	li	a0,0
    1590:	8082                	ret
    1592:	4505                	li	a0,1
    1594:	8082                	ret
    1596:	ffe5                	bnez	a5,158e <__ledf2+0x90>
    1598:	b7f1                	j	1564 <__ledf2+0x66>
    159a:	fce8efe3          	bltu	a7,a4,1578 <__ledf2+0x7a>
    159e:	bfc5                	j	158e <__ledf2+0x90>
    15a0:	f9058fe3          	beq	a1,a6,153e <__ledf2+0x40>
    15a4:	fa059ce3          	bnez	a1,155c <__ledf2+0x5e>
    15a8:	4781                	li	a5,0
    15aa:	b76d                	j	1554 <__ledf2+0x56>

000015ac <__muldf3>:
    15ac:	7179                	addi	sp,sp,-48
    15ae:	ce4e                	sw	s3,28(sp)
    15b0:	0145d993          	srli	s3,a1,0x14
    15b4:	d422                	sw	s0,40(sp)
    15b6:	d226                	sw	s1,36(sp)
    15b8:	cc52                	sw	s4,24(sp)
    15ba:	ca56                	sw	s5,20(sp)
    15bc:	c65e                	sw	s7,12(sp)
    15be:	00c59493          	slli	s1,a1,0xc
    15c2:	d606                	sw	ra,44(sp)
    15c4:	d04a                	sw	s2,32(sp)
    15c6:	c85a                	sw	s6,16(sp)
    15c8:	7ff9f993          	andi	s3,s3,2047
    15cc:	842a                	mv	s0,a0
    15ce:	8bb2                	mv	s7,a2
    15d0:	8ab6                	mv	s5,a3
    15d2:	80b1                	srli	s1,s1,0xc
    15d4:	01f5da13          	srli	s4,a1,0x1f
    15d8:	08098163          	beqz	s3,165a <__muldf3+0xae>
    15dc:	7ff00793          	li	a5,2047
    15e0:	0cf98a63          	beq	s3,a5,16b4 <__muldf3+0x108>
    15e4:	01d55793          	srli	a5,a0,0x1d
    15e8:	048e                	slli	s1,s1,0x3
    15ea:	8cdd                	or	s1,s1,a5
    15ec:	008007b7          	lui	a5,0x800
    15f0:	8cdd                	or	s1,s1,a5
    15f2:	00351913          	slli	s2,a0,0x3
    15f6:	c0198993          	addi	s3,s3,-1023
    15fa:	4b01                	li	s6,0
    15fc:	014ad513          	srli	a0,s5,0x14
    1600:	00ca9413          	slli	s0,s5,0xc
    1604:	7ff57513          	andi	a0,a0,2047
    1608:	8031                	srli	s0,s0,0xc
    160a:	01fada93          	srli	s5,s5,0x1f
    160e:	c569                	beqz	a0,16d8 <__muldf3+0x12c>
    1610:	7ff00793          	li	a5,2047
    1614:	10f50f63          	beq	a0,a5,1732 <__muldf3+0x186>
    1618:	01dbd793          	srli	a5,s7,0x1d
    161c:	040e                	slli	s0,s0,0x3
    161e:	8c5d                	or	s0,s0,a5
    1620:	008007b7          	lui	a5,0x800
    1624:	8c5d                	or	s0,s0,a5
    1626:	c0150513          	addi	a0,a0,-1023 # 7fc01 <__min_heap_size+0x6fc01>
    162a:	003b9793          	slli	a5,s7,0x3
    162e:	4701                	li	a4,0
    1630:	002b1693          	slli	a3,s6,0x2
    1634:	8ed9                	or	a3,a3,a4
    1636:	954e                	add	a0,a0,s3
    1638:	16fd                	addi	a3,a3,-1
    163a:	4839                	li	a6,14
    163c:	015a4633          	xor	a2,s4,s5
    1640:	00150593          	addi	a1,a0,1
    1644:	10d86863          	bltu	a6,a3,1754 <__muldf3+0x1a8>
    1648:	00007517          	auipc	a0,0x7
    164c:	db050513          	addi	a0,a0,-592 # 83f8 <__srodata+0x148>
    1650:	068a                	slli	a3,a3,0x2
    1652:	96aa                	add	a3,a3,a0
    1654:	4294                	lw	a3,0(a3)
    1656:	96aa                	add	a3,a3,a0
    1658:	8682                	jr	a3
    165a:	00a4e933          	or	s2,s1,a0
    165e:	06090463          	beqz	s2,16c6 <__muldf3+0x11a>
    1662:	02048c63          	beqz	s1,169a <__muldf3+0xee>
    1666:	8526                	mv	a0,s1
    1668:	00001097          	auipc	ra,0x1
    166c:	b42080e7          	jalr	-1214(ra) # 21aa <__clzsi2>
    1670:	ff550713          	addi	a4,a0,-11
    1674:	47f1                	li	a5,28
    1676:	02e7c963          	blt	a5,a4,16a8 <__muldf3+0xfc>
    167a:	47f5                	li	a5,29
    167c:	ff850913          	addi	s2,a0,-8
    1680:	8f99                	sub	a5,a5,a4
    1682:	012494b3          	sll	s1,s1,s2
    1686:	00f457b3          	srl	a5,s0,a5
    168a:	8cdd                	or	s1,s1,a5
    168c:	01241933          	sll	s2,s0,s2
    1690:	c0d00993          	li	s3,-1011
    1694:	40a989b3          	sub	s3,s3,a0
    1698:	b78d                	j	15fa <__muldf3+0x4e>
    169a:	00001097          	auipc	ra,0x1
    169e:	b10080e7          	jalr	-1264(ra) # 21aa <__clzsi2>
    16a2:	02050513          	addi	a0,a0,32
    16a6:	b7e9                	j	1670 <__muldf3+0xc4>
    16a8:	fd850493          	addi	s1,a0,-40
    16ac:	009414b3          	sll	s1,s0,s1
    16b0:	4901                	li	s2,0
    16b2:	bff9                	j	1690 <__muldf3+0xe4>
    16b4:	00a4e933          	or	s2,s1,a0
    16b8:	00090b63          	beqz	s2,16ce <__muldf3+0x122>
    16bc:	892a                	mv	s2,a0
    16be:	7ff00993          	li	s3,2047
    16c2:	4b0d                	li	s6,3
    16c4:	bf25                	j	15fc <__muldf3+0x50>
    16c6:	4481                	li	s1,0
    16c8:	4981                	li	s3,0
    16ca:	4b05                	li	s6,1
    16cc:	bf05                	j	15fc <__muldf3+0x50>
    16ce:	4481                	li	s1,0
    16d0:	7ff00993          	li	s3,2047
    16d4:	4b09                	li	s6,2
    16d6:	b71d                	j	15fc <__muldf3+0x50>
    16d8:	017467b3          	or	a5,s0,s7
    16dc:	c3bd                	beqz	a5,1742 <__muldf3+0x196>
    16de:	02040c63          	beqz	s0,1716 <__muldf3+0x16a>
    16e2:	8522                	mv	a0,s0
    16e4:	00001097          	auipc	ra,0x1
    16e8:	ac6080e7          	jalr	-1338(ra) # 21aa <__clzsi2>
    16ec:	ff550693          	addi	a3,a0,-11
    16f0:	47f1                	li	a5,28
    16f2:	02d7ca63          	blt	a5,a3,1726 <__muldf3+0x17a>
    16f6:	4775                	li	a4,29
    16f8:	ff850793          	addi	a5,a0,-8
    16fc:	8f15                	sub	a4,a4,a3
    16fe:	00f41433          	sll	s0,s0,a5
    1702:	00ebd733          	srl	a4,s7,a4
    1706:	8c59                	or	s0,s0,a4
    1708:	00fb97b3          	sll	a5,s7,a5
    170c:	c0d00713          	li	a4,-1011
    1710:	40a70533          	sub	a0,a4,a0
    1714:	bf29                	j	162e <__muldf3+0x82>
    1716:	855e                	mv	a0,s7
    1718:	00001097          	auipc	ra,0x1
    171c:	a92080e7          	jalr	-1390(ra) # 21aa <__clzsi2>
    1720:	02050513          	addi	a0,a0,32
    1724:	b7e1                	j	16ec <__muldf3+0x140>
    1726:	fd850413          	addi	s0,a0,-40
    172a:	008b9433          	sll	s0,s7,s0
    172e:	4781                	li	a5,0
    1730:	bff1                	j	170c <__muldf3+0x160>
    1732:	017467b3          	or	a5,s0,s7
    1736:	cb91                	beqz	a5,174a <__muldf3+0x19e>
    1738:	87de                	mv	a5,s7
    173a:	7ff00513          	li	a0,2047
    173e:	470d                	li	a4,3
    1740:	bdc5                	j	1630 <__muldf3+0x84>
    1742:	4401                	li	s0,0
    1744:	4501                	li	a0,0
    1746:	4705                	li	a4,1
    1748:	b5e5                	j	1630 <__muldf3+0x84>
    174a:	4401                	li	s0,0
    174c:	7ff00513          	li	a0,2047
    1750:	4709                	li	a4,2
    1752:	bdf9                	j	1630 <__muldf3+0x84>
    1754:	6f41                	lui	t5,0x10
    1756:	ffff0e93          	addi	t4,t5,-1 # ffff <__ctor_end__+0x77bf>
    175a:	01095713          	srli	a4,s2,0x10
    175e:	0107d893          	srli	a7,a5,0x10
    1762:	01d97933          	and	s2,s2,t4
    1766:	01d7f7b3          	and	a5,a5,t4
    176a:	03288833          	mul	a6,a7,s2
    176e:	02f906b3          	mul	a3,s2,a5
    1772:	02f70fb3          	mul	t6,a4,a5
    1776:	01f80333          	add	t1,a6,t6
    177a:	0106d813          	srli	a6,a3,0x10
    177e:	981a                	add	a6,a6,t1
    1780:	03170e33          	mul	t3,a4,a7
    1784:	01f87363          	bgeu	a6,t6,178a <__muldf3+0x1de>
    1788:	9e7a                	add	t3,t3,t5
    178a:	01085393          	srli	t2,a6,0x10
    178e:	01d87833          	and	a6,a6,t4
    1792:	01d6f6b3          	and	a3,a3,t4
    1796:	01045f13          	srli	t5,s0,0x10
    179a:	01d472b3          	and	t0,s0,t4
    179e:	0842                	slli	a6,a6,0x10
    17a0:	9836                	add	a6,a6,a3
    17a2:	02570eb3          	mul	t4,a4,t0
    17a6:	025906b3          	mul	a3,s2,t0
    17aa:	032f0933          	mul	s2,t5,s2
    17ae:	01d90333          	add	t1,s2,t4
    17b2:	0106d913          	srli	s2,a3,0x10
    17b6:	991a                	add	s2,s2,t1
    17b8:	03e70733          	mul	a4,a4,t5
    17bc:	01d97463          	bgeu	s2,t4,17c4 <__muldf3+0x218>
    17c0:	6341                	lui	t1,0x10
    17c2:	971a                	add	a4,a4,t1
    17c4:	01095e93          	srli	t4,s2,0x10
    17c8:	69c1                	lui	s3,0x10
    17ca:	9eba                	add	t4,t4,a4
    17cc:	fff98713          	addi	a4,s3,-1 # ffff <__ctor_end__+0x77bf>
    17d0:	00e97933          	and	s2,s2,a4
    17d4:	8ef9                	and	a3,a3,a4
    17d6:	0104d413          	srli	s0,s1,0x10
    17da:	0942                	slli	s2,s2,0x10
    17dc:	8cf9                	and	s1,s1,a4
    17de:	02978733          	mul	a4,a5,s1
    17e2:	9936                	add	s2,s2,a3
    17e4:	93ca                	add	t2,t2,s2
    17e6:	02f40333          	mul	t1,s0,a5
    17ea:	029886b3          	mul	a3,a7,s1
    17ee:	028887b3          	mul	a5,a7,s0
    17f2:	006688b3          	add	a7,a3,t1
    17f6:	01075693          	srli	a3,a4,0x10
    17fa:	96c6                	add	a3,a3,a7
    17fc:	0066f363          	bgeu	a3,t1,1802 <__muldf3+0x256>
    1800:	97ce                	add	a5,a5,s3
    1802:	0106d893          	srli	a7,a3,0x10
    1806:	69c1                	lui	s3,0x10
    1808:	00f88fb3          	add	t6,a7,a5
    180c:	fff98793          	addi	a5,s3,-1 # ffff <__ctor_end__+0x77bf>
    1810:	029288b3          	mul	a7,t0,s1
    1814:	8efd                	and	a3,a3,a5
    1816:	8f7d                	and	a4,a4,a5
    1818:	06c2                	slli	a3,a3,0x10
    181a:	96ba                	add	a3,a3,a4
    181c:	025407b3          	mul	a5,s0,t0
    1820:	029f04b3          	mul	s1,t5,s1
    1824:	028f0333          	mul	t1,t5,s0
    1828:	94be                	add	s1,s1,a5
    182a:	0108d413          	srli	s0,a7,0x10
    182e:	94a2                	add	s1,s1,s0
    1830:	00f4f363          	bgeu	s1,a5,1836 <__muldf3+0x28a>
    1834:	934e                	add	t1,t1,s3
    1836:	67c1                	lui	a5,0x10
    1838:	17fd                	addi	a5,a5,-1
    183a:	00f4f733          	and	a4,s1,a5
    183e:	00f8f8b3          	and	a7,a7,a5
    1842:	0742                	slli	a4,a4,0x10
    1844:	9e1e                	add	t3,t3,t2
    1846:	9746                	add	a4,a4,a7
    1848:	012e3933          	sltu	s2,t3,s2
    184c:	9776                	add	a4,a4,t4
    184e:	01270433          	add	s0,a4,s2
    1852:	9e36                	add	t3,t3,a3
    1854:	00de36b3          	sltu	a3,t3,a3
    1858:	01f408b3          	add	a7,s0,t6
    185c:	00d88f33          	add	t5,a7,a3
    1860:	01d73733          	sltu	a4,a4,t4
    1864:	01243433          	sltu	s0,s0,s2
    1868:	8c59                	or	s0,s0,a4
    186a:	80c1                	srli	s1,s1,0x10
    186c:	01f8b8b3          	sltu	a7,a7,t6
    1870:	00df36b3          	sltu	a3,t5,a3
    1874:	9426                	add	s0,s0,s1
    1876:	00d8e6b3          	or	a3,a7,a3
    187a:	9436                	add	s0,s0,a3
    187c:	941a                	add	s0,s0,t1
    187e:	017f5793          	srli	a5,t5,0x17
    1882:	0426                	slli	s0,s0,0x9
    1884:	8c5d                	or	s0,s0,a5
    1886:	009e1793          	slli	a5,t3,0x9
    188a:	0107e7b3          	or	a5,a5,a6
    188e:	00f037b3          	snez	a5,a5
    1892:	017e5e13          	srli	t3,t3,0x17
    1896:	009f1713          	slli	a4,t5,0x9
    189a:	01c7e7b3          	or	a5,a5,t3
    189e:	8fd9                	or	a5,a5,a4
    18a0:	01000737          	lui	a4,0x1000
    18a4:	8f61                	and	a4,a4,s0
    18a6:	cb4d                	beqz	a4,1958 <__muldf3+0x3ac>
    18a8:	0017d713          	srli	a4,a5,0x1
    18ac:	8b85                	andi	a5,a5,1
    18ae:	8fd9                	or	a5,a5,a4
    18b0:	01f41713          	slli	a4,s0,0x1f
    18b4:	8fd9                	or	a5,a5,a4
    18b6:	8005                	srli	s0,s0,0x1
    18b8:	3ff58693          	addi	a3,a1,1023
    18bc:	0ad05063          	blez	a3,195c <__muldf3+0x3b0>
    18c0:	0077f713          	andi	a4,a5,7
    18c4:	cf01                	beqz	a4,18dc <__muldf3+0x330>
    18c6:	00f7f713          	andi	a4,a5,15
    18ca:	4511                	li	a0,4
    18cc:	00a70863          	beq	a4,a0,18dc <__muldf3+0x330>
    18d0:	00478713          	addi	a4,a5,4 # 10004 <__min_heap_size+0x4>
    18d4:	00f737b3          	sltu	a5,a4,a5
    18d8:	943e                	add	s0,s0,a5
    18da:	87ba                	mv	a5,a4
    18dc:	01000737          	lui	a4,0x1000
    18e0:	8f61                	and	a4,a4,s0
    18e2:	c719                	beqz	a4,18f0 <__muldf3+0x344>
    18e4:	ff000737          	lui	a4,0xff000
    18e8:	177d                	addi	a4,a4,-1
    18ea:	8c79                	and	s0,s0,a4
    18ec:	40058693          	addi	a3,a1,1024
    18f0:	7fe00713          	li	a4,2046
    18f4:	0ed74e63          	blt	a4,a3,19f0 <__muldf3+0x444>
    18f8:	0037d713          	srli	a4,a5,0x3
    18fc:	01d41793          	slli	a5,s0,0x1d
    1900:	8fd9                	or	a5,a5,a4
    1902:	800d                	srli	s0,s0,0x3
    1904:	01469713          	slli	a4,a3,0x14
    1908:	0432                	slli	s0,s0,0xc
    190a:	7ff006b7          	lui	a3,0x7ff00
    190e:	8f75                	and	a4,a4,a3
    1910:	8031                	srli	s0,s0,0xc
    1912:	8c59                	or	s0,s0,a4
    1914:	067e                	slli	a2,a2,0x1f
    1916:	50b2                	lw	ra,44(sp)
    1918:	00c46733          	or	a4,s0,a2
    191c:	5422                	lw	s0,40(sp)
    191e:	5492                	lw	s1,36(sp)
    1920:	5902                	lw	s2,32(sp)
    1922:	49f2                	lw	s3,28(sp)
    1924:	4a62                	lw	s4,24(sp)
    1926:	4ad2                	lw	s5,20(sp)
    1928:	4b42                	lw	s6,16(sp)
    192a:	4bb2                	lw	s7,12(sp)
    192c:	853e                	mv	a0,a5
    192e:	85ba                	mv	a1,a4
    1930:	6145                	addi	sp,sp,48
    1932:	8082                	ret
    1934:	8652                	mv	a2,s4
    1936:	8426                	mv	s0,s1
    1938:	87ca                	mv	a5,s2
    193a:	875a                	mv	a4,s6
    193c:	4689                	li	a3,2
    193e:	0ad70963          	beq	a4,a3,19f0 <__muldf3+0x444>
    1942:	468d                	li	a3,3
    1944:	08d70f63          	beq	a4,a3,19e2 <__muldf3+0x436>
    1948:	4685                	li	a3,1
    194a:	f6d717e3          	bne	a4,a3,18b8 <__muldf3+0x30c>
    194e:	4401                	li	s0,0
    1950:	4781                	li	a5,0
    1952:	a09d                	j	19b8 <__muldf3+0x40c>
    1954:	8656                	mv	a2,s5
    1956:	b7dd                	j	193c <__muldf3+0x390>
    1958:	85aa                	mv	a1,a0
    195a:	bfb9                	j	18b8 <__muldf3+0x30c>
    195c:	4505                	li	a0,1
    195e:	8d15                	sub	a0,a0,a3
    1960:	03800713          	li	a4,56
    1964:	fea745e3          	blt	a4,a0,194e <__muldf3+0x3a2>
    1968:	477d                	li	a4,31
    196a:	04a74963          	blt	a4,a0,19bc <__muldf3+0x410>
    196e:	41e58593          	addi	a1,a1,1054
    1972:	00b41733          	sll	a4,s0,a1
    1976:	00a7d6b3          	srl	a3,a5,a0
    197a:	00b797b3          	sll	a5,a5,a1
    197e:	8f55                	or	a4,a4,a3
    1980:	00f037b3          	snez	a5,a5
    1984:	8fd9                	or	a5,a5,a4
    1986:	00a45433          	srl	s0,s0,a0
    198a:	0077f713          	andi	a4,a5,7
    198e:	cf01                	beqz	a4,19a6 <__muldf3+0x3fa>
    1990:	00f7f713          	andi	a4,a5,15
    1994:	4691                	li	a3,4
    1996:	00d70863          	beq	a4,a3,19a6 <__muldf3+0x3fa>
    199a:	00478713          	addi	a4,a5,4
    199e:	00f737b3          	sltu	a5,a4,a5
    19a2:	943e                	add	s0,s0,a5
    19a4:	87ba                	mv	a5,a4
    19a6:	00800737          	lui	a4,0x800
    19aa:	8f61                	and	a4,a4,s0
    19ac:	e739                	bnez	a4,19fa <__muldf3+0x44e>
    19ae:	01d41713          	slli	a4,s0,0x1d
    19b2:	838d                	srli	a5,a5,0x3
    19b4:	8fd9                	or	a5,a5,a4
    19b6:	800d                	srli	s0,s0,0x3
    19b8:	4681                	li	a3,0
    19ba:	b7a9                	j	1904 <__muldf3+0x358>
    19bc:	5705                	li	a4,-31
    19be:	8f15                	sub	a4,a4,a3
    19c0:	02000813          	li	a6,32
    19c4:	00e45733          	srl	a4,s0,a4
    19c8:	4681                	li	a3,0
    19ca:	01050663          	beq	a0,a6,19d6 <__muldf3+0x42a>
    19ce:	43e58593          	addi	a1,a1,1086
    19d2:	00b416b3          	sll	a3,s0,a1
    19d6:	8fd5                	or	a5,a5,a3
    19d8:	00f037b3          	snez	a5,a5
    19dc:	8fd9                	or	a5,a5,a4
    19de:	4401                	li	s0,0
    19e0:	b76d                	j	198a <__muldf3+0x3de>
    19e2:	00080437          	lui	s0,0x80
    19e6:	4781                	li	a5,0
    19e8:	7ff00693          	li	a3,2047
    19ec:	4601                	li	a2,0
    19ee:	bf19                	j	1904 <__muldf3+0x358>
    19f0:	4401                	li	s0,0
    19f2:	4781                	li	a5,0
    19f4:	7ff00693          	li	a3,2047
    19f8:	b731                	j	1904 <__muldf3+0x358>
    19fa:	4401                	li	s0,0
    19fc:	4781                	li	a5,0
    19fe:	4685                	li	a3,1
    1a00:	b711                	j	1904 <__muldf3+0x358>

00001a02 <__subdf3>:
    1a02:	00100837          	lui	a6,0x100
    1a06:	187d                	addi	a6,a6,-1
    1a08:	1101                	addi	sp,sp,-32
    1a0a:	00b877b3          	and	a5,a6,a1
    1a0e:	0145d713          	srli	a4,a1,0x14
    1a12:	00d87833          	and	a6,a6,a3
    1a16:	0146d313          	srli	t1,a3,0x14
    1a1a:	cc22                	sw	s0,24(sp)
    1a1c:	078e                	slli	a5,a5,0x3
    1a1e:	7ff77413          	andi	s0,a4,2047
    1a22:	01d55713          	srli	a4,a0,0x1d
    1a26:	ca26                	sw	s1,20(sp)
    1a28:	8fd9                	or	a5,a5,a4
    1a2a:	01f5d493          	srli	s1,a1,0x1f
    1a2e:	01d65713          	srli	a4,a2,0x1d
    1a32:	00351593          	slli	a1,a0,0x3
    1a36:	080e                	slli	a6,a6,0x3
    1a38:	ce06                	sw	ra,28(sp)
    1a3a:	c84a                	sw	s2,16(sp)
    1a3c:	c64e                	sw	s3,12(sp)
    1a3e:	7ff37313          	andi	t1,t1,2047
    1a42:	7ff00513          	li	a0,2047
    1a46:	82fd                	srli	a3,a3,0x1f
    1a48:	01076733          	or	a4,a4,a6
    1a4c:	060e                	slli	a2,a2,0x3
    1a4e:	00a31563          	bne	t1,a0,1a58 <__subdf3+0x56>
    1a52:	00c76533          	or	a0,a4,a2
    1a56:	e119                	bnez	a0,1a5c <__subdf3+0x5a>
    1a58:	0016c693          	xori	a3,a3,1
    1a5c:	40640833          	sub	a6,s0,t1
    1a60:	22969863          	bne	a3,s1,1c90 <__subdf3+0x28e>
    1a64:	0f005363          	blez	a6,1b4a <__subdf3+0x148>
    1a68:	02031863          	bnez	t1,1a98 <__subdf3+0x96>
    1a6c:	00c766b3          	or	a3,a4,a2
    1a70:	58068763          	beqz	a3,1ffe <__subdf3+0x5fc>
    1a74:	fff80513          	addi	a0,a6,-1 # fffff <__min_heap_size+0xeffff>
    1a78:	e909                	bnez	a0,1a8a <__subdf3+0x88>
    1a7a:	962e                	add	a2,a2,a1
    1a7c:	00b63533          	sltu	a0,a2,a1
    1a80:	97ba                	add	a5,a5,a4
    1a82:	97aa                	add	a5,a5,a0
    1a84:	85b2                	mv	a1,a2
    1a86:	4405                	li	s0,1
    1a88:	a8b9                	j	1ae6 <__subdf3+0xe4>
    1a8a:	7ff00693          	li	a3,2047
    1a8e:	00d81d63          	bne	a6,a3,1aa8 <__subdf3+0xa6>
    1a92:	7ff00413          	li	s0,2047
    1a96:	a24d                	j	1c38 <__subdf3+0x236>
    1a98:	7ff00693          	li	a3,2047
    1a9c:	18d40e63          	beq	s0,a3,1c38 <__subdf3+0x236>
    1aa0:	008006b7          	lui	a3,0x800
    1aa4:	8f55                	or	a4,a4,a3
    1aa6:	8542                	mv	a0,a6
    1aa8:	03800693          	li	a3,56
    1aac:	08a6cb63          	blt	a3,a0,1b42 <__subdf3+0x140>
    1ab0:	46fd                	li	a3,31
    1ab2:	06a6c263          	blt	a3,a0,1b16 <__subdf3+0x114>
    1ab6:	02000813          	li	a6,32
    1aba:	40a80833          	sub	a6,a6,a0
    1abe:	010716b3          	sll	a3,a4,a6
    1ac2:	00a658b3          	srl	a7,a2,a0
    1ac6:	01061633          	sll	a2,a2,a6
    1aca:	0116e6b3          	or	a3,a3,a7
    1ace:	00c03633          	snez	a2,a2
    1ad2:	8e55                	or	a2,a2,a3
    1ad4:	00a75733          	srl	a4,a4,a0
    1ad8:	962e                	add	a2,a2,a1
    1ada:	00b63533          	sltu	a0,a2,a1
    1ade:	973e                	add	a4,a4,a5
    1ae0:	00a707b3          	add	a5,a4,a0
    1ae4:	85b2                	mv	a1,a2
    1ae6:	00800737          	lui	a4,0x800
    1aea:	8f7d                	and	a4,a4,a5
    1aec:	14070663          	beqz	a4,1c38 <__subdf3+0x236>
    1af0:	0405                	addi	s0,s0,1
    1af2:	7ff00713          	li	a4,2047
    1af6:	4ae40163          	beq	s0,a4,1f98 <__subdf3+0x596>
    1afa:	ff800737          	lui	a4,0xff800
    1afe:	177d                	addi	a4,a4,-1
    1b00:	8ff9                	and	a5,a5,a4
    1b02:	0015f513          	andi	a0,a1,1
    1b06:	0015d713          	srli	a4,a1,0x1
    1b0a:	8d59                	or	a0,a0,a4
    1b0c:	01f79593          	slli	a1,a5,0x1f
    1b10:	8dc9                	or	a1,a1,a0
    1b12:	8385                	srli	a5,a5,0x1
    1b14:	a215                	j	1c38 <__subdf3+0x236>
    1b16:	fe050693          	addi	a3,a0,-32
    1b1a:	02000893          	li	a7,32
    1b1e:	00d756b3          	srl	a3,a4,a3
    1b22:	4801                	li	a6,0
    1b24:	01150863          	beq	a0,a7,1b34 <__subdf3+0x132>
    1b28:	04000813          	li	a6,64
    1b2c:	40a80533          	sub	a0,a6,a0
    1b30:	00a71833          	sll	a6,a4,a0
    1b34:	00c86633          	or	a2,a6,a2
    1b38:	00c03633          	snez	a2,a2
    1b3c:	8e55                	or	a2,a2,a3
    1b3e:	4701                	li	a4,0
    1b40:	bf61                	j	1ad8 <__subdf3+0xd6>
    1b42:	8e59                	or	a2,a2,a4
    1b44:	00c03633          	snez	a2,a2
    1b48:	bfdd                	j	1b3e <__subdf3+0x13c>
    1b4a:	0a080b63          	beqz	a6,1c00 <__subdf3+0x1fe>
    1b4e:	40830533          	sub	a0,t1,s0
    1b52:	e40d                	bnez	s0,1b7c <__subdf3+0x17a>
    1b54:	00b7e6b3          	or	a3,a5,a1
    1b58:	42068763          	beqz	a3,1f86 <__subdf3+0x584>
    1b5c:	fff50693          	addi	a3,a0,-1
    1b60:	e699                	bnez	a3,1b6e <__subdf3+0x16c>
    1b62:	95b2                	add	a1,a1,a2
    1b64:	97ba                	add	a5,a5,a4
    1b66:	00c5b633          	sltu	a2,a1,a2
    1b6a:	97b2                	add	a5,a5,a2
    1b6c:	bf29                	j	1a86 <__subdf3+0x84>
    1b6e:	7ff00813          	li	a6,2047
    1b72:	01051d63          	bne	a0,a6,1b8c <__subdf3+0x18a>
    1b76:	87ba                	mv	a5,a4
    1b78:	85b2                	mv	a1,a2
    1b7a:	bf21                	j	1a92 <__subdf3+0x90>
    1b7c:	7ff00693          	li	a3,2047
    1b80:	fed30be3          	beq	t1,a3,1b76 <__subdf3+0x174>
    1b84:	008006b7          	lui	a3,0x800
    1b88:	8fd5                	or	a5,a5,a3
    1b8a:	86aa                	mv	a3,a0
    1b8c:	03800513          	li	a0,56
    1b90:	06d54363          	blt	a0,a3,1bf6 <__subdf3+0x1f4>
    1b94:	457d                	li	a0,31
    1b96:	02d54b63          	blt	a0,a3,1bcc <__subdf3+0x1ca>
    1b9a:	02000813          	li	a6,32
    1b9e:	40d80833          	sub	a6,a6,a3
    1ba2:	01079533          	sll	a0,a5,a6
    1ba6:	00d5d8b3          	srl	a7,a1,a3
    1baa:	010595b3          	sll	a1,a1,a6
    1bae:	01156533          	or	a0,a0,a7
    1bb2:	00b035b3          	snez	a1,a1
    1bb6:	8d4d                	or	a0,a0,a1
    1bb8:	00d7d7b3          	srl	a5,a5,a3
    1bbc:	00c505b3          	add	a1,a0,a2
    1bc0:	97ba                	add	a5,a5,a4
    1bc2:	00c5b633          	sltu	a2,a1,a2
    1bc6:	97b2                	add	a5,a5,a2
    1bc8:	841a                	mv	s0,t1
    1bca:	bf31                	j	1ae6 <__subdf3+0xe4>
    1bcc:	fe068513          	addi	a0,a3,-32 # 7fffe0 <__min_heap_size+0x7effe0>
    1bd0:	02000893          	li	a7,32
    1bd4:	00a7d833          	srl	a6,a5,a0
    1bd8:	4501                	li	a0,0
    1bda:	01168763          	beq	a3,a7,1be8 <__subdf3+0x1e6>
    1bde:	04000513          	li	a0,64
    1be2:	8d15                	sub	a0,a0,a3
    1be4:	00a79533          	sll	a0,a5,a0
    1be8:	8d4d                	or	a0,a0,a1
    1bea:	00a03533          	snez	a0,a0
    1bee:	00a86533          	or	a0,a6,a0
    1bf2:	4781                	li	a5,0
    1bf4:	b7e1                	j	1bbc <__subdf3+0x1ba>
    1bf6:	00b7e533          	or	a0,a5,a1
    1bfa:	00a03533          	snez	a0,a0
    1bfe:	bfd5                	j	1bf2 <__subdf3+0x1f0>
    1c00:	00140693          	addi	a3,s0,1 # 80001 <__min_heap_size+0x70001>
    1c04:	7fe6f513          	andi	a0,a3,2046
    1c08:	e13d                	bnez	a0,1c6e <__subdf3+0x26c>
    1c0a:	00b7e6b3          	or	a3,a5,a1
    1c0e:	e429                	bnez	s0,1c58 <__subdf3+0x256>
    1c10:	36068f63          	beqz	a3,1f8e <__subdf3+0x58c>
    1c14:	00c766b3          	or	a3,a4,a2
    1c18:	c285                	beqz	a3,1c38 <__subdf3+0x236>
    1c1a:	962e                	add	a2,a2,a1
    1c1c:	97ba                	add	a5,a5,a4
    1c1e:	00b63533          	sltu	a0,a2,a1
    1c22:	97aa                	add	a5,a5,a0
    1c24:	00800737          	lui	a4,0x800
    1c28:	8f7d                	and	a4,a4,a5
    1c2a:	85b2                	mv	a1,a2
    1c2c:	c711                	beqz	a4,1c38 <__subdf3+0x236>
    1c2e:	ff800737          	lui	a4,0xff800
    1c32:	177d                	addi	a4,a4,-1
    1c34:	8ff9                	and	a5,a5,a4
    1c36:	4405                	li	s0,1
    1c38:	0075f713          	andi	a4,a1,7
    1c3c:	36070063          	beqz	a4,1f9c <__subdf3+0x59a>
    1c40:	00f5f713          	andi	a4,a1,15
    1c44:	4691                	li	a3,4
    1c46:	34d70b63          	beq	a4,a3,1f9c <__subdf3+0x59a>
    1c4a:	00458713          	addi	a4,a1,4
    1c4e:	00b73533          	sltu	a0,a4,a1
    1c52:	97aa                	add	a5,a5,a0
    1c54:	85ba                	mv	a1,a4
    1c56:	a699                	j	1f9c <__subdf3+0x59a>
    1c58:	de99                	beqz	a3,1b76 <__subdf3+0x174>
    1c5a:	8e59                	or	a2,a2,a4
    1c5c:	e2060be3          	beqz	a2,1a92 <__subdf3+0x90>
    1c60:	4481                	li	s1,0
    1c62:	004007b7          	lui	a5,0x400
    1c66:	4581                	li	a1,0
    1c68:	7ff00413          	li	s0,2047
    1c6c:	ae05                	j	1f9c <__subdf3+0x59a>
    1c6e:	7ff00513          	li	a0,2047
    1c72:	32a68163          	beq	a3,a0,1f94 <__subdf3+0x592>
    1c76:	962e                	add	a2,a2,a1
    1c78:	00b63533          	sltu	a0,a2,a1
    1c7c:	97ba                	add	a5,a5,a4
    1c7e:	97aa                	add	a5,a5,a0
    1c80:	01f79513          	slli	a0,a5,0x1f
    1c84:	8205                	srli	a2,a2,0x1
    1c86:	00c565b3          	or	a1,a0,a2
    1c8a:	8385                	srli	a5,a5,0x1
    1c8c:	8436                	mv	s0,a3
    1c8e:	b76d                	j	1c38 <__subdf3+0x236>
    1c90:	0d005663          	blez	a6,1d5c <__subdf3+0x35a>
    1c94:	08031163          	bnez	t1,1d16 <__subdf3+0x314>
    1c98:	00c766b3          	or	a3,a4,a2
    1c9c:	36068163          	beqz	a3,1ffe <__subdf3+0x5fc>
    1ca0:	fff80513          	addi	a0,a6,-1
    1ca4:	e911                	bnez	a0,1cb8 <__subdf3+0x2b6>
    1ca6:	40c58633          	sub	a2,a1,a2
    1caa:	00c5b533          	sltu	a0,a1,a2
    1cae:	8f99                	sub	a5,a5,a4
    1cb0:	8f89                	sub	a5,a5,a0
    1cb2:	85b2                	mv	a1,a2
    1cb4:	4405                	li	s0,1
    1cb6:	a0b1                	j	1d02 <__subdf3+0x300>
    1cb8:	7ff00693          	li	a3,2047
    1cbc:	dcd80be3          	beq	a6,a3,1a92 <__subdf3+0x90>
    1cc0:	03800693          	li	a3,56
    1cc4:	08a6c863          	blt	a3,a0,1d54 <__subdf3+0x352>
    1cc8:	46fd                	li	a3,31
    1cca:	04a6cf63          	blt	a3,a0,1d28 <__subdf3+0x326>
    1cce:	02000813          	li	a6,32
    1cd2:	40a80833          	sub	a6,a6,a0
    1cd6:	010716b3          	sll	a3,a4,a6
    1cda:	00a658b3          	srl	a7,a2,a0
    1cde:	01061633          	sll	a2,a2,a6
    1ce2:	0116e6b3          	or	a3,a3,a7
    1ce6:	00c03633          	snez	a2,a2
    1cea:	8e55                	or	a2,a2,a3
    1cec:	00a75733          	srl	a4,a4,a0
    1cf0:	40c58633          	sub	a2,a1,a2
    1cf4:	00c5b533          	sltu	a0,a1,a2
    1cf8:	40e78733          	sub	a4,a5,a4
    1cfc:	40a707b3          	sub	a5,a4,a0
    1d00:	85b2                	mv	a1,a2
    1d02:	00800937          	lui	s2,0x800
    1d06:	0127f733          	and	a4,a5,s2
    1d0a:	d71d                	beqz	a4,1c38 <__subdf3+0x236>
    1d0c:	197d                	addi	s2,s2,-1
    1d0e:	0127f933          	and	s2,a5,s2
    1d12:	89ae                	mv	s3,a1
    1d14:	aa5d                	j	1eca <__subdf3+0x4c8>
    1d16:	7ff00693          	li	a3,2047
    1d1a:	f0d40fe3          	beq	s0,a3,1c38 <__subdf3+0x236>
    1d1e:	008006b7          	lui	a3,0x800
    1d22:	8f55                	or	a4,a4,a3
    1d24:	8542                	mv	a0,a6
    1d26:	bf69                	j	1cc0 <__subdf3+0x2be>
    1d28:	fe050693          	addi	a3,a0,-32
    1d2c:	02000893          	li	a7,32
    1d30:	00d756b3          	srl	a3,a4,a3
    1d34:	4801                	li	a6,0
    1d36:	01150863          	beq	a0,a7,1d46 <__subdf3+0x344>
    1d3a:	04000813          	li	a6,64
    1d3e:	40a80533          	sub	a0,a6,a0
    1d42:	00a71833          	sll	a6,a4,a0
    1d46:	00c86633          	or	a2,a6,a2
    1d4a:	00c03633          	snez	a2,a2
    1d4e:	8e55                	or	a2,a2,a3
    1d50:	4701                	li	a4,0
    1d52:	bf79                	j	1cf0 <__subdf3+0x2ee>
    1d54:	8e59                	or	a2,a2,a4
    1d56:	00c03633          	snez	a2,a2
    1d5a:	bfdd                	j	1d50 <__subdf3+0x34e>
    1d5c:	0c080563          	beqz	a6,1e26 <__subdf3+0x424>
    1d60:	40830533          	sub	a0,t1,s0
    1d64:	e81d                	bnez	s0,1d9a <__subdf3+0x398>
    1d66:	00b7e833          	or	a6,a5,a1
    1d6a:	28080c63          	beqz	a6,2002 <__subdf3+0x600>
    1d6e:	fff50813          	addi	a6,a0,-1
    1d72:	00081b63          	bnez	a6,1d88 <__subdf3+0x386>
    1d76:	40b605b3          	sub	a1,a2,a1
    1d7a:	40f707b3          	sub	a5,a4,a5
    1d7e:	00b63633          	sltu	a2,a2,a1
    1d82:	8f91                	sub	a5,a5,a2
    1d84:	84b6                	mv	s1,a3
    1d86:	b73d                	j	1cb4 <__subdf3+0x2b2>
    1d88:	7ff00893          	li	a7,2047
    1d8c:	03151063          	bne	a0,a7,1dac <__subdf3+0x3aa>
    1d90:	87ba                	mv	a5,a4
    1d92:	85b2                	mv	a1,a2
    1d94:	7ff00413          	li	s0,2047
    1d98:	a07d                	j	1e46 <__subdf3+0x444>
    1d9a:	7ff00813          	li	a6,2047
    1d9e:	ff0309e3          	beq	t1,a6,1d90 <__subdf3+0x38e>
    1da2:	00800837          	lui	a6,0x800
    1da6:	0107e7b3          	or	a5,a5,a6
    1daa:	882a                	mv	a6,a0
    1dac:	03800513          	li	a0,56
    1db0:	07054663          	blt	a0,a6,1e1c <__subdf3+0x41a>
    1db4:	457d                	li	a0,31
    1db6:	03054d63          	blt	a0,a6,1df0 <__subdf3+0x3ee>
    1dba:	02000893          	li	a7,32
    1dbe:	410888b3          	sub	a7,a7,a6
    1dc2:	01179533          	sll	a0,a5,a7
    1dc6:	0105de33          	srl	t3,a1,a6
    1dca:	011595b3          	sll	a1,a1,a7
    1dce:	01c56533          	or	a0,a0,t3
    1dd2:	00b035b3          	snez	a1,a1
    1dd6:	8d4d                	or	a0,a0,a1
    1dd8:	0107d7b3          	srl	a5,a5,a6
    1ddc:	40a605b3          	sub	a1,a2,a0
    1de0:	40f707b3          	sub	a5,a4,a5
    1de4:	00b63633          	sltu	a2,a2,a1
    1de8:	8f91                	sub	a5,a5,a2
    1dea:	841a                	mv	s0,t1
    1dec:	84b6                	mv	s1,a3
    1dee:	bf11                	j	1d02 <__subdf3+0x300>
    1df0:	fe080513          	addi	a0,a6,-32 # 7fffe0 <__min_heap_size+0x7effe0>
    1df4:	02000e13          	li	t3,32
    1df8:	00a7d8b3          	srl	a7,a5,a0
    1dfc:	4501                	li	a0,0
    1dfe:	01c80863          	beq	a6,t3,1e0e <__subdf3+0x40c>
    1e02:	04000513          	li	a0,64
    1e06:	41050533          	sub	a0,a0,a6
    1e0a:	00a79533          	sll	a0,a5,a0
    1e0e:	8d4d                	or	a0,a0,a1
    1e10:	00a03533          	snez	a0,a0
    1e14:	00a8e533          	or	a0,a7,a0
    1e18:	4781                	li	a5,0
    1e1a:	b7c9                	j	1ddc <__subdf3+0x3da>
    1e1c:	00b7e533          	or	a0,a5,a1
    1e20:	00a03533          	snez	a0,a0
    1e24:	bfd5                	j	1e18 <__subdf3+0x416>
    1e26:	00140513          	addi	a0,s0,1
    1e2a:	7fe57513          	andi	a0,a0,2046
    1e2e:	e925                	bnez	a0,1e9e <__subdf3+0x49c>
    1e30:	00b7e833          	or	a6,a5,a1
    1e34:	00c76533          	or	a0,a4,a2
    1e38:	e821                	bnez	s0,1e88 <__subdf3+0x486>
    1e3a:	00081863          	bnez	a6,1e4a <__subdf3+0x448>
    1e3e:	1c050663          	beqz	a0,200a <__subdf3+0x608>
    1e42:	87ba                	mv	a5,a4
    1e44:	85b2                	mv	a1,a2
    1e46:	84b6                	mv	s1,a3
    1e48:	bbc5                	j	1c38 <__subdf3+0x236>
    1e4a:	de0507e3          	beqz	a0,1c38 <__subdf3+0x236>
    1e4e:	40c58833          	sub	a6,a1,a2
    1e52:	0105b8b3          	sltu	a7,a1,a6
    1e56:	40e78533          	sub	a0,a5,a4
    1e5a:	41150533          	sub	a0,a0,a7
    1e5e:	008008b7          	lui	a7,0x800
    1e62:	011578b3          	and	a7,a0,a7
    1e66:	00088a63          	beqz	a7,1e7a <__subdf3+0x478>
    1e6a:	40b605b3          	sub	a1,a2,a1
    1e6e:	40f707b3          	sub	a5,a4,a5
    1e72:	00b63633          	sltu	a2,a2,a1
    1e76:	8f91                	sub	a5,a5,a2
    1e78:	b7f9                	j	1e46 <__subdf3+0x444>
    1e7a:	00a865b3          	or	a1,a6,a0
    1e7e:	18058a63          	beqz	a1,2012 <__subdf3+0x610>
    1e82:	87aa                	mv	a5,a0
    1e84:	85c2                	mv	a1,a6
    1e86:	bb4d                	j	1c38 <__subdf3+0x236>
    1e88:	00081863          	bnez	a6,1e98 <__subdf3+0x496>
    1e8c:	18050563          	beqz	a0,2016 <__subdf3+0x614>
    1e90:	87ba                	mv	a5,a4
    1e92:	85b2                	mv	a1,a2
    1e94:	84b6                	mv	s1,a3
    1e96:	bef5                	j	1a92 <__subdf3+0x90>
    1e98:	be050de3          	beqz	a0,1a92 <__subdf3+0x90>
    1e9c:	b3d1                	j	1c60 <__subdf3+0x25e>
    1e9e:	40c589b3          	sub	s3,a1,a2
    1ea2:	0135b533          	sltu	a0,a1,s3
    1ea6:	40e78933          	sub	s2,a5,a4
    1eaa:	40a90933          	sub	s2,s2,a0
    1eae:	00800537          	lui	a0,0x800
    1eb2:	00a97533          	and	a0,s2,a0
    1eb6:	c935                	beqz	a0,1f2a <__subdf3+0x528>
    1eb8:	40b609b3          	sub	s3,a2,a1
    1ebc:	40f707b3          	sub	a5,a4,a5
    1ec0:	01363633          	sltu	a2,a2,s3
    1ec4:	40c78933          	sub	s2,a5,a2
    1ec8:	84b6                	mv	s1,a3
    1eca:	06090663          	beqz	s2,1f36 <__subdf3+0x534>
    1ece:	854a                	mv	a0,s2
    1ed0:	00000097          	auipc	ra,0x0
    1ed4:	2da080e7          	jalr	730(ra) # 21aa <__clzsi2>
    1ed8:	ff850713          	addi	a4,a0,-8 # 7ffff8 <__min_heap_size+0x7efff8>
    1edc:	47fd                	li	a5,31
    1ede:	06e7c463          	blt	a5,a4,1f46 <__subdf3+0x544>
    1ee2:	02000793          	li	a5,32
    1ee6:	8f99                	sub	a5,a5,a4
    1ee8:	00e91933          	sll	s2,s2,a4
    1eec:	00f9d7b3          	srl	a5,s3,a5
    1ef0:	0127e7b3          	or	a5,a5,s2
    1ef4:	00e995b3          	sll	a1,s3,a4
    1ef8:	08874163          	blt	a4,s0,1f7a <__subdf3+0x578>
    1efc:	8f01                	sub	a4,a4,s0
    1efe:	00170693          	addi	a3,a4,1 # ff800001 <__heap_end+0xdf7e0001>
    1f02:	467d                	li	a2,31
    1f04:	04d64763          	blt	a2,a3,1f52 <__subdf3+0x550>
    1f08:	02000713          	li	a4,32
    1f0c:	8f15                	sub	a4,a4,a3
    1f0e:	00e79633          	sll	a2,a5,a4
    1f12:	00d5d533          	srl	a0,a1,a3
    1f16:	00e595b3          	sll	a1,a1,a4
    1f1a:	8e49                	or	a2,a2,a0
    1f1c:	00b035b3          	snez	a1,a1
    1f20:	8dd1                	or	a1,a1,a2
    1f22:	00d7d7b3          	srl	a5,a5,a3
    1f26:	4401                	li	s0,0
    1f28:	bb01                	j	1c38 <__subdf3+0x236>
    1f2a:	0129e5b3          	or	a1,s3,s2
    1f2e:	fdd1                	bnez	a1,1eca <__subdf3+0x4c8>
    1f30:	4781                	li	a5,0
    1f32:	4401                	li	s0,0
    1f34:	a8e9                	j	200e <__subdf3+0x60c>
    1f36:	854e                	mv	a0,s3
    1f38:	00000097          	auipc	ra,0x0
    1f3c:	272080e7          	jalr	626(ra) # 21aa <__clzsi2>
    1f40:	02050513          	addi	a0,a0,32
    1f44:	bf51                	j	1ed8 <__subdf3+0x4d6>
    1f46:	fd850793          	addi	a5,a0,-40
    1f4a:	00f997b3          	sll	a5,s3,a5
    1f4e:	4581                	li	a1,0
    1f50:	b765                	j	1ef8 <__subdf3+0x4f6>
    1f52:	1705                	addi	a4,a4,-31
    1f54:	02000613          	li	a2,32
    1f58:	00e7d733          	srl	a4,a5,a4
    1f5c:	4501                	li	a0,0
    1f5e:	00c68763          	beq	a3,a2,1f6c <__subdf3+0x56a>
    1f62:	04000513          	li	a0,64
    1f66:	8d15                	sub	a0,a0,a3
    1f68:	00a79533          	sll	a0,a5,a0
    1f6c:	8d4d                	or	a0,a0,a1
    1f6e:	00a03533          	snez	a0,a0
    1f72:	00a765b3          	or	a1,a4,a0
    1f76:	4781                	li	a5,0
    1f78:	b77d                	j	1f26 <__subdf3+0x524>
    1f7a:	8c19                	sub	s0,s0,a4
    1f7c:	ff800737          	lui	a4,0xff800
    1f80:	177d                	addi	a4,a4,-1
    1f82:	8ff9                	and	a5,a5,a4
    1f84:	b955                	j	1c38 <__subdf3+0x236>
    1f86:	87ba                	mv	a5,a4
    1f88:	85b2                	mv	a1,a2
    1f8a:	842a                	mv	s0,a0
    1f8c:	b175                	j	1c38 <__subdf3+0x236>
    1f8e:	87ba                	mv	a5,a4
    1f90:	85b2                	mv	a1,a2
    1f92:	b15d                	j	1c38 <__subdf3+0x236>
    1f94:	7ff00413          	li	s0,2047
    1f98:	4781                	li	a5,0
    1f9a:	4581                	li	a1,0
    1f9c:	00800737          	lui	a4,0x800
    1fa0:	8f7d                	and	a4,a4,a5
    1fa2:	cb11                	beqz	a4,1fb6 <__subdf3+0x5b4>
    1fa4:	0405                	addi	s0,s0,1
    1fa6:	7ff00713          	li	a4,2047
    1faa:	06e40b63          	beq	s0,a4,2020 <__subdf3+0x61e>
    1fae:	ff800737          	lui	a4,0xff800
    1fb2:	177d                	addi	a4,a4,-1
    1fb4:	8ff9                	and	a5,a5,a4
    1fb6:	01d79713          	slli	a4,a5,0x1d
    1fba:	0035d513          	srli	a0,a1,0x3
    1fbe:	8d59                	or	a0,a0,a4
    1fc0:	7ff00713          	li	a4,2047
    1fc4:	838d                	srli	a5,a5,0x3
    1fc6:	00e41963          	bne	s0,a4,1fd8 <__subdf3+0x5d6>
    1fca:	8d5d                	or	a0,a0,a5
    1fcc:	4781                	li	a5,0
    1fce:	c509                	beqz	a0,1fd8 <__subdf3+0x5d6>
    1fd0:	000807b7          	lui	a5,0x80
    1fd4:	4501                	li	a0,0
    1fd6:	4481                	li	s1,0
    1fd8:	01441713          	slli	a4,s0,0x14
    1fdc:	7ff006b7          	lui	a3,0x7ff00
    1fe0:	07b2                	slli	a5,a5,0xc
    1fe2:	40f2                	lw	ra,28(sp)
    1fe4:	4462                	lw	s0,24(sp)
    1fe6:	8f75                	and	a4,a4,a3
    1fe8:	83b1                	srli	a5,a5,0xc
    1fea:	04fe                	slli	s1,s1,0x1f
    1fec:	8fd9                	or	a5,a5,a4
    1fee:	0097e733          	or	a4,a5,s1
    1ff2:	4942                	lw	s2,16(sp)
    1ff4:	44d2                	lw	s1,20(sp)
    1ff6:	49b2                	lw	s3,12(sp)
    1ff8:	85ba                	mv	a1,a4
    1ffa:	6105                	addi	sp,sp,32
    1ffc:	8082                	ret
    1ffe:	8442                	mv	s0,a6
    2000:	b925                	j	1c38 <__subdf3+0x236>
    2002:	87ba                	mv	a5,a4
    2004:	85b2                	mv	a1,a2
    2006:	842a                	mv	s0,a0
    2008:	bd3d                	j	1e46 <__subdf3+0x444>
    200a:	4781                	li	a5,0
    200c:	4581                	li	a1,0
    200e:	4481                	li	s1,0
    2010:	b771                	j	1f9c <__subdf3+0x59a>
    2012:	4781                	li	a5,0
    2014:	bfed                	j	200e <__subdf3+0x60c>
    2016:	4581                	li	a1,0
    2018:	4481                	li	s1,0
    201a:	004007b7          	lui	a5,0x400
    201e:	b1a9                	j	1c68 <__subdf3+0x266>
    2020:	4781                	li	a5,0
    2022:	4581                	li	a1,0
    2024:	bf49                	j	1fb6 <__subdf3+0x5b4>

00002026 <__fixdfsi>:
    2026:	0145d713          	srli	a4,a1,0x14
    202a:	001006b7          	lui	a3,0x100
    202e:	fff68793          	addi	a5,a3,-1 # fffff <__min_heap_size+0xeffff>
    2032:	7ff77713          	andi	a4,a4,2047
    2036:	3fe00613          	li	a2,1022
    203a:	8fed                	and	a5,a5,a1
    203c:	81fd                	srli	a1,a1,0x1f
    203e:	04e65463          	bge	a2,a4,2086 <__fixdfsi+0x60>
    2042:	41d00613          	li	a2,1053
    2046:	00e65863          	bge	a2,a4,2056 <__fixdfsi+0x30>
    204a:	80000537          	lui	a0,0x80000
    204e:	fff54513          	not	a0,a0
    2052:	952e                	add	a0,a0,a1
    2054:	8082                	ret
    2056:	8fd5                	or	a5,a5,a3
    2058:	43300693          	li	a3,1075
    205c:	8e99                	sub	a3,a3,a4
    205e:	467d                	li	a2,31
    2060:	00d64d63          	blt	a2,a3,207a <__fixdfsi+0x54>
    2064:	bed70713          	addi	a4,a4,-1043 # ff7ffbed <__heap_end+0xdf7dfbed>
    2068:	00e797b3          	sll	a5,a5,a4
    206c:	00d55533          	srl	a0,a0,a3
    2070:	8d5d                	or	a0,a0,a5
    2072:	c999                	beqz	a1,2088 <__fixdfsi+0x62>
    2074:	40a00533          	neg	a0,a0
    2078:	8082                	ret
    207a:	41300513          	li	a0,1043
    207e:	8d19                	sub	a0,a0,a4
    2080:	00a7d533          	srl	a0,a5,a0
    2084:	b7fd                	j	2072 <__fixdfsi+0x4c>
    2086:	4501                	li	a0,0
    2088:	8082                	ret

0000208a <__fixunsdfsi>:
    208a:	0145d713          	srli	a4,a1,0x14
    208e:	00100837          	lui	a6,0x100
    2092:	fff80793          	addi	a5,a6,-1 # fffff <__min_heap_size+0xeffff>
    2096:	7ff77713          	andi	a4,a4,2047
    209a:	3fe00613          	li	a2,1022
    209e:	8fed                	and	a5,a5,a1
    20a0:	86aa                	mv	a3,a0
    20a2:	81fd                	srli	a1,a1,0x1f
    20a4:	04e65163          	bge	a2,a4,20e6 <__fixunsdfsi+0x5c>
    20a8:	41f00613          	li	a2,1055
    20ac:	8e0d                	sub	a2,a2,a1
    20ae:	fff58513          	addi	a0,a1,-1
    20b2:	02c75b63          	bge	a4,a2,20e8 <__fixunsdfsi+0x5e>
    20b6:	4501                	li	a0,0
    20b8:	e985                	bnez	a1,20e8 <__fixunsdfsi+0x5e>
    20ba:	43300513          	li	a0,1075
    20be:	8d19                	sub	a0,a0,a4
    20c0:	467d                	li	a2,31
    20c2:	0107e7b3          	or	a5,a5,a6
    20c6:	00a64a63          	blt	a2,a0,20da <__fixunsdfsi+0x50>
    20ca:	bed70713          	addi	a4,a4,-1043
    20ce:	00e797b3          	sll	a5,a5,a4
    20d2:	00a6d533          	srl	a0,a3,a0
    20d6:	8d5d                	or	a0,a0,a5
    20d8:	8082                	ret
    20da:	41300513          	li	a0,1043
    20de:	8d19                	sub	a0,a0,a4
    20e0:	00a7d533          	srl	a0,a5,a0
    20e4:	8082                	ret
    20e6:	4501                	li	a0,0
    20e8:	8082                	ret

000020ea <__floatsidf>:
    20ea:	1141                	addi	sp,sp,-16
    20ec:	c606                	sw	ra,12(sp)
    20ee:	c422                	sw	s0,8(sp)
    20f0:	c226                	sw	s1,4(sp)
    20f2:	cd39                	beqz	a0,2150 <__floatsidf+0x66>
    20f4:	41f55793          	srai	a5,a0,0x1f
    20f8:	00a7c433          	xor	s0,a5,a0
    20fc:	8c1d                	sub	s0,s0,a5
    20fe:	01f55493          	srli	s1,a0,0x1f
    2102:	8522                	mv	a0,s0
    2104:	00000097          	auipc	ra,0x0
    2108:	0a6080e7          	jalr	166(ra) # 21aa <__clzsi2>
    210c:	41e00713          	li	a4,1054
    2110:	47a9                	li	a5,10
    2112:	8f09                	sub	a4,a4,a0
    2114:	02a7c863          	blt	a5,a0,2144 <__floatsidf+0x5a>
    2118:	47ad                	li	a5,11
    211a:	8f89                	sub	a5,a5,a0
    211c:	0555                	addi	a0,a0,21
    211e:	00f457b3          	srl	a5,s0,a5
    2122:	00a41433          	sll	s0,s0,a0
    2126:	8526                	mv	a0,s1
    2128:	07b2                	slli	a5,a5,0xc
    212a:	0752                	slli	a4,a4,0x14
    212c:	83b1                	srli	a5,a5,0xc
    212e:	057e                	slli	a0,a0,0x1f
    2130:	8fd9                	or	a5,a5,a4
    2132:	40b2                	lw	ra,12(sp)
    2134:	00a7e733          	or	a4,a5,a0
    2138:	8522                	mv	a0,s0
    213a:	4422                	lw	s0,8(sp)
    213c:	4492                	lw	s1,4(sp)
    213e:	85ba                	mv	a1,a4
    2140:	0141                	addi	sp,sp,16
    2142:	8082                	ret
    2144:	1555                	addi	a0,a0,-11
    2146:	00a417b3          	sll	a5,s0,a0
    214a:	8526                	mv	a0,s1
    214c:	4401                	li	s0,0
    214e:	bfe9                	j	2128 <__floatsidf+0x3e>
    2150:	4701                	li	a4,0
    2152:	4781                	li	a5,0
    2154:	bfe5                	j	214c <__floatsidf+0x62>

00002156 <__floatunsidf>:
    2156:	1141                	addi	sp,sp,-16
    2158:	c422                	sw	s0,8(sp)
    215a:	c606                	sw	ra,12(sp)
    215c:	842a                	mv	s0,a0
    215e:	c139                	beqz	a0,21a4 <__floatunsidf+0x4e>
    2160:	00000097          	auipc	ra,0x0
    2164:	04a080e7          	jalr	74(ra) # 21aa <__clzsi2>
    2168:	41e00713          	li	a4,1054
    216c:	47a9                	li	a5,10
    216e:	8f09                	sub	a4,a4,a0
    2170:	02a7c463          	blt	a5,a0,2198 <__floatunsidf+0x42>
    2174:	47ad                	li	a5,11
    2176:	8f89                	sub	a5,a5,a0
    2178:	0555                	addi	a0,a0,21
    217a:	00f457b3          	srl	a5,s0,a5
    217e:	00a41433          	sll	s0,s0,a0
    2182:	40b2                	lw	ra,12(sp)
    2184:	8522                	mv	a0,s0
    2186:	07b2                	slli	a5,a5,0xc
    2188:	4422                	lw	s0,8(sp)
    218a:	0752                	slli	a4,a4,0x14
    218c:	83b1                	srli	a5,a5,0xc
    218e:	00f766b3          	or	a3,a4,a5
    2192:	85b6                	mv	a1,a3
    2194:	0141                	addi	sp,sp,16
    2196:	8082                	ret
    2198:	ff550793          	addi	a5,a0,-11 # 7ffffff5 <__heap_end+0x5ffdfff5>
    219c:	00f417b3          	sll	a5,s0,a5
    21a0:	4401                	li	s0,0
    21a2:	b7c5                	j	2182 <__floatunsidf+0x2c>
    21a4:	4781                	li	a5,0
    21a6:	4701                	li	a4,0
    21a8:	bfe9                	j	2182 <__floatunsidf+0x2c>

000021aa <__clzsi2>:
    21aa:	67c1                	lui	a5,0x10
    21ac:	02f57663          	bgeu	a0,a5,21d8 <__clzsi2+0x2e>
    21b0:	0ff00793          	li	a5,255
    21b4:	00a7b7b3          	sltu	a5,a5,a0
    21b8:	078e                	slli	a5,a5,0x3
    21ba:	02000713          	li	a4,32
    21be:	8f1d                	sub	a4,a4,a5
    21c0:	00f55533          	srl	a0,a0,a5
    21c4:	00006797          	auipc	a5,0x6
    21c8:	27078793          	addi	a5,a5,624 # 8434 <__clz_tab>
    21cc:	953e                	add	a0,a0,a5
    21ce:	00054503          	lbu	a0,0(a0)
    21d2:	40a70533          	sub	a0,a4,a0
    21d6:	8082                	ret
    21d8:	01000737          	lui	a4,0x1000
    21dc:	47c1                	li	a5,16
    21de:	fce56ee3          	bltu	a0,a4,21ba <__clzsi2+0x10>
    21e2:	47e1                	li	a5,24
    21e4:	bfd9                	j	21ba <__clzsi2+0x10>
	...

000021e8 <memset>:
    21e8:	433d                	li	t1,15
    21ea:	872a                	mv	a4,a0
    21ec:	02c37563          	bgeu	t1,a2,2216 <memset+0x2e>
    21f0:	00f77793          	andi	a5,a4,15
    21f4:	e3c9                	bnez	a5,2276 <memset+0x8e>
    21f6:	06059763          	bnez	a1,2264 <memset+0x7c>
    21fa:	ff067693          	andi	a3,a2,-16
    21fe:	8a3d                	andi	a2,a2,15
    2200:	96ba                	add	a3,a3,a4
    2202:	c30c                	sw	a1,0(a4)
    2204:	c34c                	sw	a1,4(a4)
    2206:	c70c                	sw	a1,8(a4)
    2208:	c74c                	sw	a1,12(a4)
    220a:	0741                	addi	a4,a4,16
    220c:	fed76be3          	bltu	a4,a3,2202 <memset+0x1a>
    2210:	00061363          	bnez	a2,2216 <memset+0x2e>
    2214:	8082                	ret
    2216:	40c306b3          	sub	a3,t1,a2
    221a:	068a                	slli	a3,a3,0x2
    221c:	00000297          	auipc	t0,0x0
    2220:	9696                	add	a3,a3,t0
    2222:	00a68067          	jr	10(a3)
    2226:	00b70723          	sb	a1,14(a4) # 100000e <__min_heap_size+0xff000e>
    222a:	00b706a3          	sb	a1,13(a4)
    222e:	00b70623          	sb	a1,12(a4)
    2232:	00b705a3          	sb	a1,11(a4)
    2236:	00b70523          	sb	a1,10(a4)
    223a:	00b704a3          	sb	a1,9(a4)
    223e:	00b70423          	sb	a1,8(a4)
    2242:	00b703a3          	sb	a1,7(a4)
    2246:	00b70323          	sb	a1,6(a4)
    224a:	00b702a3          	sb	a1,5(a4)
    224e:	00b70223          	sb	a1,4(a4)
    2252:	00b701a3          	sb	a1,3(a4)
    2256:	00b70123          	sb	a1,2(a4)
    225a:	00b700a3          	sb	a1,1(a4)
    225e:	00b70023          	sb	a1,0(a4)
    2262:	8082                	ret
    2264:	0ff5f593          	andi	a1,a1,255
    2268:	00859693          	slli	a3,a1,0x8
    226c:	8dd5                	or	a1,a1,a3
    226e:	01059693          	slli	a3,a1,0x10
    2272:	8dd5                	or	a1,a1,a3
    2274:	b759                	j	21fa <memset+0x12>
    2276:	00279693          	slli	a3,a5,0x2
    227a:	00000297          	auipc	t0,0x0
    227e:	9696                	add	a3,a3,t0
    2280:	8286                	mv	t0,ra
    2282:	fa8680e7          	jalr	-88(a3)
    2286:	8096                	mv	ra,t0
    2288:	17c1                	addi	a5,a5,-16
    228a:	8f1d                	sub	a4,a4,a5
    228c:	963e                	add	a2,a2,a5
    228e:	f8c374e3          	bgeu	t1,a2,2216 <memset+0x2e>
    2292:	b795                	j	21f6 <memset+0xe>
	...

00002296 <board_init>:

extern int clock_timer_init(void);
extern int clock_timer_start(void);

void board_init(void)
{
    2296:	1101                	addi	sp,sp,-32
    2298:	ce06                	sw	ra,28(sp)
    229a:	cc22                	sw	s0,24(sp)
    229c:	1000                	addi	s0,sp,32
    int32_t ret = 0;
    229e:	fe042623          	sw	zero,-20(s0)
    /* init the console*/
    clock_timer_init();
    22a2:	00002097          	auipc	ra,0x2
    22a6:	ba6080e7          	jalr	-1114(ra) # 3e48 <clock_timer_init>
    clock_timer_start();
    22aa:	00002097          	auipc	ra,0x2
    22ae:	cae080e7          	jalr	-850(ra) # 3f58 <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    22b2:	4581                	li	a1,0
    22b4:	4501                	li	a0,0
    22b6:	00001097          	auipc	ra,0x1
    22ba:	a52080e7          	jalr	-1454(ra) # 2d08 <csi_usart_initialize>
    22be:	872a                	mv	a4,a0
    22c0:	2000a7b7          	lui	a5,0x2000a
    22c4:	60e7a023          	sw	a4,1536(a5) # 2000a600 <console_handle>
    /* config the UART */
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    22c8:	2000a7b7          	lui	a5,0x2000a
    22cc:	6007a503          	lw	a0,1536(a5) # 2000a600 <console_handle>
    22d0:	478d                	li	a5,3
    22d2:	4701                	li	a4,0
    22d4:	4681                	li	a3,0
    22d6:	4601                	li	a2,0
    22d8:	65f1                	lui	a1,0x1c
    22da:	20058593          	addi	a1,a1,512 # 1c200 <__min_heap_size+0xc200>
    22de:	00001097          	auipc	ra,0x1
    22e2:	afe080e7          	jalr	-1282(ra) # 2ddc <csi_usart_config>
    22e6:	fea42623          	sw	a0,-20(s0)

    if (ret < 0) {
        return;
    }
}
    22ea:	40f2                	lw	ra,28(sp)
    22ec:	4462                	lw	s0,24(sp)
    22ee:	6105                	addi	sp,sp,32
    22f0:	8082                	ret

000022f2 <csi_vic_enable_irq>:
  \brief   Enable External Interrupt
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__STATIC_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    22f2:	1101                	addi	sp,sp,-32
    22f4:	ce22                	sw	s0,28(sp)
    22f6:	1000                	addi	s0,sp,32
    22f8:	fea42623          	sw	a0,-20(s0)
    CLIC->CLICINT[IRQn].IE |= CLIC_INTIE_IE_Msk;
    22fc:	e0800737          	lui	a4,0xe0800
    2300:	fec42783          	lw	a5,-20(s0)
    2304:	40078793          	addi	a5,a5,1024
    2308:	078a                	slli	a5,a5,0x2
    230a:	97ba                	add	a5,a5,a4
    230c:	0017c783          	lbu	a5,1(a5)
    2310:	0ff7f793          	andi	a5,a5,255
    2314:	e08006b7          	lui	a3,0xe0800
    2318:	0017e793          	ori	a5,a5,1
    231c:	0ff7f713          	andi	a4,a5,255
    2320:	fec42783          	lw	a5,-20(s0)
    2324:	40078793          	addi	a5,a5,1024
    2328:	078a                	slli	a5,a5,0x2
    232a:	97b6                	add	a5,a5,a3
    232c:	00e780a3          	sb	a4,1(a5)
}
    2330:	0001                	nop
    2332:	4472                	lw	s0,28(sp)
    2334:	6105                	addi	sp,sp,32
    2336:	8082                	ret

00002338 <drv_irq_enable>:
  \brief       enable irq.
  \param[in]   irq_num Number of IRQ.
  \return      None.
*/
void drv_irq_enable(uint32_t irq_num)
{
    2338:	1101                	addi	sp,sp,-32
    233a:	ce06                	sw	ra,28(sp)
    233c:	cc22                	sw	s0,24(sp)
    233e:	1000                	addi	s0,sp,32
    2340:	fea42623          	sw	a0,-20(s0)
    if (NMI_EXPn != irq_num) {
    2344:	fec42703          	lw	a4,-20(s0)
    2348:	57f9                	li	a5,-2
    234a:	00f70963          	beq	a4,a5,235c <drv_irq_enable+0x24>
    #ifdef CONFIG_SYSTEM_SECURE
        csi_vic_enable_sirq(irq_num);
    #else
        csi_vic_enable_irq(irq_num);
    234e:	fec42783          	lw	a5,-20(s0)
    2352:	853e                	mv	a0,a5
    2354:	00000097          	auipc	ra,0x0
    2358:	f9e080e7          	jalr	-98(ra) # 22f2 <csi_vic_enable_irq>
    #endif
    }
}
    235c:	0001                	nop
    235e:	40f2                	lw	ra,28(sp)
    2360:	4462                	lw	s0,24(sp)
    2362:	6105                	addi	sp,sp,32
    2364:	8082                	ret

00002366 <drv_irq_register>:
  \param[in]   irq_num Number of IRQ.
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    2366:	1101                	addi	sp,sp,-32
    2368:	ce22                	sw	s0,28(sp)
    236a:	1000                	addi	s0,sp,32
    236c:	fea42623          	sw	a0,-20(s0)
    2370:	feb42423          	sw	a1,-24(s0)
    if (NMI_EXPn != irq_num) {
    2374:	fec42703          	lw	a4,-20(s0)
    2378:	57f9                	li	a5,-2
    237a:	00f70d63          	beq	a4,a5,2394 <drv_irq_register+0x2e>
        g_irqvector[irq_num] = irq_handler;
    237e:	fe842683          	lw	a3,-24(s0)
    2382:	2000a7b7          	lui	a5,0x2000a
    2386:	52478793          	addi	a5,a5,1316 # 2000a524 <g_irqvector>
    238a:	fec42703          	lw	a4,-20(s0)
    238e:	44e7d68b          	srw	a3,a5,a4,2
    } else {
        g_nmivector = irq_handler;
    }
}
    2392:	a039                	j	23a0 <drv_irq_register+0x3a>
        g_nmivector = irq_handler;
    2394:	fe842703          	lw	a4,-24(s0)
    2398:	2000a7b7          	lui	a5,0x2000a
    239c:	5ee7a223          	sw	a4,1508(a5) # 2000a5e4 <g_nmivector>
}
    23a0:	0001                	nop
    23a2:	4472                	lw	s0,28(sp)
    23a4:	6105                	addi	sp,sp,32
    23a6:	8082                	ret

000023a8 <csi_usart_config_baudrate>:
  \brief       set the bautrate of usart.
  \param[in]   addr  usart base to operate.
  \return      error code
*/
int32_t csi_usart_config_baudrate(usart_handle_t handle, uint32_t baud)
{
    23a8:	7179                	addi	sp,sp,-48
    23aa:	d606                	sw	ra,44(sp)
    23ac:	d422                	sw	s0,40(sp)
    23ae:	1800                	addi	s0,sp,48
    23b0:	fca42e23          	sw	a0,-36(s0)
    23b4:	fcb42c23          	sw	a1,-40(s0)
    USART_NULL_PARAM_CHK(handle);
    23b8:	fdc42783          	lw	a5,-36(s0)
    23bc:	e791                	bnez	a5,23c8 <csi_usart_config_baudrate+0x20>
    23be:	810207b7          	lui	a5,0x81020
    23c2:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    23c6:	a8cd                	j	24b8 <csi_usart_config_baudrate+0x110>
    ck_usart_priv_t *usart_priv = handle;
    23c8:	fdc42783          	lw	a5,-36(s0)
    23cc:	fef42223          	sw	a5,-28(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    23d0:	fe442783          	lw	a5,-28(s0)
    23d4:	439c                	lw	a5,0(a5)
    23d6:	fef42023          	sw	a5,-32(s0)


    WAIT_USART_IDLE(addr);
    23da:	fe042623          	sw	zero,-20(s0)
    23de:	a031                	j	23ea <csi_usart_config_baudrate+0x42>
    23e0:	fec42783          	lw	a5,-20(s0)
    23e4:	0785                	addi	a5,a5,1
    23e6:	fef42623          	sw	a5,-20(s0)
    23ea:	fe042783          	lw	a5,-32(s0)
    23ee:	5ffc                	lw	a5,124(a5)
    23f0:	8b85                	andi	a5,a5,1
    23f2:	cb89                	beqz	a5,2404 <csi_usart_config_baudrate+0x5c>
    23f4:	fec42703          	lw	a4,-20(s0)
    23f8:	000f47b7          	lui	a5,0xf4
    23fc:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2400:	fee7d0e3          	bge	a5,a4,23e0 <csi_usart_config_baudrate+0x38>
    2404:	fec42703          	lw	a4,-20(s0)
    2408:	000f47b7          	lui	a5,0xf4
    240c:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2410:	00e7d763          	bge	a5,a4,241e <csi_usart_config_baudrate+0x76>
    2414:	810207b7          	lui	a5,0x81020
    2418:	08278793          	addi	a5,a5,130 # 81020082 <__heap_end+0x61000082>
    241c:	a871                	j	24b8 <csi_usart_config_baudrate+0x110>

    /* baudrate=(seriak clock freq)/(16*divisor); algorithm :rounding*/
    uint32_t divisor = ((drv_get_usart_freq(usart_priv->idx)  * 10) / baud) >> 4;
    241e:	fe442783          	lw	a5,-28(s0)
    2422:	5bdc                	lw	a5,52(a5)
    2424:	853e                	mv	a0,a5
    2426:	00001097          	auipc	ra,0x1
    242a:	40c080e7          	jalr	1036(ra) # 3832 <drv_get_usart_freq>
    242e:	872a                	mv	a4,a0
    2430:	87ba                	mv	a5,a4
    2432:	078a                	slli	a5,a5,0x2
    2434:	97ba                	add	a5,a5,a4
    2436:	0786                	slli	a5,a5,0x1
    2438:	873e                	mv	a4,a5
    243a:	fd842783          	lw	a5,-40(s0)
    243e:	02f757b3          	divu	a5,a4,a5
    2442:	8391                	srli	a5,a5,0x4
    2444:	fef42423          	sw	a5,-24(s0)

    if ((divisor % 10) >= 5) {
    2448:	fe842703          	lw	a4,-24(s0)
    244c:	47a9                	li	a5,10
    244e:	02f77733          	remu	a4,a4,a5
    2452:	4791                	li	a5,4
    2454:	00e7fb63          	bgeu	a5,a4,246a <csi_usart_config_baudrate+0xc2>
        divisor = (divisor / 10) + 1;
    2458:	fe842703          	lw	a4,-24(s0)
    245c:	47a9                	li	a5,10
    245e:	02f757b3          	divu	a5,a4,a5
    2462:	0785                	addi	a5,a5,1
    2464:	fef42423          	sw	a5,-24(s0)
    2468:	a801                	j	2478 <csi_usart_config_baudrate+0xd0>
    } else {
        divisor = divisor / 10;
    246a:	fe842703          	lw	a4,-24(s0)
    246e:	47a9                	li	a5,10
    2470:	02f757b3          	divu	a5,a4,a5
    2474:	fef42423          	sw	a5,-24(s0)
    }

    addr->LCR |= LCR_SET_DLAB;
    2478:	fe042783          	lw	a5,-32(s0)
    247c:	47dc                	lw	a5,12(a5)
    247e:	0807e713          	ori	a4,a5,128
    2482:	fe042783          	lw	a5,-32(s0)
    2486:	c7d8                	sw	a4,12(a5)
    /* DLL and DLH is lower 8-bits and higher 8-bits of divisor.*/
    addr->DLL = divisor & 0xff;
    2488:	fe842783          	lw	a5,-24(s0)
    248c:	0ff7f713          	andi	a4,a5,255
    2490:	fe042783          	lw	a5,-32(s0)
    2494:	c398                	sw	a4,0(a5)
    addr->DLH = (divisor >> 8) & 0xff;
    2496:	fe842783          	lw	a5,-24(s0)
    249a:	83a1                	srli	a5,a5,0x8
    249c:	0ff7f713          	andi	a4,a5,255
    24a0:	fe042783          	lw	a5,-32(s0)
    24a4:	c3d8                	sw	a4,4(a5)
    /*
     * The DLAB must be cleared after the baudrate is setted
     * to access other registers.
     */
    addr->LCR &= (~LCR_SET_DLAB);
    24a6:	fe042783          	lw	a5,-32(s0)
    24aa:	47dc                	lw	a5,12(a5)
    24ac:	f7f7f713          	andi	a4,a5,-129
    24b0:	fe042783          	lw	a5,-32(s0)
    24b4:	c7d8                	sw	a4,12(a5)

    return 0;
    24b6:	4781                	li	a5,0
}
    24b8:	853e                	mv	a0,a5
    24ba:	50b2                	lw	ra,44(sp)
    24bc:	5422                	lw	s0,40(sp)
    24be:	6145                	addi	sp,sp,48
    24c0:	8082                	ret

000024c2 <csi_usart_config_mode>:
  \param[in]   handle  usart handle to operate.
  \param[in]   mode    \ref usart_mode_e
  \return      error code
*/
int32_t csi_usart_config_mode(usart_handle_t handle, usart_mode_e mode)
{
    24c2:	1101                	addi	sp,sp,-32
    24c4:	ce22                	sw	s0,28(sp)
    24c6:	1000                	addi	s0,sp,32
    24c8:	fea42623          	sw	a0,-20(s0)
    24cc:	feb42423          	sw	a1,-24(s0)
    USART_NULL_PARAM_CHK(handle);
    24d0:	fec42783          	lw	a5,-20(s0)
    24d4:	e791                	bnez	a5,24e0 <csi_usart_config_mode+0x1e>
    24d6:	810207b7          	lui	a5,0x81020
    24da:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    24de:	a811                	j	24f2 <csi_usart_config_mode+0x30>

    if (mode == USART_MODE_ASYNCHRONOUS) {
    24e0:	fe842783          	lw	a5,-24(s0)
    24e4:	e399                	bnez	a5,24ea <csi_usart_config_mode+0x28>
        return 0;
    24e6:	4781                	li	a5,0
    24e8:	a029                	j	24f2 <csi_usart_config_mode+0x30>
    }

    return ERR_USART(USART_ERROR_MODE);
    24ea:	810207b7          	lui	a5,0x81020
    24ee:	08678793          	addi	a5,a5,134 # 81020086 <__heap_end+0x61000086>
}
    24f2:	853e                	mv	a0,a5
    24f4:	4472                	lw	s0,28(sp)
    24f6:	6105                	addi	sp,sp,32
    24f8:	8082                	ret

000024fa <csi_usart_config_parity>:
  \param[in]   handle  usart handle to operate.
  \param[in]   parity    \ref usart_parity_e
  \return      error code
*/
int32_t csi_usart_config_parity(usart_handle_t handle, usart_parity_e parity)
{
    24fa:	7179                	addi	sp,sp,-48
    24fc:	d622                	sw	s0,44(sp)
    24fe:	1800                	addi	s0,sp,48
    2500:	fca42e23          	sw	a0,-36(s0)
    2504:	fcb42c23          	sw	a1,-40(s0)
    USART_NULL_PARAM_CHK(handle);
    2508:	fdc42783          	lw	a5,-36(s0)
    250c:	e791                	bnez	a5,2518 <csi_usart_config_parity+0x1e>
    250e:	810207b7          	lui	a5,0x81020
    2512:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    2516:	a0c5                	j	25f6 <csi_usart_config_parity+0xfc>
    ck_usart_priv_t *usart_priv = handle;
    2518:	fdc42783          	lw	a5,-36(s0)
    251c:	fef42423          	sw	a5,-24(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2520:	fe842783          	lw	a5,-24(s0)
    2524:	439c                	lw	a5,0(a5)
    2526:	fef42223          	sw	a5,-28(s0)

    WAIT_USART_IDLE(addr);
    252a:	fe042623          	sw	zero,-20(s0)
    252e:	a031                	j	253a <csi_usart_config_parity+0x40>
    2530:	fec42783          	lw	a5,-20(s0)
    2534:	0785                	addi	a5,a5,1
    2536:	fef42623          	sw	a5,-20(s0)
    253a:	fe442783          	lw	a5,-28(s0)
    253e:	5ffc                	lw	a5,124(a5)
    2540:	8b85                	andi	a5,a5,1
    2542:	cb89                	beqz	a5,2554 <csi_usart_config_parity+0x5a>
    2544:	fec42703          	lw	a4,-20(s0)
    2548:	000f47b7          	lui	a5,0xf4
    254c:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2550:	fee7d0e3          	bge	a5,a4,2530 <csi_usart_config_parity+0x36>
    2554:	fec42703          	lw	a4,-20(s0)
    2558:	000f47b7          	lui	a5,0xf4
    255c:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2560:	00e7d763          	bge	a5,a4,256e <csi_usart_config_parity+0x74>
    2564:	810207b7          	lui	a5,0x81020
    2568:	08278793          	addi	a5,a5,130 # 81020082 <__heap_end+0x61000082>
    256c:	a069                	j	25f6 <csi_usart_config_parity+0xfc>

    switch (parity) {
    256e:	fd842703          	lw	a4,-40(s0)
    2572:	4789                	li	a5,2
    2574:	02f70963          	beq	a4,a5,25a6 <csi_usart_config_parity+0xac>
    2578:	fd842703          	lw	a4,-40(s0)
    257c:	4789                	li	a5,2
    257e:	06e7e663          	bltu	a5,a4,25ea <csi_usart_config_parity+0xf0>
    2582:	fd842783          	lw	a5,-40(s0)
    2586:	c799                	beqz	a5,2594 <csi_usart_config_parity+0x9a>
    2588:	fd842703          	lw	a4,-40(s0)
    258c:	4785                	li	a5,1
    258e:	02f70d63          	beq	a4,a5,25c8 <csi_usart_config_parity+0xce>
    2592:	a8a1                	j	25ea <csi_usart_config_parity+0xf0>
        case USART_PARITY_NONE:
            /*CLear the PEN bit(LCR[3]) to disable parity.*/
            addr->LCR &= (~LCR_PARITY_ENABLE);
    2594:	fe442783          	lw	a5,-28(s0)
    2598:	47dc                	lw	a5,12(a5)
    259a:	ff77f713          	andi	a4,a5,-9
    259e:	fe442783          	lw	a5,-28(s0)
    25a2:	c7d8                	sw	a4,12(a5)
            break;
    25a4:	a881                	j	25f4 <csi_usart_config_parity+0xfa>

        case USART_PARITY_ODD:
            /* Set PEN and clear EPS(LCR[4]) to set the ODD parity. */
            addr->LCR |= LCR_PARITY_ENABLE;
    25a6:	fe442783          	lw	a5,-28(s0)
    25aa:	47dc                	lw	a5,12(a5)
    25ac:	0087e713          	ori	a4,a5,8
    25b0:	fe442783          	lw	a5,-28(s0)
    25b4:	c7d8                	sw	a4,12(a5)
            addr->LCR &= LCR_PARITY_ODD;
    25b6:	fe442783          	lw	a5,-28(s0)
    25ba:	47dc                	lw	a5,12(a5)
    25bc:	0ef7f713          	andi	a4,a5,239
    25c0:	fe442783          	lw	a5,-28(s0)
    25c4:	c7d8                	sw	a4,12(a5)
            break;
    25c6:	a03d                	j	25f4 <csi_usart_config_parity+0xfa>

        case USART_PARITY_EVEN:
            /* Set PEN and EPS(LCR[4]) to set the EVEN parity.*/
            addr->LCR |= LCR_PARITY_ENABLE;
    25c8:	fe442783          	lw	a5,-28(s0)
    25cc:	47dc                	lw	a5,12(a5)
    25ce:	0087e713          	ori	a4,a5,8
    25d2:	fe442783          	lw	a5,-28(s0)
    25d6:	c7d8                	sw	a4,12(a5)
            addr->LCR |= LCR_PARITY_EVEN;
    25d8:	fe442783          	lw	a5,-28(s0)
    25dc:	47dc                	lw	a5,12(a5)
    25de:	0107e713          	ori	a4,a5,16
    25e2:	fe442783          	lw	a5,-28(s0)
    25e6:	c7d8                	sw	a4,12(a5)
            break;
    25e8:	a031                	j	25f4 <csi_usart_config_parity+0xfa>

        default:
            return ERR_USART(USART_ERROR_PARITY);
    25ea:	810207b7          	lui	a5,0x81020
    25ee:	08978793          	addi	a5,a5,137 # 81020089 <__heap_end+0x61000089>
    25f2:	a011                	j	25f6 <csi_usart_config_parity+0xfc>
    }

    return 0;
    25f4:	4781                	li	a5,0
}
    25f6:	853e                	mv	a0,a5
    25f8:	5432                	lw	s0,44(sp)
    25fa:	6145                	addi	sp,sp,48
    25fc:	8082                	ret

000025fe <csi_usart_config_stopbits>:
  \param[in]   handle  usart handle to operate.
  \param[in]   stopbits  \ref usart_stop_bits_e
  \return      error code
*/
int32_t csi_usart_config_stopbits(usart_handle_t handle, usart_stop_bits_e stopbit)
{
    25fe:	7179                	addi	sp,sp,-48
    2600:	d622                	sw	s0,44(sp)
    2602:	1800                	addi	s0,sp,48
    2604:	fca42e23          	sw	a0,-36(s0)
    2608:	fcb42c23          	sw	a1,-40(s0)
    USART_NULL_PARAM_CHK(handle);
    260c:	fdc42783          	lw	a5,-36(s0)
    2610:	e791                	bnez	a5,261c <csi_usart_config_stopbits+0x1e>
    2612:	810207b7          	lui	a5,0x81020
    2616:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    261a:	a869                	j	26b4 <csi_usart_config_stopbits+0xb6>
    ck_usart_priv_t *usart_priv = handle;
    261c:	fdc42783          	lw	a5,-36(s0)
    2620:	fef42423          	sw	a5,-24(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2624:	fe842783          	lw	a5,-24(s0)
    2628:	439c                	lw	a5,0(a5)
    262a:	fef42223          	sw	a5,-28(s0)

    WAIT_USART_IDLE(addr);
    262e:	fe042623          	sw	zero,-20(s0)
    2632:	a031                	j	263e <csi_usart_config_stopbits+0x40>
    2634:	fec42783          	lw	a5,-20(s0)
    2638:	0785                	addi	a5,a5,1
    263a:	fef42623          	sw	a5,-20(s0)
    263e:	fe442783          	lw	a5,-28(s0)
    2642:	5ffc                	lw	a5,124(a5)
    2644:	8b85                	andi	a5,a5,1
    2646:	cb89                	beqz	a5,2658 <csi_usart_config_stopbits+0x5a>
    2648:	fec42703          	lw	a4,-20(s0)
    264c:	000f47b7          	lui	a5,0xf4
    2650:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2654:	fee7d0e3          	bge	a5,a4,2634 <csi_usart_config_stopbits+0x36>
    2658:	fec42703          	lw	a4,-20(s0)
    265c:	000f47b7          	lui	a5,0xf4
    2660:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2664:	00e7d763          	bge	a5,a4,2672 <csi_usart_config_stopbits+0x74>
    2668:	810207b7          	lui	a5,0x81020
    266c:	08278793          	addi	a5,a5,130 # 81020082 <__heap_end+0x61000082>
    2670:	a091                	j	26b4 <csi_usart_config_stopbits+0xb6>

    switch (stopbit) {
    2672:	fd842783          	lw	a5,-40(s0)
    2676:	c799                	beqz	a5,2684 <csi_usart_config_stopbits+0x86>
    2678:	fd842703          	lw	a4,-40(s0)
    267c:	4785                	li	a5,1
    267e:	00f70c63          	beq	a4,a5,2696 <csi_usart_config_stopbits+0x98>
    2682:	a01d                	j	26a8 <csi_usart_config_stopbits+0xaa>
        case USART_STOP_BITS_1:
            /* Clear the STOP bit to set 1 stop bit*/
            addr->LCR &= LCR_STOP_BIT1;
    2684:	fe442783          	lw	a5,-28(s0)
    2688:	47dc                	lw	a5,12(a5)
    268a:	0fb7f713          	andi	a4,a5,251
    268e:	fe442783          	lw	a5,-28(s0)
    2692:	c7d8                	sw	a4,12(a5)
            break;
    2694:	a839                	j	26b2 <csi_usart_config_stopbits+0xb4>
        case USART_STOP_BITS_2:
            /*
            * If the STOP bit is set "1",we'd gotten 1.5 stop
            * bits when DLS(LCR[1:0]) is zero, else 2 stop bits.
            */
            addr->LCR |= LCR_STOP_BIT2;
    2696:	fe442783          	lw	a5,-28(s0)
    269a:	47dc                	lw	a5,12(a5)
    269c:	0047e713          	ori	a4,a5,4
    26a0:	fe442783          	lw	a5,-28(s0)
    26a4:	c7d8                	sw	a4,12(a5)
            break;
    26a6:	a031                	j	26b2 <csi_usart_config_stopbits+0xb4>

        default:
            return ERR_USART(USART_ERROR_STOP_BITS);
    26a8:	810207b7          	lui	a5,0x81020
    26ac:	08a78793          	addi	a5,a5,138 # 8102008a <__heap_end+0x6100008a>
    26b0:	a011                	j	26b4 <csi_usart_config_stopbits+0xb6>
    }

    return 0;
    26b2:	4781                	li	a5,0
}
    26b4:	853e                	mv	a0,a5
    26b6:	5432                	lw	s0,44(sp)
    26b8:	6145                	addi	sp,sp,48
    26ba:	8082                	ret

000026bc <csi_usart_config_databits>:
  \param[in]   handle  usart handle to operate.
  \param[in]   databits      \ref usart_data_bits_e
  \return      error code
*/
int32_t csi_usart_config_databits(usart_handle_t handle, usart_data_bits_e databits)
{
    26bc:	7179                	addi	sp,sp,-48
    26be:	d622                	sw	s0,44(sp)
    26c0:	1800                	addi	s0,sp,48
    26c2:	fca42e23          	sw	a0,-36(s0)
    26c6:	fcb42c23          	sw	a1,-40(s0)
    USART_NULL_PARAM_CHK(handle);
    26ca:	fdc42783          	lw	a5,-36(s0)
    26ce:	e791                	bnez	a5,26da <csi_usart_config_databits+0x1e>
    26d0:	810207b7          	lui	a5,0x81020
    26d4:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    26d8:	a219                	j	27de <csi_usart_config_databits+0x122>
    ck_usart_priv_t *usart_priv = handle;
    26da:	fdc42783          	lw	a5,-36(s0)
    26de:	fef42423          	sw	a5,-24(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    26e2:	fe842783          	lw	a5,-24(s0)
    26e6:	439c                	lw	a5,0(a5)
    26e8:	fef42223          	sw	a5,-28(s0)

    WAIT_USART_IDLE(addr);
    26ec:	fe042623          	sw	zero,-20(s0)
    26f0:	a031                	j	26fc <csi_usart_config_databits+0x40>
    26f2:	fec42783          	lw	a5,-20(s0)
    26f6:	0785                	addi	a5,a5,1
    26f8:	fef42623          	sw	a5,-20(s0)
    26fc:	fe442783          	lw	a5,-28(s0)
    2700:	5ffc                	lw	a5,124(a5)
    2702:	8b85                	andi	a5,a5,1
    2704:	cb89                	beqz	a5,2716 <csi_usart_config_databits+0x5a>
    2706:	fec42703          	lw	a4,-20(s0)
    270a:	000f47b7          	lui	a5,0xf4
    270e:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2712:	fee7d0e3          	bge	a5,a4,26f2 <csi_usart_config_databits+0x36>
    2716:	fec42703          	lw	a4,-20(s0)
    271a:	000f47b7          	lui	a5,0xf4
    271e:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2722:	00e7d763          	bge	a5,a4,2730 <csi_usart_config_databits+0x74>
    2726:	810207b7          	lui	a5,0x81020
    272a:	08278793          	addi	a5,a5,130 # 81020082 <__heap_end+0x61000082>
    272e:	a845                	j	27de <csi_usart_config_databits+0x122>
     *       01 -- 6 bits
     *       10 -- 7 bits
     *       11 -- 8 bits
     */

    switch (databits) {
    2730:	fd842703          	lw	a4,-40(s0)
    2734:	478d                	li	a5,3
    2736:	08f70563          	beq	a4,a5,27c0 <csi_usart_config_databits+0x104>
    273a:	fd842703          	lw	a4,-40(s0)
    273e:	478d                	li	a5,3
    2740:	08e7e963          	bltu	a5,a4,27d2 <csi_usart_config_databits+0x116>
    2744:	fd842703          	lw	a4,-40(s0)
    2748:	4789                	li	a5,2
    274a:	04f70a63          	beq	a4,a5,279e <csi_usart_config_databits+0xe2>
    274e:	fd842703          	lw	a4,-40(s0)
    2752:	4789                	li	a5,2
    2754:	06e7ef63          	bltu	a5,a4,27d2 <csi_usart_config_databits+0x116>
    2758:	fd842783          	lw	a5,-40(s0)
    275c:	c799                	beqz	a5,276a <csi_usart_config_databits+0xae>
    275e:	fd842703          	lw	a4,-40(s0)
    2762:	4785                	li	a5,1
    2764:	00f70c63          	beq	a4,a5,277c <csi_usart_config_databits+0xc0>
    2768:	a0ad                	j	27d2 <csi_usart_config_databits+0x116>
        case USART_DATA_BITS_5:
            addr->LCR &= LCR_WORD_SIZE_5;
    276a:	fe442783          	lw	a5,-28(s0)
    276e:	47dc                	lw	a5,12(a5)
    2770:	0fc7f713          	andi	a4,a5,252
    2774:	fe442783          	lw	a5,-28(s0)
    2778:	c7d8                	sw	a4,12(a5)
            break;
    277a:	a08d                	j	27dc <csi_usart_config_databits+0x120>

        case USART_DATA_BITS_6:
            addr->LCR &= 0xfd;
    277c:	fe442783          	lw	a5,-28(s0)
    2780:	47dc                	lw	a5,12(a5)
    2782:	0fd7f713          	andi	a4,a5,253
    2786:	fe442783          	lw	a5,-28(s0)
    278a:	c7d8                	sw	a4,12(a5)
            addr->LCR |= LCR_WORD_SIZE_6;
    278c:	fe442783          	lw	a5,-28(s0)
    2790:	47dc                	lw	a5,12(a5)
    2792:	0017e713          	ori	a4,a5,1
    2796:	fe442783          	lw	a5,-28(s0)
    279a:	c7d8                	sw	a4,12(a5)
            break;
    279c:	a081                	j	27dc <csi_usart_config_databits+0x120>

        case USART_DATA_BITS_7:
            addr->LCR &= 0xfe;
    279e:	fe442783          	lw	a5,-28(s0)
    27a2:	47dc                	lw	a5,12(a5)
    27a4:	0fe7f713          	andi	a4,a5,254
    27a8:	fe442783          	lw	a5,-28(s0)
    27ac:	c7d8                	sw	a4,12(a5)
            addr->LCR |= LCR_WORD_SIZE_7;
    27ae:	fe442783          	lw	a5,-28(s0)
    27b2:	47dc                	lw	a5,12(a5)
    27b4:	0027e713          	ori	a4,a5,2
    27b8:	fe442783          	lw	a5,-28(s0)
    27bc:	c7d8                	sw	a4,12(a5)
            break;
    27be:	a839                	j	27dc <csi_usart_config_databits+0x120>

        case USART_DATA_BITS_8:
            addr->LCR |= LCR_WORD_SIZE_8;
    27c0:	fe442783          	lw	a5,-28(s0)
    27c4:	47dc                	lw	a5,12(a5)
    27c6:	0037e713          	ori	a4,a5,3
    27ca:	fe442783          	lw	a5,-28(s0)
    27ce:	c7d8                	sw	a4,12(a5)
            break;
    27d0:	a031                	j	27dc <csi_usart_config_databits+0x120>

        default:
            return ERR_USART(USART_ERROR_DATA_BITS);
    27d2:	810207b7          	lui	a5,0x81020
    27d6:	08878793          	addi	a5,a5,136 # 81020088 <__heap_end+0x61000088>
    27da:	a011                	j	27de <csi_usart_config_databits+0x122>
    }

    return 0;
    27dc:	4781                	li	a5,0
}
    27de:	853e                	mv	a0,a5
    27e0:	5432                	lw	s0,44(sp)
    27e2:	6145                	addi	sp,sp,48
    27e4:	8082                	ret

000027e6 <csi_usart_getchar>:
  \param[in]   instance  usart instance to operate.
  \param[in]   the pointer to the recieve charater.
  \return      error code
*/
int32_t csi_usart_getchar(usart_handle_t handle, uint8_t *ch)
{
    27e6:	7179                	addi	sp,sp,-48
    27e8:	d622                	sw	s0,44(sp)
    27ea:	1800                	addi	s0,sp,48
    27ec:	fca42e23          	sw	a0,-36(s0)
    27f0:	fcb42c23          	sw	a1,-40(s0)
    USART_NULL_PARAM_CHK(handle);
    27f4:	fdc42783          	lw	a5,-36(s0)
    27f8:	e791                	bnez	a5,2804 <csi_usart_getchar+0x1e>
    27fa:	810207b7          	lui	a5,0x81020
    27fe:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    2802:	a091                	j	2846 <csi_usart_getchar+0x60>
    USART_NULL_PARAM_CHK(ch);
    2804:	fd842783          	lw	a5,-40(s0)
    2808:	e791                	bnez	a5,2814 <csi_usart_getchar+0x2e>
    280a:	810207b7          	lui	a5,0x81020
    280e:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    2812:	a815                	j	2846 <csi_usart_getchar+0x60>

    ck_usart_priv_t *usart_priv = handle;
    2814:	fdc42783          	lw	a5,-36(s0)
    2818:	fef42623          	sw	a5,-20(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    281c:	fec42783          	lw	a5,-20(s0)
    2820:	439c                	lw	a5,0(a5)
    2822:	fef42423          	sw	a5,-24(s0)

    while (!(addr->LSR & LSR_DATA_READY));
    2826:	0001                	nop
    2828:	fe842783          	lw	a5,-24(s0)
    282c:	4bdc                	lw	a5,20(a5)
    282e:	8b85                	andi	a5,a5,1
    2830:	dfe5                	beqz	a5,2828 <csi_usart_getchar+0x42>

    *ch = addr->RBR;
    2832:	fe842783          	lw	a5,-24(s0)
    2836:	439c                	lw	a5,0(a5)
    2838:	0ff7f713          	andi	a4,a5,255
    283c:	fd842783          	lw	a5,-40(s0)
    2840:	00e78023          	sb	a4,0(a5)

    return 0;
    2844:	4781                	li	a5,0
}
    2846:	853e                	mv	a0,a5
    2848:	5432                	lw	s0,44(sp)
    284a:	6145                	addi	sp,sp,48
    284c:	8082                	ret

0000284e <csi_usart_putchar>:
  \param[in]   instance  usart instance to operate.
  \param[in]   ch  the input charater
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    284e:	7179                	addi	sp,sp,-48
    2850:	d622                	sw	s0,44(sp)
    2852:	1800                	addi	s0,sp,48
    2854:	fca42e23          	sw	a0,-36(s0)
    2858:	87ae                	mv	a5,a1
    285a:	fcf40da3          	sb	a5,-37(s0)
    USART_NULL_PARAM_CHK(handle);
    285e:	fdc42783          	lw	a5,-36(s0)
    2862:	e791                	bnez	a5,286e <csi_usart_putchar+0x20>
    2864:	810207b7          	lui	a5,0x81020
    2868:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    286c:	a899                	j	28c2 <csi_usart_putchar+0x74>
    ck_usart_priv_t *usart_priv = handle;
    286e:	fdc42783          	lw	a5,-36(s0)
    2872:	fef42423          	sw	a5,-24(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2876:	fe842783          	lw	a5,-24(s0)
    287a:	439c                	lw	a5,0(a5)
    287c:	fef42223          	sw	a5,-28(s0)
    uint32_t timecount = 0;
    2880:	fe042623          	sw	zero,-20(s0)

    while ((!(addr->LSR & DW_LSR_TRANS_EMPTY))) {
    2884:	a01d                	j	28aa <csi_usart_putchar+0x5c>
        timecount++;
    2886:	fec42783          	lw	a5,-20(s0)
    288a:	0785                	addi	a5,a5,1
    288c:	fef42623          	sw	a5,-20(s0)

        if (timecount >= UART_BUSY_TIMEOUT) {
    2890:	fec42703          	lw	a4,-20(s0)
    2894:	000f47b7          	lui	a5,0xf4
    2898:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    289c:	00e7f763          	bgeu	a5,a4,28aa <csi_usart_putchar+0x5c>
            return ERR_USART(DRV_ERROR_TIMEOUT);
    28a0:	810207b7          	lui	a5,0x81020
    28a4:	08278793          	addi	a5,a5,130 # 81020082 <__heap_end+0x61000082>
    28a8:	a829                	j	28c2 <csi_usart_putchar+0x74>
    while ((!(addr->LSR & DW_LSR_TRANS_EMPTY))) {
    28aa:	fe442783          	lw	a5,-28(s0)
    28ae:	4bdc                	lw	a5,20(a5)
    28b0:	0207f793          	andi	a5,a5,32
    28b4:	dbe9                	beqz	a5,2886 <csi_usart_putchar+0x38>
        }
    }

    addr->THR = ch;
    28b6:	fdb44703          	lbu	a4,-37(s0)
    28ba:	fe442783          	lw	a5,-28(s0)
    28be:	c398                	sw	a4,0(a5)

    return 0;
    28c0:	4781                	li	a5,0

}
    28c2:	853e                	mv	a0,a5
    28c4:	5432                	lw	s0,44(sp)
    28c6:	6145                	addi	sp,sp,48
    28c8:	8082                	ret

000028ca <ck_usart_intr_threshold_empty>:
/**
  \brief       interrupt service function for transmitter holding register empty.
  \param[in]   usart_priv usart private to operate.
*/
void ck_usart_intr_threshold_empty(int32_t idx, ck_usart_priv_t *usart_priv)
{
    28ca:	7179                	addi	sp,sp,-48
    28cc:	d606                	sw	ra,44(sp)
    28ce:	d422                	sw	s0,40(sp)
    28d0:	1800                	addi	s0,sp,48
    28d2:	fca42e23          	sw	a0,-36(s0)
    28d6:	fcb42c23          	sw	a1,-40(s0)
    if (usart_priv->tx_total_num == 0) {
    28da:	fd842783          	lw	a5,-40(s0)
    28de:	4b9c                	lw	a5,16(a5)
    28e0:	cbf5                	beqz	a5,29d4 <ck_usart_intr_threshold_empty+0x10a>
        return;
    }

    volatile int i = 500;
    28e2:	1f400793          	li	a5,500
    28e6:	fef42423          	sw	a5,-24(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    28ea:	fd842783          	lw	a5,-40(s0)
    28ee:	439c                	lw	a5,0(a5)
    28f0:	fef42623          	sw	a5,-20(s0)

    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    28f4:	fd842783          	lw	a5,-40(s0)
    28f8:	5398                	lw	a4,32(a5)
    28fa:	fd842783          	lw	a5,-40(s0)
    28fe:	4b9c                	lw	a5,16(a5)
    2900:	06f76e63          	bltu	a4,a5,297c <ck_usart_intr_threshold_empty+0xb2>
        addr->IER &= (~IER_THRE_INT_ENABLE);
    2904:	fec42783          	lw	a5,-20(s0)
    2908:	43dc                	lw	a5,4(a5)
    290a:	ffd7f713          	andi	a4,a5,-3
    290e:	fec42783          	lw	a5,-20(s0)
    2912:	c3d8                	sw	a4,4(a5)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    2914:	fd842783          	lw	a5,-40(s0)
    2918:	4b98                	lw	a4,16(a5)
    291a:	fd842783          	lw	a5,-40(s0)
    291e:	d7d8                	sw	a4,44(a5)

        /* fix hardware bug */
        while (addr->USR & USR_UART_BUSY);
    2920:	0001                	nop
    2922:	fec42783          	lw	a5,-20(s0)
    2926:	5ffc                	lw	a5,124(a5)
    2928:	8b85                	andi	a5,a5,1
    292a:	ffe5                	bnez	a5,2922 <ck_usart_intr_threshold_empty+0x58>

        i = 500;
    292c:	1f400793          	li	a5,500
    2930:	fef42423          	sw	a5,-24(s0)

        while (i--);
    2934:	0001                	nop
    2936:	fe842783          	lw	a5,-24(s0)
    293a:	fff78713          	addi	a4,a5,-1
    293e:	fee42423          	sw	a4,-24(s0)
    2942:	fbf5                	bnez	a5,2936 <ck_usart_intr_threshold_empty+0x6c>

        usart_priv->tx_cnt = 0;
    2944:	fd842783          	lw	a5,-40(s0)
    2948:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    294c:	fd842783          	lw	a5,-40(s0)
    2950:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    2954:	fd842783          	lw	a5,-40(s0)
    2958:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    295c:	fd842783          	lw	a5,-40(s0)
    2960:	0007a823          	sw	zero,16(a5)

        if (usart_priv->cb_event) {
    2964:	fd842783          	lw	a5,-40(s0)
    2968:	479c                	lw	a5,8(a5)
    296a:	c7b5                	beqz	a5,29d6 <ck_usart_intr_threshold_empty+0x10c>
            usart_priv->cb_event(idx, USART_EVENT_SEND_COMPLETE);
    296c:	fd842783          	lw	a5,-40(s0)
    2970:	479c                	lw	a5,8(a5)
    2972:	4581                	li	a1,0
    2974:	fdc42503          	lw	a0,-36(s0)
    2978:	9782                	jalr	a5
    297a:	a8b1                	j	29d6 <ck_usart_intr_threshold_empty+0x10c>
        }
    } else {
        /* fix hardware bug */
        while (addr->USR & USR_UART_BUSY);
    297c:	0001                	nop
    297e:	fec42783          	lw	a5,-20(s0)
    2982:	5ffc                	lw	a5,124(a5)
    2984:	8b85                	andi	a5,a5,1
    2986:	ffe5                	bnez	a5,297e <ck_usart_intr_threshold_empty+0xb4>

        i = 500;
    2988:	1f400793          	li	a5,500
    298c:	fef42423          	sw	a5,-24(s0)

        while (i--);
    2990:	0001                	nop
    2992:	fe842783          	lw	a5,-24(s0)
    2996:	fff78713          	addi	a4,a5,-1
    299a:	fee42423          	sw	a4,-24(s0)
    299e:	fbf5                	bnez	a5,2992 <ck_usart_intr_threshold_empty+0xc8>

        addr->THR = *((uint8_t *)usart_priv->tx_buf);
    29a0:	fd842783          	lw	a5,-40(s0)
    29a4:	4f9c                	lw	a5,24(a5)
    29a6:	0007c783          	lbu	a5,0(a5)
    29aa:	873e                	mv	a4,a5
    29ac:	fec42783          	lw	a5,-20(s0)
    29b0:	c398                	sw	a4,0(a5)
        usart_priv->tx_cnt++;
    29b2:	fd842783          	lw	a5,-40(s0)
    29b6:	539c                	lw	a5,32(a5)
    29b8:	00178713          	addi	a4,a5,1
    29bc:	fd842783          	lw	a5,-40(s0)
    29c0:	d398                	sw	a4,32(a5)
        usart_priv->tx_buf++;
    29c2:	fd842783          	lw	a5,-40(s0)
    29c6:	4f9c                	lw	a5,24(a5)
    29c8:	00178713          	addi	a4,a5,1
    29cc:	fd842783          	lw	a5,-40(s0)
    29d0:	cf98                	sw	a4,24(a5)
    29d2:	a011                	j	29d6 <ck_usart_intr_threshold_empty+0x10c>
        return;
    29d4:	0001                	nop
    }
}
    29d6:	50b2                	lw	ra,44(sp)
    29d8:	5422                	lw	s0,40(sp)
    29da:	6145                	addi	sp,sp,48
    29dc:	8082                	ret

000029de <ck_usart_intr_recv_data>:
/**
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(int32_t idx, ck_usart_priv_t *usart_priv)
{
    29de:	7179                	addi	sp,sp,-48
    29e0:	d606                	sw	ra,44(sp)
    29e2:	d422                	sw	s0,40(sp)
    29e4:	1800                	addi	s0,sp,48
    29e6:	fca42e23          	sw	a0,-36(s0)
    29ea:	fcb42c23          	sw	a1,-40(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    29ee:	fd842783          	lw	a5,-40(s0)
    29f2:	439c                	lw	a5,0(a5)
    29f4:	fef42623          	sw	a5,-20(s0)
    uint8_t data = addr->RBR;
    29f8:	fec42783          	lw	a5,-20(s0)
    29fc:	439c                	lw	a5,0(a5)
    29fe:	fef405a3          	sb	a5,-21(s0)

    *((uint8_t *)usart_priv->rx_buf) = data;
    2a02:	fd842783          	lw	a5,-40(s0)
    2a06:	4bdc                	lw	a5,20(a5)
    2a08:	feb44703          	lbu	a4,-21(s0)
    2a0c:	00e78023          	sb	a4,0(a5)
    usart_priv->rx_cnt++;
    2a10:	fd842783          	lw	a5,-40(s0)
    2a14:	4fdc                	lw	a5,28(a5)
    2a16:	00178713          	addi	a4,a5,1
    2a1a:	fd842783          	lw	a5,-40(s0)
    2a1e:	cfd8                	sw	a4,28(a5)
    usart_priv->rx_buf++;
    2a20:	fd842783          	lw	a5,-40(s0)
    2a24:	4bdc                	lw	a5,20(a5)
    2a26:	00178713          	addi	a4,a5,1
    2a2a:	fd842783          	lw	a5,-40(s0)
    2a2e:	cbd8                	sw	a4,20(a5)

    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    2a30:	fd842783          	lw	a5,-40(s0)
    2a34:	4fd8                	lw	a4,28(a5)
    2a36:	fd842783          	lw	a5,-40(s0)
    2a3a:	47dc                	lw	a5,12(a5)
    2a3c:	04f76363          	bltu	a4,a5,2a82 <ck_usart_intr_recv_data+0xa4>
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    2a40:	fd842783          	lw	a5,-40(s0)
    2a44:	47d8                	lw	a4,12(a5)
    2a46:	fd842783          	lw	a5,-40(s0)
    2a4a:	db98                	sw	a4,48(a5)
        usart_priv->rx_cnt = 0;
    2a4c:	fd842783          	lw	a5,-40(s0)
    2a50:	0007ae23          	sw	zero,28(a5)
        usart_priv->rx_buf = NULL;
    2a54:	fd842783          	lw	a5,-40(s0)
    2a58:	0007aa23          	sw	zero,20(a5)
        usart_priv->rx_busy = 0;
    2a5c:	fd842783          	lw	a5,-40(s0)
    2a60:	0207a423          	sw	zero,40(a5)
        usart_priv->rx_total_num = 0;
    2a64:	fd842783          	lw	a5,-40(s0)
    2a68:	0007a623          	sw	zero,12(a5)

        if (usart_priv->cb_event) {
    2a6c:	fd842783          	lw	a5,-40(s0)
    2a70:	479c                	lw	a5,8(a5)
    2a72:	cb81                	beqz	a5,2a82 <ck_usart_intr_recv_data+0xa4>
            usart_priv->cb_event(idx, USART_EVENT_RECEIVE_COMPLETE);
    2a74:	fd842783          	lw	a5,-40(s0)
    2a78:	479c                	lw	a5,8(a5)
    2a7a:	4585                	li	a1,1
    2a7c:	fdc42503          	lw	a0,-36(s0)
    2a80:	9782                	jalr	a5
        }
    }

}
    2a82:	0001                	nop
    2a84:	50b2                	lw	ra,44(sp)
    2a86:	5422                	lw	s0,40(sp)
    2a88:	6145                	addi	sp,sp,48
    2a8a:	8082                	ret

00002a8c <ck_usart_intr_recv_line>:
/**
  \brief        interrupt service function for receiver line.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_line(int32_t idx, ck_usart_priv_t *usart_priv)
{
    2a8c:	7179                	addi	sp,sp,-48
    2a8e:	d606                	sw	ra,44(sp)
    2a90:	d422                	sw	s0,40(sp)
    2a92:	1800                	addi	s0,sp,48
    2a94:	fca42e23          	sw	a0,-36(s0)
    2a98:	fcb42c23          	sw	a1,-40(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2a9c:	fd842783          	lw	a5,-40(s0)
    2aa0:	439c                	lw	a5,0(a5)
    2aa2:	fef42423          	sw	a5,-24(s0)
    uint32_t lsr_stat = addr->LSR;
    2aa6:	fe842783          	lw	a5,-24(s0)
    2aaa:	4bdc                	lw	a5,20(a5)
    2aac:	fef42223          	sw	a5,-28(s0)

    addr->IER &= (~IER_THRE_INT_ENABLE);
    2ab0:	fe842783          	lw	a5,-24(s0)
    2ab4:	43dc                	lw	a5,4(a5)
    2ab6:	ffd7f713          	andi	a4,a5,-3
    2aba:	fe842783          	lw	a5,-24(s0)
    2abe:	c3d8                	sw	a4,4(a5)

    uint32_t timecount = 0;
    2ac0:	fe042623          	sw	zero,-20(s0)

    while (addr->LSR & 0x1) {
    2ac4:	a82d                	j	2afe <ck_usart_intr_recv_line+0x72>
        addr->RBR;
    2ac6:	fe842783          	lw	a5,-24(s0)
    2aca:	439c                	lw	a5,0(a5)
        timecount++;
    2acc:	fec42783          	lw	a5,-20(s0)
    2ad0:	0785                	addi	a5,a5,1
    2ad2:	fef42623          	sw	a5,-20(s0)

        if (timecount >= UART_BUSY_TIMEOUT) {
    2ad6:	fec42703          	lw	a4,-20(s0)
    2ada:	000f47b7          	lui	a5,0xf4
    2ade:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2ae2:	00e7fe63          	bgeu	a5,a4,2afe <ck_usart_intr_recv_line+0x72>
            if (usart_priv->cb_event) {
    2ae6:	fd842783          	lw	a5,-40(s0)
    2aea:	479c                	lw	a5,8(a5)
    2aec:	cfd1                	beqz	a5,2b88 <ck_usart_intr_recv_line+0xfc>
                usart_priv->cb_event(idx, USART_EVENT_RX_TIMEOUT);
    2aee:	fd842783          	lw	a5,-40(s0)
    2af2:	479c                	lw	a5,8(a5)
    2af4:	4599                	li	a1,6
    2af6:	fdc42503          	lw	a0,-36(s0)
    2afa:	9782                	jalr	a5
            }

            return;
    2afc:	a071                	j	2b88 <ck_usart_intr_recv_line+0xfc>
    while (addr->LSR & 0x1) {
    2afe:	fe842783          	lw	a5,-24(s0)
    2b02:	4bdc                	lw	a5,20(a5)
    2b04:	8b85                	andi	a5,a5,1
    2b06:	f3e1                	bnez	a5,2ac6 <ck_usart_intr_recv_line+0x3a>
    }

    /** Break Interrupt bit. This is used to indicate the detection of a
      * break sequence on the serial input data.
      */
    if (lsr_stat & DW_LSR_BI) {
    2b08:	fe442783          	lw	a5,-28(s0)
    2b0c:	8bc1                	andi	a5,a5,16
    2b0e:	cf89                	beqz	a5,2b28 <ck_usart_intr_recv_line+0x9c>
        if (usart_priv->cb_event) {
    2b10:	fd842783          	lw	a5,-40(s0)
    2b14:	479c                	lw	a5,8(a5)
    2b16:	cbbd                	beqz	a5,2b8c <ck_usart_intr_recv_line+0x100>
            usart_priv->cb_event(idx, USART_EVENT_RX_BREAK);
    2b18:	fd842783          	lw	a5,-40(s0)
    2b1c:	479c                	lw	a5,8(a5)
    2b1e:	459d                	li	a1,7
    2b20:	fdc42503          	lw	a0,-36(s0)
    2b24:	9782                	jalr	a5
        }

        return;
    2b26:	a09d                	j	2b8c <ck_usart_intr_recv_line+0x100>

    /** Framing Error bit. This is used to indicate the occurrence of a
      * framing error in the receiver. A framing error occurs when the receiver
      * does not detect a valid STOP bit in the received data.
      */
    if (lsr_stat & DW_LSR_FE) {
    2b28:	fe442783          	lw	a5,-28(s0)
    2b2c:	8ba1                	andi	a5,a5,8
    2b2e:	cf89                	beqz	a5,2b48 <ck_usart_intr_recv_line+0xbc>
        if (usart_priv->cb_event) {
    2b30:	fd842783          	lw	a5,-40(s0)
    2b34:	479c                	lw	a5,8(a5)
    2b36:	cfa9                	beqz	a5,2b90 <ck_usart_intr_recv_line+0x104>
            usart_priv->cb_event(idx, USART_EVENT_RX_FRAMING_ERROR);
    2b38:	fd842783          	lw	a5,-40(s0)
    2b3c:	479c                	lw	a5,8(a5)
    2b3e:	45a1                	li	a1,8
    2b40:	fdc42503          	lw	a0,-36(s0)
    2b44:	9782                	jalr	a5
        }

        return;
    2b46:	a0a9                	j	2b90 <ck_usart_intr_recv_line+0x104>

    /** Framing Error bit. This is used to indicate the occurrence of a
      * framing error in the receiver. A framing error occurs when the
      * receiver does not detect a valid STOP bit in the received data.
      */
    if (lsr_stat & DW_LSR_PE) {
    2b48:	fe442783          	lw	a5,-28(s0)
    2b4c:	8b91                	andi	a5,a5,4
    2b4e:	cf89                	beqz	a5,2b68 <ck_usart_intr_recv_line+0xdc>
        if (usart_priv->cb_event) {
    2b50:	fd842783          	lw	a5,-40(s0)
    2b54:	479c                	lw	a5,8(a5)
    2b56:	cf9d                	beqz	a5,2b94 <ck_usart_intr_recv_line+0x108>
            usart_priv->cb_event(idx, USART_EVENT_RX_PARITY_ERROR);
    2b58:	fd842783          	lw	a5,-40(s0)
    2b5c:	479c                	lw	a5,8(a5)
    2b5e:	45a5                	li	a1,9
    2b60:	fdc42503          	lw	a0,-36(s0)
    2b64:	9782                	jalr	a5
        }

        return;
    2b66:	a03d                	j	2b94 <ck_usart_intr_recv_line+0x108>
    }

    /** Overrun error bit. This is used to indicate the occurrence of an overrun error.
      * This occurs if a new data character was received before the previous data was read.
      */
    if (lsr_stat & DW_LSR_OE) {
    2b68:	fe442783          	lw	a5,-28(s0)
    2b6c:	8b89                	andi	a5,a5,2
    2b6e:	c795                	beqz	a5,2b9a <ck_usart_intr_recv_line+0x10e>
        if (usart_priv->cb_event) {
    2b70:	fd842783          	lw	a5,-40(s0)
    2b74:	479c                	lw	a5,8(a5)
    2b76:	c38d                	beqz	a5,2b98 <ck_usart_intr_recv_line+0x10c>
            usart_priv->cb_event(idx, USART_EVENT_RX_OVERFLOW);
    2b78:	fd842783          	lw	a5,-40(s0)
    2b7c:	479c                	lw	a5,8(a5)
    2b7e:	4595                	li	a1,5
    2b80:	fdc42503          	lw	a0,-36(s0)
    2b84:	9782                	jalr	a5
        }

        return;
    2b86:	a809                	j	2b98 <ck_usart_intr_recv_line+0x10c>
            return;
    2b88:	0001                	nop
    2b8a:	a801                	j	2b9a <ck_usart_intr_recv_line+0x10e>
        return;
    2b8c:	0001                	nop
    2b8e:	a031                	j	2b9a <ck_usart_intr_recv_line+0x10e>
        return;
    2b90:	0001                	nop
    2b92:	a021                	j	2b9a <ck_usart_intr_recv_line+0x10e>
        return;
    2b94:	0001                	nop
    2b96:	a011                	j	2b9a <ck_usart_intr_recv_line+0x10e>
        return;
    2b98:	0001                	nop

    }

}
    2b9a:	50b2                	lw	ra,44(sp)
    2b9c:	5422                	lw	s0,40(sp)
    2b9e:	6145                	addi	sp,sp,48
    2ba0:	8082                	ret

00002ba2 <ck_usart_intr_char_timeout>:
/**
  \brief        interrupt service function for character timeout.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_char_timeout(int32_t idx, ck_usart_priv_t *usart_priv)
{
    2ba2:	7179                	addi	sp,sp,-48
    2ba4:	d606                	sw	ra,44(sp)
    2ba6:	d422                	sw	s0,40(sp)
    2ba8:	1800                	addi	s0,sp,48
    2baa:	fca42e23          	sw	a0,-36(s0)
    2bae:	fcb42c23          	sw	a1,-40(s0)
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    2bb2:	fd842783          	lw	a5,-40(s0)
    2bb6:	47dc                	lw	a5,12(a5)
    2bb8:	cf91                	beqz	a5,2bd4 <ck_usart_intr_char_timeout+0x32>
    2bba:	fd842783          	lw	a5,-40(s0)
    2bbe:	4bdc                	lw	a5,20(a5)
    2bc0:	cb91                	beqz	a5,2bd4 <ck_usart_intr_char_timeout+0x32>
        ck_usart_intr_recv_data(idx, usart_priv);
    2bc2:	fd842583          	lw	a1,-40(s0)
    2bc6:	fdc42503          	lw	a0,-36(s0)
    2bca:	00000097          	auipc	ra,0x0
    2bce:	e14080e7          	jalr	-492(ra) # 29de <ck_usart_intr_recv_data>
        return;
    2bd2:	a885                	j	2c42 <ck_usart_intr_char_timeout+0xa0>
    }

    if (usart_priv->cb_event) {
    2bd4:	fd842783          	lw	a5,-40(s0)
    2bd8:	479c                	lw	a5,8(a5)
    2bda:	cb89                	beqz	a5,2bec <ck_usart_intr_char_timeout+0x4a>
        usart_priv->cb_event(idx, USART_EVENT_RECEIVED);
    2bdc:	fd842783          	lw	a5,-40(s0)
    2be0:	479c                	lw	a5,8(a5)
    2be2:	45b9                	li	a1,14
    2be4:	fdc42503          	lw	a0,-36(s0)
    2be8:	9782                	jalr	a5
    2bea:	a8a1                	j	2c42 <ck_usart_intr_char_timeout+0xa0>
    } else {
        ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2bec:	fd842783          	lw	a5,-40(s0)
    2bf0:	439c                	lw	a5,0(a5)
    2bf2:	fef42423          	sw	a5,-24(s0)

        uint32_t timecount = 0;
    2bf6:	fe042623          	sw	zero,-20(s0)

        while (addr->LSR & 0x1) {
    2bfa:	a82d                	j	2c34 <ck_usart_intr_char_timeout+0x92>
            addr->RBR;
    2bfc:	fe842783          	lw	a5,-24(s0)
    2c00:	439c                	lw	a5,0(a5)
            timecount++;
    2c02:	fec42783          	lw	a5,-20(s0)
    2c06:	0785                	addi	a5,a5,1
    2c08:	fef42623          	sw	a5,-20(s0)

            if (timecount >= UART_BUSY_TIMEOUT) {
    2c0c:	fec42703          	lw	a4,-20(s0)
    2c10:	000f47b7          	lui	a5,0xf4
    2c14:	23f78793          	addi	a5,a5,575 # f423f <__min_heap_size+0xe423f>
    2c18:	00e7fe63          	bgeu	a5,a4,2c34 <ck_usart_intr_char_timeout+0x92>
                if (usart_priv->cb_event) {
    2c1c:	fd842783          	lw	a5,-40(s0)
    2c20:	479c                	lw	a5,8(a5)
    2c22:	cf99                	beqz	a5,2c40 <ck_usart_intr_char_timeout+0x9e>
                    usart_priv->cb_event(idx, USART_EVENT_RX_TIMEOUT);
    2c24:	fd842783          	lw	a5,-40(s0)
    2c28:	479c                	lw	a5,8(a5)
    2c2a:	4599                	li	a1,6
    2c2c:	fdc42503          	lw	a0,-36(s0)
    2c30:	9782                	jalr	a5
                }

                return;
    2c32:	a039                	j	2c40 <ck_usart_intr_char_timeout+0x9e>
        while (addr->LSR & 0x1) {
    2c34:	fe842783          	lw	a5,-24(s0)
    2c38:	4bdc                	lw	a5,20(a5)
    2c3a:	8b85                	andi	a5,a5,1
    2c3c:	f3e1                	bnez	a5,2bfc <ck_usart_intr_char_timeout+0x5a>
    2c3e:	a011                	j	2c42 <ck_usart_intr_char_timeout+0xa0>
                return;
    2c40:	0001                	nop
            }
        }
    }
}
    2c42:	50b2                	lw	ra,44(sp)
    2c44:	5422                	lw	s0,40(sp)
    2c46:	6145                	addi	sp,sp,48
    2c48:	8082                	ret

00002c4a <ck_usart_irqhandler>:
/**
  \brief       the interrupt service function.
  \param[in]   index of usart instance.
*/
void ck_usart_irqhandler(int32_t idx)
{
    2c4a:	7179                	addi	sp,sp,-48
    2c4c:	d606                	sw	ra,44(sp)
    2c4e:	d422                	sw	s0,40(sp)
    2c50:	1800                	addi	s0,sp,48
    2c52:	fca42e23          	sw	a0,-36(s0)
    ck_usart_priv_t *usart_priv = &usart_instance[idx];
    2c56:	fdc42703          	lw	a4,-36(s0)
    2c5a:	87ba                	mv	a5,a4
    2c5c:	078e                	slli	a5,a5,0x3
    2c5e:	8f99                	sub	a5,a5,a4
    2c60:	078e                	slli	a5,a5,0x3
    2c62:	2000a737          	lui	a4,0x2000a
    2c66:	3cc70713          	addi	a4,a4,972 # 2000a3cc <usart_instance>
    2c6a:	97ba                	add	a5,a5,a4
    2c6c:	fef42623          	sw	a5,-20(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2c70:	fec42783          	lw	a5,-20(s0)
    2c74:	439c                	lw	a5,0(a5)
    2c76:	fef42423          	sw	a5,-24(s0)

    uint8_t intr_state = addr->IIR & 0xf;
    2c7a:	fe842783          	lw	a5,-24(s0)
    2c7e:	479c                	lw	a5,8(a5)
    2c80:	0ff7f793          	andi	a5,a5,255
    2c84:	8bbd                	andi	a5,a5,15
    2c86:	fef403a3          	sb	a5,-25(s0)

    switch (intr_state) {
    2c8a:	fe744783          	lbu	a5,-25(s0)
    2c8e:	4731                	li	a4,12
    2c90:	04e78d63          	beq	a5,a4,2cea <ck_usart_irqhandler+0xa0>
    2c94:	4731                	li	a4,12
    2c96:	06f74363          	blt	a4,a5,2cfc <ck_usart_irqhandler+0xb2>
    2c9a:	4719                	li	a4,6
    2c9c:	02e78e63          	beq	a5,a4,2cd8 <ck_usart_irqhandler+0x8e>
    2ca0:	4719                	li	a4,6
    2ca2:	04f74d63          	blt	a4,a5,2cfc <ck_usart_irqhandler+0xb2>
    2ca6:	4709                	li	a4,2
    2ca8:	00e78663          	beq	a5,a4,2cb4 <ck_usart_irqhandler+0x6a>
    2cac:	4711                	li	a4,4
    2cae:	00e78c63          	beq	a5,a4,2cc6 <ck_usart_irqhandler+0x7c>
        case DW_IIR_CHAR_TIMEOUT:
            ck_usart_intr_char_timeout(idx, usart_priv);
            break;

        default:
            break;
    2cb2:	a0a9                	j	2cfc <ck_usart_irqhandler+0xb2>
            ck_usart_intr_threshold_empty(idx, usart_priv);
    2cb4:	fec42583          	lw	a1,-20(s0)
    2cb8:	fdc42503          	lw	a0,-36(s0)
    2cbc:	00000097          	auipc	ra,0x0
    2cc0:	c0e080e7          	jalr	-1010(ra) # 28ca <ck_usart_intr_threshold_empty>
            break;
    2cc4:	a82d                	j	2cfe <ck_usart_irqhandler+0xb4>
            ck_usart_intr_char_timeout(idx, usart_priv);
    2cc6:	fec42583          	lw	a1,-20(s0)
    2cca:	fdc42503          	lw	a0,-36(s0)
    2cce:	00000097          	auipc	ra,0x0
    2cd2:	ed4080e7          	jalr	-300(ra) # 2ba2 <ck_usart_intr_char_timeout>
            break;
    2cd6:	a025                	j	2cfe <ck_usart_irqhandler+0xb4>
            ck_usart_intr_recv_line(idx, usart_priv);
    2cd8:	fec42583          	lw	a1,-20(s0)
    2cdc:	fdc42503          	lw	a0,-36(s0)
    2ce0:	00000097          	auipc	ra,0x0
    2ce4:	dac080e7          	jalr	-596(ra) # 2a8c <ck_usart_intr_recv_line>
            break;
    2ce8:	a819                	j	2cfe <ck_usart_irqhandler+0xb4>
            ck_usart_intr_char_timeout(idx, usart_priv);
    2cea:	fec42583          	lw	a1,-20(s0)
    2cee:	fdc42503          	lw	a0,-36(s0)
    2cf2:	00000097          	auipc	ra,0x0
    2cf6:	eb0080e7          	jalr	-336(ra) # 2ba2 <ck_usart_intr_char_timeout>
            break;
    2cfa:	a011                	j	2cfe <ck_usart_irqhandler+0xb4>
            break;
    2cfc:	0001                	nop
    }
}
    2cfe:	0001                	nop
    2d00:	50b2                	lw	ra,44(sp)
    2d02:	5422                	lw	s0,40(sp)
    2d04:	6145                	addi	sp,sp,48
    2d06:	8082                	ret

00002d08 <csi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    2d08:	7139                	addi	sp,sp,-64
    2d0a:	de06                	sw	ra,60(sp)
    2d0c:	dc22                	sw	s0,56(sp)
    2d0e:	0080                	addi	s0,sp,64
    2d10:	fca42623          	sw	a0,-52(s0)
    2d14:	fcb42423          	sw	a1,-56(s0)
    uint32_t base = 0u;
    2d18:	fe042023          	sw	zero,-32(s0)
    uint32_t irq = 0u;
    2d1c:	fc042e23          	sw	zero,-36(s0)
    void *handler;

    int32_t ret = target_usart_init(idx, &base, &irq, &handler);
    2d20:	fd840693          	addi	a3,s0,-40
    2d24:	fdc40713          	addi	a4,s0,-36
    2d28:	fe040793          	addi	a5,s0,-32
    2d2c:	863a                	mv	a2,a4
    2d2e:	85be                	mv	a1,a5
    2d30:	fcc42503          	lw	a0,-52(s0)
    2d34:	00000097          	auipc	ra,0x0
    2d38:	254080e7          	jalr	596(ra) # 2f88 <target_usart_init>
    2d3c:	fea42623          	sw	a0,-20(s0)

    if (ret < 0 || ret >= CONFIG_USART_NUM) {
    2d40:	fec42783          	lw	a5,-20(s0)
    2d44:	0007c663          	bltz	a5,2d50 <csi_usart_initialize+0x48>
    2d48:	fec42783          	lw	a5,-20(s0)
    2d4c:	00f05463          	blez	a5,2d54 <csi_usart_initialize+0x4c>
        return NULL;
    2d50:	4781                	li	a5,0
    2d52:	a041                	j	2dd2 <csi_usart_initialize+0xca>
    }

    ck_usart_priv_t *usart_priv = &usart_instance[idx];
    2d54:	fcc42703          	lw	a4,-52(s0)
    2d58:	87ba                	mv	a5,a4
    2d5a:	078e                	slli	a5,a5,0x3
    2d5c:	8f99                	sub	a5,a5,a4
    2d5e:	078e                	slli	a5,a5,0x3
    2d60:	2000a737          	lui	a4,0x2000a
    2d64:	3cc70713          	addi	a4,a4,972 # 2000a3cc <usart_instance>
    2d68:	97ba                	add	a5,a5,a4
    2d6a:	fef42423          	sw	a5,-24(s0)
    usart_priv->base = base;
    2d6e:	fe042703          	lw	a4,-32(s0)
    2d72:	fe842783          	lw	a5,-24(s0)
    2d76:	c398                	sw	a4,0(a5)
    usart_priv->irq = irq;
    2d78:	fdc42703          	lw	a4,-36(s0)
    2d7c:	fe842783          	lw	a5,-24(s0)
    2d80:	c3d8                	sw	a4,4(a5)
    usart_priv->cb_event = cb_event;
    2d82:	fe842783          	lw	a5,-24(s0)
    2d86:	fc842703          	lw	a4,-56(s0)
    2d8a:	c798                	sw	a4,8(a5)
    usart_priv->idx = idx;
    2d8c:	fe842783          	lw	a5,-24(s0)
    2d90:	fcc42703          	lw	a4,-52(s0)
    2d94:	dbd8                	sw	a4,52(a5)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2d96:	fe842783          	lw	a5,-24(s0)
    2d9a:	439c                	lw	a5,0(a5)
    2d9c:	fef42223          	sw	a5,-28(s0)

    /* enable received data available */
    addr->IER = IER_RDA_INT_ENABLE | IIR_RECV_LINE_ENABLE;
    2da0:	fe442783          	lw	a5,-28(s0)
    2da4:	4715                	li	a4,5
    2da6:	c3d8                	sw	a4,4(a5)
    drv_irq_register(usart_priv->irq, handler);
    2da8:	fe842783          	lw	a5,-24(s0)
    2dac:	43dc                	lw	a5,4(a5)
    2dae:	fd842703          	lw	a4,-40(s0)
    2db2:	85ba                	mv	a1,a4
    2db4:	853e                	mv	a0,a5
    2db6:	fffff097          	auipc	ra,0xfffff
    2dba:	5b0080e7          	jalr	1456(ra) # 2366 <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    2dbe:	fe842783          	lw	a5,-24(s0)
    2dc2:	43dc                	lw	a5,4(a5)
    2dc4:	853e                	mv	a0,a5
    2dc6:	fffff097          	auipc	ra,0xfffff
    2dca:	572080e7          	jalr	1394(ra) # 2338 <drv_irq_enable>

    return usart_priv;
    2dce:	fe842783          	lw	a5,-24(s0)
}
    2dd2:	853e                	mv	a0,a5
    2dd4:	50f2                	lw	ra,60(sp)
    2dd6:	5462                	lw	s0,56(sp)
    2dd8:	6121                	addi	sp,sp,64
    2dda:	8082                	ret

00002ddc <csi_usart_config>:
                         uint32_t baud,
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    2ddc:	7139                	addi	sp,sp,-64
    2dde:	de06                	sw	ra,60(sp)
    2de0:	dc22                	sw	s0,56(sp)
    2de2:	0080                	addi	s0,sp,64
    2de4:	fca42e23          	sw	a0,-36(s0)
    2de8:	fcb42c23          	sw	a1,-40(s0)
    2dec:	fcc42a23          	sw	a2,-44(s0)
    2df0:	fcd42823          	sw	a3,-48(s0)
    2df4:	fce42623          	sw	a4,-52(s0)
    2df8:	fcf42423          	sw	a5,-56(s0)
    int32_t ret;

    /* control the data_bit of the usart*/
    ret = csi_usart_config_baudrate(handle, baud);
    2dfc:	fd842583          	lw	a1,-40(s0)
    2e00:	fdc42503          	lw	a0,-36(s0)
    2e04:	fffff097          	auipc	ra,0xfffff
    2e08:	5a4080e7          	jalr	1444(ra) # 23a8 <csi_usart_config_baudrate>
    2e0c:	fea42623          	sw	a0,-20(s0)

    if (ret < 0) {
    2e10:	fec42783          	lw	a5,-20(s0)
    2e14:	0007d563          	bgez	a5,2e1e <csi_usart_config+0x42>
        return ret;
    2e18:	fec42783          	lw	a5,-20(s0)
    2e1c:	a071                	j	2ea8 <csi_usart_config+0xcc>
    }

    /* control mode of the usart*/
    ret = csi_usart_config_mode(handle, mode);
    2e1e:	fd442583          	lw	a1,-44(s0)
    2e22:	fdc42503          	lw	a0,-36(s0)
    2e26:	fffff097          	auipc	ra,0xfffff
    2e2a:	69c080e7          	jalr	1692(ra) # 24c2 <csi_usart_config_mode>
    2e2e:	fea42623          	sw	a0,-20(s0)

    if (ret < 0) {
    2e32:	fec42783          	lw	a5,-20(s0)
    2e36:	0007d563          	bgez	a5,2e40 <csi_usart_config+0x64>
        return ret;
    2e3a:	fec42783          	lw	a5,-20(s0)
    2e3e:	a0ad                	j	2ea8 <csi_usart_config+0xcc>
    }

    /* control the parity of the usart*/
    ret = csi_usart_config_parity(handle, parity);
    2e40:	fd042583          	lw	a1,-48(s0)
    2e44:	fdc42503          	lw	a0,-36(s0)
    2e48:	fffff097          	auipc	ra,0xfffff
    2e4c:	6b2080e7          	jalr	1714(ra) # 24fa <csi_usart_config_parity>
    2e50:	fea42623          	sw	a0,-20(s0)

    if (ret < 0) {
    2e54:	fec42783          	lw	a5,-20(s0)
    2e58:	0007d563          	bgez	a5,2e62 <csi_usart_config+0x86>
        return ret;
    2e5c:	fec42783          	lw	a5,-20(s0)
    2e60:	a0a1                	j	2ea8 <csi_usart_config+0xcc>
    }

    /* control the stopbit of the usart*/
    ret = csi_usart_config_stopbits(handle, stopbits);
    2e62:	fcc42583          	lw	a1,-52(s0)
    2e66:	fdc42503          	lw	a0,-36(s0)
    2e6a:	fffff097          	auipc	ra,0xfffff
    2e6e:	794080e7          	jalr	1940(ra) # 25fe <csi_usart_config_stopbits>
    2e72:	fea42623          	sw	a0,-20(s0)

    if (ret < 0) {
    2e76:	fec42783          	lw	a5,-20(s0)
    2e7a:	0007d563          	bgez	a5,2e84 <csi_usart_config+0xa8>
        return ret;
    2e7e:	fec42783          	lw	a5,-20(s0)
    2e82:	a01d                	j	2ea8 <csi_usart_config+0xcc>
    }

    ret = csi_usart_config_databits(handle, bits);
    2e84:	fc842583          	lw	a1,-56(s0)
    2e88:	fdc42503          	lw	a0,-36(s0)
    2e8c:	00000097          	auipc	ra,0x0
    2e90:	830080e7          	jalr	-2000(ra) # 26bc <csi_usart_config_databits>
    2e94:	fea42623          	sw	a0,-20(s0)

    if (ret < 0) {
    2e98:	fec42783          	lw	a5,-20(s0)
    2e9c:	0007d563          	bgez	a5,2ea6 <csi_usart_config+0xca>
        return ret;
    2ea0:	fec42783          	lw	a5,-20(s0)
    2ea4:	a011                	j	2ea8 <csi_usart_config+0xcc>
    }

    return 0;
    2ea6:	4781                	li	a5,0
}
    2ea8:	853e                	mv	a0,a5
    2eaa:	50f2                	lw	ra,60(sp)
    2eac:	5462                	lw	s0,56(sp)
    2eae:	6121                	addi	sp,sp,64
    2eb0:	8082                	ret

00002eb2 <csi_usart_set_interrupt>:
  \param[in]   type \ref usart_intr_type_e.
  \param[in]   flag 0-OFF, 1-ON.
  \return      error code
*/
int32_t csi_usart_set_interrupt(usart_handle_t handle, usart_intr_type_e type, int32_t flag)
{
    2eb2:	7179                	addi	sp,sp,-48
    2eb4:	d622                	sw	s0,44(sp)
    2eb6:	1800                	addi	s0,sp,48
    2eb8:	fca42e23          	sw	a0,-36(s0)
    2ebc:	fcb42c23          	sw	a1,-40(s0)
    2ec0:	fcc42a23          	sw	a2,-44(s0)
    USART_NULL_PARAM_CHK(handle);
    2ec4:	fdc42783          	lw	a5,-36(s0)
    2ec8:	e791                	bnez	a5,2ed4 <csi_usart_set_interrupt+0x22>
    2eca:	810207b7          	lui	a5,0x81020
    2ece:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    2ed2:	a07d                	j	2f80 <csi_usart_set_interrupt+0xce>

    ck_usart_priv_t *usart_priv = handle;
    2ed4:	fdc42783          	lw	a5,-36(s0)
    2ed8:	fef42623          	sw	a5,-20(s0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    2edc:	fec42783          	lw	a5,-20(s0)
    2ee0:	439c                	lw	a5,0(a5)
    2ee2:	fef42423          	sw	a5,-24(s0)

    switch (type) {
    2ee6:	fd842783          	lw	a5,-40(s0)
    2eea:	c799                	beqz	a5,2ef8 <csi_usart_set_interrupt+0x46>
    2eec:	fd842703          	lw	a4,-40(s0)
    2ef0:	4785                	li	a5,1
    2ef2:	04f70263          	beq	a4,a5,2f36 <csi_usart_set_interrupt+0x84>
    2ef6:	a8bd                	j	2f74 <csi_usart_set_interrupt+0xc2>
        case USART_INTR_WRITE:
            if (flag == 0) {
    2ef8:	fd442783          	lw	a5,-44(s0)
    2efc:	eb91                	bnez	a5,2f10 <csi_usart_set_interrupt+0x5e>
                addr->IER &= ~IER_THRE_INT_ENABLE;
    2efe:	fe842783          	lw	a5,-24(s0)
    2f02:	43dc                	lw	a5,4(a5)
    2f04:	ffd7f713          	andi	a4,a5,-3
    2f08:	fe842783          	lw	a5,-24(s0)
    2f0c:	c3d8                	sw	a4,4(a5)
                addr->IER |= IER_THRE_INT_ENABLE;
            } else {
                return ERR_USART(DRV_ERROR_PARAMETER);
            }

            break;
    2f0e:	a885                	j	2f7e <csi_usart_set_interrupt+0xcc>
            } else if (flag == 1) {
    2f10:	fd442703          	lw	a4,-44(s0)
    2f14:	4785                	li	a5,1
    2f16:	00f71b63          	bne	a4,a5,2f2c <csi_usart_set_interrupt+0x7a>
                addr->IER |= IER_THRE_INT_ENABLE;
    2f1a:	fe842783          	lw	a5,-24(s0)
    2f1e:	43dc                	lw	a5,4(a5)
    2f20:	0027e713          	ori	a4,a5,2
    2f24:	fe842783          	lw	a5,-24(s0)
    2f28:	c3d8                	sw	a4,4(a5)
            break;
    2f2a:	a891                	j	2f7e <csi_usart_set_interrupt+0xcc>
                return ERR_USART(DRV_ERROR_PARAMETER);
    2f2c:	810207b7          	lui	a5,0x81020
    2f30:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    2f34:	a0b1                	j	2f80 <csi_usart_set_interrupt+0xce>

        case USART_INTR_READ:
            if (flag == 0) {
    2f36:	fd442783          	lw	a5,-44(s0)
    2f3a:	eb91                	bnez	a5,2f4e <csi_usart_set_interrupt+0x9c>
                addr->IER &= ~IER_RDA_INT_ENABLE;
    2f3c:	fe842783          	lw	a5,-24(s0)
    2f40:	43dc                	lw	a5,4(a5)
    2f42:	ffe7f713          	andi	a4,a5,-2
    2f46:	fe842783          	lw	a5,-24(s0)
    2f4a:	c3d8                	sw	a4,4(a5)
                addr->IER |= IER_RDA_INT_ENABLE;
            } else {
                return ERR_USART(DRV_ERROR_PARAMETER);
            }

            break;
    2f4c:	a80d                	j	2f7e <csi_usart_set_interrupt+0xcc>
            } else if (flag == 1) {
    2f4e:	fd442703          	lw	a4,-44(s0)
    2f52:	4785                	li	a5,1
    2f54:	00f71b63          	bne	a4,a5,2f6a <csi_usart_set_interrupt+0xb8>
                addr->IER |= IER_RDA_INT_ENABLE;
    2f58:	fe842783          	lw	a5,-24(s0)
    2f5c:	43dc                	lw	a5,4(a5)
    2f5e:	0017e713          	ori	a4,a5,1
    2f62:	fe842783          	lw	a5,-24(s0)
    2f66:	c3d8                	sw	a4,4(a5)
            break;
    2f68:	a819                	j	2f7e <csi_usart_set_interrupt+0xcc>
                return ERR_USART(DRV_ERROR_PARAMETER);
    2f6a:	810207b7          	lui	a5,0x81020
    2f6e:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    2f72:	a039                	j	2f80 <csi_usart_set_interrupt+0xce>

        default:
            return ERR_USART(DRV_ERROR_PARAMETER);
    2f74:	810207b7          	lui	a5,0x81020
    2f78:	08478793          	addi	a5,a5,132 # 81020084 <__heap_end+0x61000084>
    2f7c:	a011                	j	2f80 <csi_usart_set_interrupt+0xce>

    }

    return 0;
    2f7e:	4781                	li	a5,0
}
    2f80:	853e                	mv	a0,a5
    2f82:	5432                	lw	s0,44(sp)
    2f84:	6145                	addi	sp,sp,48
    2f86:	8082                	ret

00002f88 <target_usart_init>:
const sg_usart_config[CONFIG_USART_NUM] = {
    {CSKY_UART_BASE, UART_IRQn, USART_IRQHandler},
};

int32_t target_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    2f88:	1101                	addi	sp,sp,-32
    2f8a:	ce22                	sw	s0,28(sp)
    2f8c:	1000                	addi	s0,sp,32
    2f8e:	fea42623          	sw	a0,-20(s0)
    2f92:	feb42423          	sw	a1,-24(s0)
    2f96:	fec42223          	sw	a2,-28(s0)
    2f9a:	fed42023          	sw	a3,-32(s0)
    if (idx >= CONFIG_USART_NUM) {
    2f9e:	fec42783          	lw	a5,-20(s0)
    2fa2:	00f05463          	blez	a5,2faa <target_usart_init+0x22>
        return -1;
    2fa6:	57fd                	li	a5,-1
    2fa8:	a08d                	j	300a <target_usart_init+0x82>
    }

    if (base != NULL) {
    2faa:	fe842783          	lw	a5,-24(s0)
    2fae:	c385                	beqz	a5,2fce <target_usart_init+0x46>
        *base = sg_usart_config[idx].base;
    2fb0:	000087b7          	lui	a5,0x8
    2fb4:	53478693          	addi	a3,a5,1332 # 8534 <sg_usart_config>
    2fb8:	fec42703          	lw	a4,-20(s0)
    2fbc:	87ba                	mv	a5,a4
    2fbe:	0786                	slli	a5,a5,0x1
    2fc0:	97ba                	add	a5,a5,a4
    2fc2:	078a                	slli	a5,a5,0x2
    2fc4:	97b6                	add	a5,a5,a3
    2fc6:	4398                	lw	a4,0(a5)
    2fc8:	fe842783          	lw	a5,-24(s0)
    2fcc:	c398                	sw	a4,0(a5)
    }

    if (irq != NULL) {
    2fce:	fe442783          	lw	a5,-28(s0)
    2fd2:	c385                	beqz	a5,2ff2 <target_usart_init+0x6a>
        *irq = sg_usart_config[idx].irq;
    2fd4:	000087b7          	lui	a5,0x8
    2fd8:	53478693          	addi	a3,a5,1332 # 8534 <sg_usart_config>
    2fdc:	fec42703          	lw	a4,-20(s0)
    2fe0:	87ba                	mv	a5,a4
    2fe2:	0786                	slli	a5,a5,0x1
    2fe4:	97ba                	add	a5,a5,a4
    2fe6:	078a                	slli	a5,a5,0x2
    2fe8:	97b6                	add	a5,a5,a3
    2fea:	43d8                	lw	a4,4(a5)
    2fec:	fe442783          	lw	a5,-28(s0)
    2ff0:	c398                	sw	a4,0(a5)
    }

    if (handler != NULL) {
    2ff2:	fe042783          	lw	a5,-32(s0)
    2ff6:	cb81                	beqz	a5,3006 <target_usart_init+0x7e>
        *handler = sg_usart_config[idx].handler;
    2ff8:	000037b7          	lui	a5,0x3
    2ffc:	6ca78713          	addi	a4,a5,1738 # 36ca <USART_IRQHandler>
    3000:	fe042783          	lw	a5,-32(s0)
    3004:	c398                	sw	a4,0(a5)
    }

    return idx;
    3006:	fec42783          	lw	a5,-20(s0)
}
    300a:	853e                	mv	a0,a5
    300c:	4472                	lw	s0,28(sp)
    300e:	6105                	addi	sp,sp,32
    3010:	8082                	ret

00003012 <target_get_timer_count>:
    {CSKY_TIMER11_BASE, TIM11_IRQn, TIM11_IRQHandler},

};

int32_t target_get_timer_count(void)
{
    3012:	1141                	addi	sp,sp,-16
    3014:	c622                	sw	s0,12(sp)
    3016:	0800                	addi	s0,sp,16
    return CONFIG_TIMER_NUM;
    3018:	47b1                	li	a5,12
}
    301a:	853e                	mv	a0,a5
    301c:	4432                	lw	s0,12(sp)
    301e:	0141                	addi	sp,sp,16
    3020:	8082                	ret

00003022 <target_get_timer>:

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    3022:	1101                	addi	sp,sp,-32
    3024:	ce06                	sw	ra,28(sp)
    3026:	cc22                	sw	s0,24(sp)
    3028:	1000                	addi	s0,sp,32
    302a:	fea42623          	sw	a0,-20(s0)
    302e:	feb42423          	sw	a1,-24(s0)
    3032:	fec42223          	sw	a2,-28(s0)
    3036:	fed42023          	sw	a3,-32(s0)
    if (idx >= target_get_timer_count()) {
    303a:	00000097          	auipc	ra,0x0
    303e:	fd8080e7          	jalr	-40(ra) # 3012 <target_get_timer_count>
    3042:	872a                	mv	a4,a0
    3044:	fec42783          	lw	a5,-20(s0)
    3048:	00e7c463          	blt	a5,a4,3050 <target_get_timer+0x2e>
        return -1;
    304c:	57fd                	li	a5,-1
    304e:	a88d                	j	30c0 <target_get_timer+0x9e>
    }

    if (base != NULL) {
    3050:	fe842783          	lw	a5,-24(s0)
    3054:	c385                	beqz	a5,3074 <target_get_timer+0x52>
        *base = sg_timer_config[idx].base;
    3056:	000087b7          	lui	a5,0x8
    305a:	54078693          	addi	a3,a5,1344 # 8540 <sg_timer_config>
    305e:	fec42703          	lw	a4,-20(s0)
    3062:	87ba                	mv	a5,a4
    3064:	0786                	slli	a5,a5,0x1
    3066:	97ba                	add	a5,a5,a4
    3068:	078a                	slli	a5,a5,0x2
    306a:	97b6                	add	a5,a5,a3
    306c:	4398                	lw	a4,0(a5)
    306e:	fe842783          	lw	a5,-24(s0)
    3072:	c398                	sw	a4,0(a5)
    }

    if (irq != NULL) {
    3074:	fe442783          	lw	a5,-28(s0)
    3078:	c385                	beqz	a5,3098 <target_get_timer+0x76>
        *irq = sg_timer_config[idx].irq;
    307a:	000087b7          	lui	a5,0x8
    307e:	54078693          	addi	a3,a5,1344 # 8540 <sg_timer_config>
    3082:	fec42703          	lw	a4,-20(s0)
    3086:	87ba                	mv	a5,a4
    3088:	0786                	slli	a5,a5,0x1
    308a:	97ba                	add	a5,a5,a4
    308c:	078a                	slli	a5,a5,0x2
    308e:	97b6                	add	a5,a5,a3
    3090:	43d8                	lw	a4,4(a5)
    3092:	fe442783          	lw	a5,-28(s0)
    3096:	c398                	sw	a4,0(a5)
    }

    if (handler != NULL) {
    3098:	fe042783          	lw	a5,-32(s0)
    309c:	c385                	beqz	a5,30bc <target_get_timer+0x9a>
        *handler = sg_timer_config[idx].handler;
    309e:	000087b7          	lui	a5,0x8
    30a2:	54078693          	addi	a3,a5,1344 # 8540 <sg_timer_config>
    30a6:	fec42703          	lw	a4,-20(s0)
    30aa:	87ba                	mv	a5,a4
    30ac:	0786                	slli	a5,a5,0x1
    30ae:	97ba                	add	a5,a5,a4
    30b0:	078a                	slli	a5,a5,0x2
    30b2:	97b6                	add	a5,a5,a3
    30b4:	4798                	lw	a4,8(a5)
    30b6:	fe042783          	lw	a5,-32(s0)
    30ba:	c398                	sw	a4,0(a5)
    }

    return idx;
    30bc:	fec42783          	lw	a5,-20(s0)
}
    30c0:	853e                	mv	a0,a5
    30c2:	40f2                	lw	ra,28(sp)
    30c4:	4462                	lw	s0,24(sp)
    30c6:	6105                	addi	sp,sp,32
    30c8:	8082                	ret

000030ca <timer_deactive_control>:
/**
  \brief      Make all the timers in the idle state.
  \param[in]  pointer to timer register base
*/
static void timer_deactive_control(dw_timer_reg_t *addr)
{
    30ca:	1101                	addi	sp,sp,-32
    30cc:	ce22                	sw	s0,28(sp)
    30ce:	1000                	addi	s0,sp,32
    30d0:	fea42623          	sw	a0,-20(s0)
    /* stop the corresponding timer */
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
    30d4:	fec42783          	lw	a5,-20(s0)
    30d8:	479c                	lw	a5,8(a5)
    30da:	1007b78b          	extu	a5,a5,4,0
    30de:	0ff7f793          	andi	a5,a5,255
    30e2:	8bf9                	andi	a5,a5,30
    30e4:	0ff7f713          	andi	a4,a5,255
    30e8:	fec42783          	lw	a5,-20(s0)
    30ec:	01f77613          	andi	a2,a4,31
    30f0:	0087c703          	lbu	a4,8(a5)
    30f4:	9b01                	andi	a4,a4,-32
    30f6:	86ba                	mv	a3,a4
    30f8:	8732                	mv	a4,a2
    30fa:	8f55                	or	a4,a4,a3
    30fc:	00e78423          	sb	a4,8(a5)
    /* Disable interrupt. */
    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;
    3100:	fec42783          	lw	a5,-20(s0)
    3104:	479c                	lw	a5,8(a5)
    3106:	1007b78b          	extu	a5,a5,4,0
    310a:	0ff7f793          	andi	a5,a5,255
    310e:	0047e793          	ori	a5,a5,4
    3112:	0ff7f713          	andi	a4,a5,255
    3116:	fec42783          	lw	a5,-20(s0)
    311a:	01f77613          	andi	a2,a4,31
    311e:	0087c703          	lbu	a4,8(a5)
    3122:	9b01                	andi	a4,a4,-32
    3124:	86ba                	mv	a3,a4
    3126:	8732                	mv	a4,a2
    3128:	8f55                	or	a4,a4,a3
    312a:	00e78423          	sb	a4,8(a5)
}
    312e:	0001                	nop
    3130:	4472                	lw	s0,28(sp)
    3132:	6105                	addi	sp,sp,32
    3134:	8082                	ret

00003136 <dw_timer_irqhandler>:

void dw_timer_irqhandler(int idx)
{
    3136:	7179                	addi	sp,sp,-48
    3138:	d606                	sw	ra,44(sp)
    313a:	d422                	sw	s0,40(sp)
    313c:	1800                	addi	s0,sp,48
    313e:	fca42e23          	sw	a0,-36(s0)
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
    3142:	fdc42703          	lw	a4,-36(s0)
    3146:	87ba                	mv	a5,a4
    3148:	0786                	slli	a5,a5,0x1
    314a:	97ba                	add	a5,a5,a4
    314c:	078e                	slli	a5,a5,0x3
    314e:	2000a737          	lui	a4,0x2000a
    3152:	40470713          	addi	a4,a4,1028 # 2000a404 <timer_instance>
    3156:	97ba                	add	a5,a5,a4
    3158:	fef42623          	sw	a5,-20(s0)
    timer_priv->timeout_flag = 1;
    315c:	fec42783          	lw	a5,-20(s0)
    3160:	4705                	li	a4,1
    3162:	cbd8                	sw	a4,20(a5)

    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    3164:	fec42783          	lw	a5,-20(s0)
    3168:	43dc                	lw	a5,4(a5)
    316a:	fef42423          	sw	a5,-24(s0)

    addr->TxEOI;
    316e:	fe842783          	lw	a5,-24(s0)
    3172:	47dc                	lw	a5,12(a5)
    3174:	0007b78b          	extu	a5,a5,0,0

    if (timer_priv->cb_event) {
    3178:	fec42783          	lw	a5,-20(s0)
    317c:	47dc                	lw	a5,12(a5)
    317e:	cb81                	beqz	a5,318e <dw_timer_irqhandler+0x58>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    3180:	fec42783          	lw	a5,-20(s0)
    3184:	47dc                	lw	a5,12(a5)
    3186:	4581                	li	a1,0
    3188:	fdc42503          	lw	a0,-36(s0)
    318c:	9782                	jalr	a5
    }

}
    318e:	50b2                	lw	ra,44(sp)
    3190:	5422                	lw	s0,40(sp)
    3192:	6145                	addi	sp,sp,48
    3194:	8082                	ret

00003196 <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    3196:	7139                	addi	sp,sp,-64
    3198:	de06                	sw	ra,60(sp)
    319a:	dc22                	sw	s0,56(sp)
    319c:	0080                	addi	s0,sp,64
    319e:	fca42623          	sw	a0,-52(s0)
    31a2:	fcb42423          	sw	a1,-56(s0)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    31a6:	fcc42783          	lw	a5,-52(s0)
    31aa:	0007c763          	bltz	a5,31b8 <csi_timer_initialize+0x22>
    31ae:	fcc42703          	lw	a4,-52(s0)
    31b2:	47ad                	li	a5,11
    31b4:	00e7d463          	bge	a5,a4,31bc <csi_timer_initialize+0x26>
        return NULL;
    31b8:	4781                	li	a5,0
    31ba:	a0fd                	j	32a8 <csi_timer_initialize+0x112>
    }

    uint32_t base = 0u;
    31bc:	fe042023          	sw	zero,-32(s0)
    uint32_t irq = 0u;
    31c0:	fc042e23          	sw	zero,-36(s0)
    void *handler;

    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    31c4:	fd840693          	addi	a3,s0,-40
    31c8:	fdc40713          	addi	a4,s0,-36
    31cc:	fe040793          	addi	a5,s0,-32
    31d0:	863a                	mv	a2,a4
    31d2:	85be                	mv	a1,a5
    31d4:	fcc42503          	lw	a0,-52(s0)
    31d8:	00000097          	auipc	ra,0x0
    31dc:	e4a080e7          	jalr	-438(ra) # 3022 <target_get_timer>
    31e0:	fea42623          	sw	a0,-20(s0)

    if (real_idx != idx) {
    31e4:	fec42703          	lw	a4,-20(s0)
    31e8:	fcc42783          	lw	a5,-52(s0)
    31ec:	00f70463          	beq	a4,a5,31f4 <csi_timer_initialize+0x5e>
        return NULL;
    31f0:	4781                	li	a5,0
    31f2:	a85d                	j	32a8 <csi_timer_initialize+0x112>
    }

    dw_timer_priv_t *timer_priv = &timer_instance[idx];
    31f4:	fcc42703          	lw	a4,-52(s0)
    31f8:	87ba                	mv	a5,a4
    31fa:	0786                	slli	a5,a5,0x1
    31fc:	97ba                	add	a5,a5,a4
    31fe:	078e                	slli	a5,a5,0x3
    3200:	2000a737          	lui	a4,0x2000a
    3204:	40470713          	addi	a4,a4,1028 # 2000a404 <timer_instance>
    3208:	97ba                	add	a5,a5,a4
    320a:	fef42423          	sw	a5,-24(s0)
    timer_priv->base = base;
    320e:	fe042703          	lw	a4,-32(s0)
    3212:	fe842783          	lw	a5,-24(s0)
    3216:	c3d8                	sw	a4,4(a5)
    timer_priv->irq  = irq;
    3218:	fdc42703          	lw	a4,-36(s0)
    321c:	fe842783          	lw	a5,-24(s0)
    3220:	c798                	sw	a4,8(a5)
    timer_priv->idx = idx;
    3222:	fcc42783          	lw	a5,-52(s0)
    3226:	0ff7f713          	andi	a4,a5,255
    322a:	fe842783          	lw	a5,-24(s0)
    322e:	00e78023          	sb	a4,0(a5)

    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    3232:	fe842783          	lw	a5,-24(s0)
    3236:	43dc                	lw	a5,4(a5)
    3238:	fef42223          	sw	a5,-28(s0)
    timer_priv->timeout = DW_TIMER_INIT_DEFAULT_VALUE;
    323c:	4501                	li	a0,0
    323e:	00000097          	auipc	ra,0x0
    3242:	624080e7          	jalr	1572(ra) # 3862 <drv_get_timer_freq>
    3246:	87aa                	mv	a5,a0
    3248:	873e                	mv	a4,a5
    324a:	57fd                	li	a5,-1
    324c:	02e7d733          	divu	a4,a5,a4
    3250:	000f47b7          	lui	a5,0xf4
    3254:	24078793          	addi	a5,a5,576 # f4240 <__min_heap_size+0xe4240>
    3258:	02f70733          	mul	a4,a4,a5
    325c:	fe842783          	lw	a5,-24(s0)
    3260:	cb98                	sw	a4,16(a5)

#ifdef CONFIG_LPM
    csi_timer_power_control(timer_priv, DRV_POWER_FULL);
#endif

    timer_deactive_control(addr);
    3262:	fe442503          	lw	a0,-28(s0)
    3266:	00000097          	auipc	ra,0x0
    326a:	e64080e7          	jalr	-412(ra) # 30ca <timer_deactive_control>
    timer_priv->cb_event = cb_event;
    326e:	fe842783          	lw	a5,-24(s0)
    3272:	fc842703          	lw	a4,-56(s0)
    3276:	c7d8                	sw	a4,12(a5)

    if (cb_event != NULL) {
    3278:	fc842783          	lw	a5,-56(s0)
    327c:	c785                	beqz	a5,32a4 <csi_timer_initialize+0x10e>
        drv_irq_register(timer_priv->irq, handler);
    327e:	fe842783          	lw	a5,-24(s0)
    3282:	479c                	lw	a5,8(a5)
    3284:	fd842703          	lw	a4,-40(s0)
    3288:	85ba                	mv	a1,a4
    328a:	853e                	mv	a0,a5
    328c:	fffff097          	auipc	ra,0xfffff
    3290:	0da080e7          	jalr	218(ra) # 2366 <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    3294:	fe842783          	lw	a5,-24(s0)
    3298:	479c                	lw	a5,8(a5)
    329a:	853e                	mv	a0,a5
    329c:	fffff097          	auipc	ra,0xfffff
    32a0:	09c080e7          	jalr	156(ra) # 2338 <drv_irq_enable>
    }

    return (timer_handle_t)timer_priv;
    32a4:	fe842783          	lw	a5,-24(s0)
}
    32a8:	853e                	mv	a0,a5
    32aa:	50f2                	lw	ra,60(sp)
    32ac:	5462                	lw	s0,56(sp)
    32ae:	6121                	addi	sp,sp,64
    32b0:	8082                	ret

000032b2 <csi_timer_config>:
  \param[in]   handle timer handle to operate.
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    32b2:	7179                	addi	sp,sp,-48
    32b4:	d622                	sw	s0,44(sp)
    32b6:	1800                	addi	s0,sp,48
    32b8:	fca42e23          	sw	a0,-36(s0)
    32bc:	fcb42c23          	sw	a1,-40(s0)
    TIMER_NULL_PARAM_CHK(handle);
    32c0:	fdc42783          	lw	a5,-36(s0)
    32c4:	e791                	bnez	a5,32d0 <csi_timer_config+0x1e>
    32c6:	810707b7          	lui	a5,0x81070
    32ca:	08478793          	addi	a5,a5,132 # 81070084 <__heap_end+0x61050084>
    32ce:	a87d                	j	338c <csi_timer_config+0xda>

    dw_timer_priv_t *timer_priv = handle;
    32d0:	fdc42783          	lw	a5,-36(s0)
    32d4:	fef42623          	sw	a5,-20(s0)
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    32d8:	fec42783          	lw	a5,-20(s0)
    32dc:	43dc                	lw	a5,4(a5)
    32de:	fef42423          	sw	a5,-24(s0)

    switch (mode) {
    32e2:	fd842783          	lw	a5,-40(s0)
    32e6:	c799                	beqz	a5,32f4 <csi_timer_config+0x42>
    32e8:	fd842703          	lw	a4,-40(s0)
    32ec:	4785                	li	a5,1
    32ee:	02f70a63          	beq	a4,a5,3322 <csi_timer_config+0x70>
    32f2:	a085                	j	3352 <csi_timer_config+0xa0>
        case TIMER_MODE_FREE_RUNNING:
            addr->TxControl &= ~DW_TIMER_TXCONTROL_MODE;
    32f4:	fe842783          	lw	a5,-24(s0)
    32f8:	479c                	lw	a5,8(a5)
    32fa:	1007b78b          	extu	a5,a5,4,0
    32fe:	0ff7f793          	andi	a5,a5,255
    3302:	8bf5                	andi	a5,a5,29
    3304:	0ff7f713          	andi	a4,a5,255
    3308:	fe842783          	lw	a5,-24(s0)
    330c:	01f77613          	andi	a2,a4,31
    3310:	0087c703          	lbu	a4,8(a5)
    3314:	9b01                	andi	a4,a4,-32
    3316:	86ba                	mv	a3,a4
    3318:	8732                	mv	a4,a2
    331a:	8f55                	or	a4,a4,a3
    331c:	00e78423          	sb	a4,8(a5)
            break;
    3320:	a835                	j	335c <csi_timer_config+0xaa>

        case TIMER_MODE_RELOAD:
            addr->TxControl |= DW_TIMER_TXCONTROL_MODE;
    3322:	fe842783          	lw	a5,-24(s0)
    3326:	479c                	lw	a5,8(a5)
    3328:	1007b78b          	extu	a5,a5,4,0
    332c:	0ff7f793          	andi	a5,a5,255
    3330:	0027e793          	ori	a5,a5,2
    3334:	0ff7f713          	andi	a4,a5,255
    3338:	fe842783          	lw	a5,-24(s0)
    333c:	01f77613          	andi	a2,a4,31
    3340:	0087c703          	lbu	a4,8(a5)
    3344:	9b01                	andi	a4,a4,-32
    3346:	86ba                	mv	a3,a4
    3348:	8732                	mv	a4,a2
    334a:	8f55                	or	a4,a4,a3
    334c:	00e78423          	sb	a4,8(a5)
            break;
    3350:	a031                	j	335c <csi_timer_config+0xaa>

        default:
            return ERR_TIMER(DRV_ERROR_PARAMETER);
    3352:	810707b7          	lui	a5,0x81070
    3356:	08478793          	addi	a5,a5,132 # 81070084 <__heap_end+0x61050084>
    335a:	a80d                	j	338c <csi_timer_config+0xda>
    }

    addr->TxControl |= (DW_TIMER_TXCONTROL_TRIGGER);
    335c:	fe842783          	lw	a5,-24(s0)
    3360:	479c                	lw	a5,8(a5)
    3362:	1007b78b          	extu	a5,a5,4,0
    3366:	0ff7f793          	andi	a5,a5,255
    336a:	0107e793          	ori	a5,a5,16
    336e:	0ff7f713          	andi	a4,a5,255
    3372:	fe842783          	lw	a5,-24(s0)
    3376:	01f77613          	andi	a2,a4,31
    337a:	0087c703          	lbu	a4,8(a5)
    337e:	9b01                	andi	a4,a4,-32
    3380:	86ba                	mv	a3,a4
    3382:	8732                	mv	a4,a2
    3384:	8f55                	or	a4,a4,a3
    3386:	00e78423          	sb	a4,8(a5)

    return 0;
    338a:	4781                	li	a5,0
}
    338c:	853e                	mv	a0,a5
    338e:	5432                	lw	s0,44(sp)
    3390:	6145                	addi	sp,sp,48
    3392:	8082                	ret

00003394 <csi_timer_set_timeout>:
  \param[in]   instance  timer instance to operate.
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    3394:	7179                	addi	sp,sp,-48
    3396:	d622                	sw	s0,44(sp)
    3398:	1800                	addi	s0,sp,48
    339a:	fca42e23          	sw	a0,-36(s0)
    339e:	fcb42c23          	sw	a1,-40(s0)
    TIMER_NULL_PARAM_CHK(handle);
    33a2:	fdc42783          	lw	a5,-36(s0)
    33a6:	e791                	bnez	a5,33b2 <csi_timer_set_timeout+0x1e>
    33a8:	810707b7          	lui	a5,0x81070
    33ac:	08478793          	addi	a5,a5,132 # 81070084 <__heap_end+0x61050084>
    33b0:	a819                	j	33c6 <csi_timer_set_timeout+0x32>

    dw_timer_priv_t *timer_priv = handle;
    33b2:	fdc42783          	lw	a5,-36(s0)
    33b6:	fef42623          	sw	a5,-20(s0)
    timer_priv->timeout = timeout;
    33ba:	fec42783          	lw	a5,-20(s0)
    33be:	fd842703          	lw	a4,-40(s0)
    33c2:	cb98                	sw	a4,16(a5)
    return 0;
    33c4:	4781                	li	a5,0
}
    33c6:	853e                	mv	a0,a5
    33c8:	5432                	lw	s0,44(sp)
    33ca:	6145                	addi	sp,sp,48
    33cc:	8082                	ret

000033ce <csi_timer_start>:
  \param[in]   handle timer handle to operate.
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    33ce:	7139                	addi	sp,sp,-64
    33d0:	de06                	sw	ra,60(sp)
    33d2:	dc22                	sw	s0,56(sp)
    33d4:	da4a                	sw	s2,52(sp)
    33d6:	d84e                	sw	s3,48(sp)
    33d8:	d652                	sw	s4,44(sp)
    33da:	d456                	sw	s5,40(sp)
    33dc:	d25a                	sw	s6,36(sp)
    33de:	d05e                	sw	s7,32(sp)
    33e0:	0080                	addi	s0,sp,64
    33e2:	fca42623          	sw	a0,-52(s0)
    TIMER_NULL_PARAM_CHK(handle);
    33e6:	fcc42783          	lw	a5,-52(s0)
    33ea:	e791                	bnez	a5,33f6 <csi_timer_start+0x28>
    33ec:	810707b7          	lui	a5,0x81070
    33f0:	08478793          	addi	a5,a5,132 # 81070084 <__heap_end+0x61050084>
    33f4:	aa41                	j	3584 <csi_timer_start+0x1b6>

    dw_timer_priv_t *timer_priv = handle;
    33f6:	fcc42783          	lw	a5,-52(s0)
    33fa:	fcf42c23          	sw	a5,-40(s0)

    timer_priv->timeout_flag = 0;
    33fe:	fd842783          	lw	a5,-40(s0)
    3402:	0007aa23          	sw	zero,20(a5)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    3406:	fd842783          	lw	a5,-40(s0)
    340a:	0007c783          	lbu	a5,0(a5)
    340e:	853e                	mv	a0,a5
    3410:	00000097          	auipc	ra,0x0
    3414:	452080e7          	jalr	1106(ra) # 3862 <drv_get_timer_freq>
    3418:	872a                	mv	a4,a0
    341a:	000f47b7          	lui	a5,0xf4
    341e:	24078793          	addi	a5,a5,576 # f4240 <__min_heap_size+0xe4240>
    3422:	02f747b3          	div	a5,a4,a5
    3426:	fcf42a23          	sw	a5,-44(s0)
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    342a:	fd842783          	lw	a5,-40(s0)
    342e:	0007c783          	lbu	a5,0(a5)
    3432:	853e                	mv	a0,a5
    3434:	00000097          	auipc	ra,0x0
    3438:	42e080e7          	jalr	1070(ra) # 3862 <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    343c:	fd442783          	lw	a5,-44(s0)
    3440:	cb99                	beqz	a5,3456 <csi_timer_start+0x88>
        load = (uint32_t)(timer_priv->timeout * min_us);
    3442:	fd842783          	lw	a5,-40(s0)
    3446:	4b9c                	lw	a5,16(a5)
    3448:	fd442703          	lw	a4,-44(s0)
    344c:	02f707b3          	mul	a5,a4,a5
    3450:	fcf42e23          	sw	a5,-36(s0)
    3454:	a8b1                	j	34b0 <csi_timer_start+0xe2>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    3456:	fd842783          	lw	a5,-40(s0)
    345a:	4b9c                	lw	a5,16(a5)
    345c:	8a3e                	mv	s4,a5
    345e:	4a81                	li	s5,0
    3460:	fd842783          	lw	a5,-40(s0)
    3464:	0007c783          	lbu	a5,0(a5)
    3468:	853e                	mv	a0,a5
    346a:	00000097          	auipc	ra,0x0
    346e:	3f8080e7          	jalr	1016(ra) # 3862 <drv_get_timer_freq>
    3472:	87aa                	mv	a5,a0
    3474:	893e                	mv	s2,a5
    3476:	87fd                	srai	a5,a5,0x1f
    3478:	89be                	mv	s3,a5
    347a:	032a8733          	mul	a4,s5,s2
    347e:	034987b3          	mul	a5,s3,s4
    3482:	97ba                	add	a5,a5,a4
    3484:	032a0733          	mul	a4,s4,s2
    3488:	032a3bb3          	mulhu	s7,s4,s2
    348c:	8b3a                	mv	s6,a4
    348e:	97de                	add	a5,a5,s7
    3490:	8bbe                	mv	s7,a5
    3492:	000f4637          	lui	a2,0xf4
    3496:	24060613          	addi	a2,a2,576 # f4240 <__min_heap_size+0xe4240>
    349a:	4681                	li	a3,0
    349c:	855a                	mv	a0,s6
    349e:	85de                	mv	a1,s7
    34a0:	ffffd097          	auipc	ra,0xffffd
    34a4:	d3e080e7          	jalr	-706(ra) # 1de <__udivdi3>
    34a8:	872a                	mv	a4,a0
    34aa:	87ae                	mv	a5,a1
    34ac:	fce42e23          	sw	a4,-36(s0)
    }

    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    34b0:	fd842783          	lw	a5,-40(s0)
    34b4:	43dc                	lw	a5,4(a5)
    34b6:	fcf42823          	sw	a5,-48(s0)

    if (timer_priv->timeout == 0) {
    34ba:	fd842783          	lw	a5,-40(s0)
    34be:	4b9c                	lw	a5,16(a5)
    34c0:	e791                	bnez	a5,34cc <csi_timer_start+0xfe>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    34c2:	fd042783          	lw	a5,-48(s0)
    34c6:	577d                	li	a4,-1
    34c8:	c398                	sw	a4,0(a5)
    34ca:	a80d                	j	34fc <csi_timer_start+0x12e>
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
    34cc:	fd042783          	lw	a5,-48(s0)
    34d0:	479c                	lw	a5,8(a5)
    34d2:	1007b78b          	extu	a5,a5,4,0
    34d6:	0ff7f793          	andi	a5,a5,255
    34da:	0027e793          	ori	a5,a5,2
    34de:	0ff7f713          	andi	a4,a5,255
    34e2:	4789                	li	a5,2
    34e4:	00f71763          	bne	a4,a5,34f2 <csi_timer_start+0x124>
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    34e8:	fd042783          	lw	a5,-48(s0)
    34ec:	577d                	li	a4,-1
    34ee:	c398                	sw	a4,0(a5)
    34f0:	a031                	j	34fc <csi_timer_start+0x12e>
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
    34f2:	fd042783          	lw	a5,-48(s0)
    34f6:	fdc42703          	lw	a4,-36(s0)
    34fa:	c398                	sw	a4,0(a5)
        }
    }

    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    34fc:	fd042783          	lw	a5,-48(s0)
    3500:	479c                	lw	a5,8(a5)
    3502:	1007b78b          	extu	a5,a5,4,0
    3506:	0ff7f793          	andi	a5,a5,255
    350a:	8bf9                	andi	a5,a5,30
    350c:	0ff7f713          	andi	a4,a5,255
    3510:	fd042783          	lw	a5,-48(s0)
    3514:	01f77613          	andi	a2,a4,31
    3518:	0087c703          	lbu	a4,8(a5)
    351c:	9b01                	andi	a4,a4,-32
    351e:	86ba                	mv	a3,a4
    3520:	8732                	mv	a4,a2
    3522:	8f55                	or	a4,a4,a3
    3524:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= DW_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3528:	fd042783          	lw	a5,-48(s0)
    352c:	479c                	lw	a5,8(a5)
    352e:	1007b78b          	extu	a5,a5,4,0
    3532:	0ff7f793          	andi	a5,a5,255
    3536:	0017e793          	ori	a5,a5,1
    353a:	0ff7f713          	andi	a4,a5,255
    353e:	fd042783          	lw	a5,-48(s0)
    3542:	01f77613          	andi	a2,a4,31
    3546:	0087c703          	lbu	a4,8(a5)
    354a:	9b01                	andi	a4,a4,-32
    354c:	86ba                	mv	a3,a4
    354e:	8732                	mv	a4,a2
    3550:	8f55                	or	a4,a4,a3
    3552:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3556:	fd042783          	lw	a5,-48(s0)
    355a:	479c                	lw	a5,8(a5)
    355c:	1007b78b          	extu	a5,a5,4,0
    3560:	0ff7f793          	andi	a5,a5,255
    3564:	8bed                	andi	a5,a5,27
    3566:	0ff7f713          	andi	a4,a5,255
    356a:	fd042783          	lw	a5,-48(s0)
    356e:	01f77613          	andi	a2,a4,31
    3572:	0087c703          	lbu	a4,8(a5)
    3576:	9b01                	andi	a4,a4,-32
    3578:	86ba                	mv	a3,a4
    357a:	8732                	mv	a4,a2
    357c:	8f55                	or	a4,a4,a3
    357e:	00e78423          	sb	a4,8(a5)
        addr->TxControl &= ~DW_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    }

#endif

    return 0;
    3582:	4781                	li	a5,0
}
    3584:	853e                	mv	a0,a5
    3586:	50f2                	lw	ra,60(sp)
    3588:	5462                	lw	s0,56(sp)
    358a:	5952                	lw	s2,52(sp)
    358c:	59c2                	lw	s3,48(sp)
    358e:	5a32                	lw	s4,44(sp)
    3590:	5aa2                	lw	s5,40(sp)
    3592:	5b12                	lw	s6,36(sp)
    3594:	5b82                	lw	s7,32(sp)
    3596:	6121                	addi	sp,sp,64
    3598:	8082                	ret

0000359a <csi_timer_get_current_value>:
  \param[in]   handle timer handle to operate.
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    359a:	7179                	addi	sp,sp,-48
    359c:	d622                	sw	s0,44(sp)
    359e:	1800                	addi	s0,sp,48
    35a0:	fca42e23          	sw	a0,-36(s0)
    35a4:	fcb42c23          	sw	a1,-40(s0)
    TIMER_NULL_PARAM_CHK(handle);
    35a8:	fdc42783          	lw	a5,-36(s0)
    35ac:	e791                	bnez	a5,35b8 <csi_timer_get_current_value+0x1e>
    35ae:	810707b7          	lui	a5,0x81070
    35b2:	08478793          	addi	a5,a5,132 # 81070084 <__heap_end+0x61050084>
    35b6:	a80d                	j	35e8 <csi_timer_get_current_value+0x4e>
    TIMER_NULL_PARAM_CHK(value);
    35b8:	fd842783          	lw	a5,-40(s0)
    35bc:	e791                	bnez	a5,35c8 <csi_timer_get_current_value+0x2e>
    35be:	810707b7          	lui	a5,0x81070
    35c2:	08478793          	addi	a5,a5,132 # 81070084 <__heap_end+0x61050084>
    35c6:	a00d                	j	35e8 <csi_timer_get_current_value+0x4e>

    dw_timer_priv_t *timer_priv = handle;
    35c8:	fdc42783          	lw	a5,-36(s0)
    35cc:	fef42623          	sw	a5,-20(s0)
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    35d0:	fec42783          	lw	a5,-20(s0)
    35d4:	43dc                	lw	a5,4(a5)
    35d6:	fef42423          	sw	a5,-24(s0)

    *value = addr->TxCurrentValue;
    35da:	fe842783          	lw	a5,-24(s0)
    35de:	43d8                	lw	a4,4(a5)
    35e0:	fd842783          	lw	a5,-40(s0)
    35e4:	c398                	sw	a4,0(a5)
    return 0;
    35e6:	4781                	li	a5,0
}
    35e8:	853e                	mv	a0,a5
    35ea:	5432                	lw	s0,44(sp)
    35ec:	6145                	addi	sp,sp,48
    35ee:	8082                	ret

000035f0 <csi_coret_config>:
  \note    When the variable <b>__Vendor_SysTickConfig</b> is set to 1, then the
           function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
           must contain a vendor-specific implementation of this function.
 */
__STATIC_INLINE uint32_t csi_coret_config(uint32_t ticks, int32_t IRQn)
{
    35f0:	1101                	addi	sp,sp,-32
    35f2:	ce22                	sw	s0,28(sp)
    35f4:	1000                	addi	s0,sp,32
    35f6:	fea42623          	sw	a0,-20(s0)
    35fa:	feb42423          	sw	a1,-24(s0)
    if ((CORET->MTIMECMP != 0) && (CORET->MTIMECMP != 0xffffffffffffffff)) {
    35fe:	e00047b7          	lui	a5,0xe0004
    3602:	4390                	lw	a2,0(a5)
    3604:	43d4                	lw	a3,4(a5)
    3606:	87b2                	mv	a5,a2
    3608:	8fd5                	or	a5,a5,a3
    360a:	c7b1                	beqz	a5,3656 <csi_coret_config+0x66>
    360c:	e00047b7          	lui	a5,0xe0004
    3610:	4398                	lw	a4,0(a5)
    3612:	43dc                	lw	a5,4(a5)
    3614:	863a                	mv	a2,a4
    3616:	56fd                	li	a3,-1
    3618:	00d61663          	bne	a2,a3,3624 <csi_coret_config+0x34>
    361c:	873e                	mv	a4,a5
    361e:	57fd                	li	a5,-1
    3620:	02f70b63          	beq	a4,a5,3656 <csi_coret_config+0x66>
        CORET->MTIMECMP = CORET->MTIMECMP + ticks;
    3624:	e00047b7          	lui	a5,0xe0004
    3628:	4398                	lw	a4,0(a5)
    362a:	43dc                	lw	a5,4(a5)
    362c:	fec42683          	lw	a3,-20(s0)
    3630:	8336                	mv	t1,a3
    3632:	4381                	li	t2,0
    3634:	e00045b7          	lui	a1,0xe0004
    3638:	00670633          	add	a2,a4,t1
    363c:	8532                	mv	a0,a2
    363e:	00e53533          	sltu	a0,a0,a4
    3642:	007786b3          	add	a3,a5,t2
    3646:	00d507b3          	add	a5,a0,a3
    364a:	86be                	mv	a3,a5
    364c:	8732                	mv	a4,a2
    364e:	87b6                	mv	a5,a3
    3650:	c198                	sw	a4,0(a1)
    3652:	c1dc                	sw	a5,4(a1)
    3654:	a82d                	j	368e <csi_coret_config+0x9e>
    } else {
        CORET->MTIMECMP = CORET->MTIME + ticks;
    3656:	e0004737          	lui	a4,0xe0004
    365a:	67a1                	lui	a5,0x8
    365c:	97ba                	add	a5,a5,a4
    365e:	ff87a703          	lw	a4,-8(a5) # 7ff8 <uart_process_frame+0x1bc>
    3662:	ffc7a783          	lw	a5,-4(a5)
    3666:	fec42683          	lw	a3,-20(s0)
    366a:	8836                	mv	a6,a3
    366c:	4881                	li	a7,0
    366e:	e00045b7          	lui	a1,0xe0004
    3672:	01070633          	add	a2,a4,a6
    3676:	8532                	mv	a0,a2
    3678:	00e53533          	sltu	a0,a0,a4
    367c:	011786b3          	add	a3,a5,a7
    3680:	00d507b3          	add	a5,a0,a3
    3684:	86be                	mv	a3,a5
    3686:	8732                	mv	a4,a2
    3688:	87b6                	mv	a5,a3
    368a:	c198                	sw	a4,0(a1)
    368c:	c1dc                	sw	a5,4(a1)
    }
    return (0UL);
    368e:	4781                	li	a5,0
}
    3690:	853e                	mv	a0,a5
    3692:	4472                	lw	s0,28(sp)
    3694:	6105                	addi	sp,sp,32
    3696:	8082                	ret

00003698 <CORET_IRQHandler>:
#define  CSI_INTRPT_ENTER()
#define  CSI_INTRPT_EXIT()
#endif

ATTRIBUTE_ISR void CORET_IRQHandler(void)
{
    3698:	0040000b          	ipush
    369c:	1161                	addi	sp,sp,-8
    369e:	c222                	sw	s0,4(sp)
    36a0:	0880                	addi	s0,sp,80
#ifndef CONFIG_KERNEL_FREERTOS
    CSI_INTRPT_ENTER();
#endif

    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);
    36a2:	00000097          	auipc	ra,0x0
    36a6:	1aa080e7          	jalr	426(ra) # 384c <drv_get_sys_freq>
    36aa:	872a                	mv	a4,a0
    36ac:	06400793          	li	a5,100
    36b0:	02f747b3          	div	a5,a4,a5
    36b4:	459d                	li	a1,7
    36b6:	853e                	mv	a0,a5
    36b8:	00000097          	auipc	ra,0x0
    36bc:	f38080e7          	jalr	-200(ra) # 35f0 <csi_coret_config>
#endif

#ifndef CONFIG_KERNEL_FREERTOS
    CSI_INTRPT_EXIT();
#endif
}
    36c0:	0001                	nop
    36c2:	4412                	lw	s0,4(sp)
    36c4:	0121                	addi	sp,sp,8
    36c6:	0050000b          	ipop

000036ca <USART_IRQHandler>:

ATTRIBUTE_ISR void USART_IRQHandler(void)
{
    36ca:	0040000b          	ipush
    36ce:	1161                	addi	sp,sp,-8
    36d0:	c222                	sw	s0,4(sp)
    36d2:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    ck_usart_irqhandler(0);
    36d4:	4501                	li	a0,0
    36d6:	fffff097          	auipc	ra,0xfffff
    36da:	574080e7          	jalr	1396(ra) # 2c4a <ck_usart_irqhandler>
    CSI_INTRPT_EXIT();
}
    36de:	0001                	nop
    36e0:	4412                	lw	s0,4(sp)
    36e2:	0121                	addi	sp,sp,8
    36e4:	0050000b          	ipop

000036e8 <TIM0_IRQHandler>:

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    36e8:	0040000b          	ipush
    36ec:	1161                	addi	sp,sp,-8
    36ee:	c222                	sw	s0,4(sp)
    36f0:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(0);
    36f2:	4501                	li	a0,0
    36f4:	00000097          	auipc	ra,0x0
    36f8:	a42080e7          	jalr	-1470(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    36fc:	0001                	nop
    36fe:	4412                	lw	s0,4(sp)
    3700:	0121                	addi	sp,sp,8
    3702:	0050000b          	ipop

00003706 <TIM1_IRQHandler>:

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    3706:	0040000b          	ipush
    370a:	1161                	addi	sp,sp,-8
    370c:	c222                	sw	s0,4(sp)
    370e:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(1);
    3710:	4505                	li	a0,1
    3712:	00000097          	auipc	ra,0x0
    3716:	a24080e7          	jalr	-1500(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    371a:	0001                	nop
    371c:	4412                	lw	s0,4(sp)
    371e:	0121                	addi	sp,sp,8
    3720:	0050000b          	ipop

00003724 <TIM2_IRQHandler>:
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    3724:	0040000b          	ipush
    3728:	1161                	addi	sp,sp,-8
    372a:	c222                	sw	s0,4(sp)
    372c:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(2);
    372e:	4509                	li	a0,2
    3730:	00000097          	auipc	ra,0x0
    3734:	a06080e7          	jalr	-1530(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    3738:	0001                	nop
    373a:	4412                	lw	s0,4(sp)
    373c:	0121                	addi	sp,sp,8
    373e:	0050000b          	ipop

00003742 <TIM3_IRQHandler>:

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    3742:	0040000b          	ipush
    3746:	1161                	addi	sp,sp,-8
    3748:	c222                	sw	s0,4(sp)
    374a:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(3);
    374c:	450d                	li	a0,3
    374e:	00000097          	auipc	ra,0x0
    3752:	9e8080e7          	jalr	-1560(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    3756:	0001                	nop
    3758:	4412                	lw	s0,4(sp)
    375a:	0121                	addi	sp,sp,8
    375c:	0050000b          	ipop

00003760 <TIM4_NMIHandler>:

ATTRIBUTE_ISR void TIM4_NMIHandler(void)
{
    3760:	0040000b          	ipush
    3764:	1161                	addi	sp,sp,-8
    3766:	c222                	sw	s0,4(sp)
    3768:	0880                	addi	s0,sp,80
    dw_timer_irqhandler(4);
    376a:	4511                	li	a0,4
    376c:	00000097          	auipc	ra,0x0
    3770:	9ca080e7          	jalr	-1590(ra) # 3136 <dw_timer_irqhandler>
}
    3774:	0001                	nop
    3776:	4412                	lw	s0,4(sp)
    3778:	0121                	addi	sp,sp,8
    377a:	0050000b          	ipop

0000377e <TIM6_IRQHandler>:

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    377e:	0040000b          	ipush
    3782:	1161                	addi	sp,sp,-8
    3784:	c222                	sw	s0,4(sp)
    3786:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(6);
    3788:	4519                	li	a0,6
    378a:	00000097          	auipc	ra,0x0
    378e:	9ac080e7          	jalr	-1620(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    3792:	0001                	nop
    3794:	4412                	lw	s0,4(sp)
    3796:	0121                	addi	sp,sp,8
    3798:	0050000b          	ipop

0000379c <TIM7_IRQHandler>:

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    379c:	0040000b          	ipush
    37a0:	1161                	addi	sp,sp,-8
    37a2:	c222                	sw	s0,4(sp)
    37a4:	0880                	addi	s0,sp,80
    dw_timer_irqhandler(7);
    37a6:	451d                	li	a0,7
    37a8:	00000097          	auipc	ra,0x0
    37ac:	98e080e7          	jalr	-1650(ra) # 3136 <dw_timer_irqhandler>
}
    37b0:	0001                	nop
    37b2:	4412                	lw	s0,4(sp)
    37b4:	0121                	addi	sp,sp,8
    37b6:	0050000b          	ipop

000037ba <TIM8_IRQHandler>:

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    37ba:	0040000b          	ipush
    37be:	1161                	addi	sp,sp,-8
    37c0:	c222                	sw	s0,4(sp)
    37c2:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(8);
    37c4:	4521                	li	a0,8
    37c6:	00000097          	auipc	ra,0x0
    37ca:	970080e7          	jalr	-1680(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    37ce:	0001                	nop
    37d0:	4412                	lw	s0,4(sp)
    37d2:	0121                	addi	sp,sp,8
    37d4:	0050000b          	ipop

000037d8 <TIM9_IRQHandler>:

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    37d8:	0040000b          	ipush
    37dc:	1161                	addi	sp,sp,-8
    37de:	c222                	sw	s0,4(sp)
    37e0:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(9);
    37e2:	4525                	li	a0,9
    37e4:	00000097          	auipc	ra,0x0
    37e8:	952080e7          	jalr	-1710(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    37ec:	0001                	nop
    37ee:	4412                	lw	s0,4(sp)
    37f0:	0121                	addi	sp,sp,8
    37f2:	0050000b          	ipop

000037f6 <TIM10_IRQHandler>:
ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    37f6:	0040000b          	ipush
    37fa:	1161                	addi	sp,sp,-8
    37fc:	c222                	sw	s0,4(sp)
    37fe:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(10);
    3800:	4529                	li	a0,10
    3802:	00000097          	auipc	ra,0x0
    3806:	934080e7          	jalr	-1740(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    380a:	0001                	nop
    380c:	4412                	lw	s0,4(sp)
    380e:	0121                	addi	sp,sp,8
    3810:	0050000b          	ipop

00003814 <TIM11_IRQHandler>:

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    3814:	0040000b          	ipush
    3818:	1161                	addi	sp,sp,-8
    381a:	c222                	sw	s0,4(sp)
    381c:	0880                	addi	s0,sp,80
    CSI_INTRPT_ENTER();
    dw_timer_irqhandler(11);
    381e:	452d                	li	a0,11
    3820:	00000097          	auipc	ra,0x0
    3824:	916080e7          	jalr	-1770(ra) # 3136 <dw_timer_irqhandler>
    CSI_INTRPT_EXIT();
}
    3828:	0001                	nop
    382a:	4412                	lw	s0,4(sp)
    382c:	0121                	addi	sp,sp,8
    382e:	0050000b          	ipop

00003832 <drv_get_usart_freq>:
{
    return g_system_clock;
}

int32_t drv_get_usart_freq(int32_t idx)
{
    3832:	1101                	addi	sp,sp,-32
    3834:	ce22                	sw	s0,28(sp)
    3836:	1000                	addi	s0,sp,32
    3838:	fea42623          	sw	a0,-20(s0)
    return g_system_clock;
    383c:	200007b7          	lui	a5,0x20000
    3840:	0c07a783          	lw	a5,192(a5) # 200000c0 <g_system_clock>
}
    3844:	853e                	mv	a0,a5
    3846:	4472                	lw	s0,28(sp)
    3848:	6105                	addi	sp,sp,32
    384a:	8082                	ret

0000384c <drv_get_sys_freq>:
{
    return g_system_clock;
}

int32_t drv_get_sys_freq(void)
{
    384c:	1141                	addi	sp,sp,-16
    384e:	c622                	sw	s0,12(sp)
    3850:	0800                	addi	s0,sp,16
    return g_system_clock;
    3852:	200007b7          	lui	a5,0x20000
    3856:	0c07a783          	lw	a5,192(a5) # 200000c0 <g_system_clock>
}
    385a:	853e                	mv	a0,a5
    385c:	4432                	lw	s0,12(sp)
    385e:	0141                	addi	sp,sp,16
    3860:	8082                	ret

00003862 <drv_get_timer_freq>:
{
    return g_system_clock;
}

int32_t drv_get_timer_freq(int32_t idx)
{
    3862:	1101                	addi	sp,sp,-32
    3864:	ce22                	sw	s0,28(sp)
    3866:	1000                	addi	s0,sp,32
    3868:	fea42623          	sw	a0,-20(s0)
    return g_system_clock;
    386c:	200007b7          	lui	a5,0x20000
    3870:	0c07a783          	lw	a5,192(a5) # 200000c0 <g_system_clock>
}
    3874:	853e                	mv	a0,a5
    3876:	4472                	lw	s0,28(sp)
    3878:	6105                	addi	sp,sp,32
    387a:	8082                	ret

0000387c <csi_coret_config>:
{
    387c:	1101                	addi	sp,sp,-32
    387e:	ce22                	sw	s0,28(sp)
    3880:	1000                	addi	s0,sp,32
    3882:	fea42623          	sw	a0,-20(s0)
    3886:	feb42423          	sw	a1,-24(s0)
    if ((CORET->MTIMECMP != 0) && (CORET->MTIMECMP != 0xffffffffffffffff)) {
    388a:	e00047b7          	lui	a5,0xe0004
    388e:	4390                	lw	a2,0(a5)
    3890:	43d4                	lw	a3,4(a5)
    3892:	87b2                	mv	a5,a2
    3894:	8fd5                	or	a5,a5,a3
    3896:	c7b1                	beqz	a5,38e2 <csi_coret_config+0x66>
    3898:	e00047b7          	lui	a5,0xe0004
    389c:	4398                	lw	a4,0(a5)
    389e:	43dc                	lw	a5,4(a5)
    38a0:	863a                	mv	a2,a4
    38a2:	56fd                	li	a3,-1
    38a4:	00d61663          	bne	a2,a3,38b0 <csi_coret_config+0x34>
    38a8:	873e                	mv	a4,a5
    38aa:	57fd                	li	a5,-1
    38ac:	02f70b63          	beq	a4,a5,38e2 <csi_coret_config+0x66>
        CORET->MTIMECMP = CORET->MTIMECMP + ticks;
    38b0:	e00047b7          	lui	a5,0xe0004
    38b4:	4398                	lw	a4,0(a5)
    38b6:	43dc                	lw	a5,4(a5)
    38b8:	fec42683          	lw	a3,-20(s0)
    38bc:	8336                	mv	t1,a3
    38be:	4381                	li	t2,0
    38c0:	e00045b7          	lui	a1,0xe0004
    38c4:	00670633          	add	a2,a4,t1
    38c8:	8532                	mv	a0,a2
    38ca:	00e53533          	sltu	a0,a0,a4
    38ce:	007786b3          	add	a3,a5,t2
    38d2:	00d507b3          	add	a5,a0,a3
    38d6:	86be                	mv	a3,a5
    38d8:	8732                	mv	a4,a2
    38da:	87b6                	mv	a5,a3
    38dc:	c198                	sw	a4,0(a1)
    38de:	c1dc                	sw	a5,4(a1)
    38e0:	a82d                	j	391a <csi_coret_config+0x9e>
        CORET->MTIMECMP = CORET->MTIME + ticks;
    38e2:	e0004737          	lui	a4,0xe0004
    38e6:	67a1                	lui	a5,0x8
    38e8:	97ba                	add	a5,a5,a4
    38ea:	ff87a703          	lw	a4,-8(a5) # 7ff8 <uart_process_frame+0x1bc>
    38ee:	ffc7a783          	lw	a5,-4(a5)
    38f2:	fec42683          	lw	a3,-20(s0)
    38f6:	8836                	mv	a6,a3
    38f8:	4881                	li	a7,0
    38fa:	e00045b7          	lui	a1,0xe0004
    38fe:	01070633          	add	a2,a4,a6
    3902:	8532                	mv	a0,a2
    3904:	00e53533          	sltu	a0,a0,a4
    3908:	011786b3          	add	a3,a5,a7
    390c:	00d507b3          	add	a5,a0,a3
    3910:	86be                	mv	a3,a5
    3912:	8732                	mv	a4,a2
    3914:	87b6                	mv	a5,a3
    3916:	c198                	sw	a4,0(a1)
    3918:	c1dc                	sw	a5,4(a1)
    return (0UL);
    391a:	4781                	li	a5,0
}
    391c:	853e                	mv	a0,a5
    391e:	4472                	lw	s0,28(sp)
    3920:	6105                	addi	sp,sp,32
    3922:	8082                	ret

00003924 <__set_SYSMAPCFGx>:
  \details Writes the given value to the SYSMAPxCFG Register.
  \param [in]    idx      SYSMAPx region index
  \param [in]    sysmapxcfg  SYSMAPxCFG Register value to set
 */
__STATIC_INLINE void __set_SYSMAPCFGx(uint32_t idx, uint32_t sysmapxcfg)
{
    3924:	1101                	addi	sp,sp,-32
    3926:	ce22                	sw	s0,28(sp)
    3928:	1000                	addi	s0,sp,32
    392a:	fea42623          	sw	a0,-20(s0)
    392e:	feb42423          	sw	a1,-24(s0)
    3932:	fec42703          	lw	a4,-20(s0)
    3936:	479d                	li	a5,7
    3938:	06e7ed63          	bltu	a5,a4,39b2 <__set_SYSMAPCFGx+0x8e>
    393c:	fec42783          	lw	a5,-20(s0)
    3940:	00279713          	slli	a4,a5,0x2
    3944:	000087b7          	lui	a5,0x8
    3948:	5d078793          	addi	a5,a5,1488 # 85d0 <sg_timer_config+0x90>
    394c:	97ba                	add	a5,a5,a4
    394e:	439c                	lw	a5,0(a5)
    3950:	8782                	jr	a5
    switch (idx) {
    case 0: SYSMAP->SYSMAPCFG0 = sysmapxcfg; break;
    3952:	effff7b7          	lui	a5,0xeffff
    3956:	fe842703          	lw	a4,-24(s0)
    395a:	c3d8                	sw	a4,4(a5)
    395c:	a8a1                	j	39b4 <__set_SYSMAPCFGx+0x90>
    case 1: SYSMAP->SYSMAPCFG1 = sysmapxcfg; break;
    395e:	effff7b7          	lui	a5,0xeffff
    3962:	fe842703          	lw	a4,-24(s0)
    3966:	c7d8                	sw	a4,12(a5)
    3968:	a0b1                	j	39b4 <__set_SYSMAPCFGx+0x90>
    case 2: SYSMAP->SYSMAPCFG2 = sysmapxcfg; break;
    396a:	effff7b7          	lui	a5,0xeffff
    396e:	fe842703          	lw	a4,-24(s0)
    3972:	cbd8                	sw	a4,20(a5)
    3974:	a081                	j	39b4 <__set_SYSMAPCFGx+0x90>
    case 3: SYSMAP->SYSMAPCFG3 = sysmapxcfg; break;
    3976:	effff7b7          	lui	a5,0xeffff
    397a:	fe842703          	lw	a4,-24(s0)
    397e:	cfd8                	sw	a4,28(a5)
    3980:	a815                	j	39b4 <__set_SYSMAPCFGx+0x90>
    case 4: SYSMAP->SYSMAPCFG4 = sysmapxcfg; break;
    3982:	effff7b7          	lui	a5,0xeffff
    3986:	fe842703          	lw	a4,-24(s0)
    398a:	d3d8                	sw	a4,36(a5)
    398c:	a025                	j	39b4 <__set_SYSMAPCFGx+0x90>
    case 5: SYSMAP->SYSMAPCFG5 = sysmapxcfg; break;
    398e:	effff7b7          	lui	a5,0xeffff
    3992:	fe842703          	lw	a4,-24(s0)
    3996:	d7d8                	sw	a4,44(a5)
    3998:	a831                	j	39b4 <__set_SYSMAPCFGx+0x90>
    case 6: SYSMAP->SYSMAPCFG6 = sysmapxcfg; break;
    399a:	effff7b7          	lui	a5,0xeffff
    399e:	fe842703          	lw	a4,-24(s0)
    39a2:	dbd8                	sw	a4,52(a5)
    39a4:	a801                	j	39b4 <__set_SYSMAPCFGx+0x90>
    case 7: SYSMAP->SYSMAPCFG7 = sysmapxcfg; break;
    39a6:	effff7b7          	lui	a5,0xeffff
    39aa:	fe842703          	lw	a4,-24(s0)
    39ae:	dfd8                	sw	a4,60(a5)
    39b0:	a011                	j	39b4 <__set_SYSMAPCFGx+0x90>
    default: return;
    39b2:	0001                	nop
    }
}
    39b4:	4472                	lw	s0,28(sp)
    39b6:	6105                	addi	sp,sp,32
    39b8:	8082                	ret

000039ba <__set_SYSMAPADDRx>:
  \details Writes the given value to the SYSMAPADDRx Register.
  \param [in]    idx      SYSMAP region index
  \param [in]    sysmapaddr  SYSMAPADDRx Register value to set
 */
__STATIC_INLINE void __set_SYSMAPADDRx(uint32_t idx, uint32_t sysmapxaddr)
{
    39ba:	1101                	addi	sp,sp,-32
    39bc:	ce22                	sw	s0,28(sp)
    39be:	1000                	addi	s0,sp,32
    39c0:	fea42623          	sw	a0,-20(s0)
    39c4:	feb42423          	sw	a1,-24(s0)
    39c8:	fec42703          	lw	a4,-20(s0)
    39cc:	479d                	li	a5,7
    39ce:	06e7ed63          	bltu	a5,a4,3a48 <__set_SYSMAPADDRx+0x8e>
    39d2:	fec42783          	lw	a5,-20(s0)
    39d6:	00279713          	slli	a4,a5,0x2
    39da:	000087b7          	lui	a5,0x8
    39de:	5f078793          	addi	a5,a5,1520 # 85f0 <sg_timer_config+0xb0>
    39e2:	97ba                	add	a5,a5,a4
    39e4:	439c                	lw	a5,0(a5)
    39e6:	8782                	jr	a5
    switch (idx) {
    case 0: SYSMAP->SYSMAPADDR0 = sysmapxaddr; break;
    39e8:	effff7b7          	lui	a5,0xeffff
    39ec:	fe842703          	lw	a4,-24(s0)
    39f0:	c398                	sw	a4,0(a5)
    39f2:	a8a1                	j	3a4a <__set_SYSMAPADDRx+0x90>
    case 1: SYSMAP->SYSMAPADDR1 = sysmapxaddr; break;
    39f4:	effff7b7          	lui	a5,0xeffff
    39f8:	fe842703          	lw	a4,-24(s0)
    39fc:	c798                	sw	a4,8(a5)
    39fe:	a0b1                	j	3a4a <__set_SYSMAPADDRx+0x90>
    case 2: SYSMAP->SYSMAPADDR2 = sysmapxaddr; break;
    3a00:	effff7b7          	lui	a5,0xeffff
    3a04:	fe842703          	lw	a4,-24(s0)
    3a08:	cb98                	sw	a4,16(a5)
    3a0a:	a081                	j	3a4a <__set_SYSMAPADDRx+0x90>
    case 3: SYSMAP->SYSMAPADDR3 = sysmapxaddr; break;
    3a0c:	effff7b7          	lui	a5,0xeffff
    3a10:	fe842703          	lw	a4,-24(s0)
    3a14:	cf98                	sw	a4,24(a5)
    3a16:	a815                	j	3a4a <__set_SYSMAPADDRx+0x90>
    case 4: SYSMAP->SYSMAPADDR4 = sysmapxaddr; break;
    3a18:	effff7b7          	lui	a5,0xeffff
    3a1c:	fe842703          	lw	a4,-24(s0)
    3a20:	d398                	sw	a4,32(a5)
    3a22:	a025                	j	3a4a <__set_SYSMAPADDRx+0x90>
    case 5: SYSMAP->SYSMAPADDR5 = sysmapxaddr; break;
    3a24:	effff7b7          	lui	a5,0xeffff
    3a28:	fe842703          	lw	a4,-24(s0)
    3a2c:	d798                	sw	a4,40(a5)
    3a2e:	a831                	j	3a4a <__set_SYSMAPADDRx+0x90>
    case 6: SYSMAP->SYSMAPADDR6 = sysmapxaddr; break;
    3a30:	effff7b7          	lui	a5,0xeffff
    3a34:	fe842703          	lw	a4,-24(s0)
    3a38:	db98                	sw	a4,48(a5)
    3a3a:	a801                	j	3a4a <__set_SYSMAPADDRx+0x90>
    case 7: SYSMAP->SYSMAPADDR7 = sysmapxaddr; break;
    3a3c:	effff7b7          	lui	a5,0xeffff
    3a40:	fe842703          	lw	a4,-24(s0)
    3a44:	df98                	sw	a4,56(a5)
    3a46:	a011                	j	3a4a <__set_SYSMAPADDRx+0x90>
    default: return;
    3a48:	0001                	nop
    }
}
    3a4a:	4472                	lw	s0,28(sp)
    3a4c:	6105                	addi	sp,sp,32
    3a4e:	8082                	ret

00003a50 <csi_sysmap_config_region>:
  \param [in]  idx        system map region (0, 1, 2, ..., 7).
  \param [in]  base_addr  base address must be aligned with page size.
  \param [in]  enable     enable or disable memory protected region.
  */
__STATIC_INLINE void csi_sysmap_config_region(uint32_t idx, uint32_t base_addr, uint32_t attr)
{
    3a50:	7179                	addi	sp,sp,-48
    3a52:	d606                	sw	ra,44(sp)
    3a54:	d422                	sw	s0,40(sp)
    3a56:	1800                	addi	s0,sp,48
    3a58:	fca42e23          	sw	a0,-36(s0)
    3a5c:	fcb42c23          	sw	a1,-40(s0)
    3a60:	fcc42a23          	sw	a2,-44(s0)
    uint32_t addr = 0;
    3a64:	fe042623          	sw	zero,-20(s0)

    if (idx > 7) {
    3a68:	fdc42703          	lw	a4,-36(s0)
    3a6c:	479d                	li	a5,7
    3a6e:	02e7ed63          	bltu	a5,a4,3aa8 <csi_sysmap_config_region+0x58>
        return;
    }

    addr = base_addr >> 12;
    3a72:	fd842783          	lw	a5,-40(s0)
    3a76:	83b1                	srli	a5,a5,0xc
    3a78:	fef42623          	sw	a5,-20(s0)
    attr = attr << 2;
    3a7c:	fd442783          	lw	a5,-44(s0)
    3a80:	078a                	slli	a5,a5,0x2
    3a82:	fcf42a23          	sw	a5,-44(s0)

    __set_SYSMAPADDRx(idx, addr);
    3a86:	fec42583          	lw	a1,-20(s0)
    3a8a:	fdc42503          	lw	a0,-36(s0)
    3a8e:	00000097          	auipc	ra,0x0
    3a92:	f2c080e7          	jalr	-212(ra) # 39ba <__set_SYSMAPADDRx>
    __set_SYSMAPCFGx(idx, attr);
    3a96:	fd442583          	lw	a1,-44(s0)
    3a9a:	fdc42503          	lw	a0,-36(s0)
    3a9e:	00000097          	auipc	ra,0x0
    3aa2:	e86080e7          	jalr	-378(ra) # 3924 <__set_SYSMAPCFGx>
    3aa6:	a011                	j	3aaa <csi_sysmap_config_region+0x5a>
        return;
    3aa8:	0001                	nop
}
    3aaa:	50b2                	lw	ra,44(sp)
    3aac:	5422                	lw	s0,40(sp)
    3aae:	6145                	addi	sp,sp,48
    3ab0:	8082                	ret

00003ab2 <csi_icache_enable>:
/**
  \brief   Enable I-Cache
  \details Turns on I-Cache
  */
__STATIC_INLINE void csi_icache_enable (void)
{
    3ab2:	1101                	addi	sp,sp,-32
    3ab4:	ce22                	sw	s0,28(sp)
    3ab6:	1000                	addi	s0,sp,32
  \details Acts as a special kind of Data Memory Barrier.
           It completes when all explicit memory accesses before this instruction complete.
 */
__ALWAYS_STATIC_INLINE void __DSB(void)
{
    __ASM volatile("fence");
    3ab8:	0ff0000f          	fence
}
    3abc:	0001                	nop
    __ASM volatile("fence");
    3abe:	0ff0000f          	fence
}
    3ac2:	0001                	nop
  \brief   Invalid all icache
  \details invalid all icache.
 */
__ALWAYS_STATIC_INLINE void __ICACHE_IALL(void)
{
    __ASM volatile("icache.iall");
    3ac4:	0100000b          	icache.iall
}
    3ac8:	0001                	nop
    __ASM volatile("csrr %0, mhcr" : "=r"(result));
    3aca:	7c1027f3          	csrr	a5,mhcr
    3ace:	fef42223          	sw	a5,-28(s0)
    return (result);
    3ad2:	fe442783          	lw	a5,-28(s0)
#if (__ICACHE_PRESENT == 1U)
    uint32_t cache;
    __DSB();
    __ISB();
    __ICACHE_IALL();
    cache = __get_MHCR();
    3ad6:	fef42623          	sw	a5,-20(s0)
    cache |= CACHE_MHCR_IE_Msk;
    3ada:	fec42783          	lw	a5,-20(s0)
    3ade:	0017e793          	ori	a5,a5,1
    3ae2:	fef42623          	sw	a5,-20(s0)
    3ae6:	fec42783          	lw	a5,-20(s0)
    3aea:	fef42423          	sw	a5,-24(s0)
    __ASM volatile("csrw mhcr, %0" : : "r"(mhcr));
    3aee:	fe842783          	lw	a5,-24(s0)
    3af2:	7c179073          	csrw	mhcr,a5
}
    3af6:	0001                	nop
    __ASM volatile("fence");
    3af8:	0ff0000f          	fence
}
    3afc:	0001                	nop
    __ASM volatile("fence");
    3afe:	0ff0000f          	fence
}
    3b02:	0001                	nop
    __set_MHCR(cache);
    __DSB();
    __ISB();
#endif
}
    3b04:	0001                	nop
    3b06:	4472                	lw	s0,28(sp)
    3b08:	6105                	addi	sp,sp,32
    3b0a:	8082                	ret

00003b0c <csi_dcache_enable>:
  \brief   Enable D-Cache
  \details Turns on D-Cache
  \note    I-Cache also turns on.
  */
__STATIC_INLINE void csi_dcache_enable (void)
{
    3b0c:	1101                	addi	sp,sp,-32
    3b0e:	ce22                	sw	s0,28(sp)
    3b10:	1000                	addi	s0,sp,32
    __ASM volatile("fence");
    3b12:	0ff0000f          	fence
}
    3b16:	0001                	nop
    __ASM volatile("fence");
    3b18:	0ff0000f          	fence
}
    3b1c:	0001                	nop
  \brief   Invalid all dcache
  \details invalid all dcache.
 */
__ALWAYS_STATIC_INLINE void __DCACHE_IALL(void)
{
    __ASM volatile("dcache.iall");
    3b1e:	0020000b          	dcache.iall
}
    3b22:	0001                	nop
    __ASM volatile("csrr %0, mhcr" : "=r"(result));
    3b24:	7c1027f3          	csrr	a5,mhcr
    3b28:	fef42223          	sw	a5,-28(s0)
    return (result);
    3b2c:	fe442783          	lw	a5,-28(s0)
#if (__DCACHE_PRESENT == 1U)
    uint32_t cache;
    __DSB();
    __ISB();
    __DCACHE_IALL();                        /* invalidate all dcache */
    cache = __get_MHCR();
    3b30:	fef42623          	sw	a5,-20(s0)
    cache |= (CACHE_MHCR_DE_Msk | CACHE_MHCR_WB_Msk | CACHE_MHCR_WA_Msk | CACHE_MHCR_RS_Msk | CACHE_MHCR_BPE_Msk | CACHE_MHCR_L0BTB_Msk);      /* enable all Cache */
    3b34:	fec42703          	lw	a4,-20(s0)
    3b38:	6785                	lui	a5,0x1
    3b3a:	03e78793          	addi	a5,a5,62 # 103e <__divdf3+0x1ae>
    3b3e:	8fd9                	or	a5,a5,a4
    3b40:	fef42623          	sw	a5,-20(s0)
    3b44:	fec42783          	lw	a5,-20(s0)
    3b48:	fef42423          	sw	a5,-24(s0)
    __ASM volatile("csrw mhcr, %0" : : "r"(mhcr));
    3b4c:	fe842783          	lw	a5,-24(s0)
    3b50:	7c179073          	csrw	mhcr,a5
}
    3b54:	0001                	nop
    __ASM volatile("fence");
    3b56:	0ff0000f          	fence
}
    3b5a:	0001                	nop
    __ASM volatile("fence");
    3b5c:	0ff0000f          	fence
}
    3b60:	0001                	nop
    __set_MHCR(cache);

    __DSB();
    __ISB();
#endif
}
    3b62:	0001                	nop
    3b64:	4472                	lw	s0,28(sp)
    3b66:	6105                	addi	sp,sp,32
    3b68:	8082                	ret

00003b6a <_system_init_for_baremetal>:
    return 0;
}

#ifdef CONFIG_KERNEL_NONE
static void _system_init_for_baremetal(void)
{
    3b6a:	1101                	addi	sp,sp,-32
    3b6c:	ce06                	sw	ra,28(sp)
    3b6e:	cc22                	sw	s0,24(sp)
    3b70:	1000                	addi	s0,sp,32
    __ASM volatile("csrr %0, mexstatus" : "=r"(result));
    3b72:	7e1027f3          	csrr	a5,mexstatus
    3b76:	fef42223          	sw	a5,-28(s0)
    return (result);
    3b7a:	fe442783          	lw	a5,-28(s0)
    /* enable mexstatus SPUSHEN */
#if ((CONFIG_CPU_E902 != 1) && (CONFIG_CPU_E902M != 1))
    uint32_t mexstatus = __get_MEXSTATUS();
    3b7e:	fef42623          	sw	a5,-20(s0)
    mexstatus |= (1 << 16);
    3b82:	fec42703          	lw	a4,-20(s0)
    3b86:	67c1                	lui	a5,0x10
    3b88:	8fd9                	or	a5,a5,a4
    3b8a:	fef42623          	sw	a5,-20(s0)
    3b8e:	fec42783          	lw	a5,-20(s0)
    3b92:	fef42423          	sw	a5,-24(s0)
    __ASM volatile("csrw mexstatus, %0" : : "r"(mexstatus));
    3b96:	fe842783          	lw	a5,-24(s0)
    3b9a:	7e179073          	csrw	mexstatus,a5
}
    3b9e:	0001                	nop
    __ASM volatile("csrs mstatus, 8");
    3ba0:	30046073          	csrsi	mstatus,8
}
    3ba4:	0001                	nop
}
    3ba6:	0001                	nop
    __set_MEXSTATUS(mexstatus);
#endif
    __enable_excp_irq();

    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    3ba8:	00000097          	auipc	ra,0x0
    3bac:	ca4080e7          	jalr	-860(ra) # 384c <drv_get_sys_freq>
    3bb0:	872a                	mv	a4,a0
    3bb2:	06400793          	li	a5,100
    3bb6:	02f747b3          	div	a5,a4,a5
    3bba:	459d                	li	a1,7
    3bbc:	853e                	mv	a0,a5
    3bbe:	00000097          	auipc	ra,0x0
    3bc2:	cbe080e7          	jalr	-834(ra) # 387c <csi_coret_config>

    mm_heap_initialize();
    3bc6:	00002097          	auipc	ra,0x2
    3bca:	782080e7          	jalr	1922(ra) # 6348 <mm_heap_initialize>
}
    3bce:	0001                	nop
    3bd0:	40f2                	lw	ra,28(sp)
    3bd2:	4462                	lw	s0,24(sp)
    3bd4:	6105                	addi	sp,sp,32
    3bd6:	8082                	ret

00003bd8 <systemmap_config>:
  * @brief  initialize system map
  * @param  None
  * @return None
  */
void systemmap_config(void)
{
    3bd8:	1141                	addi	sp,sp,-16
    3bda:	c606                	sw	ra,12(sp)
    3bdc:	c422                	sw	s0,8(sp)
    3bde:	0800                	addi	s0,sp,16
   csi_sysmap_config_region(0, 0x20000000, SYSMAP_SYSMAPCFG_B_Msk | SYSMAP_SYSMAPCFG_C_Msk);
    3be0:	460d                	li	a2,3
    3be2:	200005b7          	lui	a1,0x20000
    3be6:	4501                	li	a0,0
    3be8:	00000097          	auipc	ra,0x0
    3bec:	e68080e7          	jalr	-408(ra) # 3a50 <csi_sysmap_config_region>
   csi_sysmap_config_region(1, 0x40000000, SYSMAP_SYSMAPCFG_B_Msk | SYSMAP_SYSMAPCFG_C_Msk);
    3bf0:	460d                	li	a2,3
    3bf2:	400005b7          	lui	a1,0x40000
    3bf6:	4505                	li	a0,1
    3bf8:	00000097          	auipc	ra,0x0
    3bfc:	e58080e7          	jalr	-424(ra) # 3a50 <csi_sysmap_config_region>
   csi_sysmap_config_region(2, 0x50000000, SYSMAP_SYSMAPCFG_SO_Msk);
    3c00:	4611                	li	a2,4
    3c02:	500005b7          	lui	a1,0x50000
    3c06:	4509                	li	a0,2
    3c08:	00000097          	auipc	ra,0x0
    3c0c:	e48080e7          	jalr	-440(ra) # 3a50 <csi_sysmap_config_region>
   csi_sysmap_config_region(3, 0x50700000, SYSMAP_SYSMAPCFG_B_Msk | SYSMAP_SYSMAPCFG_C_Msk);
    3c10:	460d                	li	a2,3
    3c12:	507005b7          	lui	a1,0x50700
    3c16:	450d                	li	a0,3
    3c18:	00000097          	auipc	ra,0x0
    3c1c:	e38080e7          	jalr	-456(ra) # 3a50 <csi_sysmap_config_region>
   csi_sysmap_config_region(4, 0x60000000, SYSMAP_SYSMAPCFG_SO_Msk);
    3c20:	4611                	li	a2,4
    3c22:	600005b7          	lui	a1,0x60000
    3c26:	4511                	li	a0,4
    3c28:	00000097          	auipc	ra,0x0
    3c2c:	e28080e7          	jalr	-472(ra) # 3a50 <csi_sysmap_config_region>
   csi_sysmap_config_region(5, 0x80000000, SYSMAP_SYSMAPCFG_B_Msk | SYSMAP_SYSMAPCFG_C_Msk);
    3c30:	460d                	li	a2,3
    3c32:	800005b7          	lui	a1,0x80000
    3c36:	4515                	li	a0,5
    3c38:	00000097          	auipc	ra,0x0
    3c3c:	e18080e7          	jalr	-488(ra) # 3a50 <csi_sysmap_config_region>
   csi_sysmap_config_region(6, 0x90000000, SYSMAP_SYSMAPCFG_B_Msk | SYSMAP_SYSMAPCFG_C_Msk);
    3c40:	460d                	li	a2,3
    3c42:	900005b7          	lui	a1,0x90000
    3c46:	4519                	li	a0,6
    3c48:	00000097          	auipc	ra,0x0
    3c4c:	e08080e7          	jalr	-504(ra) # 3a50 <csi_sysmap_config_region>
   csi_sysmap_config_region(7, 0xf0000000, SYSMAP_SYSMAPCFG_SO_Msk);
    3c50:	4611                	li	a2,4
    3c52:	f00005b7          	lui	a1,0xf0000
    3c56:	451d                	li	a0,7
    3c58:	00000097          	auipc	ra,0x0
    3c5c:	df8080e7          	jalr	-520(ra) # 3a50 <csi_sysmap_config_region>
}
    3c60:	0001                	nop
    3c62:	40b2                	lw	ra,12(sp)
    3c64:	4422                	lw	s0,8(sp)
    3c66:	0141                	addi	sp,sp,16
    3c68:	8082                	ret

00003c6a <SystemInit>:
  *         Initialize the psr and vbr.
  * @param  None
  * @return None
  */
void SystemInit(void)
{
    3c6a:	1101                	addi	sp,sp,-32
    3c6c:	ce06                	sw	ra,28(sp)
    3c6e:	cc22                	sw	s0,24(sp)
    3c70:	1000                	addi	s0,sp,32
    int i;
#if ((CONFIG_CPU_E902 != 1) && (CONFIG_CPU_E902M != 1))
    systemmap_config();
    3c72:	00000097          	auipc	ra,0x0
    3c76:	f66080e7          	jalr	-154(ra) # 3bd8 <systemmap_config>
    mstatus |= (1 << 13);
    __set_MSTATUS(mstatus);
#endif

    /* get interrupt level from info */
    CLIC->CLICCFG = (((CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos) << CLIC_CLICCFG_NLBIT_Pos);
    3c7a:	e08007b7          	lui	a5,0xe0800
    3c7e:	43dc                	lw	a5,4(a5)
    3c80:	83d5                	srli	a5,a5,0x15
    3c82:	0ff7f793          	andi	a5,a5,255
    3c86:	0786                	slli	a5,a5,0x1
    3c88:	0ff7f713          	andi	a4,a5,255
    3c8c:	e08007b7          	lui	a5,0xe0800
    3c90:	8b79                	andi	a4,a4,30
    3c92:	0ff77713          	andi	a4,a4,255
    3c96:	00e78023          	sb	a4,0(a5) # e0800000 <__heap_end+0xc07e0000>

    for (i = 0; i < 64; i++) {
    3c9a:	fe042623          	sw	zero,-20(s0)
    3c9e:	a80d                	j	3cd0 <SystemInit+0x66>
        CLIC->CLICINT[i].IP = 0;
    3ca0:	e08007b7          	lui	a5,0xe0800
    3ca4:	fec42703          	lw	a4,-20(s0)
    3ca8:	40070713          	addi	a4,a4,1024 # e0004400 <__heap_end+0xbffe4400>
    3cac:	04e7d00b          	srb	zero,a5,a4,2
        CLIC->CLICINT[i].ATTR = 1; /* use vector interrupt */
    3cb0:	e0800737          	lui	a4,0xe0800
    3cb4:	fec42783          	lw	a5,-20(s0)
    3cb8:	40078793          	addi	a5,a5,1024 # e0800400 <__heap_end+0xc07e0400>
    3cbc:	078a                	slli	a5,a5,0x2
    3cbe:	97ba                	add	a5,a5,a4
    3cc0:	4705                	li	a4,1
    3cc2:	00e78123          	sb	a4,2(a5)
    for (i = 0; i < 64; i++) {
    3cc6:	fec42783          	lw	a5,-20(s0)
    3cca:	0785                	addi	a5,a5,1
    3ccc:	fef42623          	sw	a5,-20(s0)
    3cd0:	fec42703          	lw	a4,-20(s0)
    3cd4:	03f00793          	li	a5,63
    3cd8:	fce7d4e3          	bge	a5,a4,3ca0 <SystemInit+0x36>
    }

    /* tspend use positive interrupt */
    CLIC->CLICINT[Machine_Software_IRQn].ATTR = 0x3;
    3cdc:	e0800737          	lui	a4,0xe0800
    3ce0:	6785                	lui	a5,0x1
    3ce2:	97ba                	add	a5,a5,a4
    3ce4:	470d                	li	a4,3
    3ce6:	00e78723          	sb	a4,14(a5) # 100e <__divdf3+0x17e>

#if ((CONFIG_CPU_E902 != 1) && (CONFIG_CPU_E902M != 1))
    csi_dcache_enable();
    3cea:	00000097          	auipc	ra,0x0
    3cee:	e22080e7          	jalr	-478(ra) # 3b0c <csi_dcache_enable>
#endif
    csi_icache_enable();
    3cf2:	00000097          	auipc	ra,0x0
    3cf6:	dc0080e7          	jalr	-576(ra) # 3ab2 <csi_icache_enable>
    drv_irq_enable(Machine_Software_IRQn);
    3cfa:	450d                	li	a0,3
    3cfc:	ffffe097          	auipc	ra,0xffffe
    3d00:	63c080e7          	jalr	1596(ra) # 2338 <drv_irq_enable>

#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
    3d04:	00000097          	auipc	ra,0x0
    3d08:	e66080e7          	jalr	-410(ra) # 3b6a <_system_init_for_baremetal>
#else
    _system_init_for_kernel();
#endif
}
    3d0c:	0001                	nop
    3d0e:	40f2                	lw	ra,28(sp)
    3d10:	4462                	lw	s0,24(sp)
    3d12:	6105                	addi	sp,sp,32
    3d14:	8082                	ret

00003d16 <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3d16:	7179                	addi	sp,sp,-48
    3d18:	d606                	sw	ra,44(sp)
    3d1a:	d422                	sw	s0,40(sp)
    3d1c:	1800                	addi	s0,sp,48
    3d1e:	fca42e23          	sw	a0,-36(s0)
    int i;
    uint32_t vec = 0;
    3d22:	fe042423          	sw	zero,-24(s0)
    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3d26:	342027f3          	csrr	a5,mcause
    3d2a:	fef42223          	sw	a5,-28(s0)
    return (result);
    3d2e:	fe442783          	lw	a5,-28(s0)

    vec = __get_MCAUSE() & 0x3FF;
    3d32:	3ff7f793          	andi	a5,a5,1023
    3d36:	fef42423          	sw	a5,-24(s0)

    printf("CPU Exception: NO.%d", vec);
    3d3a:	fe842583          	lw	a1,-24(s0)
    3d3e:	000087b7          	lui	a5,0x8
    3d42:	2b078513          	addi	a0,a5,688 # 82b0 <__srodata>
    3d46:	00002097          	auipc	ra,0x2
    3d4a:	360080e7          	jalr	864(ra) # 60a6 <printf>
    printf("\n");
    3d4e:	4529                	li	a0,10
    3d50:	00000097          	auipc	ra,0x0
    3d54:	32c080e7          	jalr	812(ra) # 407c <putchar>

    for (i = 0; i < 31; i++) {
    3d58:	fe042623          	sw	zero,-20(s0)
    3d5c:	a8a9                	j	3db6 <trap_c+0xa0>
        printf("x%d: %08x\t", i + 1, regs[i]);
    3d5e:	fec42783          	lw	a5,-20(s0)
    3d62:	00178693          	addi	a3,a5,1
    3d66:	fec42783          	lw	a5,-20(s0)
    3d6a:	078a                	slli	a5,a5,0x2
    3d6c:	fdc42703          	lw	a4,-36(s0)
    3d70:	97ba                	add	a5,a5,a4
    3d72:	439c                	lw	a5,0(a5)
    3d74:	863e                	mv	a2,a5
    3d76:	85b6                	mv	a1,a3
    3d78:	000087b7          	lui	a5,0x8
    3d7c:	2c878513          	addi	a0,a5,712 # 82c8 <__srodata+0x18>
    3d80:	00002097          	auipc	ra,0x2
    3d84:	326080e7          	jalr	806(ra) # 60a6 <printf>

        if ((i % 4) == 3) {
    3d88:	fec42703          	lw	a4,-20(s0)
    3d8c:	41f75793          	srai	a5,a4,0x1f
    3d90:	83f9                	srli	a5,a5,0x1e
    3d92:	973e                	add	a4,a4,a5
    3d94:	8b0d                	andi	a4,a4,3
    3d96:	40f707b3          	sub	a5,a4,a5
    3d9a:	873e                	mv	a4,a5
    3d9c:	478d                	li	a5,3
    3d9e:	00f71763          	bne	a4,a5,3dac <trap_c+0x96>
            printf("\n");
    3da2:	4529                	li	a0,10
    3da4:	00000097          	auipc	ra,0x0
    3da8:	2d8080e7          	jalr	728(ra) # 407c <putchar>
    for (i = 0; i < 31; i++) {
    3dac:	fec42783          	lw	a5,-20(s0)
    3db0:	0785                	addi	a5,a5,1
    3db2:	fef42623          	sw	a5,-20(s0)
    3db6:	fec42703          	lw	a4,-20(s0)
    3dba:	47f9                	li	a5,30
    3dbc:	fae7d1e3          	bge	a5,a4,3d5e <trap_c+0x48>
        }
    }

    printf("\n");
    3dc0:	4529                	li	a0,10
    3dc2:	00000097          	auipc	ra,0x0
    3dc6:	2ba080e7          	jalr	698(ra) # 407c <putchar>
    printf("mepc   : %08x\n", regs[31]);
    3dca:	fdc42783          	lw	a5,-36(s0)
    3dce:	07c78793          	addi	a5,a5,124
    3dd2:	439c                	lw	a5,0(a5)
    3dd4:	85be                	mv	a1,a5
    3dd6:	000087b7          	lui	a5,0x8
    3dda:	2d478513          	addi	a0,a5,724 # 82d4 <__srodata+0x24>
    3dde:	00002097          	auipc	ra,0x2
    3de2:	2c8080e7          	jalr	712(ra) # 60a6 <printf>
    printf("mstatus: %08x\n", regs[32]);
    3de6:	fdc42783          	lw	a5,-36(s0)
    3dea:	08078793          	addi	a5,a5,128
    3dee:	439c                	lw	a5,0(a5)
    3df0:	85be                	mv	a1,a5
    3df2:	000087b7          	lui	a5,0x8
    3df6:	2e478513          	addi	a0,a5,740 # 82e4 <__srodata+0x34>
    3dfa:	00002097          	auipc	ra,0x2
    3dfe:	2ac080e7          	jalr	684(ra) # 60a6 <printf>

    if (trap_c_callback) {
    3e02:	2000a7b7          	lui	a5,0x2000a
    3e06:	5e87a783          	lw	a5,1512(a5) # 2000a5e8 <trap_c_callback>
    3e0a:	c791                	beqz	a5,3e16 <trap_c+0x100>
        trap_c_callback();
    3e0c:	2000a7b7          	lui	a5,0x2000a
    3e10:	5e87a783          	lw	a5,1512(a5) # 2000a5e8 <trap_c_callback>
    3e14:	9782                	jalr	a5
    }

    while (1);
    3e16:	a001                	j	3e16 <trap_c+0x100>

00003e18 <timer_cb_fun>:
static timer_handle_t timer_handle;
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    3e18:	1101                	addi	sp,sp,-32
    3e1a:	ce22                	sw	s0,28(sp)
    3e1c:	1000                	addi	s0,sp,32
    3e1e:	fea42623          	sw	a0,-20(s0)
    3e22:	feb42423          	sw	a1,-24(s0)
    if (TIMER_EVENT_TIMEOUT == event) {
    3e26:	fe842783          	lw	a5,-24(s0)
    3e2a:	eb99                	bnez	a5,3e40 <timer_cb_fun+0x28>
        Timer_LoopCount++;
    3e2c:	2000a7b7          	lui	a5,0x2000a
    3e30:	5f87a783          	lw	a5,1528(a5) # 2000a5f8 <Timer_LoopCount>
    3e34:	00178713          	addi	a4,a5,1
    3e38:	2000a7b7          	lui	a5,0x2000a
    3e3c:	5ee7ac23          	sw	a4,1528(a5) # 2000a5f8 <Timer_LoopCount>
    }
}
    3e40:	0001                	nop
    3e42:	4472                	lw	s0,28(sp)
    3e44:	6105                	addi	sp,sp,32
    3e46:	8082                	ret

00003e48 <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3e48:	1101                	addi	sp,sp,-32
    3e4a:	ce06                	sw	ra,28(sp)
    3e4c:	cc22                	sw	s0,24(sp)
    3e4e:	1000                	addi	s0,sp,32
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3e50:	000047b7          	lui	a5,0x4
    3e54:	e1878593          	addi	a1,a5,-488 # 3e18 <timer_cb_fun>
    3e58:	4501                	li	a0,0
    3e5a:	fffff097          	auipc	ra,0xfffff
    3e5e:	33c080e7          	jalr	828(ra) # 3196 <csi_timer_initialize>
    3e62:	872a                	mv	a4,a0
    3e64:	2000a7b7          	lui	a5,0x2000a
    3e68:	5ee7aa23          	sw	a4,1524(a5) # 2000a5f4 <timer_handle>

    if (timer_handle == NULL) {
    3e6c:	2000a7b7          	lui	a5,0x2000a
    3e70:	5f47a783          	lw	a5,1524(a5) # 2000a5f4 <timer_handle>
    3e74:	e399                	bnez	a5,3e7a <clock_timer_init+0x32>
        return -1;
    3e76:	57fd                	li	a5,-1
    3e78:	a8d9                	j	3f4e <clock_timer_init+0x106>
    }

    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3e7a:	4501                	li	a0,0
    3e7c:	00000097          	auipc	ra,0x0
    3e80:	9e6080e7          	jalr	-1562(ra) # 3862 <drv_get_timer_freq>
    3e84:	87aa                	mv	a5,a0
    3e86:	873e                	mv	a4,a5
    3e88:	2000a7b7          	lui	a5,0x2000a
    3e8c:	5ee7a623          	sw	a4,1516(a5) # 2000a5ec <APB_FREQ>
    timer_loadtimer = 10 * MILLION; /*10Mus=10s */
    3e90:	009897b7          	lui	a5,0x989
    3e94:	68078793          	addi	a5,a5,1664 # 989680 <__min_heap_size+0x979680>
    3e98:	fef42623          	sw	a5,-20(s0)
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e9c:	2000a7b7          	lui	a5,0x2000a
    3ea0:	5ec7a703          	lw	a4,1516(a5) # 2000a5ec <APB_FREQ>
    3ea4:	000f47b7          	lui	a5,0xf4
    3ea8:	24078793          	addi	a5,a5,576 # f4240 <__min_heap_size+0xe4240>
    3eac:	02f75733          	divu	a4,a4,a5
    3eb0:	fec42783          	lw	a5,-20(s0)
    3eb4:	02f70733          	mul	a4,a4,a5
    3eb8:	2000a7b7          	lui	a5,0x2000a
    3ebc:	5ee7a823          	sw	a4,1520(a5) # 2000a5f0 <TIMER_LOADCOUNT>

    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3ec0:	2000a7b7          	lui	a5,0x2000a
    3ec4:	5f47a783          	lw	a5,1524(a5) # 2000a5f4 <timer_handle>
    3ec8:	4585                	li	a1,1
    3eca:	853e                	mv	a0,a5
    3ecc:	fffff097          	auipc	ra,0xfffff
    3ed0:	3e6080e7          	jalr	998(ra) # 32b2 <csi_timer_config>
    3ed4:	fea42423          	sw	a0,-24(s0)

    if (ret != 0) {
    3ed8:	fe842783          	lw	a5,-24(s0)
    3edc:	c399                	beqz	a5,3ee2 <clock_timer_init+0x9a>
        return -1;
    3ede:	57fd                	li	a5,-1
    3ee0:	a0bd                	j	3f4e <clock_timer_init+0x106>
    }

    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3ee2:	2000a7b7          	lui	a5,0x2000a
    3ee6:	5f47a783          	lw	a5,1524(a5) # 2000a5f4 <timer_handle>
    3eea:	fec42583          	lw	a1,-20(s0)
    3eee:	853e                	mv	a0,a5
    3ef0:	fffff097          	auipc	ra,0xfffff
    3ef4:	4a4080e7          	jalr	1188(ra) # 3394 <csi_timer_set_timeout>
    3ef8:	fea42423          	sw	a0,-24(s0)

    if (ret != 0) {
    3efc:	fe842783          	lw	a5,-24(s0)
    3f00:	c399                	beqz	a5,3f06 <clock_timer_init+0xbe>
        return -1;
    3f02:	57fd                	li	a5,-1
    3f04:	a0a9                	j	3f4e <clock_timer_init+0x106>
    }

    unsigned int cv1, cv2;
    csi_timer_get_current_value(timer_handle, &cv1);
    3f06:	2000a7b7          	lui	a5,0x2000a
    3f0a:	5f47a783          	lw	a5,1524(a5) # 2000a5f4 <timer_handle>
    3f0e:	fe440713          	addi	a4,s0,-28
    3f12:	85ba                	mv	a1,a4
    3f14:	853e                	mv	a0,a5
    3f16:	fffff097          	auipc	ra,0xfffff
    3f1a:	684080e7          	jalr	1668(ra) # 359a <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3f1e:	2000a7b7          	lui	a5,0x2000a
    3f22:	5f47a783          	lw	a5,1524(a5) # 2000a5f4 <timer_handle>
    3f26:	fe040713          	addi	a4,s0,-32
    3f2a:	85ba                	mv	a1,a4
    3f2c:	853e                	mv	a0,a5
    3f2e:	fffff097          	auipc	ra,0xfffff
    3f32:	66c080e7          	jalr	1644(ra) # 359a <csi_timer_get_current_value>

    if (cv2 > cv1) {
    3f36:	fe042703          	lw	a4,-32(s0)
    3f3a:	fe442783          	lw	a5,-28(s0)
    3f3e:	00e7f763          	bgeu	a5,a4,3f4c <clock_timer_init+0x104>
        timer_count_rise = 1;
    3f42:	2000a7b7          	lui	a5,0x2000a
    3f46:	4705                	li	a4,1
    3f48:	5ee78e23          	sb	a4,1532(a5) # 2000a5fc <timer_count_rise>
    }

    return 0;
    3f4c:	4781                	li	a5,0
}
    3f4e:	853e                	mv	a0,a5
    3f50:	40f2                	lw	ra,28(sp)
    3f52:	4462                	lw	s0,24(sp)
    3f54:	6105                	addi	sp,sp,32
    3f56:	8082                	ret

00003f58 <clock_timer_start>:

    return 0;
}

int clock_timer_start(void)
{
    3f58:	1101                	addi	sp,sp,-32
    3f5a:	ce06                	sw	ra,28(sp)
    3f5c:	cc22                	sw	s0,24(sp)
    3f5e:	1000                	addi	s0,sp,32
    int ret = -1;
    3f60:	57fd                	li	a5,-1
    3f62:	fef42623          	sw	a5,-20(s0)
    Timer_LoopCount = 0;
    3f66:	2000a7b7          	lui	a5,0x2000a
    3f6a:	5e07ac23          	sw	zero,1528(a5) # 2000a5f8 <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3f6e:	2000a7b7          	lui	a5,0x2000a
    3f72:	5f47a783          	lw	a5,1524(a5) # 2000a5f4 <timer_handle>
    3f76:	853e                	mv	a0,a5
    3f78:	fffff097          	auipc	ra,0xfffff
    3f7c:	456080e7          	jalr	1110(ra) # 33ce <csi_timer_start>
    3f80:	fea42623          	sw	a0,-20(s0)

    if (ret != 0) {
    3f84:	fec42783          	lw	a5,-20(s0)
    3f88:	c399                	beqz	a5,3f8e <clock_timer_start+0x36>
        return -1;
    3f8a:	57fd                	li	a5,-1
    3f8c:	a011                	j	3f90 <clock_timer_start+0x38>
        (ts_end.tv_sec * 1000000000 + ts_end.tv_nsec) -
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
    3f8e:	4781                	li	a5,0
}
    3f90:	853e                	mv	a0,a5
    3f92:	40f2                	lw	ra,28(sp)
    3f94:	4462                	lw	s0,24(sp)
    3f96:	6105                	addi	sp,sp,32
    3f98:	8082                	ret

00003f9a <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3f9a:	1101                	addi	sp,sp,-32
    3f9c:	ce06                	sw	ra,28(sp)
    3f9e:	cc22                	sw	s0,24(sp)
    3fa0:	1000                	addi	s0,sp,32
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3fa2:	000097b7          	lui	a5,0x9
    3fa6:	83c78793          	addi	a5,a5,-1988 # 883c <pow10.0+0x4c>
    3faa:	fef42623          	sw	a5,-20(s0)
    3fae:	a811                	j	3fc2 <_init+0x28>
        (*p) ();
    3fb0:	fec42783          	lw	a5,-20(s0)
    3fb4:	439c                	lw	a5,0(a5)
    3fb6:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3fb8:	fec42783          	lw	a5,-20(s0)
    3fbc:	17f1                	addi	a5,a5,-4
    3fbe:	fef42623          	sw	a5,-20(s0)
    3fc2:	fec42703          	lw	a4,-20(s0)
    3fc6:	000097b7          	lui	a5,0x9
    3fca:	84078793          	addi	a5,a5,-1984 # 8840 <__ctor_end__>
    3fce:	fef771e3          	bgeu	a4,a5,3fb0 <_init+0x16>
    }
}
    3fd2:	0001                	nop
    3fd4:	0001                	nop
    3fd6:	40f2                	lw	ra,28(sp)
    3fd8:	4462                	lw	s0,24(sp)
    3fda:	6105                	addi	sp,sp,32
    3fdc:	8082                	ret

00003fde <_fini>:

CPP_WEAK void _fini(void)
{
    3fde:	1101                	addi	sp,sp,-32
    3fe0:	ce06                	sw	ra,28(sp)
    3fe2:	cc22                	sw	s0,24(sp)
    3fe4:	1000                	addi	s0,sp,32
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p < (func_ptr *)&__dtor_end__; p++) {
    3fe6:	000097b7          	lui	a5,0x9
    3fea:	84078793          	addi	a5,a5,-1984 # 8840 <__ctor_end__>
    3fee:	fef42623          	sw	a5,-20(s0)
    3ff2:	a811                	j	4006 <_fini+0x28>
        (*p) ();
    3ff4:	fec42783          	lw	a5,-20(s0)
    3ff8:	439c                	lw	a5,0(a5)
    3ffa:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__; p < (func_ptr *)&__dtor_end__; p++) {
    3ffc:	fec42783          	lw	a5,-20(s0)
    4000:	0791                	addi	a5,a5,4
    4002:	fef42623          	sw	a5,-20(s0)
    4006:	fec42703          	lw	a4,-20(s0)
    400a:	000097b7          	lui	a5,0x9
    400e:	84078793          	addi	a5,a5,-1984 # 8840 <__ctor_end__>
    4012:	fef761e3          	bltu	a4,a5,3ff4 <_fini+0x16>
    }
}
    4016:	0001                	nop
    4018:	0001                	nop
    401a:	40f2                	lw	ra,28(sp)
    401c:	4462                	lw	s0,24(sp)
    401e:	6105                	addi	sp,sp,32
    4020:	8082                	ret

00004022 <_putchar>:
   fputc('\n', (void *)-1);
   return 0;
}

void _putchar(char character)
{
    4022:	1101                	addi	sp,sp,-32
    4024:	ce06                	sw	ra,28(sp)
    4026:	cc22                	sw	s0,24(sp)
    4028:	1000                	addi	s0,sp,32
    402a:	87aa                	mv	a5,a0
    402c:	fef407a3          	sb	a5,-17(s0)
    if (console_handle == NULL) {
    4030:	2000a7b7          	lui	a5,0x2000a
    4034:	6007a783          	lw	a5,1536(a5) # 2000a600 <console_handle>
    4038:	cf8d                	beqz	a5,4072 <_putchar+0x50>
        return;
    }

    if (character == '\n') {
    403a:	fef44703          	lbu	a4,-17(s0)
    403e:	47a9                	li	a5,10
    4040:	00f71c63          	bne	a4,a5,4058 <_putchar+0x36>
        csi_usart_putchar(console_handle, '\r');
    4044:	2000a7b7          	lui	a5,0x2000a
    4048:	6007a783          	lw	a5,1536(a5) # 2000a600 <console_handle>
    404c:	45b5                	li	a1,13
    404e:	853e                	mv	a0,a5
    4050:	ffffe097          	auipc	ra,0xffffe
    4054:	7fe080e7          	jalr	2046(ra) # 284e <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, character);
    4058:	2000a7b7          	lui	a5,0x2000a
    405c:	6007a783          	lw	a5,1536(a5) # 2000a600 <console_handle>
    4060:	fef44703          	lbu	a4,-17(s0)
    4064:	85ba                	mv	a1,a4
    4066:	853e                	mv	a0,a5
    4068:	ffffe097          	auipc	ra,0xffffe
    406c:	7e6080e7          	jalr	2022(ra) # 284e <csi_usart_putchar>
    4070:	a011                	j	4074 <_putchar+0x52>
        return;
    4072:	0001                	nop

}
    4074:	40f2                	lw	ra,28(sp)
    4076:	4462                	lw	s0,24(sp)
    4078:	6105                	addi	sp,sp,32
    407a:	8082                	ret

0000407c <putchar>:

int putchar(int c)
{
    407c:	1101                	addi	sp,sp,-32
    407e:	ce06                	sw	ra,28(sp)
    4080:	cc22                	sw	s0,24(sp)
    4082:	1000                	addi	s0,sp,32
    4084:	fea42623          	sw	a0,-20(s0)
    _putchar(c);
    4088:	fec42783          	lw	a5,-20(s0)
    408c:	0ff7f793          	andi	a5,a5,255
    4090:	853e                	mv	a0,a5
    4092:	00000097          	auipc	ra,0x0
    4096:	f90080e7          	jalr	-112(ra) # 4022 <_putchar>
    return 0;
    409a:	4781                	li	a5,0
}
    409c:	853e                	mv	a0,a5
    409e:	40f2                	lw	ra,28(sp)
    40a0:	4462                	lw	s0,24(sp)
    40a2:	6105                	addi	sp,sp,32
    40a4:	8082                	ret

000040a6 <_out_null>:
}


// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
    40a6:	1101                	addi	sp,sp,-32
    40a8:	ce22                	sw	s0,28(sp)
    40aa:	1000                	addi	s0,sp,32
    40ac:	87aa                	mv	a5,a0
    40ae:	feb42423          	sw	a1,-24(s0)
    40b2:	fec42223          	sw	a2,-28(s0)
    40b6:	fed42023          	sw	a3,-32(s0)
    40ba:	fef407a3          	sb	a5,-17(s0)
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
    40be:	0001                	nop
    40c0:	4472                	lw	s0,28(sp)
    40c2:	6105                	addi	sp,sp,32
    40c4:	8082                	ret

000040c6 <_out_char>:


// internal _putchar wrapper
static inline void _out_char(char character, void* buffer, size_t idx, size_t maxlen)
{
    40c6:	1101                	addi	sp,sp,-32
    40c8:	ce06                	sw	ra,28(sp)
    40ca:	cc22                	sw	s0,24(sp)
    40cc:	1000                	addi	s0,sp,32
    40ce:	87aa                	mv	a5,a0
    40d0:	feb42423          	sw	a1,-24(s0)
    40d4:	fec42223          	sw	a2,-28(s0)
    40d8:	fed42023          	sw	a3,-32(s0)
    40dc:	fef407a3          	sb	a5,-17(s0)
  (void)buffer; (void)idx; (void)maxlen;
  if (character) {
    40e0:	fef44783          	lbu	a5,-17(s0)
    40e4:	cb81                	beqz	a5,40f4 <_out_char+0x2e>
    _putchar(character);
    40e6:	fef44783          	lbu	a5,-17(s0)
    40ea:	853e                	mv	a0,a5
    40ec:	00000097          	auipc	ra,0x0
    40f0:	f36080e7          	jalr	-202(ra) # 4022 <_putchar>
  }
}
    40f4:	0001                	nop
    40f6:	40f2                	lw	ra,28(sp)
    40f8:	4462                	lw	s0,24(sp)
    40fa:	6105                	addi	sp,sp,32
    40fc:	8082                	ret

000040fe <_strnlen_s>:


// internal secure strlen
// \return The length of the string (excluding the terminating 0) limited by 'maxsize'
static inline unsigned int _strnlen_s(const char* str, size_t maxsize)
{
    40fe:	7179                	addi	sp,sp,-48
    4100:	d622                	sw	s0,44(sp)
    4102:	1800                	addi	s0,sp,48
    4104:	fca42e23          	sw	a0,-36(s0)
    4108:	fcb42c23          	sw	a1,-40(s0)
  const char* s;
  for (s = str; *s && maxsize--; ++s);
    410c:	fdc42783          	lw	a5,-36(s0)
    4110:	fef42623          	sw	a5,-20(s0)
    4114:	a031                	j	4120 <_strnlen_s+0x22>
    4116:	fec42783          	lw	a5,-20(s0)
    411a:	0785                	addi	a5,a5,1
    411c:	fef42623          	sw	a5,-20(s0)
    4120:	fec42783          	lw	a5,-20(s0)
    4124:	0007c783          	lbu	a5,0(a5)
    4128:	cb81                	beqz	a5,4138 <_strnlen_s+0x3a>
    412a:	fd842783          	lw	a5,-40(s0)
    412e:	fff78713          	addi	a4,a5,-1
    4132:	fce42c23          	sw	a4,-40(s0)
    4136:	f3e5                	bnez	a5,4116 <_strnlen_s+0x18>
  return (unsigned int)(s - str);
    4138:	fec42703          	lw	a4,-20(s0)
    413c:	fdc42783          	lw	a5,-36(s0)
    4140:	40f707b3          	sub	a5,a4,a5
}
    4144:	853e                	mv	a0,a5
    4146:	5432                	lw	s0,44(sp)
    4148:	6145                	addi	sp,sp,48
    414a:	8082                	ret

0000414c <_is_digit>:


// internal test if char is a digit (0-9)
// \return true if char is a digit
static inline bool _is_digit(char ch)
{
    414c:	1101                	addi	sp,sp,-32
    414e:	ce22                	sw	s0,28(sp)
    4150:	1000                	addi	s0,sp,32
    4152:	87aa                	mv	a5,a0
    4154:	fef407a3          	sb	a5,-17(s0)
  return (ch >= '0') && (ch <= '9');
    4158:	fef44703          	lbu	a4,-17(s0)
    415c:	02f00793          	li	a5,47
    4160:	00e7fa63          	bgeu	a5,a4,4174 <_is_digit+0x28>
    4164:	fef44703          	lbu	a4,-17(s0)
    4168:	03900793          	li	a5,57
    416c:	00e7e463          	bltu	a5,a4,4174 <_is_digit+0x28>
    4170:	4785                	li	a5,1
    4172:	a011                	j	4176 <_is_digit+0x2a>
    4174:	4781                	li	a5,0
    4176:	8b85                	andi	a5,a5,1
    4178:	0ff7f793          	andi	a5,a5,255
}
    417c:	853e                	mv	a0,a5
    417e:	4472                	lw	s0,28(sp)
    4180:	6105                	addi	sp,sp,32
    4182:	8082                	ret

00004184 <_atoi>:


// internal ASCII string to unsigned int conversion
static unsigned int _atoi(const char** str)
{
    4184:	7179                	addi	sp,sp,-48
    4186:	d606                	sw	ra,44(sp)
    4188:	d422                	sw	s0,40(sp)
    418a:	1800                	addi	s0,sp,48
    418c:	fca42e23          	sw	a0,-36(s0)
  unsigned int i = 0U;
    4190:	fe042623          	sw	zero,-20(s0)
  while (_is_digit(**str)) {
    4194:	a03d                	j	41c2 <_atoi+0x3e>
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
    4196:	fec42703          	lw	a4,-20(s0)
    419a:	87ba                	mv	a5,a4
    419c:	078a                	slli	a5,a5,0x2
    419e:	97ba                	add	a5,a5,a4
    41a0:	0786                	slli	a5,a5,0x1
    41a2:	863e                	mv	a2,a5
    41a4:	fdc42783          	lw	a5,-36(s0)
    41a8:	439c                	lw	a5,0(a5)
    41aa:	00178693          	addi	a3,a5,1
    41ae:	fdc42703          	lw	a4,-36(s0)
    41b2:	c314                	sw	a3,0(a4)
    41b4:	0007c783          	lbu	a5,0(a5)
    41b8:	97b2                	add	a5,a5,a2
    41ba:	fd078793          	addi	a5,a5,-48
    41be:	fef42623          	sw	a5,-20(s0)
  while (_is_digit(**str)) {
    41c2:	fdc42783          	lw	a5,-36(s0)
    41c6:	439c                	lw	a5,0(a5)
    41c8:	0007c783          	lbu	a5,0(a5)
    41cc:	853e                	mv	a0,a5
    41ce:	00000097          	auipc	ra,0x0
    41d2:	f7e080e7          	jalr	-130(ra) # 414c <_is_digit>
    41d6:	87aa                	mv	a5,a0
    41d8:	ffdd                	bnez	a5,4196 <_atoi+0x12>
  }
  return i;
    41da:	fec42783          	lw	a5,-20(s0)
}
    41de:	853e                	mv	a0,a5
    41e0:	50b2                	lw	ra,44(sp)
    41e2:	5422                	lw	s0,40(sp)
    41e4:	6145                	addi	sp,sp,48
    41e6:	8082                	ret

000041e8 <_out_rev>:


// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
    41e8:	7139                	addi	sp,sp,-64
    41ea:	de06                	sw	ra,60(sp)
    41ec:	dc22                	sw	s0,56(sp)
    41ee:	0080                	addi	s0,sp,64
    41f0:	fca42e23          	sw	a0,-36(s0)
    41f4:	fcb42c23          	sw	a1,-40(s0)
    41f8:	fcc42a23          	sw	a2,-44(s0)
    41fc:	fcd42823          	sw	a3,-48(s0)
    4200:	fce42623          	sw	a4,-52(s0)
    4204:	fcf42423          	sw	a5,-56(s0)
    4208:	fd042223          	sw	a6,-60(s0)
    420c:	fd142023          	sw	a7,-64(s0)
  const size_t start_idx = idx;
    4210:	fd442783          	lw	a5,-44(s0)
    4214:	fef42423          	sw	a5,-24(s0)

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
    4218:	fc042783          	lw	a5,-64(s0)
    421c:	8b89                	andi	a5,a5,2
    421e:	e3c1                	bnez	a5,429e <_out_rev+0xb6>
    4220:	fc042783          	lw	a5,-64(s0)
    4224:	8b85                	andi	a5,a5,1
    4226:	efa5                	bnez	a5,429e <_out_rev+0xb6>
    for (size_t i = len; i < width; i++) {
    4228:	fc842783          	lw	a5,-56(s0)
    422c:	fef42623          	sw	a5,-20(s0)
    4230:	a035                	j	425c <_out_rev+0x74>
      out(' ', buffer, idx++, maxlen);
    4232:	fd442783          	lw	a5,-44(s0)
    4236:	00178713          	addi	a4,a5,1
    423a:	fce42a23          	sw	a4,-44(s0)
    423e:	fdc42703          	lw	a4,-36(s0)
    4242:	fd042683          	lw	a3,-48(s0)
    4246:	863e                	mv	a2,a5
    4248:	fd842583          	lw	a1,-40(s0)
    424c:	02000513          	li	a0,32
    4250:	9702                	jalr	a4
    for (size_t i = len; i < width; i++) {
    4252:	fec42783          	lw	a5,-20(s0)
    4256:	0785                	addi	a5,a5,1
    4258:	fef42623          	sw	a5,-20(s0)
    425c:	fec42703          	lw	a4,-20(s0)
    4260:	fc442783          	lw	a5,-60(s0)
    4264:	fcf767e3          	bltu	a4,a5,4232 <_out_rev+0x4a>
    }
  }

  // reverse string
  while (len) {
    4268:	a81d                	j	429e <_out_rev+0xb6>
    out(buf[--len], buffer, idx++, maxlen);
    426a:	fc842783          	lw	a5,-56(s0)
    426e:	17fd                	addi	a5,a5,-1
    4270:	fcf42423          	sw	a5,-56(s0)
    4274:	fcc42703          	lw	a4,-52(s0)
    4278:	fc842783          	lw	a5,-56(s0)
    427c:	97ba                	add	a5,a5,a4
    427e:	0007c503          	lbu	a0,0(a5)
    4282:	fd442783          	lw	a5,-44(s0)
    4286:	00178713          	addi	a4,a5,1
    428a:	fce42a23          	sw	a4,-44(s0)
    428e:	fdc42703          	lw	a4,-36(s0)
    4292:	fd042683          	lw	a3,-48(s0)
    4296:	863e                	mv	a2,a5
    4298:	fd842583          	lw	a1,-40(s0)
    429c:	9702                	jalr	a4
  while (len) {
    429e:	fc842783          	lw	a5,-56(s0)
    42a2:	f7e1                	bnez	a5,426a <_out_rev+0x82>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
    42a4:	fc042783          	lw	a5,-64(s0)
    42a8:	8b89                	andi	a5,a5,2
    42aa:	cf85                	beqz	a5,42e2 <_out_rev+0xfa>
    while (idx - start_idx < width) {
    42ac:	a00d                	j	42ce <_out_rev+0xe6>
      out(' ', buffer, idx++, maxlen);
    42ae:	fd442783          	lw	a5,-44(s0)
    42b2:	00178713          	addi	a4,a5,1
    42b6:	fce42a23          	sw	a4,-44(s0)
    42ba:	fdc42703          	lw	a4,-36(s0)
    42be:	fd042683          	lw	a3,-48(s0)
    42c2:	863e                	mv	a2,a5
    42c4:	fd842583          	lw	a1,-40(s0)
    42c8:	02000513          	li	a0,32
    42cc:	9702                	jalr	a4
    while (idx - start_idx < width) {
    42ce:	fd442703          	lw	a4,-44(s0)
    42d2:	fe842783          	lw	a5,-24(s0)
    42d6:	40f707b3          	sub	a5,a4,a5
    42da:	fc442703          	lw	a4,-60(s0)
    42de:	fce7e8e3          	bltu	a5,a4,42ae <_out_rev+0xc6>
    }
  }

  return idx;
    42e2:	fd442783          	lw	a5,-44(s0)
}
    42e6:	853e                	mv	a0,a5
    42e8:	50f2                	lw	ra,60(sp)
    42ea:	5462                	lw	s0,56(sp)
    42ec:	6121                	addi	sp,sp,64
    42ee:	8082                	ret

000042f0 <_ntoa_format>:


// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
    42f0:	7179                	addi	sp,sp,-48
    42f2:	d606                	sw	ra,44(sp)
    42f4:	d422                	sw	s0,40(sp)
    42f6:	1800                	addi	s0,sp,48
    42f8:	fea42623          	sw	a0,-20(s0)
    42fc:	feb42423          	sw	a1,-24(s0)
    4300:	fec42223          	sw	a2,-28(s0)
    4304:	fed42023          	sw	a3,-32(s0)
    4308:	fce42e23          	sw	a4,-36(s0)
    430c:	fcf42c23          	sw	a5,-40(s0)
    4310:	87c2                	mv	a5,a6
    4312:	fd142823          	sw	a7,-48(s0)
    4316:	fcf40ba3          	sb	a5,-41(s0)
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
    431a:	441c                	lw	a5,8(s0)
    431c:	8b89                	andi	a5,a5,2
    431e:	e3d1                	bnez	a5,43a2 <_ntoa_format+0xb2>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    4320:	405c                	lw	a5,4(s0)
    4322:	cb9d                	beqz	a5,4358 <_ntoa_format+0x68>
    4324:	441c                	lw	a5,8(s0)
    4326:	8b85                	andi	a5,a5,1
    4328:	cb85                	beqz	a5,4358 <_ntoa_format+0x68>
    432a:	fd744783          	lbu	a5,-41(s0)
    432e:	e781                	bnez	a5,4336 <_ntoa_format+0x46>
    4330:	441c                	lw	a5,8(s0)
    4332:	8bb1                	andi	a5,a5,12
    4334:	c395                	beqz	a5,4358 <_ntoa_format+0x68>
      width--;
    4336:	405c                	lw	a5,4(s0)
    4338:	17fd                	addi	a5,a5,-1
    433a:	c05c                	sw	a5,4(s0)
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    433c:	a831                	j	4358 <_ntoa_format+0x68>
      buf[len++] = '0';
    433e:	fd842783          	lw	a5,-40(s0)
    4342:	00178713          	addi	a4,a5,1
    4346:	fce42c23          	sw	a4,-40(s0)
    434a:	fdc42703          	lw	a4,-36(s0)
    434e:	97ba                	add	a5,a5,a4
    4350:	03000713          	li	a4,48
    4354:	00e78023          	sb	a4,0(a5)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    4358:	fd842703          	lw	a4,-40(s0)
    435c:	401c                	lw	a5,0(s0)
    435e:	02f77563          	bgeu	a4,a5,4388 <_ntoa_format+0x98>
    4362:	fd842703          	lw	a4,-40(s0)
    4366:	47fd                	li	a5,31
    4368:	fce7fbe3          	bgeu	a5,a4,433e <_ntoa_format+0x4e>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    436c:	a831                	j	4388 <_ntoa_format+0x98>
      buf[len++] = '0';
    436e:	fd842783          	lw	a5,-40(s0)
    4372:	00178713          	addi	a4,a5,1
    4376:	fce42c23          	sw	a4,-40(s0)
    437a:	fdc42703          	lw	a4,-36(s0)
    437e:	97ba                	add	a5,a5,a4
    4380:	03000713          	li	a4,48
    4384:	00e78023          	sb	a4,0(a5)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    4388:	441c                	lw	a5,8(s0)
    438a:	8b85                	andi	a5,a5,1
    438c:	cb99                	beqz	a5,43a2 <_ntoa_format+0xb2>
    438e:	fd842703          	lw	a4,-40(s0)
    4392:	405c                	lw	a5,4(s0)
    4394:	00f77763          	bgeu	a4,a5,43a2 <_ntoa_format+0xb2>
    4398:	fd842703          	lw	a4,-40(s0)
    439c:	47fd                	li	a5,31
    439e:	fce7f8e3          	bgeu	a5,a4,436e <_ntoa_format+0x7e>
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
    43a2:	441c                	lw	a5,8(s0)
    43a4:	8bc1                	andi	a5,a5,16
    43a6:	10078663          	beqz	a5,44b2 <_ntoa_format+0x1c2>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
    43aa:	441c                	lw	a5,8(s0)
    43ac:	4007f793          	andi	a5,a5,1024
    43b0:	e3a1                	bnez	a5,43f0 <_ntoa_format+0x100>
    43b2:	fd842783          	lw	a5,-40(s0)
    43b6:	cf8d                	beqz	a5,43f0 <_ntoa_format+0x100>
    43b8:	fd842703          	lw	a4,-40(s0)
    43bc:	401c                	lw	a5,0(s0)
    43be:	00f70763          	beq	a4,a5,43cc <_ntoa_format+0xdc>
    43c2:	fd842703          	lw	a4,-40(s0)
    43c6:	405c                	lw	a5,4(s0)
    43c8:	02f71463          	bne	a4,a5,43f0 <_ntoa_format+0x100>
      len--;
    43cc:	fd842783          	lw	a5,-40(s0)
    43d0:	17fd                	addi	a5,a5,-1
    43d2:	fcf42c23          	sw	a5,-40(s0)
      if (len && (base == 16U)) {
    43d6:	fd842783          	lw	a5,-40(s0)
    43da:	cb99                	beqz	a5,43f0 <_ntoa_format+0x100>
    43dc:	fd042703          	lw	a4,-48(s0)
    43e0:	47c1                	li	a5,16
    43e2:	00f71763          	bne	a4,a5,43f0 <_ntoa_format+0x100>
        len--;
    43e6:	fd842783          	lw	a5,-40(s0)
    43ea:	17fd                	addi	a5,a5,-1
    43ec:	fcf42c23          	sw	a5,-40(s0)
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    43f0:	fd042703          	lw	a4,-48(s0)
    43f4:	47c1                	li	a5,16
    43f6:	02f71963          	bne	a4,a5,4428 <_ntoa_format+0x138>
    43fa:	441c                	lw	a5,8(s0)
    43fc:	0207f793          	andi	a5,a5,32
    4400:	e785                	bnez	a5,4428 <_ntoa_format+0x138>
    4402:	fd842703          	lw	a4,-40(s0)
    4406:	47fd                	li	a5,31
    4408:	02e7e063          	bltu	a5,a4,4428 <_ntoa_format+0x138>
      buf[len++] = 'x';
    440c:	fd842783          	lw	a5,-40(s0)
    4410:	00178713          	addi	a4,a5,1
    4414:	fce42c23          	sw	a4,-40(s0)
    4418:	fdc42703          	lw	a4,-36(s0)
    441c:	97ba                	add	a5,a5,a4
    441e:	07800713          	li	a4,120
    4422:	00e78023          	sb	a4,0(a5)
    4426:	a0a5                	j	448e <_ntoa_format+0x19e>
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    4428:	fd042703          	lw	a4,-48(s0)
    442c:	47c1                	li	a5,16
    442e:	02f71963          	bne	a4,a5,4460 <_ntoa_format+0x170>
    4432:	441c                	lw	a5,8(s0)
    4434:	0207f793          	andi	a5,a5,32
    4438:	c785                	beqz	a5,4460 <_ntoa_format+0x170>
    443a:	fd842703          	lw	a4,-40(s0)
    443e:	47fd                	li	a5,31
    4440:	02e7e063          	bltu	a5,a4,4460 <_ntoa_format+0x170>
      buf[len++] = 'X';
    4444:	fd842783          	lw	a5,-40(s0)
    4448:	00178713          	addi	a4,a5,1
    444c:	fce42c23          	sw	a4,-40(s0)
    4450:	fdc42703          	lw	a4,-36(s0)
    4454:	97ba                	add	a5,a5,a4
    4456:	05800713          	li	a4,88
    445a:	00e78023          	sb	a4,0(a5)
    445e:	a805                	j	448e <_ntoa_format+0x19e>
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    4460:	fd042703          	lw	a4,-48(s0)
    4464:	4789                	li	a5,2
    4466:	02f71463          	bne	a4,a5,448e <_ntoa_format+0x19e>
    446a:	fd842703          	lw	a4,-40(s0)
    446e:	47fd                	li	a5,31
    4470:	00e7ef63          	bltu	a5,a4,448e <_ntoa_format+0x19e>
      buf[len++] = 'b';
    4474:	fd842783          	lw	a5,-40(s0)
    4478:	00178713          	addi	a4,a5,1
    447c:	fce42c23          	sw	a4,-40(s0)
    4480:	fdc42703          	lw	a4,-36(s0)
    4484:	97ba                	add	a5,a5,a4
    4486:	06200713          	li	a4,98
    448a:	00e78023          	sb	a4,0(a5)
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
    448e:	fd842703          	lw	a4,-40(s0)
    4492:	47fd                	li	a5,31
    4494:	00e7ef63          	bltu	a5,a4,44b2 <_ntoa_format+0x1c2>
      buf[len++] = '0';
    4498:	fd842783          	lw	a5,-40(s0)
    449c:	00178713          	addi	a4,a5,1
    44a0:	fce42c23          	sw	a4,-40(s0)
    44a4:	fdc42703          	lw	a4,-36(s0)
    44a8:	97ba                	add	a5,a5,a4
    44aa:	03000713          	li	a4,48
    44ae:	00e78023          	sb	a4,0(a5)
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
    44b2:	fd842703          	lw	a4,-40(s0)
    44b6:	47fd                	li	a5,31
    44b8:	06e7e463          	bltu	a5,a4,4520 <_ntoa_format+0x230>
    if (negative) {
    44bc:	fd744783          	lbu	a5,-41(s0)
    44c0:	cf99                	beqz	a5,44de <_ntoa_format+0x1ee>
      buf[len++] = '-';
    44c2:	fd842783          	lw	a5,-40(s0)
    44c6:	00178713          	addi	a4,a5,1
    44ca:	fce42c23          	sw	a4,-40(s0)
    44ce:	fdc42703          	lw	a4,-36(s0)
    44d2:	97ba                	add	a5,a5,a4
    44d4:	02d00713          	li	a4,45
    44d8:	00e78023          	sb	a4,0(a5)
    44dc:	a091                	j	4520 <_ntoa_format+0x230>
    }
    else if (flags & FLAGS_PLUS) {
    44de:	441c                	lw	a5,8(s0)
    44e0:	8b91                	andi	a5,a5,4
    44e2:	cf99                	beqz	a5,4500 <_ntoa_format+0x210>
      buf[len++] = '+';  // ignore the space if the '+' exists
    44e4:	fd842783          	lw	a5,-40(s0)
    44e8:	00178713          	addi	a4,a5,1
    44ec:	fce42c23          	sw	a4,-40(s0)
    44f0:	fdc42703          	lw	a4,-36(s0)
    44f4:	97ba                	add	a5,a5,a4
    44f6:	02b00713          	li	a4,43
    44fa:	00e78023          	sb	a4,0(a5)
    44fe:	a00d                	j	4520 <_ntoa_format+0x230>
    }
    else if (flags & FLAGS_SPACE) {
    4500:	441c                	lw	a5,8(s0)
    4502:	8ba1                	andi	a5,a5,8
    4504:	cf91                	beqz	a5,4520 <_ntoa_format+0x230>
      buf[len++] = ' ';
    4506:	fd842783          	lw	a5,-40(s0)
    450a:	00178713          	addi	a4,a5,1
    450e:	fce42c23          	sw	a4,-40(s0)
    4512:	fdc42703          	lw	a4,-36(s0)
    4516:	97ba                	add	a5,a5,a4
    4518:	02000713          	li	a4,32
    451c:	00e78023          	sb	a4,0(a5)
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    4520:	00842883          	lw	a7,8(s0)
    4524:	00442803          	lw	a6,4(s0)
    4528:	fd842783          	lw	a5,-40(s0)
    452c:	fdc42703          	lw	a4,-36(s0)
    4530:	fe042683          	lw	a3,-32(s0)
    4534:	fe442603          	lw	a2,-28(s0)
    4538:	fe842583          	lw	a1,-24(s0)
    453c:	fec42503          	lw	a0,-20(s0)
    4540:	00000097          	auipc	ra,0x0
    4544:	ca8080e7          	jalr	-856(ra) # 41e8 <_out_rev>
    4548:	87aa                	mv	a5,a0
}
    454a:	853e                	mv	a0,a5
    454c:	50b2                	lw	ra,44(sp)
    454e:	5422                	lw	s0,40(sp)
    4550:	6145                	addi	sp,sp,48
    4552:	8082                	ret

00004554 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
    4554:	7159                	addi	sp,sp,-112
    4556:	d686                	sw	ra,108(sp)
    4558:	d4a2                	sw	s0,104(sp)
    455a:	1880                	addi	s0,sp,112
    455c:	faa42e23          	sw	a0,-68(s0)
    4560:	fab42c23          	sw	a1,-72(s0)
    4564:	fac42a23          	sw	a2,-76(s0)
    4568:	fad42823          	sw	a3,-80(s0)
    456c:	fae42623          	sw	a4,-84(s0)
    4570:	fb042223          	sw	a6,-92(s0)
    4574:	fb142023          	sw	a7,-96(s0)
    4578:	faf405a3          	sb	a5,-85(s0)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;
    457c:	fe042623          	sw	zero,-20(s0)

  // no hash for 0 values
  if (!value) {
    4580:	fac42783          	lw	a5,-84(s0)
    4584:	e781                	bnez	a5,458c <_ntoa_long+0x38>
    flags &= ~FLAGS_HASH;
    4586:	405c                	lw	a5,4(s0)
    4588:	9bbd                	andi	a5,a5,-17
    458a:	c05c                	sw	a5,4(s0)
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
    458c:	405c                	lw	a5,4(s0)
    458e:	4007f793          	andi	a5,a5,1024
    4592:	c781                	beqz	a5,459a <_ntoa_long+0x46>
    4594:	fac42783          	lw	a5,-84(s0)
    4598:	c3c1                	beqz	a5,4618 <_ntoa_long+0xc4>
    do {
      const char digit = (char)(value % base);
    459a:	fac42703          	lw	a4,-84(s0)
    459e:	fa442783          	lw	a5,-92(s0)
    45a2:	02f777b3          	remu	a5,a4,a5
    45a6:	fef405a3          	sb	a5,-21(s0)
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    45aa:	feb44703          	lbu	a4,-21(s0)
    45ae:	47a5                	li	a5,9
    45b0:	00e7e963          	bltu	a5,a4,45c2 <_ntoa_long+0x6e>
    45b4:	feb44783          	lbu	a5,-21(s0)
    45b8:	03078793          	addi	a5,a5,48
    45bc:	0ff7f713          	andi	a4,a5,255
    45c0:	a015                	j	45e4 <_ntoa_long+0x90>
    45c2:	405c                	lw	a5,4(s0)
    45c4:	0207f793          	andi	a5,a5,32
    45c8:	c781                	beqz	a5,45d0 <_ntoa_long+0x7c>
    45ca:	04100793          	li	a5,65
    45ce:	a019                	j	45d4 <_ntoa_long+0x80>
    45d0:	06100793          	li	a5,97
    45d4:	feb44703          	lbu	a4,-21(s0)
    45d8:	97ba                	add	a5,a5,a4
    45da:	0ff7f793          	andi	a5,a5,255
    45de:	17d9                	addi	a5,a5,-10
    45e0:	0ff7f713          	andi	a4,a5,255
    45e4:	fec42783          	lw	a5,-20(s0)
    45e8:	00178693          	addi	a3,a5,1
    45ec:	fed42623          	sw	a3,-20(s0)
    45f0:	fc840693          	addi	a3,s0,-56
    45f4:	00f6d70b          	srb	a4,a3,a5,0
      value /= base;
    45f8:	fac42703          	lw	a4,-84(s0)
    45fc:	fa442783          	lw	a5,-92(s0)
    4600:	02f757b3          	divu	a5,a4,a5
    4604:	faf42623          	sw	a5,-84(s0)
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    4608:	fac42783          	lw	a5,-84(s0)
    460c:	c791                	beqz	a5,4618 <_ntoa_long+0xc4>
    460e:	fec42703          	lw	a4,-20(s0)
    4612:	47fd                	li	a5,31
    4614:	f8e7f3e3          	bgeu	a5,a4,459a <_ntoa_long+0x46>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
    4618:	fab44683          	lbu	a3,-85(s0)
    461c:	fc840713          	addi	a4,s0,-56
    4620:	405c                	lw	a5,4(s0)
    4622:	c43e                	sw	a5,8(sp)
    4624:	401c                	lw	a5,0(s0)
    4626:	c23e                	sw	a5,4(sp)
    4628:	fa042783          	lw	a5,-96(s0)
    462c:	c03e                	sw	a5,0(sp)
    462e:	fa442883          	lw	a7,-92(s0)
    4632:	8836                	mv	a6,a3
    4634:	fec42783          	lw	a5,-20(s0)
    4638:	fb042683          	lw	a3,-80(s0)
    463c:	fb442603          	lw	a2,-76(s0)
    4640:	fb842583          	lw	a1,-72(s0)
    4644:	fbc42503          	lw	a0,-68(s0)
    4648:	00000097          	auipc	ra,0x0
    464c:	ca8080e7          	jalr	-856(ra) # 42f0 <_ntoa_format>
    4650:	87aa                	mv	a5,a0
}
    4652:	853e                	mv	a0,a5
    4654:	50b6                	lw	ra,108(sp)
    4656:	5426                	lw	s0,104(sp)
    4658:	6165                	addi	sp,sp,112
    465a:	8082                	ret

0000465c <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
    465c:	7119                	addi	sp,sp,-128
    465e:	d686                	sw	ra,108(sp)
    4660:	d4a2                	sw	s0,104(sp)
    4662:	1880                	addi	s0,sp,112
    4664:	faa42e23          	sw	a0,-68(s0)
    4668:	fab42c23          	sw	a1,-72(s0)
    466c:	fac42a23          	sw	a2,-76(s0)
    4670:	fad42823          	sw	a3,-80(s0)
    4674:	fae42423          	sw	a4,-88(s0)
    4678:	faf42623          	sw	a5,-84(s0)
    467c:	87c2                	mv	a5,a6
    467e:	01142623          	sw	a7,12(s0)
    4682:	faf403a3          	sb	a5,-89(s0)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;
    4686:	fe042623          	sw	zero,-20(s0)

  // no hash for 0 values
  if (!value) {
    468a:	fa842783          	lw	a5,-88(s0)
    468e:	fac42703          	lw	a4,-84(s0)
    4692:	8fd9                	or	a5,a5,a4
    4694:	e781                	bnez	a5,469c <_ntoa_long_long+0x40>
    flags &= ~FLAGS_HASH;
    4696:	4c5c                	lw	a5,28(s0)
    4698:	9bbd                	andi	a5,a5,-17
    469a:	cc5c                	sw	a5,28(s0)
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
    469c:	4c5c                	lw	a5,28(s0)
    469e:	4007f793          	andi	a5,a5,1024
    46a2:	c799                	beqz	a5,46b0 <_ntoa_long_long+0x54>
    46a4:	fa842783          	lw	a5,-88(s0)
    46a8:	fac42703          	lw	a4,-84(s0)
    46ac:	8fd9                	or	a5,a5,a4
    46ae:	c3dd                	beqz	a5,4754 <_ntoa_long_long+0xf8>
    do {
      const char digit = (char)(value % base);
    46b0:	fa842703          	lw	a4,-88(s0)
    46b4:	fac42783          	lw	a5,-84(s0)
    46b8:	4450                	lw	a2,12(s0)
    46ba:	4814                	lw	a3,16(s0)
    46bc:	853a                	mv	a0,a4
    46be:	85be                	mv	a1,a5
    46c0:	ffffc097          	auipc	ra,0xffffc
    46c4:	e7e080e7          	jalr	-386(ra) # 53e <__umoddi3>
    46c8:	872a                	mv	a4,a0
    46ca:	87ae                	mv	a5,a1
    46cc:	fee405a3          	sb	a4,-21(s0)
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    46d0:	feb44703          	lbu	a4,-21(s0)
    46d4:	47a5                	li	a5,9
    46d6:	00e7e963          	bltu	a5,a4,46e8 <_ntoa_long_long+0x8c>
    46da:	feb44783          	lbu	a5,-21(s0)
    46de:	03078793          	addi	a5,a5,48
    46e2:	0ff7f713          	andi	a4,a5,255
    46e6:	a015                	j	470a <_ntoa_long_long+0xae>
    46e8:	4c5c                	lw	a5,28(s0)
    46ea:	0207f793          	andi	a5,a5,32
    46ee:	c781                	beqz	a5,46f6 <_ntoa_long_long+0x9a>
    46f0:	04100793          	li	a5,65
    46f4:	a019                	j	46fa <_ntoa_long_long+0x9e>
    46f6:	06100793          	li	a5,97
    46fa:	feb44703          	lbu	a4,-21(s0)
    46fe:	97ba                	add	a5,a5,a4
    4700:	0ff7f793          	andi	a5,a5,255
    4704:	17d9                	addi	a5,a5,-10
    4706:	0ff7f713          	andi	a4,a5,255
    470a:	fec42783          	lw	a5,-20(s0)
    470e:	00178693          	addi	a3,a5,1
    4712:	fed42623          	sw	a3,-20(s0)
    4716:	fc840693          	addi	a3,s0,-56
    471a:	00f6d70b          	srb	a4,a3,a5,0
      value /= base;
    471e:	4450                	lw	a2,12(s0)
    4720:	4814                	lw	a3,16(s0)
    4722:	fa842503          	lw	a0,-88(s0)
    4726:	fac42583          	lw	a1,-84(s0)
    472a:	ffffc097          	auipc	ra,0xffffc
    472e:	ab4080e7          	jalr	-1356(ra) # 1de <__udivdi3>
    4732:	872a                	mv	a4,a0
    4734:	87ae                	mv	a5,a1
    4736:	fae42423          	sw	a4,-88(s0)
    473a:	faf42623          	sw	a5,-84(s0)
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    473e:	fa842783          	lw	a5,-88(s0)
    4742:	fac42703          	lw	a4,-84(s0)
    4746:	8fd9                	or	a5,a5,a4
    4748:	c791                	beqz	a5,4754 <_ntoa_long_long+0xf8>
    474a:	fec42703          	lw	a4,-20(s0)
    474e:	47fd                	li	a5,31
    4750:	f6e7f0e3          	bgeu	a5,a4,46b0 <_ntoa_long_long+0x54>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
    4754:	4450                	lw	a2,12(s0)
    4756:	fa744683          	lbu	a3,-89(s0)
    475a:	fc840713          	addi	a4,s0,-56
    475e:	4c5c                	lw	a5,28(s0)
    4760:	c43e                	sw	a5,8(sp)
    4762:	4c1c                	lw	a5,24(s0)
    4764:	c23e                	sw	a5,4(sp)
    4766:	485c                	lw	a5,20(s0)
    4768:	c03e                	sw	a5,0(sp)
    476a:	88b2                	mv	a7,a2
    476c:	8836                	mv	a6,a3
    476e:	fec42783          	lw	a5,-20(s0)
    4772:	fb042683          	lw	a3,-80(s0)
    4776:	fb442603          	lw	a2,-76(s0)
    477a:	fb842583          	lw	a1,-72(s0)
    477e:	fbc42503          	lw	a0,-68(s0)
    4782:	00000097          	auipc	ra,0x0
    4786:	b6e080e7          	jalr	-1170(ra) # 42f0 <_ntoa_format>
    478a:	87aa                	mv	a5,a0
}
    478c:	853e                	mv	a0,a5
    478e:	50b6                	lw	ra,108(sp)
    4790:	5426                	lw	s0,104(sp)
    4792:	6109                	addi	sp,sp,128
    4794:	8082                	ret

00004796 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
    4796:	7175                	addi	sp,sp,-144
    4798:	c706                	sw	ra,140(sp)
    479a:	c522                	sw	s0,136(sp)
    479c:	c326                	sw	s1,132(sp)
    479e:	0900                	addi	s0,sp,144
    47a0:	f8a42e23          	sw	a0,-100(s0)
    47a4:	f8b42c23          	sw	a1,-104(s0)
    47a8:	f8c42a23          	sw	a2,-108(s0)
    47ac:	f8d42823          	sw	a3,-112(s0)
    47b0:	f8e42423          	sw	a4,-120(s0)
    47b4:	f8f42623          	sw	a5,-116(s0)
    47b8:	f9042223          	sw	a6,-124(s0)
    47bc:	f9142023          	sw	a7,-128(s0)
  char buf[PRINTF_FTOA_BUFFER_SIZE];
  size_t len  = 0U;
    47c0:	fe042623          	sw	zero,-20(s0)
  double diff = 0.0;
    47c4:	fc042823          	sw	zero,-48(s0)
    47c8:	fc042a23          	sw	zero,-44(s0)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
    47cc:	f8842603          	lw	a2,-120(s0)
    47d0:	f8c42683          	lw	a3,-116(s0)
    47d4:	f8842503          	lw	a0,-120(s0)
    47d8:	f8c42583          	lw	a1,-116(s0)
    47dc:	ffffd097          	auipc	ra,0xffffd
    47e0:	c08080e7          	jalr	-1016(ra) # 13e4 <__eqdf2>
    47e4:	87aa                	mv	a5,a0
    47e6:	cb85                	beqz	a5,4816 <_ftoa+0x80>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
    47e8:	00042883          	lw	a7,0(s0)
    47ec:	f8042803          	lw	a6,-128(s0)
    47f0:	478d                	li	a5,3
    47f2:	00008737          	lui	a4,0x8
    47f6:	2f870713          	addi	a4,a4,760 # 82f8 <__srodata+0x48>
    47fa:	f9042683          	lw	a3,-112(s0)
    47fe:	f9442603          	lw	a2,-108(s0)
    4802:	f9842583          	lw	a1,-104(s0)
    4806:	f9c42503          	lw	a0,-100(s0)
    480a:	00000097          	auipc	ra,0x0
    480e:	9de080e7          	jalr	-1570(ra) # 41e8 <_out_rev>
    4812:	87aa                	mv	a5,a0
    4814:	a355                	j	4db8 <_ftoa+0x622>
  if (value < -DBL_MAX)
    4816:	000087b7          	lui	a5,0x8
    481a:	3107a603          	lw	a2,784(a5) # 8310 <__srodata+0x60>
    481e:	3147a683          	lw	a3,788(a5)
    4822:	f8842503          	lw	a0,-120(s0)
    4826:	f8c42583          	lw	a1,-116(s0)
    482a:	ffffd097          	auipc	ra,0xffffd
    482e:	cd4080e7          	jalr	-812(ra) # 14fe <__ledf2>
    4832:	87aa                	mv	a5,a0
    4834:	0207d963          	bgez	a5,4866 <_ftoa+0xd0>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
    4838:	00042883          	lw	a7,0(s0)
    483c:	f8042803          	lw	a6,-128(s0)
    4840:	4791                	li	a5,4
    4842:	00008737          	lui	a4,0x8
    4846:	2fc70713          	addi	a4,a4,764 # 82fc <__srodata+0x4c>
    484a:	f9042683          	lw	a3,-112(s0)
    484e:	f9442603          	lw	a2,-108(s0)
    4852:	f9842583          	lw	a1,-104(s0)
    4856:	f9c42503          	lw	a0,-100(s0)
    485a:	00000097          	auipc	ra,0x0
    485e:	98e080e7          	jalr	-1650(ra) # 41e8 <_out_rev>
    4862:	87aa                	mv	a5,a0
    4864:	ab91                	j	4db8 <_ftoa+0x622>
  if (value > DBL_MAX)
    4866:	000087b7          	lui	a5,0x8
    486a:	3187a603          	lw	a2,792(a5) # 8318 <__srodata+0x68>
    486e:	31c7a683          	lw	a3,796(a5)
    4872:	f8842503          	lw	a0,-120(s0)
    4876:	f8c42583          	lw	a1,-116(s0)
    487a:	ffffd097          	auipc	ra,0xffffd
    487e:	bd6080e7          	jalr	-1066(ra) # 1450 <__gedf2>
    4882:	87aa                	mv	a5,a0
    4884:	04f05663          	blez	a5,48d0 <_ftoa+0x13a>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
    4888:	401c                	lw	a5,0(s0)
    488a:	8b91                	andi	a5,a5,4
    488c:	c791                	beqz	a5,4898 <_ftoa+0x102>
    488e:	000087b7          	lui	a5,0x8
    4892:	30478713          	addi	a4,a5,772 # 8304 <__srodata+0x54>
    4896:	a029                	j	48a0 <_ftoa+0x10a>
    4898:	000087b7          	lui	a5,0x8
    489c:	30c78713          	addi	a4,a5,780 # 830c <__srodata+0x5c>
    48a0:	401c                	lw	a5,0(s0)
    48a2:	8b91                	andi	a5,a5,4
    48a4:	c399                	beqz	a5,48aa <_ftoa+0x114>
    48a6:	4791                	li	a5,4
    48a8:	a011                	j	48ac <_ftoa+0x116>
    48aa:	478d                	li	a5,3
    48ac:	00042883          	lw	a7,0(s0)
    48b0:	f8042803          	lw	a6,-128(s0)
    48b4:	f9042683          	lw	a3,-112(s0)
    48b8:	f9442603          	lw	a2,-108(s0)
    48bc:	f9842583          	lw	a1,-104(s0)
    48c0:	f9c42503          	lw	a0,-100(s0)
    48c4:	00000097          	auipc	ra,0x0
    48c8:	924080e7          	jalr	-1756(ra) # 41e8 <_out_rev>
    48cc:	87aa                	mv	a5,a0
    48ce:	a1ed                	j	4db8 <_ftoa+0x622>

  // test for very large values
  // standard printf behavior is to print EVERY whole number digit -- which could be 100s of characters overflowing your buffers == bad
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
    48d0:	000087b7          	lui	a5,0x8
    48d4:	3207a603          	lw	a2,800(a5) # 8320 <__srodata+0x70>
    48d8:	3247a683          	lw	a3,804(a5)
    48dc:	f8842503          	lw	a0,-120(s0)
    48e0:	f8c42583          	lw	a1,-116(s0)
    48e4:	ffffd097          	auipc	ra,0xffffd
    48e8:	b6c080e7          	jalr	-1172(ra) # 1450 <__gedf2>
    48ec:	87aa                	mv	a5,a0
    48ee:	02f04363          	bgtz	a5,4914 <_ftoa+0x17e>
    48f2:	000087b7          	lui	a5,0x8
    48f6:	3287a603          	lw	a2,808(a5) # 8328 <__srodata+0x78>
    48fa:	32c7a683          	lw	a3,812(a5)
    48fe:	f8842503          	lw	a0,-120(s0)
    4902:	f8c42583          	lw	a1,-116(s0)
    4906:	ffffd097          	auipc	ra,0xffffd
    490a:	bf8080e7          	jalr	-1032(ra) # 14fe <__ledf2>
    490e:	87aa                	mv	a5,a0
    4910:	0207da63          	bgez	a5,4944 <_ftoa+0x1ae>
#if defined(PRINTF_SUPPORT_EXPONENTIAL)
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
    4914:	401c                	lw	a5,0(s0)
    4916:	c03e                	sw	a5,0(sp)
    4918:	f8042883          	lw	a7,-128(s0)
    491c:	f8442803          	lw	a6,-124(s0)
    4920:	f8842703          	lw	a4,-120(s0)
    4924:	f8c42783          	lw	a5,-116(s0)
    4928:	f9042683          	lw	a3,-112(s0)
    492c:	f9442603          	lw	a2,-108(s0)
    4930:	f9842583          	lw	a1,-104(s0)
    4934:	f9c42503          	lw	a0,-100(s0)
    4938:	00000097          	auipc	ra,0x0
    493c:	48c080e7          	jalr	1164(ra) # 4dc4 <_etoa>
    4940:	87aa                	mv	a5,a0
    4942:	a99d                	j	4db8 <_ftoa+0x622>
    return 0U;
#endif
  }

  // test for negative
  bool negative = false;
    4944:	fe0405a3          	sb	zero,-21(s0)
  if (value < 0) {
    4948:	4601                	li	a2,0
    494a:	4681                	li	a3,0
    494c:	f8842503          	lw	a0,-120(s0)
    4950:	f8c42583          	lw	a1,-116(s0)
    4954:	ffffd097          	auipc	ra,0xffffd
    4958:	baa080e7          	jalr	-1110(ra) # 14fe <__ledf2>
    495c:	87aa                	mv	a5,a0
    495e:	0207d563          	bgez	a5,4988 <_ftoa+0x1f2>
    negative = true;
    4962:	4785                	li	a5,1
    4964:	fef405a3          	sb	a5,-21(s0)
    value = 0 - value;
    4968:	f8842603          	lw	a2,-120(s0)
    496c:	f8c42683          	lw	a3,-116(s0)
    4970:	4501                	li	a0,0
    4972:	4581                	li	a1,0
    4974:	ffffd097          	auipc	ra,0xffffd
    4978:	08e080e7          	jalr	142(ra) # 1a02 <__subdf3>
    497c:	872a                	mv	a4,a0
    497e:	87ae                	mv	a5,a1
    4980:	f8e42423          	sw	a4,-120(s0)
    4984:	f8f42623          	sw	a5,-116(s0)
  }

  // set default precision, if not set explicitly
  if (!(flags & FLAGS_PRECISION)) {
    4988:	401c                	lw	a5,0(s0)
    498a:	4007f793          	andi	a5,a5,1024
    498e:	e795                	bnez	a5,49ba <_ftoa+0x224>
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    4990:	4799                	li	a5,6
    4992:	f8f42223          	sw	a5,-124(s0)
  }
  // limit precision to 9, cause a prec >= 10 can lead to overflow errors
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    4996:	a015                	j	49ba <_ftoa+0x224>
    buf[len++] = '0';
    4998:	fec42783          	lw	a5,-20(s0)
    499c:	00178713          	addi	a4,a5,1
    49a0:	fee42623          	sw	a4,-20(s0)
    49a4:	fa840713          	addi	a4,s0,-88
    49a8:	03000693          	li	a3,48
    49ac:	00f7568b          	srb	a3,a4,a5,0
    prec--;
    49b0:	f8442783          	lw	a5,-124(s0)
    49b4:	17fd                	addi	a5,a5,-1
    49b6:	f8f42223          	sw	a5,-124(s0)
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    49ba:	fec42703          	lw	a4,-20(s0)
    49be:	47fd                	li	a5,31
    49c0:	00e7e763          	bltu	a5,a4,49ce <_ftoa+0x238>
    49c4:	f8442703          	lw	a4,-124(s0)
    49c8:	47a5                	li	a5,9
    49ca:	fce7e7e3          	bltu	a5,a4,4998 <_ftoa+0x202>
  }

  int whole = (int)value;
    49ce:	f8842503          	lw	a0,-120(s0)
    49d2:	f8c42583          	lw	a1,-116(s0)
    49d6:	ffffd097          	auipc	ra,0xffffd
    49da:	650080e7          	jalr	1616(ra) # 2026 <__fixdfsi>
    49de:	87aa                	mv	a5,a0
    49e0:	fef42223          	sw	a5,-28(s0)
  double tmp = (value - whole) * pow10[prec];
    49e4:	fe442503          	lw	a0,-28(s0)
    49e8:	ffffd097          	auipc	ra,0xffffd
    49ec:	702080e7          	jalr	1794(ra) # 20ea <__floatsidf>
    49f0:	872a                	mv	a4,a0
    49f2:	87ae                	mv	a5,a1
    49f4:	863a                	mv	a2,a4
    49f6:	86be                	mv	a3,a5
    49f8:	f8842503          	lw	a0,-120(s0)
    49fc:	f8c42583          	lw	a1,-116(s0)
    4a00:	ffffd097          	auipc	ra,0xffffd
    4a04:	002080e7          	jalr	2(ra) # 1a02 <__subdf3>
    4a08:	872a                	mv	a4,a0
    4a0a:	87ae                	mv	a5,a1
    4a0c:	853a                	mv	a0,a4
    4a0e:	85be                	mv	a1,a5
    4a10:	000087b7          	lui	a5,0x8
    4a14:	7f078713          	addi	a4,a5,2032 # 87f0 <pow10.0>
    4a18:	f8442783          	lw	a5,-124(s0)
    4a1c:	078e                	slli	a5,a5,0x3
    4a1e:	97ba                	add	a5,a5,a4
    4a20:	4398                	lw	a4,0(a5)
    4a22:	43dc                	lw	a5,4(a5)
    4a24:	863a                	mv	a2,a4
    4a26:	86be                	mv	a3,a5
    4a28:	ffffd097          	auipc	ra,0xffffd
    4a2c:	b84080e7          	jalr	-1148(ra) # 15ac <__muldf3>
    4a30:	872a                	mv	a4,a0
    4a32:	87ae                	mv	a5,a1
    4a34:	fce42423          	sw	a4,-56(s0)
    4a38:	fcf42623          	sw	a5,-52(s0)
  unsigned long frac = (unsigned long)tmp;
    4a3c:	fc842503          	lw	a0,-56(s0)
    4a40:	fcc42583          	lw	a1,-52(s0)
    4a44:	ffffd097          	auipc	ra,0xffffd
    4a48:	646080e7          	jalr	1606(ra) # 208a <__fixunsdfsi>
    4a4c:	87aa                	mv	a5,a0
    4a4e:	fef42023          	sw	a5,-32(s0)
  diff = tmp - frac;
    4a52:	fe042503          	lw	a0,-32(s0)
    4a56:	ffffd097          	auipc	ra,0xffffd
    4a5a:	700080e7          	jalr	1792(ra) # 2156 <__floatunsidf>
    4a5e:	872a                	mv	a4,a0
    4a60:	87ae                	mv	a5,a1
    4a62:	863a                	mv	a2,a4
    4a64:	86be                	mv	a3,a5
    4a66:	fc842503          	lw	a0,-56(s0)
    4a6a:	fcc42583          	lw	a1,-52(s0)
    4a6e:	ffffd097          	auipc	ra,0xffffd
    4a72:	f94080e7          	jalr	-108(ra) # 1a02 <__subdf3>
    4a76:	872a                	mv	a4,a0
    4a78:	87ae                	mv	a5,a1
    4a7a:	fce42823          	sw	a4,-48(s0)
    4a7e:	fcf42a23          	sw	a5,-44(s0)

  if (diff > 0.5) {
    4a82:	000087b7          	lui	a5,0x8
    4a86:	3307a603          	lw	a2,816(a5) # 8330 <__srodata+0x80>
    4a8a:	3347a683          	lw	a3,820(a5)
    4a8e:	fd042503          	lw	a0,-48(s0)
    4a92:	fd442583          	lw	a1,-44(s0)
    4a96:	ffffd097          	auipc	ra,0xffffd
    4a9a:	9ba080e7          	jalr	-1606(ra) # 1450 <__gedf2>
    4a9e:	87aa                	mv	a5,a0
    4aa0:	04f05863          	blez	a5,4af0 <_ftoa+0x35a>
    ++frac;
    4aa4:	fe042783          	lw	a5,-32(s0)
    4aa8:	0785                	addi	a5,a5,1
    4aaa:	fef42023          	sw	a5,-32(s0)
    // handle rollover, e.g. case 0.99 with prec 1 is 1.0
    if (frac >= pow10[prec]) {
    4aae:	fe042503          	lw	a0,-32(s0)
    4ab2:	ffffd097          	auipc	ra,0xffffd
    4ab6:	6a4080e7          	jalr	1700(ra) # 2156 <__floatunsidf>
    4aba:	000087b7          	lui	a5,0x8
    4abe:	7f078713          	addi	a4,a5,2032 # 87f0 <pow10.0>
    4ac2:	f8442783          	lw	a5,-124(s0)
    4ac6:	078e                	slli	a5,a5,0x3
    4ac8:	97ba                	add	a5,a5,a4
    4aca:	4398                	lw	a4,0(a5)
    4acc:	43dc                	lw	a5,4(a5)
    4ace:	863a                	mv	a2,a4
    4ad0:	86be                	mv	a3,a5
    4ad2:	ffffd097          	auipc	ra,0xffffd
    4ad6:	97e080e7          	jalr	-1666(ra) # 1450 <__gedf2>
    4ada:	87aa                	mv	a5,a0
    4adc:	0407c763          	bltz	a5,4b2a <_ftoa+0x394>
      frac = 0;
    4ae0:	fe042023          	sw	zero,-32(s0)
      ++whole;
    4ae4:	fe442783          	lw	a5,-28(s0)
    4ae8:	0785                	addi	a5,a5,1
    4aea:	fef42223          	sw	a5,-28(s0)
    4aee:	a835                	j	4b2a <_ftoa+0x394>
    }
  }
  else if (diff < 0.5) {
    4af0:	000087b7          	lui	a5,0x8
    4af4:	3307a603          	lw	a2,816(a5) # 8330 <__srodata+0x80>
    4af8:	3347a683          	lw	a3,820(a5)
    4afc:	fd042503          	lw	a0,-48(s0)
    4b00:	fd442583          	lw	a1,-44(s0)
    4b04:	ffffd097          	auipc	ra,0xffffd
    4b08:	9fa080e7          	jalr	-1542(ra) # 14fe <__ledf2>
    4b0c:	87aa                	mv	a5,a0
    4b0e:	0007ce63          	bltz	a5,4b2a <_ftoa+0x394>
  }
  else if ((frac == 0U) || (frac & 1U)) {
    4b12:	fe042783          	lw	a5,-32(s0)
    4b16:	c789                	beqz	a5,4b20 <_ftoa+0x38a>
    4b18:	fe042783          	lw	a5,-32(s0)
    4b1c:	8b85                	andi	a5,a5,1
    4b1e:	c791                	beqz	a5,4b2a <_ftoa+0x394>
    // if halfway, round up if odd OR if last digit is 0
    ++frac;
    4b20:	fe042783          	lw	a5,-32(s0)
    4b24:	0785                	addi	a5,a5,1
    4b26:	fef42023          	sw	a5,-32(s0)
  }

  if (prec == 0U) {
    4b2a:	f8442783          	lw	a5,-124(s0)
    4b2e:	efd9                	bnez	a5,4bcc <_ftoa+0x436>
    diff = value - (double)whole;
    4b30:	fe442503          	lw	a0,-28(s0)
    4b34:	ffffd097          	auipc	ra,0xffffd
    4b38:	5b6080e7          	jalr	1462(ra) # 20ea <__floatsidf>
    4b3c:	872a                	mv	a4,a0
    4b3e:	87ae                	mv	a5,a1
    4b40:	863a                	mv	a2,a4
    4b42:	86be                	mv	a3,a5
    4b44:	f8842503          	lw	a0,-120(s0)
    4b48:	f8c42583          	lw	a1,-116(s0)
    4b4c:	ffffd097          	auipc	ra,0xffffd
    4b50:	eb6080e7          	jalr	-330(ra) # 1a02 <__subdf3>
    4b54:	872a                	mv	a4,a0
    4b56:	87ae                	mv	a5,a1
    4b58:	fce42823          	sw	a4,-48(s0)
    4b5c:	fcf42a23          	sw	a5,-44(s0)
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    4b60:	4485                	li	s1,1
    4b62:	000087b7          	lui	a5,0x8
    4b66:	3307a603          	lw	a2,816(a5) # 8330 <__srodata+0x80>
    4b6a:	3347a683          	lw	a3,820(a5)
    4b6e:	fd042503          	lw	a0,-48(s0)
    4b72:	fd442583          	lw	a1,-44(s0)
    4b76:	ffffd097          	auipc	ra,0xffffd
    4b7a:	988080e7          	jalr	-1656(ra) # 14fe <__ledf2>
    4b7e:	87aa                	mv	a5,a0
    4b80:	0007c363          	bltz	a5,4b86 <_ftoa+0x3f0>
    4b84:	4481                	li	s1,0
    4b86:	0ff4f793          	andi	a5,s1,255
    4b8a:	0017c793          	xori	a5,a5,1
    4b8e:	0ff7f793          	andi	a5,a5,255
    4b92:	e395                	bnez	a5,4bb6 <_ftoa+0x420>
    4b94:	000087b7          	lui	a5,0x8
    4b98:	3307a603          	lw	a2,816(a5) # 8330 <__srodata+0x80>
    4b9c:	3347a683          	lw	a3,820(a5)
    4ba0:	fd042503          	lw	a0,-48(s0)
    4ba4:	fd442583          	lw	a1,-44(s0)
    4ba8:	ffffd097          	auipc	ra,0xffffd
    4bac:	8a8080e7          	jalr	-1880(ra) # 1450 <__gedf2>
    4bb0:	87aa                	mv	a5,a0
    4bb2:	0cf05763          	blez	a5,4c80 <_ftoa+0x4ea>
    4bb6:	fe442783          	lw	a5,-28(s0)
    4bba:	8b85                	andi	a5,a5,1
    4bbc:	10078263          	beqz	a5,4cc0 <_ftoa+0x52a>
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++whole;
    4bc0:	fe442783          	lw	a5,-28(s0)
    4bc4:	0785                	addi	a5,a5,1
    4bc6:	fef42223          	sw	a5,-28(s0)
    4bca:	a8dd                	j	4cc0 <_ftoa+0x52a>
    }
  }
  else {
    unsigned int count = prec;
    4bcc:	f8442783          	lw	a5,-124(s0)
    4bd0:	fcf42e23          	sw	a5,-36(s0)
    // now do fractional part, as an unsigned number
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
    4bd4:	a0a9                	j	4c1e <_ftoa+0x488>
      --count;
    4bd6:	fdc42783          	lw	a5,-36(s0)
    4bda:	17fd                	addi	a5,a5,-1
    4bdc:	fcf42e23          	sw	a5,-36(s0)
      buf[len++] = (char)(48U + (frac % 10U));
    4be0:	fe042703          	lw	a4,-32(s0)
    4be4:	47a9                	li	a5,10
    4be6:	02f777b3          	remu	a5,a4,a5
    4bea:	0ff7f713          	andi	a4,a5,255
    4bee:	fec42783          	lw	a5,-20(s0)
    4bf2:	00178693          	addi	a3,a5,1
    4bf6:	fed42623          	sw	a3,-20(s0)
    4bfa:	03070713          	addi	a4,a4,48
    4bfe:	0ff77693          	andi	a3,a4,255
    4c02:	fa840713          	addi	a4,s0,-88
    4c06:	00f7568b          	srb	a3,a4,a5,0
      if (!(frac /= 10U)) {
    4c0a:	fe042703          	lw	a4,-32(s0)
    4c0e:	47a9                	li	a5,10
    4c10:	02f757b3          	divu	a5,a4,a5
    4c14:	fef42023          	sw	a5,-32(s0)
    4c18:	fe042783          	lw	a5,-32(s0)
    4c1c:	c799                	beqz	a5,4c2a <_ftoa+0x494>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
    4c1e:	fec42703          	lw	a4,-20(s0)
    4c22:	47fd                	li	a5,31
    4c24:	fae7f9e3          	bgeu	a5,a4,4bd6 <_ftoa+0x440>
    4c28:	a839                	j	4c46 <_ftoa+0x4b0>
        break;
    4c2a:	0001                	nop
      }
    }
    // add extra 0s
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    4c2c:	a829                	j	4c46 <_ftoa+0x4b0>
      buf[len++] = '0';
    4c2e:	fec42783          	lw	a5,-20(s0)
    4c32:	00178713          	addi	a4,a5,1
    4c36:	fee42623          	sw	a4,-20(s0)
    4c3a:	fa840713          	addi	a4,s0,-88
    4c3e:	03000693          	li	a3,48
    4c42:	00f7568b          	srb	a3,a4,a5,0
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    4c46:	fec42703          	lw	a4,-20(s0)
    4c4a:	47fd                	li	a5,31
    4c4c:	00e7e963          	bltu	a5,a4,4c5e <_ftoa+0x4c8>
    4c50:	fdc42783          	lw	a5,-36(s0)
    4c54:	fff78713          	addi	a4,a5,-1
    4c58:	fce42e23          	sw	a4,-36(s0)
    4c5c:	fbe9                	bnez	a5,4c2e <_ftoa+0x498>
    }
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
    4c5e:	fec42703          	lw	a4,-20(s0)
    4c62:	47fd                	li	a5,31
    4c64:	04e7ee63          	bltu	a5,a4,4cc0 <_ftoa+0x52a>
      // add decimal
      buf[len++] = '.';
    4c68:	fec42783          	lw	a5,-20(s0)
    4c6c:	00178713          	addi	a4,a5,1
    4c70:	fee42623          	sw	a4,-20(s0)
    4c74:	fa840713          	addi	a4,s0,-88
    4c78:	02e00693          	li	a3,46
    4c7c:	00f7568b          	srb	a3,a4,a5,0
    }
  }

  // do whole part, number is reversed
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
    4c80:	a081                	j	4cc0 <_ftoa+0x52a>
    buf[len++] = (char)(48 + (whole % 10));
    4c82:	fe442703          	lw	a4,-28(s0)
    4c86:	47a9                	li	a5,10
    4c88:	02f767b3          	rem	a5,a4,a5
    4c8c:	0ff7f713          	andi	a4,a5,255
    4c90:	fec42783          	lw	a5,-20(s0)
    4c94:	00178693          	addi	a3,a5,1
    4c98:	fed42623          	sw	a3,-20(s0)
    4c9c:	03070713          	addi	a4,a4,48
    4ca0:	0ff77693          	andi	a3,a4,255
    4ca4:	fa840713          	addi	a4,s0,-88
    4ca8:	00f7568b          	srb	a3,a4,a5,0
    if (!(whole /= 10)) {
    4cac:	fe442703          	lw	a4,-28(s0)
    4cb0:	47a9                	li	a5,10
    4cb2:	02f747b3          	div	a5,a4,a5
    4cb6:	fef42223          	sw	a5,-28(s0)
    4cba:	fe442783          	lw	a5,-28(s0)
    4cbe:	c799                	beqz	a5,4ccc <_ftoa+0x536>
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
    4cc0:	fec42703          	lw	a4,-20(s0)
    4cc4:	47fd                	li	a5,31
    4cc6:	fae7fee3          	bgeu	a5,a4,4c82 <_ftoa+0x4ec>
    4cca:	a011                	j	4cce <_ftoa+0x538>
      break;
    4ccc:	0001                	nop
    }
  }

  // pad leading zeros
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
    4cce:	401c                	lw	a5,0(s0)
    4cd0:	8b89                	andi	a5,a5,2
    4cd2:	ebb1                	bnez	a5,4d26 <_ftoa+0x590>
    4cd4:	401c                	lw	a5,0(s0)
    4cd6:	8b85                	andi	a5,a5,1
    4cd8:	c7b9                	beqz	a5,4d26 <_ftoa+0x590>
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    4cda:	f8042783          	lw	a5,-128(s0)
    4cde:	cb8d                	beqz	a5,4d10 <_ftoa+0x57a>
    4ce0:	feb44783          	lbu	a5,-21(s0)
    4ce4:	e781                	bnez	a5,4cec <_ftoa+0x556>
    4ce6:	401c                	lw	a5,0(s0)
    4ce8:	8bb1                	andi	a5,a5,12
    4cea:	c39d                	beqz	a5,4d10 <_ftoa+0x57a>
      width--;
    4cec:	f8042783          	lw	a5,-128(s0)
    4cf0:	17fd                	addi	a5,a5,-1
    4cf2:	f8f42023          	sw	a5,-128(s0)
    }
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    4cf6:	a829                	j	4d10 <_ftoa+0x57a>
      buf[len++] = '0';
    4cf8:	fec42783          	lw	a5,-20(s0)
    4cfc:	00178713          	addi	a4,a5,1
    4d00:	fee42623          	sw	a4,-20(s0)
    4d04:	fa840713          	addi	a4,s0,-88
    4d08:	03000693          	li	a3,48
    4d0c:	00f7568b          	srb	a3,a4,a5,0
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    4d10:	fec42703          	lw	a4,-20(s0)
    4d14:	f8042783          	lw	a5,-128(s0)
    4d18:	00f77763          	bgeu	a4,a5,4d26 <_ftoa+0x590>
    4d1c:	fec42703          	lw	a4,-20(s0)
    4d20:	47fd                	li	a5,31
    4d22:	fce7fbe3          	bgeu	a5,a4,4cf8 <_ftoa+0x562>
    }
  }

  if (len < PRINTF_FTOA_BUFFER_SIZE) {
    4d26:	fec42703          	lw	a4,-20(s0)
    4d2a:	47fd                	li	a5,31
    4d2c:	06e7e163          	bltu	a5,a4,4d8e <_ftoa+0x5f8>
    if (negative) {
    4d30:	feb44783          	lbu	a5,-21(s0)
    4d34:	cf91                	beqz	a5,4d50 <_ftoa+0x5ba>
      buf[len++] = '-';
    4d36:	fec42783          	lw	a5,-20(s0)
    4d3a:	00178713          	addi	a4,a5,1
    4d3e:	fee42623          	sw	a4,-20(s0)
    4d42:	fa840713          	addi	a4,s0,-88
    4d46:	02d00693          	li	a3,45
    4d4a:	00f7568b          	srb	a3,a4,a5,0
    4d4e:	a081                	j	4d8e <_ftoa+0x5f8>
    }
    else if (flags & FLAGS_PLUS) {
    4d50:	401c                	lw	a5,0(s0)
    4d52:	8b91                	andi	a5,a5,4
    4d54:	cf91                	beqz	a5,4d70 <_ftoa+0x5da>
      buf[len++] = '+';  // ignore the space if the '+' exists
    4d56:	fec42783          	lw	a5,-20(s0)
    4d5a:	00178713          	addi	a4,a5,1
    4d5e:	fee42623          	sw	a4,-20(s0)
    4d62:	fa840713          	addi	a4,s0,-88
    4d66:	02b00693          	li	a3,43
    4d6a:	00f7568b          	srb	a3,a4,a5,0
    4d6e:	a005                	j	4d8e <_ftoa+0x5f8>
    }
    else if (flags & FLAGS_SPACE) {
    4d70:	401c                	lw	a5,0(s0)
    4d72:	8ba1                	andi	a5,a5,8
    4d74:	cf89                	beqz	a5,4d8e <_ftoa+0x5f8>
      buf[len++] = ' ';
    4d76:	fec42783          	lw	a5,-20(s0)
    4d7a:	00178713          	addi	a4,a5,1
    4d7e:	fee42623          	sw	a4,-20(s0)
    4d82:	fa840713          	addi	a4,s0,-88
    4d86:	02000693          	li	a3,32
    4d8a:	00f7568b          	srb	a3,a4,a5,0
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    4d8e:	fa840713          	addi	a4,s0,-88
    4d92:	00042883          	lw	a7,0(s0)
    4d96:	f8042803          	lw	a6,-128(s0)
    4d9a:	fec42783          	lw	a5,-20(s0)
    4d9e:	f9042683          	lw	a3,-112(s0)
    4da2:	f9442603          	lw	a2,-108(s0)
    4da6:	f9842583          	lw	a1,-104(s0)
    4daa:	f9c42503          	lw	a0,-100(s0)
    4dae:	fffff097          	auipc	ra,0xfffff
    4db2:	43a080e7          	jalr	1082(ra) # 41e8 <_out_rev>
    4db6:	87aa                	mv	a5,a0
}
    4db8:	853e                	mv	a0,a5
    4dba:	40ba                	lw	ra,140(sp)
    4dbc:	442a                	lw	s0,136(sp)
    4dbe:	449a                	lw	s1,132(sp)
    4dc0:	6149                	addi	sp,sp,144
    4dc2:	8082                	ret

00004dc4 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
    4dc4:	7131                	addi	sp,sp,-192
    4dc6:	df06                	sw	ra,188(sp)
    4dc8:	dd22                	sw	s0,184(sp)
    4dca:	db26                	sw	s1,180(sp)
    4dcc:	d94a                	sw	s2,176(sp)
    4dce:	d74e                	sw	s3,172(sp)
    4dd0:	d552                	sw	s4,168(sp)
    4dd2:	d356                	sw	s5,164(sp)
    4dd4:	d15a                	sw	s6,160(sp)
    4dd6:	cf5e                	sw	s7,156(sp)
    4dd8:	cd62                	sw	s8,152(sp)
    4dda:	cb66                	sw	s9,148(sp)
    4ddc:	c96a                	sw	s10,144(sp)
    4dde:	c76e                	sw	s11,140(sp)
    4de0:	0180                	addi	s0,sp,192
    4de2:	f6a42e23          	sw	a0,-132(s0)
    4de6:	f6b42c23          	sw	a1,-136(s0)
    4dea:	f6c42a23          	sw	a2,-140(s0)
    4dee:	f6d42823          	sw	a3,-144(s0)
    4df2:	f6e42423          	sw	a4,-152(s0)
    4df6:	f6f42623          	sw	a5,-148(s0)
    4dfa:	f7042223          	sw	a6,-156(s0)
    4dfe:	f7142023          	sw	a7,-160(s0)
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
    4e02:	f6842603          	lw	a2,-152(s0)
    4e06:	f6c42683          	lw	a3,-148(s0)
    4e0a:	f6842503          	lw	a0,-152(s0)
    4e0e:	f6c42583          	lw	a1,-148(s0)
    4e12:	ffffc097          	auipc	ra,0xffffc
    4e16:	5d2080e7          	jalr	1490(ra) # 13e4 <__eqdf2>
    4e1a:	87aa                	mv	a5,a0
    4e1c:	e3b9                	bnez	a5,4e62 <_etoa+0x9e>
    4e1e:	000087b7          	lui	a5,0x8
    4e22:	3187a603          	lw	a2,792(a5) # 8318 <__srodata+0x68>
    4e26:	31c7a683          	lw	a3,796(a5)
    4e2a:	f6842503          	lw	a0,-152(s0)
    4e2e:	f6c42583          	lw	a1,-148(s0)
    4e32:	ffffc097          	auipc	ra,0xffffc
    4e36:	61e080e7          	jalr	1566(ra) # 1450 <__gedf2>
    4e3a:	87aa                	mv	a5,a0
    4e3c:	02f04363          	bgtz	a5,4e62 <_etoa+0x9e>
    4e40:	000087b7          	lui	a5,0x8
    4e44:	3107a603          	lw	a2,784(a5) # 8310 <__srodata+0x60>
    4e48:	3147a683          	lw	a3,788(a5)
    4e4c:	f6842503          	lw	a0,-152(s0)
    4e50:	f6c42583          	lw	a1,-148(s0)
    4e54:	ffffc097          	auipc	ra,0xffffc
    4e58:	6aa080e7          	jalr	1706(ra) # 14fe <__ledf2>
    4e5c:	87aa                	mv	a5,a0
    4e5e:	0207da63          	bgez	a5,4e92 <_etoa+0xce>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    4e62:	401c                	lw	a5,0(s0)
    4e64:	c03e                	sw	a5,0(sp)
    4e66:	f6042883          	lw	a7,-160(s0)
    4e6a:	f6442803          	lw	a6,-156(s0)
    4e6e:	f6842703          	lw	a4,-152(s0)
    4e72:	f6c42783          	lw	a5,-148(s0)
    4e76:	f7042683          	lw	a3,-144(s0)
    4e7a:	f7442603          	lw	a2,-140(s0)
    4e7e:	f7842583          	lw	a1,-136(s0)
    4e82:	f7c42503          	lw	a0,-132(s0)
    4e86:	00000097          	auipc	ra,0x0
    4e8a:	910080e7          	jalr	-1776(ra) # 4796 <_ftoa>
    4e8e:	87aa                	mv	a5,a0
    4e90:	a581                	j	54d0 <_etoa+0x70c>
  }

  // determine the sign
  const bool negative = value < 0;
    4e92:	4485                	li	s1,1
    4e94:	4601                	li	a2,0
    4e96:	4681                	li	a3,0
    4e98:	f6842503          	lw	a0,-152(s0)
    4e9c:	f6c42583          	lw	a1,-148(s0)
    4ea0:	ffffc097          	auipc	ra,0xffffc
    4ea4:	65e080e7          	jalr	1630(ra) # 14fe <__ledf2>
    4ea8:	87aa                	mv	a5,a0
    4eaa:	0007c363          	bltz	a5,4eb0 <_etoa+0xec>
    4eae:	4481                	li	s1,0
    4eb0:	fa9409a3          	sb	s1,-77(s0)
  if (negative) {
    4eb4:	fb344783          	lbu	a5,-77(s0)
    4eb8:	cf81                	beqz	a5,4ed0 <_etoa+0x10c>
    value = -value;
    4eba:	f6842783          	lw	a5,-152(s0)
    4ebe:	f6f42423          	sw	a5,-152(s0)
    4ec2:	f6c42703          	lw	a4,-148(s0)
    4ec6:	800007b7          	lui	a5,0x80000
    4eca:	8fb9                	xor	a5,a5,a4
    4ecc:	f6f42623          	sw	a5,-148(s0)
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
    4ed0:	401c                	lw	a5,0(s0)
    4ed2:	4007f793          	andi	a5,a5,1024
    4ed6:	e781                	bnez	a5,4ede <_etoa+0x11a>
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    4ed8:	4799                	li	a5,6
    4eda:	f6f42223          	sw	a5,-156(s0)
  union {
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
    4ede:	f6842703          	lw	a4,-152(s0)
    4ee2:	f6c42783          	lw	a5,-148(s0)
    4ee6:	f8e42423          	sw	a4,-120(s0)
    4eea:	f8f42623          	sw	a5,-116(s0)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
    4eee:	f8842703          	lw	a4,-120(s0)
    4ef2:	f8c42783          	lw	a5,-116(s0)
    4ef6:	83d1                	srli	a5,a5,0x14
    4ef8:	f4f42c23          	sw	a5,-168(s0)
    4efc:	f4042e23          	sw	zero,-164(s0)
    4f00:	f5842783          	lw	a5,-168(s0)
    4f04:	7ff7f793          	andi	a5,a5,2047
    4f08:	c0178793          	addi	a5,a5,-1023 # 7ffffc01 <__heap_end+0x5ffdfc01>
    4f0c:	faf42623          	sw	a5,-84(s0)
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
    4f10:	f8842703          	lw	a4,-120(s0)
    4f14:	f8c42783          	lw	a5,-116(s0)
    4f18:	fff77913          	andi	s2,a4,-1
    4f1c:	001006b7          	lui	a3,0x100
    4f20:	16fd                	addi	a3,a3,-1
    4f22:	00d7f9b3          	and	s3,a5,a3
    4f26:	00096b13          	ori	s6,s2,0
    4f2a:	3ff007b7          	lui	a5,0x3ff00
    4f2e:	00f9ebb3          	or	s7,s3,a5
    4f32:	f9642423          	sw	s6,-120(s0)
    4f36:	f9742623          	sw	s7,-116(s0)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    4f3a:	fac42503          	lw	a0,-84(s0)
    4f3e:	ffffd097          	auipc	ra,0xffffd
    4f42:	1ac080e7          	jalr	428(ra) # 20ea <__floatsidf>
    4f46:	872a                	mv	a4,a0
    4f48:	87ae                	mv	a5,a1
    4f4a:	000086b7          	lui	a3,0x8
    4f4e:	3386a603          	lw	a2,824(a3) # 8338 <__srodata+0x88>
    4f52:	33c6a683          	lw	a3,828(a3)
    4f56:	853a                	mv	a0,a4
    4f58:	85be                	mv	a1,a5
    4f5a:	ffffc097          	auipc	ra,0xffffc
    4f5e:	652080e7          	jalr	1618(ra) # 15ac <__muldf3>
    4f62:	872a                	mv	a4,a0
    4f64:	87ae                	mv	a5,a1
    4f66:	853a                	mv	a0,a4
    4f68:	85be                	mv	a1,a5
    4f6a:	000087b7          	lui	a5,0x8
    4f6e:	3407a603          	lw	a2,832(a5) # 8340 <__srodata+0x90>
    4f72:	3447a683          	lw	a3,836(a5)
    4f76:	ffffc097          	auipc	ra,0xffffc
    4f7a:	908080e7          	jalr	-1784(ra) # 87e <__adddf3>
    4f7e:	872a                	mv	a4,a0
    4f80:	87ae                	mv	a5,a1
    4f82:	893a                	mv	s2,a4
    4f84:	89be                	mv	s3,a5
    4f86:	f8842703          	lw	a4,-120(s0)
    4f8a:	f8c42783          	lw	a5,-116(s0)
    4f8e:	000086b7          	lui	a3,0x8
    4f92:	3486a603          	lw	a2,840(a3) # 8348 <__srodata+0x98>
    4f96:	34c6a683          	lw	a3,844(a3)
    4f9a:	853a                	mv	a0,a4
    4f9c:	85be                	mv	a1,a5
    4f9e:	ffffd097          	auipc	ra,0xffffd
    4fa2:	a64080e7          	jalr	-1436(ra) # 1a02 <__subdf3>
    4fa6:	872a                	mv	a4,a0
    4fa8:	87ae                	mv	a5,a1
    4faa:	853a                	mv	a0,a4
    4fac:	85be                	mv	a1,a5
    4fae:	000087b7          	lui	a5,0x8
    4fb2:	3507a603          	lw	a2,848(a5) # 8350 <__srodata+0xa0>
    4fb6:	3547a683          	lw	a3,852(a5)
    4fba:	ffffc097          	auipc	ra,0xffffc
    4fbe:	5f2080e7          	jalr	1522(ra) # 15ac <__muldf3>
    4fc2:	872a                	mv	a4,a0
    4fc4:	87ae                	mv	a5,a1
    4fc6:	863a                	mv	a2,a4
    4fc8:	86be                	mv	a3,a5
    4fca:	854a                	mv	a0,s2
    4fcc:	85ce                	mv	a1,s3
    4fce:	ffffc097          	auipc	ra,0xffffc
    4fd2:	8b0080e7          	jalr	-1872(ra) # 87e <__adddf3>
    4fd6:	872a                	mv	a4,a0
    4fd8:	87ae                	mv	a5,a1
    4fda:	853a                	mv	a0,a4
    4fdc:	85be                	mv	a1,a5
    4fde:	ffffd097          	auipc	ra,0xffffd
    4fe2:	048080e7          	jalr	72(ra) # 2026 <__fixdfsi>
    4fe6:	87aa                	mv	a5,a0
    4fe8:	faf42e23          	sw	a5,-68(s0)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
    4fec:	fbc42503          	lw	a0,-68(s0)
    4ff0:	ffffd097          	auipc	ra,0xffffd
    4ff4:	0fa080e7          	jalr	250(ra) # 20ea <__floatsidf>
    4ff8:	872a                	mv	a4,a0
    4ffa:	87ae                	mv	a5,a1
    4ffc:	000086b7          	lui	a3,0x8
    5000:	3586a603          	lw	a2,856(a3) # 8358 <__srodata+0xa8>
    5004:	35c6a683          	lw	a3,860(a3)
    5008:	853a                	mv	a0,a4
    500a:	85be                	mv	a1,a5
    500c:	ffffc097          	auipc	ra,0xffffc
    5010:	5a0080e7          	jalr	1440(ra) # 15ac <__muldf3>
    5014:	872a                	mv	a4,a0
    5016:	87ae                	mv	a5,a1
    5018:	853a                	mv	a0,a4
    501a:	85be                	mv	a1,a5
    501c:	000087b7          	lui	a5,0x8
    5020:	3307a603          	lw	a2,816(a5) # 8330 <__srodata+0x80>
    5024:	3347a683          	lw	a3,820(a5)
    5028:	ffffc097          	auipc	ra,0xffffc
    502c:	856080e7          	jalr	-1962(ra) # 87e <__adddf3>
    5030:	872a                	mv	a4,a0
    5032:	87ae                	mv	a5,a1
    5034:	853a                	mv	a0,a4
    5036:	85be                	mv	a1,a5
    5038:	ffffd097          	auipc	ra,0xffffd
    503c:	fee080e7          	jalr	-18(ra) # 2026 <__fixdfsi>
    5040:	87aa                	mv	a5,a0
    5042:	faf42623          	sw	a5,-84(s0)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    5046:	fbc42503          	lw	a0,-68(s0)
    504a:	ffffd097          	auipc	ra,0xffffd
    504e:	0a0080e7          	jalr	160(ra) # 20ea <__floatsidf>
    5052:	872a                	mv	a4,a0
    5054:	87ae                	mv	a5,a1
    5056:	000086b7          	lui	a3,0x8
    505a:	3606a603          	lw	a2,864(a3) # 8360 <__srodata+0xb0>
    505e:	3646a683          	lw	a3,868(a3)
    5062:	853a                	mv	a0,a4
    5064:	85be                	mv	a1,a5
    5066:	ffffc097          	auipc	ra,0xffffc
    506a:	546080e7          	jalr	1350(ra) # 15ac <__muldf3>
    506e:	872a                	mv	a4,a0
    5070:	87ae                	mv	a5,a1
    5072:	893a                	mv	s2,a4
    5074:	89be                	mv	s3,a5
    5076:	fac42503          	lw	a0,-84(s0)
    507a:	ffffd097          	auipc	ra,0xffffd
    507e:	070080e7          	jalr	112(ra) # 20ea <__floatsidf>
    5082:	872a                	mv	a4,a0
    5084:	87ae                	mv	a5,a1
    5086:	000086b7          	lui	a3,0x8
    508a:	3686a603          	lw	a2,872(a3) # 8368 <__srodata+0xb8>
    508e:	36c6a683          	lw	a3,876(a3)
    5092:	853a                	mv	a0,a4
    5094:	85be                	mv	a1,a5
    5096:	ffffc097          	auipc	ra,0xffffc
    509a:	516080e7          	jalr	1302(ra) # 15ac <__muldf3>
    509e:	872a                	mv	a4,a0
    50a0:	87ae                	mv	a5,a1
    50a2:	863a                	mv	a2,a4
    50a4:	86be                	mv	a3,a5
    50a6:	854a                	mv	a0,s2
    50a8:	85ce                	mv	a1,s3
    50aa:	ffffd097          	auipc	ra,0xffffd
    50ae:	958080e7          	jalr	-1704(ra) # 1a02 <__subdf3>
    50b2:	872a                	mv	a4,a0
    50b4:	87ae                	mv	a5,a1
    50b6:	fae42023          	sw	a4,-96(s0)
    50ba:	faf42223          	sw	a5,-92(s0)
  const double z2 = z * z;
    50be:	fa042603          	lw	a2,-96(s0)
    50c2:	fa442683          	lw	a3,-92(s0)
    50c6:	fa042503          	lw	a0,-96(s0)
    50ca:	fa442583          	lw	a1,-92(s0)
    50ce:	ffffc097          	auipc	ra,0xffffc
    50d2:	4de080e7          	jalr	1246(ra) # 15ac <__muldf3>
    50d6:	872a                	mv	a4,a0
    50d8:	87ae                	mv	a5,a1
    50da:	f8e42c23          	sw	a4,-104(s0)
    50de:	f8f42e23          	sw	a5,-100(s0)
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
    50e2:	fac42783          	lw	a5,-84(s0)
    50e6:	3ff78793          	addi	a5,a5,1023
    50ea:	8d3e                	mv	s10,a5
    50ec:	87fd                	srai	a5,a5,0x1f
    50ee:	8dbe                	mv	s11,a5
    50f0:	014d1c93          	slli	s9,s10,0x14
    50f4:	4c01                	li	s8,0
    50f6:	f9842423          	sw	s8,-120(s0)
    50fa:	f9942623          	sw	s9,-116(s0)
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
    50fe:	f8842903          	lw	s2,-120(s0)
    5102:	f8c42983          	lw	s3,-116(s0)
    5106:	fa042703          	lw	a4,-96(s0)
    510a:	fa442783          	lw	a5,-92(s0)
    510e:	863a                	mv	a2,a4
    5110:	86be                	mv	a3,a5
    5112:	853a                	mv	a0,a4
    5114:	85be                	mv	a1,a5
    5116:	ffffb097          	auipc	ra,0xffffb
    511a:	768080e7          	jalr	1896(ra) # 87e <__adddf3>
    511e:	872a                	mv	a4,a0
    5120:	87ae                	mv	a5,a1
    5122:	8b3a                	mv	s6,a4
    5124:	8bbe                	mv	s7,a5
    5126:	000087b7          	lui	a5,0x8
    512a:	fa042603          	lw	a2,-96(s0)
    512e:	fa442683          	lw	a3,-92(s0)
    5132:	3707a503          	lw	a0,880(a5) # 8370 <__srodata+0xc0>
    5136:	3747a583          	lw	a1,884(a5)
    513a:	ffffd097          	auipc	ra,0xffffd
    513e:	8c8080e7          	jalr	-1848(ra) # 1a02 <__subdf3>
    5142:	872a                	mv	a4,a0
    5144:	87ae                	mv	a5,a1
    5146:	8c3a                	mv	s8,a4
    5148:	8cbe                	mv	s9,a5
    514a:	000087b7          	lui	a5,0x8
    514e:	3787a603          	lw	a2,888(a5) # 8378 <__srodata+0xc8>
    5152:	37c7a683          	lw	a3,892(a5)
    5156:	f9842503          	lw	a0,-104(s0)
    515a:	f9c42583          	lw	a1,-100(s0)
    515e:	ffffc097          	auipc	ra,0xffffc
    5162:	d32080e7          	jalr	-718(ra) # e90 <__divdf3>
    5166:	872a                	mv	a4,a0
    5168:	87ae                	mv	a5,a1
    516a:	853a                	mv	a0,a4
    516c:	85be                	mv	a1,a5
    516e:	000087b7          	lui	a5,0x8
    5172:	3807a603          	lw	a2,896(a5) # 8380 <__srodata+0xd0>
    5176:	3847a683          	lw	a3,900(a5)
    517a:	ffffb097          	auipc	ra,0xffffb
    517e:	704080e7          	jalr	1796(ra) # 87e <__adddf3>
    5182:	872a                	mv	a4,a0
    5184:	87ae                	mv	a5,a1
    5186:	863a                	mv	a2,a4
    5188:	86be                	mv	a3,a5
    518a:	f9842503          	lw	a0,-104(s0)
    518e:	f9c42583          	lw	a1,-100(s0)
    5192:	ffffc097          	auipc	ra,0xffffc
    5196:	cfe080e7          	jalr	-770(ra) # e90 <__divdf3>
    519a:	872a                	mv	a4,a0
    519c:	87ae                	mv	a5,a1
    519e:	853a                	mv	a0,a4
    51a0:	85be                	mv	a1,a5
    51a2:	000087b7          	lui	a5,0x8
    51a6:	3887a603          	lw	a2,904(a5) # 8388 <__srodata+0xd8>
    51aa:	38c7a683          	lw	a3,908(a5)
    51ae:	ffffb097          	auipc	ra,0xffffb
    51b2:	6d0080e7          	jalr	1744(ra) # 87e <__adddf3>
    51b6:	872a                	mv	a4,a0
    51b8:	87ae                	mv	a5,a1
    51ba:	863a                	mv	a2,a4
    51bc:	86be                	mv	a3,a5
    51be:	f9842503          	lw	a0,-104(s0)
    51c2:	f9c42583          	lw	a1,-100(s0)
    51c6:	ffffc097          	auipc	ra,0xffffc
    51ca:	cca080e7          	jalr	-822(ra) # e90 <__divdf3>
    51ce:	872a                	mv	a4,a0
    51d0:	87ae                	mv	a5,a1
    51d2:	863a                	mv	a2,a4
    51d4:	86be                	mv	a3,a5
    51d6:	8562                	mv	a0,s8
    51d8:	85e6                	mv	a1,s9
    51da:	ffffb097          	auipc	ra,0xffffb
    51de:	6a4080e7          	jalr	1700(ra) # 87e <__adddf3>
    51e2:	872a                	mv	a4,a0
    51e4:	87ae                	mv	a5,a1
    51e6:	863a                	mv	a2,a4
    51e8:	86be                	mv	a3,a5
    51ea:	855a                	mv	a0,s6
    51ec:	85de                	mv	a1,s7
    51ee:	ffffc097          	auipc	ra,0xffffc
    51f2:	ca2080e7          	jalr	-862(ra) # e90 <__divdf3>
    51f6:	872a                	mv	a4,a0
    51f8:	87ae                	mv	a5,a1
    51fa:	853a                	mv	a0,a4
    51fc:	85be                	mv	a1,a5
    51fe:	000087b7          	lui	a5,0x8
    5202:	3907a603          	lw	a2,912(a5) # 8390 <__srodata+0xe0>
    5206:	3947a683          	lw	a3,916(a5)
    520a:	ffffb097          	auipc	ra,0xffffb
    520e:	674080e7          	jalr	1652(ra) # 87e <__adddf3>
    5212:	872a                	mv	a4,a0
    5214:	87ae                	mv	a5,a1
    5216:	863a                	mv	a2,a4
    5218:	86be                	mv	a3,a5
    521a:	854a                	mv	a0,s2
    521c:	85ce                	mv	a1,s3
    521e:	ffffc097          	auipc	ra,0xffffc
    5222:	38e080e7          	jalr	910(ra) # 15ac <__muldf3>
    5226:	872a                	mv	a4,a0
    5228:	87ae                	mv	a5,a1
    522a:	f8e42423          	sw	a4,-120(s0)
    522e:	f8f42623          	sw	a5,-116(s0)
  // correct for rounding errors
  if (value < conv.F) {
    5232:	f8842703          	lw	a4,-120(s0)
    5236:	f8c42783          	lw	a5,-116(s0)
    523a:	863a                	mv	a2,a4
    523c:	86be                	mv	a3,a5
    523e:	f6842503          	lw	a0,-152(s0)
    5242:	f6c42583          	lw	a1,-148(s0)
    5246:	ffffc097          	auipc	ra,0xffffc
    524a:	2b8080e7          	jalr	696(ra) # 14fe <__ledf2>
    524e:	87aa                	mv	a5,a0
    5250:	0207dd63          	bgez	a5,528a <_etoa+0x4c6>
    expval--;
    5254:	fbc42783          	lw	a5,-68(s0)
    5258:	17fd                	addi	a5,a5,-1
    525a:	faf42e23          	sw	a5,-68(s0)
    conv.F /= 10;
    525e:	f8842703          	lw	a4,-120(s0)
    5262:	f8c42783          	lw	a5,-116(s0)
    5266:	000086b7          	lui	a3,0x8
    526a:	3806a603          	lw	a2,896(a3) # 8380 <__srodata+0xd0>
    526e:	3846a683          	lw	a3,900(a3)
    5272:	853a                	mv	a0,a4
    5274:	85be                	mv	a1,a5
    5276:	ffffc097          	auipc	ra,0xffffc
    527a:	c1a080e7          	jalr	-998(ra) # e90 <__divdf3>
    527e:	872a                	mv	a4,a0
    5280:	87ae                	mv	a5,a1
    5282:	f8e42423          	sw	a4,-120(s0)
    5286:	f8f42623          	sw	a5,-116(s0)
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
    528a:	fbc42703          	lw	a4,-68(s0)
    528e:	06300793          	li	a5,99
    5292:	00e7ca63          	blt	a5,a4,52a6 <_etoa+0x4e2>
    5296:	fbc42703          	lw	a4,-68(s0)
    529a:	f9d00793          	li	a5,-99
    529e:	00f74463          	blt	a4,a5,52a6 <_etoa+0x4e2>
    52a2:	4791                	li	a5,4
    52a4:	a011                	j	52a8 <_etoa+0x4e4>
    52a6:	4795                	li	a5,5
    52a8:	faf42c23          	sw	a5,-72(s0)

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
    52ac:	4018                	lw	a4,0(s0)
    52ae:	6785                	lui	a5,0x1
    52b0:	80078793          	addi	a5,a5,-2048 # 800 <__umoddi3+0x2c2>
    52b4:	8ff9                	and	a5,a5,a4
    52b6:	cbd1                	beqz	a5,534a <_etoa+0x586>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
    52b8:	000087b7          	lui	a5,0x8
    52bc:	3987a603          	lw	a2,920(a5) # 8398 <__srodata+0xe8>
    52c0:	39c7a683          	lw	a3,924(a5)
    52c4:	f6842503          	lw	a0,-152(s0)
    52c8:	f6c42583          	lw	a1,-148(s0)
    52cc:	ffffc097          	auipc	ra,0xffffc
    52d0:	184080e7          	jalr	388(ra) # 1450 <__gedf2>
    52d4:	87aa                	mv	a5,a0
    52d6:	0407ce63          	bltz	a5,5332 <_etoa+0x56e>
    52da:	000087b7          	lui	a5,0x8
    52de:	3a07a603          	lw	a2,928(a5) # 83a0 <__srodata+0xf0>
    52e2:	3a47a683          	lw	a3,932(a5)
    52e6:	f6842503          	lw	a0,-152(s0)
    52ea:	f6c42583          	lw	a1,-148(s0)
    52ee:	ffffc097          	auipc	ra,0xffffc
    52f2:	210080e7          	jalr	528(ra) # 14fe <__ledf2>
    52f6:	87aa                	mv	a5,a0
    52f8:	0207dd63          	bgez	a5,5332 <_etoa+0x56e>
      if ((int)prec > expval) {
    52fc:	f6442783          	lw	a5,-156(s0)
    5300:	fbc42703          	lw	a4,-68(s0)
    5304:	00f75c63          	bge	a4,a5,531c <_etoa+0x558>
        prec = (unsigned)((int)prec - expval - 1);
    5308:	f6442703          	lw	a4,-156(s0)
    530c:	fbc42783          	lw	a5,-68(s0)
    5310:	40f707b3          	sub	a5,a4,a5
    5314:	17fd                	addi	a5,a5,-1
    5316:	f6f42223          	sw	a5,-156(s0)
    531a:	a019                	j	5320 <_etoa+0x55c>
      }
      else {
        prec = 0;
    531c:	f6042223          	sw	zero,-156(s0)
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
    5320:	401c                	lw	a5,0(s0)
    5322:	4007e793          	ori	a5,a5,1024
    5326:	c01c                	sw	a5,0(s0)
      // no characters in exponent
      minwidth = 0U;
    5328:	fa042c23          	sw	zero,-72(s0)
      expval   = 0;
    532c:	fa042e23          	sw	zero,-68(s0)
    5330:	a829                	j	534a <_etoa+0x586>
    }
    else {
      // we use one sigfig for the whole part
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
    5332:	f6442783          	lw	a5,-156(s0)
    5336:	cb91                	beqz	a5,534a <_etoa+0x586>
    5338:	401c                	lw	a5,0(s0)
    533a:	4007f793          	andi	a5,a5,1024
    533e:	c791                	beqz	a5,534a <_etoa+0x586>
        --prec;
    5340:	f6442783          	lw	a5,-156(s0)
    5344:	17fd                	addi	a5,a5,-1
    5346:	f6f42223          	sw	a5,-156(s0)
      }
    }
  }

  // will everything fit?
  unsigned int fwidth = width;
    534a:	f6042783          	lw	a5,-160(s0)
    534e:	faf42a23          	sw	a5,-76(s0)
  if (width > minwidth) {
    5352:	f6042703          	lw	a4,-160(s0)
    5356:	fb842783          	lw	a5,-72(s0)
    535a:	00e7fb63          	bgeu	a5,a4,5370 <_etoa+0x5ac>
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
    535e:	fb442703          	lw	a4,-76(s0)
    5362:	fb842783          	lw	a5,-72(s0)
    5366:	40f707b3          	sub	a5,a4,a5
    536a:	faf42a23          	sw	a5,-76(s0)
    536e:	a019                	j	5374 <_etoa+0x5b0>
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
    5370:	fa042a23          	sw	zero,-76(s0)
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
    5374:	401c                	lw	a5,0(s0)
    5376:	8b89                	andi	a5,a5,2
    5378:	c791                	beqz	a5,5384 <_etoa+0x5c0>
    537a:	fb842783          	lw	a5,-72(s0)
    537e:	c399                	beqz	a5,5384 <_etoa+0x5c0>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
    5380:	fa042a23          	sw	zero,-76(s0)
  }

  // rescale the float value
  if (expval) {
    5384:	fbc42783          	lw	a5,-68(s0)
    5388:	c78d                	beqz	a5,53b2 <_etoa+0x5ee>
    value /= conv.F;
    538a:	f8842703          	lw	a4,-120(s0)
    538e:	f8c42783          	lw	a5,-116(s0)
    5392:	863a                	mv	a2,a4
    5394:	86be                	mv	a3,a5
    5396:	f6842503          	lw	a0,-152(s0)
    539a:	f6c42583          	lw	a1,-148(s0)
    539e:	ffffc097          	auipc	ra,0xffffc
    53a2:	af2080e7          	jalr	-1294(ra) # e90 <__divdf3>
    53a6:	872a                	mv	a4,a0
    53a8:	87ae                	mv	a5,a1
    53aa:	f6e42423          	sw	a4,-152(s0)
    53ae:	f6f42623          	sw	a5,-148(s0)
  }

  // output the floating part
  const size_t start_idx = idx;
    53b2:	f7442783          	lw	a5,-140(s0)
    53b6:	f8f42a23          	sw	a5,-108(s0)
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    53ba:	fb344783          	lbu	a5,-77(s0)
    53be:	cb91                	beqz	a5,53d2 <_etoa+0x60e>
    53c0:	f6842a03          	lw	s4,-152(s0)
    53c4:	f6c42703          	lw	a4,-148(s0)
    53c8:	800007b7          	lui	a5,0x80000
    53cc:	00f74ab3          	xor	s5,a4,a5
    53d0:	a029                	j	53da <_etoa+0x616>
    53d2:	f6842a03          	lw	s4,-152(s0)
    53d6:	f6c42a83          	lw	s5,-148(s0)
    53da:	4018                	lw	a4,0(s0)
    53dc:	77fd                	lui	a5,0xfffff
    53de:	7ff78793          	addi	a5,a5,2047 # fffff7ff <__heap_end+0xdffdf7ff>
    53e2:	8ff9                	and	a5,a5,a4
    53e4:	c03e                	sw	a5,0(sp)
    53e6:	fb442883          	lw	a7,-76(s0)
    53ea:	f6442803          	lw	a6,-156(s0)
    53ee:	8752                	mv	a4,s4
    53f0:	87d6                	mv	a5,s5
    53f2:	f7042683          	lw	a3,-144(s0)
    53f6:	f7442603          	lw	a2,-140(s0)
    53fa:	f7842583          	lw	a1,-136(s0)
    53fe:	f7c42503          	lw	a0,-132(s0)
    5402:	fffff097          	auipc	ra,0xfffff
    5406:	394080e7          	jalr	916(ra) # 4796 <_ftoa>
    540a:	f6a42a23          	sw	a0,-140(s0)

  // output the exponent part
  if (minwidth) {
    540e:	fb842783          	lw	a5,-72(s0)
    5412:	cfcd                	beqz	a5,54cc <_etoa+0x708>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
    5414:	401c                	lw	a5,0(s0)
    5416:	0207f793          	andi	a5,a5,32
    541a:	c781                	beqz	a5,5422 <_etoa+0x65e>
    541c:	04500793          	li	a5,69
    5420:	a019                	j	5426 <_etoa+0x662>
    5422:	06500793          	li	a5,101
    5426:	f7442703          	lw	a4,-140(s0)
    542a:	00170693          	addi	a3,a4,1
    542e:	f6d42a23          	sw	a3,-140(s0)
    5432:	f7c42803          	lw	a6,-132(s0)
    5436:	f7042683          	lw	a3,-144(s0)
    543a:	863a                	mv	a2,a4
    543c:	f7842583          	lw	a1,-136(s0)
    5440:	853e                	mv	a0,a5
    5442:	9802                	jalr	a6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
    5444:	fbc42783          	lw	a5,-68(s0)
    5448:	41f7d713          	srai	a4,a5,0x1f
    544c:	fbc42783          	lw	a5,-68(s0)
    5450:	8fb9                	xor	a5,a5,a4
    5452:	8f99                	sub	a5,a5,a4
    5454:	863e                	mv	a2,a5
    5456:	fbc42783          	lw	a5,-68(s0)
    545a:	83fd                	srli	a5,a5,0x1f
    545c:	0ff7f693          	andi	a3,a5,255
    5460:	fb842783          	lw	a5,-72(s0)
    5464:	17fd                	addi	a5,a5,-1
    5466:	4715                	li	a4,5
    5468:	c23a                	sw	a4,4(sp)
    546a:	c03e                	sw	a5,0(sp)
    546c:	4881                	li	a7,0
    546e:	4829                	li	a6,10
    5470:	87b6                	mv	a5,a3
    5472:	8732                	mv	a4,a2
    5474:	f7042683          	lw	a3,-144(s0)
    5478:	f7442603          	lw	a2,-140(s0)
    547c:	f7842583          	lw	a1,-136(s0)
    5480:	f7c42503          	lw	a0,-132(s0)
    5484:	fffff097          	auipc	ra,0xfffff
    5488:	0d0080e7          	jalr	208(ra) # 4554 <_ntoa_long>
    548c:	f6a42a23          	sw	a0,-140(s0)
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
    5490:	401c                	lw	a5,0(s0)
    5492:	8b89                	andi	a5,a5,2
    5494:	cf85                	beqz	a5,54cc <_etoa+0x708>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
    5496:	a00d                	j	54b8 <_etoa+0x6f4>
    5498:	f7442783          	lw	a5,-140(s0)
    549c:	00178713          	addi	a4,a5,1
    54a0:	f6e42a23          	sw	a4,-140(s0)
    54a4:	f7c42703          	lw	a4,-132(s0)
    54a8:	f7042683          	lw	a3,-144(s0)
    54ac:	863e                	mv	a2,a5
    54ae:	f7842583          	lw	a1,-136(s0)
    54b2:	02000513          	li	a0,32
    54b6:	9702                	jalr	a4
    54b8:	f7442703          	lw	a4,-140(s0)
    54bc:	f9442783          	lw	a5,-108(s0)
    54c0:	40f707b3          	sub	a5,a4,a5
    54c4:	f6042703          	lw	a4,-160(s0)
    54c8:	fce7e8e3          	bltu	a5,a4,5498 <_etoa+0x6d4>
    }
  }
  return idx;
    54cc:	f7442783          	lw	a5,-140(s0)
}
    54d0:	853e                	mv	a0,a5
    54d2:	50fa                	lw	ra,188(sp)
    54d4:	546a                	lw	s0,184(sp)
    54d6:	54da                	lw	s1,180(sp)
    54d8:	594a                	lw	s2,176(sp)
    54da:	59ba                	lw	s3,172(sp)
    54dc:	5a2a                	lw	s4,168(sp)
    54de:	5a9a                	lw	s5,164(sp)
    54e0:	5b0a                	lw	s6,160(sp)
    54e2:	4bfa                	lw	s7,156(sp)
    54e4:	4c6a                	lw	s8,152(sp)
    54e6:	4cda                	lw	s9,148(sp)
    54e8:	4d4a                	lw	s10,144(sp)
    54ea:	4dba                	lw	s11,140(sp)
    54ec:	6129                	addi	sp,sp,192
    54ee:	8082                	ret

000054f0 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
    54f0:	7171                	addi	sp,sp,-176
    54f2:	d706                	sw	ra,172(sp)
    54f4:	d522                	sw	s0,168(sp)
    54f6:	d34a                	sw	s2,164(sp)
    54f8:	d14e                	sw	s3,160(sp)
    54fa:	cf52                	sw	s4,156(sp)
    54fc:	cd56                	sw	s5,152(sp)
    54fe:	cb5a                	sw	s6,148(sp)
    5500:	c95e                	sw	s7,144(sp)
    5502:	c762                	sw	s8,140(sp)
    5504:	c566                	sw	s9,136(sp)
    5506:	c36a                	sw	s10,132(sp)
    5508:	c16e                	sw	s11,128(sp)
    550a:	1900                	addi	s0,sp,176
    550c:	f6a42e23          	sw	a0,-132(s0)
    5510:	f6b42c23          	sw	a1,-136(s0)
    5514:	f6c42a23          	sw	a2,-140(s0)
    5518:	f6d42823          	sw	a3,-144(s0)
    551c:	f6e42623          	sw	a4,-148(s0)
  unsigned int flags, width, precision, n;
  size_t idx = 0U;
    5520:	fa042e23          	sw	zero,-68(s0)

  if (!buffer) {
    5524:	f7842783          	lw	a5,-136(s0)
    5528:	320793e3          	bnez	a5,604e <_vsnprintf+0xb5e>
    // use null output function
    out = _out_null;
    552c:	000047b7          	lui	a5,0x4
    5530:	0a678793          	addi	a5,a5,166 # 40a6 <_out_null>
    5534:	f6f42e23          	sw	a5,-132(s0)
  }

  while (*format)
    5538:	3170006f          	j	604e <_vsnprintf+0xb5e>
  {
    // format specifier?  %[flags][width][.precision][length]
    if (*format != '%') {
    553c:	f7042783          	lw	a5,-144(s0)
    5540:	0007c703          	lbu	a4,0(a5)
    5544:	02500793          	li	a5,37
    5548:	02f70b63          	beq	a4,a5,557e <_vsnprintf+0x8e>
      // no
      out(*format, buffer, idx++, maxlen);
    554c:	f7042783          	lw	a5,-144(s0)
    5550:	0007c503          	lbu	a0,0(a5)
    5554:	fbc42783          	lw	a5,-68(s0)
    5558:	00178713          	addi	a4,a5,1
    555c:	fae42e23          	sw	a4,-68(s0)
    5560:	f7c42703          	lw	a4,-132(s0)
    5564:	f7442683          	lw	a3,-140(s0)
    5568:	863e                	mv	a2,a5
    556a:	f7842583          	lw	a1,-136(s0)
    556e:	9702                	jalr	a4
      format++;
    5570:	f7042783          	lw	a5,-144(s0)
    5574:	0785                	addi	a5,a5,1
    5576:	f6f42823          	sw	a5,-144(s0)
      continue;
    557a:	2d50006f          	j	604e <_vsnprintf+0xb5e>
    }
    else {
      // yes, evaluate it
      format++;
    557e:	f7042783          	lw	a5,-144(s0)
    5582:	0785                	addi	a5,a5,1
    5584:	f6f42823          	sw	a5,-144(s0)
    }

    // evaluate flags
    flags = 0U;
    5588:	fc042623          	sw	zero,-52(s0)
    do {
      switch (*format) {
    558c:	f7042783          	lw	a5,-144(s0)
    5590:	0007c783          	lbu	a5,0(a5)
    5594:	1781                	addi	a5,a5,-32
    5596:	4741                	li	a4,16
    5598:	0af76663          	bltu	a4,a5,5644 <_vsnprintf+0x154>
    559c:	00279713          	slli	a4,a5,0x2
    55a0:	000087b7          	lui	a5,0x8
    55a4:	61078793          	addi	a5,a5,1552 # 8610 <sg_timer_config+0xd0>
    55a8:	97ba                	add	a5,a5,a4
    55aa:	439c                	lw	a5,0(a5)
    55ac:	8782                	jr	a5
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
    55ae:	fcc42783          	lw	a5,-52(s0)
    55b2:	0017e793          	ori	a5,a5,1
    55b6:	fcf42623          	sw	a5,-52(s0)
    55ba:	f7042783          	lw	a5,-144(s0)
    55be:	0785                	addi	a5,a5,1
    55c0:	f6f42823          	sw	a5,-144(s0)
    55c4:	4785                	li	a5,1
    55c6:	fcf42023          	sw	a5,-64(s0)
    55ca:	a041                	j	564a <_vsnprintf+0x15a>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
    55cc:	fcc42783          	lw	a5,-52(s0)
    55d0:	0027e793          	ori	a5,a5,2
    55d4:	fcf42623          	sw	a5,-52(s0)
    55d8:	f7042783          	lw	a5,-144(s0)
    55dc:	0785                	addi	a5,a5,1
    55de:	f6f42823          	sw	a5,-144(s0)
    55e2:	4785                	li	a5,1
    55e4:	fcf42023          	sw	a5,-64(s0)
    55e8:	a08d                	j	564a <_vsnprintf+0x15a>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
    55ea:	fcc42783          	lw	a5,-52(s0)
    55ee:	0047e793          	ori	a5,a5,4
    55f2:	fcf42623          	sw	a5,-52(s0)
    55f6:	f7042783          	lw	a5,-144(s0)
    55fa:	0785                	addi	a5,a5,1
    55fc:	f6f42823          	sw	a5,-144(s0)
    5600:	4785                	li	a5,1
    5602:	fcf42023          	sw	a5,-64(s0)
    5606:	a091                	j	564a <_vsnprintf+0x15a>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
    5608:	fcc42783          	lw	a5,-52(s0)
    560c:	0087e793          	ori	a5,a5,8
    5610:	fcf42623          	sw	a5,-52(s0)
    5614:	f7042783          	lw	a5,-144(s0)
    5618:	0785                	addi	a5,a5,1
    561a:	f6f42823          	sw	a5,-144(s0)
    561e:	4785                	li	a5,1
    5620:	fcf42023          	sw	a5,-64(s0)
    5624:	a01d                	j	564a <_vsnprintf+0x15a>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
    5626:	fcc42783          	lw	a5,-52(s0)
    562a:	0107e793          	ori	a5,a5,16
    562e:	fcf42623          	sw	a5,-52(s0)
    5632:	f7042783          	lw	a5,-144(s0)
    5636:	0785                	addi	a5,a5,1
    5638:	f6f42823          	sw	a5,-144(s0)
    563c:	4785                	li	a5,1
    563e:	fcf42023          	sw	a5,-64(s0)
    5642:	a021                	j	564a <_vsnprintf+0x15a>
        default :                                   n = 0U; break;
    5644:	fc042023          	sw	zero,-64(s0)
    5648:	0001                	nop
      }
    } while (n);
    564a:	fc042783          	lw	a5,-64(s0)
    564e:	ff9d                	bnez	a5,558c <_vsnprintf+0x9c>

    // evaluate width field
    width = 0U;
    5650:	fc042423          	sw	zero,-56(s0)
    if (_is_digit(*format)) {
    5654:	f7042783          	lw	a5,-144(s0)
    5658:	0007c783          	lbu	a5,0(a5)
    565c:	853e                	mv	a0,a5
    565e:	fffff097          	auipc	ra,0xfffff
    5662:	aee080e7          	jalr	-1298(ra) # 414c <_is_digit>
    5666:	87aa                	mv	a5,a0
    5668:	cb99                	beqz	a5,567e <_vsnprintf+0x18e>
      width = _atoi(&format);
    566a:	f7040793          	addi	a5,s0,-144
    566e:	853e                	mv	a0,a5
    5670:	fffff097          	auipc	ra,0xfffff
    5674:	b14080e7          	jalr	-1260(ra) # 4184 <_atoi>
    5678:	fca42423          	sw	a0,-56(s0)
    567c:	a8a1                	j	56d4 <_vsnprintf+0x1e4>
    }
    else if (*format == '*') {
    567e:	f7042783          	lw	a5,-144(s0)
    5682:	0007c703          	lbu	a4,0(a5)
    5686:	02a00793          	li	a5,42
    568a:	04f71563          	bne	a4,a5,56d4 <_vsnprintf+0x1e4>
      const int w = va_arg(va, int);
    568e:	f6c42783          	lw	a5,-148(s0)
    5692:	00478713          	addi	a4,a5,4
    5696:	f6e42623          	sw	a4,-148(s0)
    569a:	439c                	lw	a5,0(a5)
    569c:	faf42423          	sw	a5,-88(s0)
      if (w < 0) {
    56a0:	fa842783          	lw	a5,-88(s0)
    56a4:	0007df63          	bgez	a5,56c2 <_vsnprintf+0x1d2>
        flags |= FLAGS_LEFT;    // reverse padding
    56a8:	fcc42783          	lw	a5,-52(s0)
    56ac:	0027e793          	ori	a5,a5,2
    56b0:	fcf42623          	sw	a5,-52(s0)
        width = (unsigned int)-w;
    56b4:	fa842783          	lw	a5,-88(s0)
    56b8:	40f007b3          	neg	a5,a5
    56bc:	fcf42423          	sw	a5,-56(s0)
    56c0:	a029                	j	56ca <_vsnprintf+0x1da>
      }
      else {
        width = (unsigned int)w;
    56c2:	fa842783          	lw	a5,-88(s0)
    56c6:	fcf42423          	sw	a5,-56(s0)
      }
      format++;
    56ca:	f7042783          	lw	a5,-144(s0)
    56ce:	0785                	addi	a5,a5,1
    56d0:	f6f42823          	sw	a5,-144(s0)
    }

    // evaluate precision field
    precision = 0U;
    56d4:	fc042223          	sw	zero,-60(s0)
    if (*format == '.') {
    56d8:	f7042783          	lw	a5,-144(s0)
    56dc:	0007c703          	lbu	a4,0(a5)
    56e0:	02e00793          	li	a5,46
    56e4:	06f71f63          	bne	a4,a5,5762 <_vsnprintf+0x272>
      flags |= FLAGS_PRECISION;
    56e8:	fcc42783          	lw	a5,-52(s0)
    56ec:	4007e793          	ori	a5,a5,1024
    56f0:	fcf42623          	sw	a5,-52(s0)
      format++;
    56f4:	f7042783          	lw	a5,-144(s0)
    56f8:	0785                	addi	a5,a5,1
    56fa:	f6f42823          	sw	a5,-144(s0)
      if (_is_digit(*format)) {
    56fe:	f7042783          	lw	a5,-144(s0)
    5702:	0007c783          	lbu	a5,0(a5)
    5706:	853e                	mv	a0,a5
    5708:	fffff097          	auipc	ra,0xfffff
    570c:	a44080e7          	jalr	-1468(ra) # 414c <_is_digit>
    5710:	87aa                	mv	a5,a0
    5712:	cb99                	beqz	a5,5728 <_vsnprintf+0x238>
        precision = _atoi(&format);
    5714:	f7040793          	addi	a5,s0,-144
    5718:	853e                	mv	a0,a5
    571a:	fffff097          	auipc	ra,0xfffff
    571e:	a6a080e7          	jalr	-1430(ra) # 4184 <_atoi>
    5722:	fca42223          	sw	a0,-60(s0)
    5726:	a835                	j	5762 <_vsnprintf+0x272>
      }
      else if (*format == '*') {
    5728:	f7042783          	lw	a5,-144(s0)
    572c:	0007c703          	lbu	a4,0(a5)
    5730:	02a00793          	li	a5,42
    5734:	02f71763          	bne	a4,a5,5762 <_vsnprintf+0x272>
        const int prec = (int)va_arg(va, int);
    5738:	f6c42783          	lw	a5,-148(s0)
    573c:	00478713          	addi	a4,a5,4
    5740:	f6e42623          	sw	a4,-148(s0)
    5744:	439c                	lw	a5,0(a5)
    5746:	faf42223          	sw	a5,-92(s0)
        precision = prec > 0 ? (unsigned int)prec : 0U;
    574a:	fa442783          	lw	a5,-92(s0)
    574e:	0007d363          	bgez	a5,5754 <_vsnprintf+0x264>
    5752:	4781                	li	a5,0
    5754:	fcf42223          	sw	a5,-60(s0)
        format++;
    5758:	f7042783          	lw	a5,-144(s0)
    575c:	0785                	addi	a5,a5,1
    575e:	f6f42823          	sw	a5,-144(s0)
      }
    }

    // evaluate length field
    switch (*format) {
    5762:	f7042783          	lw	a5,-144(s0)
    5766:	0007c783          	lbu	a5,0(a5)
    576a:	f9878793          	addi	a5,a5,-104
    576e:	4749                	li	a4,18
    5770:	0cf76d63          	bltu	a4,a5,584a <_vsnprintf+0x35a>
    5774:	00279713          	slli	a4,a5,0x2
    5778:	000087b7          	lui	a5,0x8
    577c:	65478793          	addi	a5,a5,1620 # 8654 <sg_timer_config+0x114>
    5780:	97ba                	add	a5,a5,a4
    5782:	439c                	lw	a5,0(a5)
    5784:	8782                	jr	a5
      case 'l' :
        flags |= FLAGS_LONG;
    5786:	fcc42783          	lw	a5,-52(s0)
    578a:	1007e793          	ori	a5,a5,256
    578e:	fcf42623          	sw	a5,-52(s0)
        format++;
    5792:	f7042783          	lw	a5,-144(s0)
    5796:	0785                	addi	a5,a5,1
    5798:	f6f42823          	sw	a5,-144(s0)
        if (*format == 'l') {
    579c:	f7042783          	lw	a5,-144(s0)
    57a0:	0007c703          	lbu	a4,0(a5)
    57a4:	06c00793          	li	a5,108
    57a8:	0af71363          	bne	a4,a5,584e <_vsnprintf+0x35e>
          flags |= FLAGS_LONG_LONG;
    57ac:	fcc42783          	lw	a5,-52(s0)
    57b0:	2007e793          	ori	a5,a5,512
    57b4:	fcf42623          	sw	a5,-52(s0)
          format++;
    57b8:	f7042783          	lw	a5,-144(s0)
    57bc:	0785                	addi	a5,a5,1
    57be:	f6f42823          	sw	a5,-144(s0)
        }
        break;
    57c2:	a071                	j	584e <_vsnprintf+0x35e>
      case 'h' :
        flags |= FLAGS_SHORT;
    57c4:	fcc42783          	lw	a5,-52(s0)
    57c8:	0807e793          	ori	a5,a5,128
    57cc:	fcf42623          	sw	a5,-52(s0)
        format++;
    57d0:	f7042783          	lw	a5,-144(s0)
    57d4:	0785                	addi	a5,a5,1
    57d6:	f6f42823          	sw	a5,-144(s0)
        if (*format == 'h') {
    57da:	f7042783          	lw	a5,-144(s0)
    57de:	0007c703          	lbu	a4,0(a5)
    57e2:	06800793          	li	a5,104
    57e6:	06f71663          	bne	a4,a5,5852 <_vsnprintf+0x362>
          flags |= FLAGS_CHAR;
    57ea:	fcc42783          	lw	a5,-52(s0)
    57ee:	0407e793          	ori	a5,a5,64
    57f2:	fcf42623          	sw	a5,-52(s0)
          format++;
    57f6:	f7042783          	lw	a5,-144(s0)
    57fa:	0785                	addi	a5,a5,1
    57fc:	f6f42823          	sw	a5,-144(s0)
        }
        break;
    5800:	a889                	j	5852 <_vsnprintf+0x362>
#if defined(PRINTF_SUPPORT_PTRDIFF_T)
      case 't' :
        flags |= (sizeof(ptrdiff_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    5802:	fcc42783          	lw	a5,-52(s0)
    5806:	1007e793          	ori	a5,a5,256
    580a:	fcf42623          	sw	a5,-52(s0)
        format++;
    580e:	f7042783          	lw	a5,-144(s0)
    5812:	0785                	addi	a5,a5,1
    5814:	f6f42823          	sw	a5,-144(s0)
        break;
    5818:	a835                	j	5854 <_vsnprintf+0x364>
#endif
      case 'j' :
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    581a:	fcc42783          	lw	a5,-52(s0)
    581e:	2007e793          	ori	a5,a5,512
    5822:	fcf42623          	sw	a5,-52(s0)
        format++;
    5826:	f7042783          	lw	a5,-144(s0)
    582a:	0785                	addi	a5,a5,1
    582c:	f6f42823          	sw	a5,-144(s0)
        break;
    5830:	a015                	j	5854 <_vsnprintf+0x364>
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    5832:	fcc42783          	lw	a5,-52(s0)
    5836:	1007e793          	ori	a5,a5,256
    583a:	fcf42623          	sw	a5,-52(s0)
        format++;
    583e:	f7042783          	lw	a5,-144(s0)
    5842:	0785                	addi	a5,a5,1
    5844:	f6f42823          	sw	a5,-144(s0)
        break;
    5848:	a031                	j	5854 <_vsnprintf+0x364>
      default :
        break;
    584a:	0001                	nop
    584c:	a021                	j	5854 <_vsnprintf+0x364>
        break;
    584e:	0001                	nop
    5850:	a011                	j	5854 <_vsnprintf+0x364>
        break;
    5852:	0001                	nop
    }

    // evaluate specifier
    switch (*format) {
    5854:	f7042783          	lw	a5,-144(s0)
    5858:	0007c783          	lbu	a5,0(a5)
    585c:	fdb78793          	addi	a5,a5,-37
    5860:	05300713          	li	a4,83
    5864:	7af76d63          	bltu	a4,a5,601e <_vsnprintf+0xb2e>
    5868:	00279713          	slli	a4,a5,0x2
    586c:	000087b7          	lui	a5,0x8
    5870:	6a078793          	addi	a5,a5,1696 # 86a0 <sg_timer_config+0x160>
    5874:	97ba                	add	a5,a5,a4
    5876:	439c                	lw	a5,0(a5)
    5878:	8782                	jr	a5
      case 'X' :
      case 'o' :
      case 'b' : {
        // set the base
        unsigned int base;
        if (*format == 'x' || *format == 'X') {
    587a:	f7042783          	lw	a5,-144(s0)
    587e:	0007c703          	lbu	a4,0(a5)
    5882:	07800793          	li	a5,120
    5886:	00f70a63          	beq	a4,a5,589a <_vsnprintf+0x3aa>
    588a:	f7042783          	lw	a5,-144(s0)
    588e:	0007c703          	lbu	a4,0(a5)
    5892:	05800793          	li	a5,88
    5896:	00f71663          	bne	a4,a5,58a2 <_vsnprintf+0x3b2>
          base = 16U;
    589a:	47c1                	li	a5,16
    589c:	faf42c23          	sw	a5,-72(s0)
    58a0:	a089                	j	58e2 <_vsnprintf+0x3f2>
        }
        else if (*format == 'o') {
    58a2:	f7042783          	lw	a5,-144(s0)
    58a6:	0007c703          	lbu	a4,0(a5)
    58aa:	06f00793          	li	a5,111
    58ae:	00f71663          	bne	a4,a5,58ba <_vsnprintf+0x3ca>
          base =  8U;
    58b2:	47a1                	li	a5,8
    58b4:	faf42c23          	sw	a5,-72(s0)
    58b8:	a02d                	j	58e2 <_vsnprintf+0x3f2>
        }
        else if (*format == 'b') {
    58ba:	f7042783          	lw	a5,-144(s0)
    58be:	0007c703          	lbu	a4,0(a5)
    58c2:	06200793          	li	a5,98
    58c6:	00f71663          	bne	a4,a5,58d2 <_vsnprintf+0x3e2>
          base =  2U;
    58ca:	4789                	li	a5,2
    58cc:	faf42c23          	sw	a5,-72(s0)
    58d0:	a809                	j	58e2 <_vsnprintf+0x3f2>
        }
        else {
          base = 10U;
    58d2:	47a9                	li	a5,10
    58d4:	faf42c23          	sw	a5,-72(s0)
          flags &= ~FLAGS_HASH;   // no hash for dec format
    58d8:	fcc42783          	lw	a5,-52(s0)
    58dc:	9bbd                	andi	a5,a5,-17
    58de:	fcf42623          	sw	a5,-52(s0)
        }
        // uppercase
        if (*format == 'X') {
    58e2:	f7042783          	lw	a5,-144(s0)
    58e6:	0007c703          	lbu	a4,0(a5)
    58ea:	05800793          	li	a5,88
    58ee:	00f71863          	bne	a4,a5,58fe <_vsnprintf+0x40e>
          flags |= FLAGS_UPPERCASE;
    58f2:	fcc42783          	lw	a5,-52(s0)
    58f6:	0207e793          	ori	a5,a5,32
    58fa:	fcf42623          	sw	a5,-52(s0)
        }

        // no plus or space flag for u, x, X, o, b
        if ((*format != 'i') && (*format != 'd')) {
    58fe:	f7042783          	lw	a5,-144(s0)
    5902:	0007c703          	lbu	a4,0(a5)
    5906:	06900793          	li	a5,105
    590a:	00f70f63          	beq	a4,a5,5928 <_vsnprintf+0x438>
    590e:	f7042783          	lw	a5,-144(s0)
    5912:	0007c703          	lbu	a4,0(a5)
    5916:	06400793          	li	a5,100
    591a:	00f70763          	beq	a4,a5,5928 <_vsnprintf+0x438>
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    591e:	fcc42783          	lw	a5,-52(s0)
    5922:	9bcd                	andi	a5,a5,-13
    5924:	fcf42623          	sw	a5,-52(s0)
        }

        // ignore '0' flag when precision is given
        if (flags & FLAGS_PRECISION) {
    5928:	fcc42783          	lw	a5,-52(s0)
    592c:	4007f793          	andi	a5,a5,1024
    5930:	c791                	beqz	a5,593c <_vsnprintf+0x44c>
          flags &= ~FLAGS_ZEROPAD;
    5932:	fcc42783          	lw	a5,-52(s0)
    5936:	9bf9                	andi	a5,a5,-2
    5938:	fcf42623          	sw	a5,-52(s0)
        }

        // convert the integer
        if ((*format == 'i') || (*format == 'd')) {
    593c:	f7042783          	lw	a5,-144(s0)
    5940:	0007c703          	lbu	a4,0(a5)
    5944:	06900793          	li	a5,105
    5948:	00f70a63          	beq	a4,a5,595c <_vsnprintf+0x46c>
    594c:	f7042783          	lw	a5,-144(s0)
    5950:	0007c703          	lbu	a4,0(a5)
    5954:	06400793          	li	a5,100
    5958:	1cf71063          	bne	a4,a5,5b18 <_vsnprintf+0x628>
          // signed
          if (flags & FLAGS_LONG_LONG) {
    595c:	fcc42783          	lw	a5,-52(s0)
    5960:	2007f793          	andi	a5,a5,512
    5964:	c3dd                	beqz	a5,5a0a <_vsnprintf+0x51a>
#if defined(PRINTF_SUPPORT_LONG_LONG)
            const long long value = va_arg(va, long long);
    5966:	f6c42783          	lw	a5,-148(s0)
    596a:	079d                	addi	a5,a5,7
    596c:	9be1                	andi	a5,a5,-8
    596e:	00878713          	addi	a4,a5,8
    5972:	f6e42623          	sw	a4,-148(s0)
    5976:	4398                	lw	a4,0(a5)
    5978:	43dc                	lw	a5,4(a5)
    597a:	f8e42423          	sw	a4,-120(s0)
    597e:	f8f42623          	sw	a5,-116(s0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    5982:	f8c42783          	lw	a5,-116(s0)
    5986:	41f7d913          	srai	s2,a5,0x1f
    598a:	f8c42783          	lw	a5,-116(s0)
    598e:	41f7d993          	srai	s3,a5,0x1f
    5992:	f8842783          	lw	a5,-120(s0)
    5996:	0127ca33          	xor	s4,a5,s2
    599a:	f8c42783          	lw	a5,-116(s0)
    599e:	0137cab3          	xor	s5,a5,s3
    59a2:	412a0733          	sub	a4,s4,s2
    59a6:	86ba                	mv	a3,a4
    59a8:	00da36b3          	sltu	a3,s4,a3
    59ac:	413a87b3          	sub	a5,s5,s3
    59b0:	40d786b3          	sub	a3,a5,a3
    59b4:	87b6                	mv	a5,a3
    59b6:	8a3a                	mv	s4,a4
    59b8:	8abe                	mv	s5,a5
    59ba:	8652                	mv	a2,s4
    59bc:	86d6                	mv	a3,s5
    59be:	f8c42783          	lw	a5,-116(s0)
    59c2:	83fd                	srli	a5,a5,0x1f
    59c4:	0ff7f713          	andi	a4,a5,255
    59c8:	fb842783          	lw	a5,-72(s0)
    59cc:	8b3e                	mv	s6,a5
    59ce:	4b81                	li	s7,0
    59d0:	fcc42783          	lw	a5,-52(s0)
    59d4:	c63e                	sw	a5,12(sp)
    59d6:	fc842783          	lw	a5,-56(s0)
    59da:	c43e                	sw	a5,8(sp)
    59dc:	fc442783          	lw	a5,-60(s0)
    59e0:	c23e                	sw	a5,4(sp)
    59e2:	c05e                	sw	s7,0(sp)
    59e4:	88da                	mv	a7,s6
    59e6:	883a                	mv	a6,a4
    59e8:	8732                	mv	a4,a2
    59ea:	87b6                	mv	a5,a3
    59ec:	f7442683          	lw	a3,-140(s0)
    59f0:	fbc42603          	lw	a2,-68(s0)
    59f4:	f7842583          	lw	a1,-136(s0)
    59f8:	f7c42503          	lw	a0,-132(s0)
    59fc:	fffff097          	auipc	ra,0xfffff
    5a00:	c60080e7          	jalr	-928(ra) # 465c <_ntoa_long_long>
    5a04:	faa42e23          	sw	a0,-68(s0)
          if (flags & FLAGS_LONG_LONG) {
    5a08:	ac35                	j	5c44 <_vsnprintf+0x754>
#endif
          }
          else if (flags & FLAGS_LONG) {
    5a0a:	fcc42783          	lw	a5,-52(s0)
    5a0e:	1007f793          	andi	a5,a5,256
    5a12:	c3bd                	beqz	a5,5a78 <_vsnprintf+0x588>
            const long value = va_arg(va, long);
    5a14:	f6c42783          	lw	a5,-148(s0)
    5a18:	00478713          	addi	a4,a5,4
    5a1c:	f6e42623          	sw	a4,-148(s0)
    5a20:	439c                	lw	a5,0(a5)
    5a22:	f8f42a23          	sw	a5,-108(s0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    5a26:	f9442783          	lw	a5,-108(s0)
    5a2a:	41f7d713          	srai	a4,a5,0x1f
    5a2e:	f9442783          	lw	a5,-108(s0)
    5a32:	8fb9                	xor	a5,a5,a4
    5a34:	8f99                	sub	a5,a5,a4
    5a36:	86be                	mv	a3,a5
    5a38:	f9442783          	lw	a5,-108(s0)
    5a3c:	83fd                	srli	a5,a5,0x1f
    5a3e:	0ff7f713          	andi	a4,a5,255
    5a42:	fcc42783          	lw	a5,-52(s0)
    5a46:	c23e                	sw	a5,4(sp)
    5a48:	fc842783          	lw	a5,-56(s0)
    5a4c:	c03e                	sw	a5,0(sp)
    5a4e:	fc442883          	lw	a7,-60(s0)
    5a52:	fb842803          	lw	a6,-72(s0)
    5a56:	87ba                	mv	a5,a4
    5a58:	8736                	mv	a4,a3
    5a5a:	f7442683          	lw	a3,-140(s0)
    5a5e:	fbc42603          	lw	a2,-68(s0)
    5a62:	f7842583          	lw	a1,-136(s0)
    5a66:	f7c42503          	lw	a0,-132(s0)
    5a6a:	fffff097          	auipc	ra,0xfffff
    5a6e:	aea080e7          	jalr	-1302(ra) # 4554 <_ntoa_long>
    5a72:	faa42e23          	sw	a0,-68(s0)
          if (flags & FLAGS_LONG_LONG) {
    5a76:	a2f9                	j	5c44 <_vsnprintf+0x754>
          }
          else {
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
    5a78:	fcc42783          	lw	a5,-52(s0)
    5a7c:	0407f793          	andi	a5,a5,64
    5a80:	cb99                	beqz	a5,5a96 <_vsnprintf+0x5a6>
    5a82:	f6c42783          	lw	a5,-148(s0)
    5a86:	00478713          	addi	a4,a5,4
    5a8a:	f6e42623          	sw	a4,-148(s0)
    5a8e:	439c                	lw	a5,0(a5)
    5a90:	0ff7f793          	andi	a5,a5,255
    5a94:	a03d                	j	5ac2 <_vsnprintf+0x5d2>
    5a96:	fcc42783          	lw	a5,-52(s0)
    5a9a:	0807f793          	andi	a5,a5,128
    5a9e:	cb99                	beqz	a5,5ab4 <_vsnprintf+0x5c4>
    5aa0:	f6c42783          	lw	a5,-148(s0)
    5aa4:	00478713          	addi	a4,a5,4
    5aa8:	f6e42623          	sw	a4,-148(s0)
    5aac:	439c                	lw	a5,0(a5)
    5aae:	3c07a78b          	ext	a5,a5,15,0
    5ab2:	a801                	j	5ac2 <_vsnprintf+0x5d2>
    5ab4:	f6c42783          	lw	a5,-148(s0)
    5ab8:	00478713          	addi	a4,a5,4
    5abc:	f6e42623          	sw	a4,-148(s0)
    5ac0:	439c                	lw	a5,0(a5)
    5ac2:	f8f42c23          	sw	a5,-104(s0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    5ac6:	f9842783          	lw	a5,-104(s0)
    5aca:	41f7d713          	srai	a4,a5,0x1f
    5ace:	f9842783          	lw	a5,-104(s0)
    5ad2:	8fb9                	xor	a5,a5,a4
    5ad4:	8f99                	sub	a5,a5,a4
    5ad6:	86be                	mv	a3,a5
    5ad8:	f9842783          	lw	a5,-104(s0)
    5adc:	83fd                	srli	a5,a5,0x1f
    5ade:	0ff7f713          	andi	a4,a5,255
    5ae2:	fcc42783          	lw	a5,-52(s0)
    5ae6:	c23e                	sw	a5,4(sp)
    5ae8:	fc842783          	lw	a5,-56(s0)
    5aec:	c03e                	sw	a5,0(sp)
    5aee:	fc442883          	lw	a7,-60(s0)
    5af2:	fb842803          	lw	a6,-72(s0)
    5af6:	87ba                	mv	a5,a4
    5af8:	8736                	mv	a4,a3
    5afa:	f7442683          	lw	a3,-140(s0)
    5afe:	fbc42603          	lw	a2,-68(s0)
    5b02:	f7842583          	lw	a1,-136(s0)
    5b06:	f7c42503          	lw	a0,-132(s0)
    5b0a:	fffff097          	auipc	ra,0xfffff
    5b0e:	a4a080e7          	jalr	-1462(ra) # 4554 <_ntoa_long>
    5b12:	faa42e23          	sw	a0,-68(s0)
          if (flags & FLAGS_LONG_LONG) {
    5b16:	a23d                	j	5c44 <_vsnprintf+0x754>
          }
        }
        else {
          // unsigned
          if (flags & FLAGS_LONG_LONG) {
    5b18:	fcc42783          	lw	a5,-52(s0)
    5b1c:	2007f793          	andi	a5,a5,512
    5b20:	cbb1                	beqz	a5,5b74 <_vsnprintf+0x684>
#if defined(PRINTF_SUPPORT_LONG_LONG)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    5b22:	f6c42783          	lw	a5,-148(s0)
    5b26:	079d                	addi	a5,a5,7
    5b28:	9be1                	andi	a5,a5,-8
    5b2a:	00878713          	addi	a4,a5,8
    5b2e:	f6e42623          	sw	a4,-148(s0)
    5b32:	4398                	lw	a4,0(a5)
    5b34:	43dc                	lw	a5,4(a5)
    5b36:	fb842683          	lw	a3,-72(s0)
    5b3a:	8c36                	mv	s8,a3
    5b3c:	4c81                	li	s9,0
    5b3e:	fcc42683          	lw	a3,-52(s0)
    5b42:	c636                	sw	a3,12(sp)
    5b44:	fc842683          	lw	a3,-56(s0)
    5b48:	c436                	sw	a3,8(sp)
    5b4a:	fc442683          	lw	a3,-60(s0)
    5b4e:	c236                	sw	a3,4(sp)
    5b50:	c066                	sw	s9,0(sp)
    5b52:	88e2                	mv	a7,s8
    5b54:	4801                	li	a6,0
    5b56:	f7442683          	lw	a3,-140(s0)
    5b5a:	fbc42603          	lw	a2,-68(s0)
    5b5e:	f7842583          	lw	a1,-136(s0)
    5b62:	f7c42503          	lw	a0,-132(s0)
    5b66:	fffff097          	auipc	ra,0xfffff
    5b6a:	af6080e7          	jalr	-1290(ra) # 465c <_ntoa_long_long>
    5b6e:	faa42e23          	sw	a0,-68(s0)
    5b72:	a8c9                	j	5c44 <_vsnprintf+0x754>
#endif
          }
          else if (flags & FLAGS_LONG) {
    5b74:	fcc42783          	lw	a5,-52(s0)
    5b78:	1007f793          	andi	a5,a5,256
    5b7c:	c3b1                	beqz	a5,5bc0 <_vsnprintf+0x6d0>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    5b7e:	f6c42783          	lw	a5,-148(s0)
    5b82:	00478713          	addi	a4,a5,4
    5b86:	f6e42623          	sw	a4,-148(s0)
    5b8a:	4398                	lw	a4,0(a5)
    5b8c:	fcc42783          	lw	a5,-52(s0)
    5b90:	c23e                	sw	a5,4(sp)
    5b92:	fc842783          	lw	a5,-56(s0)
    5b96:	c03e                	sw	a5,0(sp)
    5b98:	fc442883          	lw	a7,-60(s0)
    5b9c:	fb842803          	lw	a6,-72(s0)
    5ba0:	4781                	li	a5,0
    5ba2:	f7442683          	lw	a3,-140(s0)
    5ba6:	fbc42603          	lw	a2,-68(s0)
    5baa:	f7842583          	lw	a1,-136(s0)
    5bae:	f7c42503          	lw	a0,-132(s0)
    5bb2:	fffff097          	auipc	ra,0xfffff
    5bb6:	9a2080e7          	jalr	-1630(ra) # 4554 <_ntoa_long>
    5bba:	faa42e23          	sw	a0,-68(s0)
    5bbe:	a059                	j	5c44 <_vsnprintf+0x754>
          }
          else {
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
    5bc0:	fcc42783          	lw	a5,-52(s0)
    5bc4:	0407f793          	andi	a5,a5,64
    5bc8:	cb99                	beqz	a5,5bde <_vsnprintf+0x6ee>
    5bca:	f6c42783          	lw	a5,-148(s0)
    5bce:	00478713          	addi	a4,a5,4
    5bd2:	f6e42623          	sw	a4,-148(s0)
    5bd6:	439c                	lw	a5,0(a5)
    5bd8:	0ff7f793          	andi	a5,a5,255
    5bdc:	a03d                	j	5c0a <_vsnprintf+0x71a>
    5bde:	fcc42783          	lw	a5,-52(s0)
    5be2:	0807f793          	andi	a5,a5,128
    5be6:	cb99                	beqz	a5,5bfc <_vsnprintf+0x70c>
    5be8:	f6c42783          	lw	a5,-148(s0)
    5bec:	00478713          	addi	a4,a5,4
    5bf0:	f6e42623          	sw	a4,-148(s0)
    5bf4:	439c                	lw	a5,0(a5)
    5bf6:	3c07b78b          	extu	a5,a5,15,0
    5bfa:	a801                	j	5c0a <_vsnprintf+0x71a>
    5bfc:	f6c42783          	lw	a5,-148(s0)
    5c00:	00478713          	addi	a4,a5,4
    5c04:	f6e42623          	sw	a4,-148(s0)
    5c08:	439c                	lw	a5,0(a5)
    5c0a:	f8f42e23          	sw	a5,-100(s0)
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    5c0e:	fcc42783          	lw	a5,-52(s0)
    5c12:	c23e                	sw	a5,4(sp)
    5c14:	fc842783          	lw	a5,-56(s0)
    5c18:	c03e                	sw	a5,0(sp)
    5c1a:	fc442883          	lw	a7,-60(s0)
    5c1e:	fb842803          	lw	a6,-72(s0)
    5c22:	4781                	li	a5,0
    5c24:	f9c42703          	lw	a4,-100(s0)
    5c28:	f7442683          	lw	a3,-140(s0)
    5c2c:	fbc42603          	lw	a2,-68(s0)
    5c30:	f7842583          	lw	a1,-136(s0)
    5c34:	f7c42503          	lw	a0,-132(s0)
    5c38:	fffff097          	auipc	ra,0xfffff
    5c3c:	91c080e7          	jalr	-1764(ra) # 4554 <_ntoa_long>
    5c40:	faa42e23          	sw	a0,-68(s0)
          }
        }
        format++;
    5c44:	f7042783          	lw	a5,-144(s0)
    5c48:	0785                	addi	a5,a5,1
    5c4a:	f6f42823          	sw	a5,-144(s0)
        break;
    5c4e:	a101                	j	604e <_vsnprintf+0xb5e>
      }
#if defined(PRINTF_SUPPORT_FLOAT)
      case 'f' :
      case 'F' :
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
    5c50:	f7042783          	lw	a5,-144(s0)
    5c54:	0007c703          	lbu	a4,0(a5)
    5c58:	04600793          	li	a5,70
    5c5c:	00f71863          	bne	a4,a5,5c6c <_vsnprintf+0x77c>
    5c60:	fcc42783          	lw	a5,-52(s0)
    5c64:	0207e793          	ori	a5,a5,32
    5c68:	fcf42623          	sw	a5,-52(s0)
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    5c6c:	f6c42783          	lw	a5,-148(s0)
    5c70:	079d                	addi	a5,a5,7
    5c72:	9be1                	andi	a5,a5,-8
    5c74:	00878713          	addi	a4,a5,8
    5c78:	f6e42623          	sw	a4,-148(s0)
    5c7c:	4398                	lw	a4,0(a5)
    5c7e:	43dc                	lw	a5,4(a5)
    5c80:	fcc42683          	lw	a3,-52(s0)
    5c84:	c036                	sw	a3,0(sp)
    5c86:	fc842883          	lw	a7,-56(s0)
    5c8a:	fc442803          	lw	a6,-60(s0)
    5c8e:	f7442683          	lw	a3,-140(s0)
    5c92:	fbc42603          	lw	a2,-68(s0)
    5c96:	f7842583          	lw	a1,-136(s0)
    5c9a:	f7c42503          	lw	a0,-132(s0)
    5c9e:	fffff097          	auipc	ra,0xfffff
    5ca2:	af8080e7          	jalr	-1288(ra) # 4796 <_ftoa>
    5ca6:	faa42e23          	sw	a0,-68(s0)
        format++;
    5caa:	f7042783          	lw	a5,-144(s0)
    5cae:	0785                	addi	a5,a5,1
    5cb0:	f6f42823          	sw	a5,-144(s0)
        break;
    5cb4:	ae69                	j	604e <_vsnprintf+0xb5e>
#if defined(PRINTF_SUPPORT_EXPONENTIAL)
      case 'e':
      case 'E':
      case 'g':
      case 'G':
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
    5cb6:	f7042783          	lw	a5,-144(s0)
    5cba:	0007c703          	lbu	a4,0(a5)
    5cbe:	06700793          	li	a5,103
    5cc2:	00f70a63          	beq	a4,a5,5cd6 <_vsnprintf+0x7e6>
    5cc6:	f7042783          	lw	a5,-144(s0)
    5cca:	0007c703          	lbu	a4,0(a5)
    5cce:	04700793          	li	a5,71
    5cd2:	00f71a63          	bne	a4,a5,5ce6 <_vsnprintf+0x7f6>
    5cd6:	fcc42703          	lw	a4,-52(s0)
    5cda:	6785                	lui	a5,0x1
    5cdc:	80078793          	addi	a5,a5,-2048 # 800 <__umoddi3+0x2c2>
    5ce0:	8fd9                	or	a5,a5,a4
    5ce2:	fcf42623          	sw	a5,-52(s0)
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
    5ce6:	f7042783          	lw	a5,-144(s0)
    5cea:	0007c703          	lbu	a4,0(a5)
    5cee:	04500793          	li	a5,69
    5cf2:	00f70a63          	beq	a4,a5,5d06 <_vsnprintf+0x816>
    5cf6:	f7042783          	lw	a5,-144(s0)
    5cfa:	0007c703          	lbu	a4,0(a5)
    5cfe:	04700793          	li	a5,71
    5d02:	00f71863          	bne	a4,a5,5d12 <_vsnprintf+0x822>
    5d06:	fcc42783          	lw	a5,-52(s0)
    5d0a:	0207e793          	ori	a5,a5,32
    5d0e:	fcf42623          	sw	a5,-52(s0)
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    5d12:	f6c42783          	lw	a5,-148(s0)
    5d16:	079d                	addi	a5,a5,7
    5d18:	9be1                	andi	a5,a5,-8
    5d1a:	00878713          	addi	a4,a5,8
    5d1e:	f6e42623          	sw	a4,-148(s0)
    5d22:	4398                	lw	a4,0(a5)
    5d24:	43dc                	lw	a5,4(a5)
    5d26:	fcc42683          	lw	a3,-52(s0)
    5d2a:	c036                	sw	a3,0(sp)
    5d2c:	fc842883          	lw	a7,-56(s0)
    5d30:	fc442803          	lw	a6,-60(s0)
    5d34:	f7442683          	lw	a3,-140(s0)
    5d38:	fbc42603          	lw	a2,-68(s0)
    5d3c:	f7842583          	lw	a1,-136(s0)
    5d40:	f7c42503          	lw	a0,-132(s0)
    5d44:	fffff097          	auipc	ra,0xfffff
    5d48:	080080e7          	jalr	128(ra) # 4dc4 <_etoa>
    5d4c:	faa42e23          	sw	a0,-68(s0)
        format++;
    5d50:	f7042783          	lw	a5,-144(s0)
    5d54:	0785                	addi	a5,a5,1
    5d56:	f6f42823          	sw	a5,-144(s0)
        break;
    5d5a:	acd5                	j	604e <_vsnprintf+0xb5e>
#endif  // PRINTF_SUPPORT_EXPONENTIAL
#endif  // PRINTF_SUPPORT_FLOAT
      case 'c' : {
        unsigned int l = 1U;
    5d5c:	4785                	li	a5,1
    5d5e:	faf42a23          	sw	a5,-76(s0)
        // pre padding
        if (!(flags & FLAGS_LEFT)) {
    5d62:	fcc42783          	lw	a5,-52(s0)
    5d66:	8b89                	andi	a5,a5,2
    5d68:	ef85                	bnez	a5,5da0 <_vsnprintf+0x8b0>
          while (l++ < width) {
    5d6a:	a00d                	j	5d8c <_vsnprintf+0x89c>
            out(' ', buffer, idx++, maxlen);
    5d6c:	fbc42783          	lw	a5,-68(s0)
    5d70:	00178713          	addi	a4,a5,1
    5d74:	fae42e23          	sw	a4,-68(s0)
    5d78:	f7c42703          	lw	a4,-132(s0)
    5d7c:	f7442683          	lw	a3,-140(s0)
    5d80:	863e                	mv	a2,a5
    5d82:	f7842583          	lw	a1,-136(s0)
    5d86:	02000513          	li	a0,32
    5d8a:	9702                	jalr	a4
          while (l++ < width) {
    5d8c:	fb442783          	lw	a5,-76(s0)
    5d90:	00178713          	addi	a4,a5,1
    5d94:	fae42a23          	sw	a4,-76(s0)
    5d98:	fc842703          	lw	a4,-56(s0)
    5d9c:	fce7e8e3          	bltu	a5,a4,5d6c <_vsnprintf+0x87c>
          }
        }
        // char output
        out((char)va_arg(va, int), buffer, idx++, maxlen);
    5da0:	f6c42783          	lw	a5,-148(s0)
    5da4:	00478713          	addi	a4,a5,4
    5da8:	f6e42623          	sw	a4,-148(s0)
    5dac:	439c                	lw	a5,0(a5)
    5dae:	0ff7f513          	andi	a0,a5,255
    5db2:	fbc42783          	lw	a5,-68(s0)
    5db6:	00178713          	addi	a4,a5,1
    5dba:	fae42e23          	sw	a4,-68(s0)
    5dbe:	f7c42703          	lw	a4,-132(s0)
    5dc2:	f7442683          	lw	a3,-140(s0)
    5dc6:	863e                	mv	a2,a5
    5dc8:	f7842583          	lw	a1,-136(s0)
    5dcc:	9702                	jalr	a4
        // post padding
        if (flags & FLAGS_LEFT) {
    5dce:	fcc42783          	lw	a5,-52(s0)
    5dd2:	8b89                	andi	a5,a5,2
    5dd4:	cf85                	beqz	a5,5e0c <_vsnprintf+0x91c>
          while (l++ < width) {
    5dd6:	a00d                	j	5df8 <_vsnprintf+0x908>
            out(' ', buffer, idx++, maxlen);
    5dd8:	fbc42783          	lw	a5,-68(s0)
    5ddc:	00178713          	addi	a4,a5,1
    5de0:	fae42e23          	sw	a4,-68(s0)
    5de4:	f7c42703          	lw	a4,-132(s0)
    5de8:	f7442683          	lw	a3,-140(s0)
    5dec:	863e                	mv	a2,a5
    5dee:	f7842583          	lw	a1,-136(s0)
    5df2:	02000513          	li	a0,32
    5df6:	9702                	jalr	a4
          while (l++ < width) {
    5df8:	fb442783          	lw	a5,-76(s0)
    5dfc:	00178713          	addi	a4,a5,1
    5e00:	fae42a23          	sw	a4,-76(s0)
    5e04:	fc842703          	lw	a4,-56(s0)
    5e08:	fce7e8e3          	bltu	a5,a4,5dd8 <_vsnprintf+0x8e8>
          }
        }
        format++;
    5e0c:	f7042783          	lw	a5,-144(s0)
    5e10:	0785                	addi	a5,a5,1
    5e12:	f6f42823          	sw	a5,-144(s0)
        break;
    5e16:	ac25                	j	604e <_vsnprintf+0xb5e>
      }

      case 's' : {
        const char* p = va_arg(va, char*);
    5e18:	f6c42783          	lw	a5,-148(s0)
    5e1c:	00478713          	addi	a4,a5,4
    5e20:	f6e42623          	sw	a4,-148(s0)
    5e24:	439c                	lw	a5,0(a5)
    5e26:	faf42823          	sw	a5,-80(s0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    5e2a:	fc442783          	lw	a5,-60(s0)
    5e2e:	c781                	beqz	a5,5e36 <_vsnprintf+0x946>
    5e30:	fc442783          	lw	a5,-60(s0)
    5e34:	a011                	j	5e38 <_vsnprintf+0x948>
    5e36:	57fd                	li	a5,-1
    5e38:	85be                	mv	a1,a5
    5e3a:	fb042503          	lw	a0,-80(s0)
    5e3e:	ffffe097          	auipc	ra,0xffffe
    5e42:	2c0080e7          	jalr	704(ra) # 40fe <_strnlen_s>
    5e46:	faa42623          	sw	a0,-84(s0)
        // pre padding
        if (flags & FLAGS_PRECISION) {
    5e4a:	fcc42783          	lw	a5,-52(s0)
    5e4e:	4007f793          	andi	a5,a5,1024
    5e52:	cb91                	beqz	a5,5e66 <_vsnprintf+0x976>
          l = (l < precision ? l : precision);
    5e54:	fac42703          	lw	a4,-84(s0)
    5e58:	fc442783          	lw	a5,-60(s0)
    5e5c:	00f77363          	bgeu	a4,a5,5e62 <_vsnprintf+0x972>
    5e60:	87ba                	mv	a5,a4
    5e62:	faf42623          	sw	a5,-84(s0)
        }
        if (!(flags & FLAGS_LEFT)) {
    5e66:	fcc42783          	lw	a5,-52(s0)
    5e6a:	8b89                	andi	a5,a5,2
    5e6c:	e3bd                	bnez	a5,5ed2 <_vsnprintf+0x9e2>
          while (l++ < width) {
    5e6e:	a00d                	j	5e90 <_vsnprintf+0x9a0>
            out(' ', buffer, idx++, maxlen);
    5e70:	fbc42783          	lw	a5,-68(s0)
    5e74:	00178713          	addi	a4,a5,1
    5e78:	fae42e23          	sw	a4,-68(s0)
    5e7c:	f7c42703          	lw	a4,-132(s0)
    5e80:	f7442683          	lw	a3,-140(s0)
    5e84:	863e                	mv	a2,a5
    5e86:	f7842583          	lw	a1,-136(s0)
    5e8a:	02000513          	li	a0,32
    5e8e:	9702                	jalr	a4
          while (l++ < width) {
    5e90:	fac42783          	lw	a5,-84(s0)
    5e94:	00178713          	addi	a4,a5,1
    5e98:	fae42623          	sw	a4,-84(s0)
    5e9c:	fc842703          	lw	a4,-56(s0)
    5ea0:	fce7e8e3          	bltu	a5,a4,5e70 <_vsnprintf+0x980>
          }
        }
        // string output
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    5ea4:	a03d                	j	5ed2 <_vsnprintf+0x9e2>
          out(*(p++), buffer, idx++, maxlen);
    5ea6:	fb042783          	lw	a5,-80(s0)
    5eaa:	00178713          	addi	a4,a5,1
    5eae:	fae42823          	sw	a4,-80(s0)
    5eb2:	0007c503          	lbu	a0,0(a5)
    5eb6:	fbc42783          	lw	a5,-68(s0)
    5eba:	00178713          	addi	a4,a5,1
    5ebe:	fae42e23          	sw	a4,-68(s0)
    5ec2:	f7c42703          	lw	a4,-132(s0)
    5ec6:	f7442683          	lw	a3,-140(s0)
    5eca:	863e                	mv	a2,a5
    5ecc:	f7842583          	lw	a1,-136(s0)
    5ed0:	9702                	jalr	a4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    5ed2:	fb042783          	lw	a5,-80(s0)
    5ed6:	0007c783          	lbu	a5,0(a5)
    5eda:	cf89                	beqz	a5,5ef4 <_vsnprintf+0xa04>
    5edc:	fcc42783          	lw	a5,-52(s0)
    5ee0:	4007f793          	andi	a5,a5,1024
    5ee4:	d3e9                	beqz	a5,5ea6 <_vsnprintf+0x9b6>
    5ee6:	fc442783          	lw	a5,-60(s0)
    5eea:	fff78713          	addi	a4,a5,-1
    5eee:	fce42223          	sw	a4,-60(s0)
    5ef2:	fbd5                	bnez	a5,5ea6 <_vsnprintf+0x9b6>
        }
        // post padding
        if (flags & FLAGS_LEFT) {
    5ef4:	fcc42783          	lw	a5,-52(s0)
    5ef8:	8b89                	andi	a5,a5,2
    5efa:	cf85                	beqz	a5,5f32 <_vsnprintf+0xa42>
          while (l++ < width) {
    5efc:	a00d                	j	5f1e <_vsnprintf+0xa2e>
            out(' ', buffer, idx++, maxlen);
    5efe:	fbc42783          	lw	a5,-68(s0)
    5f02:	00178713          	addi	a4,a5,1
    5f06:	fae42e23          	sw	a4,-68(s0)
    5f0a:	f7c42703          	lw	a4,-132(s0)
    5f0e:	f7442683          	lw	a3,-140(s0)
    5f12:	863e                	mv	a2,a5
    5f14:	f7842583          	lw	a1,-136(s0)
    5f18:	02000513          	li	a0,32
    5f1c:	9702                	jalr	a4
          while (l++ < width) {
    5f1e:	fac42783          	lw	a5,-84(s0)
    5f22:	00178713          	addi	a4,a5,1
    5f26:	fae42623          	sw	a4,-84(s0)
    5f2a:	fc842703          	lw	a4,-56(s0)
    5f2e:	fce7e8e3          	bltu	a5,a4,5efe <_vsnprintf+0xa0e>
          }
        }
        format++;
    5f32:	f7042783          	lw	a5,-144(s0)
    5f36:	0785                	addi	a5,a5,1
    5f38:	f6f42823          	sw	a5,-144(s0)
        break;
    5f3c:	aa09                	j	604e <_vsnprintf+0xb5e>
      }

      case 'p' : {
        width = sizeof(void*) * 2U;
    5f3e:	47a1                	li	a5,8
    5f40:	fcf42423          	sw	a5,-56(s0)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    5f44:	fcc42783          	lw	a5,-52(s0)
    5f48:	0217e793          	ori	a5,a5,33
    5f4c:	fcf42623          	sw	a5,-52(s0)
#if defined(PRINTF_SUPPORT_LONG_LONG)
        const bool is_ll = sizeof(uintptr_t) == sizeof(long long);
    5f50:	fa0401a3          	sb	zero,-93(s0)
        if (is_ll) {
    5f54:	fa344783          	lbu	a5,-93(s0)
    5f58:	c7b9                	beqz	a5,5fa6 <_vsnprintf+0xab6>
          idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    5f5a:	f6c42783          	lw	a5,-148(s0)
    5f5e:	00478713          	addi	a4,a5,4
    5f62:	f6e42623          	sw	a4,-148(s0)
    5f66:	439c                	lw	a5,0(a5)
    5f68:	8d3e                	mv	s10,a5
    5f6a:	4d81                	li	s11,0
    5f6c:	fcc42783          	lw	a5,-52(s0)
    5f70:	c63e                	sw	a5,12(sp)
    5f72:	fc842783          	lw	a5,-56(s0)
    5f76:	c43e                	sw	a5,8(sp)
    5f78:	fc442783          	lw	a5,-60(s0)
    5f7c:	c23e                	sw	a5,4(sp)
    5f7e:	c002                	sw	zero,0(sp)
    5f80:	48c1                	li	a7,16
    5f82:	4801                	li	a6,0
    5f84:	876a                	mv	a4,s10
    5f86:	87ee                	mv	a5,s11
    5f88:	f7442683          	lw	a3,-140(s0)
    5f8c:	fbc42603          	lw	a2,-68(s0)
    5f90:	f7842583          	lw	a1,-136(s0)
    5f94:	f7c42503          	lw	a0,-132(s0)
    5f98:	ffffe097          	auipc	ra,0xffffe
    5f9c:	6c4080e7          	jalr	1732(ra) # 465c <_ntoa_long_long>
    5fa0:	faa42e23          	sw	a0,-68(s0)
    5fa4:	a089                	j	5fe6 <_vsnprintf+0xaf6>
        }
        else {
#endif
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
    5fa6:	f6c42783          	lw	a5,-148(s0)
    5faa:	00478713          	addi	a4,a5,4
    5fae:	f6e42623          	sw	a4,-148(s0)
    5fb2:	439c                	lw	a5,0(a5)
    5fb4:	873e                	mv	a4,a5
    5fb6:	fcc42783          	lw	a5,-52(s0)
    5fba:	c23e                	sw	a5,4(sp)
    5fbc:	fc842783          	lw	a5,-56(s0)
    5fc0:	c03e                	sw	a5,0(sp)
    5fc2:	fc442883          	lw	a7,-60(s0)
    5fc6:	4841                	li	a6,16
    5fc8:	4781                	li	a5,0
    5fca:	f7442683          	lw	a3,-140(s0)
    5fce:	fbc42603          	lw	a2,-68(s0)
    5fd2:	f7842583          	lw	a1,-136(s0)
    5fd6:	f7c42503          	lw	a0,-132(s0)
    5fda:	ffffe097          	auipc	ra,0xffffe
    5fde:	57a080e7          	jalr	1402(ra) # 4554 <_ntoa_long>
    5fe2:	faa42e23          	sw	a0,-68(s0)
#if defined(PRINTF_SUPPORT_LONG_LONG)
        }
#endif
        format++;
    5fe6:	f7042783          	lw	a5,-144(s0)
    5fea:	0785                	addi	a5,a5,1
    5fec:	f6f42823          	sw	a5,-144(s0)
        break;
    5ff0:	a8b9                	j	604e <_vsnprintf+0xb5e>
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
    5ff2:	fbc42783          	lw	a5,-68(s0)
    5ff6:	00178713          	addi	a4,a5,1
    5ffa:	fae42e23          	sw	a4,-68(s0)
    5ffe:	f7c42703          	lw	a4,-132(s0)
    6002:	f7442683          	lw	a3,-140(s0)
    6006:	863e                	mv	a2,a5
    6008:	f7842583          	lw	a1,-136(s0)
    600c:	02500513          	li	a0,37
    6010:	9702                	jalr	a4
        format++;
    6012:	f7042783          	lw	a5,-144(s0)
    6016:	0785                	addi	a5,a5,1
    6018:	f6f42823          	sw	a5,-144(s0)
        break;
    601c:	a80d                	j	604e <_vsnprintf+0xb5e>

      default :
        out(*format, buffer, idx++, maxlen);
    601e:	f7042783          	lw	a5,-144(s0)
    6022:	0007c503          	lbu	a0,0(a5)
    6026:	fbc42783          	lw	a5,-68(s0)
    602a:	00178713          	addi	a4,a5,1
    602e:	fae42e23          	sw	a4,-68(s0)
    6032:	f7c42703          	lw	a4,-132(s0)
    6036:	f7442683          	lw	a3,-140(s0)
    603a:	863e                	mv	a2,a5
    603c:	f7842583          	lw	a1,-136(s0)
    6040:	9702                	jalr	a4
        format++;
    6042:	f7042783          	lw	a5,-144(s0)
    6046:	0785                	addi	a5,a5,1
    6048:	f6f42823          	sw	a5,-144(s0)
        break;
    604c:	0001                	nop
  while (*format)
    604e:	f7042783          	lw	a5,-144(s0)
    6052:	0007c783          	lbu	a5,0(a5)
    6056:	ce079363          	bnez	a5,553c <_vsnprintf+0x4c>
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    605a:	fbc42703          	lw	a4,-68(s0)
    605e:	f7442783          	lw	a5,-140(s0)
    6062:	00f76663          	bltu	a4,a5,606e <_vsnprintf+0xb7e>
    6066:	f7442783          	lw	a5,-140(s0)
    606a:	17fd                	addi	a5,a5,-1
    606c:	a019                	j	6072 <_vsnprintf+0xb82>
    606e:	fbc42783          	lw	a5,-68(s0)
    6072:	f7c42703          	lw	a4,-132(s0)
    6076:	f7442683          	lw	a3,-140(s0)
    607a:	863e                	mv	a2,a5
    607c:	f7842583          	lw	a1,-136(s0)
    6080:	4501                	li	a0,0
    6082:	9702                	jalr	a4

  // return written chars without terminating \0
  return (int)idx;
    6084:	fbc42783          	lw	a5,-68(s0)
}
    6088:	853e                	mv	a0,a5
    608a:	50ba                	lw	ra,172(sp)
    608c:	542a                	lw	s0,168(sp)
    608e:	591a                	lw	s2,164(sp)
    6090:	598a                	lw	s3,160(sp)
    6092:	4a7a                	lw	s4,156(sp)
    6094:	4aea                	lw	s5,152(sp)
    6096:	4b5a                	lw	s6,148(sp)
    6098:	4bca                	lw	s7,144(sp)
    609a:	4c3a                	lw	s8,140(sp)
    609c:	4caa                	lw	s9,136(sp)
    609e:	4d1a                	lw	s10,132(sp)
    60a0:	4d8a                	lw	s11,128(sp)
    60a2:	614d                	addi	sp,sp,176
    60a4:	8082                	ret

000060a6 <printf>:


///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    60a6:	715d                	addi	sp,sp,-80
    60a8:	d606                	sw	ra,44(sp)
    60aa:	d422                	sw	s0,40(sp)
    60ac:	1800                	addi	s0,sp,48
    60ae:	fca42e23          	sw	a0,-36(s0)
    60b2:	c04c                	sw	a1,4(s0)
    60b4:	c410                	sw	a2,8(s0)
    60b6:	c454                	sw	a3,12(s0)
    60b8:	c818                	sw	a4,16(s0)
    60ba:	c85c                	sw	a5,20(s0)
    60bc:	01042c23          	sw	a6,24(s0)
    60c0:	01142e23          	sw	a7,28(s0)
  va_list va;
  va_start(va, format);
    60c4:	02040793          	addi	a5,s0,32
    60c8:	fcf42c23          	sw	a5,-40(s0)
    60cc:	fd842783          	lw	a5,-40(s0)
    60d0:	1791                	addi	a5,a5,-28
    60d2:	fef42423          	sw	a5,-24(s0)
  char buffer[1];
  const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    60d6:	fe842703          	lw	a4,-24(s0)
    60da:	fe440793          	addi	a5,s0,-28
    60de:	fdc42683          	lw	a3,-36(s0)
    60e2:	567d                	li	a2,-1
    60e4:	85be                	mv	a1,a5
    60e6:	000047b7          	lui	a5,0x4
    60ea:	0c678513          	addi	a0,a5,198 # 40c6 <_out_char>
    60ee:	fffff097          	auipc	ra,0xfffff
    60f2:	402080e7          	jalr	1026(ra) # 54f0 <_vsnprintf>
    60f6:	fea42623          	sw	a0,-20(s0)
  va_end(va);
  return ret;
    60fa:	fec42783          	lw	a5,-20(s0)
}
    60fe:	853e                	mv	a0,a5
    6100:	50b2                	lw	ra,44(sp)
    6102:	5422                	lw	s0,40(sp)
    6104:	6161                	addi	sp,sp,80
    6106:	8082                	ret

00006108 <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    6108:	7179                	addi	sp,sp,-48
    610a:	d606                	sw	ra,44(sp)
    610c:	d422                	sw	s0,40(sp)
    610e:	1800                	addi	s0,sp,48
    6110:	fca42e23          	sw	a0,-36(s0)
    6114:	fcb42c23          	sw	a1,-40(s0)
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    6118:	fd842783          	lw	a5,-40(s0)
    611c:	439c                	lw	a5,0(a5)
    611e:	853e                	mv	a0,a5
    6120:	00000097          	auipc	ra,0x0
    6124:	268080e7          	jalr	616(ra) # 6388 <mm_size2ndx>
    6128:	fea42223          	sw	a0,-28(s0)

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    612c:	fe442783          	lw	a5,-28(s0)
    6130:	0785                	addi	a5,a5,1
    6132:	0792                	slli	a5,a5,0x4
    6134:	fdc42703          	lw	a4,-36(s0)
    6138:	97ba                	add	a5,a5,a4
    613a:	07a1                	addi	a5,a5,8
    613c:	fef42423          	sw	a5,-24(s0)
    6140:	fdc42703          	lw	a4,-36(s0)
    6144:	fe442783          	lw	a5,-28(s0)
    6148:	0785                	addi	a5,a5,1
    614a:	0792                	slli	a5,a5,0x4
    614c:	97ba                	add	a5,a5,a4
    614e:	4b9c                	lw	a5,16(a5)
    6150:	fef42623          	sw	a5,-20(s0)
    6154:	a811                	j	6168 <mm_addfreechunk+0x60>
       next && next->size && next->size < node->size;
       prev = next, next = next->flink);
    6156:	fec42783          	lw	a5,-20(s0)
    615a:	fef42423          	sw	a5,-24(s0)
    615e:	fec42783          	lw	a5,-20(s0)
    6162:	479c                	lw	a5,8(a5)
    6164:	fef42623          	sw	a5,-20(s0)
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    6168:	fec42783          	lw	a5,-20(s0)
    616c:	cf89                	beqz	a5,6186 <mm_addfreechunk+0x7e>
       next && next->size && next->size < node->size;
    616e:	fec42783          	lw	a5,-20(s0)
    6172:	439c                	lw	a5,0(a5)
    6174:	cb89                	beqz	a5,6186 <mm_addfreechunk+0x7e>
    6176:	fec42783          	lw	a5,-20(s0)
    617a:	4398                	lw	a4,0(a5)
    617c:	fd842783          	lw	a5,-40(s0)
    6180:	439c                	lw	a5,0(a5)
    6182:	fcf76ae3          	bltu	a4,a5,6156 <mm_addfreechunk+0x4e>

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    6186:	fe842783          	lw	a5,-24(s0)
    618a:	fd842703          	lw	a4,-40(s0)
    618e:	c798                	sw	a4,8(a5)
  node->blink = prev;
    6190:	fd842783          	lw	a5,-40(s0)
    6194:	fe842703          	lw	a4,-24(s0)
    6198:	c7d8                	sw	a4,12(a5)
  node->flink = next;
    619a:	fd842783          	lw	a5,-40(s0)
    619e:	fec42703          	lw	a4,-20(s0)
    61a2:	c798                	sw	a4,8(a5)

  if (next)
    61a4:	fec42783          	lw	a5,-20(s0)
    61a8:	c791                	beqz	a5,61b4 <mm_addfreechunk+0xac>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    61aa:	fec42783          	lw	a5,-20(s0)
    61ae:	fd842703          	lw	a4,-40(s0)
    61b2:	c7d8                	sw	a4,12(a5)
    }
}
    61b4:	0001                	nop
    61b6:	50b2                	lw	ra,44(sp)
    61b8:	5422                	lw	s0,40(sp)
    61ba:	6145                	addi	sp,sp,48
    61bc:	8082                	ret

000061be <mm_addregion>:
 *
 ****************************************************************************/

void mm_addregion(struct mm_heap_s *heap, void *heapstart,
                  size_t heapsize)
{
    61be:	7179                	addi	sp,sp,-48
    61c0:	d606                	sw	ra,44(sp)
    61c2:	d422                	sw	s0,40(sp)
    61c4:	1800                	addi	s0,sp,48
    61c6:	fca42e23          	sw	a0,-36(s0)
    61ca:	fcb42c23          	sw	a1,-40(s0)
    61ce:	fcc42a23          	sw	a2,-44(s0)

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    61d2:	fd842783          	lw	a5,-40(s0)
    61d6:	07bd                	addi	a5,a5,15
    61d8:	9bc1                	andi	a5,a5,-16
    61da:	fef42623          	sw	a5,-20(s0)
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    61de:	fd842703          	lw	a4,-40(s0)
    61e2:	fd442783          	lw	a5,-44(s0)
    61e6:	97ba                	add	a5,a5,a4
    61e8:	9bc1                	andi	a5,a5,-16
    61ea:	fef42423          	sw	a5,-24(s0)
  heapsize = heapend - heapbase;
    61ee:	fe842703          	lw	a4,-24(s0)
    61f2:	fec42783          	lw	a5,-20(s0)
    61f6:	40f707b3          	sub	a5,a4,a5
    61fa:	fcf42a23          	sw	a5,-44(s0)

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    61fe:	fdc42783          	lw	a5,-36(s0)
    6202:	47d8                	lw	a4,12(a5)
    6204:	fd442783          	lw	a5,-44(s0)
    6208:	973e                	add	a4,a4,a5
    620a:	fdc42783          	lw	a5,-36(s0)
    620e:	c7d8                	sw	a4,12(a5)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    6210:	fec42703          	lw	a4,-20(s0)
    6214:	fdc42783          	lw	a5,-36(s0)
    6218:	cb98                	sw	a4,16(a5)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    621a:	fdc42783          	lw	a5,-36(s0)
    621e:	4b9c                	lw	a5,16(a5)
    6220:	4721                	li	a4,8
    6222:	c398                	sw	a4,0(a5)
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    6224:	fdc42783          	lw	a5,-36(s0)
    6228:	4b9c                	lw	a5,16(a5)
    622a:	80000737          	lui	a4,0x80000
    622e:	c3d8                	sw	a4,4(a5)

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    6230:	fec42783          	lw	a5,-20(s0)
    6234:	07a1                	addi	a5,a5,8
    6236:	fef42223          	sw	a5,-28(s0)
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    623a:	fd442783          	lw	a5,-44(s0)
    623e:	ff078713          	addi	a4,a5,-16
    6242:	fe442783          	lw	a5,-28(s0)
    6246:	c398                	sw	a4,0(a5)
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    6248:	fe442783          	lw	a5,-28(s0)
    624c:	4721                	li	a4,8
    624e:	c3d8                	sw	a4,4(a5)

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    6250:	fe842783          	lw	a5,-24(s0)
    6254:	17e1                	addi	a5,a5,-8
    6256:	873e                	mv	a4,a5
    6258:	fdc42783          	lw	a5,-36(s0)
    625c:	cbd8                	sw	a4,20(a5)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    625e:	fdc42783          	lw	a5,-36(s0)
    6262:	4bdc                	lw	a5,20(a5)
    6264:	4721                	li	a4,8
    6266:	c398                	sw	a4,0(a5)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    6268:	fe442783          	lw	a5,-28(s0)
    626c:	4394                	lw	a3,0(a5)
    626e:	fdc42783          	lw	a5,-36(s0)
    6272:	4bdc                	lw	a5,20(a5)
    6274:	80000737          	lui	a4,0x80000
    6278:	8f55                	or	a4,a4,a3
    627a:	c3d8                	sw	a4,4(a5)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    627c:	fe442583          	lw	a1,-28(s0)
    6280:	fdc42503          	lw	a0,-36(s0)
    6284:	00000097          	auipc	ra,0x0
    6288:	e84080e7          	jalr	-380(ra) # 6108 <mm_addfreechunk>
}
    628c:	0001                	nop
    628e:	50b2                	lw	ra,44(sp)
    6290:	5422                	lw	s0,40(sp)
    6292:	6145                	addi	sp,sp,48
    6294:	8082                	ret

00006296 <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    6296:	7179                	addi	sp,sp,-48
    6298:	d606                	sw	ra,44(sp)
    629a:	d422                	sw	s0,40(sp)
    629c:	1800                	addi	s0,sp,48
    629e:	fca42e23          	sw	a0,-36(s0)
    62a2:	fcb42c23          	sw	a1,-40(s0)
    62a6:	fcc42a23          	sw	a2,-44(s0)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    62aa:	fdc42783          	lw	a5,-36(s0)
    62ae:	0007a623          	sw	zero,12(a5)
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    62b2:	fdc42783          	lw	a5,-36(s0)
    62b6:	07e1                	addi	a5,a5,24
    62b8:	13000613          	li	a2,304
    62bc:	4581                	li	a1,0
    62be:	853e                	mv	a0,a5
    62c0:	ffffc097          	auipc	ra,0xffffc
    62c4:	f28080e7          	jalr	-216(ra) # 21e8 <memset>
  for (i = 1; i < MM_NNODES; i++)
    62c8:	4785                	li	a5,1
    62ca:	fef42623          	sw	a5,-20(s0)
    62ce:	a889                	j	6320 <mm_initialize+0x8a>
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    62d0:	fec42783          	lw	a5,-20(s0)
    62d4:	17fd                	addi	a5,a5,-1
    62d6:	fec42703          	lw	a4,-20(s0)
    62da:	0705                	addi	a4,a4,1
    62dc:	0712                	slli	a4,a4,0x4
    62de:	fdc42683          	lw	a3,-36(s0)
    62e2:	9736                	add	a4,a4,a3
    62e4:	0721                	addi	a4,a4,8
    62e6:	fdc42683          	lw	a3,-36(s0)
    62ea:	0785                	addi	a5,a5,1
    62ec:	0792                	slli	a5,a5,0x4
    62ee:	97b6                	add	a5,a5,a3
    62f0:	cb98                	sw	a4,16(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    62f2:	fec42783          	lw	a5,-20(s0)
    62f6:	17fd                	addi	a5,a5,-1
    62f8:	0785                	addi	a5,a5,1
    62fa:	0792                	slli	a5,a5,0x4
    62fc:	fdc42703          	lw	a4,-36(s0)
    6300:	97ba                	add	a5,a5,a4
    6302:	00878713          	addi	a4,a5,8
    6306:	fdc42683          	lw	a3,-36(s0)
    630a:	fec42783          	lw	a5,-20(s0)
    630e:	0785                	addi	a5,a5,1
    6310:	0792                	slli	a5,a5,0x4
    6312:	97b6                	add	a5,a5,a3
    6314:	cbd8                	sw	a4,20(a5)
  for (i = 1; i < MM_NNODES; i++)
    6316:	fec42783          	lw	a5,-20(s0)
    631a:	0785                	addi	a5,a5,1
    631c:	fef42623          	sw	a5,-20(s0)
    6320:	fec42703          	lw	a4,-20(s0)
    6324:	47c9                	li	a5,18
    6326:	fae7d5e3          	bge	a5,a4,62d0 <mm_initialize+0x3a>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    632a:	fd442603          	lw	a2,-44(s0)
    632e:	fd842583          	lw	a1,-40(s0)
    6332:	fdc42503          	lw	a0,-36(s0)
    6336:	00000097          	auipc	ra,0x0
    633a:	e88080e7          	jalr	-376(ra) # 61be <mm_addregion>
}
    633e:	0001                	nop
    6340:	50b2                	lw	ra,44(sp)
    6342:	5422                	lw	s0,40(sp)
    6344:	6145                	addi	sp,sp,48
    6346:	8082                	ret

00006348 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    6348:	1141                	addi	sp,sp,-16
    634a:	c606                	sw	ra,12(sp)
    634c:	c422                	sw	s0,8(sp)
    634e:	0800                	addi	s0,sp,16
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    6350:	200207b7          	lui	a5,0x20020
    6354:	00078713          	mv	a4,a5
    6358:	2000c7b7          	lui	a5,0x2000c
    635c:	9ec78793          	addi	a5,a5,-1556 # 2000b9ec <__bss_end__>
    6360:	40f707b3          	sub	a5,a4,a5
    6364:	863e                	mv	a2,a5
    6366:	2000c7b7          	lui	a5,0x2000c
    636a:	9ec78593          	addi	a1,a5,-1556 # 2000b9ec <__bss_end__>
    636e:	2000a7b7          	lui	a5,0x2000a
    6372:	60478513          	addi	a0,a5,1540 # 2000a604 <g_mmheap>
    6376:	00000097          	auipc	ra,0x0
    637a:	f20080e7          	jalr	-224(ra) # 6296 <mm_initialize>
}
    637e:	0001                	nop
    6380:	40b2                	lw	ra,12(sp)
    6382:	4422                	lw	s0,8(sp)
    6384:	0141                	addi	sp,sp,16
    6386:	8082                	ret

00006388 <mm_size2ndx>:
 *    Convert the size to a nodelist index.
 *
 ****************************************************************************/

int mm_size2ndx(size_t size)
{
    6388:	7179                	addi	sp,sp,-48
    638a:	d622                	sw	s0,44(sp)
    638c:	1800                	addi	s0,sp,48
    638e:	fca42e23          	sw	a0,-36(s0)
  int ndx = 0;
    6392:	fe042623          	sw	zero,-20(s0)

  if (size >= MM_MAX_CHUNK)
    6396:	fdc42703          	lw	a4,-36(s0)
    639a:	004007b7          	lui	a5,0x400
    639e:	00f76463          	bltu	a4,a5,63a6 <mm_size2ndx+0x1e>
    {
       return MM_NNODES-1;
    63a2:	47c9                	li	a5,18
    63a4:	a805                	j	63d4 <mm_size2ndx+0x4c>
    }

  size >>= MM_MIN_SHIFT;
    63a6:	fdc42783          	lw	a5,-36(s0)
    63aa:	8391                	srli	a5,a5,0x4
    63ac:	fcf42e23          	sw	a5,-36(s0)
  while (size > 1)
    63b0:	a819                	j	63c6 <mm_size2ndx+0x3e>
    {
      ndx++;
    63b2:	fec42783          	lw	a5,-20(s0)
    63b6:	0785                	addi	a5,a5,1
    63b8:	fef42623          	sw	a5,-20(s0)
      size >>= 1;
    63bc:	fdc42783          	lw	a5,-36(s0)
    63c0:	8385                	srli	a5,a5,0x1
    63c2:	fcf42e23          	sw	a5,-36(s0)
  while (size > 1)
    63c6:	fdc42703          	lw	a4,-36(s0)
    63ca:	4785                	li	a5,1
    63cc:	fee7e3e3          	bltu	a5,a4,63b2 <mm_size2ndx+0x2a>
    }

  return ndx;
    63d0:	fec42783          	lw	a5,-20(s0)
}
    63d4:	853e                	mv	a0,a5
    63d6:	5432                	lw	s0,44(sp)
    63d8:	6145                	addi	sp,sp,48
    63da:	8082                	ret

000063dc <Timer_Interrupt_Init>:
	Loop_Num++;
	//return Loop_Num;
}

void Timer_Interrupt_Init()
{
    63dc:	1141                	addi	sp,sp,-16
    63de:	c622                	sw	s0,12(sp)
    63e0:	0800                	addi	s0,sp,16
//		"ld.w r14, (sp, 8)\n"
//		"ld.w r15, (sp, 12)\n"
//		"addi sp, 16\n"
//		"rte\n"
//		"INTER_END:");
}
    63e2:	0001                	nop
    63e4:	4432                	lw	s0,12(sp)
    63e6:	0141                	addi	sp,sp,16
    63e8:	8082                	ret

000063ea <thead_ext_enable>:

volatile uint32_t g_mhcr_after  = 0;

/* 第一步：使能 T-Head 扩展 CSR 访问权限 */
static void thead_ext_enable(void)
{
    63ea:	1141                	addi	sp,sp,-16
    63ec:	c622                	sw	s0,12(sp)
    63ee:	0800                	addi	s0,sp,16
    __asm__ __volatile__(
    63f0:	004002b7          	lui	t0,0x400
    63f4:	7c02a073          	csrs	mxstatus,t0
        "li    t0, (1 << 22)  \n"   /* theadisaee = bit[22] */
        "csrs  mxstatus, t0   \n"
        ::: "t0"
    );
}
    63f8:	0001                	nop
    63fa:	4432                	lw	s0,12(sp)
    63fc:	0141                	addi	sp,sp,16
    63fe:	8082                	ret

00006400 <cache_disable_all>:


void cache_disable_all(void)
{
    6400:	1141                	addi	sp,sp,-16
    6402:	c606                	sw	ra,12(sp)
    6404:	c422                	sw	s0,8(sp)
    6406:	0800                	addi	s0,sp,16
    /* Step 0: 解锁玄铁扩展 CSR 访问 */
    thead_ext_enable();
    6408:	00000097          	auipc	ra,0x0
    640c:	fe2080e7          	jalr	-30(ra) # 63ea <thead_ext_enable>

    /* Step 1: 读取当前 mhcr 值（用于调试） */
    __asm__ __volatile__("csrr %0, mhcr" : "=r"(g_mhcr_before));
    6410:	7c102773          	csrr	a4,mhcr
    6414:	2000a7b7          	lui	a5,0x2000a
    6418:	74e7a623          	sw	a4,1868(a5) # 2000a74c <g_mhcr_before>
    /* Step 2: 先回写并无效化 D-Cache，再无效化 I-Cache */
//    dcache_flush_by_reg();
//    icache_inv_by_reg();

    /* Step 3: 清除 IE(bit0) 和 DE(bit1) */
    __asm__ __volatile__(
    641c:	42fd                	li	t0,31
    641e:	7c12b073          	csrc	mhcr,t0
        "csrc mhcr, t0   \n"
        ::: "t0"
    );

    /* Step 4: 读取操作后的值 */
    __asm__ __volatile__("csrr %0, mhcr" : "=r"(g_mhcr_after));
    6422:	7c102773          	csrr	a4,mhcr
    6426:	2000a7b7          	lui	a5,0x2000a
    642a:	74e7a823          	sw	a4,1872(a5) # 2000a750 <g_mhcr_after>

    /* Step 5: 指令流同步 */
    __asm__ __volatile__("fence.i" ::: "memory");
    642e:	0000100f          	fence.i
}
    6432:	0001                	nop
    6434:	40b2                	lw	ra,12(sp)
    6436:	4422                	lw	s0,8(sp)
    6438:	0141                	addi	sp,sp,16
    643a:	8082                	ret

0000643c <uart_event_cb>:


static usart_handle_t g_uart0;
int tet_flag=0;
static void uart_event_cb(int32_t idx, usart_event_e event)
{
    643c:	d5010113          	addi	sp,sp,-688
    6440:	2a112623          	sw	ra,684(sp)
    6444:	2a812423          	sw	s0,680(sp)
    6448:	1d00                	addi	s0,sp,688
    644a:	72fd                	lui	t0,0xfffff
    644c:	9116                	add	sp,sp,t0
    644e:	77fd                	lui	a5,0xfffff
    6450:	ff040713          	addi	a4,s0,-16
    6454:	97ba                	add	a5,a5,a4
    6456:	d6a7a623          	sw	a0,-660(a5) # ffffed6c <__heap_end+0xdffded6c>
    645a:	77fd                	lui	a5,0xfffff
    645c:	ff040713          	addi	a4,s0,-16
    6460:	97ba                	add	a5,a5,a4
    6462:	d6b7a423          	sw	a1,-664(a5) # ffffed68 <__heap_end+0xdffded68>
    if (event == USART_EVENT_RECEIVED ||
    6466:	77fd                	lui	a5,0xfffff
    6468:	ff040713          	addi	a4,s0,-16
    646c:	97ba                	add	a5,a5,a4
    646e:	d687a703          	lw	a4,-664(a5) # ffffed68 <__heap_end+0xdffded68>
    6472:	47b9                	li	a5,14
    6474:	00f70b63          	beq	a4,a5,648a <uart_event_cb+0x4e>
    6478:	77fd                	lui	a5,0xfffff
    647a:	ff040713          	addi	a4,s0,-16
    647e:	97ba                	add	a5,a5,a4
    6480:	d687a703          	lw	a4,-664(a5) # ffffed68 <__heap_end+0xdffded68>
    6484:	4785                	li	a5,1
    6486:	06f71163          	bne	a4,a5,64e8 <uart_event_cb+0xac>
        event == USART_EVENT_RECEIVE_COMPLETE) {

        /* 这里是“中断后的安全回调环境” */
		Frame rx_frame;
		int ret;
		ret = uart_recv_frame(g_uart0, &rx_frame);
    648a:	2000a7b7          	lui	a5,0x2000a
    648e:	7547a703          	lw	a4,1876(a5) # 2000a754 <g_uart0>
    6492:	77fd                	lui	a5,0xfffff
    6494:	d7878793          	addi	a5,a5,-648 # ffffed78 <__heap_end+0xdffded78>
    6498:	ff040693          	addi	a3,s0,-16
    649c:	97b6                	add	a5,a5,a3
    649e:	85be                	mv	a1,a5
    64a0:	853a                	mv	a0,a4
    64a2:	00001097          	auipc	ra,0x1
    64a6:	684080e7          	jalr	1668(ra) # 7b26 <uart_recv_frame>
    64aa:	fea42623          	sw	a0,-20(s0)
		
		if (ret == -1) {
    64ae:	fec42703          	lw	a4,-20(s0)
    64b2:	57fd                	li	a5,-1
    64b4:	02f70563          	beq	a4,a5,64de <uart_event_cb+0xa2>
		/* Timeout, keep waiting */ 
		} else if (ret != 0) {
    64b8:	fec42783          	lw	a5,-20(s0)
    64bc:	e38d                	bnez	a5,64de <uart_event_cb+0xa2>
		/* Protocol error, error frame already sent inside uart_recv_frame */

        } else{
			uart_process_frame(g_uart0, &rx_frame);
    64be:	2000a7b7          	lui	a5,0x2000a
    64c2:	7547a703          	lw	a4,1876(a5) # 2000a754 <g_uart0>
    64c6:	77fd                	lui	a5,0xfffff
    64c8:	d7878793          	addi	a5,a5,-648 # ffffed78 <__heap_end+0xdffded78>
    64cc:	ff040693          	addi	a3,s0,-16
    64d0:	97b6                	add	a5,a5,a3
    64d2:	85be                	mv	a1,a5
    64d4:	853a                	mv	a0,a4
    64d6:	00002097          	auipc	ra,0x2
    64da:	966080e7          	jalr	-1690(ra) # 7e3c <uart_process_frame>
		}
		
        /* 可以设置 flag，或者处理数据 */
		tet_flag =1;
    64de:	2000a7b7          	lui	a5,0x2000a
    64e2:	4705                	li	a4,1
    64e4:	74e7ac23          	sw	a4,1880(a5) # 2000a758 <tet_flag>
    }
}
    64e8:	0001                	nop
    64ea:	6285                	lui	t0,0x1
    64ec:	9116                	add	sp,sp,t0
    64ee:	2ac12083          	lw	ra,684(sp)
    64f2:	2a812403          	lw	s0,680(sp)
    64f6:	2b010113          	addi	sp,sp,688
    64fa:	8082                	ret

000064fc <main>:

/* ================================================================== */
/*  main                                                                */
/* ================================================================== */
int main(void)
{
    64fc:	81010113          	addi	sp,sp,-2032
    6500:	7e112623          	sw	ra,2028(sp)
    6504:	7e812423          	sw	s0,2024(sp)
    6508:	7f010413          	addi	s0,sp,2032
    650c:	9b010113          	addi	sp,sp,-1616
    cache_disable_all();
    6510:	00000097          	auipc	ra,0x0
    6514:	ef0080e7          	jalr	-272(ra) # 6400 <cache_disable_all>
    ck_intc_init();
    6518:	00001097          	auipc	ra,0x1
    651c:	402080e7          	jalr	1026(ra) # 791a <ck_intc_init>
    Timer_Interrupt_Init();
    6520:	00000097          	auipc	ra,0x0
    6524:	ebc080e7          	jalr	-324(ra) # 63dc <Timer_Interrupt_Init>

    /* 初始化 UART */
    g_uart0 = csi_usart_initialize(0, uart_event_cb);
    6528:	000067b7          	lui	a5,0x6
    652c:	43c78593          	addi	a1,a5,1084 # 643c <uart_event_cb>
    6530:	4501                	li	a0,0
    6532:	ffffc097          	auipc	ra,0xffffc
    6536:	7d6080e7          	jalr	2006(ra) # 2d08 <csi_usart_initialize>
    653a:	872a                	mv	a4,a0
    653c:	2000a7b7          	lui	a5,0x2000a
    6540:	74e7aa23          	sw	a4,1876(a5) # 2000a754 <g_uart0>
    if (g_uart0 == NULL) { while (1); }
    6544:	2000a7b7          	lui	a5,0x2000a
    6548:	7547a783          	lw	a5,1876(a5) # 2000a754 <g_uart0>
    654c:	e391                	bnez	a5,6550 <main+0x54>
    654e:	a001                	j	654e <main+0x52>

    csi_usart_config(g_uart0,
    6550:	2000a7b7          	lui	a5,0x2000a
    6554:	7547a503          	lw	a0,1876(a5) # 2000a754 <g_uart0>
    6558:	478d                	li	a5,3
    655a:	4701                	li	a4,0
    655c:	4681                	li	a3,0
    655e:	4601                	li	a2,0
    6560:	6595                	lui	a1,0x5
    6562:	b0058593          	addi	a1,a1,-1280 # 4b00 <_ftoa+0x36a>
    6566:	ffffd097          	auipc	ra,0xffffd
    656a:	876080e7          	jalr	-1930(ra) # 2ddc <csi_usart_config>
                     USART_MODE_ASYNCHRONOUS,
                     USART_PARITY_NONE,
                     USART_STOP_BITS_1,
                     USART_DATA_BITS_8);

    csi_usart_set_interrupt(g_uart0, USART_INTR_READ, 1);
    656e:	2000a7b7          	lui	a5,0x2000a
    6572:	7547a783          	lw	a5,1876(a5) # 2000a754 <g_uart0>
    6576:	4605                	li	a2,1
    6578:	4585                	li	a1,1
    657a:	853e                	mv	a0,a5
    657c:	ffffd097          	auipc	ra,0xffffd
    6580:	936080e7          	jalr	-1738(ra) # 2eb2 <csi_usart_set_interrupt>

	{
        uint8_t hello[] = "E906 READY  00000";
    6584:	77fd                	lui	a5,0xfffff
    6586:	7f078793          	addi	a5,a5,2032 # fffff7f0 <__heap_end+0xdffdf7f0>
    658a:	97a2                	add	a5,a5,s0
    658c:	00008737          	lui	a4,0x8
    6590:	3a870713          	addi	a4,a4,936 # 83a8 <__srodata+0xf8>
    6594:	4308                	lw	a0,0(a4)
    6596:	434c                	lw	a1,4(a4)
    6598:	4710                	lw	a2,8(a4)
    659a:	4754                	lw	a3,12(a4)
    659c:	9ca7aa23          	sw	a0,-1580(a5)
    65a0:	9cb7ac23          	sw	a1,-1576(a5)
    65a4:	9cc7ae23          	sw	a2,-1572(a5)
    65a8:	9ed7a023          	sw	a3,-1568(a5)
    65ac:	01075703          	lhu	a4,16(a4)
    65b0:	9ee79223          	sh	a4,-1564(a5)
		
        uart_send_frame(g_uart0, CMD_PONG, hello, (uint16_t)(sizeof(hello) - 1U));
    65b4:	2000a7b7          	lui	a5,0x2000a
    65b8:	7547a703          	lw	a4,1876(a5) # 2000a754 <g_uart0>
    65bc:	77fd                	lui	a5,0xfffff
    65be:	1d478793          	addi	a5,a5,468 # fffff1d4 <__heap_end+0xdffdf1d4>
    65c2:	ff040693          	addi	a3,s0,-16
    65c6:	97b6                	add	a5,a5,a3
    65c8:	46c5                	li	a3,17
    65ca:	863e                	mv	a2,a5
    65cc:	4589                	li	a1,2
    65ce:	853a                	mv	a0,a4
    65d0:	00001097          	auipc	ra,0x1
    65d4:	410080e7          	jalr	1040(ra) # 79e0 <uart_send_frame>
    }

    /* 主循环：等待中断 */
    while (1) {
    65d8:	a001                	j	65d8 <main+0xdc>

000065da <select_mode>:



int select_mode(bool simple,
			int spx_n,
			bool fast){
    65da:	7179                	addi	sp,sp,-48
    65dc:	d622                	sw	s0,44(sp)
    65de:	1800                	addi	s0,sp,48
    65e0:	87aa                	mv	a5,a0
    65e2:	fcb42c23          	sw	a1,-40(s0)
    65e6:	8732                	mv	a4,a2
    65e8:	fcf40fa3          	sb	a5,-33(s0)
    65ec:	87ba                	mv	a5,a4
    65ee:	fcf40f23          	sb	a5,-34(s0)

	int spx_mode;
	if (simple){
    65f2:	fdf44783          	lbu	a5,-33(s0)
    65f6:	c3cd                	beqz	a5,6698 <select_mode+0xbe>
		if (fast){
    65f8:	fde44783          	lbu	a5,-34(s0)
    65fc:	cba1                	beqz	a5,664c <select_mode+0x72>
			switch(spx_n){
    65fe:	fd842703          	lw	a4,-40(s0)
    6602:	02000793          	li	a5,32
    6606:	02f70b63          	beq	a4,a5,663c <select_mode+0x62>
    660a:	fd842703          	lw	a4,-40(s0)
    660e:	02000793          	li	a5,32
    6612:	02e7c963          	blt	a5,a4,6644 <select_mode+0x6a>
    6616:	fd842703          	lw	a4,-40(s0)
    661a:	47c1                	li	a5,16
    661c:	00f70863          	beq	a4,a5,662c <select_mode+0x52>
    6620:	fd842703          	lw	a4,-40(s0)
    6624:	47e1                	li	a5,24
    6626:	00f70763          	beq	a4,a5,6634 <select_mode+0x5a>
    662a:	a829                	j	6644 <select_mode+0x6a>
				case 16:
					spx_mode = 1;
    662c:	4785                	li	a5,1
    662e:	fef42623          	sw	a5,-20(s0)
					break;
    6632:	a221                	j	673a <select_mode+0x160>
				case 24:
					spx_mode = 3;
    6634:	478d                	li	a5,3
    6636:	fef42623          	sw	a5,-20(s0)
					break;
    663a:	a201                	j	673a <select_mode+0x160>
				case 32:
					spx_mode = 5;
    663c:	4795                	li	a5,5
    663e:	fef42623          	sw	a5,-20(s0)
					break;
    6642:	a8e5                	j	673a <select_mode+0x160>
				default:
					spx_mode = 1;
    6644:	4785                	li	a5,1
    6646:	fef42623          	sw	a5,-20(s0)
					break;
    664a:	a8c5                	j	673a <select_mode+0x160>
			}
		} else{
			switch(spx_n){
    664c:	fd842703          	lw	a4,-40(s0)
    6650:	02000793          	li	a5,32
    6654:	02f70a63          	beq	a4,a5,6688 <select_mode+0xae>
    6658:	fd842703          	lw	a4,-40(s0)
    665c:	02000793          	li	a5,32
    6660:	02e7c863          	blt	a5,a4,6690 <select_mode+0xb6>
    6664:	fd842703          	lw	a4,-40(s0)
    6668:	47c1                	li	a5,16
    666a:	00f70863          	beq	a4,a5,667a <select_mode+0xa0>
    666e:	fd842703          	lw	a4,-40(s0)
    6672:	47e1                	li	a5,24
    6674:	00f70663          	beq	a4,a5,6680 <select_mode+0xa6>
    6678:	a821                	j	6690 <select_mode+0xb6>
				case 16:
					spx_mode = 0;
    667a:	fe042623          	sw	zero,-20(s0)
					break;
    667e:	a875                	j	673a <select_mode+0x160>
				case 24:
					spx_mode = 2;
    6680:	4789                	li	a5,2
    6682:	fef42623          	sw	a5,-20(s0)
					break;
    6686:	a855                	j	673a <select_mode+0x160>
				case 32:
					spx_mode = 4;
    6688:	4791                	li	a5,4
    668a:	fef42623          	sw	a5,-20(s0)
					break;
    668e:	a075                	j	673a <select_mode+0x160>
				default:
					spx_mode = 1;
    6690:	4785                	li	a5,1
    6692:	fef42623          	sw	a5,-20(s0)
					break;
    6696:	a055                	j	673a <select_mode+0x160>
			}
		}
	} else {
		if (fast){
    6698:	fde44783          	lbu	a5,-34(s0)
    669c:	cba1                	beqz	a5,66ec <select_mode+0x112>
			switch(spx_n){
    669e:	fd842703          	lw	a4,-40(s0)
    66a2:	02000793          	li	a5,32
    66a6:	02f70b63          	beq	a4,a5,66dc <select_mode+0x102>
    66aa:	fd842703          	lw	a4,-40(s0)
    66ae:	02000793          	li	a5,32
    66b2:	02e7c963          	blt	a5,a4,66e4 <select_mode+0x10a>
    66b6:	fd842703          	lw	a4,-40(s0)
    66ba:	47c1                	li	a5,16
    66bc:	00f70863          	beq	a4,a5,66cc <select_mode+0xf2>
    66c0:	fd842703          	lw	a4,-40(s0)
    66c4:	47e1                	li	a5,24
    66c6:	00f70763          	beq	a4,a5,66d4 <select_mode+0xfa>
    66ca:	a829                	j	66e4 <select_mode+0x10a>
				case 16:
					spx_mode = 1+8;
    66cc:	47a5                	li	a5,9
    66ce:	fef42623          	sw	a5,-20(s0)
					break;
    66d2:	a0a5                	j	673a <select_mode+0x160>
				case 24:
					spx_mode = 3+8;
    66d4:	47ad                	li	a5,11
    66d6:	fef42623          	sw	a5,-20(s0)
					break;
    66da:	a085                	j	673a <select_mode+0x160>
				case 32:
					spx_mode = 5+8;
    66dc:	47b5                	li	a5,13
    66de:	fef42623          	sw	a5,-20(s0)
					break;
    66e2:	a8a1                	j	673a <select_mode+0x160>
				default:
					spx_mode = 1+8;
    66e4:	47a5                	li	a5,9
    66e6:	fef42623          	sw	a5,-20(s0)
					break;
    66ea:	a881                	j	673a <select_mode+0x160>
			}
		} else{
			switch(spx_n){
    66ec:	fd842703          	lw	a4,-40(s0)
    66f0:	02000793          	li	a5,32
    66f4:	02f70b63          	beq	a4,a5,672a <select_mode+0x150>
    66f8:	fd842703          	lw	a4,-40(s0)
    66fc:	02000793          	li	a5,32
    6700:	02e7c963          	blt	a5,a4,6732 <select_mode+0x158>
    6704:	fd842703          	lw	a4,-40(s0)
    6708:	47c1                	li	a5,16
    670a:	00f70863          	beq	a4,a5,671a <select_mode+0x140>
    670e:	fd842703          	lw	a4,-40(s0)
    6712:	47e1                	li	a5,24
    6714:	00f70763          	beq	a4,a5,6722 <select_mode+0x148>
    6718:	a829                	j	6732 <select_mode+0x158>
				case 16:
					spx_mode = 0+8;
    671a:	47a1                	li	a5,8
    671c:	fef42623          	sw	a5,-20(s0)
					break;
    6720:	a829                	j	673a <select_mode+0x160>
				case 24:
					spx_mode = 2+8;
    6722:	47a9                	li	a5,10
    6724:	fef42623          	sw	a5,-20(s0)
					break;
    6728:	a809                	j	673a <select_mode+0x160>
				case 32:
					spx_mode = 4+8;
    672a:	47b1                	li	a5,12
    672c:	fef42623          	sw	a5,-20(s0)
					break;
    6730:	a029                	j	673a <select_mode+0x160>
				default:
					spx_mode = 1+8;
    6732:	47a5                	li	a5,9
    6734:	fef42623          	sw	a5,-20(s0)
					break;
    6738:	0001                	nop
			}
		}
	}

	return spx_mode;
    673a:	fec42783          	lw	a5,-20(s0)
}
    673e:	853e                	mv	a0,a5
    6740:	5432                	lw	s0,44(sp)
    6742:	6145                	addi	sp,sp,48
    6744:	8082                	ret

00006746 <spx_sign>:
			unsigned char *sk,
			unsigned char *pk,
			unsigned char *optrand,
			unsigned char *msg
			
){
    6746:	7159                	addi	sp,sp,-112
    6748:	d686                	sw	ra,108(sp)
    674a:	d4a2                	sw	s0,104(sp)
    674c:	1880                	addi	s0,sp,112
    674e:	fab42423          	sw	a1,-88(s0)
    6752:	fad42223          	sw	a3,-92(s0)
    6756:	fae42023          	sw	a4,-96(s0)
    675a:	f8f42e23          	sw	a5,-100(s0)
    675e:	f9042c23          	sw	a6,-104(s0)
    6762:	f9142a23          	sw	a7,-108(s0)
    6766:	87aa                	mv	a5,a0
    6768:	faf407a3          	sb	a5,-81(s0)
    676c:	87b2                	mv	a5,a2
    676e:	faf40723          	sb	a5,-82(s0)
	int spx_mode, temp;
	unsigned char *rtl_sm;
	U32 c2python_data_bytelen;
	U32 temp_data;
	int padd_80;
	c2python_data_bytelen = smlen;
    6772:	fa042783          	lw	a5,-96(s0)
    6776:	fcf42223          	sw	a5,-60(s0)
	
	spx_mode = select_mode(simple, spx_n, fast);
    677a:	fae44703          	lbu	a4,-82(s0)
    677e:	faf44783          	lbu	a5,-81(s0)
    6782:	863a                	mv	a2,a4
    6784:	fa842583          	lw	a1,-88(s0)
    6788:	853e                	mv	a0,a5
    678a:	00000097          	auipc	ra,0x0
    678e:	e50080e7          	jalr	-432(ra) # 65da <select_mode>
    6792:	fca42023          	sw	a0,-64(s0)
	
	// ---------------------
	// sphincs mode setting
	// ---------------------

	SPX->SPX_MODE     =   (U32)spx_mode;
    6796:	400a07b7          	lui	a5,0x400a0
    679a:	fc042703          	lw	a4,-64(s0)
    679e:	c398                	sw	a4,0(a5)
	SPX->WORK_MODE    =   0x00000002; // gen pk_root
    67a0:	400a07b7          	lui	a5,0x400a0
    67a4:	4709                	li	a4,2
    67a6:	c3d8                	sw	a4,4(a5)
	SPX->SHA3_MODE    =   0x00000000; // sha3 core for sphincs+
    67a8:	400a07b7          	lui	a5,0x400a0
    67ac:	0c07a023          	sw	zero,192(a5) # 400a00c0 <__heap_end+0x200800c0>
	SPX->SPX_INT_CLR  = 0x00000001; // int_st reset
    67b0:	400a07b7          	lui	a5,0x400a0
    67b4:	4705                	li	a4,1
    67b6:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>

	// ---------------------
	// Reg Data Writing
	// ---------------------

	for (int i =0; i < spx_n / 4 ; i++){
    67ba:	fe042623          	sw	zero,-20(s0)
    67be:	a895                	j	6832 <spx_sign+0xec>
		// printf("i = %d \n", i);
		SPX->SK_SEED[i]   =    (((unsigned int)sk[i*4]) |
    67c0:	fec42783          	lw	a5,-20(s0)
    67c4:	078a                	slli	a5,a5,0x2
    67c6:	873e                	mv	a4,a5
    67c8:	f9c42783          	lw	a5,-100(s0)
    67cc:	97ba                	add	a5,a5,a4
    67ce:	0007c783          	lbu	a5,0(a5)
    67d2:	86be                	mv	a3,a5
								((unsigned int)sk[i*4+1] << 8 ) |
    67d4:	fec42783          	lw	a5,-20(s0)
    67d8:	078a                	slli	a5,a5,0x2
    67da:	0785                	addi	a5,a5,1
    67dc:	f9c42703          	lw	a4,-100(s0)
    67e0:	97ba                	add	a5,a5,a4
    67e2:	0007c783          	lbu	a5,0(a5)
    67e6:	07a2                	slli	a5,a5,0x8
		SPX->SK_SEED[i]   =    (((unsigned int)sk[i*4]) |
    67e8:	00f6e733          	or	a4,a3,a5
								((unsigned int)sk[i*4+2] << 16) |
    67ec:	fec42783          	lw	a5,-20(s0)
    67f0:	078a                	slli	a5,a5,0x2
    67f2:	0789                	addi	a5,a5,2
    67f4:	f9c42683          	lw	a3,-100(s0)
    67f8:	97b6                	add	a5,a5,a3
    67fa:	0007c783          	lbu	a5,0(a5)
    67fe:	07c2                	slli	a5,a5,0x10
								((unsigned int)sk[i*4+1] << 8 ) |
    6800:	8f5d                	or	a4,a4,a5
								((unsigned int)sk[i*4+3] << 24));
    6802:	fec42783          	lw	a5,-20(s0)
    6806:	078a                	slli	a5,a5,0x2
    6808:	078d                	addi	a5,a5,3
    680a:	f9c42683          	lw	a3,-100(s0)
    680e:	97b6                	add	a5,a5,a3
    6810:	0007c783          	lbu	a5,0(a5)
    6814:	07e2                	slli	a5,a5,0x18
		SPX->SK_SEED[i]   =    (((unsigned int)sk[i*4]) |
    6816:	400a06b7          	lui	a3,0x400a0
								((unsigned int)sk[i*4+2] << 16) |
    681a:	8f5d                	or	a4,a4,a5
		SPX->SK_SEED[i]   =    (((unsigned int)sk[i*4]) |
    681c:	fec42783          	lw	a5,-20(s0)
    6820:	0791                	addi	a5,a5,4
    6822:	078a                	slli	a5,a5,0x2
    6824:	97b6                	add	a5,a5,a3
    6826:	c3d8                	sw	a4,4(a5)
	for (int i =0; i < spx_n / 4 ; i++){
    6828:	fec42783          	lw	a5,-20(s0)
    682c:	0785                	addi	a5,a5,1
    682e:	fef42623          	sw	a5,-20(s0)
    6832:	fa842783          	lw	a5,-88(s0)
    6836:	41f7d713          	srai	a4,a5,0x1f
    683a:	8b0d                	andi	a4,a4,3
    683c:	97ba                	add	a5,a5,a4
    683e:	8789                	srai	a5,a5,0x2
    6840:	873e                	mv	a4,a5
    6842:	fec42783          	lw	a5,-20(s0)
    6846:	f6e7cde3          	blt	a5,a4,67c0 <spx_sign+0x7a>
	}


	for (int i =0; i < spx_n / 4 ; i++){
    684a:	fe042423          	sw	zero,-24(s0)
    684e:	a895                	j	68c2 <spx_sign+0x17c>
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    6850:	fe842783          	lw	a5,-24(s0)
    6854:	078a                	slli	a5,a5,0x2
    6856:	873e                	mv	a4,a5
    6858:	f9842783          	lw	a5,-104(s0)
    685c:	97ba                	add	a5,a5,a4
    685e:	0007c783          	lbu	a5,0(a5)
    6862:	86be                	mv	a3,a5
								((unsigned int)pk[i*4+1] << 8 ) |
    6864:	fe842783          	lw	a5,-24(s0)
    6868:	078a                	slli	a5,a5,0x2
    686a:	0785                	addi	a5,a5,1
    686c:	f9842703          	lw	a4,-104(s0)
    6870:	97ba                	add	a5,a5,a4
    6872:	0007c783          	lbu	a5,0(a5)
    6876:	07a2                	slli	a5,a5,0x8
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    6878:	00f6e733          	or	a4,a3,a5
								((unsigned int)pk[i*4+2] << 16) |
    687c:	fe842783          	lw	a5,-24(s0)
    6880:	078a                	slli	a5,a5,0x2
    6882:	0789                	addi	a5,a5,2
    6884:	f9842683          	lw	a3,-104(s0)
    6888:	97b6                	add	a5,a5,a3
    688a:	0007c783          	lbu	a5,0(a5)
    688e:	07c2                	slli	a5,a5,0x10
								((unsigned int)pk[i*4+1] << 8 ) |
    6890:	8f5d                	or	a4,a4,a5
								((unsigned int)pk[i*4+3] << 24));
    6892:	fe842783          	lw	a5,-24(s0)
    6896:	078a                	slli	a5,a5,0x2
    6898:	078d                	addi	a5,a5,3
    689a:	f9842683          	lw	a3,-104(s0)
    689e:	97b6                	add	a5,a5,a3
    68a0:	0007c783          	lbu	a5,0(a5)
    68a4:	07e2                	slli	a5,a5,0x18
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    68a6:	400a06b7          	lui	a3,0x400a0
								((unsigned int)pk[i*4+2] << 16) |
    68aa:	8f5d                	or	a4,a4,a5
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    68ac:	fe842783          	lw	a5,-24(s0)
    68b0:	07d1                	addi	a5,a5,20
    68b2:	078a                	slli	a5,a5,0x2
    68b4:	97b6                	add	a5,a5,a3
    68b6:	c3d8                	sw	a4,4(a5)
	for (int i =0; i < spx_n / 4 ; i++){
    68b8:	fe842783          	lw	a5,-24(s0)
    68bc:	0785                	addi	a5,a5,1
    68be:	fef42423          	sw	a5,-24(s0)
    68c2:	fa842783          	lw	a5,-88(s0)
    68c6:	41f7d713          	srai	a4,a5,0x1f
    68ca:	8b0d                	andi	a4,a4,3
    68cc:	97ba                	add	a5,a5,a4
    68ce:	8789                	srai	a5,a5,0x2
    68d0:	873e                	mv	a4,a5
    68d2:	fe842783          	lw	a5,-24(s0)
    68d6:	f6e7cde3          	blt	a5,a4,6850 <spx_sign+0x10a>
	}


	// int_en : enable init
	SPX->SPX_INT_EN = 1;
    68da:	400a07b7          	lui	a5,0x400a0
    68de:	4705                	li	a4,1
    68e0:	10e7a223          	sw	a4,260(a5) # 400a0104 <__heap_end+0x20080104>
	// already gen pk before in process
	
	// ----------------------- Generate R ---------------------- //
	// clear SRAM
	
	for (int i = 0; i < 36; i++){
    68e4:	fe042223          	sw	zero,-28(s0)
    68e8:	a005                	j	6908 <spx_sign+0x1c2>
		SPX->SPX_SRAM[i] = 0x00000000;
    68ea:	400a07b7          	lui	a5,0x400a0
    68ee:	fe442683          	lw	a3,-28(s0)
    68f2:	670d                	lui	a4,0x3
    68f4:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    68f8:	9736                	add	a4,a4,a3
    68fa:	44e7d00b          	srw	zero,a5,a4,2
	for (int i = 0; i < 36; i++){
    68fe:	fe442783          	lw	a5,-28(s0)
    6902:	0785                	addi	a5,a5,1
    6904:	fef42223          	sw	a5,-28(s0)
    6908:	fe442703          	lw	a4,-28(s0)
    690c:	02300793          	li	a5,35
    6910:	fce7dde3          	bge	a5,a4,68ea <spx_sign+0x1a4>
	}

	// write sk_prf to sram
	for (int i =0; i < spx_n / 4 ; i++){
    6914:	fe042023          	sw	zero,-32(s0)
    6918:	a871                	j	69b4 <spx_sign+0x26e>
		SPX->SPX_SRAM[i]     =  (((unsigned int)sk[spx_n + i*4]) |
    691a:	fe042783          	lw	a5,-32(s0)
    691e:	00279713          	slli	a4,a5,0x2
    6922:	fa842783          	lw	a5,-88(s0)
    6926:	97ba                	add	a5,a5,a4
    6928:	873e                	mv	a4,a5
    692a:	f9c42783          	lw	a5,-100(s0)
    692e:	97ba                	add	a5,a5,a4
    6930:	0007c783          	lbu	a5,0(a5) # 400a0000 <__heap_end+0x20080000>
    6934:	86be                	mv	a3,a5
								((unsigned int)sk[spx_n + i*4+1] << 8 ) |
    6936:	fe042783          	lw	a5,-32(s0)
    693a:	00279713          	slli	a4,a5,0x2
    693e:	fa842783          	lw	a5,-88(s0)
    6942:	97ba                	add	a5,a5,a4
    6944:	0785                	addi	a5,a5,1
    6946:	f9c42703          	lw	a4,-100(s0)
    694a:	97ba                	add	a5,a5,a4
    694c:	0007c783          	lbu	a5,0(a5)
    6950:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[i]     =  (((unsigned int)sk[spx_n + i*4]) |
    6952:	00f6e733          	or	a4,a3,a5
								((unsigned int)sk[spx_n + i*4+2] << 16) |
    6956:	fe042783          	lw	a5,-32(s0)
    695a:	00279693          	slli	a3,a5,0x2
    695e:	fa842783          	lw	a5,-88(s0)
    6962:	97b6                	add	a5,a5,a3
    6964:	0789                	addi	a5,a5,2
    6966:	f9c42683          	lw	a3,-100(s0)
    696a:	97b6                	add	a5,a5,a3
    696c:	0007c783          	lbu	a5,0(a5)
    6970:	07c2                	slli	a5,a5,0x10
								((unsigned int)sk[spx_n + i*4+1] << 8 ) |
    6972:	00f766b3          	or	a3,a4,a5
								((unsigned int)sk[spx_n + i*4+3] << 24));
    6976:	fe042783          	lw	a5,-32(s0)
    697a:	00279713          	slli	a4,a5,0x2
    697e:	fa842783          	lw	a5,-88(s0)
    6982:	97ba                	add	a5,a5,a4
    6984:	078d                	addi	a5,a5,3
    6986:	f9c42703          	lw	a4,-100(s0)
    698a:	97ba                	add	a5,a5,a4
    698c:	0007c783          	lbu	a5,0(a5)
    6990:	01879713          	slli	a4,a5,0x18
		SPX->SPX_SRAM[i]     =  (((unsigned int)sk[spx_n + i*4]) |
    6994:	400a07b7          	lui	a5,0x400a0
								((unsigned int)sk[spx_n + i*4+2] << 16) |
    6998:	8ed9                	or	a3,a3,a4
		SPX->SPX_SRAM[i]     =  (((unsigned int)sk[spx_n + i*4]) |
    699a:	fe042603          	lw	a2,-32(s0)
    699e:	670d                	lui	a4,0x3
    69a0:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    69a4:	9732                	add	a4,a4,a2
    69a6:	44e7d68b          	srw	a3,a5,a4,2
	for (int i =0; i < spx_n / 4 ; i++){
    69aa:	fe042783          	lw	a5,-32(s0)
    69ae:	0785                	addi	a5,a5,1
    69b0:	fef42023          	sw	a5,-32(s0)
    69b4:	fa842783          	lw	a5,-88(s0)
    69b8:	41f7d713          	srai	a4,a5,0x1f
    69bc:	8b0d                	andi	a4,a4,3
    69be:	97ba                	add	a5,a5,a4
    69c0:	8789                	srai	a5,a5,0x2
    69c2:	873e                	mv	a4,a5
    69c4:	fe042783          	lw	a5,-32(s0)
    69c8:	f4e7c9e3          	blt	a5,a4,691a <spx_sign+0x1d4>
	}

	// write optrand to  sram
	for (int i =0; i < spx_n / 4 ; i++){
    69cc:	fc042e23          	sw	zero,-36(s0)
    69d0:	a079                	j	6a5e <spx_sign+0x318>
		SPX->SPX_SRAM[spx_n / 4 + i]     =  (((unsigned int)optrand[i*4]) |
    69d2:	fdc42783          	lw	a5,-36(s0)
    69d6:	078a                	slli	a5,a5,0x2
    69d8:	873e                	mv	a4,a5
    69da:	f9442783          	lw	a5,-108(s0)
    69de:	97ba                	add	a5,a5,a4
    69e0:	0007c783          	lbu	a5,0(a5) # 400a0000 <__heap_end+0x20080000>
    69e4:	86be                	mv	a3,a5
											((unsigned int)optrand[i*4+1] << 8 ) |
    69e6:	fdc42783          	lw	a5,-36(s0)
    69ea:	078a                	slli	a5,a5,0x2
    69ec:	0785                	addi	a5,a5,1
    69ee:	f9442703          	lw	a4,-108(s0)
    69f2:	97ba                	add	a5,a5,a4
    69f4:	0007c783          	lbu	a5,0(a5)
    69f8:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[spx_n / 4 + i]     =  (((unsigned int)optrand[i*4]) |
    69fa:	00f6e733          	or	a4,a3,a5
											((unsigned int)optrand[i*4+2] << 16) |
    69fe:	fdc42783          	lw	a5,-36(s0)
    6a02:	078a                	slli	a5,a5,0x2
    6a04:	0789                	addi	a5,a5,2
    6a06:	f9442683          	lw	a3,-108(s0)
    6a0a:	97b6                	add	a5,a5,a3
    6a0c:	0007c783          	lbu	a5,0(a5)
    6a10:	07c2                	slli	a5,a5,0x10
											((unsigned int)optrand[i*4+1] << 8 ) |
    6a12:	00f765b3          	or	a1,a4,a5
											((unsigned int)optrand[i*4+3] << 24));
    6a16:	fdc42783          	lw	a5,-36(s0)
    6a1a:	078a                	slli	a5,a5,0x2
    6a1c:	078d                	addi	a5,a5,3
    6a1e:	f9442703          	lw	a4,-108(s0)
    6a22:	97ba                	add	a5,a5,a4
    6a24:	0007c783          	lbu	a5,0(a5)
    6a28:	01879693          	slli	a3,a5,0x18
		SPX->SPX_SRAM[spx_n / 4 + i]     =  (((unsigned int)optrand[i*4]) |
    6a2c:	400a0737          	lui	a4,0x400a0
    6a30:	fa842783          	lw	a5,-88(s0)
    6a34:	41f7d613          	srai	a2,a5,0x1f
    6a38:	8a0d                	andi	a2,a2,3
    6a3a:	97b2                	add	a5,a5,a2
    6a3c:	8789                	srai	a5,a5,0x2
    6a3e:	863e                	mv	a2,a5
    6a40:	fdc42783          	lw	a5,-36(s0)
    6a44:	963e                	add	a2,a2,a5
											((unsigned int)optrand[i*4+2] << 16) |
    6a46:	8ecd                	or	a3,a3,a1
		SPX->SPX_SRAM[spx_n / 4 + i]     =  (((unsigned int)optrand[i*4]) |
    6a48:	678d                	lui	a5,0x3
    6a4a:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6a4e:	97b2                	add	a5,a5,a2
    6a50:	44f7568b          	srw	a3,a4,a5,2
	for (int i =0; i < spx_n / 4 ; i++){
    6a54:	fdc42783          	lw	a5,-36(s0)
    6a58:	0785                	addi	a5,a5,1
    6a5a:	fcf42e23          	sw	a5,-36(s0)
    6a5e:	fa842783          	lw	a5,-88(s0)
    6a62:	41f7d713          	srai	a4,a5,0x1f
    6a66:	8b0d                	andi	a4,a4,3
    6a68:	97ba                	add	a5,a5,a4
    6a6a:	8789                	srai	a5,a5,0x2
    6a6c:	873e                	mv	a4,a5
    6a6e:	fdc42783          	lw	a5,-36(s0)
    6a72:	f6e7c0e3          	blt	a5,a4,69d2 <spx_sign+0x28c>
	}

	// send msg to sram
	for (int i = 0; i < mlen / 4; i++){
    6a76:	fc042c23          	sw	zero,-40(s0)
    6a7a:	a061                	j	6b02 <spx_sign+0x3bc>
		SPX->SPX_SRAM[(spx_n/4)*2 +i]     =  (((unsigned int)msg[i*4]) |
    6a7c:	fd842783          	lw	a5,-40(s0)
    6a80:	078a                	slli	a5,a5,0x2
    6a82:	873e                	mv	a4,a5
    6a84:	401c                	lw	a5,0(s0)
    6a86:	97ba                	add	a5,a5,a4
    6a88:	0007c783          	lbu	a5,0(a5)
    6a8c:	86be                	mv	a3,a5
											  ((unsigned int)msg[i*4+1] << 8 ) |
    6a8e:	fd842783          	lw	a5,-40(s0)
    6a92:	078a                	slli	a5,a5,0x2
    6a94:	0785                	addi	a5,a5,1
    6a96:	4018                	lw	a4,0(s0)
    6a98:	97ba                	add	a5,a5,a4
    6a9a:	0007c783          	lbu	a5,0(a5)
    6a9e:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[(spx_n/4)*2 +i]     =  (((unsigned int)msg[i*4]) |
    6aa0:	00f6e733          	or	a4,a3,a5
											  ((unsigned int)msg[i*4+2] << 16) |
    6aa4:	fd842783          	lw	a5,-40(s0)
    6aa8:	078a                	slli	a5,a5,0x2
    6aaa:	0789                	addi	a5,a5,2
    6aac:	4014                	lw	a3,0(s0)
    6aae:	97b6                	add	a5,a5,a3
    6ab0:	0007c783          	lbu	a5,0(a5)
    6ab4:	07c2                	slli	a5,a5,0x10
											  ((unsigned int)msg[i*4+1] << 8 ) |
    6ab6:	00f765b3          	or	a1,a4,a5
											  ((unsigned int)msg[i*4+3] << 24));
    6aba:	fd842783          	lw	a5,-40(s0)
    6abe:	078a                	slli	a5,a5,0x2
    6ac0:	078d                	addi	a5,a5,3
    6ac2:	4018                	lw	a4,0(s0)
    6ac4:	97ba                	add	a5,a5,a4
    6ac6:	0007c783          	lbu	a5,0(a5)
    6aca:	01879693          	slli	a3,a5,0x18
		SPX->SPX_SRAM[(spx_n/4)*2 +i]     =  (((unsigned int)msg[i*4]) |
    6ace:	400a0737          	lui	a4,0x400a0
    6ad2:	fa842783          	lw	a5,-88(s0)
    6ad6:	41f7d613          	srai	a2,a5,0x1f
    6ada:	8a0d                	andi	a2,a2,3
    6adc:	97b2                	add	a5,a5,a2
    6ade:	8789                	srai	a5,a5,0x2
    6ae0:	00179613          	slli	a2,a5,0x1
    6ae4:	fd842783          	lw	a5,-40(s0)
    6ae8:	963e                	add	a2,a2,a5
											  ((unsigned int)msg[i*4+2] << 16) |
    6aea:	8ecd                	or	a3,a3,a1
		SPX->SPX_SRAM[(spx_n/4)*2 +i]     =  (((unsigned int)msg[i*4]) |
    6aec:	678d                	lui	a5,0x3
    6aee:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6af2:	97b2                	add	a5,a5,a2
    6af4:	44f7568b          	srw	a3,a4,a5,2
	for (int i = 0; i < mlen / 4; i++){
    6af8:	fd842783          	lw	a5,-40(s0)
    6afc:	0785                	addi	a5,a5,1
    6afe:	fcf42c23          	sw	a5,-40(s0)
    6b02:	fa442783          	lw	a5,-92(s0)
    6b06:	41f7d713          	srai	a4,a5,0x1f
    6b0a:	8b0d                	andi	a4,a4,3
    6b0c:	97ba                	add	a5,a5,a4
    6b0e:	8789                	srai	a5,a5,0x2
    6b10:	873e                	mv	a4,a5
    6b12:	fd842783          	lw	a5,-40(s0)
    6b16:	f6e7c3e3          	blt	a5,a4,6a7c <spx_sign+0x336>
	}
	SPX->SPX_SRAM[(spx_n/4)*2 + mlen/4] = 0x0000001f; // padding
    6b1a:	400a0737          	lui	a4,0x400a0
    6b1e:	fa842783          	lw	a5,-88(s0)
    6b22:	41f7d693          	srai	a3,a5,0x1f
    6b26:	8a8d                	andi	a3,a3,3
    6b28:	97b6                	add	a5,a5,a3
    6b2a:	8789                	srai	a5,a5,0x2
    6b2c:	00179693          	slli	a3,a5,0x1
    6b30:	fa442783          	lw	a5,-92(s0)
    6b34:	41f7d613          	srai	a2,a5,0x1f
    6b38:	8a0d                	andi	a2,a2,3
    6b3a:	97b2                	add	a5,a5,a2
    6b3c:	8789                	srai	a5,a5,0x2
    6b3e:	96be                	add	a3,a3,a5
    6b40:	678d                	lui	a5,0x3
    6b42:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6b46:	97b6                	add	a5,a5,a3
    6b48:	46fd                	li	a3,31
    6b4a:	44f7568b          	srw	a3,a4,a5,2
    padd_80 = ((mlen + 3*spx_n) / 136 + 1) * 136 - 4; 
    6b4e:	fa842703          	lw	a4,-88(s0)
    6b52:	87ba                	mv	a5,a4
    6b54:	0786                	slli	a5,a5,0x1
    6b56:	973e                	add	a4,a4,a5
    6b58:	fa442783          	lw	a5,-92(s0)
    6b5c:	973e                	add	a4,a4,a5
    6b5e:	08800793          	li	a5,136
    6b62:	02f747b3          	div	a5,a4,a5
    6b66:	00178713          	addi	a4,a5,1
    6b6a:	87ba                	mv	a5,a4
    6b6c:	0792                	slli	a5,a5,0x4
    6b6e:	97ba                	add	a5,a5,a4
    6b70:	078e                	slli	a5,a5,0x3
    6b72:	17f1                	addi	a5,a5,-4
    6b74:	faf42e23          	sw	a5,-68(s0)
	SPX->SPX_SRAM[padd_80 / 4] = 0x80000000; // requ mlen % 4 = 0
    6b78:	400a0737          	lui	a4,0x400a0
    6b7c:	fbc42783          	lw	a5,-68(s0)
    6b80:	41f7d693          	srai	a3,a5,0x1f
    6b84:	8a8d                	andi	a3,a3,3
    6b86:	97b6                	add	a5,a5,a3
    6b88:	8789                	srai	a5,a5,0x2
    6b8a:	86be                	mv	a3,a5
    6b8c:	678d                	lui	a5,0x3
    6b8e:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6b92:	97b6                	add	a5,a5,a3
    6b94:	800006b7          	lui	a3,0x80000
    6b98:	44f7568b          	srw	a3,a4,a5,2

	//generate R
	SPX->WORK_MODE = 0x00000003; // work mode : sha3 core
    6b9c:	400a07b7          	lui	a5,0x400a0
    6ba0:	470d                	li	a4,3
    6ba2:	c3d8                	sw	a4,4(a5)
	SPX->SHA3_MODE = 0x0000000c; // shake 256 AS
    6ba4:	400a07b7          	lui	a5,0x400a0
    6ba8:	4731                	li	a4,12
    6baa:	0ce7a023          	sw	a4,192(a5) # 400a00c0 <__heap_end+0x200800c0>
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
    6bae:	400a07b7          	lui	a5,0x400a0
    6bb2:	4705                	li	a4,1
    6bb4:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	
//	SPX->BLOCK_NUM = 0x00000002; // old version need block-num

	SPX->SPX_EN = 0x00000001; // enable
    6bb8:	400a07b7          	lui	a5,0x400a0
    6bbc:	4705                	li	a4,1
    6bbe:	c798                	sw	a4,8(a5)
	
	while((SPX->SPX_INT & 0x1) == 0);
    6bc0:	0001                	nop
    6bc2:	400a07b7          	lui	a5,0x400a0
    6bc6:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    6bca:	8b85                	andi	a5,a5,1
    6bcc:	dbfd                	beqz	a5,6bc2 <spx_sign+0x47c>
	SPX->SPX_INT_CLR = 0x00000001; // clear int_st
    6bce:	400a07b7          	lui	a5,0x400a0
    6bd2:	4705                	li	a4,1
    6bd4:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	
	SPX->LAST_BLK_LEN= (U32)(spx_n / 8); // lastout words num
    6bd8:	fa842783          	lw	a5,-88(s0)
    6bdc:	41f7d713          	srai	a4,a5,0x1f
    6be0:	8b1d                	andi	a4,a4,7
    6be2:	97ba                	add	a5,a5,a4
    6be4:	878d                	srai	a5,a5,0x3
    6be6:	873e                	mv	a4,a5
    6be8:	400a07b7          	lui	a5,0x400a0
    6bec:	0ce7a423          	sw	a4,200(a5) # 400a00c8 <__heap_end+0x200800c8>
	SPX->WRITE_START = 0x00000003; // write start and last write
    6bf0:	400a07b7          	lui	a5,0x400a0
    6bf4:	470d                	li	a4,3
    6bf6:	0ce7a823          	sw	a4,208(a5) # 400a00d0 <__heap_end+0x200800d0>
	
	while((SPX->SPX_INT & 0x1) == 0);
    6bfa:	0001                	nop
    6bfc:	400a07b7          	lui	a5,0x400a0
    6c00:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    6c04:	8b85                	andi	a5,a5,1
    6c06:	dbfd                	beqz	a5,6bfc <spx_sign+0x4b6>
	SPX->SPX_INT_CLR = 1; // int_st reset
    6c08:	400a07b7          	lui	a5,0x400a0
    6c0c:	4705                	li	a4,1
    6c0e:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>


	// ---------------------- Generate md ---------------------- //
	// clear sram to 0 from spx_n
	for (int i = 0; i < 36; i++){
    6c12:	fc042a23          	sw	zero,-44(s0)
    6c16:	a80d                	j	6c48 <spx_sign+0x502>
		SPX->SPX_SRAM[spx_n/4 + i] = 0x00000000;
    6c18:	400a0737          	lui	a4,0x400a0
    6c1c:	fa842783          	lw	a5,-88(s0)
    6c20:	41f7d693          	srai	a3,a5,0x1f
    6c24:	8a8d                	andi	a3,a3,3
    6c26:	97b6                	add	a5,a5,a3
    6c28:	8789                	srai	a5,a5,0x2
    6c2a:	86be                	mv	a3,a5
    6c2c:	fd442783          	lw	a5,-44(s0)
    6c30:	96be                	add	a3,a3,a5
    6c32:	678d                	lui	a5,0x3
    6c34:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6c38:	97b6                	add	a5,a5,a3
    6c3a:	44f7500b          	srw	zero,a4,a5,2
	for (int i = 0; i < 36; i++){
    6c3e:	fd442783          	lw	a5,-44(s0)
    6c42:	0785                	addi	a5,a5,1
    6c44:	fcf42a23          	sw	a5,-44(s0)
    6c48:	fd442703          	lw	a4,-44(s0)
    6c4c:	02300793          	li	a5,35
    6c50:	fce7d4e3          	bge	a5,a4,6c18 <spx_sign+0x4d2>
	}

	// write pk_seed  to sram
	for (int i = 0; i < spx_n/4; i++){
    6c54:	fc042823          	sw	zero,-48(s0)
    6c58:	a079                	j	6ce6 <spx_sign+0x5a0>
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    6c5a:	fd042783          	lw	a5,-48(s0)
    6c5e:	078a                	slli	a5,a5,0x2
    6c60:	873e                	mv	a4,a5
    6c62:	f9842783          	lw	a5,-104(s0)
    6c66:	97ba                	add	a5,a5,a4
    6c68:	0007c783          	lbu	a5,0(a5)
    6c6c:	86be                	mv	a3,a5
									 ((unsigned int)pk[i*4+1] << 8 ) |
    6c6e:	fd042783          	lw	a5,-48(s0)
    6c72:	078a                	slli	a5,a5,0x2
    6c74:	0785                	addi	a5,a5,1
    6c76:	f9842703          	lw	a4,-104(s0)
    6c7a:	97ba                	add	a5,a5,a4
    6c7c:	0007c783          	lbu	a5,0(a5)
    6c80:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    6c82:	00f6e733          	or	a4,a3,a5
									 ((unsigned int)pk[i*4+2] << 16) |
    6c86:	fd042783          	lw	a5,-48(s0)
    6c8a:	078a                	slli	a5,a5,0x2
    6c8c:	0789                	addi	a5,a5,2
    6c8e:	f9842683          	lw	a3,-104(s0)
    6c92:	97b6                	add	a5,a5,a3
    6c94:	0007c783          	lbu	a5,0(a5)
    6c98:	07c2                	slli	a5,a5,0x10
									 ((unsigned int)pk[i*4+1] << 8 ) |
    6c9a:	00f765b3          	or	a1,a4,a5
									 ((unsigned int)pk[i*4+3] << 24));
    6c9e:	fd042783          	lw	a5,-48(s0)
    6ca2:	078a                	slli	a5,a5,0x2
    6ca4:	078d                	addi	a5,a5,3
    6ca6:	f9842703          	lw	a4,-104(s0)
    6caa:	97ba                	add	a5,a5,a4
    6cac:	0007c783          	lbu	a5,0(a5)
    6cb0:	01879693          	slli	a3,a5,0x18
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    6cb4:	400a0737          	lui	a4,0x400a0
    6cb8:	fa842783          	lw	a5,-88(s0)
    6cbc:	41f7d613          	srai	a2,a5,0x1f
    6cc0:	8a0d                	andi	a2,a2,3
    6cc2:	97b2                	add	a5,a5,a2
    6cc4:	8789                	srai	a5,a5,0x2
    6cc6:	863e                	mv	a2,a5
    6cc8:	fd042783          	lw	a5,-48(s0)
    6ccc:	963e                	add	a2,a2,a5
									 ((unsigned int)pk[i*4+2] << 16) |
    6cce:	8ecd                	or	a3,a3,a1
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    6cd0:	678d                	lui	a5,0x3
    6cd2:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6cd6:	97b2                	add	a5,a5,a2
    6cd8:	44f7568b          	srw	a3,a4,a5,2
	for (int i = 0; i < spx_n/4; i++){
    6cdc:	fd042783          	lw	a5,-48(s0)
    6ce0:	0785                	addi	a5,a5,1
    6ce2:	fcf42823          	sw	a5,-48(s0)
    6ce6:	fa842783          	lw	a5,-88(s0)
    6cea:	41f7d713          	srai	a4,a5,0x1f
    6cee:	8b0d                	andi	a4,a4,3
    6cf0:	97ba                	add	a5,a5,a4
    6cf2:	8789                	srai	a5,a5,0x2
    6cf4:	873e                	mv	a4,a5
    6cf6:	fd042783          	lw	a5,-48(s0)
    6cfa:	f6e7c0e3          	blt	a5,a4,6c5a <spx_sign+0x514>
	}

		// read and write pk_root to sram
	for (int i = 0; i < spx_n/4; i++){
    6cfe:	fc042623          	sw	zero,-52(s0)
    6d02:	a0b1                	j	6d4e <spx_sign+0x608>
		temp_data = SPX->PK_ROOT[i];
    6d04:	400a0737          	lui	a4,0x400a0
    6d08:	fcc42783          	lw	a5,-52(s0)
    6d0c:	07f1                	addi	a5,a5,28
    6d0e:	078a                	slli	a5,a5,0x2
    6d10:	97ba                	add	a5,a5,a4
    6d12:	43dc                	lw	a5,4(a5)
    6d14:	faf42c23          	sw	a5,-72(s0)
		SPX->SPX_SRAM[(spx_n/4)*2 + i] = temp_data;
    6d18:	400a0737          	lui	a4,0x400a0
    6d1c:	fa842783          	lw	a5,-88(s0)
    6d20:	41f7d693          	srai	a3,a5,0x1f
    6d24:	8a8d                	andi	a3,a3,3
    6d26:	97b6                	add	a5,a5,a3
    6d28:	8789                	srai	a5,a5,0x2
    6d2a:	00179693          	slli	a3,a5,0x1
    6d2e:	fcc42783          	lw	a5,-52(s0)
    6d32:	96be                	add	a3,a3,a5
    6d34:	678d                	lui	a5,0x3
    6d36:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6d3a:	97b6                	add	a5,a5,a3
    6d3c:	fb842683          	lw	a3,-72(s0)
    6d40:	44f7568b          	srw	a3,a4,a5,2
	for (int i = 0; i < spx_n/4; i++){
    6d44:	fcc42783          	lw	a5,-52(s0)
    6d48:	0785                	addi	a5,a5,1
    6d4a:	fcf42623          	sw	a5,-52(s0)
    6d4e:	fa842783          	lw	a5,-88(s0)
    6d52:	41f7d713          	srai	a4,a5,0x1f
    6d56:	8b0d                	andi	a4,a4,3
    6d58:	97ba                	add	a5,a5,a4
    6d5a:	8789                	srai	a5,a5,0x2
    6d5c:	873e                	mv	a4,a5
    6d5e:	fcc42783          	lw	a5,-52(s0)
    6d62:	fae7c1e3          	blt	a5,a4,6d04 <spx_sign+0x5be>
	}

	// send msg to sram
	for (int i = 0; i < mlen / 4; i++){
    6d66:	fc042423          	sw	zero,-56(s0)
    6d6a:	a071                	j	6df6 <spx_sign+0x6b0>
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    6d6c:	fc842783          	lw	a5,-56(s0)
    6d70:	078a                	slli	a5,a5,0x2
    6d72:	873e                	mv	a4,a5
    6d74:	401c                	lw	a5,0(s0)
    6d76:	97ba                	add	a5,a5,a4
    6d78:	0007c783          	lbu	a5,0(a5)
    6d7c:	86be                	mv	a3,a5
											  ((unsigned int)msg[i*4+1] << 8 ) |
    6d7e:	fc842783          	lw	a5,-56(s0)
    6d82:	078a                	slli	a5,a5,0x2
    6d84:	0785                	addi	a5,a5,1
    6d86:	4018                	lw	a4,0(s0)
    6d88:	97ba                	add	a5,a5,a4
    6d8a:	0007c783          	lbu	a5,0(a5)
    6d8e:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    6d90:	00f6e733          	or	a4,a3,a5
											  ((unsigned int)msg[i*4+2] << 16) |
    6d94:	fc842783          	lw	a5,-56(s0)
    6d98:	078a                	slli	a5,a5,0x2
    6d9a:	0789                	addi	a5,a5,2
    6d9c:	4014                	lw	a3,0(s0)
    6d9e:	97b6                	add	a5,a5,a3
    6da0:	0007c783          	lbu	a5,0(a5)
    6da4:	07c2                	slli	a5,a5,0x10
											  ((unsigned int)msg[i*4+1] << 8 ) |
    6da6:	00f765b3          	or	a1,a4,a5
											  ((unsigned int)msg[i*4+3] << 24));
    6daa:	fc842783          	lw	a5,-56(s0)
    6dae:	078a                	slli	a5,a5,0x2
    6db0:	078d                	addi	a5,a5,3
    6db2:	4018                	lw	a4,0(s0)
    6db4:	97ba                	add	a5,a5,a4
    6db6:	0007c783          	lbu	a5,0(a5)
    6dba:	01879693          	slli	a3,a5,0x18
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    6dbe:	400a0737          	lui	a4,0x400a0
    6dc2:	fa842783          	lw	a5,-88(s0)
    6dc6:	41f7d613          	srai	a2,a5,0x1f
    6dca:	8a0d                	andi	a2,a2,3
    6dcc:	97b2                	add	a5,a5,a2
    6dce:	8789                	srai	a5,a5,0x2
    6dd0:	863e                	mv	a2,a5
    6dd2:	87b2                	mv	a5,a2
    6dd4:	0786                	slli	a5,a5,0x1
    6dd6:	963e                	add	a2,a2,a5
    6dd8:	fc842783          	lw	a5,-56(s0)
    6ddc:	963e                	add	a2,a2,a5
											  ((unsigned int)msg[i*4+2] << 16) |
    6dde:	8ecd                	or	a3,a3,a1
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    6de0:	678d                	lui	a5,0x3
    6de2:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6de6:	97b2                	add	a5,a5,a2
    6de8:	44f7568b          	srw	a3,a4,a5,2
	for (int i = 0; i < mlen / 4; i++){
    6dec:	fc842783          	lw	a5,-56(s0)
    6df0:	0785                	addi	a5,a5,1
    6df2:	fcf42423          	sw	a5,-56(s0)
    6df6:	fa442783          	lw	a5,-92(s0)
    6dfa:	41f7d713          	srai	a4,a5,0x1f
    6dfe:	8b0d                	andi	a4,a4,3
    6e00:	97ba                	add	a5,a5,a4
    6e02:	8789                	srai	a5,a5,0x2
    6e04:	873e                	mv	a4,a5
    6e06:	fc842783          	lw	a5,-56(s0)
    6e0a:	f6e7c1e3          	blt	a5,a4,6d6c <spx_sign+0x626>
	}
	SPX->SPX_SRAM[ (spx_n/4)*3 + mlen/4] = 0x0000001f; // padding 
    6e0e:	400a0737          	lui	a4,0x400a0
    6e12:	fa842783          	lw	a5,-88(s0)
    6e16:	41f7d693          	srai	a3,a5,0x1f
    6e1a:	8a8d                	andi	a3,a3,3
    6e1c:	97b6                	add	a5,a5,a3
    6e1e:	8789                	srai	a5,a5,0x2
    6e20:	86be                	mv	a3,a5
    6e22:	87b6                	mv	a5,a3
    6e24:	0786                	slli	a5,a5,0x1
    6e26:	96be                	add	a3,a3,a5
    6e28:	fa442783          	lw	a5,-92(s0)
    6e2c:	41f7d613          	srai	a2,a5,0x1f
    6e30:	8a0d                	andi	a2,a2,3
    6e32:	97b2                	add	a5,a5,a2
    6e34:	8789                	srai	a5,a5,0x2
    6e36:	96be                	add	a3,a3,a5
    6e38:	678d                	lui	a5,0x3
    6e3a:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6e3e:	97b6                	add	a5,a5,a3
    6e40:	46fd                	li	a3,31
    6e42:	44f7568b          	srw	a3,a4,a5,2
	SPX->SPX_SRAM[ padd_80 / 4] = 0x80000000; // requ mlen % 4 = 0
    6e46:	400a0737          	lui	a4,0x400a0
    6e4a:	fbc42783          	lw	a5,-68(s0)
    6e4e:	41f7d693          	srai	a3,a5,0x1f
    6e52:	8a8d                	andi	a3,a3,3
    6e54:	97b6                	add	a5,a5,a3
    6e56:	8789                	srai	a5,a5,0x2
    6e58:	86be                	mv	a3,a5
    6e5a:	678d                	lui	a5,0x3
    6e5c:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    6e60:	97b6                	add	a5,a5,a3
    6e62:	800006b7          	lui	a3,0x80000
    6e66:	44f7568b          	srw	a3,a4,a5,2

	//generate MD
	SPX->WORK_MODE = 0x00000003; // work mode : sha3 core
    6e6a:	400a07b7          	lui	a5,0x400a0
    6e6e:	470d                	li	a4,3
    6e70:	c3d8                	sw	a4,4(a5)
	SPX->SHA3_MODE = 0x0000000c; // shake 256 AS
    6e72:	400a07b7          	lui	a5,0x400a0
    6e76:	4731                	li	a4,12
    6e78:	0ce7a023          	sw	a4,192(a5) # 400a00c0 <__heap_end+0x200800c0>
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
    6e7c:	400a07b7          	lui	a5,0x400a0
    6e80:	4705                	li	a4,1
    6e82:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	SPX->SPX_EN = 0x00000001; // enable
    6e86:	400a07b7          	lui	a5,0x400a0
    6e8a:	4705                	li	a4,1
    6e8c:	c798                	sw	a4,8(a5)
	
	while((SPX->SPX_INT & 0x1) == 0);
    6e8e:	0001                	nop
    6e90:	400a07b7          	lui	a5,0x400a0
    6e94:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    6e98:	8b85                	andi	a5,a5,1
    6e9a:	dbfd                	beqz	a5,6e90 <spx_sign+0x74a>
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
    6e9c:	400a07b7          	lui	a5,0x400a0
    6ea0:	4705                	li	a4,1
    6ea2:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	

	// --------------------------------------
	// sign
	// --------------------------------------
	SPX->SPX_MODE     =   spx_mode;
    6ea6:	400a07b7          	lui	a5,0x400a0
    6eaa:	fc042703          	lw	a4,-64(s0)
    6eae:	c398                	sw	a4,0(a5)
	SPX->WORK_MODE	=	0x00000000; // sign
    6eb0:	400a07b7          	lui	a5,0x400a0
    6eb4:	0007a223          	sw	zero,4(a5) # 400a0004 <__heap_end+0x20080004>
	SPX->SHA3_MODE    =   0x00000000; // sha3 core for sphincs+
    6eb8:	400a07b7          	lui	a5,0x400a0
    6ebc:	0c07a023          	sw	zero,192(a5) # 400a00c0 <__heap_end+0x200800c0>
	SPX->SPX_INT_CLR	= 	0x00000001;
    6ec0:	400a07b7          	lui	a5,0x400a0
    6ec4:	4705                	li	a4,1
    6ec6:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	
	// begin
	SPX->SPX_EN		=	0x00000001;
    6eca:	400a07b7          	lui	a5,0x400a0
    6ece:	4705                	li	a4,1
    6ed0:	c798                	sw	a4,8(a5)

	// printf("waiting sig \n");
	while((SPX->SPX_INT & 0x1) == 0);
    6ed2:	0001                	nop
    6ed4:	400a07b7          	lui	a5,0x400a0
    6ed8:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    6edc:	8b85                	andi	a5,a5,1
    6ede:	dbfd                	beqz	a5,6ed4 <spx_sign+0x78e>
	SPX->SPX_INT_CLR	= 	0x00000001;
    6ee0:	400a07b7          	lui	a5,0x400a0
    6ee4:	4705                	li	a4,1
    6ee6:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>

}
    6eea:	0001                	nop
    6eec:	50b6                	lw	ra,108(sp)
    6eee:	5426                	lw	s0,104(sp)
    6ef0:	6165                	addi	sp,sp,112
    6ef2:	8082                	ret

00006ef4 <read_sram>:



void read_sram(usart_handle_t uart_device, int smlen){
    6ef4:	98010113          	addi	sp,sp,-1664
    6ef8:	66112e23          	sw	ra,1660(sp)
    6efc:	66812c23          	sw	s0,1656(sp)
    6f00:	68010413          	addi	s0,sp,1664
    6f04:	72f1                	lui	t0,0xffffc
    6f06:	9116                	add	sp,sp,t0
    6f08:	77f1                	lui	a5,0xffffc
    6f0a:	ff040713          	addi	a4,s0,-16
    6f0e:	97ba                	add	a5,a5,a4
    6f10:	98a7ae23          	sw	a0,-1636(a5) # ffffb99c <__heap_end+0xdffdb99c>
    6f14:	77f1                	lui	a5,0xffffc
    6f16:	ff040713          	addi	a4,s0,-16
    6f1a:	97ba                	add	a5,a5,a4
    6f1c:	98b7ac23          	sw	a1,-1640(a5) # ffffb998 <__heap_end+0xdffdb998>

	U32 addr;
	int data_len;
	unsigned char SendBackData[18000];

	addr = 0x00000000;
    6f20:	fe042623          	sw	zero,-20(s0)
	data_len = smlen;
    6f24:	77f1                	lui	a5,0xffffc
    6f26:	ff040713          	addi	a4,s0,-16
    6f2a:	97ba                	add	a5,a5,a4
    6f2c:	9987a783          	lw	a5,-1640(a5) # ffffb998 <__heap_end+0xdffdb998>
    6f30:	fef42223          	sw	a5,-28(s0)
	// read sign from sram
	for(int i=0; i< data_len/4; i++){
    6f34:	fe042423          	sw	zero,-24(s0)
    6f38:	a0fd                	j	7026 <read_sram+0x132>
		SendBackData[3+i*4] = ( (SPX->SPX_SRAM[i]) >> 24 ) & 0xFF;
    6f3a:	400a07b7          	lui	a5,0x400a0
    6f3e:	fe842683          	lw	a3,-24(s0)
    6f42:	670d                	lui	a4,0x3
    6f44:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    6f48:	9736                	add	a4,a4,a3
    6f4a:	44e7c78b          	lrw	a5,a5,a4,2
    6f4e:	0187d713          	srli	a4,a5,0x18
    6f52:	fe842783          	lw	a5,-24(s0)
    6f56:	078a                	slli	a5,a5,0x2
    6f58:	078d                	addi	a5,a5,3
    6f5a:	0ff77713          	andi	a4,a4,255
    6f5e:	76f1                	lui	a3,0xffffc
    6f60:	ff040613          	addi	a2,s0,-16
    6f64:	96b2                	add	a3,a3,a2
    6f66:	97b6                	add	a5,a5,a3
    6f68:	9ae78223          	sb	a4,-1628(a5) # 4009f9a4 <__heap_end+0x2007f9a4>
		SendBackData[2+i*4] = ( (SPX->SPX_SRAM[i]) >> 16 ) & 0xFF;
    6f6c:	400a07b7          	lui	a5,0x400a0
    6f70:	fe842683          	lw	a3,-24(s0)
    6f74:	670d                	lui	a4,0x3
    6f76:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    6f7a:	9736                	add	a4,a4,a3
    6f7c:	44e7c78b          	lrw	a5,a5,a4,2
    6f80:	0107d713          	srli	a4,a5,0x10
    6f84:	fe842783          	lw	a5,-24(s0)
    6f88:	078a                	slli	a5,a5,0x2
    6f8a:	0789                	addi	a5,a5,2
    6f8c:	0ff77713          	andi	a4,a4,255
    6f90:	76f1                	lui	a3,0xffffc
    6f92:	ff040613          	addi	a2,s0,-16
    6f96:	96b2                	add	a3,a3,a2
    6f98:	97b6                	add	a5,a5,a3
    6f9a:	9ae78223          	sb	a4,-1628(a5) # 4009f9a4 <__heap_end+0x2007f9a4>
		SendBackData[1+i*4] = ( (SPX->SPX_SRAM[i]) >> 8 ) & 0xFF;
    6f9e:	400a07b7          	lui	a5,0x400a0
    6fa2:	fe842683          	lw	a3,-24(s0)
    6fa6:	670d                	lui	a4,0x3
    6fa8:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    6fac:	9736                	add	a4,a4,a3
    6fae:	44e7c78b          	lrw	a5,a5,a4,2
    6fb2:	0087d713          	srli	a4,a5,0x8
    6fb6:	fe842783          	lw	a5,-24(s0)
    6fba:	078a                	slli	a5,a5,0x2
    6fbc:	0785                	addi	a5,a5,1
    6fbe:	0ff77713          	andi	a4,a4,255
    6fc2:	76f1                	lui	a3,0xffffc
    6fc4:	ff040613          	addi	a2,s0,-16
    6fc8:	96b2                	add	a3,a3,a2
    6fca:	97b6                	add	a5,a5,a3
    6fcc:	9ae78223          	sb	a4,-1628(a5) # 4009f9a4 <__heap_end+0x2007f9a4>
		SendBackData[0+i*4] =   (SPX->SPX_SRAM[i]) & 0xFF;
    6fd0:	400a07b7          	lui	a5,0x400a0
    6fd4:	fe842683          	lw	a3,-24(s0)
    6fd8:	670d                	lui	a4,0x3
    6fda:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    6fde:	9736                	add	a4,a4,a3
    6fe0:	44e7c70b          	lrw	a4,a5,a4,2
    6fe4:	fe842783          	lw	a5,-24(s0)
    6fe8:	078a                	slli	a5,a5,0x2
    6fea:	0ff77713          	andi	a4,a4,255
    6fee:	76f1                	lui	a3,0xffffc
    6ff0:	ff040613          	addi	a2,s0,-16
    6ff4:	96b2                	add	a3,a3,a2
    6ff6:	97b6                	add	a5,a5,a3
    6ff8:	9ae78223          	sb	a4,-1628(a5) # 4009f9a4 <__heap_end+0x2007f9a4>
		if(SPX->SPX_SRAM[i]==0){
    6ffc:	400a07b7          	lui	a5,0x400a0
    7000:	fe842683          	lw	a3,-24(s0)
    7004:	670d                	lui	a4,0x3
    7006:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    700a:	9736                	add	a4,a4,a3
    700c:	44e7c78b          	lrw	a5,a5,a4,2
    7010:	e791                	bnez	a5,701c <read_sram+0x128>
			addr+=1;
    7012:	fec42783          	lw	a5,-20(s0)
    7016:	0785                	addi	a5,a5,1
    7018:	fef42623          	sw	a5,-20(s0)
	for(int i=0; i< data_len/4; i++){
    701c:	fe842783          	lw	a5,-24(s0)
    7020:	0785                	addi	a5,a5,1
    7022:	fef42423          	sw	a5,-24(s0)
    7026:	fe442783          	lw	a5,-28(s0)
    702a:	41f7d713          	srai	a4,a5,0x1f
    702e:	8b0d                	andi	a4,a4,3
    7030:	97ba                	add	a5,a5,a4
    7032:	8789                	srai	a5,a5,0x2
    7034:	873e                	mv	a4,a5
    7036:	fe842783          	lw	a5,-24(s0)
    703a:	f0e7c0e3          	blt	a5,a4,6f3a <read_sram+0x46>
		}
	}
	uart_send_frame(uart_device, 0xC3, SendBackData, smlen);
    703e:	77f1                	lui	a5,0xffffc
    7040:	ff040713          	addi	a4,s0,-16
    7044:	973e                	add	a4,a4,a5
    7046:	77f1                	lui	a5,0xffffc
    7048:	9a478793          	addi	a5,a5,-1628 # ffffb9a4 <__heap_end+0xdffdb9a4>
    704c:	ff040693          	addi	a3,s0,-16
    7050:	00f68633          	add	a2,a3,a5
    7054:	77f1                	lui	a5,0xffffc
    7056:	ff040693          	addi	a3,s0,-16
    705a:	97b6                	add	a5,a5,a3
    705c:	99872683          	lw	a3,-1640(a4)
    7060:	0c300593          	li	a1,195
    7064:	99c7a503          	lw	a0,-1636(a5) # ffffb99c <__heap_end+0xdffdb99c>
    7068:	00001097          	auipc	ra,0x1
    706c:	978080e7          	jalr	-1672(ra) # 79e0 <uart_send_frame>
//	UART_Transmit(SendBackData, smlen);
}
    7070:	0001                	nop
    7072:	6291                	lui	t0,0x4
    7074:	9116                	add	sp,sp,t0
    7076:	67c12083          	lw	ra,1660(sp)
    707a:	67812403          	lw	s0,1656(sp)
    707e:	68010113          	addi	sp,sp,1664
    7082:	8082                	ret

00007084 <spx_verify_gen_md>:
			bool fast,

			int 		mlen,
			unsigned char *pk,
			unsigned char *sm, // only R
			unsigned char *msg){
    7084:	711d                	addi	sp,sp,-96
    7086:	ce86                	sw	ra,92(sp)
    7088:	cca2                	sw	s0,88(sp)
    708a:	1080                	addi	s0,sp,96
    708c:	fab42c23          	sw	a1,-72(s0)
    7090:	fad42a23          	sw	a3,-76(s0)
    7094:	fae42823          	sw	a4,-80(s0)
    7098:	faf42623          	sw	a5,-84(s0)
    709c:	fb042423          	sw	a6,-88(s0)
    70a0:	87aa                	mv	a5,a0
    70a2:	faf40fa3          	sb	a5,-65(s0)
    70a6:	87b2                	mv	a5,a2
    70a8:	faf40f23          	sb	a5,-66(s0)
	// unsigned char *rtl_sm;

	U32 temp_data;
	int padd_80;
	
	spx_mode = select_mode(simple, spx_n, fast);
    70ac:	fbe44703          	lbu	a4,-66(s0)
    70b0:	fbf44783          	lbu	a5,-65(s0)
    70b4:	863a                	mv	a2,a4
    70b6:	fb842583          	lw	a1,-72(s0)
    70ba:	853e                	mv	a0,a5
    70bc:	fffff097          	auipc	ra,0xfffff
    70c0:	51e080e7          	jalr	1310(ra) # 65da <select_mode>
    70c4:	fca42823          	sw	a0,-48(s0)

	// ---------------------
	// sphincs mode setting
	// ---------------------
	SPX->SPX_MODE       =   spx_mode;
    70c8:	400a07b7          	lui	a5,0x400a0
    70cc:	fd042703          	lw	a4,-48(s0)
    70d0:	c398                	sw	a4,0(a5)
	SPX->SPX_INT_CLR = 0x00000003; // int_st reset
    70d2:	400a07b7          	lui	a5,0x400a0
    70d6:	470d                	li	a4,3
    70d8:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>


	// ---------------------
	// Reg Data Writing
	// ---------------------
	for (int i =0; i < spx_n / 4 ; i++){
    70dc:	fe042623          	sw	zero,-20(s0)
    70e0:	a895                	j	7154 <spx_verify_gen_md+0xd0>
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    70e2:	fec42783          	lw	a5,-20(s0)
    70e6:	078a                	slli	a5,a5,0x2
    70e8:	873e                	mv	a4,a5
    70ea:	fb042783          	lw	a5,-80(s0)
    70ee:	97ba                	add	a5,a5,a4
    70f0:	0007c783          	lbu	a5,0(a5)
    70f4:	86be                	mv	a3,a5
								((unsigned int)pk[i*4+1] << 8 ) |
    70f6:	fec42783          	lw	a5,-20(s0)
    70fa:	078a                	slli	a5,a5,0x2
    70fc:	0785                	addi	a5,a5,1
    70fe:	fb042703          	lw	a4,-80(s0)
    7102:	97ba                	add	a5,a5,a4
    7104:	0007c783          	lbu	a5,0(a5)
    7108:	07a2                	slli	a5,a5,0x8
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    710a:	00f6e733          	or	a4,a3,a5
								((unsigned int)pk[i*4+2] << 16) |
    710e:	fec42783          	lw	a5,-20(s0)
    7112:	078a                	slli	a5,a5,0x2
    7114:	0789                	addi	a5,a5,2
    7116:	fb042683          	lw	a3,-80(s0)
    711a:	97b6                	add	a5,a5,a3
    711c:	0007c783          	lbu	a5,0(a5)
    7120:	07c2                	slli	a5,a5,0x10
								((unsigned int)pk[i*4+1] << 8 ) |
    7122:	8f5d                	or	a4,a4,a5
								((unsigned int)pk[i*4+3] << 24));
    7124:	fec42783          	lw	a5,-20(s0)
    7128:	078a                	slli	a5,a5,0x2
    712a:	078d                	addi	a5,a5,3
    712c:	fb042683          	lw	a3,-80(s0)
    7130:	97b6                	add	a5,a5,a3
    7132:	0007c783          	lbu	a5,0(a5)
    7136:	07e2                	slli	a5,a5,0x18
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    7138:	400a06b7          	lui	a3,0x400a0
								((unsigned int)pk[i*4+2] << 16) |
    713c:	8f5d                	or	a4,a4,a5
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
    713e:	fec42783          	lw	a5,-20(s0)
    7142:	07d1                	addi	a5,a5,20
    7144:	078a                	slli	a5,a5,0x2
    7146:	97b6                	add	a5,a5,a3
    7148:	c3d8                	sw	a4,4(a5)
	for (int i =0; i < spx_n / 4 ; i++){
    714a:	fec42783          	lw	a5,-20(s0)
    714e:	0785                	addi	a5,a5,1
    7150:	fef42623          	sw	a5,-20(s0)
    7154:	fb842783          	lw	a5,-72(s0)
    7158:	41f7d713          	srai	a4,a5,0x1f
    715c:	8b0d                	andi	a4,a4,3
    715e:	97ba                	add	a5,a5,a4
    7160:	8789                	srai	a5,a5,0x2
    7162:	873e                	mv	a4,a5
    7164:	fec42783          	lw	a5,-20(s0)
    7168:	f6e7cde3          	blt	a5,a4,70e2 <spx_verify_gen_md+0x5e>
	}

	for (int i =0; i < spx_n / 4 ; i++){
    716c:	fe042423          	sw	zero,-24(s0)
    7170:	a869                	j	720a <spx_verify_gen_md+0x186>
		SPX->PK_ROOT[i]    =    (((unsigned int)pk[i*4 + spx_n]) |
    7172:	fe842783          	lw	a5,-24(s0)
    7176:	00279713          	slli	a4,a5,0x2
    717a:	fb842783          	lw	a5,-72(s0)
    717e:	97ba                	add	a5,a5,a4
    7180:	873e                	mv	a4,a5
    7182:	fb042783          	lw	a5,-80(s0)
    7186:	97ba                	add	a5,a5,a4
    7188:	0007c783          	lbu	a5,0(a5)
    718c:	86be                	mv	a3,a5
								((unsigned int)pk[i*4+1 + spx_n] << 8 ) |
    718e:	fe842783          	lw	a5,-24(s0)
    7192:	078a                	slli	a5,a5,0x2
    7194:	00178713          	addi	a4,a5,1
    7198:	fb842783          	lw	a5,-72(s0)
    719c:	97ba                	add	a5,a5,a4
    719e:	873e                	mv	a4,a5
    71a0:	fb042783          	lw	a5,-80(s0)
    71a4:	97ba                	add	a5,a5,a4
    71a6:	0007c783          	lbu	a5,0(a5)
    71aa:	07a2                	slli	a5,a5,0x8
		SPX->PK_ROOT[i]    =    (((unsigned int)pk[i*4 + spx_n]) |
    71ac:	00f6e733          	or	a4,a3,a5
								((unsigned int)pk[i*4+2 + spx_n] << 16) |
    71b0:	fe842783          	lw	a5,-24(s0)
    71b4:	078a                	slli	a5,a5,0x2
    71b6:	00278693          	addi	a3,a5,2
    71ba:	fb842783          	lw	a5,-72(s0)
    71be:	97b6                	add	a5,a5,a3
    71c0:	86be                	mv	a3,a5
    71c2:	fb042783          	lw	a5,-80(s0)
    71c6:	97b6                	add	a5,a5,a3
    71c8:	0007c783          	lbu	a5,0(a5)
    71cc:	07c2                	slli	a5,a5,0x10
								((unsigned int)pk[i*4+1 + spx_n] << 8 ) |
    71ce:	8f5d                	or	a4,a4,a5
								((unsigned int)pk[i*4+3 + spx_n] << 24));
    71d0:	fe842783          	lw	a5,-24(s0)
    71d4:	078a                	slli	a5,a5,0x2
    71d6:	00378693          	addi	a3,a5,3
    71da:	fb842783          	lw	a5,-72(s0)
    71de:	97b6                	add	a5,a5,a3
    71e0:	86be                	mv	a3,a5
    71e2:	fb042783          	lw	a5,-80(s0)
    71e6:	97b6                	add	a5,a5,a3
    71e8:	0007c783          	lbu	a5,0(a5)
    71ec:	07e2                	slli	a5,a5,0x18
		SPX->PK_ROOT[i]    =    (((unsigned int)pk[i*4 + spx_n]) |
    71ee:	400a06b7          	lui	a3,0x400a0
								((unsigned int)pk[i*4+2 + spx_n] << 16) |
    71f2:	8f5d                	or	a4,a4,a5
		SPX->PK_ROOT[i]    =    (((unsigned int)pk[i*4 + spx_n]) |
    71f4:	fe842783          	lw	a5,-24(s0)
    71f8:	07f1                	addi	a5,a5,28
    71fa:	078a                	slli	a5,a5,0x2
    71fc:	97b6                	add	a5,a5,a3
    71fe:	c3d8                	sw	a4,4(a5)
	for (int i =0; i < spx_n / 4 ; i++){
    7200:	fe842783          	lw	a5,-24(s0)
    7204:	0785                	addi	a5,a5,1
    7206:	fef42423          	sw	a5,-24(s0)
    720a:	fb842783          	lw	a5,-72(s0)
    720e:	41f7d713          	srai	a4,a5,0x1f
    7212:	8b0d                	andi	a4,a4,3
    7214:	97ba                	add	a5,a5,a4
    7216:	8789                	srai	a5,a5,0x2
    7218:	873e                	mv	a4,a5
    721a:	fe842783          	lw	a5,-24(s0)
    721e:	f4e7cae3          	blt	a5,a4,7172 <spx_verify_gen_md+0xee>
	}

	// int_en
	SPX->SPX_INT_EN = 1;
    7222:	400a07b7          	lui	a5,0x400a0
    7226:	4705                	li	a4,1
    7228:	10e7a223          	sw	a4,260(a5) # 400a0104 <__heap_end+0x20080104>

	// ------------------ generate MD ------------------ //
	//clear sram
	for (int i = 0; i< 36; i++){
    722c:	fe042223          	sw	zero,-28(s0)
    7230:	a005                	j	7250 <spx_verify_gen_md+0x1cc>
		SPX->SPX_SRAM[i] = 0x00000000;
    7232:	400a07b7          	lui	a5,0x400a0
    7236:	fe442683          	lw	a3,-28(s0)
    723a:	670d                	lui	a4,0x3
    723c:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    7240:	9736                	add	a4,a4,a3
    7242:	44e7d00b          	srw	zero,a5,a4,2
	for (int i = 0; i< 36; i++){
    7246:	fe442783          	lw	a5,-28(s0)
    724a:	0785                	addi	a5,a5,1
    724c:	fef42223          	sw	a5,-28(s0)
    7250:	fe442703          	lw	a4,-28(s0)
    7254:	02300793          	li	a5,35
    7258:	fce7dde3          	bge	a5,a4,7232 <spx_verify_gen_md+0x1ae>
	}

	// write R to SRAM
	for (int i = 0; i < spx_n / 4; i++){
    725c:	fe042023          	sw	zero,-32(s0)
    7260:	a8b5                	j	72dc <spx_verify_gen_md+0x258>
		SPX->SPX_SRAM[i] = (((unsigned int)sm[i*4]) |
    7262:	fe042783          	lw	a5,-32(s0)
    7266:	078a                	slli	a5,a5,0x2
    7268:	873e                	mv	a4,a5
    726a:	fac42783          	lw	a5,-84(s0)
    726e:	97ba                	add	a5,a5,a4
    7270:	0007c783          	lbu	a5,0(a5) # 400a0000 <__heap_end+0x20080000>
    7274:	86be                	mv	a3,a5
						   ((unsigned int)sm[i*4+1] << 8 ) |
    7276:	fe042783          	lw	a5,-32(s0)
    727a:	078a                	slli	a5,a5,0x2
    727c:	0785                	addi	a5,a5,1
    727e:	fac42703          	lw	a4,-84(s0)
    7282:	97ba                	add	a5,a5,a4
    7284:	0007c783          	lbu	a5,0(a5)
    7288:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[i] = (((unsigned int)sm[i*4]) |
    728a:	00f6e733          	or	a4,a3,a5
						   ((unsigned int)sm[i*4+2] << 16) |
    728e:	fe042783          	lw	a5,-32(s0)
    7292:	078a                	slli	a5,a5,0x2
    7294:	0789                	addi	a5,a5,2
    7296:	fac42683          	lw	a3,-84(s0)
    729a:	97b6                	add	a5,a5,a3
    729c:	0007c783          	lbu	a5,0(a5)
    72a0:	07c2                	slli	a5,a5,0x10
						   ((unsigned int)sm[i*4+1] << 8 ) |
    72a2:	00f766b3          	or	a3,a4,a5
						   ((unsigned int)sm[i*4+3] << 24));
    72a6:	fe042783          	lw	a5,-32(s0)
    72aa:	078a                	slli	a5,a5,0x2
    72ac:	078d                	addi	a5,a5,3
    72ae:	fac42703          	lw	a4,-84(s0)
    72b2:	97ba                	add	a5,a5,a4
    72b4:	0007c783          	lbu	a5,0(a5)
    72b8:	01879713          	slli	a4,a5,0x18
		SPX->SPX_SRAM[i] = (((unsigned int)sm[i*4]) |
    72bc:	400a07b7          	lui	a5,0x400a0
						   ((unsigned int)sm[i*4+2] << 16) |
    72c0:	8ed9                	or	a3,a3,a4
		SPX->SPX_SRAM[i] = (((unsigned int)sm[i*4]) |
    72c2:	fe042603          	lw	a2,-32(s0)
    72c6:	670d                	lui	a4,0x3
    72c8:	40070713          	addi	a4,a4,1024 # 3400 <csi_timer_start+0x32>
    72cc:	9732                	add	a4,a4,a2
    72ce:	44e7d68b          	srw	a3,a5,a4,2
	for (int i = 0; i < spx_n / 4; i++){
    72d2:	fe042783          	lw	a5,-32(s0)
    72d6:	0785                	addi	a5,a5,1
    72d8:	fef42023          	sw	a5,-32(s0)
    72dc:	fb842783          	lw	a5,-72(s0)
    72e0:	41f7d713          	srai	a4,a5,0x1f
    72e4:	8b0d                	andi	a4,a4,3
    72e6:	97ba                	add	a5,a5,a4
    72e8:	8789                	srai	a5,a5,0x2
    72ea:	873e                	mv	a4,a5
    72ec:	fe042783          	lw	a5,-32(s0)
    72f0:	f6e7c9e3          	blt	a5,a4,7262 <spx_verify_gen_md+0x1de>
	}

	// write pk_seed  to sram
	for (int i = 0; i < spx_n/4; i++){
    72f4:	fc042e23          	sw	zero,-36(s0)
    72f8:	a079                	j	7386 <spx_verify_gen_md+0x302>
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    72fa:	fdc42783          	lw	a5,-36(s0)
    72fe:	078a                	slli	a5,a5,0x2
    7300:	873e                	mv	a4,a5
    7302:	fb042783          	lw	a5,-80(s0)
    7306:	97ba                	add	a5,a5,a4
    7308:	0007c783          	lbu	a5,0(a5) # 400a0000 <__heap_end+0x20080000>
    730c:	86be                	mv	a3,a5
									 ((unsigned int)pk[i*4+1] << 8 ) |
    730e:	fdc42783          	lw	a5,-36(s0)
    7312:	078a                	slli	a5,a5,0x2
    7314:	0785                	addi	a5,a5,1
    7316:	fb042703          	lw	a4,-80(s0)
    731a:	97ba                	add	a5,a5,a4
    731c:	0007c783          	lbu	a5,0(a5)
    7320:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    7322:	00f6e733          	or	a4,a3,a5
									 ((unsigned int)pk[i*4+2] << 16) |
    7326:	fdc42783          	lw	a5,-36(s0)
    732a:	078a                	slli	a5,a5,0x2
    732c:	0789                	addi	a5,a5,2
    732e:	fb042683          	lw	a3,-80(s0)
    7332:	97b6                	add	a5,a5,a3
    7334:	0007c783          	lbu	a5,0(a5)
    7338:	07c2                	slli	a5,a5,0x10
									 ((unsigned int)pk[i*4+1] << 8 ) |
    733a:	00f765b3          	or	a1,a4,a5
									 ((unsigned int)pk[i*4+3] << 24));
    733e:	fdc42783          	lw	a5,-36(s0)
    7342:	078a                	slli	a5,a5,0x2
    7344:	078d                	addi	a5,a5,3
    7346:	fb042703          	lw	a4,-80(s0)
    734a:	97ba                	add	a5,a5,a4
    734c:	0007c783          	lbu	a5,0(a5)
    7350:	01879693          	slli	a3,a5,0x18
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    7354:	400a0737          	lui	a4,0x400a0
    7358:	fb842783          	lw	a5,-72(s0)
    735c:	41f7d613          	srai	a2,a5,0x1f
    7360:	8a0d                	andi	a2,a2,3
    7362:	97b2                	add	a5,a5,a2
    7364:	8789                	srai	a5,a5,0x2
    7366:	863e                	mv	a2,a5
    7368:	fdc42783          	lw	a5,-36(s0)
    736c:	963e                	add	a2,a2,a5
									 ((unsigned int)pk[i*4+2] << 16) |
    736e:	8ecd                	or	a3,a3,a1
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
    7370:	678d                	lui	a5,0x3
    7372:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    7376:	97b2                	add	a5,a5,a2
    7378:	44f7568b          	srw	a3,a4,a5,2
	for (int i = 0; i < spx_n/4; i++){
    737c:	fdc42783          	lw	a5,-36(s0)
    7380:	0785                	addi	a5,a5,1
    7382:	fcf42e23          	sw	a5,-36(s0)
    7386:	fb842783          	lw	a5,-72(s0)
    738a:	41f7d713          	srai	a4,a5,0x1f
    738e:	8b0d                	andi	a4,a4,3
    7390:	97ba                	add	a5,a5,a4
    7392:	8789                	srai	a5,a5,0x2
    7394:	873e                	mv	a4,a5
    7396:	fdc42783          	lw	a5,-36(s0)
    739a:	f6e7c0e3          	blt	a5,a4,72fa <spx_verify_gen_md+0x276>
	}

		// read and write pk_root to sram
	for (int i = 0; i < spx_n/4; i++){
    739e:	fc042c23          	sw	zero,-40(s0)
    73a2:	a0b1                	j	73ee <spx_verify_gen_md+0x36a>
		temp_data = SPX->PK_ROOT[i];
    73a4:	400a0737          	lui	a4,0x400a0
    73a8:	fd842783          	lw	a5,-40(s0)
    73ac:	07f1                	addi	a5,a5,28
    73ae:	078a                	slli	a5,a5,0x2
    73b0:	97ba                	add	a5,a5,a4
    73b2:	43dc                	lw	a5,4(a5)
    73b4:	fcf42423          	sw	a5,-56(s0)
		SPX->SPX_SRAM[(spx_n/4)*2 + i] = temp_data;
    73b8:	400a0737          	lui	a4,0x400a0
    73bc:	fb842783          	lw	a5,-72(s0)
    73c0:	41f7d693          	srai	a3,a5,0x1f
    73c4:	8a8d                	andi	a3,a3,3
    73c6:	97b6                	add	a5,a5,a3
    73c8:	8789                	srai	a5,a5,0x2
    73ca:	00179693          	slli	a3,a5,0x1
    73ce:	fd842783          	lw	a5,-40(s0)
    73d2:	96be                	add	a3,a3,a5
    73d4:	678d                	lui	a5,0x3
    73d6:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    73da:	97b6                	add	a5,a5,a3
    73dc:	fc842683          	lw	a3,-56(s0)
    73e0:	44f7568b          	srw	a3,a4,a5,2
	for (int i = 0; i < spx_n/4; i++){
    73e4:	fd842783          	lw	a5,-40(s0)
    73e8:	0785                	addi	a5,a5,1
    73ea:	fcf42c23          	sw	a5,-40(s0)
    73ee:	fb842783          	lw	a5,-72(s0)
    73f2:	41f7d713          	srai	a4,a5,0x1f
    73f6:	8b0d                	andi	a4,a4,3
    73f8:	97ba                	add	a5,a5,a4
    73fa:	8789                	srai	a5,a5,0x2
    73fc:	873e                	mv	a4,a5
    73fe:	fd842783          	lw	a5,-40(s0)
    7402:	fae7c1e3          	blt	a5,a4,73a4 <spx_verify_gen_md+0x320>
	}

	// send msg to sram
	for (int i = 0; i < mlen / 4; i++){
    7406:	fc042a23          	sw	zero,-44(s0)
    740a:	a851                	j	749e <spx_verify_gen_md+0x41a>
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    740c:	fd442783          	lw	a5,-44(s0)
    7410:	078a                	slli	a5,a5,0x2
    7412:	873e                	mv	a4,a5
    7414:	fa842783          	lw	a5,-88(s0)
    7418:	97ba                	add	a5,a5,a4
    741a:	0007c783          	lbu	a5,0(a5)
    741e:	86be                	mv	a3,a5
											  ((unsigned int)msg[i*4+1] << 8 ) |
    7420:	fd442783          	lw	a5,-44(s0)
    7424:	078a                	slli	a5,a5,0x2
    7426:	0785                	addi	a5,a5,1
    7428:	fa842703          	lw	a4,-88(s0)
    742c:	97ba                	add	a5,a5,a4
    742e:	0007c783          	lbu	a5,0(a5)
    7432:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    7434:	00f6e733          	or	a4,a3,a5
											  ((unsigned int)msg[i*4+2] << 16) |
    7438:	fd442783          	lw	a5,-44(s0)
    743c:	078a                	slli	a5,a5,0x2
    743e:	0789                	addi	a5,a5,2
    7440:	fa842683          	lw	a3,-88(s0)
    7444:	97b6                	add	a5,a5,a3
    7446:	0007c783          	lbu	a5,0(a5)
    744a:	07c2                	slli	a5,a5,0x10
											  ((unsigned int)msg[i*4+1] << 8 ) |
    744c:	00f765b3          	or	a1,a4,a5
											  ((unsigned int)msg[i*4+3] << 24));
    7450:	fd442783          	lw	a5,-44(s0)
    7454:	078a                	slli	a5,a5,0x2
    7456:	078d                	addi	a5,a5,3
    7458:	fa842703          	lw	a4,-88(s0)
    745c:	97ba                	add	a5,a5,a4
    745e:	0007c783          	lbu	a5,0(a5)
    7462:	01879693          	slli	a3,a5,0x18
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    7466:	400a0737          	lui	a4,0x400a0
    746a:	fb842783          	lw	a5,-72(s0)
    746e:	41f7d613          	srai	a2,a5,0x1f
    7472:	8a0d                	andi	a2,a2,3
    7474:	97b2                	add	a5,a5,a2
    7476:	8789                	srai	a5,a5,0x2
    7478:	863e                	mv	a2,a5
    747a:	87b2                	mv	a5,a2
    747c:	0786                	slli	a5,a5,0x1
    747e:	963e                	add	a2,a2,a5
    7480:	fd442783          	lw	a5,-44(s0)
    7484:	963e                	add	a2,a2,a5
											  ((unsigned int)msg[i*4+2] << 16) |
    7486:	8ecd                	or	a3,a3,a1
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
    7488:	678d                	lui	a5,0x3
    748a:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    748e:	97b2                	add	a5,a5,a2
    7490:	44f7568b          	srw	a3,a4,a5,2
	for (int i = 0; i < mlen / 4; i++){
    7494:	fd442783          	lw	a5,-44(s0)
    7498:	0785                	addi	a5,a5,1
    749a:	fcf42a23          	sw	a5,-44(s0)
    749e:	fb442783          	lw	a5,-76(s0)
    74a2:	41f7d713          	srai	a4,a5,0x1f
    74a6:	8b0d                	andi	a4,a4,3
    74a8:	97ba                	add	a5,a5,a4
    74aa:	8789                	srai	a5,a5,0x2
    74ac:	873e                	mv	a4,a5
    74ae:	fd442783          	lw	a5,-44(s0)
    74b2:	f4e7cde3          	blt	a5,a4,740c <spx_verify_gen_md+0x388>
	}
	SPX->SPX_SRAM[(spx_n/4)*3 + mlen/4] = 0x0000001f; // padding 
    74b6:	400a0737          	lui	a4,0x400a0
    74ba:	fb842783          	lw	a5,-72(s0)
    74be:	41f7d693          	srai	a3,a5,0x1f
    74c2:	8a8d                	andi	a3,a3,3
    74c4:	97b6                	add	a5,a5,a3
    74c6:	8789                	srai	a5,a5,0x2
    74c8:	86be                	mv	a3,a5
    74ca:	87b6                	mv	a5,a3
    74cc:	0786                	slli	a5,a5,0x1
    74ce:	96be                	add	a3,a3,a5
    74d0:	fb442783          	lw	a5,-76(s0)
    74d4:	41f7d613          	srai	a2,a5,0x1f
    74d8:	8a0d                	andi	a2,a2,3
    74da:	97b2                	add	a5,a5,a2
    74dc:	8789                	srai	a5,a5,0x2
    74de:	96be                	add	a3,a3,a5
    74e0:	678d                	lui	a5,0x3
    74e2:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    74e6:	97b6                	add	a5,a5,a3
    74e8:	46fd                	li	a3,31
    74ea:	44f7568b          	srw	a3,a4,a5,2
	padd_80 = ((mlen + 3*spx_n) / 136 + 1) * 136 - 4;
    74ee:	fb842703          	lw	a4,-72(s0)
    74f2:	87ba                	mv	a5,a4
    74f4:	0786                	slli	a5,a5,0x1
    74f6:	973e                	add	a4,a4,a5
    74f8:	fb442783          	lw	a5,-76(s0)
    74fc:	973e                	add	a4,a4,a5
    74fe:	08800793          	li	a5,136
    7502:	02f747b3          	div	a5,a4,a5
    7506:	00178713          	addi	a4,a5,1
    750a:	87ba                	mv	a5,a4
    750c:	0792                	slli	a5,a5,0x4
    750e:	97ba                	add	a5,a5,a4
    7510:	078e                	slli	a5,a5,0x3
    7512:	17f1                	addi	a5,a5,-4
    7514:	fcf42623          	sw	a5,-52(s0)
	SPX->SPX_SRAM[padd_80 / 4] = 0x80000000; // requ mlen % 4 = 0
    7518:	400a0737          	lui	a4,0x400a0
    751c:	fcc42783          	lw	a5,-52(s0)
    7520:	41f7d693          	srai	a3,a5,0x1f
    7524:	8a8d                	andi	a3,a3,3
    7526:	97b6                	add	a5,a5,a3
    7528:	8789                	srai	a5,a5,0x2
    752a:	86be                	mv	a3,a5
    752c:	678d                	lui	a5,0x3
    752e:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    7532:	97b6                	add	a5,a5,a3
    7534:	800006b7          	lui	a3,0x80000
    7538:	44f7568b          	srw	a3,a4,a5,2

	//generate MD
	SPX->WORK_MODE = 0x00000003; // work mode : sha3 core
    753c:	400a07b7          	lui	a5,0x400a0
    7540:	470d                	li	a4,3
    7542:	c3d8                	sw	a4,4(a5)
	SPX->SHA3_MODE = 0x0000000c; // shake 256 AS
    7544:	400a07b7          	lui	a5,0x400a0
    7548:	4731                	li	a4,12
    754a:	0ce7a023          	sw	a4,192(a5) # 400a00c0 <__heap_end+0x200800c0>
//	SPX->BLOCK_NUM = 0x00000002; // old version need block-num
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
    754e:	400a07b7          	lui	a5,0x400a0
    7552:	4705                	li	a4,1
    7554:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	SPX->SPX_EN = 0x00000001; // enable
    7558:	400a07b7          	lui	a5,0x400a0
    755c:	4705                	li	a4,1
    755e:	c798                	sw	a4,8(a5)

	while((SPX->SPX_INT & 0x1) == 0);
    7560:	0001                	nop
    7562:	400a07b7          	lui	a5,0x400a0
    7566:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    756a:	8b85                	andi	a5,a5,1
    756c:	dbfd                	beqz	a5,7562 <spx_verify_gen_md+0x4de>
	
	SPX->SPX_INT_CLR = 0x00000001; // clear int_st
    756e:	400a07b7          	lui	a5,0x400a0
    7572:	4705                	li	a4,1
    7574:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	//while((*(SPX_INT) & 0x1) == 0);

	//*(SPX_INT_CLR) = 0x00000001; // int_st reset
	

}
    7578:	0001                	nop
    757a:	40f6                	lw	ra,92(sp)
    757c:	4466                	lw	s0,88(sp)
    757e:	6125                	addi	sp,sp,96
    7580:	8082                	ret

00007582 <spx_verify>:

// ============================== verify =============================== //
unsigned char spx_verify(bool simple,
			int spx_n,
			bool fast){
    7582:	7179                	addi	sp,sp,-48
    7584:	d606                	sw	ra,44(sp)
    7586:	d422                	sw	s0,40(sp)
    7588:	1800                	addi	s0,sp,48
    758a:	87aa                	mv	a5,a0
    758c:	fcb42c23          	sw	a1,-40(s0)
    7590:	8732                	mv	a4,a2
    7592:	fcf40fa3          	sb	a5,-33(s0)
    7596:	87ba                	mv	a5,a4
    7598:	fcf40f23          	sb	a5,-34(s0)
	unsigned char temp_data;
	double temp_time;
	unsigned char SendBackData[4];
	
	
	spx_mode = select_mode(simple, spx_n, fast);
    759c:	fde44703          	lbu	a4,-34(s0)
    75a0:	fdf44783          	lbu	a5,-33(s0)
    75a4:	863a                	mv	a2,a4
    75a6:	fd842583          	lw	a1,-40(s0)
    75aa:	853e                	mv	a0,a5
    75ac:	fffff097          	auipc	ra,0xfffff
    75b0:	02e080e7          	jalr	46(ra) # 65da <select_mode>
    75b4:	fea42623          	sw	a0,-20(s0)

	// ---------------------
	// sphincs mode setting
	// ---------------------
	SPX->SPX_MODE       =   spx_mode;
    75b8:	400a07b7          	lui	a5,0x400a0
    75bc:	fec42703          	lw	a4,-20(s0)
    75c0:	c398                	sw	a4,0(a5)
	SPX->SPX_INT_EN = 0x00000001;
    75c2:	400a07b7          	lui	a5,0x400a0
    75c6:	4705                	li	a4,1
    75c8:	10e7a223          	sw	a4,260(a5) # 400a0104 <__heap_end+0x20080104>

	// verify
	SPX->WORK_MODE	=	0x00000001; // verify
    75cc:	400a07b7          	lui	a5,0x400a0
    75d0:	4705                	li	a4,1
    75d2:	c3d8                	sw	a4,4(a5)
	SPX->SHA3_MODE = 0x00000000; // sphincs
    75d4:	400a07b7          	lui	a5,0x400a0
    75d8:	0c07a023          	sw	zero,192(a5) # 400a00c0 <__heap_end+0x200800c0>
	SPX->SPX_INT_CLR	=	0x00000001;
    75dc:	400a07b7          	lui	a5,0x400a0
    75e0:	4705                	li	a4,1
    75e2:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>

	SPX->SPX_EN		=	0x00000001;
    75e6:	400a07b7          	lui	a5,0x400a0
    75ea:	4705                	li	a4,1
    75ec:	c798                	sw	a4,8(a5)
	while((SPX->SPX_INT & 0x1) == 0);
    75ee:	0001                	nop
    75f0:	400a07b7          	lui	a5,0x400a0
    75f4:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    75f8:	8b85                	andi	a5,a5,1
    75fa:	dbfd                	beqz	a5,75f0 <spx_verify+0x6e>

	temp_data = (SPX->SPX_INT & 0x3);
    75fc:	400a07b7          	lui	a5,0x400a0
    7600:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    7604:	0ff7f793          	andi	a5,a5,255
    7608:	8b8d                	andi	a5,a5,3
    760a:	fef405a3          	sb	a5,-21(s0)
	
	SPX->SPX_INT_CLR	=	0x00000003; // clean verify pass and spx_int
    760e:	400a07b7          	lui	a5,0x400a0
    7612:	470d                	li	a4,3
    7614:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
//	SendBackData[0] =  temp_data & 0xFF;
//
//	UART_Transmit(SendBackData, 4);
//	spx_reset(simple, spx_n, fast);
	
	return temp_data;
    7618:	feb44783          	lbu	a5,-21(s0)
	
//	spx_reset(simple, spx_n, fast);


}
    761c:	853e                	mv	a0,a5
    761e:	50b2                	lw	ra,44(sp)
    7620:	5422                	lw	s0,40(sp)
    7622:	6145                	addi	sp,sp,48
    7624:	8082                	ret

00007626 <write_sram>:




void write_sram(unsigned short addr, unsigned short data_len, unsigned char *Data){
    7626:	7179                	addi	sp,sp,-48
    7628:	d622                	sw	s0,44(sp)
    762a:	1800                	addi	s0,sp,48
    762c:	87aa                	mv	a5,a0
    762e:	872e                	mv	a4,a1
    7630:	fcc42c23          	sw	a2,-40(s0)
    7634:	fcf41f23          	sh	a5,-34(s0)
    7638:	87ba                	mv	a5,a4
    763a:	fcf41e23          	sh	a5,-36(s0)
	
	
	
	// read sign from sram
	for(int i=0; i< data_len; i=i+4){
    763e:	fe042623          	sw	zero,-20(s0)
    7642:	a071                	j	76ce <write_sram+0xa8>
		SPX->SPX_SRAM[addr/4 + i/4] =  (((unsigned int)Data[i]) |
    7644:	fec42783          	lw	a5,-20(s0)
    7648:	fd842703          	lw	a4,-40(s0)
    764c:	97ba                	add	a5,a5,a4
    764e:	0007c783          	lbu	a5,0(a5)
    7652:	86be                	mv	a3,a5
										((unsigned int)Data[i+1] << 8 ) |
    7654:	fec42783          	lw	a5,-20(s0)
    7658:	0785                	addi	a5,a5,1
    765a:	fd842703          	lw	a4,-40(s0)
    765e:	97ba                	add	a5,a5,a4
    7660:	0007c783          	lbu	a5,0(a5)
    7664:	07a2                	slli	a5,a5,0x8
		SPX->SPX_SRAM[addr/4 + i/4] =  (((unsigned int)Data[i]) |
    7666:	00f6e733          	or	a4,a3,a5
										((unsigned int)Data[i+2] << 16) |
    766a:	fec42783          	lw	a5,-20(s0)
    766e:	0789                	addi	a5,a5,2
    7670:	fd842683          	lw	a3,-40(s0)
    7674:	97b6                	add	a5,a5,a3
    7676:	0007c783          	lbu	a5,0(a5)
    767a:	07c2                	slli	a5,a5,0x10
										((unsigned int)Data[i+1] << 8 ) |
    767c:	00f765b3          	or	a1,a4,a5
										((unsigned int)Data[i+3] << 24));
    7680:	fec42783          	lw	a5,-20(s0)
    7684:	078d                	addi	a5,a5,3
    7686:	fd842703          	lw	a4,-40(s0)
    768a:	97ba                	add	a5,a5,a4
    768c:	0007c783          	lbu	a5,0(a5)
    7690:	01879693          	slli	a3,a5,0x18
		SPX->SPX_SRAM[addr/4 + i/4] =  (((unsigned int)Data[i]) |
    7694:	400a0737          	lui	a4,0x400a0
    7698:	fde45783          	lhu	a5,-34(s0)
    769c:	8389                	srli	a5,a5,0x2
    769e:	3c07b78b          	extu	a5,a5,15,0
    76a2:	853e                	mv	a0,a5
    76a4:	fec42783          	lw	a5,-20(s0)
    76a8:	41f7d613          	srai	a2,a5,0x1f
    76ac:	8a0d                	andi	a2,a2,3
    76ae:	97b2                	add	a5,a5,a2
    76b0:	8789                	srai	a5,a5,0x2
    76b2:	00f50633          	add	a2,a0,a5
										((unsigned int)Data[i+2] << 16) |
    76b6:	8ecd                	or	a3,a3,a1
		SPX->SPX_SRAM[addr/4 + i/4] =  (((unsigned int)Data[i]) |
    76b8:	678d                	lui	a5,0x3
    76ba:	40078793          	addi	a5,a5,1024 # 3400 <csi_timer_start+0x32>
    76be:	97b2                	add	a5,a5,a2
    76c0:	44f7568b          	srw	a3,a4,a5,2
	for(int i=0; i< data_len; i=i+4){
    76c4:	fec42783          	lw	a5,-20(s0)
    76c8:	0791                	addi	a5,a5,4
    76ca:	fef42623          	sw	a5,-20(s0)
    76ce:	fdc45783          	lhu	a5,-36(s0)
    76d2:	fec42703          	lw	a4,-20(s0)
    76d6:	f6f747e3          	blt	a4,a5,7644 <write_sram+0x1e>
	}
}
    76da:	0001                	nop
    76dc:	0001                	nop
    76de:	5432                	lw	s0,44(sp)
    76e0:	6145                	addi	sp,sp,48
    76e2:	8082                	ret

000076e4 <spx_gen_pk>:

			unsigned char *sk,
			unsigned char *pk,
			unsigned int *pk_root
			
){
    76e4:	715d                	addi	sp,sp,-80
    76e6:	c686                	sw	ra,76(sp)
    76e8:	c4a2                	sw	s0,72(sp)
    76ea:	0880                	addi	s0,sp,80
    76ec:	fcb42423          	sw	a1,-56(s0)
    76f0:	fcd42223          	sw	a3,-60(s0)
    76f4:	fce42023          	sw	a4,-64(s0)
    76f8:	faf42e23          	sw	a5,-68(s0)
    76fc:	87aa                	mv	a5,a0
    76fe:	fcf407a3          	sb	a5,-49(s0)
    7702:	87b2                	mv	a5,a2
    7704:	fcf40723          	sb	a5,-50(s0)
	int spx_mode, temp;
	U32 temp_data;
	U32 test_watch_1, test_watch_2;

	spx_mode = select_mode(simple, spx_n, fast);
    7708:	fce44703          	lbu	a4,-50(s0)
    770c:	fcf44783          	lbu	a5,-49(s0)
    7710:	863a                	mv	a2,a4
    7712:	fc842583          	lw	a1,-56(s0)
    7716:	853e                	mv	a0,a5
    7718:	fffff097          	auipc	ra,0xfffff
    771c:	ec2080e7          	jalr	-318(ra) # 65da <select_mode>
    7720:	fca42e23          	sw	a0,-36(s0)
	
	// ---------------------
	// sphincs mode setting
	// ---------------------

	SPX->SPX_MODE      =   	(U32)spx_mode;
    7724:	400a07b7          	lui	a5,0x400a0
    7728:	fdc42703          	lw	a4,-36(s0)
    772c:	c398                	sw	a4,0(a5)
	SPX->SPX_INT_CLR   = 	0x03;
    772e:	400a07b7          	lui	a5,0x400a0
    7732:	470d                	li	a4,3
    7734:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
	SPX->WORK_MODE     =   	0x02; // gen pk_root
    7738:	400a07b7          	lui	a5,0x400a0
    773c:	4709                	li	a4,2
    773e:	c3d8                	sw	a4,4(a5)
	SPX->SHA3_MODE     =    0x00; // sha3 core for sphincs+
    7740:	400a07b7          	lui	a5,0x400a0
    7744:	0c07a023          	sw	zero,192(a5) # 400a00c0 <__heap_end+0x200800c0>

	// ---------------------
	// Reg Data Writing
	// ---------------------

	for (int i =0; i < spx_n / 4 ; i++){
    7748:	fe042623          	sw	zero,-20(s0)
    774c:	a895                	j	77c0 <spx_gen_pk+0xdc>
		// printf("i = %d \n", i);
		SPX->SK_SEED[i]    =   (((unsigned int)sk[i*4+0]) |
    774e:	fec42783          	lw	a5,-20(s0)
    7752:	078a                	slli	a5,a5,0x2
    7754:	873e                	mv	a4,a5
    7756:	fc442783          	lw	a5,-60(s0)
    775a:	97ba                	add	a5,a5,a4
    775c:	0007c783          	lbu	a5,0(a5)
    7760:	86be                	mv	a3,a5
								((unsigned int)sk[i*4+1] << 8 ) |
    7762:	fec42783          	lw	a5,-20(s0)
    7766:	078a                	slli	a5,a5,0x2
    7768:	0785                	addi	a5,a5,1
    776a:	fc442703          	lw	a4,-60(s0)
    776e:	97ba                	add	a5,a5,a4
    7770:	0007c783          	lbu	a5,0(a5)
    7774:	07a2                	slli	a5,a5,0x8
		SPX->SK_SEED[i]    =   (((unsigned int)sk[i*4+0]) |
    7776:	00f6e733          	or	a4,a3,a5
								((unsigned int)sk[i*4+2] << 16) |
    777a:	fec42783          	lw	a5,-20(s0)
    777e:	078a                	slli	a5,a5,0x2
    7780:	0789                	addi	a5,a5,2
    7782:	fc442683          	lw	a3,-60(s0)
    7786:	97b6                	add	a5,a5,a3
    7788:	0007c783          	lbu	a5,0(a5)
    778c:	07c2                	slli	a5,a5,0x10
								((unsigned int)sk[i*4+1] << 8 ) |
    778e:	8f5d                	or	a4,a4,a5
								((unsigned int)sk[i*4+3] << 24));
    7790:	fec42783          	lw	a5,-20(s0)
    7794:	078a                	slli	a5,a5,0x2
    7796:	078d                	addi	a5,a5,3
    7798:	fc442683          	lw	a3,-60(s0)
    779c:	97b6                	add	a5,a5,a3
    779e:	0007c783          	lbu	a5,0(a5)
    77a2:	07e2                	slli	a5,a5,0x18
		SPX->SK_SEED[i]    =   (((unsigned int)sk[i*4+0]) |
    77a4:	400a06b7          	lui	a3,0x400a0
								((unsigned int)sk[i*4+2] << 16) |
    77a8:	8f5d                	or	a4,a4,a5
		SPX->SK_SEED[i]    =   (((unsigned int)sk[i*4+0]) |
    77aa:	fec42783          	lw	a5,-20(s0)
    77ae:	0791                	addi	a5,a5,4
    77b0:	078a                	slli	a5,a5,0x2
    77b2:	97b6                	add	a5,a5,a3
    77b4:	c3d8                	sw	a4,4(a5)
	for (int i =0; i < spx_n / 4 ; i++){
    77b6:	fec42783          	lw	a5,-20(s0)
    77ba:	0785                	addi	a5,a5,1
    77bc:	fef42623          	sw	a5,-20(s0)
    77c0:	fc842783          	lw	a5,-56(s0)
    77c4:	41f7d713          	srai	a4,a5,0x1f
    77c8:	8b0d                	andi	a4,a4,3
    77ca:	97ba                	add	a5,a5,a4
    77cc:	8789                	srai	a5,a5,0x2
    77ce:	873e                	mv	a4,a5
    77d0:	fec42783          	lw	a5,-20(s0)
    77d4:	f6e7cde3          	blt	a5,a4,774e <spx_gen_pk+0x6a>
	}


	for (int i =0; i < spx_n / 4 ; i++){
    77d8:	fe042423          	sw	zero,-24(s0)
    77dc:	a895                	j	7850 <spx_gen_pk+0x16c>
		SPX->PK_SEED[i]    =   (((unsigned int)pk[i*4+0]) |
    77de:	fe842783          	lw	a5,-24(s0)
    77e2:	078a                	slli	a5,a5,0x2
    77e4:	873e                	mv	a4,a5
    77e6:	fc042783          	lw	a5,-64(s0)
    77ea:	97ba                	add	a5,a5,a4
    77ec:	0007c783          	lbu	a5,0(a5)
    77f0:	86be                	mv	a3,a5
								((unsigned int)pk[i*4+1] << 8 ) |
    77f2:	fe842783          	lw	a5,-24(s0)
    77f6:	078a                	slli	a5,a5,0x2
    77f8:	0785                	addi	a5,a5,1
    77fa:	fc042703          	lw	a4,-64(s0)
    77fe:	97ba                	add	a5,a5,a4
    7800:	0007c783          	lbu	a5,0(a5)
    7804:	07a2                	slli	a5,a5,0x8
		SPX->PK_SEED[i]    =   (((unsigned int)pk[i*4+0]) |
    7806:	00f6e733          	or	a4,a3,a5
								((unsigned int)pk[i*4+2] << 16) |
    780a:	fe842783          	lw	a5,-24(s0)
    780e:	078a                	slli	a5,a5,0x2
    7810:	0789                	addi	a5,a5,2
    7812:	fc042683          	lw	a3,-64(s0)
    7816:	97b6                	add	a5,a5,a3
    7818:	0007c783          	lbu	a5,0(a5)
    781c:	07c2                	slli	a5,a5,0x10
								((unsigned int)pk[i*4+1] << 8 ) |
    781e:	8f5d                	or	a4,a4,a5
								((unsigned int)pk[i*4+3] << 24));
    7820:	fe842783          	lw	a5,-24(s0)
    7824:	078a                	slli	a5,a5,0x2
    7826:	078d                	addi	a5,a5,3
    7828:	fc042683          	lw	a3,-64(s0)
    782c:	97b6                	add	a5,a5,a3
    782e:	0007c783          	lbu	a5,0(a5)
    7832:	07e2                	slli	a5,a5,0x18
		SPX->PK_SEED[i]    =   (((unsigned int)pk[i*4+0]) |
    7834:	400a06b7          	lui	a3,0x400a0
								((unsigned int)pk[i*4+2] << 16) |
    7838:	8f5d                	or	a4,a4,a5
		SPX->PK_SEED[i]    =   (((unsigned int)pk[i*4+0]) |
    783a:	fe842783          	lw	a5,-24(s0)
    783e:	07d1                	addi	a5,a5,20
    7840:	078a                	slli	a5,a5,0x2
    7842:	97b6                	add	a5,a5,a3
    7844:	c3d8                	sw	a4,4(a5)
	for (int i =0; i < spx_n / 4 ; i++){
    7846:	fe842783          	lw	a5,-24(s0)
    784a:	0785                	addi	a5,a5,1
    784c:	fef42423          	sw	a5,-24(s0)
    7850:	fc842783          	lw	a5,-56(s0)
    7854:	41f7d713          	srai	a4,a5,0x1f
    7858:	8b0d                	andi	a4,a4,3
    785a:	97ba                	add	a5,a5,a4
    785c:	8789                	srai	a5,a5,0x2
    785e:	873e                	mv	a4,a5
    7860:	fe842783          	lw	a5,-24(s0)
    7864:	f6e7cde3          	blt	a5,a4,77de <spx_gen_pk+0xfa>
	}
	
		for (int i =0; i < 32 / 4 ; i++){
    7868:	fe042223          	sw	zero,-28(s0)
    786c:	a839                	j	788a <spx_gen_pk+0x1a6>
		SPX->PK_ROOT[i]    =    0x00000000;
    786e:	400a0737          	lui	a4,0x400a0
    7872:	fe442783          	lw	a5,-28(s0)
    7876:	07f1                	addi	a5,a5,28
    7878:	078a                	slli	a5,a5,0x2
    787a:	97ba                	add	a5,a5,a4
    787c:	0007a223          	sw	zero,4(a5)
		for (int i =0; i < 32 / 4 ; i++){
    7880:	fe442783          	lw	a5,-28(s0)
    7884:	0785                	addi	a5,a5,1
    7886:	fef42223          	sw	a5,-28(s0)
    788a:	fe442703          	lw	a4,-28(s0)
    788e:	479d                	li	a5,7
    7890:	fce7dfe3          	bge	a5,a4,786e <spx_gen_pk+0x18a>
	}


	// int_en
	SPX->SPX_INT_EN = 1;
    7894:	400a07b7          	lui	a5,0x400a0
    7898:	4705                	li	a4,1
    789a:	10e7a223          	sw	a4,260(a5) # 400a0104 <__heap_end+0x20080104>
	SPX->SPX_INT_CLR	= 	0x00000001;
    789e:	400a07b7          	lui	a5,0x400a0
    78a2:	4705                	li	a4,1
    78a4:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>


	// spx_en Gen PK
	SPX->SPX_EN = 1;
    78a8:	400a07b7          	lui	a5,0x400a0
    78ac:	4705                	li	a4,1
    78ae:	c798                	sw	a4,8(a5)
	
	while((SPX->SPX_INT& 0x1) == 0);
    78b0:	0001                	nop
    78b2:	400a07b7          	lui	a5,0x400a0
    78b6:	1007a783          	lw	a5,256(a5) # 400a0100 <__heap_end+0x20080100>
    78ba:	8b85                	andi	a5,a5,1
    78bc:	dbfd                	beqz	a5,78b2 <spx_gen_pk+0x1ce>
	SPX->SPX_INT_CLR	= 	0x00000001;
    78be:	400a07b7          	lui	a5,0x400a0
    78c2:	4705                	li	a4,1
    78c4:	10e7a423          	sw	a4,264(a5) # 400a0108 <__heap_end+0x20080108>
//	for (int i = 0; i < spx_n/4; i++){
//		temp_data = *(PK_ROOT+i);
//		*(SPX_SRAM + i) = temp_data;
//	}
	
	for (int i = 0; i < spx_n/4; i++){
    78c8:	fe042023          	sw	zero,-32(s0)
    78cc:	a02d                	j	78f6 <spx_gen_pk+0x212>
		pk_root[i] = SPX->PK_ROOT[i];	
    78ce:	400a06b7          	lui	a3,0x400a0
    78d2:	fe042783          	lw	a5,-32(s0)
    78d6:	078a                	slli	a5,a5,0x2
    78d8:	fbc42703          	lw	a4,-68(s0)
    78dc:	973e                	add	a4,a4,a5
    78de:	fe042783          	lw	a5,-32(s0)
    78e2:	07f1                	addi	a5,a5,28
    78e4:	078a                	slli	a5,a5,0x2
    78e6:	97b6                	add	a5,a5,a3
    78e8:	43dc                	lw	a5,4(a5)
    78ea:	c31c                	sw	a5,0(a4)
	for (int i = 0; i < spx_n/4; i++){
    78ec:	fe042783          	lw	a5,-32(s0)
    78f0:	0785                	addi	a5,a5,1
    78f2:	fef42023          	sw	a5,-32(s0)
    78f6:	fc842783          	lw	a5,-56(s0)
    78fa:	41f7d713          	srai	a4,a5,0x1f
    78fe:	8b0d                	andi	a4,a4,3
    7900:	97ba                	add	a5,a5,a4
    7902:	8789                	srai	a5,a5,0x2
    7904:	873e                	mv	a4,a5
    7906:	fe042783          	lw	a5,-32(s0)
    790a:	fce7c2e3          	blt	a5,a4,78ce <spx_gen_pk+0x1ea>
	}


	
	
    790e:	0001                	nop
    7910:	0001                	nop
    7912:	40b6                	lw	ra,76(sp)
    7914:	4426                	lw	s0,72(sp)
    7916:	6161                	addi	sp,sp,80
    7918:	8082                	ret

0000791a <ck_intc_init>:
//volatile   unsigned int* CLIC_BASE         = (volatile unsigned *)0xE0800000;
//volatile   unsigned int* INTIE             = (volatile unsigned *)0x400;

//config the interrupt controller
void ck_intc_init()
{
    791a:	1101                	addi	sp,sp,-32
    791c:	ce22                	sw	s0,28(sp)
    791e:	1000                	addi	s0,sp,32
	volatile int *picr = (volatile int *)TCIP_BASE;
    7920:	e00007b7          	lui	a5,0xe0000
    7924:	fef42623          	sw	a5,-20(s0)
        *picr = 0x0;
    7928:	fec42783          	lw	a5,-20(s0)
    792c:	0007a023          	sw	zero,0(a5) # e0000000 <__heap_end+0xbffe0000>
        
        // Write ISER
	volatile int *piser = (volatile int *)CLIC_BASE+INTIE+0x10;
    7930:	e08017b7          	lui	a5,0xe0801
    7934:	04078793          	addi	a5,a5,64 # e0801040 <__heap_end+0xc07e1040>
    7938:	fef42423          	sw	a5,-24(s0)
        *piser = 0x810000;
    793c:	fe842783          	lw	a5,-24(s0)
    7940:	00810737          	lui	a4,0x810
    7944:	c398                	sw	a4,0(a5)
}
    7946:	0001                	nop
    7948:	4472                	lw	s0,28(sp)
    794a:	6105                	addi	sp,sp,32
    794c:	8082                	ret

0000794e <crc16_modbus>:
/* ================================================================== */
/*  CRC-16/MODBUS                                                       */
/*  Poly 0x8005, Init 0xFFFF, RefIn true, RefOut true, XorOut 0        */
/* ================================================================== */
static uint16_t crc16_modbus(const uint8_t *buf, const uint8_t *data, uint32_t len)
{
    794e:	7179                	addi	sp,sp,-48
    7950:	d622                	sw	s0,44(sp)
    7952:	1800                	addi	s0,sp,48
    7954:	fca42e23          	sw	a0,-36(s0)
    7958:	fcb42c23          	sw	a1,-40(s0)
    795c:	fcc42a23          	sw	a2,-44(s0)
    uint16_t crc = 0xFFFFU;
    7960:	57fd                	li	a5,-1
    7962:	fef41723          	sh	a5,-18(s0)
    uint32_t i, j;

	for (i = 0; i < 3; i++) {
    7966:	fe042423          	sw	zero,-24(s0)
    796a:	a025                	j	7992 <crc16_modbus+0x44>
        crc ^= (uint16_t)buf[i];
    796c:	fdc42703          	lw	a4,-36(s0)
    7970:	fe842783          	lw	a5,-24(s0)
    7974:	97ba                	add	a5,a5,a4
    7976:	0007c783          	lbu	a5,0(a5)
    797a:	3c07b70b          	extu	a4,a5,15,0
    797e:	fee45783          	lhu	a5,-18(s0)
    7982:	8fb9                	xor	a5,a5,a4
    7984:	fef41723          	sh	a5,-18(s0)
	for (i = 0; i < 3; i++) {
    7988:	fe842783          	lw	a5,-24(s0)
    798c:	0785                	addi	a5,a5,1
    798e:	fef42423          	sw	a5,-24(s0)
    7992:	fe842703          	lw	a4,-24(s0)
    7996:	4789                	li	a5,2
    7998:	fce7fae3          	bgeu	a5,a4,796c <crc16_modbus+0x1e>
    }
	
    for (i = 0; i < len; i++) {
    799c:	fe042423          	sw	zero,-24(s0)
    79a0:	a025                	j	79c8 <crc16_modbus+0x7a>
        crc ^= (uint16_t)data[i];
    79a2:	fd842703          	lw	a4,-40(s0)
    79a6:	fe842783          	lw	a5,-24(s0)
    79aa:	97ba                	add	a5,a5,a4
    79ac:	0007c783          	lbu	a5,0(a5)
    79b0:	3c07b70b          	extu	a4,a5,15,0
    79b4:	fee45783          	lhu	a5,-18(s0)
    79b8:	8fb9                	xor	a5,a5,a4
    79ba:	fef41723          	sh	a5,-18(s0)
    for (i = 0; i < len; i++) {
    79be:	fe842783          	lw	a5,-24(s0)
    79c2:	0785                	addi	a5,a5,1
    79c4:	fef42423          	sw	a5,-24(s0)
    79c8:	fe842703          	lw	a4,-24(s0)
    79cc:	fd442783          	lw	a5,-44(s0)
    79d0:	fcf769e3          	bltu	a4,a5,79a2 <crc16_modbus+0x54>
    }
    return crc;
    79d4:	fee45783          	lhu	a5,-18(s0)
}
    79d8:	853e                	mv	a0,a5
    79da:	5432                	lw	s0,44(sp)
    79dc:	6145                	addi	sp,sp,48
    79de:	8082                	ret

000079e0 <uart_send_frame>:

/* ================================================================== */
/*  uart_send_frame()                                                   */
/* ================================================================== */
void uart_send_frame(p_ck_uart_device uart_device, uint8_t cmd, const uint8_t *data, uint16_t data_len)
{
    79e0:	7179                	addi	sp,sp,-48
    79e2:	d606                	sw	ra,44(sp)
    79e4:	d422                	sw	s0,40(sp)
    79e6:	1800                	addi	s0,sp,48
    79e8:	fca42e23          	sw	a0,-36(s0)
    79ec:	87ae                	mv	a5,a1
    79ee:	fcc42a23          	sw	a2,-44(s0)
    79f2:	8736                	mv	a4,a3
    79f4:	fcf40da3          	sb	a5,-37(s0)
    79f8:	87ba                	mv	a5,a4
    79fa:	fcf41c23          	sh	a5,-40(s0)
    uint16_t crc;
    uint16_t i;
    int ret;

    /* Build CRC input: [cmd][len_h][len_l][data...] */
    crc_buf[0] = cmd;
    79fe:	fdb44783          	lbu	a5,-37(s0)
    7a02:	fef40223          	sb	a5,-28(s0)
    crc_buf[1] = (uint8_t)(data_len >> 8);
    7a06:	fd845783          	lhu	a5,-40(s0)
    7a0a:	83a1                	srli	a5,a5,0x8
    7a0c:	3c07b78b          	extu	a5,a5,15,0
    7a10:	0ff7f793          	andi	a5,a5,255
    7a14:	fef402a3          	sb	a5,-27(s0)
    crc_buf[2] = (uint8_t)(data_len & 0xFFU);
    7a18:	fd845783          	lhu	a5,-40(s0)
    7a1c:	0ff7f793          	andi	a5,a5,255
    7a20:	fef40323          	sb	a5,-26(s0)
//    for (i = 0; i < data_len && i < MAX_DATA_LEN; i++)
//        crc_buf[3U + i] = data[i];

    crc = crc16_modbus(crc_buf, data, data_len);
    7a24:	fd845703          	lhu	a4,-40(s0)
    7a28:	fe440793          	addi	a5,s0,-28
    7a2c:	863a                	mv	a2,a4
    7a2e:	fd442583          	lw	a1,-44(s0)
    7a32:	853e                	mv	a0,a5
    7a34:	00000097          	auipc	ra,0x0
    7a38:	f1a080e7          	jalr	-230(ra) # 794e <crc16_modbus>
    7a3c:	87aa                	mv	a5,a0
    7a3e:	fef41623          	sh	a5,-20(s0)

    /* Transmit frame byte by byte */
    ret = csi_usart_putchar(uart_device, FRAME_HEADER);
    7a42:	0aa00593          	li	a1,170
    7a46:	fdc42503          	lw	a0,-36(s0)
    7a4a:	ffffb097          	auipc	ra,0xffffb
    7a4e:	e04080e7          	jalr	-508(ra) # 284e <csi_usart_putchar>
    7a52:	fea42423          	sw	a0,-24(s0)
    ret = csi_usart_putchar(uart_device, cmd);
    7a56:	fdb44783          	lbu	a5,-37(s0)
    7a5a:	85be                	mv	a1,a5
    7a5c:	fdc42503          	lw	a0,-36(s0)
    7a60:	ffffb097          	auipc	ra,0xffffb
    7a64:	dee080e7          	jalr	-530(ra) # 284e <csi_usart_putchar>
    7a68:	fea42423          	sw	a0,-24(s0)
    ret = csi_usart_putchar(uart_device, (uint8_t)(data_len >> 8));
    7a6c:	fd845783          	lhu	a5,-40(s0)
    7a70:	83a1                	srli	a5,a5,0x8
    7a72:	3c07b78b          	extu	a5,a5,15,0
    7a76:	0ff7f793          	andi	a5,a5,255
    7a7a:	85be                	mv	a1,a5
    7a7c:	fdc42503          	lw	a0,-36(s0)
    7a80:	ffffb097          	auipc	ra,0xffffb
    7a84:	dce080e7          	jalr	-562(ra) # 284e <csi_usart_putchar>
    7a88:	fea42423          	sw	a0,-24(s0)
    ret = csi_usart_putchar(uart_device, (uint8_t)(data_len & 0xFFU));
    7a8c:	fd845783          	lhu	a5,-40(s0)
    7a90:	0ff7f793          	andi	a5,a5,255
    7a94:	85be                	mv	a1,a5
    7a96:	fdc42503          	lw	a0,-36(s0)
    7a9a:	ffffb097          	auipc	ra,0xffffb
    7a9e:	db4080e7          	jalr	-588(ra) # 284e <csi_usart_putchar>
    7aa2:	fea42423          	sw	a0,-24(s0)
    for (i = 0; i < data_len; i++)
    7aa6:	fe041723          	sh	zero,-18(s0)
    7aaa:	a035                	j	7ad6 <uart_send_frame+0xf6>
        ret = csi_usart_putchar(uart_device, data[i]);
    7aac:	fee45783          	lhu	a5,-18(s0)
    7ab0:	fd442703          	lw	a4,-44(s0)
    7ab4:	97ba                	add	a5,a5,a4
    7ab6:	0007c783          	lbu	a5,0(a5)
    7aba:	85be                	mv	a1,a5
    7abc:	fdc42503          	lw	a0,-36(s0)
    7ac0:	ffffb097          	auipc	ra,0xffffb
    7ac4:	d8e080e7          	jalr	-626(ra) # 284e <csi_usart_putchar>
    7ac8:	fea42423          	sw	a0,-24(s0)
    for (i = 0; i < data_len; i++)
    7acc:	fee45783          	lhu	a5,-18(s0)
    7ad0:	0785                	addi	a5,a5,1
    7ad2:	fef41723          	sh	a5,-18(s0)
    7ad6:	fee45703          	lhu	a4,-18(s0)
    7ada:	fd845783          	lhu	a5,-40(s0)
    7ade:	fcf767e3          	bltu	a4,a5,7aac <uart_send_frame+0xcc>
    ret = csi_usart_putchar(uart_device, (uint8_t)(crc >> 8));
    7ae2:	fec45783          	lhu	a5,-20(s0)
    7ae6:	83a1                	srli	a5,a5,0x8
    7ae8:	3c07b78b          	extu	a5,a5,15,0
    7aec:	0ff7f793          	andi	a5,a5,255
    7af0:	85be                	mv	a1,a5
    7af2:	fdc42503          	lw	a0,-36(s0)
    7af6:	ffffb097          	auipc	ra,0xffffb
    7afa:	d58080e7          	jalr	-680(ra) # 284e <csi_usart_putchar>
    7afe:	fea42423          	sw	a0,-24(s0)
    ret = csi_usart_putchar(uart_device, (uint8_t)(crc & 0xFFU));
    7b02:	fec45783          	lhu	a5,-20(s0)
    7b06:	0ff7f793          	andi	a5,a5,255
    7b0a:	85be                	mv	a1,a5
    7b0c:	fdc42503          	lw	a0,-36(s0)
    7b10:	ffffb097          	auipc	ra,0xffffb
    7b14:	d3e080e7          	jalr	-706(ra) # 284e <csi_usart_putchar>
    7b18:	fea42423          	sw	a0,-24(s0)
}
    7b1c:	0001                	nop
    7b1e:	50b2                	lw	ra,44(sp)
    7b20:	5422                	lw	s0,40(sp)
    7b22:	6145                	addi	sp,sp,48
    7b24:	8082                	ret

00007b26 <uart_recv_frame>:


int uart_recv_frame(p_ck_uart_device uart_device, Frame *f)
{
    7b26:	7179                	addi	sp,sp,-48
    7b28:	d606                	sw	ra,44(sp)
    7b2a:	d422                	sw	s0,40(sp)
    7b2c:	1800                	addi	s0,sp,48
    7b2e:	fca42e23          	sw	a0,-36(s0)
    7b32:	fcb42c23          	sw	a1,-40(s0)
    /* 所有变量已提升为文件作用域，此处不再声明 */

    /* 1. Wait for frame header */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
    7b36:	2000a7b7          	lui	a5,0x2000a
    7b3a:	75c78593          	addi	a1,a5,1884 # 2000a75c <g_recv_b>
    7b3e:	fdc42503          	lw	a0,-36(s0)
    7b42:	ffffb097          	auipc	ra,0xffffb
    7b46:	ca4080e7          	jalr	-860(ra) # 27e6 <csi_usart_getchar>
    7b4a:	87aa                	mv	a5,a0
    7b4c:	c399                	beqz	a5,7b52 <uart_recv_frame+0x2c>
		return -1;
    7b4e:	57fd                	li	a5,-1
    7b50:	a46d                	j	7dfa <uart_recv_frame+0x2d4>
	}
        
    if (g_recv_b != FRAME_HEADER) {
    7b52:	2000a7b7          	lui	a5,0x2000a
    7b56:	75c7c703          	lbu	a4,1884(a5) # 2000a75c <g_recv_b>
    7b5a:	0aa00793          	li	a5,170
    7b5e:	02f70363          	beq	a4,a5,7b84 <uart_recv_frame+0x5e>
        uint8_t ec = ERR_BAD_HEADER;
    7b62:	4785                	li	a5,1
    7b64:	fef407a3          	sb	a5,-17(s0)
        uart_send_frame(uart_device, CMD_ERROR, &ec, 1U);
    7b68:	fef40793          	addi	a5,s0,-17
    7b6c:	4685                	li	a3,1
    7b6e:	863e                	mv	a2,a5
    7b70:	0ff00593          	li	a1,255
    7b74:	fdc42503          	lw	a0,-36(s0)
    7b78:	00000097          	auipc	ra,0x0
    7b7c:	e68080e7          	jalr	-408(ra) # 79e0 <uart_send_frame>
        return (int)ERR_BAD_HEADER;
    7b80:	4785                	li	a5,1
    7b82:	aca5                	j	7dfa <uart_recv_frame+0x2d4>
    }

    /* 2. CMD */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
    7b84:	2000a7b7          	lui	a5,0x2000a
    7b88:	75c78593          	addi	a1,a5,1884 # 2000a75c <g_recv_b>
    7b8c:	fdc42503          	lw	a0,-36(s0)
    7b90:	ffffb097          	auipc	ra,0xffffb
    7b94:	c56080e7          	jalr	-938(ra) # 27e6 <csi_usart_getchar>
    7b98:	87aa                	mv	a5,a0
    7b9a:	c399                	beqz	a5,7ba0 <uart_recv_frame+0x7a>
		return -1;
    7b9c:	57fd                	li	a5,-1
    7b9e:	acb1                	j	7dfa <uart_recv_frame+0x2d4>
	}
    f->cmd = g_recv_b;
    7ba0:	2000a7b7          	lui	a5,0x2000a
    7ba4:	75c7c703          	lbu	a4,1884(a5) # 2000a75c <g_recv_b>
    7ba8:	fd842783          	lw	a5,-40(s0)
    7bac:	00e78023          	sb	a4,0(a5)

    /* 3. LEN high byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
    7bb0:	2000a7b7          	lui	a5,0x2000a
    7bb4:	75c78593          	addi	a1,a5,1884 # 2000a75c <g_recv_b>
    7bb8:	fdc42503          	lw	a0,-36(s0)
    7bbc:	ffffb097          	auipc	ra,0xffffb
    7bc0:	c2a080e7          	jalr	-982(ra) # 27e6 <csi_usart_getchar>
    7bc4:	87aa                	mv	a5,a0
    7bc6:	c399                	beqz	a5,7bcc <uart_recv_frame+0xa6>
		return -1;
    7bc8:	57fd                	li	a5,-1
    7bca:	ac05                	j	7dfa <uart_recv_frame+0x2d4>
	}
    g_recv_data_len = (uint16_t)((uint16_t)g_recv_b << 8);
    7bcc:	2000a7b7          	lui	a5,0x2000a
    7bd0:	75c7c783          	lbu	a5,1884(a5) # 2000a75c <g_recv_b>
    7bd4:	3c07b78b          	extu	a5,a5,15,0
    7bd8:	07a2                	slli	a5,a5,0x8
    7bda:	3c07b70b          	extu	a4,a5,15,0
    7bde:	2000a7b7          	lui	a5,0x2000a
    7be2:	74e79f23          	sh	a4,1886(a5) # 2000a75e <g_recv_data_len>

    /* 4. LEN low byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
    7be6:	2000a7b7          	lui	a5,0x2000a
    7bea:	75c78593          	addi	a1,a5,1884 # 2000a75c <g_recv_b>
    7bee:	fdc42503          	lw	a0,-36(s0)
    7bf2:	ffffb097          	auipc	ra,0xffffb
    7bf6:	bf4080e7          	jalr	-1036(ra) # 27e6 <csi_usart_getchar>
    7bfa:	87aa                	mv	a5,a0
    7bfc:	c399                	beqz	a5,7c02 <uart_recv_frame+0xdc>
		return -1;
    7bfe:	57fd                	li	a5,-1
    7c00:	aaed                	j	7dfa <uart_recv_frame+0x2d4>
	}
    g_recv_data_len |= (uint16_t)g_recv_b;
    7c02:	2000a7b7          	lui	a5,0x2000a
    7c06:	75c7c783          	lbu	a5,1884(a5) # 2000a75c <g_recv_b>
    7c0a:	3c07b70b          	extu	a4,a5,15,0
    7c0e:	2000a7b7          	lui	a5,0x2000a
    7c12:	75e7d783          	lhu	a5,1886(a5) # 2000a75e <g_recv_data_len>
    7c16:	8fd9                	or	a5,a5,a4
    7c18:	3c07b70b          	extu	a4,a5,15,0
    7c1c:	2000a7b7          	lui	a5,0x2000a
    7c20:	74e79f23          	sh	a4,1886(a5) # 2000a75e <g_recv_data_len>

    if (g_recv_data_len > MAX_DATA_LEN) {
    7c24:	2000a7b7          	lui	a5,0x2000a
    7c28:	75e7d703          	lhu	a4,1886(a5) # 2000a75e <g_recv_data_len>
    7c2c:	6785                	lui	a5,0x1
    7c2e:	28078793          	addi	a5,a5,640 # 1280 <__divdf3+0x3f0>
    7c32:	02e7f363          	bgeu	a5,a4,7c58 <uart_recv_frame+0x132>
        uint8_t ec = ERR_BAD_LEN;
    7c36:	4791                	li	a5,4
    7c38:	fef40723          	sb	a5,-18(s0)
        uart_send_frame(uart_device,CMD_ERROR, &ec, 1U);
    7c3c:	fee40793          	addi	a5,s0,-18
    7c40:	4685                	li	a3,1
    7c42:	863e                	mv	a2,a5
    7c44:	0ff00593          	li	a1,255
    7c48:	fdc42503          	lw	a0,-36(s0)
    7c4c:	00000097          	auipc	ra,0x0
    7c50:	d94080e7          	jalr	-620(ra) # 79e0 <uart_send_frame>
        return (int)ERR_BAD_LEN;
    7c54:	4791                	li	a5,4
    7c56:	a255                	j	7dfa <uart_recv_frame+0x2d4>
    }
    f->data_len = g_recv_data_len;
    7c58:	2000a7b7          	lui	a5,0x2000a
    7c5c:	75e7d703          	lhu	a4,1886(a5) # 2000a75e <g_recv_data_len>
    7c60:	fd842783          	lw	a5,-40(s0)
    7c64:	00e79123          	sh	a4,2(a5)

    /* 5. DATA */
    for (g_recv_i = 0; g_recv_i < g_recv_data_len; g_recv_i++) {
    7c68:	2000c7b7          	lui	a5,0x2000c
    7c6c:	9e079423          	sh	zero,-1560(a5) # 2000b9e8 <g_recv_i>
    7c70:	a881                	j	7cc0 <uart_recv_frame+0x19a>
        if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
    7c72:	2000a7b7          	lui	a5,0x2000a
    7c76:	75c78593          	addi	a1,a5,1884 # 2000a75c <g_recv_b>
    7c7a:	fdc42503          	lw	a0,-36(s0)
    7c7e:	ffffb097          	auipc	ra,0xffffb
    7c82:	b68080e7          	jalr	-1176(ra) # 27e6 <csi_usart_getchar>
    7c86:	87aa                	mv	a5,a0
    7c88:	c399                	beqz	a5,7c8e <uart_recv_frame+0x168>
			return -1;
    7c8a:	57fd                	li	a5,-1
    7c8c:	a2bd                	j	7dfa <uart_recv_frame+0x2d4>
		}
        f->data[g_recv_i] = g_recv_b;
    7c8e:	2000c7b7          	lui	a5,0x2000c
    7c92:	9e87d783          	lhu	a5,-1560(a5) # 2000b9e8 <g_recv_i>
    7c96:	86be                	mv	a3,a5
    7c98:	2000a7b7          	lui	a5,0x2000a
    7c9c:	75c7c703          	lbu	a4,1884(a5) # 2000a75c <g_recv_b>
    7ca0:	fd842783          	lw	a5,-40(s0)
    7ca4:	97b6                	add	a5,a5,a3
    7ca6:	00e78223          	sb	a4,4(a5)
    for (g_recv_i = 0; g_recv_i < g_recv_data_len; g_recv_i++) {
    7caa:	2000c7b7          	lui	a5,0x2000c
    7cae:	9e87d783          	lhu	a5,-1560(a5) # 2000b9e8 <g_recv_i>
    7cb2:	0785                	addi	a5,a5,1
    7cb4:	3c07b70b          	extu	a4,a5,15,0
    7cb8:	2000c7b7          	lui	a5,0x2000c
    7cbc:	9ee79423          	sh	a4,-1560(a5) # 2000b9e8 <g_recv_i>
    7cc0:	2000c7b7          	lui	a5,0x2000c
    7cc4:	9e87d703          	lhu	a4,-1560(a5) # 2000b9e8 <g_recv_i>
    7cc8:	2000a7b7          	lui	a5,0x2000a
    7ccc:	75e7d783          	lhu	a5,1886(a5) # 2000a75e <g_recv_data_len>
    7cd0:	faf761e3          	bltu	a4,a5,7c72 <uart_recv_frame+0x14c>
    }

    /* 6. CRC high byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
    7cd4:	2000a7b7          	lui	a5,0x2000a
    7cd8:	75c78593          	addi	a1,a5,1884 # 2000a75c <g_recv_b>
    7cdc:	fdc42503          	lw	a0,-36(s0)
    7ce0:	ffffb097          	auipc	ra,0xffffb
    7ce4:	b06080e7          	jalr	-1274(ra) # 27e6 <csi_usart_getchar>
    7ce8:	87aa                	mv	a5,a0
    7cea:	c399                	beqz	a5,7cf0 <uart_recv_frame+0x1ca>
		return -1;
    7cec:	57fd                	li	a5,-1
    7cee:	a231                	j	7dfa <uart_recv_frame+0x2d4>
	}
    g_recv_crc_recv = (uint16_t)((uint16_t)g_recv_b << 8);
    7cf0:	2000a7b7          	lui	a5,0x2000a
    7cf4:	75c7c783          	lbu	a5,1884(a5) # 2000a75c <g_recv_b>
    7cf8:	3c07b78b          	extu	a5,a5,15,0
    7cfc:	07a2                	slli	a5,a5,0x8
    7cfe:	3c07b70b          	extu	a4,a5,15,0
    7d02:	2000c7b7          	lui	a5,0x2000c
    7d06:	9ee79323          	sh	a4,-1562(a5) # 2000b9e6 <g_recv_crc_recv>

    /* 7. CRC low byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
    7d0a:	2000a7b7          	lui	a5,0x2000a
    7d0e:	75c78593          	addi	a1,a5,1884 # 2000a75c <g_recv_b>
    7d12:	fdc42503          	lw	a0,-36(s0)
    7d16:	ffffb097          	auipc	ra,0xffffb
    7d1a:	ad0080e7          	jalr	-1328(ra) # 27e6 <csi_usart_getchar>
    7d1e:	87aa                	mv	a5,a0
    7d20:	c399                	beqz	a5,7d26 <uart_recv_frame+0x200>
		return -1;
    7d22:	57fd                	li	a5,-1
    7d24:	a8d9                	j	7dfa <uart_recv_frame+0x2d4>
	}
    g_recv_crc_recv |= (uint16_t)g_recv_b;
    7d26:	2000a7b7          	lui	a5,0x2000a
    7d2a:	75c7c783          	lbu	a5,1884(a5) # 2000a75c <g_recv_b>
    7d2e:	3c07b70b          	extu	a4,a5,15,0
    7d32:	2000c7b7          	lui	a5,0x2000c
    7d36:	9e67d783          	lhu	a5,-1562(a5) # 2000b9e6 <g_recv_crc_recv>
    7d3a:	8fd9                	or	a5,a5,a4
    7d3c:	3c07b70b          	extu	a4,a5,15,0
    7d40:	2000c7b7          	lui	a5,0x2000c
    7d44:	9ee79323          	sh	a4,-1562(a5) # 2000b9e6 <g_recv_crc_recv>

    /* 8. Verify CRC */
    g_recv_crc_buf[0] = f->cmd;
    7d48:	fd842783          	lw	a5,-40(s0)
    7d4c:	0007c703          	lbu	a4,0(a5)
    7d50:	2000a7b7          	lui	a5,0x2000a
    7d54:	76078793          	addi	a5,a5,1888 # 2000a760 <g_recv_crc_buf>
    7d58:	00e78023          	sb	a4,0(a5)
    g_recv_crc_buf[1] = (uint8_t)(g_recv_data_len >> 8);
    7d5c:	2000a7b7          	lui	a5,0x2000a
    7d60:	75e7d783          	lhu	a5,1886(a5) # 2000a75e <g_recv_data_len>
    7d64:	83a1                	srli	a5,a5,0x8
    7d66:	3c07b78b          	extu	a5,a5,15,0
    7d6a:	0ff7f713          	andi	a4,a5,255
    7d6e:	2000a7b7          	lui	a5,0x2000a
    7d72:	76078793          	addi	a5,a5,1888 # 2000a760 <g_recv_crc_buf>
    7d76:	00e780a3          	sb	a4,1(a5)
    g_recv_crc_buf[2] = (uint8_t)(g_recv_data_len & 0xFFU);
    7d7a:	2000a7b7          	lui	a5,0x2000a
    7d7e:	75e7d783          	lhu	a5,1886(a5) # 2000a75e <g_recv_data_len>
    7d82:	0ff7f713          	andi	a4,a5,255
    7d86:	2000a7b7          	lui	a5,0x2000a
    7d8a:	76078793          	addi	a5,a5,1888 # 2000a760 <g_recv_crc_buf>
    7d8e:	00e78123          	sb	a4,2(a5)
//    for (g_recv_i = 0; g_recv_i < g_recv_data_len; g_recv_i++)
//        g_recv_crc_buf[3U + g_recv_i] = f->data[g_recv_i];

    g_recv_crc_calc = crc16_modbus(g_recv_crc_buf, f->data, g_recv_data_len);
    7d92:	fd842783          	lw	a5,-40(s0)
    7d96:	00478713          	addi	a4,a5,4
    7d9a:	2000a7b7          	lui	a5,0x2000a
    7d9e:	75e7d783          	lhu	a5,1886(a5) # 2000a75e <g_recv_data_len>
    7da2:	863e                	mv	a2,a5
    7da4:	85ba                	mv	a1,a4
    7da6:	2000a7b7          	lui	a5,0x2000a
    7daa:	76078513          	addi	a0,a5,1888 # 2000a760 <g_recv_crc_buf>
    7dae:	00000097          	auipc	ra,0x0
    7db2:	ba0080e7          	jalr	-1120(ra) # 794e <crc16_modbus>
    7db6:	87aa                	mv	a5,a0
    7db8:	873e                	mv	a4,a5
    7dba:	2000c7b7          	lui	a5,0x2000c
    7dbe:	9ee79223          	sh	a4,-1564(a5) # 2000b9e4 <g_recv_crc_calc>

    if (g_recv_crc_calc != g_recv_crc_recv) {
    7dc2:	2000c7b7          	lui	a5,0x2000c
    7dc6:	9e47d703          	lhu	a4,-1564(a5) # 2000b9e4 <g_recv_crc_calc>
    7dca:	2000c7b7          	lui	a5,0x2000c
    7dce:	9e67d783          	lhu	a5,-1562(a5) # 2000b9e6 <g_recv_crc_recv>
    7dd2:	02f70363          	beq	a4,a5,7df8 <uart_recv_frame+0x2d2>
        uint8_t ec = ERR_BAD_CRC;
    7dd6:	4789                	li	a5,2
    7dd8:	fef406a3          	sb	a5,-19(s0)
        uart_send_frame(uart_device, CMD_ERROR, &ec, 1U);
    7ddc:	fed40793          	addi	a5,s0,-19
    7de0:	4685                	li	a3,1
    7de2:	863e                	mv	a2,a5
    7de4:	0ff00593          	li	a1,255
    7de8:	fdc42503          	lw	a0,-36(s0)
    7dec:	00000097          	auipc	ra,0x0
    7df0:	bf4080e7          	jalr	-1036(ra) # 79e0 <uart_send_frame>
        return (int)ERR_BAD_CRC;
    7df4:	4789                	li	a5,2
    7df6:	a011                	j	7dfa <uart_recv_frame+0x2d4>
    }

    return 0;
    7df8:	4781                	li	a5,0
}
    7dfa:	853e                	mv	a0,a5
    7dfc:	50b2                	lw	ra,44(sp)
    7dfe:	5422                	lw	s0,40(sp)
    7e00:	6145                	addi	sp,sp,48
    7e02:	8082                	ret

00007e04 <handle_ping>:

/* ================================================================== */
/*  Command Handlers (file-scope)                                       */
/* ================================================================== */
static void handle_ping(p_ck_uart_device uart_device)
{
    7e04:	7179                	addi	sp,sp,-48
    7e06:	d606                	sw	ra,44(sp)
    7e08:	d422                	sw	s0,40(sp)
    7e0a:	1800                	addi	s0,sp,48
    7e0c:	fca42e23          	sw	a0,-36(s0)
    uint8_t pong[4] = {'P', 'O', 'N', 'G'};
    7e10:	474e57b7          	lui	a5,0x474e5
    7e14:	f5078793          	addi	a5,a5,-176 # 474e4f50 <__heap_end+0x274c4f50>
    7e18:	fef42623          	sw	a5,-20(s0)
    uart_send_frame(uart_device, CMD_PONG, pong, 4U);
    7e1c:	fec40793          	addi	a5,s0,-20
    7e20:	4691                	li	a3,4
    7e22:	863e                	mv	a2,a5
    7e24:	4589                	li	a1,2
    7e26:	fdc42503          	lw	a0,-36(s0)
    7e2a:	00000097          	auipc	ra,0x0
    7e2e:	bb6080e7          	jalr	-1098(ra) # 79e0 <uart_send_frame>
}
    7e32:	0001                	nop
    7e34:	50b2                	lw	ra,44(sp)
    7e36:	5422                	lw	s0,40(sp)
    7e38:	6145                	addi	sp,sp,48
    7e3a:	8082                	ret

00007e3c <uart_process_frame>:

/* ================================================================== */
/*  uart_process_frame()                                                */
/* ================================================================== */
void uart_process_frame(p_ck_uart_device uart_device, const Frame *f)
{
    7e3c:	7175                	addi	sp,sp,-144
    7e3e:	c706                	sw	ra,140(sp)
    7e40:	c522                	sw	s0,136(sp)
    7e42:	0900                	addi	s0,sp,144
    7e44:	f8a42623          	sw	a0,-116(s0)
    7e48:	f8b42423          	sw	a1,-120(s0)
	unsigned char *Data = f->data;
    7e4c:	f8842783          	lw	a5,-120(s0)
    7e50:	0791                	addi	a5,a5,4
    7e52:	fef42423          	sw	a5,-24(s0)
    switch (f->cmd) {
    7e56:	f8842783          	lw	a5,-120(s0)
    7e5a:	0007c783          	lbu	a5,0(a5)
    7e5e:	0c600713          	li	a4,198
    7e62:	36e78f63          	beq	a5,a4,81e0 <uart_process_frame+0x3a4>
    7e66:	0c600713          	li	a4,198
    7e6a:	3cf74763          	blt	a4,a5,8238 <uart_process_frame+0x3fc>
    7e6e:	0c500713          	li	a4,197
    7e72:	2ee78463          	beq	a5,a4,815a <uart_process_frame+0x31e>
    7e76:	0c500713          	li	a4,197
    7e7a:	3af74f63          	blt	a4,a5,8238 <uart_process_frame+0x3fc>
    7e7e:	0c400713          	li	a4,196
    7e82:	22e78a63          	beq	a5,a4,80b6 <uart_process_frame+0x27a>
    7e86:	0c400713          	li	a4,196
    7e8a:	3af74763          	blt	a4,a5,8238 <uart_process_frame+0x3fc>
    7e8e:	0c100713          	li	a4,193
    7e92:	02e78c63          	beq	a5,a4,7eca <uart_process_frame+0x8e>
    7e96:	0c100713          	li	a4,193
    7e9a:	38f74f63          	blt	a4,a5,8238 <uart_process_frame+0x3fc>
    7e9e:	02100713          	li	a4,33
    7ea2:	3ae78b63          	beq	a5,a4,8258 <uart_process_frame+0x41c>
    7ea6:	02100713          	li	a4,33
    7eaa:	38f74763          	blt	a4,a5,8238 <uart_process_frame+0x3fc>
    7eae:	4705                	li	a4,1
    7eb0:	00e78663          	beq	a5,a4,7ebc <uart_process_frame+0x80>
    7eb4:	4745                	li	a4,17
    7eb6:	3ae78363          	beq	a5,a4,825c <uart_process_frame+0x420>
    7eba:	aebd                	j	8238 <uart_process_frame+0x3fc>
        case CMD_PING:
            handle_ping(uart_device);
    7ebc:	f8c42503          	lw	a0,-116(s0)
    7ec0:	00000097          	auipc	ra,0x0
    7ec4:	f44080e7          	jalr	-188(ra) # 7e04 <handle_ping>
            break;
    7ec8:	ae59                	j	825e <uart_process_frame+0x422>
        case CMD_READ_SRAM:
//            handle_read_sram(f);
            break;
		case 0xC1:{
			//sphincs+simple-128-fast sign
			int spx_n = 16;
    7eca:	47c1                	li	a5,16
    7ecc:	fcf42623          	sw	a5,-52(s0)
			bool simple = true;
    7ed0:	4785                	li	a5,1
    7ed2:	fcf405a3          	sb	a5,-53(s0)
			bool fast = true;
    7ed6:	4785                	li	a5,1
    7ed8:	fcf40523          	sb	a5,-54(s0)
			int mlen, smlen;
			unsigned int pk_root[4]; //128bits
			unsigned char SendBackData[16]; //send back pk.root
            
			
			mlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
    7edc:	fe842783          	lw	a5,-24(s0)
    7ee0:	078d                	addi	a5,a5,3
    7ee2:	0007c783          	lbu	a5,0(a5)
    7ee6:	873e                	mv	a4,a5
    7ee8:	fe842783          	lw	a5,-24(s0)
    7eec:	0789                	addi	a5,a5,2
    7eee:	0007c783          	lbu	a5,0(a5)
    7ef2:	07a2                	slli	a5,a5,0x8
    7ef4:	8f5d                	or	a4,a4,a5
    7ef6:	fe842783          	lw	a5,-24(s0)
    7efa:	0785                	addi	a5,a5,1
    7efc:	0007c783          	lbu	a5,0(a5)
    7f00:	07c2                	slli	a5,a5,0x10
    7f02:	8f5d                	or	a4,a4,a5
    7f04:	fe842783          	lw	a5,-24(s0)
    7f08:	0007c783          	lbu	a5,0(a5)
    7f0c:	07e2                	slli	a5,a5,0x18
    7f0e:	8fd9                	or	a5,a5,a4
    7f10:	fcf42223          	sw	a5,-60(s0)
			Data+=4;
    7f14:	fe842783          	lw	a5,-24(s0)
    7f18:	0791                	addi	a5,a5,4
    7f1a:	fef42423          	sw	a5,-24(s0)
			smlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
    7f1e:	fe842783          	lw	a5,-24(s0)
    7f22:	078d                	addi	a5,a5,3
    7f24:	0007c783          	lbu	a5,0(a5)
    7f28:	873e                	mv	a4,a5
    7f2a:	fe842783          	lw	a5,-24(s0)
    7f2e:	0789                	addi	a5,a5,2
    7f30:	0007c783          	lbu	a5,0(a5)
    7f34:	07a2                	slli	a5,a5,0x8
    7f36:	8f5d                	or	a4,a4,a5
    7f38:	fe842783          	lw	a5,-24(s0)
    7f3c:	0785                	addi	a5,a5,1
    7f3e:	0007c783          	lbu	a5,0(a5)
    7f42:	07c2                	slli	a5,a5,0x10
    7f44:	8f5d                	or	a4,a4,a5
    7f46:	fe842783          	lw	a5,-24(s0)
    7f4a:	0007c783          	lbu	a5,0(a5)
    7f4e:	07e2                	slli	a5,a5,0x18
    7f50:	8fd9                	or	a5,a5,a4
    7f52:	fcf42023          	sw	a5,-64(s0)
			Data+=4;
    7f56:	fe842783          	lw	a5,-24(s0)
    7f5a:	0791                	addi	a5,a5,4
    7f5c:	fef42423          	sw	a5,-24(s0)
			
			spx_gen_pk(simple, spx_n, fast, Data, Data+spx_n*2, pk_root); 
    7f60:	fcb44503          	lbu	a0,-53(s0)
    7f64:	fca44603          	lbu	a2,-54(s0)
    7f68:	fcc42783          	lw	a5,-52(s0)
    7f6c:	0786                	slli	a5,a5,0x1
    7f6e:	873e                	mv	a4,a5
    7f70:	fe842783          	lw	a5,-24(s0)
    7f74:	973e                	add	a4,a4,a5
    7f76:	fb040793          	addi	a5,s0,-80
    7f7a:	fe842683          	lw	a3,-24(s0)
    7f7e:	fcc42583          	lw	a1,-52(s0)
    7f82:	fffff097          	auipc	ra,0xfffff
    7f86:	762080e7          	jalr	1890(ra) # 76e4 <spx_gen_pk>
			
			for (int i=0; i<4; i++){
    7f8a:	fe042623          	sw	zero,-20(s0)
    7f8e:	a879                	j	802c <uart_process_frame+0x1f0>
				SendBackData[3+i*4] = (pk_root[i] >> 24 ) & 0xFF;
    7f90:	fec42783          	lw	a5,-20(s0)
    7f94:	078a                	slli	a5,a5,0x2
    7f96:	fb040713          	addi	a4,s0,-80
    7f9a:	40f7478b          	lrw	a5,a4,a5,0
    7f9e:	0187d713          	srli	a4,a5,0x18
    7fa2:	fec42783          	lw	a5,-20(s0)
    7fa6:	078a                	slli	a5,a5,0x2
    7fa8:	078d                	addi	a5,a5,3
    7faa:	0ff77693          	andi	a3,a4,255
    7fae:	fa040713          	addi	a4,s0,-96
    7fb2:	00f7568b          	srb	a3,a4,a5,0
				SendBackData[2+i*4] = (pk_root[i] >> 16 ) & 0xFF;
    7fb6:	fec42783          	lw	a5,-20(s0)
    7fba:	078a                	slli	a5,a5,0x2
    7fbc:	fb040713          	addi	a4,s0,-80
    7fc0:	40f7478b          	lrw	a5,a4,a5,0
    7fc4:	0107d713          	srli	a4,a5,0x10
    7fc8:	fec42783          	lw	a5,-20(s0)
    7fcc:	078a                	slli	a5,a5,0x2
    7fce:	0789                	addi	a5,a5,2
    7fd0:	0ff77693          	andi	a3,a4,255
    7fd4:	fa040713          	addi	a4,s0,-96
    7fd8:	00f7568b          	srb	a3,a4,a5,0
				SendBackData[1+i*4] = (pk_root[i] >> 8 ) & 0xFF;
    7fdc:	fec42783          	lw	a5,-20(s0)
    7fe0:	078a                	slli	a5,a5,0x2
    7fe2:	fb040713          	addi	a4,s0,-80
    7fe6:	40f7478b          	lrw	a5,a4,a5,0
    7fea:	0087d713          	srli	a4,a5,0x8
    7fee:	fec42783          	lw	a5,-20(s0)
    7ff2:	078a                	slli	a5,a5,0x2
    7ff4:	0785                	addi	a5,a5,1
    7ff6:	0ff77693          	andi	a3,a4,255
    7ffa:	fa040713          	addi	a4,s0,-96
    7ffe:	00f7568b          	srb	a3,a4,a5,0
				SendBackData[0+i*4] =  pk_root[i] & 0xFF;
    8002:	fec42783          	lw	a5,-20(s0)
    8006:	078a                	slli	a5,a5,0x2
    8008:	fb040713          	addi	a4,s0,-80
    800c:	40f7470b          	lrw	a4,a4,a5,0
    8010:	fec42783          	lw	a5,-20(s0)
    8014:	078a                	slli	a5,a5,0x2
    8016:	0ff77693          	andi	a3,a4,255
    801a:	fa040713          	addi	a4,s0,-96
    801e:	00f7568b          	srb	a3,a4,a5,0
			for (int i=0; i<4; i++){
    8022:	fec42783          	lw	a5,-20(s0)
    8026:	0785                	addi	a5,a5,1
    8028:	fef42623          	sw	a5,-20(s0)
    802c:	fec42703          	lw	a4,-20(s0)
    8030:	478d                	li	a5,3
    8032:	f4e7dfe3          	bge	a5,a4,7f90 <uart_process_frame+0x154>
				
			}
			uart_send_frame(uart_device, 0xC2, SendBackData, 16);
    8036:	fa040793          	addi	a5,s0,-96
    803a:	46c1                	li	a3,16
    803c:	863e                	mv	a2,a5
    803e:	0c200593          	li	a1,194
    8042:	f8c42503          	lw	a0,-116(s0)
    8046:	00000097          	auipc	ra,0x0
    804a:	99a080e7          	jalr	-1638(ra) # 79e0 <uart_send_frame>
//			UART_Transmit(SendBackData, 16);
			
			
			// 执行完上面一步之后pk root寄存器里面已经有正确的pk root，无需再写入
			spx_sign(simple, spx_n, fast, mlen, smlen, Data, Data+spx_n*2, Data+spx_n*3, Data+spx_n*4);
    804e:	fcb44503          	lbu	a0,-53(s0)
    8052:	fca44603          	lbu	a2,-54(s0)
    8056:	fcc42783          	lw	a5,-52(s0)
    805a:	0786                	slli	a5,a5,0x1
    805c:	873e                	mv	a4,a5
    805e:	fe842783          	lw	a5,-24(s0)
    8062:	00e786b3          	add	a3,a5,a4
    8066:	fcc42703          	lw	a4,-52(s0)
    806a:	87ba                	mv	a5,a4
    806c:	0786                	slli	a5,a5,0x1
    806e:	97ba                	add	a5,a5,a4
    8070:	873e                	mv	a4,a5
    8072:	fe842783          	lw	a5,-24(s0)
    8076:	973e                	add	a4,a4,a5
    8078:	fcc42783          	lw	a5,-52(s0)
    807c:	078a                	slli	a5,a5,0x2
    807e:	85be                	mv	a1,a5
    8080:	fe842783          	lw	a5,-24(s0)
    8084:	97ae                	add	a5,a5,a1
    8086:	c03e                	sw	a5,0(sp)
    8088:	88ba                	mv	a7,a4
    808a:	8836                	mv	a6,a3
    808c:	fe842783          	lw	a5,-24(s0)
    8090:	fc042703          	lw	a4,-64(s0)
    8094:	fc442683          	lw	a3,-60(s0)
    8098:	fcc42583          	lw	a1,-52(s0)
    809c:	ffffe097          	auipc	ra,0xffffe
    80a0:	6aa080e7          	jalr	1706(ra) # 6746 <spx_sign>
			// mlen, smlen sk, pk, opt, msg
			
			read_sram(uart_device, smlen);
    80a4:	fc042583          	lw	a1,-64(s0)
    80a8:	f8c42503          	lw	a0,-116(s0)
    80ac:	fffff097          	auipc	ra,0xfffff
    80b0:	e48080e7          	jalr	-440(ra) # 6ef4 <read_sram>
			
			break;
    80b4:	a26d                	j	825e <uart_process_frame+0x422>
		}
		case 0xC4:{
			//sphincs+simple-128-fast verify gen md
			int spx_n= 16;
    80b6:	47c1                	li	a5,16
    80b8:	fcf42c23          	sw	a5,-40(s0)
			bool simple = true;
    80bc:	4785                	li	a5,1
    80be:	fcf40ba3          	sb	a5,-41(s0)
			bool fast = true;
    80c2:	4785                	li	a5,1
    80c4:	fcf40b23          	sb	a5,-42(s0)
			int mlen;
			mlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
    80c8:	fe842783          	lw	a5,-24(s0)
    80cc:	078d                	addi	a5,a5,3
    80ce:	0007c783          	lbu	a5,0(a5)
    80d2:	873e                	mv	a4,a5
    80d4:	fe842783          	lw	a5,-24(s0)
    80d8:	0789                	addi	a5,a5,2
    80da:	0007c783          	lbu	a5,0(a5)
    80de:	07a2                	slli	a5,a5,0x8
    80e0:	8f5d                	or	a4,a4,a5
    80e2:	fe842783          	lw	a5,-24(s0)
    80e6:	0785                	addi	a5,a5,1
    80e8:	0007c783          	lbu	a5,0(a5)
    80ec:	07c2                	slli	a5,a5,0x10
    80ee:	8f5d                	or	a4,a4,a5
    80f0:	fe842783          	lw	a5,-24(s0)
    80f4:	0007c783          	lbu	a5,0(a5)
    80f8:	07e2                	slli	a5,a5,0x18
    80fa:	8fd9                	or	a5,a5,a4
    80fc:	fcf42823          	sw	a5,-48(s0)
			Data+=4;
    8100:	fe842783          	lw	a5,-24(s0)
    8104:	0791                	addi	a5,a5,4
    8106:	fef42423          	sw	a5,-24(s0)
			spx_verify_gen_md(simple, spx_n, fast, mlen, Data, 
    810a:	fd744503          	lbu	a0,-41(s0)
    810e:	fd644603          	lbu	a2,-42(s0)
				Data+spx_n*2, Data+spx_n*3);
    8112:	fd842783          	lw	a5,-40(s0)
    8116:	0786                	slli	a5,a5,0x1
    8118:	873e                	mv	a4,a5
			spx_verify_gen_md(simple, spx_n, fast, mlen, Data, 
    811a:	fe842783          	lw	a5,-24(s0)
    811e:	00e786b3          	add	a3,a5,a4
				Data+spx_n*2, Data+spx_n*3);
    8122:	fd842703          	lw	a4,-40(s0)
    8126:	87ba                	mv	a5,a4
    8128:	0786                	slli	a5,a5,0x1
    812a:	97ba                	add	a5,a5,a4
    812c:	873e                	mv	a4,a5
			spx_verify_gen_md(simple, spx_n, fast, mlen, Data, 
    812e:	fe842783          	lw	a5,-24(s0)
    8132:	97ba                	add	a5,a5,a4
    8134:	883e                	mv	a6,a5
    8136:	87b6                	mv	a5,a3
    8138:	fe842703          	lw	a4,-24(s0)
    813c:	fd042683          	lw	a3,-48(s0)
    8140:	fd842583          	lw	a1,-40(s0)
    8144:	fffff097          	auipc	ra,0xfffff
    8148:	f40080e7          	jalr	-192(ra) # 7084 <spx_verify_gen_md>
				
			handle_ping(uart_device); // recive ok
    814c:	f8c42503          	lw	a0,-116(s0)
    8150:	00000097          	auipc	ra,0x0
    8154:	cb4080e7          	jalr	-844(ra) # 7e04 <handle_ping>
			break;
    8158:	a219                	j	825e <uart_process_frame+0x422>
		}
		case 0xC5:{
			//sphincs+simple-128-fast verify write_sram
			uint16_t addr, data_len;
			
			addr = (Data[1] | (Data[0] << 8));
    815a:	fe842783          	lw	a5,-24(s0)
    815e:	0785                	addi	a5,a5,1
    8160:	0007c783          	lbu	a5,0(a5)
    8164:	3c07a70b          	ext	a4,a5,15,0
    8168:	fe842783          	lw	a5,-24(s0)
    816c:	0007c783          	lbu	a5,0(a5)
    8170:	07a2                	slli	a5,a5,0x8
    8172:	3c07a78b          	ext	a5,a5,15,0
    8176:	8fd9                	or	a5,a5,a4
    8178:	3c07a78b          	ext	a5,a5,15,0
    817c:	fcf41f23          	sh	a5,-34(s0)
			Data+=2;
    8180:	fe842783          	lw	a5,-24(s0)
    8184:	0789                	addi	a5,a5,2
    8186:	fef42423          	sw	a5,-24(s0)
			data_len = (Data[1] | (Data[0] << 8));
    818a:	fe842783          	lw	a5,-24(s0)
    818e:	0785                	addi	a5,a5,1
    8190:	0007c783          	lbu	a5,0(a5)
    8194:	3c07a70b          	ext	a4,a5,15,0
    8198:	fe842783          	lw	a5,-24(s0)
    819c:	0007c783          	lbu	a5,0(a5)
    81a0:	07a2                	slli	a5,a5,0x8
    81a2:	3c07a78b          	ext	a5,a5,15,0
    81a6:	8fd9                	or	a5,a5,a4
    81a8:	3c07a78b          	ext	a5,a5,15,0
    81ac:	fcf41e23          	sh	a5,-36(s0)
			Data+=2;
    81b0:	fe842783          	lw	a5,-24(s0)
    81b4:	0789                	addi	a5,a5,2
    81b6:	fef42423          	sw	a5,-24(s0)
			
			write_sram(addr, data_len, Data); // 不用写入R值
    81ba:	fde45783          	lhu	a5,-34(s0)
    81be:	fdc45703          	lhu	a4,-36(s0)
    81c2:	fe842603          	lw	a2,-24(s0)
    81c6:	85ba                	mv	a1,a4
    81c8:	853e                	mv	a0,a5
    81ca:	fffff097          	auipc	ra,0xfffff
    81ce:	45c080e7          	jalr	1116(ra) # 7626 <write_sram>
			handle_ping(uart_device); // recive ok
    81d2:	f8c42503          	lw	a0,-116(s0)
    81d6:	00000097          	auipc	ra,0x0
    81da:	c2e080e7          	jalr	-978(ra) # 7e04 <handle_ping>
			break;
    81de:	a041                	j	825e <uart_process_frame+0x422>
			
		}
		case 0xC6:{
			//sphincs+simple-128-fast verify
			unsigned char ret;
			int spx_n= 16;
    81e0:	47c1                	li	a5,16
    81e2:	fef42223          	sw	a5,-28(s0)
			bool simple = true;
    81e6:	4785                	li	a5,1
    81e8:	fef401a3          	sb	a5,-29(s0)
			bool fast = true;
    81ec:	4785                	li	a5,1
    81ee:	fef40123          	sb	a5,-30(s0)
			uint8_t cmd = 0xC7;
    81f2:	fc700793          	li	a5,-57
    81f6:	fef400a3          	sb	a5,-31(s0)
			ret = spx_verify(simple, spx_n, fast);
    81fa:	fe344783          	lbu	a5,-29(s0)
    81fe:	fe244703          	lbu	a4,-30(s0)
    8202:	863a                	mv	a2,a4
    8204:	fe442583          	lw	a1,-28(s0)
    8208:	853e                	mv	a0,a5
    820a:	fffff097          	auipc	ra,0xfffff
    820e:	378080e7          	jalr	888(ra) # 7582 <spx_verify>
    8212:	87aa                	mv	a5,a0
    8214:	0ff7f793          	andi	a5,a5,255
    8218:	f8f40fa3          	sb	a5,-97(s0)
			uart_send_frame(uart_device, cmd, &ret, 1U);
    821c:	f9f40713          	addi	a4,s0,-97
    8220:	fe144783          	lbu	a5,-31(s0)
    8224:	4685                	li	a3,1
    8226:	863a                	mv	a2,a4
    8228:	85be                	mv	a1,a5
    822a:	f8c42503          	lw	a0,-116(s0)
    822e:	fffff097          	auipc	ra,0xfffff
    8232:	7b2080e7          	jalr	1970(ra) # 79e0 <uart_send_frame>
			break;
    8236:	a025                	j	825e <uart_process_frame+0x422>
		}

        default: {
            uint8_t ec = ERR_UNKNOWN_CMD;
    8238:	478d                	li	a5,3
    823a:	f8f40f23          	sb	a5,-98(s0)
            uart_send_frame(uart_device, CMD_ERROR, &ec, 1U);
    823e:	f9e40793          	addi	a5,s0,-98
    8242:	4685                	li	a3,1
    8244:	863e                	mv	a2,a5
    8246:	0ff00593          	li	a1,255
    824a:	f8c42503          	lw	a0,-116(s0)
    824e:	fffff097          	auipc	ra,0xfffff
    8252:	792080e7          	jalr	1938(ra) # 79e0 <uart_send_frame>
            break;
    8256:	a021                	j	825e <uart_process_frame+0x422>
            break;
    8258:	0001                	nop
    825a:	a011                	j	825e <uart_process_frame+0x422>
            break;
    825c:	0001                	nop
        }
    }
}
    825e:	0001                	nop
    8260:	40ba                	lw	ra,140(sp)
    8262:	442a                	lw	s0,136(sp)
    8264:	6149                	addi	sp,sp,144
    8266:	8082                	ret
	...
