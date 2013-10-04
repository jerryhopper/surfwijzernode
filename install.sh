#!/bin/bash
OSVERSION=`cat /etc/issue.net`
if [ "$OSVERSION" != "Ubuntu 12.04.3 LTS" ]; then
	echo "no good"
else
	Directory="/usr/local/surfwijzer"
	if [ -d "$Directory" ]
	then
		echo "UPDATING LOCAL CODE WITH LATEST VERSION"
		cd $Directory
		git pull
		sudo sh /usr/local/surfwijzer/setup/install.sh
		exit 0
	else
		echo "UPDATING LOCAL CODE WITH LATEST VERSION"
		sudo mkdir $Directory
		sudo apt-get install git
		cd $Directory
		git clone git://github.com/jerryhopper/surfwijzernode $Directory
		sudo sh /usr/local/surfwijzer/setup/update.sh
		exit 0
	fi	
	
fi