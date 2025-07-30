ARMGNU ?= arm-none-eabi
CFLAGS = -Wall -O2 -nostdlib -nostartfiles -ffreestanding -mcpu=arm1176jzf-s
OBJECTS = boot.o main.o

all: smvrt.img

%.o: %.S
	$(ARMGNU)-as $< -o $@

%.o: %.c
	$(ARMGNU)-gcc $(CFLAGS) -c $< -o $@

smvrt.elf: linker.ld $(OBJECTS)
	$(ARMGNU)-ld -T linker.ld $(OBJECTS) -o $@

smvrt.img: smvrt.elf
	$(ARMGNU)-objcopy $< -O binary $@

clean:
	rm -f *.o *.elf *.img

