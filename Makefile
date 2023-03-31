all: main

BUILD_DIR = build

.PHONY: clean PREPARE

PREPARE:
	mkdir build

main: PREPARE main.o functions.o
	gcc -o $(BUILD_DIR)/main $(BUILD_DIR)/main.o $(BUILD_DIR)/functions.o -m32 

main.o: main.c
	gcc -c -o $(BUILD_DIR)/main.o main.c -m32 -lm
functions.o: functions.asm
	nasm -f elf32 -o $(BUILD_DIR)/functions.o functions.asm

clean:
	rm -rf $(BUILD_DIR)