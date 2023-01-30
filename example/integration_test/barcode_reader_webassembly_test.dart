import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_plugin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:universal_html/html.dart';
import '__mock__/barcode.dart';

Future<ReadBarcodeProps> _compileFileMockPath(
  String filename,
  String? password,
) async {
  final readBarcodeProps = ReadBarcodeProps(null);
  final filePath = '/integration_test/__mock__/assets/$filename';
  readBarcodeProps.file = await _readFileFromTestResourcesFolder(filePath);
  if (password != null) {
    readBarcodeProps.password = password;
  }
  return readBarcodeProps;
}

Future<File> _readFileFromTestResourcesFolder(
  String filePath,
) async {
  final response = await window.fetch(filePath);
  final data = await response.blob();
  final metadata = {'type': 'application/pdf'};
  final filename = filePath.split('/').last;
  final file = File([data], filename, metadata);
  return file;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Barcode test', () {
    late BarcodeReaderWebassemblyPlugin plugin;
    setUpAll(() async {
      plugin = BarcodeReaderWebassemblyPlugin();
    });

    for (int i = 0; i < barcodeMock.length; i++) {
      final barcodeDataTest = barcodeMock[i];
      final titleTest = 'Have a barcode from ${barcodeDataTest['filename']}';
      testWidgets(titleTest, (tester) async {
        final filename = barcodeDataTest['filename'];
        final password = barcodeDataTest['password'];
        final barcodeProps = await _compileFileMockPath(
          filename as String,
          password ?? '',
        );

        final result = await plugin.readBarcodeFromStack(barcodeProps);
        expect(result, barcodeDataTest['barcode']);
      });
    }
  });
}
