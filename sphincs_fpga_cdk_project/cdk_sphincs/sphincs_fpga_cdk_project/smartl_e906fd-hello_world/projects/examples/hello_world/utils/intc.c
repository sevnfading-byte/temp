#include "datatype.h"
#include "uart.h"
#include "stdio.h"

#define TCIP_BASE                 0xE0000000
#define CLIC_BASE                 0xE0800000
#define INTIE                     0x400

//volatile   unsigned int* TCIP_BASE         = (volatile unsigned *)0xE0000000;
//volatile   unsigned int* CLIC_BASE         = (volatile unsigned *)0xE0800000;
//volatile   unsigned int* INTIE             = (volatile unsigned *)0x400;

//config the interrupt controller
void ck_intc_init()
{
	volatile int *picr = (volatile int *)TCIP_BASE;
        *picr = 0x0;
        
        // Write ISER
	volatile int *piser = (volatile int *)CLIC_BASE+INTIE+0x10;
        *piser = 0x810000;
}
