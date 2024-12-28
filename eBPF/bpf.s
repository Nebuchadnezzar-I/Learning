	.text
	.file	"minimal.bpf.c"
	.section	"tp/syscalls/sys_enter_write","ax",@progbits
	.globl	handle_tp                       # -- Begin function handle_tp
	.p2align	4, 0x90
	.type	handle_tp,@function
handle_tp:                              # @handle_tp
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movaps	.L__const.handle_tp.____fmt(%rip), %xmm0
	movaps	%xmm0, -32(%rbp)
	movabsq	$2851464849548647, %rax         # imm = 0xA216465726567
	movq	%rax, -16(%rbp)
	leaq	-32(%rbp), %rdi
	movl	$6, %ecx
	movl	$24, %esi
	xorl	%eax, %eax
	callq	*%rcx
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	handle_tp, .Lfunc_end0-handle_tp
	.cfi_endproc
                                        # -- End function
	.type	pid_filter,@object              # @pid_filter
	.section	.rodata,"a",@progbits
	.globl	pid_filter
	.p2align	2, 0x0
pid_filter:
	.long	0                               # 0x0
	.size	pid_filter, 4

	.type	LICENSE,@object                 # @LICENSE
	.section	license,"aw",@progbits
	.globl	LICENSE
LICENSE:
	.asciz	"Dual BSD/GPL"
	.size	LICENSE, 13

	.type	.L__const.handle_tp.____fmt,@object # @__const.handle_tp.____fmt
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4, 0x0
.L__const.handle_tp.____fmt:
	.asciz	"BPF program triggered!\n"
	.size	.L__const.handle_tp.____fmt, 24

	.ident	"clang version 18.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym handle_tp
	.addrsig_sym LICENSE
