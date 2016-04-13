ARCH=ARM
OTHERSLIBPWD=/home/usrc

ifeq ($(ARCH),ARM)
#CROSS=arm-linux-
CROSS=arm-linux-gnueabihf-
endif

SRC:=$(shell ls *.c)
SRC+=$(shell ls *.cpp)

CFLAGS:=-g -I. -Wall -O2   
LDFLAG:=-static

ifeq ($(ARCH),ARM)
IPATH:=-I$(OTHERSLIBPWD)/sqlite-3.7.3/output/arm/include
else
IPATH:=-I$(OTHERSLIBPWD)/sqlite-3.7.3/output/ubuntu/include
endif

ifeq ($(ARCH),ARM)
LPATH:=-L$(OTHERSLIBPWD)/sqlite-3.7.3/output/arm/lib
else
LPATH:=-L$(OTHERSLIBPWD)/sqlite-3.7.3/output/ubuntu/lib
endif

ifeq ($(ARCH),ARM)
LIBS+=-lpthread
else
LIBS+=-lpthread
endif

ifeq ($(ARCH),ARM)
TARGET:=eeprog
else
TARGET:=eeprog
endif

$(TARGET) : $(SRC)
	$(CROSS)g++ $(CFLAGS) -o $(TARGET) $^ $(LPATH) $(IPATH) $(LIBS) $(LDFLAG)
	#push modbus.bin /system/bin

clean:
	rm -f  *.bin  *.dis  *.elf  *.o
