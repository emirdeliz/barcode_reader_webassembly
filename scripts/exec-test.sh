#!/bin/sh

mkdir web && flutter drive \
	--driver=driver_test/integration_test.dart \
	--target=integration_test/barcode_reader_webassembly_test.dart \
	--dart-define=TEST_ENV=true \
	-d web-server --release
