# barcode_reader_webassembly

This project is a wrapper for the project [Barcode Read - Ts and Webassembly.
](https://github.com/emirdeliz/barcode-reader-zbar-webassembly).

## Getting Started
You have to use two methods to read a barcode. 

| **Method** | **Description**                                                                                                                                                |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **readBarcodeFromStack** | This method receives a ReadBarcodeProps and inserts the request on the stack of requests. This can be utils when you make multiple barcodes reads at the same. |
| **readBarcode** | This method receives a ReadBarcodeProps and makes a simple read. |

About **ReadBarcodeProps**:

| **Prop**  | **Type** | **Description** |
|-----------|----------|---------------------------------------------------------------------|
| **top**   | boolean  | Define the priority to open the menu on **_top_** of the trigger. |
| **left**  | boolean  | Define the priority to open the menu on **_left_** of the trigger. |
| **right** | boolean  | Define the priority to open the menu on **_right_** of the trigger. |
| **child** | Widget   | Trigger widget (like ElevatedButton, Text and etc...). |
| **items** | List>    | Menu options. |
