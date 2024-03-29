import 'dart:async';

import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_plugin.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

void main() {
  runApp(const BarcodeReaderWebassemblyExampleApp());
}

class BarcodeReaderWebassemblyExampleApp extends StatelessWidget {
  const BarcodeReaderWebassemblyExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BarcodeReaderWebassembly Example',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(22, 27, 34, 1),
        body: Center(
          child: BarcodeReaderWebassemblyExamplePage(
            title: 'BarcodeReaderWebassembly Example Home Page',
          ),
        ),
      ),
    );
  }
}

class BarcodeReaderWebassemblyExamplePage extends StatefulWidget {
  const BarcodeReaderWebassemblyExamplePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<BarcodeReaderWebassemblyExamplePage> createState() =>
      _BarcodeReaderWebassemblyExamplePageState();
}

class _BarcodeReaderWebassemblyExamplePageState
    extends State<BarcodeReaderWebassemblyExamplePage> {
  final _barcodeReaderWebassemblyPlugin = BarcodeReaderWebassemblyPlugin();

  bool isProcessing = false;
  String result = '';
  String password = '';

  void _uploadFile(File file) async {
    setState(() {
      isProcessing = true;
    });

    final barcodeProps = ReadBarcodeProps(file);
    barcodeProps.onRequiredPassword = _onRequiredPassword;
    final barcode = await _barcodeReaderWebassemblyPlugin
        .readBarcodeFromStack(barcodeProps);
    setState(() {
      result = barcode;
      isProcessing = false;
    });
  }

  void _selectFile() {
    InputElement uploadInput = FileUploadInputElement() as InputElement;
    uploadInput.draggable = true;
    uploadInput.multiple = false;
    uploadInput.accept = "image/*','application/pdf";
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      File file = uploadInput.files![0];
      _uploadFile(file);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<String> _onRequiredPassword() {
    final completer = Completer<String>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please, enter the pdf password.'),
          content: TextField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'enter password',
            ),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () {
                completer.complete(password);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            overlayColor: MaterialStateProperty.all(
              isProcessing ? Colors.black : Colors.transparent,
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(15),
            ),
          ),
          onPressed: () => _selectFile(),
          child: const Text(
            "Select File",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            isProcessing ? 'processing...' : result,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
