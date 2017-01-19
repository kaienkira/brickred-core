include config.mak

MAKE = make --no-print-directory

define ECHO
	@printf "\033[;31m"; printf $1; printf "\033[0m\n"
endef

.PHONY: debug release profile clean install

debug release profile clean install:
	@$(call ECHO, "[build libbrickredcore]")
	@$(MAKE) -f mak/libbrickredcore.mak $@
