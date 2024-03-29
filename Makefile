# Makefile for bitmain_asic_spi_drv

TARGET = bitmain_lcd

OBJECT = lcd12864.o

ifneq ($(KERNELRELEASE),)

#kbuild syntax.

#obj-$(CONFIG_BITMAIN_ASIC_SPI) += $(TARGET).o
obj-m += $(TARGET).o

$(TARGET)-objs := $(OBJECT)

else

PWD := $(shell pwd)

#KERNEL_DIR := /lib/modules/`uname -r`/build

KERNEL_DIR := /home/xxl/AM335x/kernel/kernel

all : modules

modules:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH)  modules
	cp -rf $(TARGET).ko /tftpboot/
clean:

	rm -rf .*.cmd *.o *.mod.c *.ko .tmp_versions Module.markers modules.order Module.symvers

endif

