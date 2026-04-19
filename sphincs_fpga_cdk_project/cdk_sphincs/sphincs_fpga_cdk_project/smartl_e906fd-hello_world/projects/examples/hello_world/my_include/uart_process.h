#ifndef __UART_PROCESS_H__
#define __UART_PROCESS_H__

#include "uart.h"
#include "datatype.h"
#include "drv_usart.h"

/* ================================================================== */
/*  Protocol Constants                                                  */
/* ================================================================== */
#define FRAME_HEADER        0xAAU

#define CMD_PING            0x01U
#define CMD_PONG            0x02U
#define CMD_WRITE_SRAM      0x11U
#define CMD_WRITE_SRAM_ACK  0x12U
#define CMD_READ_SRAM       0x21U
#define CMD_READ_SRAM_ACK   0x22U
#define CMD_ERROR           0xFFU

#define ERR_BAD_HEADER      0x01U
#define ERR_BAD_CRC         0x02U
#define ERR_UNKNOWN_CMD     0x03U
#define ERR_BAD_LEN         0x04U

#define MAX_DATA_LEN        1280U

/* ================================================================== */
/*  Frame Structure                                                     */
/* ================================================================== */
typedef struct {
    uint8_t  cmd;
    uint16_t data_len;
    uint8_t  data[MAX_DATA_LEN];
} Frame;

/* ================================================================== */
/*  Public API                                                          */
/* ================================================================== */

/*
 * @brief  Initialize UART device with default config (19200 8N1)
 */
void uart_process_init(void);

/*
 * @brief  Send a protocol frame
 * @param  cmd      : command byte
 * @param  data     : pointer to data payload (can be NULL if data_len == 0)
 * @param  data_len : length of data payload in bytes
 */
void uart_send_frame(usart_handle_t uart_device, uint8_t cmd, const uint8_t *data, uint16_t data_len);

/*
 * @brief  Receive and parse one protocol frame (blocking with timeout)
 * @param  f : pointer to Frame struct to fill
 * @retval  0        : success
 *         -1        : timeout waiting for header
 *          ERR_xxx  : protocol error (error frame already sent automatically)
 */
int uart_recv_frame(usart_handle_t uart_device, Frame *f);

/*
 * @brief  Dispatch a received frame to the appropriate handler
 *         and send the response automatically
 * @param  f : pointer to a successfully received Frame
 */
void uart_process_frame(usart_handle_t uart_device, const Frame *f);

#endif /* __UART_PROCESS_H__ */
