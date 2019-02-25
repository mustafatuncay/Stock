unit UntResizeimage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Dialogs, ComObj, ActiveX, ExtCtrls, ExtDlgs,PngImage, Jpeg, DB,
  ADODB, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP;

const
  WICBitmapCacheOnLoad = $2;
  WICDecodeMetadataCacheOnDemand = 0;

  SID_IPropertyBag2 = '{22F55882-280B-11d0-A8A9-00A0C90C2004}';
  SID_IWICComponentInfo = '{23BC3F0A-698B-4357-886B-F24D50671334}';
  SID_IWICBitmapSource = '{00000120-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICBitmap = '{00000121-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICBitmapLock = '{00000123-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICBitmapCodecInfo = '{E87A44C4-B76E-4c47-8B09-298EB12A2714}';
  SID_IWICBitmapEncoder = '{00000103-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICBitmapDecoder = '{9EDDE9E7-8DEE-47ea-99DF-E6FAF2ED44BF}';
  SID_IWICBitmapEncoderInfo = '{94C9B4EE-A09F-4f92-8A1E-4A9BCE7E76FB}';
  SID_IWICBitmapDecoderInfo = '{D8CD007F-D08F-4191-9BFC-236EA7F0E4B5}';
  SID_IWICBitmapFrameEncode = '{00000105-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICBitmapFrameDecode = '{3B16811B-6A43-4ec9-A813-3D930C13B940}';
  SID_IWICBitmapScaler = '{00000302-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICBitmapClipper = '{E4FBCF03-223D-4e81-9333-D635556DD1B5}';
  SID_IWICBitmapFlipRotator = '{5009834F-2D6A-41ce-9E1B-17C5AFF7A782}';
  SID_IWICPalette = '{00000040-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICColorContext = '{3C613A02-34B2-44ea-9A7C-45AEA9C6FD6D}';
  SID_IWICColorTransform = '{B66F034F-D0E2-40ab-B436-6DE39E321A94}';
  SID_IWICMetadataQueryReader = '{30989668-E1C9-4597-B395-458EEDB808DF}';
  SID_IWICMetadataQueryWriter = '{A721791A-0DEF-4d06-BD91-2118BF1DB10B}';
  SID_IWICFastMetadataEncoder = '{B84E2C09-78C9-4AC4-8BD3-524AE1663A2F}';
  SID_IWICStream = '{135FF860-22B7-4ddf-B0F6-218F4F299A43}';
  SID_IWICFormatConverter = '{00000301-a8f2-4877-ba0a-fd2b6645fb94}';
  SID_IWICImagingFactory = '{ec5ec8a9-c395-4314-9c77-54d7a935ff70}';
  // here's not TGUID type specified since the following formats are
  // used in the constant array of TGUID
  GUID_ContainerFormatBmp = '{0AF1D87E-FCFE-4188-BDEB-A7906471CBE3}';
  GUID_ContainerFormatGif = '{1F8A5601-7D4D-4CBD-9C82-1BC8D4EEB9A5}';
  GUID_ContainerFormatPng = '{1B7CFAF4-713F-473C-BBCD-6137425FAEAF}';
  GUID_ContainerFormatJpeg = '{19E4A5AA-5662-4FC5-A0C0-1758028E1057}';
  CLSID_WICImagingFactory: TGUID = '{CACAF262-9370-4615-A13B-9F5539DA4C0A}';

type
  PWICColor = ^TWicColor;
  TWICColor = Cardinal;
  PWICRect = ^TWICRect;
  TWICRect = record
    X: Integer;
    Y: Integer;
    Width: Integer;
    Height: Integer;
  end;
  PIWICColorContext = ^IWICColorContext;
  PWICBitmapPattern = ^TWICBitmapPattern;
  TWICBitmapPattern = record
    Position: ULARGE_INTEGER;
    Length: ULONG;
    Pattern: PByte;
    Mask: PByte;
    EndOfStream: BOOL;
  end;
  PPropBag2 = ^TPropBag2;
  TPropBag2 = record
    dwType: DWORD;
    vt: TVarType;
    cfType: TClipFormat;
    dwHint: DWORD;
    pstrName: POleStr;
    clsid: TCLSID;
  end;
  TWICBitmapInterpolationMode = (
    WICBitmapInterpolationModeNearestNeighbor = $00000000,
    WICBitmapInterpolationModeLinear = $00000001,
    WICBitmapInterpolationModeCubic = $00000002,
    WICBitmapInterpolationModeFant = $00000003
  );
  TWICBitmapEncoderCacheOption = (
    WICBitmapEncoderCacheInMemory = $00000000,
    WICBitmapEncoderCacheTempFile = $00000001,
    WICBitmapEncoderNoCache = $00000002
  );
  TWICInProcPointer = ^Byte;
  TWICPixelFormatGUID = TGUID;
  TREFWICPixelFormatGUID = PGUID;
  TWICComponentType = type Integer;
  TWICDecodeOptions = type Integer;
  TWICColorContextType = type Integer;
  TWICBitmapDitherType = type Integer;
  TWICBitmapPaletteType = type Integer;
  TWICBitmapTransformOptions = type Integer;
  TWICBitmapCreateCacheOption = type Integer;
  TWICBitmapAlphaChannelOption = type Integer;
  IPropertyBag2 = interface;
  IWICPalette = interface;
  IWICColorContext = interface;
  IWICColorTransform = interface;
  IWICBitmap = interface;
  IWICBitmapLock = interface;
  IWICBitmapSource = interface;
  IWICBitmapCodecInfo = interface;
  IWICBitmapEncoder = interface;
  IWICBitmapDecoder = interface;
  IWICBitmapEncoderInfo = interface;
  IWICBitmapDecoderInfo = interface;
  IWICBitmapFrameEncode = interface;
  IWICBitmapFrameDecode = interface;
  IWICBitmapScaler = interface;
  IWICBitmapClipper = interface;
  IWICBitmapFlipRotator = interface;
  IWICMetadataQueryReader = interface;
  IWICMetadataQueryWriter = interface;
  IWICFastMetadataEncoder = interface;
  IWICStream = interface;
  IWICComponentInfo = interface;
  IWICFormatConverter = interface;
  IWICImagingFactory = interface;

  IPropertyBag2 = interface(IUnknown)
    [SID_IPropertyBag2]
    function Read(pPropBag: PPropBag2; pErrLog: IErrorLog; pvarValue: PVariant; phrError: PHResult): HRESULT; stdcall;
    function Write(cProperties: ULONG; pPropBag: PPropBag2; pvarValue: PVariant): HRESULT; stdcall;
    function CountProperties(var pcProperties: ULONG): HRESULT; stdcall;
    function GetPropertyInfo(iProperty, cProperties: ULONG; pPropBag: PPropBag2; var pcProperties: ULONG): HRESULT; stdcall;
    function LoadObject(pstrName:POleStr; dwHint: DWORD; pUnkObject: IUnknown; pErrLog: IErrorLog): HRESULT; stdcall;
  end;
  IWICComponentInfo = interface(IUnknown)
    [SID_IWICComponentInfo]
    function GetComponentType(var pType: TWICComponentType): HRESULT; stdcall;
    function GetCLSID(var pclsid: TGUID): HRESULT; stdcall;
    function GetSigningStatus(var pStatus: DWORD): HRESULT; stdcall;
    function GetAuthor(cchAuthor: UINT; wzAuthor: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function GetVendorGUID(var pguidVendor: TGUID): HRESULT; stdcall;
    function GetVersion(cchVersion: UINT; wzVersion: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function GetSpecVersion(cchSpecVersion: UINT; wzSpecVersion: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function GetFriendlyName(cchFriendlyName: UINT; wzFriendlyName: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
  end;
  IWICBitmapSource = interface(IUnknown)
    [SID_IWICBitmapSource]
    function GetSize(var puiWidth: UINT; var puiHeight: UINT): HRESULT; stdcall;
    function GetPixelFormat(var pPixelFormat: TWICPixelFormatGUID): HRESULT; stdcall;
    function GetResolution(var pDpiX: Double; var pDpiY: Double): HRESULT; stdcall;
    function CopyPalette(pIPalette: IWICPalette): HRESULT; stdcall;
    function CopyPixels(prc: PWICRect; cbStride: UINT; cbBufferSize: UINT; pbBuffer: PByte): HRESULT; stdcall;
  end;
  IWICBitmap = interface(IWICBitmapSource)
    [SID_IWICBitmap]
    function Lock(const prcLock: TWICRect; flags: DWORD; out ppILock: IWICBitmapLock): HRESULT; stdcall;
    function SetPalette(pIPalette: IWICPalette): HRESULT; stdcall;
    function SetResolution(dpiX: Double; dpiY: Double): HRESULT; stdcall;
  end;
  IWICBitmapLock = interface(IUnknown)
    [SID_IWICBitmapLock]
    function GetSize(var puiWidth: UINT; var puiHeight: UINT): HRESULT; stdcall;
    function GetStride(var pcbStride: UINT): HRESULT; stdcall;
    function GetDataPointer(var pcbBufferSize: UINT; var ppbData: TWICInProcPointer): HRESULT; stdcall;
    function GetPixelFormat(var pPixelFormat: TWICPixelFormatGUID): HRESULT; stdcall;
  end;
  IWICBitmapCodecInfo = interface(IWICComponentInfo)
    [SID_IWICBitmapCodecInfo]
    function GetContainerFormat(var pguidContainerFormat: TGUID): HRESULT; stdcall;
    function GetPixelFormats(cFormats: UINT; var guidPixelFormats: PGUID; var pcActual: UINT): HRESULT; stdcall;
    function GetColorManagementVersion(cchColorManagementVersion: UINT; wzColorManagementVersion: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function GetDeviceManufacturer(cchDeviceManufacturer: UINT; wzDeviceManufacturer: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function GetDeviceModels(cchDeviceModels: UINT; wzDeviceModels: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function GetMimeTypes(cchMimeTypes: UINT; wzMimeTypes: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function GetFileExtensions(cchFileExtensions: UINT; wzFileExtensions: PWCHAR; var pcchActual: UINT): HRESULT; stdcall;
    function DoesSupportAnimation(var pfSupportAnimation: BOOL): HRESULT; stdcall;
    function DoesSupportChromakey(var pfSupportChromakey: BOOL): HRESULT; stdcall;
    function DoesSupportLossless(var pfSupportLossless: BOOL): HRESULT; stdcall;
    function DoesSupportMultiframe(var pfSupportMultiframe: BOOL): HRESULT; stdcall;
    function MatchesMimeType(wzMimeType: LPCWSTR; var pfMatches: BOOL): HRESULT; stdcall;
  end;
  IWICBitmapEncoder = interface(IUnknown)
    [SID_IWICBitmapEncoder]
    function Initialize(pIStream: IStream; cacheOption: TWICBitmapEncoderCacheOption): HRESULT; stdcall;
    function GetContainerFormat(var pguidContainerFormat: TGUID): HRESULT; stdcall;
    function GetEncoderInfo(out ppIEncoderInfo: IWICBitmapEncoderInfo): HRESULT; stdcall;
    function SetColorContexts(cCount: UINT; ppIColorContext: PIWICColorContext): HRESULT; stdcall;
    function SetPalette(pIPalette: IWICPalette): HRESULT; stdcall;
    function SetThumbnail(pIThumbnail: IWICBitmapSource): HRESULT; stdcall;
    function SetPreview(pIPreview: IWICBitmapSource): HRESULT; stdcall;
    function CreateNewFrame(out ppIFrameEncode: IWICBitmapFrameEncode; var ppIEncoderOptions: IPropertyBag2): HRESULT; stdcall;
    function Commit: HRESULT; stdcall;
    function GetMetadataQueryWriter(out ppIMetadataQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;
  IWICBitmapDecoder = interface(IUnknown)
    [SID_IWICBitmapDecoder]
    function QueryCapability(pIStream: IStream; var pdwCapability: DWORD): HRESULT; stdcall;
    function Initialize(pIStream: IStream; cacheOptions: TWICDecodeOptions): HRESULT; stdcall;
    function GetContainerFormat(var pguidContainerFormat: TGUID): HRESULT; stdcall;
    function GetDecoderInfo(out ppIDecoderInfo: IWICBitmapDecoderInfo): HRESULT; stdcall;
    function CopyPalette(pIPalette: IWICPalette): HRESULT; stdcall;
    function GetMetadataQueryReader(out ppIMetadataQueryReader: IWICMetadataQueryReader): HRESULT; stdcall;
    function GetPreview(out ppIBitmapSource: IWICBitmapSource): HRESULT; stdcall;
    function GetColorContexts(cCount: UINT; ppIColorContexts: PIWICColorContext; var pcActualCount : UINT): HRESULT; stdcall;
    function GetThumbnail(out ppIThumbnail: IWICBitmapSource): HRESULT; stdcall;
    function GetFrameCount(var pCount: UINT): HRESULT; stdcall;
    function GetFrame(index: UINT; out ppIBitmapFrame: IWICBitmapFrameDecode): HRESULT; stdcall;
  end;
  IWICBitmapEncoderInfo = interface(IWICBitmapCodecInfo)
    [SID_IWICBitmapEncoderInfo]
    function CreateInstance(out ppIBitmapEncoder: IWICBitmapEncoder): HRESULT; stdcall;
  end;
  IWICBitmapDecoderInfo = interface(IWICBitmapCodecInfo)
    [SID_IWICBitmapDecoderInfo]
    function GetPatterns(cbSizePatterns: UINT; pPatterns: PWICBitmapPattern; var pcPatterns: UINT; var pcbPatternsActual: UINT): HRESULT; stdcall;
    function MatchesPattern(pIStream: IStream; var pfMatches: BOOL): HRESULT; stdcall;
    function CreateInstance(out ppIBitmapDecoder: IWICBitmapDecoder): HRESULT; stdcall;
  end;
  IWICBitmapFrameEncode = interface(IUnknown)
    [SID_IWICBitmapFrameEncode]
    function Initialize(pIEncoderOptions: IPropertyBag2): HRESULT; stdcall;
    function SetSize(uiWidth: UINT; uiHeight: UINT): HRESULT; stdcall;
    function SetResolution(dpiX: Double; dpiY: Double): HRESULT; stdcall;
    function SetPixelFormat(var pPixelFormat: TWICPixelFormatGUID): HRESULT; stdcall;
    function SetColorContexts(cCount: UINT; ppIColorContext: PIWICColorContext): HRESULT; stdcall;
    function SetPalette(pIPalette: IWICPalette): HRESULT; stdcall;
    function SetThumbnail(pIThumbnail: IWICBitmapSource): HRESULT; stdcall;
    function WritePixels(lineCount: UINT; cbStride: UINT; cbBufferSize: UINT; pbPixels: PByte): HRESULT; stdcall;
    function WriteSource(pIBitmapSource: IWICBitmapSource; prc: PWICRect): HRESULT; stdcall;
    function Commit: HRESULT; stdcall;
    function GetMetadataQueryWriter(out ppIMetadataQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;
  IWICBitmapFrameDecode = interface(IWICBitmapSource)
    [SID_IWICBitmapFrameDecode]
    function GetMetadataQueryReader(out ppIMetadataQueryReader: IWICMetadataQueryReader): HRESULT; stdcall;
    function GetColorContexts(cCount: UINT; ppIColorContexts: PIWICColorContext; var pcActualCount : UINT): HRESULT; stdcall;
    function GetThumbnail(out ppIThumbnail: IWICBitmapSource): HRESULT; stdcall;
  end;
  IWICBitmapScaler = interface(IWICBitmapSource)
    [SID_IWICBitmapScaler]
    function Initialize(pISource: IWICBitmapSource; uiWidth: UINT; uiHeight: UINT; mode: TWICBitmapInterpolationMode): HRESULT; stdcall;
  end;
  IWICBitmapClipper = interface(IWICBitmapSource)
    [SID_IWICBitmapClipper]
    function Initialize(pISource: IWICBitmapSource; var prc: TWICRect): HRESULT; stdcall;
  end;
  IWICBitmapFlipRotator = interface(IWICBitmapSource)
    [SID_IWICBitmapFlipRotator]
    function Initialize(pISource: IWICBitmapSource; options: TWICBitmapTransformOptions): HRESULT; stdcall;
  end;
  IWICPalette = interface(IUnknown)
    [SID_IWICPalette]
    function InitializePredefined(ePaletteType: TWICBitmapPaletteType; fAddTransparentColor: BOOL): HRESULT; stdcall;
    function InitializeCustom(pColors: PWICColor; cCount: UINT): HRESULT; stdcall;
    function InitializeFromBitmap(pISurface: IWICBitmapSource; cCount: UINT; fAddTransparentColor: BOOL): HRESULT; stdcall;
    function InitializeFromPalette(pIPalette: IWICPalette): HRESULT; stdcall;
    function GetType(var pePaletteType: TWICBitmapPaletteType): HRESULT; stdcall;
    function GetColorCount(var pcCount: UINT): HRESULT; stdcall;
    function GetColors(cCount: UINT; pColors: PWICColor; var pcActualColors: UINT): HRESULT; stdcall;
    function IsBlackWhite(var pfIsBlackWhite: BOOL): HRESULT; stdcall;
    function IsGrayscale(var pfIsGrayscale: BOOL): HRESULT; stdcall;
    function HasAlpha(var pfHasAlpha: BOOL): HRESULT; stdcall;
  end;
  IWICColorContext = interface(IUnknown)
    [SID_IWICColorContext]
    function InitializeFromFilename(wzFilename: LPCWSTR): HRESULT; stdcall;
    function InitializeFromMemory(const pbBuffer: PByte; cbBufferSize: UINT): HRESULT; stdcall;
    function InitializeFromExifColorSpace(value: UINT): HRESULT; stdcall;
    function GetType(var pType: TWICColorContextType): HRESULT; stdcall;
    function GetProfileBytes(cbBuffer: UINT; pbBuffer: PByte; var pcbActual: UINT): HRESULT; stdcall;
    function GetExifColorSpace(var pValue: UINT): HRESULT; stdcall;
  end;
  IWICColorTransform = interface(IWICBitmapSource)
    [SID_IWICColorTransform]
    function Initialize(pIBitmapSource: IWICBitmapSource; pIContextSource: IWICColorContext; pIContextDest: IWICColorContext; pixelFmtDest: TREFWICPixelFormatGUID): HRESULT; stdcall;
  end;
  IWICMetadataQueryReader = interface(IUnknown)
    [SID_IWICMetadataQueryReader]
    function GetContainerFormat(var pguidContainerFormat: TGUID): HRESULT; stdcall;
    function GetLocation(cchMaxLength: UINT; wzNamespace: PWCHAR; var pcchActualLength: UINT): HRESULT; stdcall;
    function GetMetadataByName(wzName: LPCWSTR; var pvarValue: PROPVARIANT): HRESULT; stdcall;
    function GetEnumerator(out ppIEnumString: IEnumString): HRESULT; stdcall;
  end;
  IWICMetadataQueryWriter = interface(IWICMetadataQueryReader)
    [SID_IWICMetadataQueryWriter]
    function SetMetadataByName(wzName: LPCWSTR; const pvarValue: TPropVariant): HRESULT; stdcall;
    function RemoveMetadataByName(wzName: LPCWSTR): HRESULT; stdcall;
  end;
  IWICFastMetadataEncoder = interface(IUnknown)
    [SID_IWICFastMetadataEncoder]
    function Commit: HRESULT; stdcall;
    function GetMetadataQueryWriter(out ppIMetadataQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;
  IWICStream = interface(IStream)
    [SID_IWICStream]
    function InitializeFromIStream(pIStream: IStream): HRESULT; stdcall;
    function InitializeFromFilename(wzFileName: LPCWSTR; dwDesiredAccess: DWORD): HRESULT; stdcall;
    function InitializeFromMemory(pbBuffer: TWICInProcPointer; cbBufferSize: DWORD): HRESULT; stdcall;
    function InitializeFromIStreamRegion(pIStream: IStream; ulOffset: ULARGE_INTEGER; ulMaxSize: ULARGE_INTEGER): HRESULT; stdcall;
  end;
  IWICFormatConverter = interface(IWICBitmapSource)
    [SID_IWICFormatConverter]
    function Initialize(pISource: IWICBitmapSource; const dstFormat: TWICPixelFormatGUID; dither: TWICBitmapDitherType; const pIPalette: IWICPalette; alphaThresholdPercent: Double; paletteTranslate: TWICBitmapPaletteType): HRESULT; stdcall;
    function CanConvert(srcPixelFormat: TREFWICPixelFormatGUID; dstPixelFormat: TREFWICPixelFormatGUID; var pfCanConvert: BOOL): HRESULT; stdcall;
  end;
  IWICImagingFactory = interface(IUnknown)
    [SID_IWICImagingFactory]
    function CreateDecoderFromFilename(wzFilename: LPCWSTR; const pguidVendor: TGUID; dwDesiredAccess: DWORD; metadataOptions: TWICDecodeOptions; out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;
    function CreateDecoderFromStream(pIStream: IStream; const pguidVendor: TGUID; metadataOptions: TWICDecodeOptions; out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;
    function CreateDecoderFromFileHandle(hFile: ULONG_PTR; const pguidVendor: TGUID; metadataOptions: TWICDecodeOptions; out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;
    function CreateComponentInfo(const clsidComponent: TGUID; out ppIInfo: IWICComponentInfo): HRESULT; stdcall;
    function CreateDecoder(const guidContainerFormat: TGUID; const pguidVendor: TGUID; out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;
    function CreateEncoder(const guidContainerFormat: TGUID; const pguidVendor: TGUID; out ppIEncoder: IWICBitmapEncoder): HRESULT; stdcall;
    function CreatePalette(out ppIPalette: IWICPalette): HRESULT; stdcall;
    function CreateFormatConverter(out ppIFormatConverter: IWICFormatConverter): HRESULT; stdcall;
    function CreateBitmapScaler(out ppIBitmapScaler: IWICBitmapScaler): HRESULT; stdcall;
    function CreateBitmapClipper(out ppIBitmapClipper: IWICBitmapClipper): HRESULT; stdcall;
    function CreateBitmapFlipRotator(out ppIBitmapFlipRotator: IWICBitmapFlipRotator): HRESULT; stdcall;
    function CreateStream(out ppIWICStream: IWICStream): HRESULT; stdcall;
    function CreateColorContext(out ppIWICColorContext: IWICColorContext): HRESULT; stdcall;
    function CreateColorTransformer(out ppIWICColorTransform: IWICColorTransform): HRESULT; stdcall;
    function CreateBitmap(uiWidth: UINT; uiHeight: UINT; pixelFormat: TREFWICPixelFormatGUID; option: TWICBitmapCreateCacheOption; out ppIBitmap: IWICBitmap): HRESULT; stdcall;
    function CreateBitmapFromSource(pIBitmapSource: IWICBitmapSource; option: TWICBitmapCreateCacheOption; out ppIBitmap: IWICBitmap): HRESULT; stdcall;
    function CreateBitmapFromSourceRect(pIBitmapSource: IWICBitmapSource; x: UINT; y: UINT; width: UINT; height: UINT; out ppIBitmap: IWICBitmap): HRESULT; stdcall;
    function CreateBitmapFromMemory(uiWidth: UINT; uiHeight: UINT; const pixelFormat: TWICPixelFormatGUID; cbStride: UINT; cbBufferSize: UINT; pbBuffer: PByte; out ppIBitmap: IWICBitmap): HRESULT; stdcall;
    function CreateBitmapFromHBITMAP(hBitmap: HBITMAP; hPalette: HPALETTE; options: TWICBitmapAlphaChannelOption; out ppIBitmap: IWICBitmap): HRESULT; stdcall;
    function CreateBitmapFromHICON(hIcon: HICON; out ppIBitmap: IWICBitmap): HRESULT; stdcall;
    function CreateComponentEnumerator(componentTypes: DWORD; options: DWORD; out ppIEnumUnknown: IEnumUnknown): HRESULT; stdcall;
    function CreateFastMetadataEncoderFromDecoder(pIDecoder: IWICBitmapDecoder; out ppIFastEncoder: IWICFastMetadataEncoder): HRESULT; stdcall;
    function CreateFastMetadataEncoderFromFrameDecode(pIFrameDecoder: IWICBitmapFrameDecode; out ppIFastEncoder: IWICFastMetadataEncoder): HRESULT; stdcall;
    function CreateQueryWriter(const guidMetadataFormat: TGUID; const pguidVendor: TGUID; out ppIQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
    function CreateQueryWriterFromReader(pIQueryReader: IWICMetadataQueryReader; const pguidVendor: TGUID; out ppIQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;

type
  TFrmResizeimage = class(TForm)
    BtnResize: TButton;
    WidthEdit: TEdit;
    HeightEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    InputFileEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    OutputFileEdit: TEdit;
    EncoderTypeComboBox: TComboBox;
    Label5: TLabel;
    InterpolationModeComboBox: TComboBox;
    Label6: TLabel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    Button1: TButton;
    Button2: TButton;
    Qry1: TADOQuery;
    PnlProperties: TPanel;
    Image4: TImage;
    Image2: TImage;
    CmbimageType: TComboBox;
    Btninsert: TButton;
    Button4: TButton;
    PnlAgent: TPanel;
    Image3: TImage;
    Btninsert2: TButton;
    Button5: TButton;
    PnlProjectimage: TPanel;
    Image6: TImage;
    Btninsert3: TButton;
    Button7: TButton;
    CmbProimageType: TComboBox;
    Image5: TImage;
    PnlProject: TPanel;
    Image7: TImage;
    Btninsert4: TButton;
    Button6: TButton;    procedure BtnResizeClick(Sender: TObject);
    procedure EncoderTypeComboBoxChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
       FTmp: TBitmap;
        { Private declarations }
  public
  procedure CombineImage(const ATopLeftPos: TPoint;const AImgFileName: string);
  procedure SaveTempBitmap(const ADestFile: string);
  function  StrToCoord(AStr: string): TPoint;
  procedure DeleteDirectory(const Name: string);
  var ReferenceNo,TmpSayi,AgentNo,ProjectNo:String;

   { Public declarations }
  end;

var
  FrmResizeimage: TFrmResizeimage;

implementation

uses UntMenu;

{$R *.dfm}

type
  TEncoderType = (
    etBMP,
    etGIF,
    etPNG,
    etJPEG
  );
  TInterpolationMode = (
    imNearestNeighbour,
    imLinear,
    imCubic,
    imFant
  );

procedure ResizeImage(const Source, Target: WideString; Width, Height: Cardinal;
  EncoderType: TEncoderType; InterpolationMode: TInterpolationMode = imFant);
var
  FileStream: IWICStream;
  PropertyBag: IPropertyBag2;
  BitmapScaler: IWICBitmapScaler;
  BitmapDecoder: IWICBitmapDecoder;
  BitmapEncoder: IWICBitmapEncoder;
  BitmapFrameEncode: IWICBitmapFrameEncode;
  BitmapFrameDecode: IWICBitmapFrameDecode;
  ImagingFactory: IWICImagingFactory;
const
  EncoderFormat: array[TEncoderType] of TGUID = (GUID_ContainerFormatBmp,
    GUID_ContainerFormatGif, GUID_ContainerFormatPng, GUID_ContainerFormatJpeg);
begin
  OleCheck(CoCreateInstance(CLSID_WICImagingFactory, nil,
    CLSCTX_INPROC_SERVER or CLSCTX_LOCAL_SERVER, IUnknown, ImagingFactory));
  OleCheck(ImagingFactory.CreateDecoderFromFilename(PWideChar(Source),
    GUID_NULL, GENERIC_READ, WICDecodeMetadataCacheOnDemand, BitmapDecoder));
  OleCheck(BitmapDecoder.GetFrame(0, BitmapFrameDecode));
  OleCheck(ImagingFactory.CreateBitmapScaler(BitmapScaler));
  OleCheck(BitmapScaler.Initialize(BitmapFrameDecode, Width, Height,
    TWICBitmapInterpolationMode(InterpolationMode)));

  OleCheck(ImagingFactory.CreateStream(FileStream));
  OleCheck(FileStream.InitializeFromFilename(PWideChar(Target),
    GENERIC_WRITE));
  OleCheck(ImagingFactory.CreateEncoder(EncoderFormat[EncoderType], GUID_NULL,
    BitmapEncoder));
  OleCheck(BitmapEncoder.Initialize(FileStream, WICBitmapEncoderNoCache));
  PropertyBag := nil;
  OleCheck(BitmapEncoder.CreateNewFrame(BitmapFrameEncode, PropertyBag));
  OleCheck(BitmapFrameEncode.Initialize(PropertyBag));
  OleCheck(BitmapFrameEncode.WriteSource(BitmapScaler, nil));
  OleCheck(BitmapFrameEncode.Commit);
  OleCheck(BitmapEncoder.Commit);
end;

procedure TFrmResizeimage.Button1Click(Sender: TObject);
var
  S: string;
  vPos: TPoint;
begin
  if not OpenPictureDialog1.Execute then Exit;
  // ask for position of the source picture
  S := '500, 350';
  if not InputQuery('Top Left Corner Coordinate', 'Coord', S) then Exit;
  vPos := StrToCoord(S);

  CombineImage(vPos, OpenPictureDialog1.FileName);

  // show the combine result
  Image1.Picture.Graphic := FTmp;
end;

procedure TFrmResizeimage.Button2Click(Sender: TObject);
begin
  if FTmp=nil then
    raise Exception.Create('There is no temporary image to save');

  if not SavePictureDialog1.Execute then Exit;
  SaveTempBitmap(SavePictureDialog1.FileName);
end;

procedure TFrmResizeimage.Button4Click(Sender: TObject);

begin

DeleteDirectory('.\resimler');

OpenPictureDialog1.Execute();

InputFileEdit.Text := OpenPictureDialog1.FileName ;
image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

qry1.close;
qry1.sql.clear;
qry1.sql.add('Select no from images where pref=:pref ');
Qry1.Parameters.ParamByName('pref').Value := ReferenceNo ;
Qry1.Prepared := True;
qry1.open;

TmpSayi :=inttostr(qry1.recordcount+1);

OutputFileEdit.Text :=  '.\resimler\'+TmpSayi+'s'+ReferenceNo+'.jpg' ;
WidthEdit.Text  := '245' ;
HeightEdit.Text := '160' ;
BtnResize.Click;


OutputFileEdit.Text :=  '.\resimler\'+TmpSayi+'m'+ReferenceNo+'.jpg' ;
WidthEdit.Text  := '1024' ;
HeightEdit.Text := '760' ;
BtnResize.Click;



OutputFileEdit.Text :=  '.\resimler\'+TmpSayi+'b'+ReferenceNo+'.jpg' ;
WidthEdit.Text  := '1024' ;
HeightEdit.Text := '760' ;
BtnResize.Click;

CombineImage(StrToCoord('0,0'), OutputFileEdit.Text);
CombineImage(StrToCoord('500,300'), '.\watermark2.png');
SaveTempBitmap(OutputFileEdit.Text);

Btninsert.enabled := True ;



///////////////////////////////////////////////////


end;

procedure TFrmResizeimage.Button5Click(Sender: TObject);
begin

DeleteDirectory('.\resimler');

OpenPictureDialog1.Execute();

InputFileEdit.Text := OpenPictureDialog1.FileName ;
image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);


OutputFileEdit.Text :=  '.\resimler\'+'s'+AgentNo+'.jpg' ;
WidthEdit.Text  := '245' ;
HeightEdit.Text := '160' ;
BtnResize.Click;


Btninsert2.enabled := True ;


///////////////////////////////////////////////////


end;

procedure TFrmResizeimage.Button6Click(Sender: TObject);
begin
DeleteDirectory('.\resimler');

OpenPictureDialog1.Execute();

InputFileEdit.Text := OpenPictureDialog1.FileName ;
image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);


OutputFileEdit.Text :=  '.\resimler\s'+ProjectNo+'.jpg' ;
WidthEdit.Text  := '245' ;
HeightEdit.Text := '160' ;
BtnResize.Click;

OutputFileEdit.Text :=  '.\resimler\b'+ProjectNo+'.jpg' ;
WidthEdit.Text  := '1024' ;
HeightEdit.Text := '760' ;
BtnResize.Click;



Btninsert4.enabled := True ;



///////////////////////////////////////////////////

end;

procedure TFrmResizeimage.Button7Click(Sender: TObject);
begin

DeleteDirectory('.\resimler');

OpenPictureDialog1.Execute();

InputFileEdit.Text := OpenPictureDialog1.FileName ;
image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

qry1.close;
qry1.sql.clear;
qry1.sql.add('Select no from proimages where pref=:pref ');
Qry1.Parameters.ParamByName('pref').Value := ProjectNo ;
Qry1.Prepared := True;
qry1.open;

TmpSayi :=inttostr(qry1.recordcount+1);

OutputFileEdit.Text :=  '.\resimler\'+TmpSayi+'s'+ProjectNo+'.jpg' ;
WidthEdit.Text  := '245' ;
HeightEdit.Text := '160' ;
BtnResize.Click;


OutputFileEdit.Text :=  '.\resimler\'+TmpSayi+'m'+ProjectNo+'.jpg' ;
WidthEdit.Text  := '1024' ;
HeightEdit.Text := '760' ;
BtnResize.Click;



OutputFileEdit.Text :=  '.\resimler\'+TmpSayi+'b'+ProjectNo+'.jpg' ;
WidthEdit.Text  := '1024' ;
HeightEdit.Text := '760' ;
BtnResize.Click;

CombineImage(StrToCoord('0,0'), OutputFileEdit.Text);
CombineImage(StrToCoord('500,300'), '.\watermark2.png');
SaveTempBitmap(OutputFileEdit.Text);

Btninsert3.enabled := True ;



///////////////////////////////////////////////////

end;

procedure TFrmResizeimage.CombineImage(const ATopLeftPos: TPoint;
  const AImgFileName: string);
var
  vPic: TPicture;
  vSrc: TGraphic;
  vMinWidth : Integer;
  vMinHeight: Integer;
begin
  // check if the given file does exist or not, raise exception when not.
  if not FileExists(AImgFileName) then
    raise Exception.Create('The supplied image file does not exists');

  vPic := TPicture.Create; // init our simple class factory
  try
    {LoadSrcImageFromFile}
    // load the image file name to our class factory. Let it decide actual
    // graphic class to instantiate for the image.
    vPic.LoadFromFile(AImgFileName);
    vSrc := vPic.Graphic;

    {SetupTempBitmap}
    if FTmp=nil then
      FTmp := TBitmap.Create;

    {AdjustTempBitmapDimension(vPos, FSrc);}
    // make sure the dimension of our temp bitmap accomodates the dimension
    // of the source when placed at the designated position.
    vMinWidth  := ATopLeftPos.X + vSrc.Width;
    vMinHeight := ATopLeftPos.Y + vSrc.Height;

    if FTmp.Width < vMinWidth then
      FTmp.Width := vMinWidth;

    if FTmp.Height < vMinHeight then
      FTmp.Height := vMinHeight;

    {DrawSrcImageToTempBitmap}
    FTmp.Canvas.Draw(ATopLeftPos.X, ATopLeftPos.Y, vSrc);

  finally
    vPic.Free;
  end;
end;


procedure TFrmResizeimage.DeleteDirectory(const Name: string);
var
  F: TSearchRec;
begin
  if FindFirst(Name + '\*', faAnyFile, F) = 0 then begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then begin
          if (F.Name <> '.') and (F.Name <> '..') then begin
            DeleteDirectory(Name + '\' + F.Name);
          end;
        end else begin
          DeleteFile(Name + '\' + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
   // RemoveDir(Name);
  end;
end;


procedure TFrmResizeimage.EncoderTypeComboBoxChange(Sender: TObject);
var
  S: string;
begin
  case EncoderTypeComboBox.ItemIndex of
    0: S := '.bmp';
    1: S := '.gif';
    2: S := '.png';
    3: S := '.jpg';
  end;
  OutputFileEdit.Text := ChangeFileExt(OutputFileEdit.Text, S);
end;

procedure TFrmResizeimage.BtnResizeClick(Sender: TObject);
var
  NewWidth, NewHeight: Integer;
begin
  if TryStrToInt(WidthEdit.Text, NewWidth) and
    TryStrToInt(HeightEdit.Text, NewHeight)
  then
    ResizeImage(InputFileEdit.Text, OutputFileEdit.Text, NewWidth, NewHeight,
      TEncoderType(EncoderTypeComboBox.ItemIndex),
      TInterpolationMode(InterpolationModeComboBox.ItemIndex));
end;

procedure TFrmResizeimage.SaveTempBitmap(const ADestFile: string);
var
  vExt: string;
  vGraphic: TGraphic;
begin
  if FTmp=nil then
    raise Exception.Create('There is no temporary image to save');

  vExt := LowerCase(ExtractFileExt(ADestFile));

  if vExt='.jpg' then
    vGraphic := TJPEGImage.Create
  else if vExt='.png' then
    vGraphic := TPNGObject.Create
  else if vExt='.ico' then
    vGraphic := TIcon.Create
  else if (vExt='') or (vExt='.bmp') then
    vGraphic := TBitmap.Create
  else
    raise Exception.Create('Unsupported format');

  try
    vGraphic.Assign(FTmp);
    vGraphic.SaveToFile(ADestFile);
  finally
    vGraphic.Free;
  end;
end;


function TFrmResizeimage.StrToCoord(AStr: string): TPoint;
var
  i: Integer;
begin
  i := System.Pos(',', AStr);
  if i < 2 then
    raise Exception.Create('Invalid input value for coordinate');

  Result.X := StrToInt(Trim(Copy(AStr, 1, i-1)));
  Result.Y := StrToInt(Trim(Copy(AStr, i+1, MAXINT)));
end;

end.
