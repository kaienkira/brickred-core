include config.mak

TARGET = build/libbrickredcore
SRCS = \
src/brickred/base_logger.cc \
src/brickred/command_line_option.cc \
src/brickred/dynamic_buffer.cc \
src/brickred/string_util.cc \

LINK_TYPE = static
INCLUDE = -Isrc
CPP_FLAG = $(BRICKRED_COMPILE_FLAG)
BUILD_DIR = build

include mak/main.mak

.PHONY: install

install:
	@mkdir -p "$(BRICKRED_INSTALL_PREFIX)"/include/brickred
	@cp src/brickred/*.h "$(BRICKRED_INSTALL_PREFIX)"/include/brickred
	@mkdir -p "$(BRICKRED_INSTALL_PREFIX)"/lib
	@cp "$(FINAL_TARGET)" "$(BRICKRED_INSTALL_PREFIX)"/lib
