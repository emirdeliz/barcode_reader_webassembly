import 'dart:async';
import 'dart:html';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'barcode_reader_webassembly_platform_interface.dart';

/// A class that is used to store the data that is passed to the ReadBarcode widget.
class ReadBarcodeProps {
  ReadBarcodeProps(this.file);

  late File? file;
  late String? filePath = '';
  late num? scale = 1;
  late num? sequenceNum = 0;
  late Future<String> Function()? onRequiredPassword;
}

/// It's a wrapper around the WebAssembly version of the barcode reader
class BarcodeReaderWebassemblyWeb extends BarcodeReaderWebassemblyPlatform {
  BarcodeReaderWebassemblyWeb();

  static void registerWith(Registrar registrar) {
    loadJs();
  }

  /// It loads the JavaScript file that contains the WebAssembly code
  ///
  /// Returns:
  ///   A Future<void>
  static Future<void> loadJs() {
    final Completer completer = Completer();
    final scriptBarcodeLib = ScriptElement();

    scriptBarcodeLib.type = 'text/javascript';
    scriptBarcodeLib.onLoad.listen((_) {
      completer.complete();
    });

    /// It's loading the JavaScript file that contains the WebAssembly code.
    scriptBarcodeLib.src =
        'assets/packages/barcode_reader_webassembly/assets/barcode-reader.js';

    /// It's adding the JavaScript file to the body of the HTML page.
    document.body!.append(scriptBarcodeLib);
    return completer.future;
  }

  /// It reads a barcode from the stack.
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the following properties:
  ///
  /// Returns:
  ///   A Future<String>
  @override
  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) async {
    return readBarcodeFromStack(readBarcodeProps);
  }

  /// It calls the readBarcodeFromStack function.
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the following properties:
  ///
  /// Returns:
  ///   A Future<String>
  @override
  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) async {
    return readBarcodeFromStack(readBarcodeProps);
  }
}
