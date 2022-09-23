import 'package:barcode_reader_webassembly/barcode_reader_webassembly_interop.dart';
import 'barcode_reader_webassembly_web.dart';

/// It's a Dart class that's abstract and has a name of BarcodeReaderWebassemblyPlatform
abstract class BarcodeReaderWebassemblyPlatform {
  /// It's a static variable that's being assigned to a class.
  static BarcodeReaderWebassemblyPlatform instance =
      BarcodeReaderWebassemblyInterop();

  /// "This function is called from the Flutter app, and it calls a function in the Dart code that is
  /// part of the Flutter app."
  ///
  /// The first line of the function is a comment. It's a good idea to include comments in your code
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the properties for the read
  /// barcode operation.
  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) {
    throw UnimplementedError(
        'readBarcodeFromStack() has not been implemented.');
  }

  /// "This function is called from the Flutter app, and it returns a Future<String> that will be
  /// fulfilled with the barcode data."
  ///
  /// The `readBarcodeProps` parameter is a Dart object that contains the properties that were passed to
  /// the Flutter function
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the following properties:
  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) {
    throw UnimplementedError('readBarcode() has not been implemented.');
  }
}
