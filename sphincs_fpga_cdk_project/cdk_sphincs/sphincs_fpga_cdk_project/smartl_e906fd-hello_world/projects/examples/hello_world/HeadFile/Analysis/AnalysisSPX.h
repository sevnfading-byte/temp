#ifndef ANALYSISSPX_H
#define ANALYSISSPX_H
#include <stdbool.h>
#include "drv_usart.h"


//#define SPX_BASE    0x400A0000U
//#define SPX_MODE     (SPX_BASE + 0x00000)
//#define WORK_MODE    (SPX_BASE + 0x00004)
//#define SPX_EN       (SPX_BASE + 0x00008)
//#define R_HASH_CNT   (SPX_BASE + 0x0000c)
//#define IDX_HASH_CNT (SPX_BASE + 0x00010)
//#define SK_SEED      (SPX_BASE + 0x00014)
//#define SK_PRF       (SPX_BASE + 0x00034)
//#define PK_SEED      (SPX_BASE + 0x00054)
//#define PK_ROOT      (SPX_BASE + 0x00074)
//#define OPRAND       (SPX_BASE + 0x00094)
//#define INADDR       (SPX_BASE + 0x000b4)
//#define OUTADDR      (SPX_BASE + 0x000b8)
//#define BLOCK_NUM    (SPX_BASE + 0x000bc)
//#define SHA3_MODE    (SPX_BASE + 0x000c0)
//#define OUTTIME      (SPX_BASE + 0x000c4)
//#define LAST_BLK_LEN (SPX_BASE + 0x000c8)
//#define READ_START   (SPX_BASE + 0x000cc)
//#define WRITE_START  (SPX_BASE + 0x000d0)
//#define SPX_INT_ST   (SPX_BASE + 0x00100)
//#define SPX_INT      (SPX_BASE + 0x00100)
//#define SPX_INT_EN   (SPX_BASE + 0x00104)
//#define SPX_INT_CLR  (SPX_BASE + 0x00108)
////#define SPX_SRAM     (SPX_BASE + 0x10000)
//#define SPX_SRAM     (SPX_BASE + 0x01000)

void spx_sign(bool simple,
			int spx_n,
			bool fast,

			int 		mlen,
			int 		smlen,
			unsigned char *sk,
			unsigned char *pk,
			unsigned char *optrand,
			unsigned char *msg
			
);

void spx_gen_pk(bool simple,
			int spx_n,
			bool fast,

			unsigned char *sk,
			unsigned char *pk,
			unsigned int *pk_root
			
);

void read_sram(usart_handle_t uart_device, int smlen);

void spx_verify_gen_md(bool simple,
			int spx_n,
			bool fast,

			int 		mlen,
			unsigned char *pk,
			unsigned char *sm, // only R
			unsigned char *msg);


void write_sram(unsigned short addr, unsigned short data_len, unsigned char *Data);


unsigned char spx_verify(bool simple,
			int spx_n,
			bool fast);
			
void read_addr_sram(unsigned int addr);

#endif