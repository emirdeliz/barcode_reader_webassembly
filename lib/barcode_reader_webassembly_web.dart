import 'dart:html';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'barcode_reader_webassembly_platform_interface.dart';

class ReadBarcodeProps {
  ReadBarcodeProps(this.file);
  late File file;
  late String? filePath = '';
  late num? scale = 1;
  late num? sequenceNum = 0;
}

class BarcodeReaderWebassemblyWeb extends BarcodeReaderWebassemblyPlatform {
  BarcodeReaderWebassemblyWeb();

  static void registerWith(Registrar registrar) {
    loadJs();
  }

  static void loadJs() {
    ScriptElement scriptBarcodeLib = ScriptElement();
    scriptBarcodeLib.type = 'text/javascript';
    scriptBarcodeLib.src =
        'assets/packages/barcode_reader_webassembly/assets/barcode-reader.js';
    document.body!.append(scriptBarcodeLib);
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
