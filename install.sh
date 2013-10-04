#!/bin/bash
OSVERSION=`cat /etc/issue.net`
printf "\033c"
if [ "$OSVERSION" != "Ubuntu 12.04.3 LTS" ]; then
	echo "no good"
else
	Directory="/usr/local/surfwijzer"
	if [ -d "/usr/local/surfwijzer" ]
	then
		echo "EXISTS"
		echo "UPDATING LOCAL CODE WITH LATEST VERSION"
		sudo apt-get install git
		cd $Directory
		git pull
		sudo sh /usr/local/surfwijzer/setup/update.sh
		exit 0
	else
		echo "NOTHING"
		echo "INSTALLING LOCAL CODE WITH LATEST VERSION"
		sudo mkdir $Directory
		cd $Directory
		git clone git://github.com/jerryhopper/surfwijzernode $Directory
		sudo sh /usr/local/surfwijzer/setup/install.sh
		exit 0
	fi	
	
fi