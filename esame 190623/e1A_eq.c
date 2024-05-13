#include "e1A.h"

void rc4_encrypt(unsigned char *sbox, unsigned char *pt, unsigned char *ct) 
{
    unsigned int esi = 0, edi = 0;
    unsigned char bl = 0, edx;
    unsigned char* eax = ct;
    unsigned char* ebp = ct;


L:
    if (*pt==0) goto RET;
       
    edi += 1;
    edi &= 255; 
    bl += sbox[edi];

    rc4_helper(sbox, edi, bl, &edx);
    
    eax[esi] = edx;
    eax[esi] ^= *pt; 
    
    esi += 1;
    pt += 1;

    goto L;


RET:
    return;
}

