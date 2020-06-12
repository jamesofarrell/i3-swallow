swallow: 
	echo "Execute 'make install' as root to install swallow on your system."
	
update:
	git pull
	
install:
	if [ -f swallow ]; then cp -v swallow /usr/bin/; fi
	if [ -f /usr/bin/swallow ]; then chmod +x swallow; fi
	if [ ! -f /usr/bin/swallow ]; then printf "%s\n" "failed to install 'swallow' on this system"; fi
	
	
uninstall:
	if [ -f /usr/bin/swallow ]; then rm swallow; fi
	if [ -f /usr/bin/swallow ]; then printf "%s\n" "failed to uninstall 'swallow' on this system"; fi
