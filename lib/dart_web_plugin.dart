import 'package:barcode_reader_webassembly/barcode_reader_webassembly_constants.dart';
import 'package:js/js.dart';

@JS('jsOnEvent')
external set _jsOnEvent(void Function<T>(T event, JsEvent jsEvent) f);

@JS('jsInvokeMethod')
external Future<dynamic> jsInvokeMethod(String method, dynamic params);

class DartWebPlugin<T> {
  Function callback;
  DartWebPlugin(this.callback) {
    initialize();
  }

  void initialize() {
    _jsOnEvent = allowInterop(<T>(T params, JsEvent jsEvent) {
      handleJsCall(params as dynamic, jsEvent);
    });
  }

  handleJsCall(T params, JsEvent jsEvent) {
    callback(params, jsEvent);
  }
}
