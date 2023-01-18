import 'barcode_reader_webassembly_platform.dart';
import 'barcode_reader_webassembly_web.dart';

class BarcodeReaderWebassembly {
  /// It reads a barcode from the stack.
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the properties for the read
  /// barcode operation.
  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) {
    return BarcodeReaderWebassemblyPlatform.instance
        .readBarcodeFromStack(readBarcodeProps);
  }

  /// This function returns a Future<String> that resolves to the barcode read by the device's camera.
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the properties for the
  /// barcode reading.
  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) {
    return BarcodeReaderWebassemblyPlatform.instance
        .readBarcode(readBarcodeProps);
  }
}
