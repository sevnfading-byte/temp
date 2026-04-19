##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=smartl_e906fd-hello_world
ConfigurationName      :=BuildSet
WorkspacePath          :=../../../../../
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=user
Date                   :=16/04/2026
CDKPath                :=D:/C-Sky/CDK
ToolchainPath          :=D:/C-Sky/CDKRepo/Toolchain/XTGccElfNewlib/V2.4.0/R/
LinkerName             :=riscv64-unknown-elf-gcc
LinkerNameoption       :=
SIZE                   :=riscv64-unknown-elf-size
READELF                :=riscv64-unknown-elf-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=smartl_e906fd-hello_world.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mabi=ilp32 -mtune=e906 -march=rv32imacxtheade  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/../../../../board/smartl_e906_evb/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,--no-relax
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch). $(IncludeSwitch)../../../../board/smartl_e906_evb/include $(IncludeSwitch)../../../../csi_core/include $(IncludeSwitch)../../../../csi_driver/include $(IncludeSwitch)../../../../csi_driver/smartl_rv32/include $(IncludeSwitch)../../../../csi_kernel/include $(IncludeSwitch)../../../../libs/include $(IncludeSwitch)../configs $(IncludeSwitch)../HeadFile/utils $(IncludeSwitch)../HeadFile/Analysis $(IncludeSwitch)../HeadFile/utils  
IncludeAPath           := $(IncludeSwitch). $(IncludeSwitch)../configs $(IncludeSwitch)../HeadFile/utils $(IncludeSwitch)../my_include/  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)m  
ArLibs                 := "m" 
PackagesLibPath        :=
LibPath                := $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=riscv64-unknown-elf-ar rcu
CXX      :=riscv64-unknown-elf-g++
CC       :=riscv64-unknown-elf-gcc
AS       :=riscv64-unknown-elf-gcc
OBJDUMP  :=riscv64-unknown-elf-objdump
OBJCOPY  :=riscv64-unknown-elf-objcopy
CXXFLAGS := -mabi=ilp32 -mtune=e906 -march=rv32imacxtheade    -O0  -g3  -Wall -ffunction-sections -fdata-sections 
CFLAGS   := -mabi=ilp32 -mtune=e906 -march=rv32imacxtheade    -O0  -g3  -Wall -ffunction-sections -fdata-sections 
ASFLAGS  := -mabi=ilp32 -mtune=e906 -march=rv32imacxtheade    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/smartl_e906_evb_board_init$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_ck_irq$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_ck_usart$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_devices$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_dw_gpio$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_dw_timer$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_isr$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_lib$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_novic_irq_tbl$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_pinmux$(ObjectSuffix) \
	$(IntermediateDirectory)/smartl_rv32_startup$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_sys_freq$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_system$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_trap_c$(ObjectSuffix) $(IntermediateDirectory)/smartl_rv32_vectors$(ObjectSuffix) $(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IntermediateDirectory)/libc_printf$(ObjectSuffix) \
	$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) \
	$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) $(IntermediateDirectory)/hello_world_main$(ObjectSuffix) $(IntermediateDirectory)/Analysis_AnalysisSPX$(ObjectSuffix) $(IntermediateDirectory)/utils_intc$(ObjectSuffix) $(IntermediateDirectory)/utils_uart$(ObjectSuffix) $(IntermediateDirectory)/utils_uart_process$(ObjectSuffix) $(IntermediateDirectory)/utils_vtimer$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/smartl_e906_evb_board_init$(ObjectSuffix): ../../../../board/smartl_e906_evb/board_init.c  
	$(CC) $(SourceSwitch) ../../../../board/smartl_e906_evb/board_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_e906_evb_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_e906_evb_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_e906_evb_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_e906_evb_board_init$(PreprocessSuffix): ../../../../board/smartl_e906_evb/board_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_e906_evb_board_init$(PreprocessSuffix) ../../../../board/smartl_e906_evb/board_init.c

$(IntermediateDirectory)/smartl_rv32_ck_irq$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/ck_irq.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/ck_irq.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_ck_irq$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_ck_irq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_ck_irq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_ck_irq$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/ck_irq.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_ck_irq$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/ck_irq.c

$(IntermediateDirectory)/smartl_rv32_ck_usart$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/ck_usart.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/ck_usart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_ck_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_ck_usart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_ck_usart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_ck_usart$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/ck_usart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_ck_usart$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/ck_usart.c

$(IntermediateDirectory)/smartl_rv32_devices$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/devices.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/devices.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_devices$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_devices$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_devices$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_devices$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/devices.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_devices$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/devices.c

$(IntermediateDirectory)/smartl_rv32_dw_gpio$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/dw_gpio.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/dw_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_dw_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_dw_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_dw_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_dw_gpio$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/dw_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_dw_gpio$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/dw_gpio.c

$(IntermediateDirectory)/smartl_rv32_dw_timer$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/dw_timer.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/dw_timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_dw_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_dw_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_dw_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_dw_timer$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/dw_timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_dw_timer$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/dw_timer.c

$(IntermediateDirectory)/smartl_rv32_isr$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/isr.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/isr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_isr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_isr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_isr$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/isr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_isr$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/isr.c

$(IntermediateDirectory)/smartl_rv32_lib$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/lib.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/lib.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_lib$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_lib$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_lib$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/lib.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_lib$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/lib.c

$(IntermediateDirectory)/smartl_rv32_novic_irq_tbl$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/novic_irq_tbl.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/novic_irq_tbl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_novic_irq_tbl$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_novic_irq_tbl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_novic_irq_tbl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_novic_irq_tbl$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/novic_irq_tbl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_novic_irq_tbl$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/novic_irq_tbl.c

$(IntermediateDirectory)/smartl_rv32_pinmux$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/pinmux.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/pinmux.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_pinmux$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_pinmux$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_pinmux$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_pinmux$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/pinmux.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_pinmux$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/pinmux.c

$(IntermediateDirectory)/smartl_rv32_startup$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/startup.S  
	$(AS) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/startup.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/smartl_rv32_startup$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/startup.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_startup$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/startup.S

$(IntermediateDirectory)/smartl_rv32_sys_freq$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/sys_freq.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/sys_freq.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_sys_freq$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_sys_freq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_sys_freq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_sys_freq$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/sys_freq.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_sys_freq$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/sys_freq.c

$(IntermediateDirectory)/smartl_rv32_system$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/system.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/system.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_system$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_system$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/system.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_system$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/system.c

$(IntermediateDirectory)/smartl_rv32_trap_c$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/trap_c.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/trap_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/smartl_rv32_trap_c$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/trap_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_trap_c$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/trap_c.c

$(IntermediateDirectory)/smartl_rv32_vectors$(ObjectSuffix): ../../../../csi_driver/smartl_rv32/vectors.S  
	$(AS) $(SourceSwitch) ../../../../csi_driver/smartl_rv32/vectors.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/smartl_rv32_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/smartl_rv32_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/smartl_rv32_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/smartl_rv32_vectors$(PreprocessSuffix): ../../../../csi_driver/smartl_rv32/vectors.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/smartl_rv32_vectors$(PreprocessSuffix) ../../../../csi_driver/smartl_rv32/vectors.S

$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix): ../../../../libs/libc/clock_gettime.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/clock_gettime.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_clock_gettime$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_clock_gettime$(PreprocessSuffix): ../../../../libs/libc/clock_gettime.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_clock_gettime$(PreprocessSuffix) ../../../../libs/libc/clock_gettime.c

$(IntermediateDirectory)/libc__init$(ObjectSuffix): ../../../../libs/libc/_init.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc__init$(ObjectSuffix) -MF$(IntermediateDirectory)/libc__init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc__init$(PreprocessSuffix): ../../../../libs/libc/_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc__init$(PreprocessSuffix) ../../../../libs/libc/_init.c

$(IntermediateDirectory)/libc_malloc$(ObjectSuffix): ../../../../libs/libc/malloc.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/malloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_malloc$(PreprocessSuffix): ../../../../libs/libc/malloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_malloc$(PreprocessSuffix) ../../../../libs/libc/malloc.c

$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix): ../../../../libs/libc/minilibc_port.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/minilibc_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_minilibc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_minilibc_port$(PreprocessSuffix): ../../../../libs/libc/minilibc_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_minilibc_port$(PreprocessSuffix) ../../../../libs/libc/minilibc_port.c

$(IntermediateDirectory)/libc_printf$(ObjectSuffix): ../../../../libs/libc/printf.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/printf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_printf$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_printf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_printf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_printf$(PreprocessSuffix): ../../../../libs/libc/printf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_printf$(PreprocessSuffix) ../../../../libs/libc/printf.c

$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix): ../../../../libs/mm/dq_addlast.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/dq_addlast.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_addlast$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_addlast$(PreprocessSuffix): ../../../../libs/mm/dq_addlast.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_addlast$(PreprocessSuffix) ../../../../libs/mm/dq_addlast.c

$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix): ../../../../libs/mm/dq_rem.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/dq_rem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_rem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_rem$(PreprocessSuffix): ../../../../libs/mm/dq_rem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_rem$(PreprocessSuffix) ../../../../libs/mm/dq_rem.c

$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix): ../../../../libs/mm/lib_mallinfo.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/lib_mallinfo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_lib_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_lib_mallinfo$(PreprocessSuffix): ../../../../libs/mm/lib_mallinfo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_lib_mallinfo$(PreprocessSuffix) ../../../../libs/mm/lib_mallinfo.c

$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix): ../../../../libs/mm/mm_addfreechunk.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_addfreechunk.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_addfreechunk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_addfreechunk$(PreprocessSuffix): ../../../../libs/mm/mm_addfreechunk.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_addfreechunk$(PreprocessSuffix) ../../../../libs/mm/mm_addfreechunk.c

$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix): ../../../../libs/mm/mm_free.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_free.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_free$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_free$(PreprocessSuffix): ../../../../libs/mm/mm_free.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_free$(PreprocessSuffix) ../../../../libs/mm/mm_free.c

$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix): ../../../../libs/mm/mm_initialize.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_initialize.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_initialize$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_initialize$(PreprocessSuffix): ../../../../libs/mm/mm_initialize.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_initialize$(PreprocessSuffix) ../../../../libs/mm/mm_initialize.c

$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix): ../../../../libs/mm/mm_leak.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_leak.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_leak$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_leak$(PreprocessSuffix): ../../../../libs/mm/mm_leak.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_leak$(PreprocessSuffix) ../../../../libs/mm/mm_leak.c

$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix): ../../../../libs/mm/mm_mallinfo.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_mallinfo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_mallinfo$(PreprocessSuffix): ../../../../libs/mm/mm_mallinfo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_mallinfo$(PreprocessSuffix) ../../../../libs/mm/mm_mallinfo.c

$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix): ../../../../libs/mm/mm_malloc.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_malloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_malloc$(PreprocessSuffix): ../../../../libs/mm/mm_malloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_malloc$(PreprocessSuffix) ../../../../libs/mm/mm_malloc.c

$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix): ../../../../libs/mm/mm_size2ndx.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_size2ndx.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_size2ndx$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_size2ndx$(PreprocessSuffix): ../../../../libs/mm/mm_size2ndx.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_size2ndx$(PreprocessSuffix) ../../../../libs/mm/mm_size2ndx.c

$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix): ../../../../libs/ringbuffer/ringbuffer.c  
	$(CC) $(SourceSwitch) ../../../../libs/ringbuffer/ringbuffer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) -MF$(IntermediateDirectory)/ringbuffer_ringbuffer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ringbuffer_ringbuffer$(PreprocessSuffix): ../../../../libs/ringbuffer/ringbuffer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ringbuffer_ringbuffer$(PreprocessSuffix) ../../../../libs/ringbuffer/ringbuffer.c

$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix): ../../../../libs/syslog/syslog.c  
	$(CC) $(SourceSwitch) ../../../../libs/syslog/syslog.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) -MF$(IntermediateDirectory)/syslog_syslog$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/syslog_syslog$(PreprocessSuffix): ../../../../libs/syslog/syslog.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/syslog_syslog$(PreprocessSuffix) ../../../../libs/syslog/syslog.c

$(IntermediateDirectory)/hello_world_main$(ObjectSuffix): ../main.c  
	$(CC) $(SourceSwitch) ../main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hello_world_main$(ObjectSuffix) -MF$(IntermediateDirectory)/hello_world_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hello_world_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hello_world_main$(PreprocessSuffix): ../main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hello_world_main$(PreprocessSuffix) ../main.c

$(IntermediateDirectory)/Analysis_AnalysisSPX$(ObjectSuffix): ../Analysis/AnalysisSPX.c  
	$(CC) $(SourceSwitch) ../Analysis/AnalysisSPX.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/Analysis_AnalysisSPX$(ObjectSuffix) -MF$(IntermediateDirectory)/Analysis_AnalysisSPX$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/Analysis_AnalysisSPX$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/Analysis_AnalysisSPX$(PreprocessSuffix): ../Analysis/AnalysisSPX.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/Analysis_AnalysisSPX$(PreprocessSuffix) ../Analysis/AnalysisSPX.c

$(IntermediateDirectory)/utils_intc$(ObjectSuffix): ../utils/intc.c  
	$(CC) $(SourceSwitch) ../utils/intc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/utils_intc$(ObjectSuffix) -MF$(IntermediateDirectory)/utils_intc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/utils_intc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/utils_intc$(PreprocessSuffix): ../utils/intc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/utils_intc$(PreprocessSuffix) ../utils/intc.c

$(IntermediateDirectory)/utils_uart$(ObjectSuffix): ../utils/uart.c  
	$(CC) $(SourceSwitch) ../utils/uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/utils_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/utils_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/utils_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/utils_uart$(PreprocessSuffix): ../utils/uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/utils_uart$(PreprocessSuffix) ../utils/uart.c

$(IntermediateDirectory)/utils_uart_process$(ObjectSuffix): ../utils/uart_process.c  
	$(CC) $(SourceSwitch) ../utils/uart_process.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/utils_uart_process$(ObjectSuffix) -MF$(IntermediateDirectory)/utils_uart_process$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/utils_uart_process$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/utils_uart_process$(PreprocessSuffix): ../utils/uart_process.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/utils_uart_process$(PreprocessSuffix) ../utils/uart_process.c

$(IntermediateDirectory)/utils_vtimer$(ObjectSuffix): ../utils/vtimer.c  
	$(CC) $(SourceSwitch) ../utils/vtimer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/utils_vtimer$(ObjectSuffix) -MF$(IntermediateDirectory)/utils_vtimer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/utils_vtimer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/utils_vtimer$(PreprocessSuffix): ../utils/vtimer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/utils_vtimer$(PreprocessSuffix) ../utils/vtimer.c


-include $(IntermediateDirectory)/*$(DependSuffix)
