import 'package:barcode_reader_webassembly/barcode_reader_webassembly_interop.dart';
import 'barcode_reader_webassembly_web.dart';

abstract class BarcodeReaderWebassemblyPlatform {
  static BarcodeReaderWebassemblyPlatform instance =
      BarcodeReaderWebassemblyInterop();

  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) {
    throw UnimplementedError(
        'readBarcodeFromStack() has not been implemented.');
  }

  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) {
    throw UnimplementedError('readBarcode() has not been implemented.');
  }
}
