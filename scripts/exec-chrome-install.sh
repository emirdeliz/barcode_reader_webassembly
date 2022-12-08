#!/bin/sh

apt-get update &&
	apt-get install -y gnupg wget curl unzip --no-install-recommends &&
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&
	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >>/etc/apt/sources.list.d/google.list &&
	apt-get update -y &&
	apt-get install -y google-chrome-stable nodejs
