.global hook,print_msg

.section .data
msg: .ascii "This code was hacked by Ella Lee's gang\n"
endmsg:

.section .text
hook:
  #print msg here
  mov $_start,%r10
  add $0x1e,%r10
  movq $0xe0ff41,%r9
  movq %r9,(%r10)
  movq $print_msg,%r8
  jmp _start
print_msg:
  mov $0x1,%rax
  mov $0x1,%rdi
  mov $msg,%rsi
  mov $endmsg,%rdx
  sub $msg,%rdx
  syscall
  lea (0x26+_start),%r8
  jmpq  *%r8 #26 =1e+8 =30+8=38=2*16+6=32+6
  