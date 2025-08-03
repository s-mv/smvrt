.global _start
_start:
    ldr sp, =stack_top
    bl main
loop:
    b loop

.section .bss
.align 4
stack_bottom:
    .space 4096
stack_top:

