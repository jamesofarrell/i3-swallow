SHELL = /bin/sh
FILE = swallow

swallow:

.SILENT: run
update:
		@ git pull


install:${FILE}
		@ if [ -f ${FILE} ]; then cp -v swallow /usr/bin/; fi
		@ if [ -f /usr/bin/${FILE} ]; then chmod +x swallow; fi
		@ if command -v swallow >/dev/null; then printf "%s\n" "Swallow has been installed on this system"; fi
		@ if ! command -v swallow >/dev/null; then printf "%s\n" "Failed to install Swallow on this system"; fi

uninstall:${FILE}
		@ if [ -f /usr/bin/${FILE} ]; then rm /usr/bin/${FILE}; fi
		@ if ! command -v swallow >/dev/null; then printf "%s\n" "Swallow has been removed from this system"; fi
		@ if command -v swallow >/dev/null; then printf "%s\n" "Failed to remove Swallo on this system"; fi
