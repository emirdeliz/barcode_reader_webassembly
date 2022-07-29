import 'package:flutter_test/flutter_test.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_platform_interface.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBarcodeReaderWebassemblyPlatform 
    with MockPlatformInterfaceMixin
    implements BarcodeReaderWebassemblyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BarcodeReaderWebassemblyPlatform initialPlatform = BarcodeReaderWebassemblyPlatform.instance;

  test('$MethodChannelBarcodeReaderWebassembly is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBarcodeReaderWebassembly>());
  });

  test('getPlatformVersion', () async {
    BarcodeReaderWebassembly barcodeReaderWebassemblyPlugin = BarcodeReaderWebassembly();
    MockBarcodeReaderWebassemblyPlatform fakePlatform = MockBarcodeReaderWebassemblyPlatform();
    BarcodeReaderWebassemblyPlatform.instance = fakePlatform;
  
    expect(await barcodeReaderWebassemblyPlugin.getPlatformVersion(), '42');
  });
}
