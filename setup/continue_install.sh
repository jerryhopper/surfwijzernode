#!/bin/bash

echo "install.sh"
sudo apt-get -y install build-essential pkg-config python-mysqldb libpcre3-dev

cd /usr/local/surfwijzer/setup
tar -xvf dansguardian-2.12.0.3.tar.bz2


