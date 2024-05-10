#include "e1A.h"

unsigned char* base64lessless(unsigned char *data, unsigned out_len, unsigned char* b64_table) {
    if (data == NULL || out_len == 0)
        return NULL;

    unsigned char* eax = malloc(out_len);

    unsigned char bl = 0;
    unsigned char bh = 0;
    
    int edi = 0;
L:
    if (edi >= out_len) goto RET;
    
    unsigned char ch = *data;

    unsigned char cl = (6 - bl);

    unsigned char dl = (bh << cl);
    
    cl = (2 + bl); 

    unsigned char dh = (ch >> cl);
    dl = dl | dh;

    dh = 6 - bl;
    bl = (8 - (6 - bl)) & 7;

    cl = (8 - bl);
    bh = ch << cl;
    bh = bh >> cl;

    if (bl >= 6) goto S;
    
    data += 1;

S:
    eax[edi] = b64_table[dl];
    
    edi += 1;

    goto L;

RET:
    return eax;
}
