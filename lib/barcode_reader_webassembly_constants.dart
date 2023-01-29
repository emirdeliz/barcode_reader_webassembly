import 'package:universal_html/html.dart';

enum BarcodeReaderWebassemblyEvent { readBarcode, readBarcodeFromStack }

enum ChannelMessage { sendMethodMessageToClient }

/// A class that is used to store the data that is passed to the ReadBarcode widget.
class ReadBarcodeProps {
  ReadBarcodeProps(this.file);

  late File? file;
  late num? scale = 1;
  late num? sequenceNum = 0;
  late String? password = '';
  late Future<String> Function()? onRequiredPassword;
}
