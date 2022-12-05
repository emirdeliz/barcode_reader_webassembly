import 'dart:html';
import 'package:js/js.dart';

/// It's a Dart class that can be used to call the JavaScript functions in the
/// `barcode_reader_webassembly_interop.js` file
@JS('BarcodeReader')
class BarcodeReaderWebassemblyInteropJs {
  /// It's a Dart annotation that tells the compiler that the `readBarcodeFromStack`
  /// function is defined in the JavaScript file.
  @JS('readBarcodeFromStack')
  external static Future<String> Function(BarcodeReadJsProps)
      readBarcodeFromStack;

  /// It's a Dart annotation that tells the compiler that the `readBarcode` function is defined in the
  /// JavaScript file.
  @JS('readBarcode')
  external static Future<String> Function(BarcodeReadJsProps) readBarcode;
}

// class BarcodeReadJsProps extends ReadBarcodeProps {
//   BarcodeReadJsProps(File? file) : super(file);
//   late String wasmPath;
// }
@JS('BarcodeReadJsProps')
@anonymous
class BarcodeReadJsProps {
  external File? file;

  external String? filePath;

  external num? scale;

  external num? sequenceNum;

  external String wasmPath;
}
