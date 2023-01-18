import 'dart:js_util';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_web.dart';
import 'package:barcode_reader_webassembly/dart_web_plugin.dart';
import 'package:flutter/services.dart';

class BarcodeReaderWebassemblyChannelHandler {
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method as ChannelMessage) {
      case ChannelMessage.sendMethodMessageToClient:
        return sendMethodMessage(call.method as JsEvent, call.arguments);
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'flutter_plugin for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  Future<dynamic> sendMethodMessage(JsEvent method, dynamic arguments) async {
    const wasmPath = 'assets/packages/barcode_reader_webassembly/assets';

    final jsProps = BarcodeReaderWebassemblyJsProps();
    jsProps.file = arguments.file;
    jsProps.filePath = arguments.filePath;
    jsProps.scale = arguments.scale;
    jsProps.sequenceNum = arguments.sequenceNum;
    jsProps.wasmPath = wasmPath;

    final dynamic response = await promiseToFuture(jsInvokeMethod(
      method.name,
      jsProps,
    ));
    return response;
  }
}
