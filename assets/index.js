const Methods = {
	readBarcode: 'readBarcode',
	readBarcodeFromStack: 'readBarcodeFromStack',
};

window.jsInvokeMethod = async (method, barcodeProps) => {
	switch (method) {
		case Methods.readBarcode: {
			window.BarcodeReader.readBarcode(barcodeProps);
			break;
		}
		case Methods.readBarcodeFromStack: {
			window.BarcodeReader.readBarcodeFromStack(barcodeProps);
			break;
		}
	}
};

function callDart(e) {
	window.jsOnEvent(e);
}
