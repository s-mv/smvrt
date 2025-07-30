# smvRT - a simple RTOS for old embedded devices
A minimal RTOS for Raspberry Pi written in C and ARM assembly.

Runs two tasks with basic context switching. Built for learning and fun.

## Current Features
- Bare-metal kernel that runs on `qemu`

## Build Instructions
```bash
make
```

Currently, the [Makefile](/Makefile) doesn't have any customization. This is a TODO.

~~## How to run (on a real Pi)~~
~~1. Copy smvrt.img onto your SD card's boot partition.~~
~~2. Boot into your Raspberry Pi.~~
~~**Note:** Currently, code has only been tested in a hypervisor.~~

## Run on QEMU
```bash
sudo pacman -S qemu-arch-extra # if not installed
make                           # build smvrt.img
qemu-system-arm -M raspi2 -kernel smvrt.img -serial stdio -nographic
```

Currently, the interface only works on a hypervisor.

