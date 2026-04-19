#include "uart_process.h"
#include "drv_usart.h"
#include <stdbool.h>

/* ================================================================== */
/*  Global UART device handle                                           */
/* ================================================================== */

static t_ck_uart_device g_uart;

static uint8_t  g_recv_b;
static uint16_t g_recv_data_len;
static uint8_t  g_recv_crc_buf[3U + MAX_DATA_LEN];
static uint16_t g_recv_crc_calc;
static uint16_t g_recv_crc_recv;
static uint16_t g_recv_i;


/* ================================================================== */
/*  CRC-16/MODBUS                                                       */
/*  Poly 0x8005, Init 0xFFFF, RefIn true, RefOut true, XorOut 0        */
/* ================================================================== */
static uint16_t crc16_modbus(const uint8_t *buf, const uint8_t *data, uint32_t len)
{
    uint16_t crc = 0xFFFFU;
    uint32_t i, j;

	for (i = 0; i < 3; i++) {
        crc ^= (uint16_t)buf[i];
    }
	
    for (i = 0; i < len; i++) {
        crc ^= (uint16_t)data[i];
    }
    return crc;
}



/* ================================================================== */
/*  uart_send_frame()                                                   */
/* ================================================================== */
void uart_send_frame(p_ck_uart_device uart_device, uint8_t cmd, const uint8_t *data, uint16_t data_len)
{
    uint8_t  crc_buf[3U];
    uint16_t crc;
    uint16_t i;
    int ret;

    /* Build CRC input: [cmd][len_h][len_l][data...] */
    crc_buf[0] = cmd;
    crc_buf[1] = (uint8_t)(data_len >> 8);
    crc_buf[2] = (uint8_t)(data_len & 0xFFU);
//    for (i = 0; i < data_len && i < MAX_DATA_LEN; i++)
//        crc_buf[3U + i] = data[i];

    crc = crc16_modbus(crc_buf, data, data_len);

    /* Transmit frame byte by byte */
    ret = csi_usart_putchar(uart_device, FRAME_HEADER);
    ret = csi_usart_putchar(uart_device, cmd);
    ret = csi_usart_putchar(uart_device, (uint8_t)(data_len >> 8));
    ret = csi_usart_putchar(uart_device, (uint8_t)(data_len & 0xFFU));
    for (i = 0; i < data_len; i++)
        ret = csi_usart_putchar(uart_device, data[i]);
    ret = csi_usart_putchar(uart_device, (uint8_t)(crc >> 8));
    ret = csi_usart_putchar(uart_device, (uint8_t)(crc & 0xFFU));
}


int uart_recv_frame(p_ck_uart_device uart_device, Frame *f)
{
    /* 所有变量已提升为文件作用域，此处不再声明 */

    /* 1. Wait for frame header */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
		return -1;
	}
        
    if (g_recv_b != FRAME_HEADER) {
        uint8_t ec = ERR_BAD_HEADER;
        uart_send_frame(uart_device, CMD_ERROR, &ec, 1U);
        return (int)ERR_BAD_HEADER;
    }

    /* 2. CMD */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
		return -1;
	}
    f->cmd = g_recv_b;

    /* 3. LEN high byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
		return -1;
	}
    g_recv_data_len = (uint16_t)((uint16_t)g_recv_b << 8);

    /* 4. LEN low byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
		return -1;
	}
    g_recv_data_len |= (uint16_t)g_recv_b;

    if (g_recv_data_len > MAX_DATA_LEN) {
        uint8_t ec = ERR_BAD_LEN;
        uart_send_frame(uart_device,CMD_ERROR, &ec, 1U);
        return (int)ERR_BAD_LEN;
    }
    f->data_len = g_recv_data_len;

    /* 5. DATA */
    for (g_recv_i = 0; g_recv_i < g_recv_data_len; g_recv_i++) {
        if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
			return -1;
		}
        f->data[g_recv_i] = g_recv_b;
    }

    /* 6. CRC high byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
		return -1;
	}
    g_recv_crc_recv = (uint16_t)((uint16_t)g_recv_b << 8);

    /* 7. CRC low byte */
    if (csi_usart_getchar(uart_device, &g_recv_b) != 0){
		return -1;
	}
    g_recv_crc_recv |= (uint16_t)g_recv_b;

    /* 8. Verify CRC */
    g_recv_crc_buf[0] = f->cmd;
    g_recv_crc_buf[1] = (uint8_t)(g_recv_data_len >> 8);
    g_recv_crc_buf[2] = (uint8_t)(g_recv_data_len & 0xFFU);
//    for (g_recv_i = 0; g_recv_i < g_recv_data_len; g_recv_i++)
//        g_recv_crc_buf[3U + g_recv_i] = f->data[g_recv_i];

    g_recv_crc_calc = crc16_modbus(g_recv_crc_buf, f->data, g_recv_data_len);

    if (g_recv_crc_calc != g_recv_crc_recv) {
        uint8_t ec = ERR_BAD_CRC;
        uart_send_frame(uart_device, CMD_ERROR, &ec, 1U);
        return (int)ERR_BAD_CRC;
    }

    return 0;
}


/* ================================================================== */
/*  Command Handlers (file-scope)                                       */
/* ================================================================== */
static void handle_ping(p_ck_uart_device uart_device)
{
    uint8_t pong[4] = {'P', 'O', 'N', 'G'};
    uart_send_frame(uart_device, CMD_PONG, pong, 4U);
}

//static void handle_write_sram(const Frame *f)
//{
//    uint32_t         addr;
//    uint16_t         payload_len;
//    volatile uint8_t *ptr;
//    uint8_t          ack[2];
//    uint16_t         i;
//
//    if (f->data_len < 4U) {
//        uint8_t ec = ERR_BAD_LEN;
//        uart_send_frame(CMD_ERROR, &ec, 1U);
//        return;
//    }
//
//    addr = ((uint32_t)f->data[0] << 24)
//         | ((uint32_t)f->data[1] << 16)
//         | ((uint32_t)f->data[2] <<  8)
//         | ((uint32_t)f->data[3]);
//
//    payload_len = f->data_len - 4U;
//    ptr = (volatile uint8_t *)addr;
//    for (i = 0; i < payload_len; i++)
//        ptr[i] = f->data[4U + i];
//
//    ack[0] = 0x00U;                     /* status: OK */
//    ack[1] = (uint8_t)payload_len;      /* bytes written */
//    uart_send_frame(CMD_WRITE_SRAM_ACK, ack, 2U);
//}
//
//static void handle_read_sram(const Frame *f)
//{
//    uint32_t         addr;
//    uint16_t         rlen;
//    volatile uint8_t *ptr;
//    uint8_t          resp[MAX_DATA_LEN];
//    uint16_t         i;
//
//    if (f->data_len != 6U) {
//        uint8_t ec = ERR_BAD_LEN;
//        uart_send_frame(CMD_ERROR, &ec, 1U);
//        return;
//    }
//
//    addr = ((uint32_t)f->data[0] << 24)
//         | ((uint32_t)f->data[1] << 16)
//         | ((uint32_t)f->data[2] <<  8)
//         | ((uint32_t)f->data[3]);
//
//    rlen = ((uint16_t)f->data[4] << 8)
//         | ((uint16_t)f->data[5]);
//
//    if (rlen == 0U || rlen > MAX_DATA_LEN) {
//        uint8_t ec = ERR_BAD_LEN;
//        uart_send_frame(CMD_ERROR, &ec, 1U);
//        return;
//    }
//
//    ptr = (volatile uint8_t *)addr;
//    for (i = 0; i < rlen; i++)
//        resp[i] = ptr[i];
//
//    uart_send_frame(CMD_READ_SRAM_ACK, resp, rlen);
//}

/* ================================================================== */
/*  uart_process_frame()                                                */
/* ================================================================== */
void uart_process_frame(p_ck_uart_device uart_device, const Frame *f)
{
	unsigned char *Data = f->data;
    switch (f->cmd) {
        case CMD_PING:
            handle_ping(uart_device);
            break;

        case CMD_WRITE_SRAM:
//            handle_write_sram(f);
            break;

        case CMD_READ_SRAM:
//            handle_read_sram(f);
            break;
		case 0xC1:{
			//sphincs+simple-128-fast sign
			int spx_n = 16;
			bool simple = true;
			bool fast = true;
			int mlen, smlen;
			unsigned int pk_root[4]; //128bits
			unsigned char SendBackData[16]; //send back pk.root
            
			
			mlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
			Data+=4;
			smlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
			Data+=4;
			
			spx_gen_pk(simple, spx_n, fast, Data, Data+spx_n*2, pk_root); 
			
			for (int i=0; i<4; i++){
				SendBackData[3+i*4] = (pk_root[i] >> 24 ) & 0xFF;
				SendBackData[2+i*4] = (pk_root[i] >> 16 ) & 0xFF;
				SendBackData[1+i*4] = (pk_root[i] >> 8 ) & 0xFF;
				SendBackData[0+i*4] =  pk_root[i] & 0xFF;
				
			}
			uart_send_frame(uart_device, 0xC2, SendBackData, 16);
//			UART_Transmit(SendBackData, 16);
			
			
			// 执行完上面一步之后pk root寄存器里面已经有正确的pk root，无需再写入
			spx_sign(simple, spx_n, fast, mlen, smlen, Data, Data+spx_n*2, Data+spx_n*3, Data+spx_n*4);
			// mlen, smlen sk, pk, opt, msg
			
			read_sram(uart_device, smlen);
			
			break;
		}
		case 0xC4:{
			//sphincs+simple-128-fast verify gen md
			int spx_n= 16;
			bool simple = true;
			bool fast = true;
			int mlen;
			mlen = Data[3] | (Data[2] << 8) | (Data[1] << 16) | (Data[0] << 24);
			Data+=4;
			spx_verify_gen_md(simple, spx_n, fast, mlen, Data, 
				Data+spx_n*2, Data+spx_n*3);
				
			handle_ping(uart_device); // recive ok
			break;
		}
		case 0xC5:{
			//sphincs+simple-128-fast verify write_sram
			uint16_t addr, data_len;
			
			addr = (Data[1] | (Data[0] << 8));
			Data+=2;
			data_len = (Data[1] | (Data[0] << 8));
			Data+=2;
			
			write_sram(addr, data_len, Data); // 不用写入R值
			handle_ping(uart_device); // recive ok
			break;
			
		}
		case 0xC6:{
			//sphincs+simple-128-fast verify
			unsigned char ret;
			int spx_n= 16;
			bool simple = true;
			bool fast = true;
			uint8_t cmd = 0xC7;
			ret = spx_verify(simple, spx_n, fast);
			uart_send_frame(uart_device, cmd, &ret, 1U);
			break;
		}

        default: {
            uint8_t ec = ERR_UNKNOWN_CMD;
            uart_send_frame(uart_device, CMD_ERROR, &ec, 1U);
            break;
        }
    }
}
