import 'dart:async';
import 'dart:html';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly.dart';
import 'package:barcode_reader_webassembly/barcode_reader_webassembly_web.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BarcodeReaderWebassemblyExampleApp());
}

class BarcodeReaderWebassemblyExampleApp extends StatelessWidget {
  const BarcodeReaderWebassemblyExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarcodeReaderWebassembly Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'BarcodeReaderWebassembly Example Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _barcodeReaderWebassemblyPlugin = BarcodeReaderWebassembly();

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
            // define os botões na base do dialogo
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 124.0,
          height: 48.0,
          child: ElevatedButton(
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            isProcessing ? 'processing...' : result,
            style: const TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
