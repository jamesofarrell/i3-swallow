# CONTRIBUTION: Angel Uniminin <uniminin@zoho.com> in 2020 under the terms of MIT

# NOTICE: Shell is written to be POSIX compatible
SHELL = /bin/sh
FILE = swallow

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
				"#"*|"") printf '%s\n' "$$line" ;; \
				*) printf '%s\n' "make $$line"; \
			esac; \
		done


#@ Install swallow in /usr/local/bin/swallow
install: uninstall
	@ [ -f "/usr/local/bin/$(FILE)" ] || { cp -p $(FILE).py "/usr/local/bin/$(FILE)" || exit 1 ;}
	@ [ -x "/usr/local/bin/$(FILE)" ] || { chmod +x "/usr/local/bin/$(FILE)" || exit 1 ;}


#@ Uninstall swallow
uninstall:
	@ [ ! -f "/usr/bin/$(FILE)" ] || { rm -f "/usr/bin/$(FILE)" || exit 1 ;}
