#!/bin/sh

CHROMEVER=$(google-chrome --product-version | grep -o "[^\.]*\.[^\.]*\.[^\.]*") &&
	DRIVERVER=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROMEVER") &&
	mkdir -p driver_test/chromedriver && cd driver_test/chromedriver &&
	wget -q --continue "http://chromedriver.storage.googleapis.com/$DRIVERVER/chromedriver_linux64.zip" &&
	unzip chromedriver*
