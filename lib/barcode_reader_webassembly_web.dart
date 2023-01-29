// ignore: depend_on_referenced_packages
import 'package:js/js.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';
import 'package:universal_html/html.dart';
import 'dart:async';

const assetsPath = 'assets/packages/barcode_reader_webassembly/assets';

/// It's a Dart class that contains a single property, `barcodeReaderJs`, which is a JavaScript object
@JS('BarcodeReaderWebassemblyJsProps')
@anonymous
class BarcodeReaderWebassemblyJsProps {
  @JS('filePath')
  external String? filePath;

  @JS('scale')
  external num? scale;

  @JS('sequenceNum')
  external num? sequenceNum;

  @JS('password')
  external String? password;

  @JS('wasmPath')
  external String wasmPath;
}

Future<void> initializeJs() async {
  await loadJs('index.js');
  await loadJs('barcode-reader.js');
}

Future<void> loadJs(String filename) async {
  final completer = Completer<void>();
  final scriptUploadLargestFilesLib = ScriptElement();

  scriptUploadLargestFilesLib.type = 'text/javascript';
  scriptUploadLargestFilesLib.onLoad.listen((_) {
    completer.complete();
  });

  /// It's loading the JavaScript file that contains the upload code.
  scriptUploadLargestFilesLib.src = '/$assetsPath/$filename';

  /// It's adding the JavaScript file to the body of the HTML page.
  document.body!.append(scriptUploadLargestFilesLib);
  return completer.future;
}

BarcodeReaderWebassemblyJsProps buildBarcodeReaderWebassemblyJs(
  ReadBarcodeProps props,
) {
  final jsProps = BarcodeReaderWebassemblyJsProps();
  jsProps.scale = props.scale;
  jsProps.sequenceNum = props.sequenceNum;
  jsProps.password = props.password;
  jsProps.wasmPath = assetsPath;
  return jsProps;
}
