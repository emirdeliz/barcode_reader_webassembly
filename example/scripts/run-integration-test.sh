#!/bin/sh
chromeDriverPort=4444
clientPort=9191

killProcessInPort() {
	lsof -P | grep ":$1" | awk '{print $2}' | xargs kill -9 && reset
}

startChromeDriver() {
	echo 'Starting chromedriver...' &&
		killProcessInPort $chromeDriverPort && cd driver_test &&
		./chromedriver --port=$chromeDriverPort && cd ..
}

startFlutterIntegrationTest() {
	echo 'Starting integration test...' &&
		killProcessInPort $clientPort &&
		flutter drive \
			--driver=driver_test/integration_test.dart \
			--target=integration_test/barcode_reader_webassembly_test.dart \
			-d chrome \
			--web-port $clientPort \
			--browser-name=chrome \
			--headless --release
}

main() {
	startChromeDriver &
	startFlutterIntegrationTest
}
main
