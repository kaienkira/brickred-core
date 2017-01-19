include config.mak

TARGET = build/libbrickredcore
SRCS = \
src/brickred/base_logger.cc \
src/brickred/command_line_option.cc \
src/brickred/dynamic_buffer.cc \

LINK_TYPE = static
INCLUDE = -Isrc
CPP_FLAG = $(BR_CORE_CPP_FLAG)
BUILD_DIR = build

include mak/main.mak

.PHONY: install

install:
	@mkdir -p $(BR_INSTALL_PREFIX)/include/brickred
	@cp src/brickred/*.h $(BR_INSTALL_PREFIX)/include/brickred
	@mkdir -p $(BR_INSTALL_PREFIX)/lib
	@cp $(FINAL_TARGET) $(BR_INSTALL_PREFIX)/lib
