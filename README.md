# barcode_reader_webassembly

This project is a wrapper for the project [Barcode Read - Ts and Webassembly](https://github.com/emirdeliz/barcode-reader-zbar-webassembly).

<img src="https://raw.githubusercontent.com/emirdeliz/barcode_reader_webassembly/master/docs/demo.gif" width="700" height="auto" alt="Barcode reader webassembly - example"/>

## Getting Started

You have to use two methods to read a barcode. 

| **Method**               | **Description**                                                                                                                                          |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **readBarcodeFromStack** | This method receives a ReadBarcodeProps and inserts the request on the stack of requests. This can be utils when you make multiple barcodes reads at the same. |
| **readBarcode**          | This method receives a ReadBarcodeProps and makes a simple read.                                                                                          |

About **ReadBarcodeProps**:

| **Prop**                   | **Type** | **Description**                                                       |
| -------------------------- | -------- | --------------------------------------------------------------------- |
| **file** (optional)        | boolean  | The file related to pdf file.                                         |
| **filePath** (optional)    | boolean  | The url related to pdf file.                                          |
| **scale** (optional)       | boolean  | The scale or zoom applied on the pdf document before search barcode.  |
| **sequenceNum** (optional) | Widget   | The sequence number of the image when working with multiple barcodes. |
