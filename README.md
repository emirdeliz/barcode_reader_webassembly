# barcode_reader_webassembly

This project is a wrapper for the project [Barcode Read - Ts and Webassembly.
](https://github.com/emirdeliz/barcode-reader-zbar-webassembly).
## Getting Started
You have to use two methods to read a barcode. 
**readBarcodeFromStack**: This method receives a ReadBarcodeProps and inserts the request on the stack of requests. This can be utils when you make multiple barcodes reads at the same.
**readBarcode**: This method receives a ReadBarcodeProps and makes a simple read.

About **ReadBarcodeProps**:

**file** (optional): The file related to pdf file 
**filePath** (optional): The url related to pdf file.
**scale** (optional): The scale or zoom applied on the pdf document before search barcode.
**sequenceNum** (optional): The sequence number of the image when working with multiple barcodes.