#!/bin/bash

echo "install.sh"
sudo apt-get -y install build-essential pkg-config python-mysqldb libpcre3-dev zlib1g-dev squid
sudo service squid3 stop

cd /usr/local/surfwijzer/setup
tar -xvf dansguardian-2.12.0.3.tar.bz2
cd /usr/local/surfwijzer/setup/dansguardian-2.12.0.3

sudo ./configure  --prefix=/usr/local/surfwijzer/node --enable-ntlm=yes --enable-avastd=yes
sudo make
sudo make install
sudo make clean

