int get_vtimer()
{
  volatile unsigned int   LoadCount;
  asm ("csrr %[LoadCount], time\n"
      :[LoadCount]"=r"(LoadCount)
      :
      :
      );
  //LoadCount = *TIMER_ADDR;
  return LoadCount;
  //int *TIMER_ADDR;
  //TIMER_ADDR = 0xE0013000;
  //volatile unsigned int   LoadCount;
  //LoadCount = *TIMER_ADDR;
  //return LoadCount;
}

void sim_end()
{
//  int *END_ADDR;
  volatile int *END_ADDR = (volatile int *)0x6000FFF8;
//  END_ADDR = 0x6000FFF8;
  unsigned int END_DATA;
  END_DATA= 0xffff0000;
  *END_ADDR = END_DATA;
}
