import 'dart:async';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_web.dart';
import 'package:dart_web_plugin_base/dart_web_plugin_base.dart';
import 'package:dart_web_plugin_base/dart_web_plugin_base_constants.dart';
import 'package:dart_web_plugin_base/dart_web_plugin_base_web.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class BarcodeReaderWebassemblyPlugin {
  static void registerWith(Registrar registrar) async {
    await initializeJs();
  }

  /// It reads a barcode from the stack.
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the properties for the read
  /// barcode operation.
  Future<String> readBarcodeFromStack(ReadBarcodeProps readBarcodeProps) async {
    final result = await tryReadBarCode(
      readBarcodeProps,
      BarcodeReaderWebassemblyEvent.readBarcodeFromStack,
    );
    return result;
  }

  /// This function returns a Future<String> that resolves to the barcode read by the device's camera.
  ///
  /// Args:
  ///   readBarcodeProps (ReadBarcodeProps): This is a class that contains the properties for the
  /// barcode reading.
  Future<String> readBarcode(ReadBarcodeProps readBarcodeProps) async {
    final result = await tryReadBarCode(
      readBarcodeProps,
      BarcodeReaderWebassemblyEvent.readBarcode,
    );
    return result;
  }

  DartWebPluginBaseChannelMessageArguments buildArguments(
      ReadBarcodeProps readBarcodeProps, BarcodeReaderWebassemblyEvent method) {
    final arguments = DartWebPluginBaseChannelMessageArguments();
    arguments.methodTarget = method.name;
    arguments.file = readBarcodeProps.file;
    arguments.arguments = buildBarcodeReaderWebassemblyJs(readBarcodeProps);
    return arguments;
  }

  Future<String> tryReadBarCode(
    ReadBarcodeProps readBarcodeProps,
    BarcodeReaderWebassemblyEvent method,
  ) async {
    try {
      final call = MethodCall(
        DartWebPluginBaseChannelMessage.sendMethodMessageToClient.name,
        buildArguments(readBarcodeProps, method),
      );

      final dartWebPlugin =
          DartWebPluginBase<String, BarcodeReaderWebassemblyJsProps, String>(
              null);
      final result = await dartWebPlugin.invokeMethodJs(call);
      return result.arguments;
    } catch (e) {
      final isPasswordException = e.toString().contains('PasswordException');
      if (isPasswordException) {
        final onRequiredPassword = readBarcodeProps.onRequiredPassword;
        if (onRequiredPassword != null) {
          readBarcodeProps.password = await onRequiredPassword();
          return tryReadBarCode(readBarcodeProps, method);
        }
      }
    }
    return '';
  }
}
