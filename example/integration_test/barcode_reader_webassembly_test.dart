import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_plugin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_html/html.dart';
import '__mock__/barcode.dart';

Future<ReadBarcodeProps> _compileFileMockPath(String filename) async {
  final readBarcodeProps = ReadBarcodeProps(null);
  final filePath = '/assets/$filename';
  readBarcodeProps.file = await _readFileFromTestResourcesFolder(filePath);
  return readBarcodeProps;
}

Future<File> _readFileFromTestResourcesFolder(
  String filePath,
) async {
  print(filePath);

  final response = await window.fetch(filePath).catchError((e) {
    print(e);
  });
  final data = await response.blob();
  final metadata = {'type': 'application/pdf'};
  print('PASSSOUEEEEEE----');

  final filename = filePath.split('/').last;
  final file = File([data], filename, metadata);
  return file;
}

void main() {
  group('Barcode test', () {
    late BarcodeReaderWebassemblyPlugin barcodeReaderWebassemblyPlugin;
    setUpAll(() async {
      barcodeReaderWebassemblyPlugin = BarcodeReaderWebassemblyPlugin();
      await _awaitInitializeBarcodeJs(barcodeReaderWebassemblyPlugin);
    });

    testWidgets('Have a barcode from Campelo', (tester) async {
      final barcodeData = barcodeMock.elementAt(0);

      print('AQUIIIII CCC');

      final barcodeProps = await _compileFileMockPath(
        barcodeData['filename'] as String,
      );

      print('AQUIIIII');

      final result = await barcodeReaderWebassemblyPlugin
          .readBarcodeFromStack(barcodeProps);

      print(result);
      expect(result, barcodeData['barcode']);
    });

    // for (int i = 0; i < filesSizeInMb.length; i++) {
    //   final size = filesSizeInMb[i];
    //   testWidgets('Have a upload to file with: ${size}MB', (tester) async {
    //     await _runTestForLabelAndProgressBar(
    //       tester: tester,
    //       filename: buildFileNameTest(size),
    //     );
    //   });
    // }

    //   testWidgets('Have a barcode from Celesc', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(1);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Gps', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(2);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Detran', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(3);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Super Gasbras', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(4);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Net Black And White', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(5);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Nubank', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(6);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Contabilivre Barcode On Second Page',
    //       (tester) async {
    //     final barcodeData = barcodeMock.elementAt(7);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Cora', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(8);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });

    //   testWidgets('Have a barcode from Cora Duedate On Weekend', (tester) async {
    //     final barcodeData = barcodeMock.elementAt(9);
    //     final result = await barcodeReaderWebassemblyPlugin.readBarcodeFromStack(
    //         compileFileMockPath(barcodeData['filename'] as String));
    //     expect(result, barcodeData['barcode']);
    //   });
  });
}

Future _awaitInitializeBarcodeJs(
    BarcodeReaderWebassemblyPlugin? barcodeReaderWebassemblyPlugin) async {
  // final initializedBarcode = barcodeReaderWebassemblyPlugin != null;

  // if (initializedBarcode) {
  //   return Future.value(null);
  // }
  // await Future.delayed(const Duration(milliseconds: 300));
  // return _awaitInitializeBarcodeJs(barcodeReaderWebassemblyPlugin);
  return Future.value(null);
}
