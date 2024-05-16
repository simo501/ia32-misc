#include "e1A.h"

int* check_quiz(char** answers, char* solution, int n) {
    
    int* eax = NULL;

    if (answers == NULL) goto RET;
    
    if (solution == NULL) goto RET;
    
    if (n <= 0) goto RET;

    int edi = sizeof(int) * n; // 4 * n

    eax = malloc(edi);
    
    int ecx = 0;
    
L:   
    // for(ecx = 0; ecx < n; ecx++) {
    if (ecx == n) goto RET;
    
    eax[ecx] = 0;

    // devo riazzerare il contatore ovviamente
    // altrimenti gli altri risultanti andranno
    // tutti a 0
    edi = 0;
    

L2:    
    // for (edi = 0; edi < 4; edi++) {
    if (edi == 4) goto INC_L;
    
    char* esi = answers[ecx]; // attenzione: e' un puntatore! 
    char bl = esi[edi];
    
    if (bl != solution[edi]) goto L3;// attenzione: confronto di caratteri!
        eax[ecx] += 1;
    

L3:

    edi += 1;
    goto L2;

    // }

INC_L:

    ecx += 1;
    goto L;

    // }

RET:
    return eax;
}
