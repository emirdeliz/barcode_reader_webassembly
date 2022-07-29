import 'barcode_reader_webassembly_platform_interface.dart';
import 'barcode_reader_webassembly_web.dart';

class BarcodeReaderWebassembly {
  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) {
    return BarcodeReaderWebassemblyPlatform.instance
        .readBarcodeFromStack(readBarcodeProps);
  }

  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) {
    return BarcodeReaderWebassemblyPlatform.instance
        .readBarcode(readBarcodeProps);
  }
}
