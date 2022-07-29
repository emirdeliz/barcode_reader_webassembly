declare module "helpers/global/GlobalHelper" {
    export const checkIsNodeEnvironment: () => boolean;
    export const checkIsTestEnvironment: () => boolean;
}
declare module "helpers/string/StringHelper" {
    export const splitStringBySegmentLength: (source: string, skipCharacterIndex: number, segmentLength: number) => string[];
    export const replaceByIndex: (target: string, replaceTo: string, startIndex: number, endIndex: number) => string;
    export const removeSpecialCaracteres: (str: string) => string;
    export const getNumbersOfString: (str: string) => string;
}
declare module "helpers/index" {
    export * from "helpers/barcode/BarcodeHelper";
    export * from "helpers/global/GlobalHelper";
    export * from "helpers/string/StringHelper";
}
declare module "barcode/CZBarEmscripten" {
    export const clockGetTime: (clkId: number, tp: number) => Promise<number>;
    export const fdWrite: (_fd: number, iov: number, iovcnt: number, pnum: number) => Promise<number>;
    export const emscriptenMemcpyBig: (dest: number, src: number, num: number) => Promise<void>;
    export const emscriptenResizeHeap: (requestedSize: number) => Promise<boolean>;
    export const updateGlobalBufferAndViews: (buffer: ArrayBuffer) => Promise<void>;
}
declare module "barcode/CZBarWasm" {
    export const checkIfCZBarIsRunningOnEnvironmentTestOrAsNode: () => boolean;
    export const CZBAR_WASM_BINARY_FILE = "barcode-reader.wasm";
    export interface CWasm {
        cGetMod: (barcode: number) => Promise<number>;
        cCalcCheckDigit: (segmentPtr: number, mod: number) => Promise<string>;
        cCheckIfBarcodeIsFromInsurance: (barcode: string) => Promise<number>;
    }
    export interface CZBarWasm {
        cZBarImageCreate: (width: number, height: number, hex: number, buf: number, len: number, sequenceNum: number) => number;
        cZBarImageScannerScanAndMaybeApplyCheckDigit: (ptr: number, byteOffset: number, ignorePix: number) => Promise<number>;
    }
    export interface CZBarBarcodeWasm extends CZBarWasm, CWasm {
        malloc: (size: number) => number;
        free: (pointer: number) => Promise<void>;
        memory: WebAssembly.Memory;
        print: () => void;
        printErr: () => void;
        arguments: Array<any>;
        buffer: ArrayBuffer;
        HEAP8: Int8Array;
        HEAP16: Int16Array;
        HEAP32: Int32Array;
        HEAPU8: Uint8Array;
        HEAPU16: Uint16Array;
        HEAPU32: Uint32Array;
        HEAPF32: Float32Array;
        HEAPF64: Float64Array;
    }
    export const getCZBarInstance: () => Promise<CZBarBarcodeWasm>;
}
declare module "barcode/CZBarBase" {
    import { CZBarBarcodeWasm } from "barcode/CZBarWasm";
    export class CZBarBase {
        protected ptr: number;
        protected inst: CZBarBarcodeWasm;
        protected constructor(ptr: number, inst: CZBarBarcodeWasm);
        protected checkAlive(): void;
        getPointer(): number;
    }
}
declare module "barcode/CZBarImage" {
    import { CZBarBase } from "barcode/CZBarBase";
    export class CZBarImage extends CZBarBase {
        static createFromGrayBuffer(width: number, height: number, dataBuf: ArrayBuffer, sequenceNum?: number): Promise<CZBarImage>;
    }
}
declare module "barcode/CZBarUtils" {
    export const arrayBufferToString: (buf: ArrayBuffer) => Promise<string>;
    export const stringToUTF8Array: (str: string, outU8Array: Uint8Array, outIdx: number, maxBytesToWrite: number) => number;
    export const lengthBytesUTF8: (str: string) => number;
    export const allocateUTF8: (str: string) => Promise<number>;
}
declare module "barcode/CZBarBarcode" {
    export const cZbarCheckIfBarcodeIsFromInsurance: (barcode: string) => Promise<boolean>;
    export const cGetMod: (barcode: string) => Promise<number>;
    export const calcheckDigit: (segment: string, mod: number) => Promise<string>;
}
declare module "barcode/CZBarModule" {
    export const scanBarcodeAndIgnorePix: (src?: File | string, scale?: number, sequenceNum?: number) => Promise<string>;
}
declare module "barcode/index" {
    export * from "barcode/CZBarWasm";
    export * from "barcode/CZBarImage";
    export * from "barcode/CZBarBarcode";
    export * from "barcode/CZBarBase";
    export * from "barcode/CZBarModule";
    export * from "barcode/CZBarUtils";
}
declare module "helpers/barcode/BarcodeHelper" {
    interface ReadBarCodeProps {
        file?: File;
        filePath?: string;
        scale?: number;
        sequenceNum?: number;
    }
    export const readBarcodeFromStack: (props: ReadBarCodeProps) => Promise<string>;
    export const readBarCode: ({ file, filePath, scale, sequenceNum, }: ReadBarCodeProps) => Promise<string>;
}
declare module "index" {
    export * from "helpers/barcode/BarcodeHelper";
}
