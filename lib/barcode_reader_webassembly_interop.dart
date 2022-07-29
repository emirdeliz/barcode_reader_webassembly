import 'dart:html';
import 'dart:js';
import 'dart:async';
import 'dart:typed_data';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_platform_interface.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_web.dart';
import 'package:js/js.dart';

@JS('BarcodeReader')
class BarcodeReaderWebassemblyInteropJs {
  @JS('readBarcodeFromStack')
  external static Future<String> Function(BarcodeReadJsProps)
      readBarcodeFromStack;

  @JS('readBarcode')
  external static Future<String> Function(BarcodeReadJsProps) readBarcode;
}

class BarcodeReadJsProps extends ReadBarcodeProps {
  BarcodeReadJsProps(File file) : super(file);
  late String wasmPath;
}

class BarcodeReaderWebassemblyInterop extends BarcodeReaderWebassemblyPlatform {
  @override
  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) async {
    final BarcodeReadJsProps readBarcodeJsProps =
        prepareParameters(readBarcodeProps);

    final barcode = await promiseToFuture(
        BarcodeReaderWebassemblyInteropJs.readBarcodeFromStack(
            readBarcodeJsProps));
    return barcode;
  }

  @override
  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) async {
    final BarcodeReadJsProps readBarcodeJsProps =
        prepareParameters(readBarcodeProps);

    final barcode = await promiseToFuture(
        BarcodeReaderWebassemblyInteropJs.readBarcode(readBarcodeJsProps));
    return barcode;
  }

  BarcodeReadJsProps prepareParameters(ReadBarcodeProps readBarcodeProps) {
    final BarcodeReadJsProps readBarcodeJsProps =
        BarcodeReadJsProps(readBarcodeProps.file);

    readBarcodeJsProps.wasmPath =
        'assets/packages/barcode_reader_webassembly/assets';
    return readBarcodeJsProps;
  }
}
