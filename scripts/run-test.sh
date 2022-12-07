#!/bin/sh

cd driver_test/chromedriver && ./chromedriver --port=4444 &
sleep 10 &&
	flutter drive \
		--driver=driver_test/integration_test.dart \
		--target=integration_test/barcode_reader_webassembly_test.dart \
		--dart-define=TEST_ENV=true \
		-d chrome \
		--web-port=9191 --browser-name=chrome --headless --no-sandbox
