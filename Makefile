SHELL = /bin/sh
FILE = swallow

swallow:

.SILENT: run
update:
		@ git pull


install:${FILE}
		@ if [ -f ${FILE} ]; then cp -v ${FILE} /usr/bin; fi
		@ if [ -f /usr/bin/${FILE} ]; then chmod +x /usr/bin/${FILE}; fi
		@ if command -v ${FILE} >/dev/null; then printf "%s\n" "Swallow has been installed on this system"; fi
		@ if ! command -v ${FILE} >/dev/null; then printf "%s\n" "Failed to install Swallow on this system"; fi

uninstall:${FILE}
		@ if [ -f /usr/bin/${FILE} ]; then rm -v /usr/bin/${FILE}; fi
		@ if ! command -v ${FILE} >/dev/null; then printf "%s\n" "Swallow has been removed from this system"; fi
		@ if command -v ${FILE} >/dev/null; then printf "%s\n" "Failed to remove Swallow from this system"; fi
