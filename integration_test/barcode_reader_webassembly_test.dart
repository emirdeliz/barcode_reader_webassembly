import 'dart:html';

import 'package:barcode_reader_webassembly/barcode_reader_webassembly_web.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly.dart';
import 'package:integration_test/integration_test.dart';

import '__mock__/barcode.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Barcode test', () {
    late BarcodeReaderWebassembly barcodeReaderWebassemblyPlugin;
    setUpAll(() async {
      barcodeReaderWebassemblyPlugin = BarcodeReaderWebassembly();
      await awaitInitializeBarcodeJs(barcodeReaderWebassemblyPlugin);
    });

    testWidgets('Have a barcode from Campelo', (tester) async {
      final barcodeData = barcodeMock.elementAt(0);
      final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
          compileFileMockPath(barcodeData['fileName'] as String));
      expect(result, barcodeData['barcode']);
    });

    // testWidgets('Have a barcode from Celesc', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(1);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Gps', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(2);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Detran', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(3);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Super Gasbras', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(4);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Net Black And White', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(5);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Nubank', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(6);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Contabilivre Barcode On Second Page',
    //     (tester) async {
    //   final barcodeData = barcodeMock.elementAt(7);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Cora', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(8);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });

    // testWidgets('Have a barcode from Cora Duedate On Weekend', (tester) async {
    //   final barcodeData = barcodeMock.elementAt(9);
    //   final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //       compileFileMockPath(barcodeData['fileName'] as String));
    //   expect(result, barcodeData['barcode']);
    // });
  });
}

Future awaitInitializeBarcodeJs(
    BarcodeReaderWebassembly? barcodeReaderWebassemblyPlugin) async {
  final initializedBarcode = barcodeReaderWebassemblyPlugin != null;
  if (initializedBarcode) {
    return Future.value(null);
  }
  await Future.delayed(const Duration(milliseconds: 300));
  return awaitInitializeBarcodeJs(barcodeReaderWebassemblyPlugin);
}

ReadBarcodeProps compileFileMockPath(String fileName) {
  final readBarcodeProps = ReadBarcodeProps(null);
  readBarcodeProps.filePath =
      'http://${window.location.host}/integration_test/__mock__/assets/$fileName';
  return readBarcodeProps;
}
