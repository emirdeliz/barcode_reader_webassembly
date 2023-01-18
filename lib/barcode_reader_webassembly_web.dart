import 'dart:async';
import 'dart:html';
import 'package:barcode_reader_webassembly/dart_web_plugin.dart';
import 'package:js/js.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';

/// It's a Dart class that contains a single property, `barcodeReaderJs`, which is a JavaScript object
@JS('BarcodeReaderWebassemblyJsProps')
@anonymous
class BarcodeReaderWebassemblyJsProps {
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

/// A class that is used to store the data that is passed to the ReadBarcode widget.
class ReadBarcodeProps {
  ReadBarcodeProps(this.file);

  late File? file;
  late String? filePath = '';
  late num? scale = 1;
  late num? sequenceNum = 0;
}

class BarcodeReaderWebassemblyWeb {
  Future<String> readBarcode(ReadBarcodeProps props) {
    final completer = Completer<String>();
    DartWebPlugin<BarcodeReaderWebassemblyJsProps>((
      String barcode,
      JsEvent jsEvent,
    ) {
      completer.complete(barcode);
    });
    return completer.future;
  }
}
