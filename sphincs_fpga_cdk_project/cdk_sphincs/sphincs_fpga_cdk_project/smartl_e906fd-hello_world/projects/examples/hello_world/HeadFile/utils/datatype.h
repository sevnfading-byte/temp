#ifndef __DATATYPE_H__
#define __DATATYPE_H__

typedef	unsigned char           uint8_t;
typedef unsigned short          uint16_t;
//typedef __uint32_t              uint32_t;
//typedef __uint64_t              uint64_t;
typedef unsigned int            uintptr_t;
typedef	signed char             int8_t;
typedef signed short            int16_t;
//typedef __int32_t               int32_t;
//typedef __int64_t               int64_t;
typedef unsigned int            size_t;
typedef volatile unsigned char  reg8_t;
typedef volatile unsigned short reg16_t;
typedef volatile unsigned int   reg32_t;

#ifndef SUCCESS
#define SUCCESS  0
#endif

#endif

