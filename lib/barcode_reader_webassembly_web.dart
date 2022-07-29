import 'dart:async';
import 'dart:html';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'barcode_reader_webassembly_platform_interface.dart';

class ReadBarcodeProps {
  ReadBarcodeProps(this.file);

  late File? file;
  late String? filePath = '';
  late num? scale = 1;
  late num? sequenceNum = 0;
}

class BarcodeReaderWebassemblyWeb extends BarcodeReaderWebassemblyPlatform {
  BarcodeReaderWebassemblyWeb();

  static void registerWith(Registrar registrar) {
    loadJs();
  }

  static Future<void> loadJs() {
    const isEnvironmentTest = bool.fromEnvironment('TEST_ENV');
    final Completer completer = Completer();
    final scriptBarcodeLib = ScriptElement();

    scriptBarcodeLib.type = 'text/javascript';
    scriptBarcodeLib.onLoad.listen((_) {
      completer.complete();
    });

    scriptBarcodeLib.src = isEnvironmentTest
        ? 'assets/barcode-reader.js'
        : 'assets/packages/barcode_reader_webassembly/assets/barcode-reader.js';

    document.body!.append(scriptBarcodeLib);
    return completer.future;
  }

  @override
  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) async {
    return readBarcodeFromStack(readBarcodeProps);
  }

  @override
  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) async {
    return readBarcodeFromStack(readBarcodeProps);
  }
}
