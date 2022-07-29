cd driver_test && ./chromedriver --port=4444 &
flutter drive \
  --headless \
  --driver=driver_test/integration_test.dart \
  --target=integration_test/barcode_reader_webassembly_test.dart \
	--dart-define=TEST_ENV=true \
  -d web-server \
  --web-port=9191