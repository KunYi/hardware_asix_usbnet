CURRENT	= $(shell uname -r)
TARGET	= ax88179_178a
OBJS	= ax88179_178a.o

EXTRA_CFLAGS = -DEXPORT_SYMTAB
PWD = $(shell pwd)

obj-m      := $(TARGET).o

default:
	$(MAKE) -C $(KERNEL_DIR) M=`pwd` ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules

$(TARGET).o: $(OBJS)
	$(LD) $(LD_RFLAG) -r -o $@ $(OBJS)

clean:
	$(MAKE) -C $(KERNEL_DIR) M=`pwd` clean

.PHONY: modules clean

-include $(KERNEL_DIR)/Rules.make
