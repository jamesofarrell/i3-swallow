
swallow: 
	echo "Try Executing make as root"
	
update:
	git pull
	
install:
	if [ -f swallow ]; then cp swallow /usr/bin/; fi
  	if [ -f /usr/bin/swallow ]; then chmod +x swallow; fi
	
uninstall:
	if [ -f /usr/bin/swallow ]; then rm swallow; fi
	
