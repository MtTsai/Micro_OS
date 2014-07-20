CC=gcc
LD=ld
LDFILE=solrex_x86.ld
OBJCOPY=objcopy

all: boot.img

boot.o: boot.S
	$(CC) -c boot.S

boot.elf: boot.o
	$(LD) boot.o -o boot.elf -e -c -T$(LDFILE)

boot.bin: boot.elf
	$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary boot.elf boot.bin

boot.img: boot.bin
	dd if=boot.bin of=boot.img bs=512 count=1
	# skip : skip # of blocks at input
	# seek : skip # of blocks at output
	dd if=/dev/zero of=boot.img skip=0 seek=1 bs=512 count=2879


clean:
	rm -rf boot.o boot.elf boot.bin boot.img
