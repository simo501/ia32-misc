.global rc4_encrypt
rc4_encrypt:
    pushl %esi
    pushl %edi
    pushl %ebp
    pushl %ebx

    xorl %esi, %esi
    xorl %edi, %edi
    xorb %bl, %bl

    movl 24(%esp), %ebp

L:
    cmpb $0, (%ebp)
    jz RET

    incl %edi
    andl $255, %edi

    movl 20(%esp), %ecx
    addb (%ecx, %edi, 1), %bl

    subl $20, %esp

    movl %ecx, (%esp)
    movl %edi, 4(%esp)
    movb %bl, 8(%esp)
    leal 16(%esp), %edx
    movl %edx, 12(%esp)
    call rc4_helper 

    movb 16(%esp), %dl

    addl $20, %esp

    movl 28(%esp), %eax 
    movb %dl, (%eax, %esi, 1)
    movb (%ebp), %dl
    xorb %dl, (%eax, %esi, 1)

    incl %esi
    incl %ebp

    jmp L

RET:
    popl %ebx
    popl %ebp
    popl %edi
    popl %esi

    ret
