#ifndef SPX_HARD_REG_H
#define SPX_HARD_REG_H

/* 基地址定义 */
#define SPX_BASE_ADDR           0x400a0000u
#define SPX_INT_BASE_ADDR       0x400a0100u
#define SPX_SRAM_BASE_ADDR      0x400ad000u

/* ========== 寄存器偏移量 ========== */
#define SPX_MODE_OFFSET         0x0000
#define WORK_MODE_OFFSET        0x0004
#define SPX_EN_OFFSET           0x0008
#define R_HASH_CNT_OFFSET       0x000c
#define IDX_HASH_CNT_OFFSET     0x0010
#define SK_SEED_OFFSET          0x0014
#define SK_PRF_OFFSET           0x0034
#define PK_SEED_OFFSET          0x0054
#define PK_ROOT_OFFSET          0x0074
#define OPTRAND_OFFSET          0x0094
#define INADDR_OFFSET           0x00b4
#define OUTADDR_OFFSET          0x00b8
#define BLOCK_NUM_OFFSET        0x00bc
#define SHA3_MODE_OFFSET        0x00c0
#define OUTTIME_OFFSET          0x00c4
#define LAST_BLK_LEN_OFFSET     0x00c8
#define READ_START_OFFSET       0x00cc
#define WRITE_START_OFFSET      0x00d0

/* 中断相关寄存器 (基地址 0x400a0100) */
#define INT_ST_OFFSET           0x0000
#define SPX_INT_OFFSET          0x0000   /* 与 INT_ST 共用地址 */
#define INT_EN_OFFSET           0x0004
#define INT_CLR_OFFSET          0x0008

/* SRAM (基地址 0x400ad000) */
#define SRAM_OFFSET             0x0000   /* 该地址可直接作为 SRAM 数组基址 */

/* ========== 寄存器访问宏 ========== */
#define SPX_MODE        (volatile unsigned int *)(SPX_BASE_ADDR + SPX_MODE_OFFSET)
#define WORK_MODE       (volatile unsigned int *)(SPX_BASE_ADDR + WORK_MODE_OFFSET)
#define SPX_EN          (volatile unsigned int *)(SPX_BASE_ADDR + SPX_EN_OFFSET)
#define R_HASH_CNT      (volatile unsigned int *)(SPX_BASE_ADDR + R_HASH_CNT_OFFSET)
#define IDX_HASH_CNT    (volatile unsigned int *)(SPX_BASE_ADDR + IDX_HASH_CNT_OFFSET)
#define SK_SEED         (volatile unsigned int *)(SPX_BASE_ADDR + SK_SEED_OFFSET)
#define SK_PRF          (volatile unsigned int *)(SPX_BASE_ADDR + SK_PRF_OFFSET)
#define PK_SEED         (volatile unsigned int *)(SPX_BASE_ADDR + PK_SEED_OFFSET)
#define PK_ROOT         (volatile unsigned int *)(SPX_BASE_ADDR + PK_ROOT_OFFSET)
#define OPTRAND         (volatile unsigned int *)(SPX_BASE_ADDR + OPTRAND_OFFSET)
#define INADDR          (volatile unsigned int *)(SPX_BASE_ADDR + INADDR_OFFSET)
#define OUTADDR         (volatile unsigned int *)(SPX_BASE_ADDR + OUTADDR_OFFSET)
#define BLOCK_NUM       (volatile unsigned int *)(SPX_BASE_ADDR + BLOCK_NUM_OFFSET)
#define SHA3_MODE       (volatile unsigned int *)(SPX_BASE_ADDR + SHA3_MODE_OFFSET)
#define OUTTIME         (volatile unsigned int *)(SPX_BASE_ADDR + OUTTIME_OFFSET)
#define LAST_BLK_LEN    (volatile unsigned int *)(SPX_BASE_ADDR + LAST_BLK_LEN_OFFSET)
#define READ_START      (volatile unsigned int *)(SPX_BASE_ADDR + READ_START_OFFSET)
#define WRITE_START     (volatile unsigned int *)(SPX_BASE_ADDR + WRITE_START_OFFSET)

#define INT_ST          (volatile unsigned int *)(SPX_INT_BASE_ADDR + INT_ST_OFFSET)
#define SPX_INT         (volatile unsigned int *)(SPX_INT_BASE_ADDR + SPX_INT_OFFSET)
#define INT_EN          (volatile unsigned int *)(SPX_INT_BASE_ADDR + INT_EN_OFFSET)
#define INT_CLR         (volatile unsigned int *)(SPX_INT_BASE_ADDR + INT_CLR_OFFSET)

/* SRAM 作为数组访问，基址为 0x400ad000 */
#define SRAM            ((volatile unsigned int *)SPX_SRAM_BASE_ADDR)

#endif /* SPX_HARD_REG_H */