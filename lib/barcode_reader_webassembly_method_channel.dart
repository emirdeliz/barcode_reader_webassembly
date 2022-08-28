import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'barcode_reader_webassembly_platform_interface.dart';

/// An implementation of [BarcodeReaderWebassemblyPlatform] that uses method channels.
class MethodChannelBarcodeReaderWebassembly extends BarcodeReaderWebassemblyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('barcode_reader_webassembly');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
