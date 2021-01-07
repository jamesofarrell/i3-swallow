# Written by Angel Uniminin <uniminin@zoho.com> in 2020 under the terms of MIT

BIN = ~/.local/bin
FILE = swallow.py
PROGRAM = swallow

.PHONY: all list

#@ Default target invoked on 'make' (outputs syntax error on this project)
all:
	@ $(error Target 'all' is not allowed, use 'make list' to list available targets or read the 'Makefile' file)
	@ exit 2

#@ List all targets
list:
	@ true \
		&& grep -A 1 "^#@.*" Makefile | sed s/--//gm | sed s/:.*//gm | sed "s/#@/#/gm" | while IFS= read -r line; do \
			case "$$line" in \
				"#"*|"") printf "%s\n" "$$line" ;; \
				*) printf "%s\n" "make $$line"; \
			esac; \
		done


#@ Install swallow in ~/.local/bin/swallow
install: uninstall
	@ [ -f "$(BIN)/$(PROGRAM)" ] || { cp -p $(FILE) $(BIN)/$(PROGRAM) || exit 1 ;}
	@ [ -x "$(BIN)/$(PROGRAM)" ] || { chmod 770 $(BIN)/$(PROGRAM) || exit 1 ;}


#@ Uninstall swallow
uninstall:
	@ [ -f "$(BIN)/$(PROGRAM)" ] || { rm -f $(BIN)/$(PROGRAM) || exit 1 ;}
