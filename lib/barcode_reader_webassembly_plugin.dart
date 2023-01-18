import 'dart:async';
import 'dart:html';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'barcode_reader_webassembly_platform.dart';

const barcodeReaderWebassemblyChannel = 'barcode_reader_webassembly';

/// It's a wrapper around the WebAssembly version of the barcode reader
class BarcodeReaderWebassemblyPlugin extends BarcodeReaderWebassemblyPlatform {
  static late MethodChannel channel;
  BarcodeReaderWebassemblyPlugin();

  static void registerWith(Registrar registrar) async {
    await loadJs('barcode-reader.js');
    await loadJs('index.js');

    channel = MethodChannel(
      barcodeReaderWebassemblyChannel,
      const StandardMethodCodec(),
      registrar,
    );

    final channelHandlerInstance = BarcodeReaderWebassemblyChannelHandler();
    channel.setMethodCallHandler(channelHandlerInstance.handleMethodCall);
  }

  /// It loads a javascript file.
  ///
  /// Args:
  ///   filename (String): The name of the file to load.
  static Future<void> loadJs(String filename) async {
    final Completer completer = Completer();
    final scriptUploadLargestFilesLib = ScriptElement();

    scriptUploadLargestFilesLib.type = 'text/javascript';
    scriptUploadLargestFilesLib.onLoad.listen((_) {
      completer.complete();
    });

    /// It's loading the JavaScript file that contains the upload code.
    scriptUploadLargestFilesLib.src =
        '/assets/packages/barcode_reader_webassembly/assets/$filename';

    /// It's adding the JavaScript file to the body of the HTML page.
    document.body!.append(scriptUploadLargestFilesLib);
    return completer.future;
  }
}
