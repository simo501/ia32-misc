.global check_quiz
check_quiz:
    pushl %ebx
    pushl %ebp
    pushl %esi
    pushl %edi

    xorl %eax, %eax

    cmpl $0, 20(%esp)
    jz RET
    cmpl $0, 24(%esp)
    jz RET



    # 4 * n
    movl $4, %edi
    imull 28(%esp), %edi

    subl $4, %esp

    movl %edi, (%esp)

    call malloc # eax adesso ha il ris

    addl $4, %esp


    xorl %ecx, %ecx     # i

L:

    cmpl 28(%esp), %ecx
    jz RET

    movl $0, (%eax, %ecx, 4)

    xorl %edi, %edi     # j

L2:
    cmpl $4, %edi
    jz INC_L

    movl 20(%esp), %ebp
    movl (%ebp, %ecx, 4), %esi
    movb (%esi, %edi, 1), %bl

    movl 24(%esp), %edx 
    cmpb (%edx, %edi, 1), %bl
    jne L3
    incl (%eax, %ecx, 4)

L3:
    incl %edi
    jmp L2

INC_L:
    incl %ecx
    jmp L

RET:
    popl %edi
    popl %esi
    popl %ebp
    popl %ebx

    ret
