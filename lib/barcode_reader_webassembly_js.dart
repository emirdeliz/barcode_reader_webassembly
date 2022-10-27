// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:async';
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

/// A class that is used to store the data that is passed to the ReadBarcode widget.
@JS('BarcodeReadJsProps')
class BarcodeReadJsProps {
  @JS('file')
  external File? file;

  @JS('filePath')
  external String? filePath;

  @JS('scale')
  external num? scale;

  @JS('sequenceNum')
  external num? sequenceNum;

  @JS('wasmPath')
  external String wasmPath;
}
