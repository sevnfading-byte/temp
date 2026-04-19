///*
// * Copyright (C) 2017-2019 Alibaba Group Holding Limited
// */
//
//
///******************************************************************************
// * @file     main.c
// * @brief    hello world
// * @version  V1.0
// * @date     17. Jan 2018
// ******************************************************************************/
//
//#include <stdio.h>
//
//int main(void)
//{
//    printf("Hello World!\n");
//    printf("Hello_World runs successfully!\n");
//
//    return 0;
//}


// * **************************************************************************
// * This file and all its contents are properties of C-Sky Microsystems. The *
// * information contained herein is confidential and proprietary and is not  *
// * to be disclosed outside of C-Sky Microsystems except under a             *
// * Non-Disclosure Agreement (NDA).                                          *
// *                                                                          *
// ****************************************************************************
// AUTHOR     : JiangPeng
// CSKYCPU    : 906
// HWCFIG     : 
// FUNCTION   : Test performance for memory copy
// METHOD     : 1) initial memory 
//              2) config UART and INTC
//              3) initial and start timer
//              4) do memcopy
//              5) stop timer and caculate performance
// NOTE       :
// ****************************************************************************

//if you want use virtual counter of CSKY, Open the macro below
//#define VCUNT_SIM

#include "datatype.h"
#include "uart.h"
#include "intc.h"
//#include "vtimer.h"
#include "stdio.h"
#include "timer.h"
#include "hard.h"
#include "malloc.h"
#include "uart_process.h"

#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdint.h>

#include <drv_usart.h>
#include <csi_core.h>

#define SPX_N 16
#define CRYPTO_PUBLICKEYBYTES SPX_N*2
#define CRYPTO_SECRETKEYBYTES SPX_N*2


#ifdef VCUNT_SIM
//#include "vtimer.h"
extern unsigned int get_vtimer();
#endif 

t_ck_uart_device uart0 = {0xFFFF};

unsigned char hex_char_to_int(char c) {
        if (c >= '0' && c <= '9') return c - '0';
            if (c >= 'a' && c <= 'f') return c - 'a' + 10;
                if (c >= 'A' && c <= 'F') return c - 'A' + 10;
                    return 0;

}



void hex_string_to_bytes_le(const char *hex_str, unsigned char *bytes, int bytes_len) {
        int str_len = strlen(hex_str);
            for (int i = 0; i < bytes_len; i++) {
                        int str_pos = str_len - 2 - (i * 2);
                                if (str_pos < 0) break;
                                        unsigned char high = hex_char_to_int(hex_str[str_pos]);
                                                unsigned char low  = hex_char_to_int(hex_str[str_pos + 1]);
                                                        bytes[i] = (high << 4) | low;
                                                            }
}

int Loop_Num = 0;

void wait_for_sxp_int(void){
	while((*(SPX_INT) & 0x01) == 0);
	*(INT_CLR) = 1;
}

volatile uint32_t g_mhcr_before = 0;

volatile uint32_t g_mhcr_after  = 0;

/* 第一步：使能 T-Head 扩展 CSR 访问权限 */
static void thead_ext_enable(void)
{
    __asm__ __volatile__(
        "li    t0, (1 << 22)  \n"   /* theadisaee = bit[22] */
        "csrs  mxstatus, t0   \n"
        ::: "t0"
    );
}


void cache_disable_all(void)
{
    /* Step 0: 解锁玄铁扩展 CSR 访问 */
    thead_ext_enable();

    /* Step 1: 读取当前 mhcr 值（用于调试） */
    __asm__ __volatile__("csrr %0, mhcr" : "=r"(g_mhcr_before));

    /* Step 2: 先回写并无效化 D-Cache，再无效化 I-Cache */
//    dcache_flush_by_reg();
//    icache_inv_by_reg();

    /* Step 3: 清除 IE(bit0) 和 DE(bit1) */
    __asm__ __volatile__(
        "li   t0, 0x1f    \n"   /* 0x3 = 0b11，同时清 bit1:bit0 */
        "csrc mhcr, t0   \n"
        ::: "t0"
    );

    /* Step 4: 读取操作后的值 */
    __asm__ __volatile__("csrr %0, mhcr" : "=r"(g_mhcr_after));

    /* Step 5: 指令流同步 */
    __asm__ __volatile__("fence.i" ::: "memory");
}



static usart_handle_t g_uart0;
int tet_flag=0;
static void uart_event_cb(int32_t idx, usart_event_e event)
{
    if (event == USART_EVENT_RECEIVED ||
        event == USART_EVENT_RECEIVE_COMPLETE) {

        /* 这里是“中断后的安全回调环境” */
		Frame rx_frame;
		int ret;
		ret = uart_recv_frame(g_uart0, &rx_frame);
		
		if (ret == -1) {
		/* Timeout, keep waiting */ 
		} else if (ret != 0) {
		/* Protocol error, error frame already sent inside uart_recv_frame */

        } else{
			uart_process_frame(g_uart0, &rx_frame);
		}
		
        /* 可以设置 flag，或者处理数据 */
		tet_flag =1;
    }
}



/* ================================================================== */
/*  main                                                                */
/* ================================================================== */
int main(void)
{
    cache_disable_all();
    ck_intc_init();
    Timer_Interrupt_Init();

    /* 初始化 UART */
    g_uart0 = csi_usart_initialize(0, uart_event_cb);
    if (g_uart0 == NULL) { while (1); }

    csi_usart_config(g_uart0,
                     19200,
                     USART_MODE_ASYNCHRONOUS,
                     USART_PARITY_NONE,
                     USART_STOP_BITS_1,
                     USART_DATA_BITS_8);

    csi_usart_set_interrupt(g_uart0, USART_INTR_READ, 1);

	{
        uint8_t hello[] = "E906 READY  00000";
		
        uart_send_frame(g_uart0, CMD_PONG, hello, (uint16_t)(sizeof(hello) - 1U));
    }

    /* 主循环：等待中断 */
    while (1) {
    }

    return 0;

	
	
	
	
	
	
	
	
	
	
  int cp_size            = 0x1000/4;
  int i                  = 0;
  int j                  = 0;
  int m                  = 0;
  int n                  = 0;
  int a[6] = {3777, 7682, 7679, 100, 5, 7};
  uint16_t a_short[6] = {3777, 7682, 7679, 100, 5, 7};
//  uint     a[6]       = {165536, 278934, 395678, 432100, 532222, 678901}; 
   
    uint32_t spx_mode;
    uint32_t work_mode;
    uint32_t r_hash_cnt;
    uint32_t idx_hash_cnt;
	uint32_t spx_int;
    unsigned char       pk[CRYPTO_PUBLICKEYBYTES], sk[CRYPTO_SECRETKEYBYTES];

    unsigned char       pk_rtl[CRYPTO_PUBLICKEYBYTES], sk_rtl[CRYPTO_SECRETKEYBYTES];
    unsigned char       seed[48];
    unsigned char       msg[3300];
    unsigned char       entropy_input[48];
    unsigned char       optrand[SPX_N];
    unsigned char       R[SPX_N];
    unsigned char       md[SPX_N];
    unsigned long long  mlen, smlen;
    //unsigned char       *sm, *rtl_sm;
//    unsigned char rtl_sm[17120];
    int                 equal;

    const char *sk_hex_str      = "0994ace42bfc99e3923afb000b2ac3f3964ce207ba11c42b724f93d757b54d10";
    const char *pk_hex_str      = "fdbee93c3eff6deeecd1ff158f348bd4";
    
    const char *optrand_hex_str = "37af87d0229a910c1304b08ef57aff4f";
    const char *msg_hex_str     = "e4f8a534429c45f4cd59ae6f78c6f85fe5014c33777225cb2ac1297f4864b94a";

    int spx_n = 16;
    
    int current_time;
    long total_time = 0;
  
    spx_mode = 1;
    smlen = 17120;
    mlen = 32;

    memset(sk, 0 ,sizeof(sk));
    hex_string_to_bytes_le(sk_hex_str, sk, SPX_N*2);

    memset(pk, 0 ,sizeof(pk));
    hex_string_to_bytes_le(pk_hex_str, pk, SPX_N);

    memset(optrand, 0 ,sizeof(optrand));
    hex_string_to_bytes_le(optrand_hex_str, optrand, SPX_N);

    memset(msg, 0 ,sizeof(msg));
    hex_string_to_bytes_le(msg_hex_str, msg, mlen);
  //-------------------------------------------------------
  //   c model gen keypair
  //-------------------------------------------------------
/*
    sk[ 0] = 0x00;
    sk[ 1] = 0x01;
    sk[ 2] = 0x02;
    sk[ 3] = 0x03;

    sk[ 4] = 0x04;
    sk[ 5] = 0x05;
    sk[ 6] = 0x06;
    sk[ 7] = 0x07;

    sk[ 8] = 0x08;
    sk[ 9] = 0x09;
    sk[10] = 0x0a;
    sk[11] = 0x0b;
*/


/*    // randombytes_init(entropy_input, NULL, 256);
    randombytes(seed, 48);

    randombytes(msg, mlen);
    crypto_sign_keypair(pk, sk);
    randombytes(optrand, SPX_N);
*/

/*
  //config the interrupt controller
  ck_intc_init();
  Timer_Interrupt_Init();

  //--------------------------------------------------------
  // setup uart
  //--------------------------------------------------------
  t_ck_uart_cfig   uart_cfig;

  uart_cfig.baudrate = BAUD;       // any integer value is allowed
  uart_cfig.parity = PARITY_NONE;     // PARITY_NONE / PARITY_ODD / PARITY_EVEN
  uart_cfig.stopbit = STOPBIT_1;      // STOPBIT_1 / STOPBIT_2
  uart_cfig.wordsize = WORDSIZE_8;    // from WORDSIZE_5 to WORDSIZE_8
  uart_cfig.txmode = ENABLE;          // ENABLE or DISABLE

  // open UART device with id = 0 (UART0)
  ck_uart_open(&uart0, 0);

  // initialize uart using uart_cfig structure
  ck_uart_init(&uart0, &uart_cfig);
*/
   
  //-------------------------------------------------------
  //  sphincs mode setting 
  //-------------------------------------------------------

    *(SPX_MODE)     =   1;
    *(WORK_MODE)    =   2;


  //-------------------------------------------------------
  //  Reg Data Writing 
  //-------------------------------------------------------

    for (int i =0; i < SPX_N / 4 ; i++){
    //    printf("i = %d \n", i);
        *(SK_SEED + i)    =    (((unsigned int)sk[i*4+0]) |
                                ((unsigned int)sk[i*4+1] << 8 ) |
                                ((unsigned int)sk[i*4+2] << 16) |
                                ((unsigned int)sk[i*4+3] << 24));
    }


    for (int i =0; i < SPX_N / 4 ; i++){
        *(PK_SEED + i)    =    (((unsigned int)pk[i*4+0]) |
                                ((unsigned int)pk[i*4+1] << 8 ) |
                                ((unsigned int)pk[i*4+2] << 16) |
                                ((unsigned int)pk[i*4+3] << 24));
    }

    // int_en
    *(INT_CLR) = 1;
    *(INT_EN) = 1;
    *(SHA3_MODE) = 0;

    // spx_en Gen PK
    *(SPX_EN)   =   1;
	spx_int = 0;

wait_for_sxp_int();
	
//	mdelay(100);

//    printf("rtl pk root ");
//    printf("\n");
    for (int i=0; i<SPX_N; i=i+4){
        unsigned int val = *(PK_ROOT + i/4);
//        printf("%x", val);
        pk[SPX_N + i]   = val;
        pk[SPX_N + i+1] = val >> 8 ;
        pk[SPX_N + i+2] = val >> 16;
        pk[SPX_N + i+3] = val >> 24;
    }
//    printf("\n");

    // --------------------------- Generate R --------------------------- //
    // clear sram to 0 from addr 2
    for (int i =0; i <36; i++){
       *(SRAM + SPX_N/4 + i) = 0x00000000; 
    }

    // wirte sk_prf to sram
    for (int i =0; i < SPX_N / 4 ; i++){
        *(SRAM + i)    =   (((unsigned int)sk[SPX_N + i*4]) |
                            ((unsigned int)sk[SPX_N + i*4+1] << 8 ) |
                            ((unsigned int)sk[SPX_N + i*4+2] << 16) |
                            ((unsigned int)sk[SPX_N + i*4+3] << 24));
    }

    // write optrand to sram
    for (int i =0; i < SPX_N / 4 ; i++){
        *(SRAM + SPX_N/4 + i)    = (((unsigned int)optrand[i*4]) |
                                  ((unsigned int)optrand[i*4+1] << 8 ) |
                                  ((unsigned int)optrand[i*4+2] << 16) |
                                  ((unsigned int)optrand[i*4+3] << 24));
    }
    // send msg to sram
    for (int i = 0; i < mlen / 4; i++){
        *(SRAM + (SPX_N*2)/4 + i)   =  (((unsigned int)msg[i*4]) |
                                    ((unsigned int)msg[i*4+1] << 8 ) |
                                    ((unsigned int)msg[i*4+2] << 16) |
                                    ((unsigned int)msg[i*4+3] << 24));
    } 
    *(SRAM + (SPX_N*2)/4  + mlen/4)  =   0x0000001f; // padding
    int padd_80 = ((mlen + 3*SPX_N) / 136 + 1) * 136 - 4; 
    *(SRAM + padd_80/4) = 0x80000000;

    *(WORK_MODE) = 0x03; // work mode : sign
    *(SHA3_MODE) = 0x0c; // shake256 as
    *(INT_CLR) = 0x01; //int clear

//    printf("waiting generate R\n");
    *(SPX_EN) = 0x01; // spx_en;

//    while((*(SPX_INT) & 0x01) == 0)
//		;
wait_for_sxp_int();


    
    *(LAST_BLK_LEN) = SPX_N / 8 ; // last out words num
    *(WRITE_START) = 0x03; // write start and last write
//    while((*(SPX_INT) & 0x01) == 0);
wait_for_sxp_int();

	
	// R in sram: 	75324fdf  1bf893e9  64860970  1b8be7e5


    for (int i = 0; i < SPX_N; i = i + 4){
        unsigned int val = (*(SRAM + i/4));
        R[i]   = val;
        R[i+1] = val >> 8 ;
        R[i+2] = val >> 16;
        R[i+3] = val >> 24;
    }

//    printf("rtl R ");
//    printf("\n");
//    for (int i=0; i< SPX_N; i++){
//        printf("%x", R[i]);
//    }
//    printf("\n");

    // --------------------------- Generate md --------------------------- //

    // clear sram to 0 from addr 2
    for (int i =0; i <36; i++){
       *(SRAM + SPX_N/4 + i) = 0x00000000; 
    }

    // wirte pk_seed to sram
    for (int i =0; i < SPX_N / 4 ; i++){
        *(SRAM + SPX_N/4 + i)    =   (((unsigned int)pk[i*4]) |
                            ((unsigned int)pk[i*4+1] << 8 ) |
                            ((unsigned int)pk[i*4+2] << 16) |
                            ((unsigned int)pk[i*4+3] << 24));
    }

    // write pk_root to sram
    for (int i =0; i < SPX_N / 4 ; i++){
        *(SRAM + (SPX_N*2)/4 + i)  = (((unsigned int)pk[SPX_N + i*4]) |
                                  ((unsigned int)pk[SPX_N + i*4+1] << 8 ) |
                                  ((unsigned int)pk[SPX_N + i*4+2] << 16) |
                                  ((unsigned int)pk[SPX_N + i*4+3] << 24));
    }


    // send msg to sram
    for (int i = 0; i < mlen / 4; i++){
        *(SRAM + (SPX_N*3)/4 + i)   =  (((unsigned int)msg[i*4]) |
                                    ((unsigned int)msg[i*4+1] << 8 ) |
                                    ((unsigned int)msg[i*4+2] << 16) |
                                    ((unsigned int)msg[i*4+3] << 24));
    } 
    *(SRAM + (SPX_N*3)/4  + mlen/4)  =   0x0000001f; // padding
    *(SRAM + padd_80/4) = 0x80000000;

    *(WORK_MODE) = 0x03; // sha3 mode
    *(SHA3_MODE) = 0x0c; // shake256 as
    *(INT_CLR) = 0x01;

//    printf("waiting generate md\n");
    *(SPX_EN) = 0x01;
    
wait_for_sxp_int();


    

    //--------------------------------------------------------
    // sign 
    //--------------------------------------------------------
    *(SHA3_MODE) = 0x00;
    *(WORK_MODE)    =   0;
    *(INT_CLR)       =   1;
    *(INT_CLR)       =   0;
//    printf("waiting sig \n");
    *(SPX_EN)       =   1;
   
    // crypto_sign(sm, &smlen, msg, mlen, sk, optrand); 
     
wait_for_sxp_int();


    for (int i = 0; i < smlen - mlen; i = i + 4){
        unsigned int val = (*(SRAM + i/4));
//        rtl_sm[i]   = val;
//        rtl_sm[i+1] = val >> 8 ;
//        rtl_sm[i+2] = val >> 16;
//        rtl_sm[i+3] = val >> 24;
    }

//    printf("rtl sm part ");
//    for (int i=0; i<=31; i++)
//    {printf("%02x", rtl_sm[i]);}
//    printf("\n");


//    printf("siging completed \n");
 
  //--------------------------------------------------------
  // start main memory copy
  //--------------------------------------------------------
  // memory copy
static int array_old[1024];
static int array_new[1024];
//  unsigned int* array_old = 0x60000000;
//  unsigned int* array_new = 0x60000500;
//  word_memset(array_old,0xffffffff,0x400); 
//  word_memcpy(array_new,array_old,0x400);
  //memset(array_old,0xffffffff,0x400); 
  memset(array_old,8,0x400); 
  start_timer();

#ifdef VCUNT_SIM
  int start_sec;
  int end_sec;
  start_sec = get_vtimer();
#endif 
  memcpy(array_new,array_old,0x400);
//  printf ("\n array_new[0]=%d\n",array_new[0]);
//  printf ("\n array_new[1]=%d\n",array_new[1]);
#ifdef VCUNT_SIM
  end_sec = get_vtimer();
  end_sec = end_sec - start_sec;
  printf ("\nVCUNT_SIM:Memory copy for 1024 bytes cost %d CPU cycles!\n",end_sec);
  printf ("\nVCUNT_SIM:Memory copy for 1024 bytes cost %d CPU cycles!\n",end_sec);
  sim_end();
#else
  current_time = get_timer();
  stop_timer();
  total_time = Loop_Num * TIMER_PERIOD + TIMER_PERIOD - current_time;
//  printf("\nMemory Copy for 1024 bytes has complete!\n");
//  printf("Which cost %d system timer cycles\n",total_time);
#endif
  while (ck_uart_status(&uart0))
	  ;
  return 0;
}

