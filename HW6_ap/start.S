/*
 *  armboot - Startup Code for ARM920 CPU-core
 *
 *  Copyright (c) 2001	Marius Gröger <mag@sysgo.de>
 *  Copyright (c) 2002	Alex Züpke <azu@sysgo.de>
 *  Copyright (c) 2002	Gary Jennejohn <garyj@denx.de>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

// 该文件是ARM920 CPU核的启动代码
// 头文件，包含了一些宏定义，函数声明等
// 该文件主要是对CPU进行初始化，设置一些寄存器，关闭一些中断，设置内存时序等
// 目录：u-boot-2015.10/arch/arm/cpu/arm920t/start.S
// u-boot-2015.10/include/
// u-boot-2015.10/arch/arm/include/

#include <asm-offsets.h>
#include <common.h>
#include <config.h>

/*
 *************************************************************************
 *
 * Startup Code (called from the ARM reset exception vector)
 *
 * do important init only if we don't start from memory!
 * relocate armboot to ram
 * setup stack
 * jump to second stage
 *
 *************************************************************************
 */

	.globl	reset   // 定义全局符号reset, 该符号在链接时会被使用

reset:
	/*
	 * set the cpu to SVC32 mode
	 */
    // 设置CPU为SVC32模式
    // ** 针对不同的处理器，设置不同的模式 **
	mrs	r0, cpsr        // 读取当前程序状态寄存器的值到r0寄存器
	bic	r0, r0, #0x1f   // 将r0寄存器的值的低5位清零
	orr	r0, r0, #0xd3   // 将r0寄存器的值的低5位设置为0xd3
	msr	cpsr, r0

#if	defined(CONFIG_AT91RM9200DK) || defined(CONFIG_AT91RM9200EK)
	/*
	 * relocate exception table
	 */
    // 重新定位异常向量表
    // 将异常向量表的地址设置为0x0
    // ** 针对不同的处理器，设置不同的异常向量表 **
	ldr	r0, =_start
	ldr	r1, =0x0
	mov	r2, #16
copyex:
	subs	r2, r2, #1
	ldr	r3, [r0], #4
	str	r3, [r1], #4
	bne	copyex
#endif

#ifdef CONFIG_S3C24X0
	/* turn off the watchdog */
    // 关闭看门狗
    // ** 针对不同的处理器，看门狗寄存器定义不同，需要修改 **

# if defined(CONFIG_S3C2400)
#  define pWTCON	0x15300000
#  define INTMSK	0x14400008	/* Interrupt-Controller base addresses */
#  define CLKDIVN	0x14800014	/* clock divisor register */
#else
#  define pWTCON	0x53000000
#  define INTMSK	0x4A000008	/* Interrupt-Controller base addresses */
#  define INTSUBMSK	0x4A00001C
#  define CLKDIVN	0x4C000014	/* clock divisor register */
# endif
    // 将看门狗寄存器的值设置为0
	ldr	r0, =pWTCON
	mov	r1, #0x0
	str	r1, [r0]

	/*
	 * mask all IRQs by setting all bits in the INTMR - default
	 */
	mov	r1, #0xffffffff
	ldr	r0, =INTMSK
	str	r1, [r0]
# if defined(CONFIG_S3C2410)
	ldr	r1, =0x3ff
	ldr	r0, =INTSUBMSK
	str	r1, [r0]
# endif

	/* FCLK:HCLK:PCLK = 1:2:4 */
	/* default FCLK is 120 MHz ! */
	ldr	r0, =CLKDIVN
	mov	r1, #3
	str	r1, [r0]
#endif	/* CONFIG_S3C24X0 */

	/*
	 * we do sys-critical inits only at reboot,
	 * not when booting from ram!
	 */
#ifndef CONFIG_SKIP_LOWLEVEL_INIT
	bl	cpu_init_crit
#endif

    // 跳转到主函数
	bl	_main

/*------------------------------------------------------------------------------*/

	.globl	c_runtime_cpu_setup
c_runtime_cpu_setup:

	mov	pc, lr

/*
 *************************************************************************
 *
 * CPU_init_critical registers
 *
 * setup important registers
 * setup memory timing
 *
 *************************************************************************
 */
// 初始化CPU的关键寄存器，设置内存时序等

#ifndef CONFIG_SKIP_LOWLEVEL_INIT
cpu_init_crit:
	/*
	 * flush v4 I/D caches
	 */
    // 刷新v4 I/D缓存
	mov	r0, #0
	mcr	p15, 0, r0, c7, c7, 0	/* flush v3/v4 cache */
	mcr	p15, 0, r0, c8, c7, 0	/* flush v4 TLB */

	/*
	 * disable MMU stuff and caches
	 */
     // 关闭MMU，关闭缓存
	mrc	p15, 0, r0, c1, c0, 0
	bic	r0, r0, #0x00002300	@ clear bits 13, 9:8 (--V- --RS)
	bic	r0, r0, #0x00000087	@ clear bits 7, 2:0 (B--- -CAM)
	orr	r0, r0, #0x00000002	@ set bit 2 (A) Align
	orr	r0, r0, #0x00001000	@ set bit 12 (I) I-Cache
	mcr	p15, 0, r0, c1, c0, 0

	/*
	 * before relocating, we have to setup RAM timing
	 * because memory timing is board-dependend, you will
	 * find a lowlevel_init.S in your board directory.
	 */
     // 在重新定位之前，我们必须设置RAM时序
	mov	ip, lr

	bl	lowlevel_init

	mov	lr, ip
	mov	pc, lr
#endif /* CONFIG_SKIP_LOWLEVEL_INIT */
