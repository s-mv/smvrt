TITLE = smvrt
BUILD = build

ARMGNU ?= arm-none-eabi

SMVRT_DEVICE ?= versatilepb
SMVRT_PORT ?= arm926ej-s

SRC_DIR = src
INCLUDE_DIR = include

BOOT_SRC = $(SRC_DIR)/board/$(SMVRT_DEVICE)/boot.S
LINKER_SCRIPT = $(SRC_DIR)/port/$(SMVRT_PORT)/linker.ld
USER_SRC = user/main.c
CORE_SRCS = $(wildcard $(SRC_DIR)/core/*.c)
BOARD_SRCS = $(wildcard $(SRC_DIR)/board/$(SMVRT_DEVICE)/*.c)
PORT_SRCS = $(wildcard $(SRC_DIR)/port/$(SMVRT_PORT)/*.c)

C_SOURCES = $(CORE_SRCS) $(USER_SRC) $(BOARD_SRCS) $(PORT_SRCS)

OBJS = $(BUILD)/boot.o $(C_SOURCES:%.c=$(BUILD)/%.o)

CFLAGS = -Wall -O2 -nostdlib -nostartfiles -ffreestanding \
         -I$(INCLUDE_DIR) -mcpu=arm1176jzf-s

all: $(BUILD)/$(TITLE).img

$(BUILD)/boot.o: $(BOOT_SRC)
	@mkdir -p $(dir $@)
	$(ARMGNU)-as $< -o $@

$(BUILD)/%.o: %.c
	@mkdir -p $(dir $@)
	$(ARMGNU)-gcc $(CFLAGS) -c $< -o $@

$(BUILD)/$(TITLE).elf: $(OBJS) $(LINKER_SCRIPT)
	$(ARMGNU)-gcc $(CFLAGS) -nostdlib -T $(LINKER_SCRIPT) $(OBJS) -lgcc -o $@

$(BUILD)/$(TITLE).img: $(BUILD)/$(TITLE).elf
	$(ARMGNU)-objcopy $< -O binary $@

run:
	@qemu-system-arm -M $(SMVRT_DEVICE) -kernel $(BUILD)/$(TITLE).img -nographic

clean:
	rm -rf $(BUILD)

.PHONY: all run clean

