.global base64lessless

base64lessless: 

    pushl %ebx
    pushl %esi
    pushl %edi

    xorl %eax, %eax
    cmpl $0, 16(%esp)
    jz RET 

    movl 20(%esp), %eax
    subl $4, %esp
    movl %eax, (%esp)
    call malloc
    addl $4, %esp

    xorb %bl, %bl
    xorb %bh, %bh
    
    xorl %edi, %edi

L:
    cmpl 20(%esp), %edi
    jge RET

    movl 16(%esp), %esi
    movb (%esi), %ch

    movb $6, %cl
    subb %bl, %cl

    movb %bh, %dl 
    shlb %cl, %dl

    movb $2, %cl
    addb %bl, %cl

    movb %ch, %dh
    shrb %cl, %dh
    
    orb %dh, %dl

    movb $6, %dh
    subb %bl, %dh
    movb $8, %bl
    subb %dh, %bl

    andb $7, %bl

    movb $8, %cl
    subb %bl, %cl
    movb %ch, %bh
    shlb %cl, %bh
    shrb %cl, %bh

    cmpb $6, %bl
    jge S

    incl 16(%esp)
S:
    pushl %ecx
    movzb %dl, %ecx
    movl 28(%esp), %esi
    movl (%esi, %ecx), %esi 
    movl %esi, (%eax, %edi) 
    incl %edi
    popl %ecx
    jmp L

RET:
    popl %edi
    popl %esi
    popl %ebx
    ret
