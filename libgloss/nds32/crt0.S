/*
Copyright (c) 2013-2014 Andes Technology Corporation.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.

    Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

    The name of the company may not be used to endorse or promote
    products derived from this software without specific prior written
    permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED.  IN NO EVENT SHALL RED HAT INCORPORATED BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

##==============================================================================
##
##	crt0.S
##
##	nds32 startup code
##
##==============================================================================

##------------------------------------------------------------------------------
## Vector table setup
##------------------------------------------------------------------------------
	.section	.nds32_init, "ax"
	j	_start

##------------------------------------------------------------------------------
## Startup code implementation
##------------------------------------------------------------------------------
	.section	.text
	.weak	_SDA_BASE_
	.global	_start
	.type	_start, @function
	.align	2
_start:
	/* The initialization sequence really does matter !!!
	   The global pointer must be
	   initialized precedence over all others.  */

.L_init_gp:
	/* Initialization for global pointer.  The symbol _SDA_BASE_ is
	   determined by Linker.  SDA stands for Small Data Access.  */
	la	$gp, _SDA_BASE_

.L_init_sp:
	/* Initialization for stack pointe.  The symbol _stack is defined
	   in linker script.  Make sure $sp is 8-byte aligned.  */
	la	$sp, _stack
#if __NDS32_ISA_V3__
	bitci	$sp, $sp, #7
#else
	movi	$r0, #-8		/* Set $r0 as 0xFFFFFFF8.  */
	and	$sp, $sp, $r0
#endif

#if __NDS32_EX9_EXT__
.L_init_itb:
	/* Initialization for Instruction Table Base (ITB).
	   The symbol $_ITB_BASE_ is determined by Linker.
	   Set $ITB only if MSC_CFG.EIT (cr4.b'24) is set.  */
	mfsr    $r0, $MSC_CFG
	srli    $r0, $r0, 24
	andi    $r0, $r0, 0x1
	beqz    $r0, .L_zero_out_bss	/* Fall through ?  */
	la      $r0, $_ITB_BASE_
	mtusr   $r0, $ITB
#endif

.L_zero_out_bss:
	/* Zero out the bss section.
	   Equivalence C code for follow part:
	   if (_end == _edata) goto .L_call_main
	   unsinged int *ptr = _edata;
	   while (ptr != _end)
	     *ptr++ = 0
	   $r0 = ptr/_edata
	   $r1 = _end
	   $r2 = 0
	 */
	la	$r0, _edata
	la	$r1, _end
	movi	$r2, #0
	beq	$r0, $r1, .L_call_main	/* Branch if no bss.  */
.Lword_clear:
	swi.bi	$r2, [$r0], #4
	bne	$r0, $r1, .Lword_clear

.L_call_main:
	/* Prepare argc/argv/env for main function.
	   Since there is no operating system so far,
	   we set $r0, $r1, and $r2 to be zero.
	   Note: $r2 already set to zero in line 84.  */
	movi	$r0, 0
	movi	$r1, 0
	/* Call 'main'.  */
	bal	main

.L_terminate_program:
	/* There are two ways to terminate program:
	    1. User "syscall 0x1" directly.
	    2. Call exit. The  return value $r0 from main() is
	      implicitly passed as argument.

	    Currently, we use option 2 as a solution to follow C99 5.1.2.2.3,
	    but aware that general exit() will do some cleanup procedures
	    which may result in large-memory-footprints.  */
	bal	exit

.L_forever_loop:
	/* Should never return here.  */
	b	.L_forever_loop

	.size	_start, .-_start
