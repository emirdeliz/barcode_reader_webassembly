#!/bin/sh
mkdir web &&
	flutter drive -v \
		--driver=driver_test/integration_test.dart \
		--target=integration_test/barcode_reader_webassembly_test.dart \
		--dart-define=TEST_ENV=true \
		-d web-server \
		--release --web-port=9191 --browser-name=chrome --headless
