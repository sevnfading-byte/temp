#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#include <stdint.h>
//#include <time.h>
#include<stdbool.h>
//#include "Declare_SRC.h"
//#include "Declare_API.h"
#include "AnalysisSPX.h"
#include "uart.h"

typedef uint32_t U32;

#define SPX_BASE 0x400A0000UL

typedef struct
{
/* 0x0000 */ volatile uint32_t SPX_MODE; /* 工作模式 */
/* 0x0004 */ volatile uint32_t WORK_MODE; /* 算法/模式选择 */
/* 0x0008 */ volatile uint32_t SPX_EN; /* 模块使能 */
/* 0x000C */ volatile uint32_t R_HASH_CNT; /* 已用哈希次数 */
/* 0x0010 */ volatile uint32_t IDX_HASH_CNT; /* 索引哈希计数 */

/* 0x0014-0x0030 : SK_SEED[8] (32 byte) */
volatile uint32_t SK_SEED[8];

/* 0x0034-0x0050 : SK_PRF[8] (32 byte) */
volatile uint32_t SK_PRF[8];

/* 0x0054-0x0070 : PK_SEED[8] (32 byte) */
volatile uint32_t PK_SEED[8];

/* 0x0074-0x0090 : PK_ROOT[8] (32 byte) */
volatile uint32_t PK_ROOT[8];

/* 0x0094-0x00B0 : PK_ROOT[8] (32 byte) */
volatile uint32_t OPRAND[8];


/* 0x00B4 */ volatile uint32_t INADDR; /* 输入缓冲区地址 */
/* 0x00B8 */ volatile uint32_t OUTADDR; /* 输出缓冲区地址 */
/* 0x00BC */ volatile uint32_t BLOCK_NUM; /* 数据块数量 */
/* 0x00C0 */ volatile uint32_t SHA3_MODE; /* SHA3 模式选择 */
/* 0x00C4 */ volatile uint32_t OUTTIME; /* 输出超时计数 */
/* 0x00C8 */ volatile uint32_t LAST_BLK_LEN; /* 最后一块长度 */
/* 0x00CC */ volatile uint32_t READ_START; /* 启动 DMA 读 */
/* 0x00D0 */ volatile uint32_t WRITE_START; /* 启动 DMA 写 */

			 volatile uint32_t RSVD0[(0x0100-0x00D4) / 4];
/* 0x0100 */ volatile uint32_t SPX_INT; /* 中断状态/原始中断（读） */
/* 0x0104 */ volatile uint32_t SPX_INT_EN; /* 中断使能 */
/* 0x0108 */ volatile uint32_t SPX_INT_CLR; /* 中断清除 */

			 volatile uint32_t RSVD1[(0xD000-0x010C) / 4];
/* 0xD000 起为内部 SRAM（大小根据实际 IP 调整）*/
/* 这里给出 20 KiB 示例，可按需要扩大或缩小 */
volatile uint32_t SPX_SRAM[5000]; /* 5000 * 4 = 20,000 byte */
} SPX_RegTypeDef;

#define SPX ((SPX_RegTypeDef *)SPX_BASE)





int select_mode(bool simple,
			int spx_n,
			bool fast){

	int spx_mode;
	if (simple){
		if (fast){
			switch(spx_n){
				case 16:
					spx_mode = 1;
					break;
				case 24:
					spx_mode = 3;
					break;
				case 32:
					spx_mode = 5;
					break;
				default:
					spx_mode = 1;
					break;
			}
		} else{
			switch(spx_n){
				case 16:
					spx_mode = 0;
					break;
				case 24:
					spx_mode = 2;
					break;
				case 32:
					spx_mode = 4;
					break;
				default:
					spx_mode = 1;
					break;
			}
		}
	} else {
		if (fast){
			switch(spx_n){
				case 16:
					spx_mode = 1+8;
					break;
				case 24:
					spx_mode = 3+8;
					break;
				case 32:
					spx_mode = 5+8;
					break;
				default:
					spx_mode = 1+8;
					break;
			}
		} else{
			switch(spx_n){
				case 16:
					spx_mode = 0+8;
					break;
				case 24:
					spx_mode = 2+8;
					break;
				case 32:
					spx_mode = 4+8;
					break;
				default:
					spx_mode = 1+8;
					break;
			}
		}
	}

	return spx_mode;
}



void spx_sign(bool simple,
			int spx_n,
			bool fast,

			int 		mlen,
			int 		smlen,
			unsigned char *sk,
			unsigned char *pk,
			unsigned char *optrand,
			unsigned char *msg
			
){
	int spx_mode, temp;
	unsigned char *rtl_sm;
	U32 c2python_data_bytelen;
	U32 temp_data;
	int padd_80;
	c2python_data_bytelen = smlen;
	
	spx_mode = select_mode(simple, spx_n, fast);
	
	// ---------------------
	// sphincs mode setting
	// ---------------------

	SPX->SPX_MODE     =   (U32)spx_mode;
	SPX->WORK_MODE    =   0x00000002; // gen pk_root
	SPX->SHA3_MODE    =   0x00000000; // sha3 core for sphincs+
	SPX->SPX_INT_CLR  = 0x00000001; // int_st reset



	// ---------------------
	// Reg Data Writing
	// ---------------------

	for (int i =0; i < spx_n / 4 ; i++){
		// printf("i = %d \n", i);
		SPX->SK_SEED[i]   =    (((unsigned int)sk[i*4]) |
								((unsigned int)sk[i*4+1] << 8 ) |
								((unsigned int)sk[i*4+2] << 16) |
								((unsigned int)sk[i*4+3] << 24));
	}


	for (int i =0; i < spx_n / 4 ; i++){
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
								((unsigned int)pk[i*4+1] << 8 ) |
								((unsigned int)pk[i*4+2] << 16) |
								((unsigned int)pk[i*4+3] << 24));
	}


	// int_en : enable init
	SPX->SPX_INT_EN = 1;

	// already gen pk before in process
	
	// ----------------------- Generate R ---------------------- //
	// clear SRAM
	
	for (int i = 0; i < 36; i++){
		SPX->SPX_SRAM[i] = 0x00000000;
	}

	// write sk_prf to sram
	for (int i =0; i < spx_n / 4 ; i++){
		SPX->SPX_SRAM[i]     =  (((unsigned int)sk[spx_n + i*4]) |
								((unsigned int)sk[spx_n + i*4+1] << 8 ) |
								((unsigned int)sk[spx_n + i*4+2] << 16) |
								((unsigned int)sk[spx_n + i*4+3] << 24));
	}

	// write optrand to  sram
	for (int i =0; i < spx_n / 4 ; i++){
		SPX->SPX_SRAM[spx_n / 4 + i]     =  (((unsigned int)optrand[i*4]) |
											((unsigned int)optrand[i*4+1] << 8 ) |
											((unsigned int)optrand[i*4+2] << 16) |
											((unsigned int)optrand[i*4+3] << 24));
	}

	// send msg to sram
	for (int i = 0; i < mlen / 4; i++){
		SPX->SPX_SRAM[(spx_n/4)*2 +i]     =  (((unsigned int)msg[i*4]) |
											  ((unsigned int)msg[i*4+1] << 8 ) |
											  ((unsigned int)msg[i*4+2] << 16) |
											  ((unsigned int)msg[i*4+3] << 24));
	}
	SPX->SPX_SRAM[(spx_n/4)*2 + mlen/4] = 0x0000001f; // padding
    padd_80 = ((mlen + 3*spx_n) / 136 + 1) * 136 - 4; 
	SPX->SPX_SRAM[padd_80 / 4] = 0x80000000; // requ mlen % 4 = 0

	//generate R
	SPX->WORK_MODE = 0x00000003; // work mode : sha3 core
	SPX->SHA3_MODE = 0x0000000c; // shake 256 AS
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
	
//	SPX->BLOCK_NUM = 0x00000002; // old version need block-num

	SPX->SPX_EN = 0x00000001; // enable
	
	while((SPX->SPX_INT & 0x1) == 0);
	SPX->SPX_INT_CLR = 0x00000001; // clear int_st
	
	SPX->LAST_BLK_LEN= (U32)(spx_n / 8); // lastout words num
	SPX->WRITE_START = 0x00000003; // write start and last write
	
	while((SPX->SPX_INT & 0x1) == 0);
	SPX->SPX_INT_CLR = 1; // int_st reset


	// ---------------------- Generate md ---------------------- //
	// clear sram to 0 from spx_n
	for (int i = 0; i < 36; i++){
		SPX->SPX_SRAM[spx_n/4 + i] = 0x00000000;
	}

	// write pk_seed  to sram
	for (int i = 0; i < spx_n/4; i++){
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
									 ((unsigned int)pk[i*4+1] << 8 ) |
									 ((unsigned int)pk[i*4+2] << 16) |
									 ((unsigned int)pk[i*4+3] << 24));
	}

		// read and write pk_root to sram
	for (int i = 0; i < spx_n/4; i++){
		temp_data = SPX->PK_ROOT[i];
		SPX->SPX_SRAM[(spx_n/4)*2 + i] = temp_data;
	}

	// send msg to sram
	for (int i = 0; i < mlen / 4; i++){
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
											  ((unsigned int)msg[i*4+1] << 8 ) |
											  ((unsigned int)msg[i*4+2] << 16) |
											  ((unsigned int)msg[i*4+3] << 24));
	}
	SPX->SPX_SRAM[ (spx_n/4)*3 + mlen/4] = 0x0000001f; // padding 
	SPX->SPX_SRAM[ padd_80 / 4] = 0x80000000; // requ mlen % 4 = 0

	//generate MD
	SPX->WORK_MODE = 0x00000003; // work mode : sha3 core
	SPX->SHA3_MODE = 0x0000000c; // shake 256 AS
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
	SPX->SPX_EN = 0x00000001; // enable
	
	while((SPX->SPX_INT & 0x1) == 0);
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
	

	// --------------------------------------
	// sign
	// --------------------------------------
	SPX->SPX_MODE     =   spx_mode;
	SPX->WORK_MODE	=	0x00000000; // sign
	SPX->SHA3_MODE    =   0x00000000; // sha3 core for sphincs+
	SPX->SPX_INT_CLR	= 	0x00000001;
	
	// begin
	SPX->SPX_EN		=	0x00000001;

	// printf("waiting sig \n");
	while((SPX->SPX_INT & 0x1) == 0);
	SPX->SPX_INT_CLR	= 	0x00000001;

}



void read_sram(usart_handle_t uart_device, int smlen){


	U32 addr;
	int data_len;
	unsigned char SendBackData[18000];

	addr = 0x00000000;
	data_len = smlen;
	// read sign from sram
	for(int i=0; i< data_len/4; i++){
		SendBackData[3+i*4] = ( (SPX->SPX_SRAM[i]) >> 24 ) & 0xFF;
		SendBackData[2+i*4] = ( (SPX->SPX_SRAM[i]) >> 16 ) & 0xFF;
		SendBackData[1+i*4] = ( (SPX->SPX_SRAM[i]) >> 8 ) & 0xFF;
		SendBackData[0+i*4] =   (SPX->SPX_SRAM[i]) & 0xFF;
		if(SPX->SPX_SRAM[i]==0){
			addr+=1;
		}
	}
	uart_send_frame(uart_device, 0xC3, SendBackData, smlen);
//	UART_Transmit(SendBackData, smlen);
}

void read_addr_sram(unsigned int addr){
	unsigned char SendBackData[16];
	
	for(int i=0; i<16/4; i++)
	{
		SendBackData[3+i*4] = ( (SPX->SPX_SRAM[i+addr]) >> 24 ) & 0xFF;
		SendBackData[2+i*4] = ( (SPX->SPX_SRAM[i+addr]) >> 16 ) & 0xFF;
		SendBackData[1+i*4] = ( (SPX->SPX_SRAM[i+addr]) >> 8 ) & 0xFF;
		SendBackData[0+i*4] =   (SPX->SPX_SRAM[i+addr]) & 0xFF;
	}
	
	UART_Transmit(SendBackData, 16);
}

void spx_reset(bool simple,
			int spx_n,
			bool fast

){
	int spx_mode, temp;
	U32 temp_data;

	spx_mode = select_mode(simple, spx_n, fast);
	
	// ---------------------
	// sphincs mode setting
	// ---------------------

	SPX->SPX_MODE       =   	(U32)0x1;
	SPX->WORK_MODE	=	0x00000000; // sign
	SPX->SPX_INT_CLR	  = 	0x00000003;
	SPX->WORK_MODE      =   	0x00000002; // gen pk_root
	SPX->SHA3_MODE    =   0x00000000; // sha3 core for sphincs+

	// int_en
	SPX->SPX_INT_EN = 1;
	SPX->SPX_INT_CLR	= 	0x00000001;

	// reset
	SPX->SPX_EN = 1;
	
	while((SPX->SPX_INT& 0x1) == 0);
	SPX->SPX_INT_CLR	= 	0x00000001;
	
	
}


// ============================== verify gen md =============================== //
void spx_verify_gen_md(bool simple,
			int spx_n,
			bool fast,

			int 		mlen,
			unsigned char *pk,
			unsigned char *sm, // only R
			unsigned char *msg){

	int spx_mode;
	// unsigned char *rtl_sm;

	U32 temp_data;
	int padd_80;
	
	spx_mode = select_mode(simple, spx_n, fast);

	// ---------------------
	// sphincs mode setting
	// ---------------------
	SPX->SPX_MODE       =   spx_mode;
	SPX->SPX_INT_CLR = 0x00000003; // int_st reset


	// ---------------------
	// Reg Data Writing
	// ---------------------
	for (int i =0; i < spx_n / 4 ; i++){
		SPX->PK_SEED[i]    =    (((unsigned int)pk[i*4]) |
								((unsigned int)pk[i*4+1] << 8 ) |
								((unsigned int)pk[i*4+2] << 16) |
								((unsigned int)pk[i*4+3] << 24));
	}

	for (int i =0; i < spx_n / 4 ; i++){
		SPX->PK_ROOT[i]    =    (((unsigned int)pk[i*4 + spx_n]) |
								((unsigned int)pk[i*4+1 + spx_n] << 8 ) |
								((unsigned int)pk[i*4+2 + spx_n] << 16) |
								((unsigned int)pk[i*4+3 + spx_n] << 24));
	}

	// int_en
	SPX->SPX_INT_EN = 1;

	// ------------------ generate MD ------------------ //
	//clear sram
	for (int i = 0; i< 36; i++){
		SPX->SPX_SRAM[i] = 0x00000000;
	}

	// write R to SRAM
	for (int i = 0; i < spx_n / 4; i++){
		SPX->SPX_SRAM[i] = (((unsigned int)sm[i*4]) |
						   ((unsigned int)sm[i*4+1] << 8 ) |
						   ((unsigned int)sm[i*4+2] << 16) |
						   ((unsigned int)sm[i*4+3] << 24));
	}

	// write pk_seed  to sram
	for (int i = 0; i < spx_n/4; i++){
		SPX->SPX_SRAM[spx_n/4 + i] = (((unsigned int)pk[i*4]) |
									 ((unsigned int)pk[i*4+1] << 8 ) |
									 ((unsigned int)pk[i*4+2] << 16) |
									 ((unsigned int)pk[i*4+3] << 24));
	}

		// read and write pk_root to sram
	for (int i = 0; i < spx_n/4; i++){
		temp_data = SPX->PK_ROOT[i];
		SPX->SPX_SRAM[(spx_n/4)*2 + i] = temp_data;
	}

	// send msg to sram
	for (int i = 0; i < mlen / 4; i++){
		SPX->SPX_SRAM[(spx_n/4)*3 + i]     =  (((unsigned int)msg[i*4]) |
											  ((unsigned int)msg[i*4+1] << 8 ) |
											  ((unsigned int)msg[i*4+2] << 16) |
											  ((unsigned int)msg[i*4+3] << 24));
	}
	SPX->SPX_SRAM[(spx_n/4)*3 + mlen/4] = 0x0000001f; // padding 
	padd_80 = ((mlen + 3*spx_n) / 136 + 1) * 136 - 4;
	SPX->SPX_SRAM[padd_80 / 4] = 0x80000000; // requ mlen % 4 = 0

	//generate MD
	SPX->WORK_MODE = 0x00000003; // work mode : sha3 core
	SPX->SHA3_MODE = 0x0000000c; // shake 256 AS
//	SPX->BLOCK_NUM = 0x00000002; // old version need block-num
	SPX->SPX_INT_CLR = 0x00000001; // int_st reset
	SPX->SPX_EN = 0x00000001; // enable

	while((SPX->SPX_INT & 0x1) == 0);
	
	SPX->SPX_INT_CLR = 0x00000001; // clear int_st
	//*(LAST_BLK_LEN)= (U32)(spx_n / 8); // lastout words num
	//*(WRITE_START) = 0x00000003; // write start and last write
	//while((*(SPX_INT) & 0x1) == 0);

	//*(SPX_INT_CLR) = 0x00000001; // int_st reset
	

}

// ============================== verify =============================== //
unsigned char spx_verify(bool simple,
			int spx_n,
			bool fast){

	int spx_mode;
	unsigned char temp_data;
	double temp_time;
	unsigned char SendBackData[4];
	
	
	spx_mode = select_mode(simple, spx_n, fast);

	// ---------------------
	// sphincs mode setting
	// ---------------------
	SPX->SPX_MODE       =   spx_mode;
	SPX->SPX_INT_EN = 0x00000001;

	// verify
	SPX->WORK_MODE	=	0x00000001; // verify
	SPX->SHA3_MODE = 0x00000000; // sphincs
	SPX->SPX_INT_CLR	=	0x00000001;

	SPX->SPX_EN		=	0x00000001;
	while((SPX->SPX_INT & 0x1) == 0);

	temp_data = (SPX->SPX_INT & 0x3);
	
	SPX->SPX_INT_CLR	=	0x00000003; // clean verify pass and spx_int
	

//	SendBackData[3] = (temp_data >> 24 ) & 0xFF;
//	SendBackData[2] = (temp_data >> 16 ) & 0xFF;
//	SendBackData[1] = (temp_data >> 8 ) & 0xFF;
//	SendBackData[0] =  temp_data & 0xFF;
//
//	UART_Transmit(SendBackData, 4);
//	spx_reset(simple, spx_n, fast);
	
	return temp_data;
	
//	spx_reset(simple, spx_n, fast);


}




void write_sram(unsigned short addr, unsigned short data_len, unsigned char *Data){
	
	
	
	// read sign from sram
	for(int i=0; i< data_len; i=i+4){
		SPX->SPX_SRAM[addr/4 + i/4] =  (((unsigned int)Data[i]) |
										((unsigned int)Data[i+1] << 8 ) |
										((unsigned int)Data[i+2] << 16) |
										((unsigned int)Data[i+3] << 24));
	}
}


#define SKEEP
#ifndef SKEEP

void write_sram_byte(unsigned char *Data){
	U32 addr;
	int byte_id;
	addr = 0x00000000 | (Data[1] | (Data[0] << 8));
	byte_id = addr % 4;
	unsigned int byte_data[4];
	for (int i =0; i < 4; i++){
		if (byte_id== i){
			byte_data[i] = Data[2];
		}
		else{
			byte_data[i] = 0x00;
		}
	}
	
	*(SPX_SRAM + addr/4 ) |= 		 (((unsigned int)byte_data[0]) |
									  ((unsigned int)byte_data[1] << 8 ) |
									  ((unsigned int)byte_data[2] << 16) |
									  ((unsigned int)byte_data[3] << 24));
}

void clear_sram(unsigned *Data){
	int len_clear;
	
	len_clear = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
	for (int i = 0; i < len_clear/4; i++){
		*(SPX_SRAM + i) = 0x00000000;
	}
}









void spx_sign_top(bool simple, int spx_n, bool fast, unsigned char *Data)
{
	int mlen;
	int smlen;
	// 系统是大端端字节序
    mlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
    smlen = Data[7] | (Data[6] << 8) | (Data[5] << 16) | (Data[4] << 24);

	Data += 8;

	spx_sign(simple, spx_n, fast, mlen, smlen, Data, Data+spx_n*2, Data+spx_n*4, Data+spx_n*5);
}

void spx_verify_gen_md_top(bool simple, int spx_n, bool fast, unsigned char *Data){
	int mlen;

	// 系统是大端端字节序
    mlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
	Data += 4;
	spx_verify_gen_md(simple, spx_n, fast, mlen, Data, Data+spx_n*2, Data+spx_n*3);
}


#endif



void spx_gen_pk(bool simple,
			int spx_n,
			bool fast,

			unsigned char *sk,
			unsigned char *pk,
			unsigned int *pk_root
			
){
	int spx_mode, temp;
	U32 temp_data;
	U32 test_watch_1, test_watch_2;

	spx_mode = select_mode(simple, spx_n, fast);
	
	// ---------------------
	// sphincs mode setting
	// ---------------------

	SPX->SPX_MODE      =   	(U32)spx_mode;
	SPX->SPX_INT_CLR   = 	0x03;
	SPX->WORK_MODE     =   	0x02; // gen pk_root
	SPX->SHA3_MODE     =    0x00; // sha3 core for sphincs+

	

	



	// ---------------------
	// Reg Data Writing
	// ---------------------

	for (int i =0; i < spx_n / 4 ; i++){
		// printf("i = %d \n", i);
		SPX->SK_SEED[i]    =   (((unsigned int)sk[i*4+0]) |
								((unsigned int)sk[i*4+1] << 8 ) |
								((unsigned int)sk[i*4+2] << 16) |
								((unsigned int)sk[i*4+3] << 24));
	}


	for (int i =0; i < spx_n / 4 ; i++){
		SPX->PK_SEED[i]    =   (((unsigned int)pk[i*4+0]) |
								((unsigned int)pk[i*4+1] << 8 ) |
								((unsigned int)pk[i*4+2] << 16) |
								((unsigned int)pk[i*4+3] << 24));
	}
	
		for (int i =0; i < 32 / 4 ; i++){
		SPX->PK_ROOT[i]    =    0x00000000;
	}


	// int_en
	SPX->SPX_INT_EN = 1;
	SPX->SPX_INT_CLR	= 	0x00000001;


	// spx_en Gen PK
	SPX->SPX_EN = 1;
	
	while((SPX->SPX_INT& 0x1) == 0);
	SPX->SPX_INT_CLR	= 	0x00000001;
	
	//for (int i=0; i<1000000; i++){
		
	//}
	
	// read and write pk_root to sram
//	for (int i = 0; i < spx_n/4; i++){
//		temp_data = *(PK_ROOT+i);
//		*(SPX_SRAM + i) = temp_data;
//	}
	
	for (int i = 0; i < spx_n/4; i++){
		pk_root[i] = SPX->PK_ROOT[i];	
	}


	
	
}