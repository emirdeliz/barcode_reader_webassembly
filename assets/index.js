const Methods = {
	readBarcode: 'readBarcode',
	readBarcodeFromStack: 'readBarcodeFromStack',
};

window.jsInvokeMethod = async ({ methodTarget, arguments, file }) => {
	const barcodeReaderParams = {
		...arguments,
		file,
	};

	console.log({
		barcodeReaderParams,
		methodTarget,
	});

	const result = {
		methodTarget,
		arguments: '',
	};
	switch (methodTarget) {
		case Methods.readBarcode: {
			result.arguments = await window.BarcodeReader.readBarcode(
				barcodeReaderParams
			);
			break;
		}
		case Methods.readBarcodeFromStack: {
			result.arguments = await window.BarcodeReader.readBarcodeFromStack(
				barcodeReaderParams
			);
			break;
		}
		default: {
			result.arguments = `Unknown dart method: '${methodTarget}'`;
			break;
		}
	}


	print({ result });
	return result;
};
