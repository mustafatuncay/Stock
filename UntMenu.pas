unit UntMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, StdCtrls, AdvPageControl, ComCtrls,
   Grids, AdvObj, BaseGrid, AdvGrid, AdvMenus, Menus,
   tmsAdvGridExcel, Planner, CheckLst, Buttons, DB, ADODB,registry,Shellapi,
  ExtDlgs,Jpeg,DateUtils, asgprev, AdvGlassButton, DBCtrls,
  MoneyEdit, OleCtrls, SHDocVw, XPMan,JclGraphics,strutils,IdSMTP,IdMessage,IdText,IdAttachment,
  CategoryButtons, ButtonGroup, ImgList,
   ActnList, ToolWin, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, RpDefine, RpRender, RpRenderHTML,ComObj,ActiveX, AdvSplitter, DBGrids, AdvEdit,
  AdvMoneyEdit, QuickRpt,math, AdvSmoothPanel, TeEngine, Series, TeeProcs, Chart,UrlMon;


type
  TFrmMenu = class(TForm)
    AdvGridExcel: TAdvGridExcelIO;
    Qry1: TADOQuery;
    Cnn1: TADOConnection;
    Cnn2: TADOConnection;
    Qry2: TADOQuery;
    AdvPreview: TAdvPreviewDialog;
    PopupMenu1: TPopupMenu;
    PopGeriiade: TMenuItem;
    PopupMenu2: TPopupMenu;
    Sil1: TMenuItem;
    Panel12: TPanel;
    Panel13: TPanel;
    PnlCizgiAlt: TPanel;
    XPManifest1: TXPManifest;
    Image15: TImage;
    Label105: TLabel;
    BtnYonetim: TLabel;
    BtnStokGiris: TLabel;
    BtnRapor: TLabel;
    Ds1: TDataSource;
    Panel4: TPanel;
    Image10: TImage;
    Image5: TImage;
    Image6: TImage;
    imgLogo: TImage;
    Label115: TLabel;
    Label116: TLabel;
    Sayfalar: TPageControl;
    Login: TTabSheet;
    Yonetim: TTabSheet;
    Rapor: TTabSheet;
    Image3: TImage;
    Memo1: TMemo;
    Panel26: TPanel;
    TxtKullanici00: TEdit;
    Label134: TLabel;
    Label135: TLabel;
    TxtSifre00: TEdit;
    btngiris: TButton;
    Panel2: TPanel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Bevel2: TBevel;
    imgResim10: TImage;
    AdvYonetim10: TAdvStringGrid;
    Chk0: TCheckBox;
    Chk1: TCheckBox;
    Chk2: TCheckBox;
    Chk3: TCheckBox;
    AdvListe10: TAdvStringGrid;
    BtnKaydet10: TButton;
    BtnGuncelle10: TButton;
    BtnSil10: TButton;
    TxtAdi10: TEdit;
    TxtSoyadi10: TEdit;
    TxtKullaniciAdi10: TEdit;
    TxtSifre10: TEdit;
    TxtTekrarSifre10: TEdit;
    BtnTemizle10: TButton;
    ChkAdmin10: TCheckBox;
    TxtUnvan10: TEdit;
    TxtBolum10: TEdit;
    Button10: TButton;
    Label26: TLabel;
    SaveDialog1: TSaveDialog;
    OpenDialog: TOpenDialog;
    Tedarikci: TTabSheet;
    BtnTedarikci: TLabel;
    StokGiris: TTabSheet;
    BtnMusteri: TLabel;
    Welcome: TTabSheet;
    LblKullanici: TLabel;
    imgKullanici: TImage;
    RaporKriter: TPageControl;
    PCStok: TTabSheet;
    TxtRStokAdi: TEdit;
    PcSatis: TTabSheet;
    PcTedarikci: TTabSheet;
    Image9: TImage;
    Musteri: TTabSheet;
    BtnSatis: TLabel;
    Label57: TLabel;
    TxtMAdi: TEdit;
    Label59: TLabel;
    TxtMTelNo: TEdit;
    Label60: TLabel;
    TxtMEmail: TEdit;
    PcMusteri: TTabSheet;
    MemMNotlar: TMemo;
    Label61: TLabel;
    CmbRMusteri: TComboBox;
    TxtRMusteri: TEdit;
    Panel7: TPanel;
    Panel15: TPanel;
    CmbRapor: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    AdvRapor: TAdvStringGrid;
    Label45: TLabel;
    BtnTTemizle: TButton;
    BtnTSil: TButton;
    BtnTGuncelle: TButton;
    BtnTKaydet: TButton;
    TxtTedarikci: TEdit;
    Label2: TLabel;
    TxtTelNo: TEdit;
    Label9: TLabel;
    TxtEmail: TEdit;
    MemAciklama: TMemo;
    Label10: TLabel;
    AdvStok: TAdvStringGrid;
    Panel1: TPanel;
    BtnStKaydet: TButton;
    BtnStGuncelle: TButton;
    BtnStSil: TButton;
    BtnStTemizle: TButton;
    Satis: TTabSheet;
    Panel3: TPanel;
    AdvSatis: TAdvStringGrid;
    BtnMKaydet: TButton;
    BtnMGuncelle: TButton;
    BtnMSil: TButton;
    BtnMTemizle: TButton;
    Panel5: TPanel;
    BtnSTemizle: TButton;
    BtnSiptal: TButton;
    BtnSKaydet: TButton;
    Label12: TLabel;
    CurrSGenelToplam: TMoneyEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CmbRTedarikci: TComboBox;
    TxtRRTedarikci: TEdit;
    Label19: TLabel;
    TxtRTedarikci: TEdit;
    Label20: TLabel;
    TxtFaturaNo: TEdit;
    DtAlimTarihi: TDateTimePicker;
    Label22: TLabel;
    CmbTedarikci: TComboBox;
    Label23: TLabel;
    CmbMusteri: TComboBox;
    Label24: TLabel;
    Label1: TLabel;
    CurrSOdeme: TMoneyEdit;
    Label11: TLabel;
    CurrSKalan: TMoneyEdit;
    Hesaplar: TTabSheet;
    AdvHesaplar: TAdvStringGrid;
    Label27: TLabel;
    CmbSOdemeTuru: TComboBox;
    TxtSCekNo: TEdit;
    Label29: TLabel;
    CurrGenelToplam: TMoneyEdit;
    PcHesaplar: TTabSheet;
    Label30: TLabel;
    TxtRFaturaNo: TEdit;
    Image12: TImage;
    Label31: TLabel;
    CmbRCariHesap: TComboBox;
    RbRMusteri: TRadioButton;
    RbRTedarikci: TRadioButton;
    TxtTedarikciX: TEdit;
    CmbStokAdi: TComboBox;
    PcStokFiyatMiktar: TTabSheet;
    Label32: TLabel;
    TxtRFStokAdi: TEdit;
    BtnHesaplar: TLabel;
    CmbKdvSatis: TComboBox;
    CmbSatisFiyat: TComboBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    CmbBirim: TComboBox;
    Panel6: TPanel;
    Label13: TLabel;
    Label18: TLabel;
    Label25: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    CurrMiktar: TMoneyEdit;
    CmbHCariHesap: TComboBox;
    TxtAciklama: TEdit;
    RbHMusteri: TRadioButton;
    RbHTedarikci: TRadioButton;
    Button2: TButton;
    CmbHOdemeTuru: TComboBox;
    TxtHCekNo: TEdit;
    CmbBorcAlacak: TComboBox;
    DtH1: TDateTimePicker;
    DtH2: TDateTimePicker;
    Label35: TLabel;
    Label36: TLabel;
    CmbRFMusteri: TComboBox;
    Panel8: TPanel;
    BtnSYazdir: TButton;
    Label28: TLabel;
    Label37: TLabel;
    DtSCekTarihi: TDateTimePicker;
    Analiz: TTabSheet;
    PageControl1: TPageControl;
    Grafik1: TTabSheet;
    Chart1: TChart;
    Series1: TBarSeries;
    AdvSmoothPanel2: TAdvSmoothPanel;
    Label38: TLabel;
    Dt1Grafik1: TDateTimePicker;
    Dt2Grafik1: TDateTimePicker;
    Button1: TButton;
    Button3: TButton;
    Grafik2: TTabSheet;
    Chart2: TChart;
    DBGrid1: TDBGrid;
    BarSeries1: TBarSeries;
    Series2: TBarSeries;
    AdvSmoothPanel1: TAdvSmoothPanel;
    Label40: TLabel;
    Dt1Gragik2: TDateTimePicker;
    Dt2Gragik2: TDateTimePicker;
    Button4: TButton;
    Button5: TButton;
    BtnAnaliz: TLabel;
    Label39: TLabel;
    DtHCekTarihi: TDateTimePicker;
    Label41: TLabel;
    TxtRCekNo: TEdit;
    DtRCekTarihi: TDateTimePicker;
    ChkRCekTarihi: TCheckBox;
    ChkRFiptal: TCheckBox;
    TxtRfSatisNo: TEdit;
    Label42: TLabel;
    DtR1: TDateTimePicker;
    DtR2: TDateTimePicker;
    Label43: TLabel;
    DtRCekTarihi2: TDateTimePicker;
    Button6: TButton;
    RbRGenelGiderler: TRadioButton;
    RbHGenelGiderler: TRadioButton;
    Label44: TLabel;
    CurrSindirimoran: TMoneyEdit;
    Label46: TLabel;
    CurrSGenelToplam2: TMoneyEdit;
    LblSatisNo: TLabel;
    TxtSevkNo: TEdit;
    ChkSevkNo: TCheckBox;
    ChkFaturaNo: TCheckBox;
    CmbMParaBirimi: TComboBox;
    Label21: TLabel;
    CmbTParaBirimi: TComboBox;
    Label47: TLabel;
    CmbTPbirimi: TComboBox;
    CmbMPbirimi: TComboBox;
    CmbHParabirimi: TComboBox;
    CmbRParabirimi: TComboBox;
    Label48: TLabel;
    TxtRSevkNo: TEdit;
    Panel9: TPanel;
    ChkBitmekUzere: TCheckBox;
    Label49: TLabel;
    TxtRxStokadi: TEdit;
    TxtSAciklama: TEdit;
    Label50: TLabel;
    PnlStokFiyat: TPanel;
    Label51: TLabel;
    BitBtn10: TBitBtn;
    Button7: TButton;
    CurrFiyatOran: TMoneyEdit;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    SatFiyatnDeitir1: TMenuItem;
    DeitirilenFiyatlarGeriAl1: TMenuItem;
    CheckBox1: TCheckBox;
    MemDoviz: TMemo;
    BtnDoviz: TButton;
    AdvDoviz: TAdvStringGrid;
    PnlVersion: TPanel;
    CmbParabirimi: TComboBox;
    CheckBox2: TCheckBox;
    ChkGeriiade: TCheckBox;
    PnlGeriiade: TPanel;
    AdvGeriiade: TAdvStringGrid;
    Button8: TButton;
    BitBtn1: TBitBtn;
    PcSatisOzet: TTabSheet;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    CmbRFMusteriOzet: TComboBox;
    ChkRFiptalOzet: TCheckBox;
    TxtRfSatisNoOzet: TEdit;
    TxtRxStokadiOzet: TEdit;
    ChkGeriiadeOzet: TCheckBox;
    BitBtn9: TBitBtn;
    Label55: TLabel;
    CurrSEmek: TMoneyEdit;
    Button9: TButton;
    TabSheet1: TTabSheet;
    AdvSmoothPanel3: TAdvSmoothPanel;
    Label56: TLabel;
    Dt1Gragik3: TDateTimePicker;
    Dt2Gragik3: TDateTimePicker;
    Button11: TButton;
    Button12: TButton;
    Chart3: TChart;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    Chart3Tedarikci: TComboBox;
    DevredenBakiye: TMoneyEdit;
    TabSheet2: TTabSheet;
    AdvSmoothPanel4: TAdvSmoothPanel;
    Button13: TButton;
    Button14: TButton;
    Chart4: TChart;
    BarSeries4: TBarSeries;
    ChkTumCiro: TCheckBox;
    Series3: TBarSeries;
    Chart3Musteri: TComboBox;
    RbChart3Tedarikci: TRadioButton;
    RbChart3Musteri: TRadioButton;
    PnlGeriiadeStok: TPanel;
    AdvGeriiadeStok: TAdvStringGrid;
    Button15: TButton;
    BitBtn11: TBitBtn;
    PopupMenu5: TPopupMenu;
    MenuItem1: TMenuItem;
    Label58: TLabel;
    Dt1G4: TDateTimePicker;
    Dt2G4: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure AdvYonetim10CanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure AdvSurec04GetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure AdvSurec04CanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure BtnKaydet10Click(Sender: TObject);
    procedure Chk0Click(Sender: TObject);
    procedure Chk1Click(Sender: TObject);
    procedure Chk2Click(Sender: TObject);
    procedure Chk3Click(Sender: TObject);
    procedure BtnGuncelle10Click(Sender: TObject);
    procedure BtnTemizle10Click(Sender: TObject);
    procedure AdvListe10DblClick(Sender: TObject);
    procedure BtnSil10Click(Sender: TObject);

    procedure TxtSifre00KeyPress(Sender: TObject; var Key: Char);
    procedure btngirisClick(Sender: TObject);
    procedure BtnYonetimClick(Sender: TObject);
    procedure BtnRaporClick(Sender: TObject);
    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

    procedure BtnTedarikciClick(Sender: TObject);
    procedure BtnMusteriClick(Sender: TObject);
    procedure BtnABold2Click(Sender: TObject);
    procedure CmbRaporChange(Sender: TObject);
    procedure BtnMKaydetClick(Sender: TObject);
    procedure BtnMSilClick(Sender: TObject);
    procedure BtnMTemizleClick(Sender: TObject);
    procedure BtnMGuncelleClick(Sender: TObject);
    procedure BtnSatisClick(Sender: TObject);
    procedure AdvRaporGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStokGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure BtnStKaydetClick(Sender: TObject);
    procedure BtnStTemizleClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnStGuncelleClick(Sender: TObject);
    procedure BtnStSilClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure AdvRaporDblClick(Sender: TObject);
    procedure AdvStokGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStokCellsChanged(Sender: TObject; R: TRect);
    procedure BtnTKaydetClick(Sender: TObject);
    procedure BtnTSilClick(Sender: TObject);
    procedure BtnTGuncelleClick(Sender: TObject);
    procedure BtnTTemizleClick(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure RbHMusteriClick(Sender: TObject);
    procedure RbHTedarikciClick(Sender: TObject);
    procedure RbRMusteriClick(Sender: TObject);
    procedure RbRTedarikciClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnStokGirisClick(Sender: TObject);
    procedure BtnHesaplarClick(Sender: TObject);
    procedure AdvSatisGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure AdvSatisCellsChanged(Sender: TObject; R: TRect);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BtnSKaydetClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CmbHCariHesapChange(Sender: TObject);
    procedure CurrSOdemeChange(Sender: TObject);
    procedure BtnSTemizleClick(Sender: TObject);
    procedure BtnSiptalClick(Sender: TObject);
    procedure BtnSYazdirClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnAnalizClick(Sender: TObject);
    procedure AdvHesaplarGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Button6Click(Sender: TObject);
    procedure RbRGenelGiderlerClick(Sender: TObject);
    procedure RbHGenelGiderlerClick(Sender: TObject);
    procedure TxtRFaturaNoKeyPress(Sender: TObject; var Key: Char);
    procedure TxtRStokAdiKeyPress(Sender: TObject; var Key: Char);
    procedure TxtRTedarikciKeyPress(Sender: TObject; var Key: Char);
    procedure TxtRFStokAdiKeyPress(Sender: TObject; var Key: Char);
    procedure CmbRFMusteriKeyPress(Sender: TObject; var Key: Char);
    procedure TxtRfSatisNoKeyPress(Sender: TObject; var Key: Char);
    procedure TxtRRTedarikciKeyPress(Sender: TObject; var Key: Char);
    procedure TxtRMusteriKeyPress(Sender: TObject; var Key: Char);
    procedure CmbRCariHesapKeyPress(Sender: TObject; var Key: Char);
    procedure TxtRCekNoKeyPress(Sender: TObject; var Key: Char);
    procedure CurrSindirimoranChange(Sender: TObject);
    procedure AdvHesaplarDblClick(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure ChkFaturaNoClick(Sender: TObject);
    procedure ChkSevkNoClick(Sender: TObject);
    procedure CmbTedarikciChange(Sender: TObject);
    procedure CmbMusteriChange(Sender: TObject);
    procedure AdvRaporCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure SatFiyatnDeitir1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure DeitirilenFiyatlarGeriAl1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BtnDovizClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure PopGeriiadeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure AdvGeriiadeCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure AdvGeriiadeCellsChanged(Sender: TObject; R: TRect);
    procedure Sil1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure CurrSEmekChange(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ChkTumCiroClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure RbChart3TedarikciClick(Sender: TObject);
    procedure RbChart3MusteriClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure AdvGeriiadeStokCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure AdvGeriiadeStokCellsChanged(Sender: TObject; R: TRect);
    procedure TxtRxStokadiKeyPress(Sender: TObject; var Key: Char);
  private
     FTmp: TBitmap;
    { Private declarations }
  public

   procedure CizgiGetirUst(TmpBtn:TLabel;TmpPage:TTabSheet); { Public declarations }
   Procedure CizgiGetirAlt(TmpBtn:TLabel;TmpPage:TTabSheet);
   procedure StretchImage(var Image1: TImage;StretchType: Byte; NewWidth, NewHeight: Word;TmpSelf:TForm);
   Procedure YonetimCiz;
   procedure ResimKaydet(Fform:Tform ; Field:string;TmpTag:integer);
   procedure ResimYukle(img:Timage ; Field:string; TmpDMQRY:TADOQuery);
   procedure SetDBbinary(filename,Field:string;TmpDMQRY:TADOQuery);
   procedure GetDBbinary(filename, Field: string; TmpDMQRY: TADOQuery);
   procedure YonetimGetir;
   procedure CombineImage(const ATopLeftPos: TPoint; const AImgFileName: string);
   function StrToCoord(AStr: string): TPoint;
   procedure DeleteDirectory(const Name: string);
   Procedure StokGetir (TmpVar:String;TmpVar2:String);
   Procedure HesaplarListele;
   procedure StokListele;
   procedure TedarikciListele;
   procedure MusteriListele;
   procedure MusteriGetir;
   procedure tedarikcigetir;
   procedure StokFiyatMiktarListele ;
   procedure CmbStokAdiGetir;
   procedure CmbTedarikciGetir;
   procedure CmbMusteriGetir;
   Function TmpRound(Sayi:Currency):Currency;
   procedure HesapGetir;
   procedure SatisListele;
   procedure SatisOzetListele;
   procedure SatisGetir (TmpVar:String);
   function DownloadFile(SourceFile, DestFile: string): Boolean;

   var CurrentPatika,Kullanici,PubEvrakTuru,Yonetimid,PubCheck:String;
   TmpS,PubAdmin,PubResimSayisi,PubResimSayisi2,TmpPastindex,Kullaniciid:integer;
    IgnoreChanges:Boolean;
    FontName,PubAgentName,PubRLocation: String;
    FontSize,PubTemp:Integer;

    AlisDolar,AlisEuro,AlisSterlin : Currency;
  end;

var
  FrmMenu: TFrmMenu;

implementation




uses   UntResizeimage, RepPropertyEN, RepPropertyEN2, RepPropertyTR,
  RepPropertyTR2, UntKontrol, RepHesaplar;
const
  TEXT_BOLD          = 1;
  TEXT_ITALIC        = 2;
  TEXT_UNDERLINE     = 3;
  TEXT_APPLYFONTNAME = 4;
  TEXT_APPLYFONT     = 5;
  TEXT_APPLYFONTSIZE = 6;
  TEXT_COLOR         = 7;
  TEXT_BACKCOLOR     = 8;
  // Parameters for ApplyParaStyleConversion
  PARA_ALIGNMENT = 1;
  PARA_INDENTINC = 2;
  PARA_INDENTDEC = 3;
  PARA_COLOR     = 4;

{$R *.dfm}



procedure TFrmMenu.btngirisClick(Sender: TObject);
var i:integer;
TmpSql:String;
begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select * from Yonetim where KullaniciAdi=:KullaniciAdi and Sifre=:Sifre ');
Qry1.Parameters.ParamByName('KullaniciAdi').Value  := TxtKullanici00.Text;
Qry1.Parameters.ParamByName('Sifre').Value  := Txtsifre00.Text;
qry1.prepared := True ;
qry1.Open;

if qry1.Recordcount=0 then begin
showmessage('Lütfen Tekrar Deneyiniz ... ');
exit;
end;


if qry1.fieldbyname('P1').asstring <> 'Y'  then BtnMusteri.enabled := False ;
if qry1.fieldbyname('P2').asstring <> 'Y'  then BtnTedarikci.enabled := False ;
if qry1.fieldbyname('P3').asstring <> 'Y'  then BtnStokGiris.enabled := False ;
if qry1.fieldbyname('P4').asstring <> 'Y'  then BtnSatis.enabled := False ;
if qry1.fieldbyname('P5').asstring <> 'Y'  then BtnHesaplar.enabled := False ;
if qry1.fieldbyname('P6').asstring <> 'Y'  then BtnRapor.enabled := False ;
if qry1.fieldbyname('P7').asstring <> 'Y'  then BtnAnaliz.enabled := False ;
if qry1.fieldbyname('P8').asstring <> 'Y'  then BtnYonetim.enabled := False ;




Yonetimid    := qry1.fieldbyname('id').asstring;
PubAgentName := qry1.fieldbyname('AgentName').asstring;


if qry1.fieldbyname('Admin').asstring = 'Y' then PubAdmin:=1
Else PubAdmin:=0;

Kullanici := TxtKullanici00.Text ;
Kullaniciid := qry1.fieldbyname('id').asinteger ;

LblKullanici.Caption := 'Hoþgeldin '+Kullanici ;
panel12.Visible:=True;

Sayfalar.ActivePage := Welcome  ;


//////////////// RESÝM YÜKLER //////////////////////////////////
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select Resim from YonetimResim where Yonetimid=:Yonetimid ');
Qry1.Parameters.ParamByName('Yonetimid').Value := Yonetimid ;
Qry1.Prepared := True;
Qry1.Open;

ResimYukle(imgKullanici,'Resim',Qry1);
//////////////////////////////////////////////////////////////


CmbTedarikciGetir;
CmbStokAdiGetir;
CmbMusteriGetir;

DtAlimTarihi.Date := Date ;

RaporKriter.ActivePage := PCStok ;

DtH1.Date := Date-30;
DtH2.Date := Date;

DtSCekTarihi.Date := Date;

Dt1Grafik1.Date := Date-60;
Dt2Grafik1.Date := Date;
Dt1Gragik2.Date := Date-60;
Dt2Gragik2.Date := Date;

Dt1Gragik3.Date := Date-60;
Dt2Gragik3.Date := Date;

DtHCekTarihi.Date := Date;


DtR1.Date := Date-30;
DtR2.Date := Date;

DtRCekTarihi.Date := Date -30;
DtRCekTarihi2.Date := Date;

Dt1G4.Date := Date-60;
Dt2G4.Date := Date;

FrmKontrol.Show;





end;

procedure TFrmMenu.BtnKaydet10Click(Sender: TObject);
var TmpSql,TmpMaxid:String;
i:integer;
begin

if Trim(TxtAdi10.Text) = '' then begin
ShowMessage('Please Enter The Name ...');
exit;
end;



if TxtSifre10.Text = '' then begin
ShowMessage('Please Enter The Password ...');
exit;
end;

if TxtTekrarSifre10.Text = '' then begin
ShowMessage('Please Re-Enter The Password ...');
exit;
end;

if TxtTekrarSifre10.Text <> TxtSifre10.Text then begin
ShowMessage('Password does not Match  ...');
exit;
end;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from Yonetim where Adi=:Adi and Soyadi=:Soyadi ');
Qry1.Parameters.ParamByName('Adi').Value          := TxtAdi10.Text;
Qry1.Parameters.ParamByName('Soyadi').Value       := TxtSoyadi10.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Record Available ...');
exit;
end;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from Yonetim where KullaniciAdi=:KullaniciAdi  ');
Qry1.Parameters.ParamByName('KullaniciAdi').Value := TxtKullaniciAdi10.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Record Available ...');
exit;
end;



TmpSql := ' insert into Yonetim '+
'(Adi,Soyadi,KullaniciAdi,Sifre,Bolum,Unvan,P1,P2,P3,P4,P5,P6,P7,P8,Admin) '+
' Values(:Adi,:Soyadi,:KullaniciAdi,:Sifre,:Bolum,:Unvan,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:Admin) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('Adi').Value          := TxtAdi10.Text;
Qry1.Parameters.ParamByName('Soyadi').Value       := TxtSoyadi10.Text;
Qry1.Parameters.ParamByName('KullaniciAdi').Value := TxtKullaniciAdi10.Text;
Qry1.Parameters.ParamByName('Sifre').Value        := TxtSifre10.Text;
Qry1.Parameters.ParamByName('Bolum').Value  := TxtBolum10.Text ;
Qry1.Parameters.ParamByName('Unvan').Value  := TxtUnvan10.Text ;

Qry1.Parameters.ParamByName('P1').Value           := AdvYonetim10.Cells[1,1];
Qry1.Parameters.ParamByName('P2').Value           := AdvYonetim10.Cells[1,2];
Qry1.Parameters.ParamByName('P3').Value           := AdvYonetim10.Cells[1,3];
Qry1.Parameters.ParamByName('P4').Value           := AdvYonetim10.Cells[1,4];
Qry1.Parameters.ParamByName('P5').Value           := AdvYonetim10.Cells[1,5];
Qry1.Parameters.ParamByName('P6').Value           := AdvYonetim10.Cells[1,6];
Qry1.Parameters.ParamByName('P7').Value           := AdvYonetim10.Cells[1,7];
Qry1.Parameters.ParamByName('P8').Value           := AdvYonetim10.Cells[1,8];


if chkadmin10.checked = True then
Qry1.Parameters.ParamByName('Admin').Value  := 'Y'
Else
Qry1.Parameters.ParamByName('Admin').Value  := 'N';

//Qry1.Parameters.ParamByName('AgentName').Value  := CmbAAgent.Text ;

Qry1.Prepared := True;
Qry1.ExecSQL;



qry1.Close;
qry1.SQL.Clear;
qry1.SQL.Add('Select Max(id) as Mid from Yonetim');
qry1.open;
TmpMaxid := Qry1.FieldByName('Mid').AsString ;


////////////////RESÝM KAYDEDER/////////////////////
TmpSql := 'Select resim, Yonetimid from YonetimResim LIMIT 0,1 ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Open;

{Limit kodundan sonra kullanýlan ilk sayý baþlangýç satýrýný ondan sonra
kullanýlan 2. sayý ise bu satýrdan itibaren kaç satýrýn alýnmasý gerektiðini
belirler. Yukarýdaki kullanýmda 0 yani ilk satýrdan itibaren 1 satýrýn alýnacaðý belirtilmiþtir.
limit 1 diye de yazýlabilir
}

Qry1.Append ;
Qry1.FieldByName('Yonetimid').AsString := TmpMaxid;
ResimKaydet(self,'resim',10);
Qry1.Post;

////////////////////////////////////////////////////

ShowMessage('Saved ...');
BtnTemizle10.Click;
YonetimGetir;
end;




procedure TFrmMenu.BtnGuncelle10Click(Sender: TObject);
var TmpSql,TmpMaxid:String;
i:integer;
begin

if Trim(TxtAdi10.Text) = '' then begin
ShowMessage('Lütfen Adýný Giriniz ...');
exit;
end;



if TxtSifre10.Text = '' then begin
ShowMessage('Lütfen Þifreyi Giriniz ...');
exit;
end;

if TxtTekrarSifre10.Text = '' then begin
ShowMessage('Lütfen Tekrar Þifreyi Giriniz ...');
exit;
end;

if TxtTekrarSifre10.Text <> TxtSifre10.Text then begin
ShowMessage('Þifre Uyuþmuyor ...');
exit;
end;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from Yonetim where id<>:id and Adi=:Adi and Soyadi=:Soyadi ');
Qry1.Parameters.ParamByName('id').Value       := TxtAdi10.Tag ;
Qry1.Parameters.ParamByName('Adi').Value      := TxtAdi10.Text;
Qry1.Parameters.ParamByName('Soyadi').Value   := TxtSoyadi10.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Kayýt Mevcut ...');
exit;
end;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from Yonetim where id<>:id and KullaniciAdi=:KullaniciAdi  ');
Qry1.Parameters.ParamByName('id').Value       := TxtAdi10.Tag ;
Qry1.Parameters.ParamByName('KullaniciAdi').Value := TxtKullaniciAdi10.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Kayýt Mevcut ...');
exit;
end;




TmpSql := ' Update Yonetim Set '+
'Adi=:Adi,Soyadi=:Soyadi,KullaniciAdi=:KullaniciAdi,Sifre=:Sifre,Bolum=:Bolum,'+
'Unvan=:Unvan,P1=:P1,P2=:P2,P3=:P3,P4=:P4,P5=:P5,P6=:P6,P7=:P7,P8=:P8,Admin=:Admin '+
' where id=:id ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('Adi').Value          := TxtAdi10.Text;
Qry1.Parameters.ParamByName('Soyadi').Value       := TxtSoyadi10.Text;
Qry1.Parameters.ParamByName('KullaniciAdi').Value := TxtKullaniciAdi10.Text;
Qry1.Parameters.ParamByName('Sifre').Value        := TxtSifre10.Text;
Qry1.Parameters.ParamByName('Bolum').Value  := TxtBolum10.Text ;
Qry1.Parameters.ParamByName('Unvan').Value  := TxtUnvan10.Text ;

Qry1.Parameters.ParamByName('P1').Value           := AdvYonetim10.Cells[1,1];
Qry1.Parameters.ParamByName('P2').Value           := AdvYonetim10.Cells[1,2];
Qry1.Parameters.ParamByName('P3').Value           := AdvYonetim10.Cells[1,3];
Qry1.Parameters.ParamByName('P4').Value           := AdvYonetim10.Cells[1,4];
Qry1.Parameters.ParamByName('P5').Value           := AdvYonetim10.Cells[1,5];
Qry1.Parameters.ParamByName('P6').Value           := AdvYonetim10.Cells[1,6];
Qry1.Parameters.ParamByName('P7').Value           := AdvYonetim10.Cells[1,7];
Qry1.Parameters.ParamByName('P8').Value           := AdvYonetim10.Cells[1,8];

if chkadmin10.checked = True then
Qry1.Parameters.ParamByName('Admin').Value  := 'Y'
Else
Qry1.Parameters.ParamByName('Admin').Value  := 'N';



Qry1.Parameters.ParamByName('id').Value       := TxtAdi10.Tag ;

Qry1.Prepared := True;
Qry1.ExecSQL;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Delete from YonetimResim where Yonetimid =:Yonetimid');
Qry1.Parameters.ParamByName('Yonetimid').Value := TxtAdi10.Tag ;
Qry1.Prepared;
Qry1.ExecSQL;


////////////////RESÝM KAYDEDER/////////////////////
TmpSql := 'Select resim, Yonetimid from YonetimResim LIMIT 0,1 ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Open;

{Limit kodundan sonra kullanýlan ilk sayý baþlangýç satýrýný ondan sonra
kullanýlan 2. sayý ise bu satýrdan itibaren kaç satýrýn alýnmasý gerektiðini
belirler. Yukarýdaki kullanýmda 0 yani ilk satýrdan itibaren 1 satýrýn alýnacaðý belirtilmiþtir.
limit 1 diye de yazýlabilir
}

Qry1.Append ;
Qry1.FieldByName('Yonetimid').Asinteger:= TxtAdi10.Tag;
ResimKaydet(self,'resim',10);
Qry1.Post;

////////////////////////////////////////////////////





ShowMessage('Güncellendi ...');
BtnTemizle10.Click;
YonetimGetir;
end;



procedure TFrmMenu.BtnTemizle10Click(Sender: TObject);
var i:integer;
begin

TxtAdi10.Clear;
TxtSoyadi10.Clear;
TxtKullaniciAdi10.Clear;
TxtSifre10.Clear;
TxtTekrarSifre10.Clear;



Chk0.Checked := True;
Chk0.Checked := False;

Chk1.Checked := True;
Chk1.Checked := False;

Chk2.Checked := True;
Chk2.Checked := False;

Chk3.Checked := True;
Chk3.Checked := False;

btnKaydet10.enabled:=True;
btnGuncelle10.enabled:=False;
btnSil10.enabled:=False;




TxtUnvan10.clear ;
TxtBolum10.clear ;

imgresim10.picture:=Nil;
end;

procedure TFrmMenu.BtnTGuncelleClick(Sender: TObject);
Var TmpSql,TmpRwe:String;

begin

if TxtTedarikci.Text = '' then begin
ShowMessage('Tedarikci adýný giriniz ...');
exit;
end;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from tedarikci where adi=:adi and id<>:id ');
Qry1.Parameters.ParamByName('adi').Value := TxtTedarikci.Text;
Qry1.Parameters.ParamByName('id').Value := TxtTedarikci.tag;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Kayýt Mevcut ...');
exit;
end;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from musteri where Adi=:Adi ');
Qry1.Parameters.ParamByName('Adi').Value := TxtTedarikci.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Ayni isimde hem Müþteri hem Tedarikçi kaydedilemez...');
exit;
end;

TmpSql:= 'Update tedarikci set adi=:adi,telno=:telno,email=:email,aciklama=:aciklama,parabirimi=:parabirimi '+
' where id=:id ';
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('adi').Value    := TxtTedarikci.Text ;
Qry1.Parameters.ParamByName('telno').Value  := TxtTelNo.Text ;
Qry1.Parameters.ParamByName('email').Value := MemAciklama.Text ;
Qry1.Parameters.ParamByName('aciklama').Value  := TxtEmail.Text ;
Qry1.Parameters.ParamByName('parabirimi').Value := CmbTParaBirimi.Text ;
Qry1.Parameters.ParamByName('id').Value := TxtTedarikci.tag;
Qry1.Prepared := True;
Qry1.ExecSql;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Update Stok set Tedarikci=:Tedarikci1 where Tedarikci=:Tedarikci2 ');
Qry1.Parameters.ParamByName('Tedarikci1').Value := TxtTedarikci.Text;
Qry1.Parameters.ParamByName('Tedarikci2').Value := TxtTedarikciX.tag;
Qry1.Prepared := True;
Qry1.ExecSql;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Update Hesaplar set CariHesap=:Tedarikci1 where CariHesap=:Tedarikci2 and CariTuru=:CariTuru');
Qry1.Parameters.ParamByName('Tedarikci1').Value := TxtTedarikci.Text;
Qry1.Parameters.ParamByName('Tedarikci2').Value := TxtTedarikciX.tag;
Qry1.Parameters.ParamByName('CariTuru').Value := 'Tedarikci' ;
Qry1.Prepared := True;
Qry1.ExecSql;

Showmessage('Güncellendi ..');
BtnTTemizle.Click;
end;

procedure TFrmMenu.BtnMKaydetClick(Sender: TObject);
Var TmpSql,TmpRwe:String;
begin

if TxtMAdi.Text = '' then begin
ShowMessage('Müþteri ismini giriniz ...');
exit;
end;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from musteri where adi=:adi ');
Qry1.Parameters.ParamByName('adi').Value := TxtMAdi.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Kayýt Mevcut ...');
exit;
end;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from tedarikci where adi=:adi ');
Qry1.Parameters.ParamByName('adi').Value := TxtMAdi.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Ayni isimde hem Müþteri hem Tedarikçi kaydedilemez...');
exit;
end;

TmpSql:= 'Insert into Musteri (adi,telno,notlar,email,parabirimi) '+
'values (:adi,:telno,:notlar,:email,:parabirimi) ';
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('adi').Value    := TxtMAdi.Text ;
Qry1.Parameters.ParamByName('telno').Value  := TxtMTelNo.Text ;
Qry1.Parameters.ParamByName('notlar').Value := MemMNotlar.Text ;
Qry1.Parameters.ParamByName('email').Value  := TxtMEmail.Text ;
Qry1.Parameters.ParamByName('parabirimi').Value  := CmbMParaBirimi.Text ;
Qry1.Prepared := True;
Qry1.ExecSql;

showmessage('Kaydedildi ..');

CmbMusteriGetir;

end;

procedure TFrmMenu.BtnSatisClick(Sender: TObject);
begin
CizgiGetirAlt(BtnSatis,Satis);
AdvSatis.Colors[2,1]:= ClYellow ;
AdvSatis.Colors[5,1]:= ClYellow ;
{
BtnSKaydet.Enabled := True ;
BtnSiptal.Enabled  := False ;
}
if CmbMusteri.Tag = 0 then begin

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select max(id)+1 as mid from satis');
Qry1.Open;
LblSatisNo.Caption := 'Satýþ No: '+qry1.FieldByName('mid').AsString ;



end;

end;

procedure TFrmMenu.BtnSil10Click(Sender: TObject);
begin
if MessageDlg('Do you want to delete the record ? ',mtConfirmation,[mbYes,mbNo],0) = mrNo Then exit;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Delete from Yonetim where id=:id');
Qry1.Parameters.ParamByName('id').Value :=TxtAdi10.Tag  ;
Qry1.Prepared;
Qry1.ExecSQL;

YonetimGetir;

ShowMessage('Record Deleted ...');
end;

procedure TFrmMenu.BtnSiptalClick(Sender: TObject);
var TmpSql:String;
i:integer;
begin

if MessageDlg('Kaydý Ýptal Etmek Ýstiyormusunuz ? ',mtConfirmation,[mbYes,mbNo],0) = mrNo Then exit;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Update Satis set Durum=:Durum where satisno=:satisno ');
Qry1.Parameters.ParamByName('Durum').Value   := 'iptal';
Qry1.Parameters.ParamByName('satisno').Value := CmbMusteri.Tag;
Qry1.Prepared;
Qry1.ExecSQL;



for i:= 1 to AdvSatis.RowCount-1 do begin

if AdvSatis.cells[2,i]='' Then Continue;


TmpSql:=  'update stokfiyat set '+
' Adet= adet+'+AdvSatis.Cells[4,i]+' where stokadi=:stokadi ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stokadi').Value     := AdvSatis.Cells[2,i] ;
Qry1.Prepared;
Qry1.ExecSQL;

end;



TmpSql:= 'insert into hesaplar '+
' (Tarih,Aciklama,OdemeTuru,CekNo,Borc,Alacak,CariHesap,CariTuru,SatisNo,parabirimi) '+
' Values ' +
' (:Tarih,:Aciklama,:OdemeTuru,:CekNo,:Borc,:Alacak,:CariHesap,:CariTuru,:SatisNo,:parabirimi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));


Qry1.Parameters.ParamByName('Aciklama').Value  := 'Satis iptali (No: '+IntToStr(CmbMusteri.Tag)+')' ;
Qry1.Parameters.ParamByName('OdemeTuru').Value := CmbSOdemeTuru.Text ;
Qry1.Parameters.ParamByName('CekNo').Value     := TxtSCekNo.Text ;
Qry1.Parameters.ParamByName('Borc').Value      := '0' ;
Qry1.Parameters.ParamByName('Alacak').Value    := CurrSKalan.Value ;
Qry1.Parameters.ParamByName('CariHesap').Value := CmbMusteri.Text ;
Qry1.Parameters.ParamByName('CariTuru').Value := 'Musteri' ;
Qry1.Parameters.ParamByName('SatisNo').Value := CmbMusteri.Tag ;
Qry1.Parameters.ParamByName('parabirimi').Value          := CmbMPbirimi.Text ;
Qry1.Prepared;
Qry1.ExecSQL;



Showmessage('Satýþ iptal edildi');

BtnSTemizle.Click;

end;

procedure TFrmMenu.CheckBox1Click(Sender: TObject);
var i:integer;
begin

if CheckBox1.Checked = True then
  for i:=1 to AdvRapor.Rowcount-1 do
    AdvRapor.Cells[1,i]:='Y'
Else
     for i:=1 to AdvRapor.Rowcount-1 do
     AdvRapor.Cells[1,i]:='N';

end;


procedure TFrmMenu.CheckBox2Click(Sender: TObject);
var i:integer;
begin

if CheckBox2.Checked = True then
  for i:=1 to AdvSatis.Rowcount-1 do
    AdvSatis.Cells[1,i]:='Y'
Else
     for i:=1 to AdvSatis.Rowcount-1 do
     AdvSatis.Cells[1,i]:='N';

end;

procedure TFrmMenu.Chk0Click(Sender: TObject);
var i:integer;
begin

for i:=1 to 8 do
if Chk0.Checked = True then
AdvYonetim10.Cells[1,i] := 'Y'
Else
AdvYonetim10.Cells[1,i] := 'N';

end;

procedure TFrmMenu.Chk1Click(Sender: TObject);
var i:integer;
begin

for i:=1 to 10 do
if Chk1.Checked = True then
AdvYonetim10.Cells[3,i] := 'Y'
Else
AdvYonetim10.Cells[3,i] := 'N';

end;

procedure TFrmMenu.Chk2Click(Sender: TObject);
var i:integer;
begin

for i:=1 to 10 do
if Chk2.Checked = True then
AdvYonetim10.Cells[4,i] := 'Y'
Else
AdvYonetim10.Cells[4,i] := 'N';


end;

procedure TFrmMenu.Chk3Click(Sender: TObject);
var i:integer;
begin

for i:=1 to 10 do
if Chk3.Checked = True then
AdvYonetim10.Cells[5,i] := 'Y'
Else
AdvYonetim10.Cells[5,i] := 'N';

end;

procedure TFrmMenu.ChkFaturaNoClick(Sender: TObject);
begin
if ChkFaturaNo.Checked = True then begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select max(id) + 1 as mid from stok');
Qry1.Open;
TxtFaturaNo.Text := 'ftr' + qry1.FieldByName('mid').Asstring ;
end
Else TxtFaturaNo.Clear;



end;

procedure TFrmMenu.ChkSevkNoClick(Sender: TObject);
begin
if ChkSevkNo.Checked = True then begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select max(id)+1 as mid from stok');
Qry1.Open;
TxtSevkNo.Text := 'svk'+qry1.FieldByName('mid').AsString ;
end
Else TxtSevkNo.Clear;
end;

procedure TFrmMenu.ChkTumCiroClick(Sender: TObject);
begin
if ChkTumCiro.Checked=True then      Dt1Grafik1.visible:=False
Else  Dt1Grafik1.visible:=True ;

end;

procedure TFrmMenu.CizgiGetirAlt(TmpBtn: TLabel; TmpPage: TTabSheet);
begin

Sayfalar.ActivePage := TmpPage ;


PnlCizgiAlt.Visible := True ;
//PnlCizgiAlt.Width   := TmpBtn.Width-40 ;
//PnlCizgiAlt.Left    := TmpBtn.Left+20 ;
PnlCizgiAlt.Top     := TmpBtn.Top +14 ;

end;

procedure TFrmMenu.CizgiGetirUst(TmpBtn:TLabel;TmpPage:TTabSheet);
begin

Sayfalar.ActivePage := TmpPage ;
PnlCizgiAlt.Visible := True ;
PnlCizgiAlt.Top     := TmpBtn.Top +14 ;
end;





procedure TFrmMenu.BtnHesaplarClick(Sender: TObject);
begin
CizgiGetirAlt(BtnHesaplar,Hesaplar);
end;

procedure TFrmMenu.CmbHCariHesapChange(Sender: TObject);
begin
CmbHParabirimi.ItemIndex := CmbHCariHesap.ItemIndex;
HesapGetir;
end;

procedure TFrmMenu.CmbMusteriChange(Sender: TObject);
begin
CmbMPbirimi.ItemIndex := CmbMusteri.ItemIndex;
end;

procedure TFrmMenu.CmbMusteriGetir;
var i:integer;
begin

CmbMusteri.Clear;
CmbMPbirimi.Clear;
CmbRFMusteri.Clear;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select adi,parabirimi from musteri order by adi ');
qry1.Open;
for i:=1 to Qry1.RecordCount do begin
CmbMusteri.Items.Add(qry1.FieldByName('Adi').AsString);
CmbMPbirimi.Items.Add(qry1.FieldByName('parabirimi').AsString);

CmbRFMusteri.Items.Add(qry1.FieldByName('Adi').AsString);
Qry1.Next;
end;

end;

procedure TFrmMenu.CmbRaporChange(Sender: TObject);
begin

AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 2;

if CmbRapor.Text='Stok' then RaporKriter.ActivePage := PCStok ;
if CmbRapor.Text='Hesaplar' then RaporKriter.ActivePage := PcHesaplar ;

if CmbRapor.Text='Tedarikci' then RaporKriter.ActivePage := PcTedarikci ;
if CmbRapor.Text='Müþteri' then RaporKriter.ActivePage := PcMusteri ;

if CmbRapor.Text='Satýþ' then RaporKriter.ActivePage := PcSatis ;
if CmbRapor.Text='Satýþ Özet' then RaporKriter.ActivePage := PcSatisOzet ;

if CmbRapor.Text='Stok Fiyat-Miktar' then RaporKriter.ActivePage := PcStokFiyatMiktar ;


end;

procedure TFrmMenu.CmbRCariHesapKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then HesaplarListele;
end;

procedure TFrmMenu.CmbRFMusteriKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then SatisListele;

end;

procedure TFrmMenu.CmbTedarikciChange(Sender: TObject);
begin
CmbTPbirimi.ItemIndex := CmbTedarikci.ItemIndex ;
end;

procedure TFrmMenu.CmbTedarikciGetir;
var i:integer;
begin
CmbTedarikci.Clear;
CmbTPbirimi.Clear;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select adi,parabirimi from tedarikci order by adi ');
qry1.Open;
for i:=1 to Qry1.RecordCount do begin
CmbTedarikci.Items.Add(qry1.FieldByName('Adi').AsString);
CmbTPbirimi.items.add(Qry1.fieldbyname('parabirimi').asstring);
Qry1.Next;
end;

end;

procedure TFrmMenu.CombineImage(const ATopLeftPos: TPoint;
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



procedure TFrmMenu.CurrSEmekChange(Sender: TObject);
var i:integer;
begin

CurrSGenelToplam.Value := CurrSEmek.Value ;
for i:=1 to AdvSatis.RowCount - 1 do
CurrSGenelToplam.Value := CurrSGenelToplam.Value + StrToFloat(AdvSatis.Cells[8,i]);

CurrSKalan.Value := CurrSGenelToplam.Value - CurrSOdeme.Value ;

CurrSGenelToplam2.Value  := CurrSGenelToplam.Value  ;
CurrSindirimoran.Value := 0 ;




end;

procedure TFrmMenu.CurrSindirimoranChange(Sender: TObject);
begin
CurrSGenelToplam2.Value := CurrSGenelToplam.Value - (CurrSGenelToplam.Value * CurrSindirimoran.Value/100);
end;

procedure TFrmMenu.CurrSOdemeChange(Sender: TObject);
begin
CurrSKalan.Value := CurrSGenelToplam.Value - CurrSOdeme.Value ;
end;

procedure TFrmMenu.DeitirilenFiyatlarGeriAl1Click(Sender: TObject);
var tmpsql:string;
i:integer;
begin

for i:=1 to AdvRapor.RowCount-1 do begin

if AdvRapor.Cells [1,i]<>'Y' then continue;


TmpSql:= 'Update  stokfiyat set SatisFiyati= SatisFiyati - ( satisfiyati * SatisOran2/100 ) , SatisOran2=0 '+
' where id=:id ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('id').Value  := AdvRapor.Cells[11,i] ;
Qry1.Prepared;
Qry1.ExecSQL;

end;

CmbStokAdiGetir;
ShowMessage('Seçili Fiyatlar Geri Alýndý ...');

end;

procedure TFrmMenu.DeleteDirectory(const Name: string);
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


function TFrmMenu.DownloadFile(SourceFile, DestFile: string): Boolean;
begin
try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
  except
    Result := False;
  end;

end;

procedure TFrmMenu.TxtRRTedarikciKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then TedarikciListele;
end;

procedure TFrmMenu.BtnRaporClick(Sender: TObject);
begin
CizgiGetirAlt(BtnRapor,Rapor);


end;

procedure TFrmMenu.BtnYonetimClick(Sender: TObject);
begin
BtnKaydet10.Enabled   := True;
BtnGuncelle10.Enabled := False;
BtnSil10.Enabled      := False;

CizgiGetirAlt(BtnYonetim,Yonetim);


YonetimCiz;
YonetimGetir;
end;

procedure TFrmMenu.BtnSKaydetClick(Sender: TObject);
var TmpSql:String;
i,x,TmpSatisNo:integer;
begin
x:=0;
if CmbMusteri.Text = '' then begin
ShowMessage('Müþteri giriniz ...');
exit;
end;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('select satisno from numbers ');
Qry1.Open;
TmpSatisNo:= Qry1.FieldByName('satisno').AsInteger + 1 ;

CmbMusteri.Tag := TmpSatisNo;

for i:= 1 to AdvSatis.RowCount-1 do begin

if AdvSatis.cells[2,i]='' Then Continue;

TmpSql:= 'insert into satis '+                                                                                                            //,Genelindirim,GenelindirimToplam
' (satisno,Tarih,MusteriAdi,StokAdi,Birim,Adet,Fiyat,Kdv,indirim,Toplam,GenelToplam,Odeme,Kalan,OdemeTuru,CekNo,CekTarihi,durum,parabirimi,aciklama,geriiade,geriiadeadet,emek) '+
'Values (:satisno,:Tarih,:MusteriAdi,:StokAdi,:Birim,:Adet,:Fiyat,:Kdv,:indirim,:Toplam,:GenelToplam,:Odeme,:Kalan,:OdemeTuru,:CekNo,:CekTarihi,:durum,:parabirimi,:aciklama,:geriiade,:geriiadeadet,:emek) ';
                                                                                                                                                      //,:Genelindirim,:GenelindirimToplam
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('satisno').Value  := TmpSatisNo ;

Qry1.Parameters.ParamByName('Tarih').Value  := IntToStr(YearOf(Date))+'-'+
                                               IntToStr(MonthOf(Date))+'-'+
                                               IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('MusteriAdi').Value  := CmbMusteri.Text ;
Qry1.Parameters.ParamByName('StokAdi').Value     := AdvSatis.Cells[2,i] ;
Qry1.Parameters.ParamByName('Birim').Value       := AdvSatis.Cells[3,i] ;
Qry1.Parameters.ParamByName('Adet').Value        := AdvSatis.Cells[4,i] ;
Qry1.Parameters.ParamByName('Fiyat').Value       := AdvSatis.Cells[5,i] ;
Qry1.Parameters.ParamByName('Kdv').Value         := AdvSatis.Cells[6,i] ;
Qry1.Parameters.ParamByName('indirim').Value     := AdvSatis.Cells[7,i] ;
Qry1.Parameters.ParamByName('Toplam').Value      := AdvSatis.Cells[8,i] ;
Qry1.Parameters.ParamByName('GenelToplam').Value := CurrSGenelToplam.Value ;
Qry1.Parameters.ParamByName('Odeme').Value       := CurrSOdeme.Value ;
Qry1.Parameters.ParamByName('Kalan').Value       := CurrSKalan.Value ;
Qry1.Parameters.ParamByName('OdemeTuru').Value   := CmbSOdemeTuru.Text ;
Qry1.Parameters.ParamByName('CekNo').Value       := TxtSCekNo.Text ;

Qry1.Parameters.ParamByName('durum').Value       := 'aktif' ;

Qry1.Parameters.ParamByName('CekTarihi').Value  := IntToStr(YearOf(DtSCekTarihi.Date))+'-'+
                                                   IntToStr(MonthOf(DtSCekTarihi.Date))+'-'+
                                                   IntToStr(DayOf(DtSCekTarihi.Date));

Qry1.Parameters.ParamByName('parabirimi').Value          := CmbMPbirimi.Text ;
Qry1.Parameters.ParamByName('aciklama').Value            := TxtSAciklama.Text ;
Qry1.Parameters.ParamByName('geriiade').Value            := 'N' ;
Qry1.Parameters.ParamByName('geriiadeadet').Value        := '0' ;

Qry1.Parameters.ParamByName('emek').Value   := CurrSEmek.Value ;

Qry1.Prepared;
Qry1.ExecSQL;



/////////////////////////////////////////////////////////////////////////////
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select id from stokfiyat where stokadi=:stokadi ');
Qry1.Parameters.ParamByName('stokadi').Value     := AdvSatis.Cells[2,i] ;
Qry1.Prepared;
Qry1.open;
if Qry1.RecordCount = 0 then begin
Showmessage('Stok Adýný Kontrol Ediniz ... ');
end
Else begin


TmpSql:=  'update stokfiyat set '+
' Adet= adet-'+AdvSatis.Cells[4,i]+' where stokadi=:stokadi ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stokadi').Value     := AdvSatis.Cells[2,i] ;
Qry1.Prepared;
Qry1.ExecSQL;
end;
/////////////////////////////////////////////////////////////////////////////

x:=1;
end;

/////////////////////////////////////////////////////////////////////////////
TmpSql:= 'insert into hesaplar '+
' (Tarih,Aciklama,OdemeTuru,CekNo,Borc,Alacak,CariHesap,CariTuru,SatisNo,CekTarihi,parabirimi) '+
' Values ' +
' (:Tarih,:Aciklama,:OdemeTuru,:CekNo,:Borc,:Alacak,:CariHesap,:CariTuru,:SatisNo,:CekTarihi,:parabirimi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('Aciklama').Value  := 'Satis (No: '+IntToStr(TmpSatisNo)+')' ;
Qry1.Parameters.ParamByName('OdemeTuru').Value := CmbSOdemeTuru.Text ;
Qry1.Parameters.ParamByName('CekNo').Value     := TxtSCekNo.Text ;
Qry1.Parameters.ParamByName('Borc').Value      := CurrSGenelToplam.Value ;
Qry1.Parameters.ParamByName('Alacak').Value    := '0' ;
Qry1.Parameters.ParamByName('CariHesap').Value := CmbMusteri.Text ;
Qry1.Parameters.ParamByName('CariTuru').Value := 'Musteri' ;
Qry1.Parameters.ParamByName('SatisNo').Value := TmpSatisNo ;
Qry1.Parameters.ParamByName('CekTarihi').Value  := IntToStr(YearOf(DtSCekTarihi.Date))+'-'+
                                                   IntToStr(MonthOf(DtSCekTarihi.Date))+'-'+
                                                   IntToStr(DayOf(DtSCekTarihi.Date));

Qry1.Parameters.ParamByName('parabirimi').Value          := CmbMPbirimi.Text ;

Qry1.Prepared;
Qry1.ExecSQL;
////////////////////////
///

if CurrSOdeme.Value<>0 then begin
TmpSql:= 'insert into hesaplar '+
' (Tarih,Aciklama,OdemeTuru,CekNo,Borc,Alacak,CariHesap,CariTuru,SatisNo,CekTarihi,parabirimi) '+
' Values ' +
' (:Tarih,:Aciklama,:OdemeTuru,:CekNo,:Borc,:Alacak,:CariHesap,:CariTuru,:SatisNo,:CekTarihi,:parabirimi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('Aciklama').Value  := 'Satis (No: '+IntToStr(TmpSatisNo)+')' ;
Qry1.Parameters.ParamByName('OdemeTuru').Value := CmbSOdemeTuru.Text ;
Qry1.Parameters.ParamByName('CekNo').Value     := TxtSCekNo.Text ;
Qry1.Parameters.ParamByName('Borc').Value      := '0';
Qry1.Parameters.ParamByName('Alacak').Value    := CurrSOdeme.Value ;
Qry1.Parameters.ParamByName('CariHesap').Value := CmbMusteri.Text ;
Qry1.Parameters.ParamByName('CariTuru').Value  := 'Musteri' ;
Qry1.Parameters.ParamByName('SatisNo').Value   := TmpSatisNo ;
Qry1.Parameters.ParamByName('CekTarihi').Value := IntToStr(YearOf(DtSCekTarihi.Date))+'-'+
                                                   IntToStr(MonthOf(DtSCekTarihi.Date))+'-'+
                                                   IntToStr(DayOf(DtSCekTarihi.Date));

Qry1.Parameters.ParamByName('parabirimi').Value := CmbMPbirimi.Text ;

Qry1.Prepared;
Qry1.ExecSQL;
end;
/////////////////////////////////////////////////////////////////////////////

if x=0 then exit;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Update numbers set satisno=satisno+1 ');
Qry1.ExecSQL;


Showmessage('Kaydedildi') ;


//BtnSYazdir.Click;
BtnSTemizle.Click;
end;


procedure TFrmMenu.Button11Click(Sender: TObject);
begin
Chart3.Print;
end;

procedure TFrmMenu.Button12Click(Sender: TObject);
var TmpSql:String;
i:integer;
begin

Chart3.Series[0].Clear;
Chart3.Series[1].Clear;

if RbChart3Musteri.Checked = True then begin
Chart3.Series[1].color := ClLime ;
Chart3.Series[0].color := ClRed  ;
end;

if RbChart3Tedarikci.Checked = True then begin
Chart3.Series[1].color := ClRed ;
Chart3.Series[0].color := ClLime ;
end;


TmpSql:='select CariHesap, '+
' sum(Alacak) as TmpAlacak, '+
' sum(Borc) as TmpBorc '+
' from hesaplar where Tarih between :Dt1 and :Dt2 ';



if RbChart3Tedarikci.Checked = True then begin
TmpSql:=TmpSql +  ' and CariTuru=''Tedarikci''  ' ;

if (Chart3Tedarikci.Text<>'') then
TmpSql:=TmpSql +  ' and CariHesap=:CariHesap ' ;
end;



if RbChart3Musteri.Checked = True then begin
TmpSql:=TmpSql +  ' and CariTuru=''Musteri''  ' ;

if (Chart3Musteri.Text<>'') then
TmpSql:=TmpSql +  ' and CariHesap=:CariHesap ' ;
end;


TmpSql:=TmpSql +  ' group by CariHesap order by Month(tarih) asc ' ;




Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if RbChart3Tedarikci.Checked = True then
if (Chart3Tedarikci.Text<>'') then
Qry1.Parameters.ParamByName('CariHesap').Value   := Chart3Tedarikci.Text;

if RbChart3Musteri.Checked = True then
if (Chart3Musteri.Text<>'') then
Qry1.Parameters.ParamByName('CariHesap').Value   := Chart3Musteri.Text;


Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1Gragik3.Date))+'-'+
                                             IntToStr(MonthOf(Dt1Gragik3.Date))+'-'+
                                             IntToStr(DayOf(Dt1Gragik3.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2Gragik3.Date))+'-'+
                                             IntToStr(MonthOf(Dt2Gragik3.Date))+'-'+
                                             IntToStr(DayOf(Dt2Gragik3.Date));
Qry1.Prepared;
Qry1.Open;

for i:=1 to Qry1.RecordCount do begin
Chart3.Series[1].Add(Qry1.FieldByName('TmpAlacak').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpAlacak').AsCurrency)+',  :'+Qry1.FieldByName('CariHesap').AsString);
Chart3.Series[0].Add(Qry1.FieldByName('TmpBorc').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpBorc').AsCurrency)+', :'+Qry1.FieldByName('CariHesap').AsString);

Qry1.Next;
end;

end;

procedure TFrmMenu.Button14Click(Sender: TObject);
var TmpSql:String;
i:integer;
TmpCiro:Currency;
begin

Chart4.Series[0].Clear;
Chart4.Series[1].Clear;


TmpSql:='select  '+
' sum(Alacak) as TmpAlacak, '+
' sum(Borc) as TmpBorc '+
' from hesaplar where CariTuru=''Tedarikci''  '+

'  and Tarih between :Dt1 and :Dt2 ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Prepared;

Qry1.Open;

Chart4.Series[1].Add(Qry1.FieldByName('TmpAlacak').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpAlacak').AsCurrency));
Chart4.Series[0].Add(Qry1.FieldByName('TmpBorc').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpBorc').AsCurrency)+'      Tedarikçiler' ) ;
//Chart4.data.text :='sdwd' ;
///////////////////////////////////////////////////////////////////////////////////////////////
TmpSql:='select  '+
' sum(Alacak) as TmpAlacak, '+
' sum(Borc) as TmpBorc '+
' from hesaplar where CariTuru=''Musteri''  ' +

'  and Tarih between :Dt1 and :Dt2 ';


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Prepared;
Qry1.Open;

Chart4.Series[1].Add(Qry1.FieldByName('TmpAlacak').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpAlacak').AsCurrency));
Chart4.Series[0].Add(Qry1.FieldByName('TmpBorc').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpBorc').AsCurrency)+'      Müþteriler' ) ;


///////////////////////////////////////////////////////////////////////////////////////////////
TmpSql:='select  '+
' sum(Alacak) as TmpAlacak, '+
' sum(Borc) as TmpBorc '+
' from hesaplar where CariHesap=''Genel Giderler''  ' +

'  and Tarih between :Dt1 and :Dt2 ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Prepared;
Qry1.Open;

Chart4.Series[1].Add(Qry1.FieldByName('TmpAlacak').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpAlacak').AsCurrency));
Chart4.Series[0].Add(Qry1.FieldByName('TmpBorc').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpBorc').AsCurrency)+'      Genel Giderler' ) ;


///////////////////////////////////////////////////////////////////////////////////////////////


TmpSql:='select  '+
' sum(if(CariTuru=''Tedarikci'',Alacak,0)) as TmpGider, '+
' sum(if(CariTuru=''Musteri'',Borc,0)) as TmpGelir, '+
' sum(if(CariTuru=''Genel Giderler'',Alacak,0)) as TmpGider2 '+
' from hesaplar where  '       +
'   Tarih between :Dt1 and :Dt2 ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2G4.Date))+'-'+
                                             IntToStr(MonthOf(Dt1G4.Date))+'-'+
                                             IntToStr(DayOf(Dt1G4.Date));

Qry1.Prepared;
Qry1.Open;

TmpCiro := Qry1.FieldByName('TmpGelir').AsCurrency - (Qry1.FieldByName('TmpGider').AsCurrency+Qry1.FieldByName('TmpGider2').AsCurrency)  ;

if TmpCiro<0 then
Chart4.Series[0].Add(TmpCiro,FormatCurr(',0.00',TmpCiro)+'      Ciro' )
else
Chart4.Series[1].Add(TmpCiro,FormatCurr(',0.00',TmpCiro)+'      Ciro' );





end;

procedure TFrmMenu.Button15Click(Sender: TObject);
var TmpSql,TmpAdet2:String;
TmpAdet:Currency;
i,x,TmpSatisNo:integer;
begin

if MessageDlg('Seçili Stoklar Geri Ýade Edilecek, Eminmisiniz ? ',mtConfirmation,[mbYes,mbNo],0) = mrNo Then exit;

for i:= 1 to AdvGeriiadeStok.RowCount-1 do begin

TmpAdet  := StrToFloat(AdvGeriiadeStok.Cells[3,i]);
if ( TmpAdet <= 0 ) or ( TmpAdet > (StrToFloat(AdvGeriiadeStok.Cells[8,i])-StrToFloat(AdvGeriiadeStok.Cells[10,i])) ) then begin
ShowMessage('Geri Ýade Adedi Yanlýþ ');
exit;
end;

end;



for i:= 1 to AdvGeriiadeStok.RowCount-1 do begin

TmpAdet2  := AdvGeriiadeStok.Cells[3,i] ;

TmpSql:= 'Update  stok set geriiade = ''Y'', geriiadeadet=geriiadeadet+ '+TmpAdet2+'     where id=:id ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('id').Value  := AdvGeriiadeStok.Cells[9,i] ;
Qry1.Prepared;
Qry1.ExecSQL;

/////////////////////////////////////////////////////////////////////////////
TmpSql:=  'update stokfiyat set '+
' Adet= adet-'+TmpAdet2+' where stokadi=:stokadi ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stokadi').Value     := AdvGeriiadeStok.Cells[1,i] ;
Qry1.Prepared;
Qry1.ExecSQL;
/////////////////////////////////////////////////////////////////////////////
TmpSql:= 'insert into hesaplar '+
' (Tarih,FaturaNo,Aciklama,OdemeTuru,CekNo,Borc,Alacak,CariHesap,CariTuru,sevkno,parabirimi) '+
' Values ' +
' (:Tarih,:FaturaNo,:Aciklama,:OdemeTuru,:CekNo,:Borc,:Alacak,:CariHesap,:CariTuru,:sevkno,:parabirimi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('FaturaNo').Value  :=  TxtFaturaNo.Text ;
Qry1.Parameters.ParamByName('Aciklama').Value   := 'Geri iade adet : '+TmpAdet2+',  '+AdvGeriiadeStok.Cells[1,i]+'   '+LblSatisNo.Caption ;
Qry1.Parameters.ParamByName('OdemeTuru').Value  := ' ' ;
Qry1.Parameters.ParamByName('CekNo').Value      := ' ' ;
Qry1.Parameters.ParamByName('Borc').Value       := AdvGeriiadeStok.Cells[7,i] ;
Qry1.Parameters.ParamByName('Alacak').Value     := '0' ;
Qry1.Parameters.ParamByName('CariHesap').Value  := CmbTedarikci.Text ;
Qry1.Parameters.ParamByName('CariTuru').Value   := 'Tedarikci' ;
Qry1.Parameters.ParamByName('sevkno').Value     := TxtSevkNo.Text ;
Qry1.Parameters.ParamByName('parabirimi').Value := CmbMPbirimi.Text ;
Qry1.Prepared;
Qry1.ExecSQL;



/////////////////////////////////////////////////////////////////////////////
end;

Showmessage('Geri Ýade Ýþlemi Tamam ... ') ;

BtnSTemizle.Click;

PnlGeriiadeStok.Visible := False;
end;

procedure TFrmMenu.Button1Click(Sender: TObject);
begin
Chart1.Print;
end;

procedure TFrmMenu.Button2Click(Sender: TObject);
var TmpSql:String;
i:integer;
begin

if CmbHCariHesap.Text = '' then begin
ShowMessage('Cari Hesap Giriniz ...');
exit;
end;

if CurrMiktar.Value = 0 then begin
ShowMessage('Miktarý Giriniz ...');
exit;
end;



if TxtAciklama.Text = '' then begin
ShowMessage('Lütfen Açýklama Giriniz ...');
exit;
end;

TmpSql:= 'insert into hesaplar '+
' (Tarih,Faturano,SevkNo,Aciklama,OdemeTuru,CekNo,Borc,Alacak,CariHesap,CariTuru,CekTarihi) '+
' Values ' +
' (:Tarih,:Faturano,:SevkNo,:Aciklama,:OdemeTuru,:CekNo,:Borc,:Alacak,:CariHesap,:CariTuru,:CekTarihi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('FaturaNo').Value  :=  '' ;
Qry1.Parameters.ParamByName('SevkNo').Value  :=  '' ;
Qry1.Parameters.ParamByName('Aciklama').Value  := TxtAciklama.Text;
Qry1.Parameters.ParamByName('OdemeTuru').Value := CmbHOdemeTuru.Text ;
Qry1.Parameters.ParamByName('CekNo').Value     := TxtHCekNo.Text ;

if CmbBorcAlacak.Text = 'Borç' then  begin
Qry1.Parameters.ParamByName('Borc').Value      := CurrMiktar.Value ;
Qry1.Parameters.ParamByName('Alacak').Value    := '0' ;
end;
if CmbBorcAlacak.Text = 'Alacak' then  begin
Qry1.Parameters.ParamByName('Borc').Value      := '0' ;
Qry1.Parameters.ParamByName('Alacak').Value    := CurrMiktar.Value ;
end;

Qry1.Parameters.ParamByName('CariHesap').Value := CmbHCariHesap.Text ;

if (RbHMusteri.checked = True) then
Qry1.Parameters.ParamByName('CariTuru').Value := 'Musteri' ;
if (RbHTedarikci.checked = True) then
Qry1.Parameters.ParamByName('CariTuru').Value := 'Tedarikci' ;
if (RbHGenelGiderler.checked = True) then
Qry1.Parameters.ParamByName('CariTuru').Value := 'Genel Giderler' ;

Qry1.Parameters.ParamByName('CekTarihi').Value  := IntToStr(YearOf(DtHCekTarihi.Date))+'-'+
                                                   IntToStr(MonthOf(DtHCekTarihi.Date))+'-'+
                                                   IntToStr(DayOf(DtHCekTarihi.Date));

Qry1.Prepared;
Qry1.ExecSQL;

Showmessage('Kaydedildi') ;

TxtAciklama.Text := '';
CmbHOdemeTuru.ItemIndex := -1;
TxtHCekNo.Text := '';
CurrMiktar.Value := 0;
//CmbHCariHesap.ItemIndex := -1;
DtHCekTarihi.Date := Date ;

HesapGetir;

end;

procedure TFrmMenu.Button3Click(Sender: TObject);
var TmpSql:String;
TmpCiro:Currency;
i:integer;
begin

Chart1.Series[0].Clear;

TmpSql:='select ';

if ChkTumCiro.Checked=False Then
TmpSql:=TmpSql +  ' Month(Tarih) as Mo, '  ;

TmpSql:=TmpSql+ ' sum(if(CariTuru=''Tedarikci'',Alacak,0)) as TmpGider, '+
' sum(if(CariTuru=''Musteri'',Borc,0)) as TmpGelir, '+
' sum(if(CariTuru=''Genel Giderler'',Alacak,0)) as TmpGider2 '+

' from hesaplar where Tarih between :Dt1 and :Dt2 ';

if ChkTumCiro.Checked=False Then
TmpSql:=TmpSql +  ' group by Month(Tarih) '  ;



TmpSql:=TmpSql+  ' order by Month(tarih) asc ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1Grafik1.Date))+'-'+
                                             IntToStr(MonthOf(Dt1Grafik1.Date))+'-'+
                                             IntToStr(DayOf(Dt1Grafik1.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2Grafik1.Date))+'-'+
                                             IntToStr(MonthOf(Dt2Grafik1.Date))+'-'+
                                             IntToStr(DayOf(Dt2Grafik1.Date));
Qry1.Prepared;
Qry1.Open;

for i:=1 to Qry1.RecordCount do begin
TmpCiro := Qry1.FieldByName('TmpGelir').AsCurrency - (Qry1.FieldByName('TmpGider').AsCurrency+Qry1.FieldByName('TmpGider2').AsCurrency)  ;
if ChkTumCiro.Checked=False Then
Chart1.Series[0].Add(TmpCiro,FormatCurr(',0.00',TmpCiro)+', Ay :'+Qry1.FieldByName('Mo').AsString)
Else
Chart1.Series[0].Add(TmpCiro,FormatCurr(',0.00',TmpCiro));


Qry1.Next;
end;
end;

procedure TFrmMenu.Button4Click(Sender: TObject);
begin
Chart2.Print;
end;

procedure TFrmMenu.Button5Click(Sender: TObject);
var TmpSql:String;
i:integer;
begin

Chart2.Series[0].Clear;
Chart2.Series[1].Clear;


TmpSql:='select Month(Tarih) as Mo, '+
' sum(if(CariTuru=''Tedarikci'',Alacak,0)) as TmpGider, '+
' sum(if(CariTuru=''Musteri'',Borc,0)) as TmpGelir, '+
' sum(if(CariTuru=''Genel Giderler'',Alacak,0)) as TmpGider2 '+
' from hesaplar where Tarih between :Dt1 and :Dt2 group by Month(Tarih) order by Month(tarih) asc ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1Gragik2.Date))+'-'+
                                             IntToStr(MonthOf(Dt1Gragik2.Date))+'-'+
                                             IntToStr(DayOf(Dt1Gragik2.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2Gragik2.Date))+'-'+
                                             IntToStr(MonthOf(Dt2Gragik2.Date))+'-'+
                                             IntToStr(DayOf(Dt2Gragik2.Date));

Qry1.Prepared;
Qry1.Open;

for i:=1 to Qry1.RecordCount do begin
Chart2.Series[0].Add(Qry1.FieldByName('TmpGelir').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpGelir').AsCurrency)+', Ay :'+Qry1.FieldByName('Mo').AsString);
Chart2.Series[1].Add(Qry1.FieldByName('TmpGider').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpGider').AsCurrency)+', Ay :'+Qry1.FieldByName('Mo').AsString);

Qry1.Next;
end;

{
TmpSql:='Select Sum(borc)-Sum(alacak) as TmpBakiye,Month(Tarih) as Mo ' +

' from Hesaplar where Tarih between :Dt1 and :Dt2 and CariTuru=''Musteri'' '+
' Group by Month(Tarih) Order by Month(Tarih) asc';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1Gragik2.Date))+'-'+
                                             IntToStr(MonthOf(Dt1Gragik2.Date))+'-'+
                                             IntToStr(DayOf(Dt1Gragik2.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2Gragik2.Date))+'-'+
                                             IntToStr(MonthOf(Dt2Gragik2.Date))+'-'+
                                             IntToStr(DayOf(Dt2Gragik2.Date));
Qry1.Prepared;
Qry1.Open;

for i:=1 to Qry1.RecordCount do begin
Chart2.Series[0].Add(Qry1.FieldByName('TmpBakiye').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpBakiye').AsCurrency)+' ,'+Qry1.FieldByName('Mo').Asstring);
Qry1.Next;
end;


/////////////////////////////////////////////////////////////////////////////////


TmpSql:='Select Sum(alacak)-Sum(borc) as TmpBakiye,Month(Tarih) as Mo ' +

' from Hesaplar where Tarih between :Dt1 and :Dt2 and CariTuru=''Tedarikci'' '+
' Group by Month(Tarih) Order by Month(Tarih) asc';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(Dt1Gragik2.Date))+'-'+
                                             IntToStr(MonthOf(Dt1Gragik2.Date))+'-'+
                                             IntToStr(DayOf(Dt1Gragik2.Date));

Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(Dt2Gragik2.Date))+'-'+
                                             IntToStr(MonthOf(Dt2Gragik2.Date))+'-'+
                                             IntToStr(DayOf(Dt2Gragik2.Date));
Qry1.Prepared;
Qry1.Open;

for i:=1 to Qry1.RecordCount  do begin
Chart2.Series[1].Add(Qry1.FieldByName('TmpBakiye').AsCurrency,FormatCurr(',0.00',Qry1.FieldByName('TmpBakiye').AsCurrency)+' ,'+Qry1.FieldByName('Mo').Asstring);
Qry1.Next;
end;
}


end;

procedure TFrmMenu.Button6Click(Sender: TObject);
begin
HesapGetir;
end;

procedure TFrmMenu.Button7Click(Sender: TObject);
var tmpsql:string;
i:integer;
begin

for i:=1 to AdvRapor.RowCount-1 do begin

if AdvRapor.Cells [1,i]<>'Y' then continue;


TmpSql:= 'Update  stokfiyat set SatisOran2=:SatisOran2, '+
' SatisFiyati = SatisFiyati + (satisfiyati * '+currtostr(CurrFiyatOran.Value)+' / 100)  '+
' where id=:id ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('id').Value  := AdvRapor.Cells[11,i] ;
Qry1.Parameters.ParamByName('SatisOran2').Value  := CurrFiyatOran.Value ;
//Qry1.Parameters.ParamByName('SatisOran3').Value  := CurrFiyatOran.Value ;
Qry1.Prepared;
Qry1.ExecSQL;

end;


CmbStokAdiGetir;

ShowMessage('Seçili Fiyatlar Deðiþtirildi ...');



end;

procedure TFrmMenu.Button8Click(Sender: TObject);
var TmpSql,TmpAdet2:String;
TmpAdet:Currency;
i,x,TmpSatisNo:integer;
begin

if MessageDlg('Seçili Satýþlar Geri Ýade Edilecek, Eminmisiniz ? ',mtConfirmation,[mbYes,mbNo],0) = mrNo Then exit;

for i:= 1 to AdvGeriiade.RowCount-1 do begin

TmpAdet  := StrToFloat(AdvGeriiade.Cells[3,i]);
if ( TmpAdet <= 0 ) or ( TmpAdet > (StrToFloat(AdvGeriiade.Cells[8,i])-StrToFloat(AdvGeriiade.Cells[10,i])) ) then begin
ShowMessage('Geri Ýade Adedi Yanlýþ ');
exit;
end;

end;



for i:= 1 to AdvGeriiade.RowCount-1 do begin

TmpAdet2  := AdvGeriiade.Cells[3,i] ;

TmpSql:= 'Update  stok set geriiade = ''Y'', geriiadeadet=geriiadeadet+ '+TmpAdet2+'     where id=:id ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('id').Value  := AdvGeriiade.Cells[9,i] ;
Qry1.Prepared;
Qry1.ExecSQL;

/////////////////////////////////////////////////////////////////////////////
TmpSql:=  'update stokfiyat set '+
' Adet= adet+'+TmpAdet2+' where stokadi=:stokadi ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stokadi').Value     := AdvGeriiade.Cells[1,i] ;
Qry1.Prepared;
Qry1.ExecSQL;
/////////////////////////////////////////////////////////////////////////////
TmpSql:= 'insert into hesaplar '+
' (Tarih,Aciklama,OdemeTuru,CekNo,Borc,Alacak,CariHesap,CariTuru,SatisNo,parabirimi) '+
' Values ' +
' (:Tarih,:Aciklama,:OdemeTuru,:CekNo,:Borc,:Alacak,:CariHesap,:CariTuru,:SatisNo,:parabirimi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('Aciklama').Value   := 'Geri iade adet : '+TmpAdet2+',  '+AdvGeriiade.Cells[1,i]+'   '+LblSatisNo.Caption ;
Qry1.Parameters.ParamByName('OdemeTuru').Value  := ' ' ;
Qry1.Parameters.ParamByName('CekNo').Value      := ' ' ;
Qry1.Parameters.ParamByName('Borc').Value       := '0' ;
Qry1.Parameters.ParamByName('Alacak').Value     := AdvGeriiade.Cells[7,i] ;
Qry1.Parameters.ParamByName('CariHesap').Value  := CmbMusteri.Text ;
Qry1.Parameters.ParamByName('CariTuru').Value   := 'Musteri' ;
Qry1.Parameters.ParamByName('SatisNo').Value    := CmbMusteri.Tag ;
Qry1.Parameters.ParamByName('parabirimi').Value := CmbMPbirimi.Text ;

Qry1.Prepared;
Qry1.ExecSQL;
/////////////////////////////////////////////////////////////////////////////
end;

Showmessage('Geri Ýade Ýþlemi Tamam ... ') ;

BtnSTemizle.Click;

PnlGeriiade.Visible := False;
end;



procedure TFrmMenu.Button9Click(Sender: TObject);
var i:integer;
begin
for i:=1 to AdvHesaplar.RowCount do begin

if AdvHesaplar.SelectedCells[1,i] then begin

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('select * from satis where satisno=:satisno ');
Qry1.Parameters.ParamByName('satisno').Value := AdvHesaplar.Cells[10,i] ;
Qry1.Prepared;
Qry1.open;


QRepPropertyEN:=TQRepPropertyEN.Create(Self);
QRepPropertyEN.DateTime.Caption := DateTimeToStr(Now);
QRepPropertyEN.QrlSatisNo.Caption := 'Satýþ No :' + AdvHesaplar.Cells[10,i] ;
QRepPropertyEN.print;
QRepPropertyEN.Free;

end;

end;



end;

procedure TFrmMenu.BtnSTemizleClick(Sender: TObject);
begin
TmpS:=1;
CmbMusteri.Tag :=0;
AdvSatis.ClearRows(1,AdvSatis.RowCount-1);
AdvSatis.RowCount := 2 ;
CurrSGenelToplam.Value := 0;
CurrSGenelToplam2.Value := 0;
CurrSindirimoran.Value := 0 ;
CurrSOdeme.Value := 0 ;
CurrSKalan.Value := 0 ;
TxtSCekNo.Clear;
CmbSOdemeTuru.Text:='';

CmbMusteri.ItemIndex := -1 ;
CmbMPbirimi.ItemIndex := -1 ;

CmbMusteri.Text := '' ;
CmbMPbirimi.Text := '' ;


TxtSAciklama.Clear;
BtnSKaydet.Enabled := True ;
BtnSiptal.Enabled  := False ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select max(id)+1 as mid from satis');
Qry1.Open;
LblSatisNo.Caption := 'Satýþ No: '+qry1.FieldByName('mid').AsString ;

AdvSatis.Cells[4,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[5,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[6,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[7,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[8,AdvSatis.RowCount-1] := '0' ;

AdvSatis.Colors[3,AdvSatis.RowCount-1]:= ClYellow ;
AdvSatis.Colors[6,AdvSatis.RowCount-1]:= ClYellow ;




TmpS:=0;

end;

procedure TFrmMenu.AdvRaporCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
canedit := False ;
if acol= 1 then canedit:=True;

end;

procedure TFrmMenu.AdvRaporDblClick(Sender: TObject);
begin
if CmbRapor.Text = 'Stok' then begin

if AdvRapor.Cells[3,AdvRapor.Row]<>'' Then StokGetir(AdvRapor.Cells[3,AdvRapor.Row],'faturano')
Else StokGetir(AdvRapor.Cells[4,AdvRapor.Row],'sevkno');

end;


if CmbRapor.Text = 'Müþteri' then MusteriGetir;
if CmbRapor.Text = 'Tedarikci' then TedarikciGetir;
if CmbRapor.Text = 'Satýþ' then SatisGetir(AdvRapor.Cells[1,AdvRapor.Row] );

if CmbRapor.Text = 'Hesaplar' then begin
if AdvRapor.Cells[13,AdvRapor.Row] <> '' then
SatisGetir(AdvRapor.Cells[13,AdvRapor.Row])
else if AdvRapor.Cells[12,AdvRapor.Row]<> '' then
StokGetir(AdvRapor.Cells[12,AdvRapor.Row],'faturano')
else if AdvRapor.Cells[14,AdvRapor.Row]<> '' then
StokGetir(AdvRapor.Cells[14,AdvRapor.Row],'sevkno');
end;




end;

procedure TFrmMenu.AdvRaporGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin

if CmbRapor.Text = 'Stok' then
if acol in [6,7,8,9,10,11,12,13,14] then  HAlign:= taRightJustify;
if CmbRapor.Text = 'Hesaplar' then
if acol in [8,9,10] then  HAlign:= taRightJustify;
if CmbRapor.Text = 'Stok Fiyat-Miktar' then
if acol in [5,6,7,8,9,10] then HAlign:= taRightJustify;
if CmbRapor.Text = 'Satýþ' then
if acol in [5,6,7,8,9,10,11,12] then HAlign:= taRightJustify;

end;

procedure TFrmMenu.AdvStokCellsChanged(Sender: TObject; R: TRect);
var TmpAdet,TmpFiyat,Tmpind,TmpKdv,TmpSatisOran,TmpTopFiyat,Tmpindirimli,TmpAlisFiyati,TmpSatisFiyati:Currency;
  i: Integer;
  TmpSql:String;
begin
if PubTemp=1 then exit;

if AdvStok.Col=3 then exit;

if AdvStok.Col=2 then begin

TmpSql:= 'Select  '+
' Birim,fiyati,ind,kdv,alisfiyati,alisfiyatibirim,kdvsatis,satisoran,satisfiyati,GenelToplam '+
' from stok where stokadi=:stokadi  order by id desc  LIMIT 0,1';
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
qry1.Parameters.parambyname('stokadi').value := AdvStok.Cells[2,AdvStok.Row] ;
qry1.prepared;
Qry1.open;

if qry1.recordcount<>0 then begin

AdvStok.Cells[3,AdvStok.Row]  := Qry1.FieldByName('Birim').asstring ;
AdvStok.Cells[4,AdvStok.Row]  := '0';
AdvStok.Cells[5,AdvStok.Row]  := FloatToStr(RoundTo(Qry1.fieldbyname('Fiyati').ascurrency,-2)) ;
AdvStok.Cells[6,AdvStok.Row]  := Qry1.FieldByName('ind').asstring ;
AdvStok.Cells[7,AdvStok.Row]  := Qry1.FieldByName('kdv').asstring ;
AdvStok.Cells[8,AdvStok.Row]  := Qry1.FieldByName('alisfiyati').asstring ;
AdvStok.Cells[9,AdvStok.Row]  := Qry1.FieldByName('alisfiyatibirim').asstring ;
AdvStok.Cells[10,AdvStok.Row]  := Qry1.FieldByName('kdvsatis').asstring ;
AdvStok.Cells[11,AdvStok.Row] := Qry1.FieldByName('satisoran').asstring ;
AdvStok.Cells[12,AdvStok.Row] := FloatToStr(RoundTo(Qry1.fieldbyname('SatisFiyati').ascurrency,-2)) ;

end
Else begin

AdvStok.Cells[3,AdvStok.Row]  := '0';
AdvStok.Cells[4,AdvStok.Row]  := '0';
AdvStok.Cells[5,AdvStok.Row]  := '0';
AdvStok.Cells[6,AdvStok.Row]  := '0';
AdvStok.Cells[7,AdvStok.Row]  := '0';
AdvStok.Cells[8,AdvStok.Row]  := '0';
AdvStok.Cells[9,AdvStok.Row]  := '0';
AdvStok.Cells[10,AdvStok.Row]  := '0';
AdvStok.Cells[11,AdvStok.Row] := '0';
AdvStok.Cells[12,AdvStok.Row] := '0';
end;

{
/////////////////////////////////////////////////////////////
AdvStok.Cells[1,AdvStok.Row]

CmbSatisFiyat.itemindex :=  CmbStokAdi.Items.IndexOf(AdvStok.Cells[1,AdvStok.Row]) ;
AdvStok.Cells[0,AdvStok.Row] := CmbSatisFiyat.text ;
}


exit;
end;





TmpAdet := 0;
TmpFiyat := 0;
Tmpind := 0;
TmpKdv := 0;


if AdvStok.Cells[4,AdvStok.Row]<>'' then
TmpAdet      := StrtoFloat(AdvStok.Cells[4,AdvStok.Row]) ;
if AdvStok.Cells[5,AdvStok.Row]<>'' then
TmpFiyat     := StrtoFloat(AdvStok.Cells[5,AdvStok.Row]) ;
if AdvStok.Cells[6,AdvStok.Row]<>'' then
Tmpind       := StrtoFloat(AdvStok.Cells[6,AdvStok.Row]) ;
if AdvStok.Cells[7,AdvStok.Row]<>'' then
TmpKdv       := StrtoFloat(AdvStok.Cells[7,AdvStok.Row]) ;

TmpTopFiyat:= TmpAdet * TmpFiyat ;

Tmpindirimli := TmpTopFiyat - (TmpTopFiyat*Tmpind/100) ;
TmpAlisFiyati := Tmpindirimli + (Tmpindirimli*TmpKdv/100) ;

AdvStok.Cells[8,AdvStok.Row] := floattostr( RoundTo(TmpAlisFiyati,-2) ) ;
AdvStok.Cells[9,AdvStok.Row] := floattostr(TmpAlisFiyati/TmpAdet) ;

CurrGenelToplam.Value := 0 ;
for i:=1 to AdvStok.RowCount - 1 do
CurrGenelToplam.Value := CurrGenelToplam.Value + StrToFloat(AdvStok.Cells[8,i]) ;




TmpSatisOran := StrtoFloat(AdvStok.Cells[11,AdvStok.Row]) ;
TmpSatisFiyati := StrtoFloat(AdvStok.Cells[9,AdvStok.Row]) +(StrtoFloat(AdvStok.Cells[9,AdvStok.Row])*TmpSatisOran/100) ;
AdvStok.Cells[12,AdvStok.Row] := floattostr( RoundTo (TmpSatisFiyati,-2) ) ;









end;

procedure TFrmMenu.AdvStokGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
if acol in [4,5,6,7,8,9,10,11,12] then HAlign := taRightJustify ;

end;

procedure TFrmMenu.AdvStokGetEditorType(Sender: TObject; ACol,
 ARow: Integer; var AEditor: TEditorType);
var i:integer;
begin

if acol=2 then begin
AEditor := edComboEdit;
AdvStok.ClearComboString;

for i:=0 to CmbStokAdi.Items.Count-1 do
AdvStok.AddComboString(CmbStokAdi.Items.Strings[i]);

end;

if acol=3 then begin
AEditor := edComboEdit;
AdvStok.ClearComboString;

AdvStok.AddComboString('Adet');
AdvStok.AddComboString('Kilo');
AdvStok.AddComboString('m2');
AdvStok.AddComboString('m3');
AdvStok.AddComboString('Metre');
AdvStok.AddComboString('Koli');
AdvStok.AddComboString('Top');

end;

if acol in [4,5,6,7,8,9,10,11,12] then AEditor := edFloat ;

end;

procedure TFrmMenu.AdvSatisCellsChanged(Sender: TObject; R: TRect);
var TmpAdet,TmpFiyat,TmpKdv,Tmpindirim,TmpToplam,TmpToplam2:Currency;
i:integer;
begin
if TmpS=1 Then exit;

if AdvSatis.Col=2 then begin

AdvSatis.Cells[5,AdvSatis.Row] := CmbSatisFiyat.Items.Strings[AdvSatis.Combobox.ItemIndex];
AdvSatis.Cells[6,AdvSatis.Row] := CmbKdvSatis.Items.Strings[AdvSatis.Combobox.ItemIndex];
AdvSatis.Cells[3,AdvSatis.Row] := CmbBirim.Items.Strings[AdvSatis.Combobox.ItemIndex];

if CmbParabirimi.Items.Strings[AdvSatis.Combobox.ItemIndex]= 'Euro' Then
AdvSatis.Cells[5,AdvSatis.Row]  := currtostr(AlisEuro * StrToCurr(CmbSatisFiyat.Items.Strings[AdvSatis.Combobox.ItemIndex]));

if CmbParabirimi.Items.Strings[AdvSatis.Combobox.ItemIndex]= 'Sterlin' Then
AdvSatis.Cells[5,AdvSatis.Row]  := currtostr(AlisSterlin * StrToCurr(CmbSatisFiyat.Items.Strings[AdvSatis.Combobox.ItemIndex]));

if CmbParabirimi.Items.Strings[AdvSatis.Combobox.ItemIndex]= 'Dolar' Then
AdvSatis.Cells[5,AdvSatis.Row]  := currtostr(AlisDolar * StrToCurr(CmbSatisFiyat.Items.Strings[AdvSatis.Combobox.ItemIndex]));



AdvSatis.Cells[4,AdvSatis.Row] := '0';
AdvSatis.Cells[7,AdvSatis.Row] := '0';
AdvSatis.Cells[8,AdvSatis.Row] := '0';

end;



if AdvSatis.Col in [4] then begin

Qry1.Close;
Qry1.SQL.Clear;
qry1.SQL.Add('Select adet from stokfiyat where  stokadi=:stokadi ');
Qry1.Parameters.ParamByName('stokadi').Value   := AdvSatis.Cells[2,AdvSatis.Row] ;
Qry1.Prepared;
Qry1.Open;

if (Qry1.FieldByName('adet').Asinteger -  strtofloat(AdvSatis.Cells[4,AdvSatis.Row])) <0 then begin

showmessage('Stok Miktarý Yeterli Deðil. Stokta '+Qry1.FieldByName('adet').AsString+' adet ürün kaldý.') ;

AdvSatis.Cells[8,AdvSatis.Row] := '0' ;

exit;
end;


end;

if AdvSatis.Col in [5,4,7,6] then begin

TmpAdet  := StrToFloat(AdvSatis.Cells[4,AdvSatis.Row]);
TmpFiyat := StrToFloat(AdvSatis.Cells[5,AdvSatis.Row]);
TmpKdv   := StrToFloat(AdvSatis.Cells[6,AdvSatis.Row]);
Tmpindirim := StrToFloat(AdvSatis.Cells[7,AdvSatis.Row]);

TmpToplam:= (TmpAdet*TmpFiyat) - ((TmpAdet*TmpFiyat)*Tmpindirim/100);

TmpToplam2 := TmpToplam + (TmpToplam*TmpKdv/100);

AdvSatis.Cells[8,AdvSatis.Row] := FloatToStr(RoundTo(TmpToplam2,-2));


CurrSGenelToplam.Value := 0 ;
for i:=1 to AdvSatis.RowCount - 1 do
CurrSGenelToplam.Value := CurrSGenelToplam.Value + StrToFloat(AdvSatis.Cells[8,i]);

CurrSKalan.Value := CurrSGenelToplam.Value - CurrSOdeme.Value ;

CurrSGenelToplam2.Value  := CurrSGenelToplam.Value  ;
CurrSindirimoran.Value := 0 ;
end;

end;

procedure TFrmMenu.AdvSatisGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
var i:integer;
begin

if acol=2 then begin
AEditor := edComboEdit;
AdvSatis.ClearComboString;

for i:=0 to CmbStokAdi.Items.Count-1 do
AdvSatis.AddComboString(CmbStokAdi.Items.Strings[i]);
end;


end;

procedure TFrmMenu.AdvSurec04CanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
CanEdit := True ;
end;

procedure TFrmMenu.AdvSurec04GetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
if ACol = 1 then AEditor :=edDateEdit ;
end;

procedure TFrmMenu.AdvGeriiadeCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
CanEdit:=False;

if ACol = 3 then CanEdit := True ;

end;

procedure TFrmMenu.AdvGeriiadeCellsChanged(Sender: TObject; R: TRect);
var TmpAdet,TmpFiyat,TmpKdv,Tmpindirim,TmpToplam,TmpToplam2 :Currency;
begin
if TmpS=1 then exit;

if AdvGeriiade.Col = 3 then begin

TmpAdet  := StrToFloat(AdvGeriiade.Cells[3,AdvGeriiade.Row]);
TmpFiyat := StrToFloat(AdvGeriiade.Cells[4,AdvGeriiade.Row]);
TmpKdv   := StrToFloat(AdvGeriiade.Cells[5,AdvGeriiade.Row]);
Tmpindirim := StrToFloat(AdvGeriiade.Cells[6,AdvGeriiade.Row]);

if ( TmpAdet <= 0 ) or ( TmpAdet > (StrToFloat(AdvGeriiade.Cells[8,AdvGeriiade.Row])-StrToFloat(AdvGeriiade.Cells[10,AdvGeriiade.Row])) ) then begin

ShowMessage('Geri Ýade Adedi Yanlýþ ');
exit;
end;

TmpToplam:= (TmpAdet*TmpFiyat) - ((TmpAdet*TmpFiyat)*Tmpindirim/100);
TmpToplam2 := TmpToplam + (TmpToplam*TmpKdv/100);

AdvGeriiade.Cells[7,AdvGeriiade.Row] := FloatToStr(RoundTo(TmpToplam2,-2));

end;



end;

procedure TFrmMenu.AdvGeriiadeStokCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
CanEdit:=False;

if ACol = 3 then CanEdit := True ;
end;

procedure TFrmMenu.AdvGeriiadeStokCellsChanged(Sender: TObject; R: TRect);

var TmpAdet,TmpFiyat,TmpKdv,Tmpindirim,TmpToplam,TmpToplam2 :Currency;
begin


if TmpS=1 then exit;

if AdvGeriiadeStok.Col = 3 then begin

TmpAdet  := StrToFloat(AdvGeriiadeStok.Cells[3,AdvGeriiadeStok.Row]);
TmpFiyat := StrToFloat(AdvGeriiadeStok.Cells[4,AdvGeriiadeStok.Row]);
TmpKdv   := StrToFloat(AdvGeriiadeStok.Cells[5,AdvGeriiadeStok.Row]);
Tmpindirim := StrToFloat(AdvGeriiadeStok.Cells[6,AdvGeriiadeStok.Row]);

if ( TmpAdet <= 0 ) or ( TmpAdet > (StrToFloat(AdvGeriiadeStok.Cells[8,AdvGeriiadeStok.Row])-StrToFloat(AdvGeriiadeStok.Cells[10,AdvGeriiadeStok.Row] )) ) then begin

ShowMessage('Geri Ýade Adedi Yanlýþ ');
exit;
end;

TmpToplam:= (TmpAdet*TmpFiyat) - ((TmpAdet*TmpFiyat)*Tmpindirim/100);
TmpToplam2 := TmpToplam + (TmpToplam*TmpKdv/100);

AdvGeriiadeStok.Cells[7,AdvGeriiadeStok.Row] := FloatToStr(RoundTo(TmpToplam2,-2));

end;



end;

procedure TFrmMenu.AdvHesaplarDblClick(Sender: TObject);
begin

if AdvHesaplar.Cells[10,AdvHesaplar.Row]<>'' then
SatisGetir(AdvHesaplar.Cells[10,AdvHesaplar.Row])
else if AdvHesaplar.Cells[11,AdvHesaplar.Row]<>'' then
StokGetir(AdvHesaplar.Cells[11,AdvHesaplar.Row],'faturano')
Else if AdvHesaplar.Cells[12,AdvHesaplar.Row] <> '' then
StokGetir(AdvHesaplar.Cells[12,AdvHesaplar.Row],'sevkno');


end;

procedure TFrmMenu.AdvHesaplarGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
if acol=1 then  HAlign:= taRightJustify;

end;

procedure TFrmMenu.AdvListe10DblClick(Sender: TObject);
begin
imgresim10.picture:=Nil;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select * from Yonetim where id=:id ');
Qry1.Parameters.ParamByName('id').Value := AdvListe10.Cells[4,AdvListe10.Row];
Qry1.Prepared := True;
Qry1.open;

//CmbAAgent.Text          := Qry1.FieldByName('AgentName').AsString       ;
TxtAdi10.Tag            := Qry1.FieldByName('id').Asinteger          ;
TxtAdi10.Text           := Qry1.FieldByName('Adi').AsString          ;
TxtSoyadi10.Text        := Qry1.FieldByName('Soyadi').AsString       ;
TxtKullaniciAdi10.Text  := Qry1.FieldByName('KullaniciAdi').AsString ;
TxtSifre10.Text         := Qry1.FieldByName('Sifre').AsString        ;
TxtTekrarSifre10.Text   := Qry1.FieldByName('Sifre').AsString        ;

TxtBolum10.Text        := Qry1.FieldByName('bolum').AsString       ;
TxtUnvan10.Text        := Qry1.FieldByName('unvan').AsString       ;


AdvYonetim10.Cells[1,1] := Qry1.FieldByName('P1').AsString          ;
AdvYonetim10.Cells[1,2] := Qry1.FieldByName('P2').AsString          ;
AdvYonetim10.Cells[1,3] := Qry1.FieldByName('P3').AsString          ;
AdvYonetim10.Cells[1,4] := Qry1.FieldByName('P4').AsString          ;
AdvYonetim10.Cells[1,5] := Qry1.FieldByName('P5').AsString          ;
AdvYonetim10.Cells[1,6] := Qry1.FieldByName('P6').AsString          ;
AdvYonetim10.Cells[1,7] := Qry1.FieldByName('P7').AsString          ;
AdvYonetim10.Cells[1,8] := Qry1.FieldByName('P8').AsString          ;

if Qry1.FieldByName('Admin').AsString='Y' then ChkAdmin10.Checked :=True
Else ChkAdmin10.Checked := False;

//////////////// RESÝM YÜKLER //////////////////////////////////


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select Resim from YonetimResim where Yonetimid=:Yonetimid ');
Qry1.Parameters.ParamByName('Yonetimid').Value := AdvListe10.Cells[4,AdvListe10.Row]; ;
Qry1.Prepared := True;
Qry1.Open;

ResimYukle(ImgResim10,'Resim',Qry1);

//////////////////////////////////////////////////////////////

btnKaydet10.enabled:=False;
btnGuncelle10.enabled:=True;
btnSil10.enabled:=True;

end;

procedure TFrmMenu.AdvYonetim10CanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
CanEdit := False;

if Acol in [1,3,4,5] then CanEdit := True ;

end;
















procedure TFrmMenu.BitBtn10Click(Sender: TObject);
begin
PnlStokFiyat.Visible := False;
end;

procedure TFrmMenu.BitBtn11Click(Sender: TObject);
begin
PnlGeriiadeStok.Visible := False;
end;

procedure TFrmMenu.BitBtn1Click(Sender: TObject);
begin
PnlGeriiade.Visible := False;
end;

procedure TFrmMenu.BitBtn2Click(Sender: TObject);
begin
PubTemp:=1 ;

AdvStok.AddRow;
AdvStok.AutoNumberCol(0);

AdvStok.Colors[7,AdvStok.RowCount-1]:= ClYellow ;
AdvStok.Colors[11,AdvStok.RowCount-1]:= ClYellow ;


AdvStok.Cells[3,AdvStok.Rowcount-1]  := '0';
AdvStok.Cells[4,AdvStok.Rowcount-1]  := '0';
AdvStok.Cells[5,AdvStok.Rowcount-1]  := '0';
AdvStok.Cells[6,AdvStok.Rowcount-1]  := '0';
AdvStok.Cells[7,AdvStok.Rowcount-1]  := '0';
AdvStok.Cells[8,AdvStok.Rowcount-1]  := '0';
AdvStok.Cells[9,AdvStok.Rowcount-1]  := '0';
AdvStok.Cells[10,AdvStok.Rowcount-1] := '0';
AdvStok.Cells[11,AdvStok.Rowcount-1] := '0';
AdvStok.Cells[12,AdvStok.Rowcount-1] := '0';

PubTemp:=0 ;
end;

procedure TFrmMenu.BitBtn3Click(Sender: TObject);
begin
PubTemp:=1;
if AdvStok.RowCount = 2 then
AdvStok.ClearRows(AdvStok.Row,1)
Else begin
AdvStok.ClearRows(AdvStok.Row,1);
AdvStok.RemoveRows(AdvStok.Row,1);
end;

AdvStok.AutoNumberCol(0);

PubTemp:=0;

end;

procedure TFrmMenu.BitBtn4Click(Sender: TObject);
begin

CheckBox1.Visible := False ;

if CmbRapor.Text = 'Hesaplar' then HesaplarListele;

if CmbRapor.Text = 'Stok Fiyat-Miktar' then begin
 AdvRapor.PopupMenu := PopupMenu4;
 CheckBox1.Visible := True ;
 StokFiyatMiktarListele;
 end;

 if CmbRapor.Text = 'Stok' then StokListele;
if CmbRapor.Text = 'Tedarikci' then TedarikciListele;
if CmbRapor.Text = 'Müþteri' then MusteriListele;
if CmbRapor.Text = 'Satýþ' then SatisListele;

if CmbRapor.Text = 'Satýþ Özet' then begin
 AdvRapor.PopupMenu := PopupMenu2;
 CheckBox1.Visible := True ;
 SatisOzetListele;
end;

AdvRapor.AutoNumberCol(0);
end;

procedure TFrmMenu.BitBtn5Click(Sender: TObject);
begin
//AdvRapor.PrintSettings.TitleLines.Clear;
//AdvRapor.PrintSettings.TitleLines.Add('KREDÝ KARTLARI');
//AdvRapor.PrintSettings.TitleLines.Add('');

AdvPreview.Grid := AdvRapor ;
AdvPreview.Execute ;
end;

procedure TFrmMenu.BitBtn6Click(Sender: TObject);
begin
AdvGridExcel.AdvStringGrid := AdvRapor ;
SaveDialog1.Execute;
if SaveDialog1.FileName='' Then Exit;
AdvGridExcel.XLSExport(SaveDialog1.FileName+'Rapor.xls');
end;

procedure TFrmMenu.BitBtn7Click(Sender: TObject);
begin

TmpS:=1;

AdvSatis.AddRow;
AdvSatis.AutoNumberCol(0);

AdvSatis.Cells[4,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[5,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[6,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[7,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[8,AdvSatis.RowCount-1] := '0' ;

AdvSatis.Colors[3,AdvSatis.RowCount-1]:= ClYellow ;
AdvSatis.Colors[6,AdvSatis.RowCount-1]:= ClYellow ;

TmpS:=0;

end;

procedure TFrmMenu.BitBtn8Click(Sender: TObject);
var i:integer;
begin

TmpS:=1;

if AdvSatis.RowCount = 3 then
AdvSatis.ClearRows(AdvSatis.Row,1)
Else begin
AdvSatis.ClearRows(AdvSatis.Row,1);
AdvSatis.RemoveRows(AdvSatis.Row,1);
end;

AdvSatis.AutoNumberCol(0);

if (AdvSatis.RowCount = 3) and (AdvSatis.Cells[2,1] =  '') then begin

AdvSatis.Cells[4,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[5,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[6,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[7,AdvSatis.RowCount-1] := '0' ;
AdvSatis.Cells[8,AdvSatis.RowCount-1] := '0' ;
end;

CurrSGenelToplam.Value := 0 ;
for i:=1 to AdvSatis.RowCount - 1 do
CurrSGenelToplam.Value := CurrSGenelToplam.Value + StrToFloat(AdvSatis.Cells[8,i]);


CurrSKalan.Value := (CurrSGenelToplam.Value - CurrSOdeme.Value) ;

TmpS:=0;

end;

procedure TFrmMenu.BitBtn9Click(Sender: TObject);
begin


QRepHesaplar:=TQRepHesaplar.Create(Self);
QRepHesaplar.DateTime.Caption := DateTimeToStr(Now);

QRepHesaplar.QrLblAdi.Caption := '' ;

if RbHMusteri.Checked = True then
QRepHesaplar.QrLblAdi.Caption := 'Müþteri : ' + CmbHCariHesap.text ;

if RbHTedarikci.Checked = True then
QRepHesaplar.QrLblAdi.Caption := 'Tedarikci : ' + CmbHCariHesap.text ;

if RbHGenelGiderler.Checked = True then
QRepHesaplar.QrLblAdi.Caption := ' Genel Giderler ' ;

//QRepHesaplar.DateTime.Caption := DevredenBakiye.Value ;

QRepHesaplar.QRLDevredenBakiye.Caption   :=  ' Devreden Bakiye : ' + AdvHesaplar.Cells[8,1] ;

QRepHesaplar.QRLBakiye.Caption   :=  AdvHesaplar.Cells[8,AdvHesaplar.RowCount-1] ;

QRepHesaplar.QRLBorc.Caption    :=  AdvHesaplar.Cells[6,AdvHesaplar.RowCount-1] ;
QRepHesaplar.QRLAlacak.Caption  :=  AdvHesaplar.Cells[7,AdvHesaplar.RowCount-1] ;


QRepHesaplar.Preview ;
QRepHesaplar.Free;



exit;

AdvHesaplar.ColCount := 9 ;

AdvHesaplar.PrintSettings.TitleLines.Clear;
AdvHesaplar.PrintSettings.TitleLines.Add('HESAPLAR');
AdvHesaplar.PrintSettings.TitleLines.Add('');

AdvPreview.Grid := AdvHesaplar ;
AdvPreview.Execute ;

AdvHesaplar.ColCount := 13 ;
AdvHesaplar.ColWidths[9] := 1 ;
AdvHesaplar.ColWidths[10] := 1 ;
AdvHesaplar.ColWidths[11] := 1 ;
AdvHesaplar.ColWidths[12] := 1 ;

end;

procedure TFrmMenu.BtnMTemizleClick(Sender: TObject);
begin

TxtMAdi.Tag := 0 ;

TxtMAdi.Clear ;

TxtMTelNo.Clear ;
TxtMEmail.Clear ;
MemMNotlar.Clear ;

BtnMKaydet.Enabled   := True  ;
BtnMGuncelle.Enabled   := False ;
BtnMSil.Enabled := False ;

end;

procedure TFrmMenu.BtnMSilClick(Sender: TObject);
begin
if MessageDlg('Kaydý Silmek Ýstiyormusunuz ? ',mtConfirmation,[mbYes,mbNo],0) = mrNo Then exit;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Delete from Musteri where id=:id');
Qry1.Parameters.ParamByName('id').Value :=TxtMAdi.Tag ;
Qry1.Prepared;
Qry1.ExecSQL;

BtnMTemizle.Click;

end;

procedure TFrmMenu.BtnMGuncelleClick(Sender: TObject);
Var TmpSql,TmpRwe:String;

begin

if TxtMAdi.Text = '' then begin
ShowMessage('Müþteri adýný giriniz ...');
exit;
end;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from musteri where adi=:adi and id<>:id ');
Qry1.Parameters.ParamByName('adi').Value := TxtMAdi.Text;
Qry1.Parameters.ParamByName('id').Value := TxtMAdi.tag;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Kayit Mevcut ...');
exit;
end;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from tedarikci where adi=:adi ');
Qry1.Parameters.ParamByName('adi').Value := TxtMAdi.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Ayni isimde hem Müþteri hem Tedarikçi kaydedilemez...');
exit;
end;

TmpSql:= 'Update musteri set adi=:adi,telno=:telno,email=:email,notlar=:notlar,parabirimi=:parabirimi '+
' where id=:id ';
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('adi').Value    := TxtMAdi.Text ;
Qry1.Parameters.ParamByName('telno').Value  := TxtMTelNo.Text ;
Qry1.Parameters.ParamByName('notlar').Value := MemMNotlar.Text ;
Qry1.Parameters.ParamByName('email').Value  := TxtMEmail.Text ;
Qry1.Parameters.ParamByName('parabirimi').Value  := CmbMParaBirimi.Text ;
Qry1.Parameters.ParamByName('id').Value := TxtMAdi.tag;
Qry1.Prepared := True;
Qry1.ExecSql;

Showmessage('Güncellendi ..');
BtnMTemizle.Click;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
var Reg: TRegIniFile;
i,x,TmpKayitSayisi,TmpB,TmpE:integer;
dosyaboyutu,SerialNumber,TmpSql,dosya:sTRing;
iOpenFile: integer;
VolumeSerialNumber : DWORD;
MaximumComponentLength : DWORD;
FileSystemFlags : DWORD;
SourceString, DestinationString,TmpVersion,TmpDosyaAdi: string;

  Btn: TgrpButtonItem;
begin

CurrentPatika:=GetCurrentDir;

Sayfalar.ActivePage := Login;

{
if date > StrtoDate('01'+DateSeparator+'12'+DateSeparator+'2012') Then Begin
if fileExists('C:\WINDOWS\system32\Acsgkosdin.dll') then
DeleteFile('C:\WINDOWS\system32\Acsgkosdin.dll');
if fileExists(CurrentPatika+'\GCcxdk') then begin
DeleteFile(CurrentPatika+'\GCcxdk');
Application.Terminate;
end;
end;
}

try

if Not fileExists('C:\WINDOWS\system32\Acsgkosdin.dll') then
Application.Terminate;
Memo1.Lines.LoadFromFile('C:\WINDOWS\system32\Acsgkosdin.dll');

// HDD Seri Numarasý
GetVolumeInformation('C:', nil, 0, @VolumeSerialNumber, MaximumComponentLength, FileSystemFlags, nil, 0);
SerialNumber := IntToHex(HiWord(VolumeSerialNumber), 4) + '-' + IntToHex(LoWord(VolumeSerialNumber), 4);
// HDD Seri Numarasý

// Dosya boyutu
iOpenFile := FileOpen(CurrentPatika+'\YapiMarket.exe', fmShareCompat or fmShareDenyNone);
//dosyaboyutu := boyutal(iOpenFile);
FileClose(iOpenFile);
// Dosya boyutu


if  Memo1.Text <> SerialNumber+dosyaboyutu Then
//Application.Terminate;

Memo1.Text := SerialNumber+dosyaboyutu;

Reg:=TRegIniFile.Create;
try
Reg.RootKey:=HKey_Local_Machine;
if not Reg.KeyExists('\software\ACnTrio') then
Application.Terminate;
finally
Reg.Free;
end;

//showmessage('1');
cnn1.Connected := False;
memo1.lines.loadfromfile(CurrentPatika+'\GCcxdk');
cnn1.ConnectionString := memo1.Text;
cnn1.Connected := True;

memo1.Clear;

{
cnn2.Connected := False;
memo1.lines.loadfromfile(CurrentPatika+'\GCcxdk2');
cnn2.ConnectionString := memo1.Text;
cnn2.Connected := True;


////////////////////////////////////////////////////////////////
TmpSql := 'Select id from gunceldosya  ' ;
Qry2.Close;
Qry2.Sql.Clear;
Qry2.SQL.Add(TmpSql);
Qry2.Open;

memo1.Clear;
memo1.lines.loadfromfile(CurrentPatika+'\YapiMarketVersion');

PnlVersion.Caption := Qry2.FieldByName('id').AsString ;


if Qry2.FieldByName('id').AsInteger > StrToInt(memo1.Text) then begin


dosya:=CurrentPatika+'\PrjDosyaGuncelle.exe';


ShellExecute(Handle,
            'open',
            PChar(dosya),
             nil,
             nil,
             SW_SHOWNORMAL);
end;
////////////////////////////////////////////////////////////////
 }
except
ShowMessage('Baðlantý Kurulamýyor, Tekrar Deneyiniz  ...') ;
Application.Terminate;
end;

raporkriter.tabposition := tpBottom;
raporkriter.TabWidth := 1 ;
raporkriter.TabHeight := 1 ;

sayfalar.tabposition := tpBottom;
sayfalar.TabWidth := 1 ;
sayfalar.TabHeight := 1 ;

BtnDoviz.Click;
end;






procedure TFrmMenu.GetDBbinary(filename, Field: string; TmpDMQRY: TADOQuery);
var
  BlobField: TBlobField;
  Stream: TMemoryStream;
begin

(TmpDMQRY.FieldByName(Field) as TBlobField).SaveToFile(filename);

end;



procedure TFrmMenu.HesapGetir;
var TmpSql:String;
i:integer;
TmpBorc2,TmpAlacak2,TmpBorc,TmpAlacak,TmpBakiye,TmpToplamAlacak,TmpToplamBorc:Currency;
begin

AdvHesaplar.ClearRows(1,AdvHesaplar.RowCount-1);
AdvHesaplar.RowCount := 3;
AdvHesaplar.ColCount := 13 ;

AdvHesaplar.Cells[1,0] := 'Tarih';
AdvHesaplar.ColWidths[1] := 80 ;
AdvHesaplar.Cells[2,0] := 'Aciklama';
AdvHesaplar.ColWidths[2] := 300 ;
AdvHesaplar.Cells[3,0] := 'Ödeme Türü';
AdvHesaplar.ColWidths[3] := 80 ;
AdvHesaplar.Cells[4,0] := 'Çek No';
AdvHesaplar.ColWidths[4] := 100 ;
AdvHesaplar.Cells[5,0] := 'Çek Tarihi';
AdvHesaplar.ColWidths[5] := 80 ;

AdvHesaplar.Cells[6,0] := 'Borç';
AdvHesaplar.ColWidths[6] := 100 ;
AdvHesaplar.Cells[7,0] := 'Alacak';
AdvHesaplar.ColWidths[7] := 100 ;
AdvHesaplar.Cells[8,0] := 'Bakiye';
AdvHesaplar.ColWidths[8] := 100 ;

AdvHesaplar.ColWidths[9] := 1 ;
AdvHesaplar.ColWidths[10] := 1 ;
AdvHesaplar.ColWidths[11] := 1 ;
AdvHesaplar.ColWidths[12] := 1 ;

TmpSql:= 'Select '+
'  sum(borc) as b, sum(alacak) as a from hesaplar where  Tarih < :Dt1  ' ;

if CmbHCariHesap.Text <> '' then
TmpSql:=TmpSql + ' and  Carihesap like :Carihesap  ';

if (RbHMusteri.checked = True) or (RbHTedarikci.checked = True) then
TmpSql:=TmpSql + ' and  CariTuru=:CariTuru  ';

TmpSql:=TmpSql + ' order by Tarih  ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if CmbHCariHesap.Text <> '' then
Qry1.Parameters.ParamByName('CariHesap').Value := CmbHCariHesap.Text+'%' ;

if (RbHMusteri.checked = True) then
Qry1.Parameters.ParamByName('CariTuru').Value := 'Musteri' ;
if (RbHTedarikci.checked = True) then
Qry1.Parameters.ParamByName('CariTuru').Value := 'Tedarikci' ;

Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(DtH1.Date))+'-'+
                                             IntToStr(MonthOf(DtH1.Date))+'-'+
                                             IntToStr(DayOf(DtH1.Date));

Qry1.Prepared;
Qry1.Open;

AdvHesaplar.Cells[1,1] :=  'Devreden Bakiye ' ;

TmpBorc2 := qry1.FieldByName('b').Ascurrency;
TmpAlacak2 := qry1.FieldByName('a').Ascurrency;


AdvHesaplar.Cells[8,1] :=  FormatFloat('#,##0.00',TmpBorc2-TmpAlacak2);
AdvHesaplar.MergeCells(1,1,7,1);
AdvHesaplar.RowColor[1]:=clYellow;
TmpBakiye := TmpBorc2-TmpAlacak2; ;
DevredenBakiye.Value :=  TmpBakiye ;
///////////////////////////////////////////////////////////////
TmpSql:= 'Select '+
'id, sevkno,Tarih, Aciklama, OdemeTuru, CekNo, Borc, Alacak,CekTarihi,satisno,faturano  '+
' from hesaplar where  Tarih between :Dt1 and :Dt2   ' ;


if CmbHCariHesap.Text <> '' then
TmpSql:=TmpSql + ' and  Carihesap like :Carihesap  ';

if (RbHMusteri.checked = True) or (RbHTedarikci.checked = True) then
TmpSql:=TmpSql + ' and  CariTuru=:CariTuru  ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if CmbHCariHesap.Text <> '' then
Qry1.Parameters.ParamByName('CariHesap').Value := CmbHCariHesap.Text+'%' ;


if (RbHMusteri.checked = True) then
Qry1.Parameters.ParamByName('CariTuru').Value := 'Musteri' ;
if (RbHTedarikci.checked = True) then
Qry1.Parameters.ParamByName('CariTuru').Value := 'Tedarikci' ;

Qry1.Parameters.ParamByName('Dt1').Value  := IntToStr(YearOf(DtH1.Date))+'-'+
                                             IntToStr(MonthOf(DtH1.Date))+'-'+
                                             IntToStr(DayOf(DtH1.Date));
Qry1.Parameters.ParamByName('Dt2').Value  := IntToStr(YearOf(DtH2.Date))+'-'+
                                             IntToStr(MonthOf(DtH2.Date))+'-'+
                                             IntToStr(DayOf(DtH2.Date));
Qry1.Prepared;
Qry1.Open;

if Qry1.RecordCount<>0 then AdvHesaplar.RowCount := Qry1.RecordCount  + 2 ;

TmpToplamAlacak := TmpAlacak2 ;
TmpToplamBorc := TmpBorc2 ;


for i:=2 to Qry1.RecordCount+1 do begin
AdvHesaplar.Cells[1,i] := qry1.FieldByName('Tarih').AsString;
AdvHesaplar.Cells[2,i] := qry1.FieldByName('Aciklama').AsString;
AdvHesaplar.Cells[3,i] := qry1.FieldByName('OdemeTuru').AsString;
AdvHesaplar.Cells[4,i] := qry1.FieldByName('CekNo').AsString;

if qry1.FieldByName('CekNo').AsString <>'' then
AdvHesaplar.Cells[5,i] := qry1.FieldByName('CekTarihi').AsString;

TmpBorc   := qry1.FieldByName('Borc').Ascurrency;
TmpAlacak := qry1.FieldByName('Alacak').Ascurrency;
TmpBakiye := TmpBakiye + (TmpBorc-TmpAlacak);

TmpToplamAlacak := TmpToplamAlacak + TmpAlacak;
TmpToplamBorc := TmpToplamBorc + TmpBorc ;

AdvHesaplar.Cells[6,i] := FormatFloat('#,##0.00',qry1.FieldByName('Borc').Ascurrency);
AdvHesaplar.Cells[7,i] := FormatFloat('#,##0.00',qry1.FieldByName('Alacak').Ascurrency);
AdvHesaplar.Cells[8,i] := FormatFloat('#,##0.00',TmpBakiye);


AdvHesaplar.Cells[9,i] := qry1.FieldByName('id').AsString;
AdvHesaplar.Cells[10,i] := qry1.FieldByName('satisno').AsString;
AdvHesaplar.Cells[11,i] := qry1.FieldByName('faturano').AsString;
AdvHesaplar.Cells[12,i] := qry1.FieldByName('sevkno').AsString;


Qry1.Next;
end;

AdvHesaplar.AutoNumberCol(0);
AdvHesaplar.AddRow;

AdvHesaplar.Colors[6,AdvHesaplar.RowCount-1] := clYellow;
AdvHesaplar.Colors[7,AdvHesaplar.RowCount-1] := clYellow;
AdvHesaplar.Colors[8,AdvHesaplar.RowCount-1] := clYellow;

AdvHesaplar.Cells[7,AdvHesaplar.RowCount-1] := FormatFloat('#,##0.00',TmpToplamAlacak-TmpAlacak2);
AdvHesaplar.Cells[6,AdvHesaplar.RowCount-1] := FormatFloat('#,##0.00',TmpToplamBorc-TmpBorc2);
AdvHesaplar.Cells[8,AdvHesaplar.RowCount-1] := FormatFloat('#,##0.00',(TmpToplamBorc-TmpBorc2) -(TmpToplamAlacak-TmpAlacak2) )  ;

AdvHesaplar.AddRow;

AdvHesaplar.Colors[6,AdvHesaplar.RowCount-1] := clYellow;
AdvHesaplar.Colors[7,AdvHesaplar.RowCount-1] := clYellow;
AdvHesaplar.Colors[8,AdvHesaplar.RowCount-1] := clYellow;

AdvHesaplar.Cells[7,AdvHesaplar.RowCount-1] := FormatFloat('#,##0.00',TmpToplamAlacak);
AdvHesaplar.Cells[6,AdvHesaplar.RowCount-1] := FormatFloat('#,##0.00',TmpToplamBorc);
AdvHesaplar.Cells[8,AdvHesaplar.RowCount-1] := FormatFloat('#,##0.00',TmpToplamBorc-TmpToplamAlacak);

end;

procedure TFrmMenu.HesaplarListele;
var TmpSql:String;
i:integer;
TmpBorc,TmpAlacak,TmpBorc2,TmpAlacak2,TmpBakiye,TmpToplamBorc,TmpToplamAlacak:Currency;
begin

AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 3;
AdvRapor.ColCount := 15 ;

AdvRapor.Cells[1,0] := 'Tarih';
AdvRapor.ColWidths[1] := 80 ;
AdvRapor.Cells[2,0] := 'Aciklama';
AdvRapor.ColWidths[2] := 300 ;
AdvRapor.Cells[3,0] := 'Cari Hesap';
AdvRapor.ColWidths[3] := 150 ;
AdvRapor.Cells[4,0] := 'Cari Türü';
AdvRapor.ColWidths[4] := 80 ;
AdvRapor.Cells[5,0] := 'Ödeme Türü';
AdvRapor.ColWidths[5] := 80 ;
AdvRapor.Cells[6,0] := 'Çek No';
AdvRapor.ColWidths[6] := 80 ;
AdvRapor.Cells[7,0] := 'Çek Tarihi';
AdvRapor.ColWidths[7] := 80 ;
AdvRapor.Cells[8,0] := 'Borç';
AdvRapor.ColWidths[8] := 100 ;
AdvRapor.Cells[9,0] := 'Alacak';
AdvRapor.ColWidths[9] := 100 ;
AdvRapor.Cells[10,0] := 'Bakiye';
AdvRapor.ColWidths[10] := 100 ;
AdvRapor.ColWidths[11] := 1 ;
AdvRapor.ColWidths[12] := 1 ;
AdvRapor.ColWidths[13] := 1 ;
AdvRapor.ColWidths[14] := 1 ;

TmpSql:= TmpSql + 'Select '+
' Sum(Borc) as b,Sum(Alacak) as a from hesaplar where Tarih < :dt1 ' ;

if (RbRMusteri.checked = True) or  (RbRTedarikci.checked = True) then
TmpSql:= TmpSql + ' and carihesap like :carihesap ' ;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if (RbRMusteri.checked = True) or  (RbRTedarikci.checked = True) then
Qry1.Parameters.ParamByName('carihesap').Value := CmbRCariHesap.Text+'%' ;



Qry1.Parameters.ParamByName('dt1').Value  := IntToStr(YearOf(DtR1.Date))+'-'+
                                             IntToStr(MonthOf(DtR1.Date))+'-'+
                                             IntToStr(DayOf(DtR1.Date));

Qry1.Prepared;
Qry1.Open;

AdvRapor.Cells[1,1] :=  'Devreden Bakiye ' ;

TmpBorc2   := qry1.FieldByName('b').Ascurrency ;
TmpAlacak2 := qry1.FieldByName('a').Ascurrency ;


AdvRapor.Cells[10,1] :=  FormatFloat('#,##0.00',TmpBorc2-TmpAlacak2);
AdvRapor.MergeCells(1,1,9,1);
AdvRapor.RowColor [1]:=clYellow;
TmpBakiye := TmpBorc2-TmpAlacak2;

////////////////////////////////////////////////////////


TmpSql:= 'Select '+
'id,sevkno, Tarih, Aciklama, OdemeTuru, CekNo, Borc, Alacak, CariHesap, CariTuru,CekTarihi,faturano,satisno '+
' from hesaplar where Tarih between :dt1 and :dt2 ' ;

if CmbRCariHesap.Text <> '' Then
TmpSql:= TmpSql + ' and carihesap like :carihesap ' ;

if TxtRCekNo.Text <> '' then
TmpSql:= TmpSql + ' and CekNo like :cekno ' ;

if ChkRCekTarihi.Checked = True then
TmpSql:= TmpSql + ' and CekNo <> '''' and CekTarihi between :CekTarihi and :CekTarihi2  ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('dt1').Value  := IntToStr(YearOf(DtR1.Date))+'-'+
                                             IntToStr(MonthOf(DtR1.Date))+'-'+
                                             IntToStr(DayOf(DtR1.Date));
Qry1.Parameters.ParamByName('dt2').Value  := IntToStr(YearOf(DtR2.Date))+'-'+
                                             IntToStr(MonthOf(DtR2.Date))+'-'+
                                             IntToStr(DayOf(DtR2.Date));


if CmbRCariHesap.Text <> '' Then
Qry1.Parameters.ParamByName('carihesap').Value := CmbRCariHesap.Text+'%' ;

if TxtRCekNo.Text <> '' then
Qry1.Parameters.ParamByName('CekNo').Value := TxtRCekNo.Text+'%' ;

if ChkRCekTarihi.Checked = True then   begin
Qry1.Parameters.ParamByName('CekTarihi').Value  := IntToStr(YearOf(DtRCekTarihi.Date))+'-'+
                                                   IntToStr(MonthOf(DtRCekTarihi.Date))+'-'+
                                                   IntToStr(DayOf(DtRCekTarihi.Date));
Qry1.Parameters.ParamByName('CekTarihi2').Value  := IntToStr(YearOf(DtRCekTarihi2.Date))+'-'+
                                                   IntToStr(MonthOf(DtRCekTarihi2.Date))+'-'+
                                                   IntToStr(DayOf(DtRCekTarihi2.Date));
end;



Qry1.Prepared;
Qry1.Open;



if Qry1.RecordCount<>0 then AdvRapor.RowCount := Qry1.RecordCount  + 2 ;

TmpToplamBorc:=TmpBorc2;
TmpToplamAlacak := TmpAlacak2;
for i:=2 to Qry1.RecordCount+1 do begin

AdvRapor.Cells[1,i] := qry1.FieldByName('Tarih').AsString;
AdvRapor.Cells[2,i] := qry1.FieldByName('Aciklama').AsString;
AdvRapor.Cells[3,i] := qry1.FieldByName('CariHesap').AsString;
AdvRapor.Cells[4,i] := qry1.FieldByName('CariTuru').AsString;
AdvRapor.Cells[5,i] := qry1.FieldByName('OdemeTuru').AsString;
AdvRapor.Cells[6,i] := qry1.FieldByName('CekNo').AsString;
AdvRapor.Cells[7,i] := qry1.FieldByName('CekTarihi').AsString;
TmpBorc := qry1.FieldByName('Borc').Ascurrency ;
AdvRapor.Cells[8,i] := FormatFloat('#,##0.00',TmpBorc);

TmpAlacak := qry1.FieldByName('Alacak').Ascurrency ;
AdvRapor.Cells[9,i] := FormatFloat('#,##0.00',TmpAlacak);

TmpBakiye:=TmpBakiye + (TmpBorc-TmpAlacak);
AdvRapor.Cells[10,i] := FormatFloat('#,##0.00',TmpBakiye);

TmpToplamAlacak := TmpToplamAlacak + TmpAlacak;
TmpToplamBorc := TmpToplamBorc + TmpBorc ;


AdvRapor.Cells[11,i]:= qry1.FieldByName('id').AsString;
AdvRapor.Cells[12,i]:= qry1.FieldByName('faturano').AsString;
AdvRapor.Cells[13,i]:= qry1.FieldByName('satisno').AsString;
AdvRapor.Cells[14,i]:= qry1.FieldByName('sevkno').AsString;
Qry1.Next;
end;

AdvRapor.autonumbercol(0);

AdvRapor.AddRow;

AdvRapor.Colors[9,AdvRapor.RowCount-1] := clYellow;
AdvRapor.Colors[8,AdvRapor.RowCount-1] := clYellow;
AdvRapor.Colors[10,AdvRapor.RowCount-1] := clYellow;

AdvRapor.Cells[9,AdvRapor.RowCount-1] := FormatFloat('#,##0.00',TmpToplamAlacak);
AdvRapor.Cells[8,AdvRapor.RowCount-1] := FormatFloat('#,##0.00',TmpToplamBorc);
AdvRapor.Cells[10,AdvRapor.RowCount-1] := FormatFloat('#,##0.00',TmpToplamBorc-TmpToplamAlacak);

end;


procedure TFrmMenu.imgLogoClick(Sender: TObject);
begin
if Sayfalar.ActivePage = Login then exit;



PnlCizgiAlt.Visible := False ;
Sayfalar.ActivePage := Login ;

end;



procedure TFrmMenu.Label26Click(Sender: TObject);
begin
cnn1.Connected := False;
memo1.lines.loadfromfile(CurrentPatika+'\GCcxdk');
cnn1.ConnectionString := memo1.Text;
cnn1.Connected := True;
showmessage('Baðlantý Yenilendi  ... ');
end;

procedure TFrmMenu.MenuItem1Click(Sender: TObject);
var i,x:integer;
begin
TmpS:=1;

AdvGeriiadeStok.ClearRows(1,AdvGeriiadeStok.RowCount-1);
AdvGeriiadeStok.RowCount := 2;

x:=1;
for i:=1 to AdvStok.RowCount-1 do begin
if AdvStok.Cells[1,i] = 'Y' then begin

if x>1 then begin AdvGeriiadeStok.AddRow;  end;
AdvGeriiadeStok.Cells[1,x] := AdvStok.Cells[2,i] ;
AdvGeriiadeStok.Cells[2,x] := AdvStok.Cells[3,i] ;
AdvGeriiadeStok.Cells[3,x] := AdvStok.Cells[4,i] ;
AdvGeriiadeStok.Cells[4,x] := AdvStok.Cells[5,i] ;

AdvGeriiadeStok.Cells[5,x] := AdvStok.Cells[7,i] ;
AdvGeriiadeStok.Cells[6,x] := AdvStok.Cells[6,i] ;
AdvGeriiadeStok.Cells[7,x] := AdvStok.Cells[8,i] ;


AdvGeriiadeStok.Cells[8,x] := AdvStok.Cells[4,i] ;


AdvGeriiadeStok.Cells[9,x] := AdvStok.Cells[13,i] ;
AdvGeriiadeStok.Cells[10,x] := AdvStok.Cells[14,i] ;
x:=x+1;
end;
end;

AdvGeriiadeStok.AutoNumberCol(0);
PnlGeriiadeStok.Visible := True;

TmpS:=0;
end;

procedure TFrmMenu.MusteriGetir;
begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add( 'Select * from Musteri where id=:id ');
Qry1.Parameters.ParamByName('id').Value    := AdvRapor.Cells[5,AdvRapor.Row];
Qry1.Prepared := True;
Qry1.open;

CmbMParaBirimi.ItemIndex := CmbMParaBirimi.Items.IndexOf(Qry1.FieldByName('parabirimi').AsString );

TxtMAdi.Tag     := Qry1.FieldByName('id').AsInteger    ;
TxtMAdi.Text    := Qry1.FieldByName('adi').AsString    ;
TxtMTelNo.Text  := Qry1.FieldByName('telno').AsString  ;
MemMNotlar.Text := Qry1.FieldByName('notlar').AsString ;
TxtMEmail.Text  := Qry1.FieldByName('email').AsString  ;

BtnMKaydet.Enabled   := False  ;
BtnMGuncelle.Enabled   := True ;
BtnMSil.Enabled := True ;

CizgiGetirAlt(Btnmusteri,musteri);

end;

procedure TFrmMenu.MusteriListele;
var TmpSql:String;
i:integer;
begin

AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 2;
AdvRapor.ColCount := 5 ;

AdvRapor.Cells[1,0] := 'Adý';
AdvRapor.ColWidths[1] := 200 ;
AdvRapor.Cells[2,0] := 'Tel No';
AdvRapor.ColWidths[2] := 150 ;
AdvRapor.Cells[3,0] := 'Notlar';
AdvRapor.ColWidths[3] := 300 ;
AdvRapor.Cells[4,0] := 'Email';
AdvRapor.ColWidths[4] := 150 ;



TmpSql:= TmpSql + 'Select '+
'id, adi,telno,notlar,email '+
' from musteri where id<>0 ' ;

if CmbRMusteri.Text = 'Müþteri Adý -Soyadý' then
TmpSql:= TmpSql + ' and adi like :adi ' ;

TmpSql:= TmpSql + ' order by adi' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if CmbRMusteri.Text = 'Müþteri Adý -Soyadý' then
Qry1.Parameters.ParamByName('adi').Value := TxtRMusteri.Text+'%' ;

Qry1.Prepared;
Qry1.Open;

if Qry1.RecordCount<>0 then AdvRapor.RowCount := Qry1.RecordCount  + 1 ;

for i:=1 to Qry1.RecordCount do begin

AdvRapor.Cells[1,i] := qry1.FieldByName('adi').AsString;
AdvRapor.Cells[2,i] := qry1.FieldByName('telno').AsString;
AdvRapor.Cells[3,i] := qry1.FieldByName('notlar').AsString;
AdvRapor.Cells[4,i] := qry1.FieldByName('email').AsString;

AdvRapor.Cells[5,i] := qry1.FieldByName('id').AsString;
Qry1.Next;
end;

AdvRapor.autonumbercol(0);

end;


procedure TFrmMenu.PopGeriiadeClick(Sender: TObject);
var i,x:integer;
begin
TmpS:=1;

AdvGeriiade.ClearRows(1,AdvGeriiade.RowCount-1);
AdvGeriiade.RowCount := 2;

x:=1;
for i:=1 to AdvSatis.RowCount-1 do begin
if AdvSatis.Cells[1,i] = 'Y' then begin

if x>1 then begin AdvGeriiade.AddRow;  end;
AdvGeriiade.Cells[1,x] := AdvSatis.Cells[2,i] ;
AdvGeriiade.Cells[2,x] := AdvSatis.Cells[3,i] ;
AdvGeriiade.Cells[3,x] := AdvSatis.Cells[4,i] ;
AdvGeriiade.Cells[4,x] := AdvSatis.Cells[5,i] ;
AdvGeriiade.Cells[5,x] := AdvSatis.Cells[6,i] ;
AdvGeriiade.Cells[6,x] := AdvSatis.Cells[7,i] ;
AdvGeriiade.Cells[7,x] := AdvSatis.Cells[8,i] ;
AdvGeriiade.Cells[8,x] := AdvSatis.Cells[4,i] ;
AdvGeriiade.Cells[9,x] := AdvSatis.Cells[9,i] ;
AdvGeriiade.Cells[10,x] := AdvSatis.Cells[10,i] ;
x:=x+1;
end;
end;

AdvGeriiade.AutoNumberCol(0);
PnlGeriiade.Visible := True;

TmpS:=0;
end;


procedure TFrmMenu.BtnTSilClick(Sender: TObject);
begin
if MessageDlg('Kaydý Silmek Ýstiyormusunuz ? ',mtConfirmation,[mbYes,mbNo],0) = mrNo Then exit;

Qry1.SQL.Clear;
Qry1.SQL.Add('Select id from Stok where tedarikci=:tedarikci ');
Qry1.Parameters.ParamByName('tedarikci').Value := TxtTedarikci.text ;
Qry1.Prepared;
Qry1.open;
if Qry1.RecordCount <> 0 then begin
Showmessage('Tedarikci Silinemez, Stoklarda Mevcut ...');
exit;
end;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Delete from Tedarikci where id=:id');
Qry1.Parameters.ParamByName('id').Value :=TxtTedarikci.Tag ;
Qry1.Prepared;
Qry1.ExecSQL;

BtnTTemizle.Click;

end;

procedure TFrmMenu.BtnTTemizleClick(Sender: TObject);
begin
TxtTedarikci.Tag := 0 ;

TxtTedarikci.Clear ;

TxtTelNo.Clear ;
TxtEmail.Clear ;
MemAciklama.Clear ;

BtnTKaydet.Enabled   := True  ;
BtnTGuncelle.Enabled   := False ;
BtnTSil.Enabled := False ;

end;

procedure TFrmMenu.BtnTedarikciClick(Sender: TObject);
begin
CizgiGetirAlt(BtnTedarikci,Tedarikci);

BtnTKaydet.enabled:=True;
BtnTGuncelle.enabled:=False;
BtnTSil.enabled:=False;

end;

procedure TFrmMenu.BtnABold2Click(Sender: TObject);
var
  Button: TSpeedButton;
begin
  Button := Sender as TSpeedButton;



end;

procedure TFrmMenu.BtnAnalizClick(Sender: TObject);
begin
CizgiGetirAlt(BtnAnaliz,Analiz);

end;

procedure TFrmMenu.BtnDovizClick(Sender: TObject);
begin


TRY
{
XMLDocument1.Active:=false;

//XMLDocument1.FileName:='http://www.kktcmerkezbankasi.org/kur/gunluk.xml';
XMLDocument1.FileName:='http://www.mb.gov.ct.tr/kur/gunluk.xml';
XMLDocument1.Active:=true;
XMLDocument1.SaveToFile(GetCurrentDir+'\x.xml');
}

DownloadFile('http://www.mb.gov.ct.tr/kur/gunluk.xml', GetCurrentDir+'\gunluk.xml') ;

AdvDoviz.LoadFromXML(GetCurrentDir+'\gunluk.xml');
AdvDoviz.AutoSize:=True;

MemDoviz.Clear;
MemDoviz.Lines.Add( RightStr('                            ',21)   + LeftStr('Alýþ         ',9)+LeftStr('Satýþ        ',10));
MemDoviz.Lines.Add(' ');
MemDoviz.Lines.Add( RightStr('               '+AdvDoviz.Cells[2,4]+'  ',20) + LeftStr(AdvDoviz.Cells[3,4]+'       ',10)+LeftStr(AdvDoviz.Cells[4,4]+'        ',10))  ;
MemDoviz.Lines.Add( RightStr('               '+AdvDoviz.Cells[23,4]+'  ',20)+ LeftStr(AdvDoviz.Cells[24,4]+'      ',10)+LeftStr(AdvDoviz.Cells[25,4]+'       ',10)) ;
MemDoviz.Lines.Add( RightStr('               '+AdvDoviz.Cells[30,4]+'  ',20)+ LeftStr(AdvDoviz.Cells[31,4]+'      ',10)+LeftStr(AdvDoviz.Cells[32,4]+'       ',10)) ;

AlisDolar   :=  StrToCurr(AdvDoviz.Cells[3,4])  ;
AlisEuro    :=  StrToCurr(AdvDoviz.Cells[24,4]) ;
AlisSterlin :=  StrToCurr(AdvDoviz.Cells[31,4]) ;

EXCEPT
//MsgUyari('Döviz Kurlarýna Eriþilemiyor, Lütfen internet baðlantýnýzý kontrol ediniz ...') ;
MemDoviz.Text := 'Döviz Kurlarýna Eriþilemiyor, Lütfen internet baðlantýnýzý kontrol ediniz ...' ;
END;


end;

procedure TFrmMenu.BtnStTemizleClick(Sender: TObject);
begin
PubTemp := 1 ;
AdvStok.ClearRows(1,AdvStok.RowCount-1);
AdvStok.RowCount := 2 ;

TxtFaturaNo.Clear;
CmbTedarikci.Text:='';
CurrGenelToplam.Value := 0 ;
DtAlimTarihi.Date := Date ;
BtnStKaydet.enabled:=True;
BtnStGuncelle.enabled:=False;
BtnStSil.enabled:=False;

PubTemp := 0 ;
end;

procedure TFrmMenu.BtnSYazdirClick(Sender: TObject);
begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('select * from satis where satisno=:satisno ');
Qry1.Parameters.ParamByName('satisno').Value := CmbMusteri.Tag ;
Qry1.Prepared;
Qry1.open;


QRepPropertyEN:=TQRepPropertyEN.Create(Self);
QRepPropertyEN.DateTime.Caption := DateToStr(Date);
QRepPropertyEN.QrlSatisNo.Caption := 'Satýþ No :' + inttostr(CmbMusteri.Tag) ;
QRepPropertyEN.PreviewModal;
QRepPropertyEN.Free;


end;

procedure TFrmMenu.BtnStSilClick(Sender: TObject);
var i:integer;
TmpSql:String;
begin
if MessageDlg('Kaydý Silmek Ýstiyormusunuz ? ',mtConfirmation,[mbYes,mbNo],0) = mrNo Then exit;

if TxtFaturaNo.Text<>'' then begin

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Delete from Stok where FaturaNo=:FaturaNo');
Qry1.Parameters.ParamByName('FaturaNo').Value := TxtFaturaNo.Text ;
Qry1.Prepared;
Qry1.ExecSQL;

for i:=1 to AdvStok.RowCount-1 do begin

TmpSql:=  'update stokfiyat set '+
' stoktarihi=:stoktarihi, Adet= adet-'+AdvStok.Cells[4,i]+' '+
' where stokadi=:stokadi ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stoktarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));
Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Prepared;
Qry1.ExecSQL;
end;

TmpSql:= 'delete from hesaplar where FaturaNo =:FaturaNo ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('FaturaNo').Value  :=  TxtFaturaNo.Text ;
Qry1.Prepared;
Qry1.ExecSQL;

end

Else if TxtSevkNo.Text<>'' then begin

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Delete from Stok where SevkNo=:SevkNo');
Qry1.Parameters.ParamByName('SevkNo').Value := TxtSevkNo.Text ;
Qry1.Prepared;
Qry1.ExecSQL;

for i:=1 to AdvStok.RowCount-1 do begin

TmpSql:=  'update stokfiyat set '+
' stoktarihi=:stoktarihi,Adet= adet-'+AdvStok.Cells[4,i]+' '+
' where stokadi=:stokadi ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stoktarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));

Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Prepared;
Qry1.ExecSQL;
end;

TmpSql:= 'delete from hesaplar where SevkNo =:SevkNo ' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('SevkNo').Value  :=  TxtSevkNo.Text ;
Qry1.Prepared;
Qry1.ExecSQL;

end;
ShowMessage('Kayýt Silindi ...');
BtnStTemizle.Click;

end;

procedure TFrmMenu.BtnStGuncelleClick(Sender: TObject);
var TmpSql:String;
i:integer;
begin
if TxtFaturaNo.Text = '' then begin
ShowMessage('Fatura No giriniz ...');
exit;
end;

if CmbTedarikci.Text = '' then begin
ShowMessage('Tedarikci giriniz ...');
exit;
end;


for i:= 1 to AdvStok.RowCount-1 do begin

TmpSql:= TmpSql + 'Update stok set '+
'faturano=:faturano,stokadi=:stokadi,alimtarihi=:alimtarihi,tedarikci=:tedarikci,adet=:adet,'+
'fiyati=:fiyati,ind=:ind,kdv=:kdv,alisfiyati=:alisfiyati,kdvsatis=:kdvsatis,satisoran=:satisoran,'+
'satisfiyati=:satisfiyati,GenelToplam=:GenelToplam '+
' where id=:id ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('faturano').Value    := TxtFaturaNo.Text ;
Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;

Qry1.Parameters.ParamByName('alimtarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));

Qry1.Parameters.ParamByName('tedarikci').Value   := CmbTedarikci.Text ;
Qry1.Parameters.ParamByName('adet').Value        := AdvStok.Cells[3,i] ;
Qry1.Parameters.ParamByName('fiyati').Value      := AdvStok.Cells[4,i] ;
Qry1.Parameters.ParamByName('ind').Value         := AdvStok.Cells[5,i] ;
Qry1.Parameters.ParamByName('kdv').Value         := AdvStok.Cells[6,i] ;
Qry1.Parameters.ParamByName('alisfiyati').Value  := AdvStok.Cells[7,i] ;
Qry1.Parameters.ParamByName('kdvsatis').Value    := AdvStok.Cells[8,i] ;
Qry1.Parameters.ParamByName('satisoran').Value   := AdvStok.Cells[9,i] ;
Qry1.Parameters.ParamByName('satisfiyati').Value := AdvStok.Cells[10,i] ;
Qry1.Parameters.ParamByName('GenelToplam').Value := CurrGenelToplam.Value ;

Qry1.Parameters.ParamByName('id').Value         := AdvStok.Cells[11,i] ;

Qry1.Prepared;
Qry1.ExecSQL;


/////////////////////////////////////////////////////////////////////////////
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select id from stokfiyat where stokadi=:stokadi ');
Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Prepared;
Qry1.open;
if Qry1.RecordCount = 0 then begin

TmpSql:= 'insert into stokfiyat '+
' (stoktarihi,kayittarihi,stokadi,Adet,AlisFiyati,KdvSatis,SatisOran,SatisFiyati) '+
' Values ' +
' (:stoktarihi,:kayittarihi,:stokadi,:Adet,:AlisFiyati,:KdvSatis,:SatisOran,:SatisFiyati) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stoktarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));
Qry1.Parameters.ParamByName('kayittarihi').Value := IntToStr(YearOf(Date))+'-'+
                                                    IntToStr(MonthOf(Date))+'-'+
                                                    IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Parameters.ParamByName('Adet').Value        := strtofloat(AdvStok.Cells[3,i]) ;
Qry1.Parameters.ParamByName('AlisFiyati').Value  := AdvStok.Cells[7,i] ;
Qry1.Parameters.ParamByName('KdvSatis').Value    := AdvStok.Cells[8,i] ;
Qry1.Parameters.ParamByName('SatisOran').Value   := AdvStok.Cells[9,i] ;
Qry1.Parameters.ParamByName('SatisFiyati').Value := AdvStok.Cells[10,i] ;

Qry1.Prepared;
Qry1.ExecSQL;

end
Else begin

TmpSql:=  'update stokfiyat set '+

' stoktarihi=:stoktarihi, kayittarihi=:kayittarihi,stokadi=:stokadi1,Adet=:Adet,  '+
' AlisFiyati=:AlisFiyati, KdvSatis=:KdvSatis, SatisOran=:SatisOran, SatisFiyati=:SatisFiyati '+
' where stokadi=:stokadi2' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('stoktarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));
Qry1.Parameters.ParamByName('kayittarihi').Value := IntToStr(YearOf(Date))+'-'+
                                                    IntToStr(MonthOf(Date))+'-'+
                                                    IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('stokadi1').Value    := AdvStok.Cells[2,i] ;
Qry1.Parameters.ParamByName('Adet').Value        := Qry1.Parameters.ParamByName('Adet').Value + strtofloat(AdvStok.Cells[3,i]) ;
Qry1.Parameters.ParamByName('AlisFiyati').Value  := AdvStok.Cells[7,i] ;
Qry1.Parameters.ParamByName('KdvSatis').Value    := AdvStok.Cells[8,i] ;
Qry1.Parameters.ParamByName('SatisOran').Value   := AdvStok.Cells[9,i] ;
Qry1.Parameters.ParamByName('SatisFiyati').Value := AdvStok.Cells[10,i] ;

Qry1.Parameters.ParamByName('stokadi2').Value    := AdvStok.Cells[2,i] ;

Qry1.Prepared;
Qry1.ExecSQL;
end;
/////////////////////////////////////////////////////////////////////////////



end;




TmpSql:= 'Update hesaplar set'+
' Tarih=:Tarih,Aciklama=:Aciklama,OdemeTuru=:OdemeTuru,CekNo=:CekNo,'+
'Borc=:Borc,Alacak=:Alacak,CariHesap=:CariHesap '+
' where FaturaNo=:FaturaNo' ;
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('Aciklama').Value  := 'Stok Giriþ' ;
Qry1.Parameters.ParamByName('OdemeTuru').Value := '' ;
Qry1.Parameters.ParamByName('CekNo').Value     := '' ;
Qry1.Parameters.ParamByName('Borc').Value      := CurrGenelToplam.Value ;
Qry1.Parameters.ParamByName('Alacak').Value    := '0' ;
Qry1.Parameters.ParamByName('CariHesap').Value := CmbTedarikci.Text ;

Qry1.Parameters.ParamByName('FaturaNo').Value  :=  TxtFaturaNo.Text ;

Qry1.Prepared;
Qry1.ExecSQL;





Showmessage('Güncellendi') ;
end;

procedure TFrmMenu.BtnMusteriClick(Sender: TObject);
begin
CizgiGetirAlt(Btnmusteri,musteri);

BtnMKaydet.enabled:=True;
BtnMGuncelle.enabled:=False;
BtnMSil.enabled:=False;

end;


procedure TFrmMenu.BtnTKaydetClick(Sender: TObject);
Var TmpSql,TmpRwe:String;
begin

if TxtTedarikci.Text = '' then begin
ShowMessage('Tedarikci adýný giriniz ...');
exit;
end;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from tedarikci where Adi=:Adi ');
Qry1.Parameters.ParamByName('Adi').Value := TxtTedarikci.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Kayit Mevcut ...');
exit;
end;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id from musteri where Adi=:Adi ');
Qry1.Parameters.ParamByName('Adi').Value := TxtTedarikci.Text;
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <> 0 Then begin
ShowMessage('Ayni isimde hem Müþteri hem Tedarikçi kaydedilemez...');
exit;
end;

TmpSql:= 'Insert into tedarikci (Adi,telno,email,aciklama,parabirimi) '+
'values (:Adi,:telno,:email,:aciklama,:parabirimi) ';
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('adi').Value      := TxtTedarikci.Text ;
Qry1.Parameters.ParamByName('telno').Value    := TxtTelNo.Text ;
Qry1.Parameters.ParamByName('email').Value    := TxtEmail.Text ;
Qry1.Parameters.ParamByName('aciklama').Value := MemAciklama.Text ;
Qry1.Parameters.ParamByName('parabirimi').Value := CmbTParaBirimi.Text ;
Qry1.Prepared := True;
Qry1.ExecSql;

showmessage('Kaydedildi ..');

CmbTedarikciGetir;

end;


procedure TFrmMenu.BtnStKaydetClick(Sender: TObject);
var TmpSql:String;
i:integer;
TmpGenelToplam:Currency;
begin
PubTemp:=1 ;

if (TxtFaturaNo.Text <> '') or (TxtSevkNo.Text <> '') then begin

end
else begin
ShowMessage('Fatura No veya Sevk No giriniz ...');
exit;
end;

if CmbTedarikci.Text = '' then begin
ShowMessage('Tedarikci giriniz ...');
exit;
end;

if TxtFaturaNo.Text<>'' then begin
Qry1.SQL.Clear;
Qry1.SQL.Add('Select id from Stok where FaturaNo=:FaturaNo ');
Qry1.Parameters.ParamByName('FaturaNo').Value := TxtFaturaNo.Text ;
Qry1.Prepared;
Qry1.open;
if Qry1.RecordCount <> 0 then begin
if MessageDlg('Fatura No Mevcut , Devam etmek istiyormusunuz ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

Qry1.SQL.Clear;
Qry1.SQL.Add('Select tedarikci,parabirimi from Stok where FaturaNo=:FaturaNo ');
Qry1.Parameters.ParamByName('FaturaNo').Value := TxtFaturaNo.Text ;
Qry1.Prepared;
Qry1.open;

CmbTedarikci.Text := qry1.FieldByName('tedarikci').AsString ;
CmbTParaBirimi.Text := qry1.FieldByName('parabirimi').AsString ;

Qry1.SQL.Clear;
Qry1.SQL.Add('Select sum(alisfiyati) as GT from Stok where FaturaNo=:FaturaNo ');
Qry1.Parameters.ParamByName('FaturaNo').Value := TxtFaturaNo.Text ;
Qry1.Prepared;
Qry1.open;

CurrGenelToplam.Value :=  qry1.FieldByName('GT').AsCurrency ;


for i:=1 to AdvStok.RowCount - 1 do
CurrGenelToplam.Value := CurrGenelToplam.Value + StrToFloat(AdvStok.Cells[7,i]) ;

//Showmessage('Fatura No Mevcut ... ');
end;
end;

if TxtSevkNo.Text<>'' then begin
Qry1.SQL.Clear;
Qry1.SQL.Add('Select id from Stok where SevkNo=:SevkNo ');
Qry1.Parameters.ParamByName('SevkNo').Value := TxtSevkNo.Text ;
Qry1.Prepared;
Qry1.open;
if Qry1.RecordCount <> 0 then begin
if MessageDlg('Sevk No Mevcut , Devam etmek istiyormusunuz ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

Qry1.SQL.Clear;
Qry1.SQL.Add('Select tedarikci,parabirimi from Stok where SevkNo=:SevkNo ');
Qry1.Parameters.ParamByName('SevkNo').Value := TxtSevkNo.Text ;
Qry1.Prepared;
Qry1.open;
CmbTedarikci.Text     := qry1.FieldByName('tedarikci').AsString ;
CmbTParaBirimi.Text   := qry1.FieldByName('parabirimi').AsString ;


Qry1.SQL.Clear;
Qry1.SQL.Add('Select sum(alisfiyati) as GT from Stok where FaturaNo=:FaturaNo ');
Qry1.Parameters.ParamByName('FaturaNo').Value := TxtFaturaNo.Text ;
Qry1.Prepared;
Qry1.open;

CurrGenelToplam.Value :=  qry1.FieldByName('GT').AsCurrency ;


for i:=1 to AdvStok.RowCount - 1 do
CurrGenelToplam.Value := CurrGenelToplam.Value + StrToFloat(AdvStok.Cells[7,i]) ;

end;
end;


for i:= 1 to AdvStok.RowCount-1 do begin

if AdvStok.cells[2,i]='' Then Continue;


TmpSql:= 'insert into stok '+
' (faturano,stokadi,alimtarihi,tedarikci,Birim,adet,fiyati,ind,kdv,alisfiyati,alisfiyatibirim,kdvsatis,satisoran,satisfiyati,GenelToplam,sevkno,parabirimi,geriiade,geriiadeadet) '+
'Values (:faturano,:stokadi,:alimtarihi,:tedarikci,:Birim,:adet,:fiyati,:ind,:kdv,:alisfiyati,:alisfiyatibirim,:kdvsatis,:satisoran,:satisfiyati,:GenelToplam,:sevkno,:parabirimi,:geriiade,:geriiadeadet) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('faturano').Value    := TxtFaturaNo.Text ;
Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Parameters.ParamByName('alimtarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));
Qry1.Parameters.ParamByName('tedarikci').Value   := CmbTedarikci.Text ;
Qry1.Parameters.ParamByName('Birim').Value       := AdvStok.Cells[3,i] ;
Qry1.Parameters.ParamByName('adet').Value        := AdvStok.Cells[4,i] ;
Qry1.Parameters.ParamByName('fiyati').Value      := AdvStok.Cells[5,i] ;
Qry1.Parameters.ParamByName('ind').Value         := AdvStok.Cells[6,i] ;
Qry1.Parameters.ParamByName('kdv').Value         := AdvStok.Cells[7,i] ;
Qry1.Parameters.ParamByName('alisfiyati').Value      := AdvStok.Cells[8,i] ;
Qry1.Parameters.ParamByName('alisfiyatibirim').Value := AdvStok.Cells[9,i] ;
Qry1.Parameters.ParamByName('kdvsatis').Value        := AdvStok.Cells[10,i] ;
Qry1.Parameters.ParamByName('satisoran').Value       := AdvStok.Cells[11,i] ;
Qry1.Parameters.ParamByName('satisfiyati').Value     := AdvStok.Cells[12,i] ;
Qry1.Parameters.ParamByName('GenelToplam').Value     := CurrGenelToplam.Value ;
Qry1.Parameters.ParamByName('sevkno').Value          := TxtSevkNo.Text ;
Qry1.Parameters.ParamByName('parabirimi').Value      := CmbTPbirimi.Text ;

Qry1.Parameters.ParamByName('geriiade').Value            := 'N' ;
Qry1.Parameters.ParamByName('geriiadeadet').Value        := '0' ;


Qry1.Prepared;
Qry1.ExecSQL;


/////////////////////////////////////////////////////////////////////////////
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select id from stokfiyat where stokadi=:stokadi ');
Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Prepared;
Qry1.open;
if Qry1.RecordCount = 0 then begin

TmpSql:= 'insert into stokfiyat '+
' (stoktarihi,kayittarihi,stokadi,Birim,Adet,AlisFiyati,KdvSatis,SatisOran,SatisFiyati,parabirimi) '+
' Values ' +
' (:stoktarihi,:kayittarihi,:stokadi,:Birim,:Adet,:AlisFiyati,:KdvSatis,:SatisOran,:SatisFiyati,:parabirimi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('stoktarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));
Qry1.Parameters.ParamByName('kayittarihi').Value := IntToStr(YearOf(Date))+'-'+
                                                    IntToStr(MonthOf(Date))+'-'+
                                                    IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Parameters.ParamByName('Birim').Value       := AdvStok.Cells[3,i] ;
Qry1.Parameters.ParamByName('Adet').Value        := strtofloat(AdvStok.Cells[4,i]) ;
Qry1.Parameters.ParamByName('AlisFiyati').Value  := AdvStok.Cells[8,i] ;
Qry1.Parameters.ParamByName('KdvSatis').Value    := AdvStok.Cells[10,i] ;
Qry1.Parameters.ParamByName('SatisOran').Value   := AdvStok.Cells[11,i] ;
Qry1.Parameters.ParamByName('SatisFiyati').Value := AdvStok.Cells[12,i] ;
Qry1.Parameters.ParamByName('parabirimi').Value  := CmbTPbirimi.Text ;

Qry1.Prepared;
Qry1.ExecSQL;

end
Else begin

TmpSql:=  'update stokfiyat set '+

' stoktarihi=:stoktarihi,kayittarihi=:kayittarihi,Birim=:Birim,Adet= adet+'+AdvStok.Cells[4,i]+',AlisFiyati=:AlisFiyati, KdvSatis=:KdvSatis, '+
' SatisOran=:SatisOran, SatisFiyati=:SatisFiyati, Parabirimi=:Parabirimi '+
' where stokadi=:stokadi ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

Qry1.Parameters.ParamByName('stoktarihi').Value  := IntToStr(YearOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(MonthOf(DtAlimTarihi.Date))+'-'+
                                                    IntToStr(DayOf(DtAlimTarihi.Date));
Qry1.Parameters.ParamByName('kayittarihi').Value := IntToStr(YearOf(Date))+'-'+
                                                    IntToStr(MonthOf(Date))+'-'+
                                                    IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('Birim').Value       := AdvStok.Cells[3,i] ;
Qry1.Parameters.ParamByName('AlisFiyati').Value  := AdvStok.Cells[8,i] ;
Qry1.Parameters.ParamByName('KdvSatis').Value    := AdvStok.Cells[10,i] ;
Qry1.Parameters.ParamByName('SatisOran').Value   := AdvStok.Cells[11,i] ;
Qry1.Parameters.ParamByName('SatisFiyati').Value := AdvStok.Cells[12,i] ;

Qry1.Parameters.ParamByName('stokadi').Value     := AdvStok.Cells[2,i] ;
Qry1.Parameters.ParamByName('parabirimi').Value  := CmbTPbirimi.Text ;

Qry1.Prepared;
Qry1.ExecSQL;
end;
/////////////////////////////////////////////////////////////////////////////


end;


TmpSql:= 'insert into hesaplar '+
' (Tarih,Faturano,Aciklama,OdemeTuru,CekNo,Borc,Alacak,CariHesap,CariTuru,sevkno,parabirimi) '+
' Values ' +
' (:Tarih,:Faturano,:Aciklama,:OdemeTuru,:CekNo,:Borc,:Alacak,:CariHesap,:CariTuru,:sevkno,:parabirimi) ';

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Parameters.ParamByName('Tarih').Value := IntToStr(YearOf(Date))+'-'+
                                              IntToStr(MonthOf(Date))+'-'+
                                              IntToStr(DayOf(Date));

Qry1.Parameters.ParamByName('FaturaNo').Value  :=  TxtFaturaNo.Text ;


if TxtFaturaNo.Text<>'' then begin
Qry1.Parameters.ParamByName('Aciklama').Value  := 'Fatura No :'+TxtFaturaNo.text ;
end
Else if TxtSevkNo.Text<>'' then begin
Qry1.Parameters.ParamByName('Aciklama').Value  := 'Sevk No :'+TxtSevkNo.text ;
end;


Qry1.Parameters.ParamByName('OdemeTuru').Value := '' ;
Qry1.Parameters.ParamByName('CekNo').Value     := '' ;
Qry1.Parameters.ParamByName('Borc').Value      := '0' ;

TmpGenelToplam := 0 ;
for i:=1 to AdvStok.RowCount - 1 do
TmpGenelToplam := TmpGenelToplam + StrToFloat(AdvStok.Cells[8,i]) ;

Qry1.Parameters.ParamByName('Alacak').Value    := TmpGenelToplam ;



Qry1.Parameters.ParamByName('CariHesap').Value := CmbTedarikci.Text ;
Qry1.Parameters.ParamByName('CariTuru').Value := 'Tedarikci' ;
Qry1.Parameters.ParamByName('sevkno').Value          := TxtSevkNo.Text ;
Qry1.Parameters.ParamByName('parabirimi').Value  := CmbTPbirimi.Text ;
Qry1.Prepared;
Qry1.ExecSQL;



Showmessage('Kaydedildi') ;

CmbStokAdiGetir;

BtnStTemizle.Click;

PubTemp:=0 ;


end;









procedure TFrmMenu.BtnStokGirisClick(Sender: TObject);
begin
CizgiGetirAlt(BtnStokGiris,StokGiris);

AdvStok.Colors[6,1]:= ClYellow ;
AdvStok.Colors[10,1]:= ClYellow ;

end;

procedure TFrmMenu.RbChart3MusteriClick(Sender: TObject);
var i:integer;
begin
if RbChart3Musteri.Checked=False then exit;


Chart3Musteri.clear;


Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select adi from musteri order by adi   ' );
Qry1.Open;


for i:=1 to qry1.Recordcount  do   begin
Chart3Musteri.items.add(Qry1.fieldbyname('adi').asstring);

qry1.next;
end;

end;
procedure TFrmMenu.RbChart3TedarikciClick(Sender: TObject);
var i:integer;
begin

if RbChart3Tedarikci.Checked=False then exit;

Chart3Tedarikci.clear;


Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select adi from tedarikci order by adi   ' );
Qry1.Open;


for i:=1 to qry1.Recordcount  do   begin
Chart3Tedarikci.items.add(Qry1.fieldbyname('adi').asstring);


qry1.next;
end;
end;

procedure TFrmMenu.RbHGenelGiderlerClick(Sender: TObject);
begin
CmbHCariHesap.clear;
CmbHCariHesap.items.add('Genel Giderler');
CmbHCariHesap.ItemIndex := 0;

CmbHParabirimi.Text := 'TL';
end;

procedure TFrmMenu.RbHMusteriClick(Sender: TObject);
var i:integer;
begin
CmbHCariHesap.clear;
CmbHParabirimi.clear;

Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select adi,parabirimi from musteri order by adi   ' );
Qry1.Open;


for i:=1 to qry1.Recordcount  do   begin
CmbHCariHesap.items.add(Qry1.fieldbyname('adi').asstring);
CmbHParabirimi.items.add(Qry1.fieldbyname('parabirimi').asstring);

qry1.next;
end;
end;

procedure TFrmMenu.RbHTedarikciClick(Sender: TObject);
var i:integer;
begin
CmbHCariHesap.clear;
CmbHParabirimi.clear;

Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select adi,parabirimi from tedarikci order by adi   ' );
Qry1.Open;


for i:=1 to qry1.Recordcount  do   begin
CmbHCariHesap.items.add(Qry1.fieldbyname('adi').asstring);
CmbHParabirimi.items.add(Qry1.fieldbyname('parabirimi').asstring);

qry1.next;
end;
end;

procedure TFrmMenu.RbRGenelGiderlerClick(Sender: TObject);

begin
CmbRCariHesap.clear;
CmbRCariHesap.items.add('Genel Giderler');
CmbRCariHesap.ItemIndex := 0;
CmbRParabirimi.Text := 'TL' ;
end;

procedure TFrmMenu.RbRMusteriClick(Sender: TObject);
var i:integer;
begin
CmbRCariHesap.clear;
CmbRParabirimi.clear;

Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select adi,parabirimi from musteri order by adi   ' );
Qry1.Open;


for i:=1 to qry1.Recordcount  do   begin
CmbRCariHesap.items.add(Qry1.fieldbyname('adi').asstring);
CmbRParabirimi.items.add(Qry1.fieldbyname('parabirimi').asstring);
qry1.next;
end;
end;

procedure TFrmMenu.RbRTedarikciClick(Sender: TObject);
var i:integer;
begin
CmbRCariHesap.clear;
CmbRParabirimi.Clear;

Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select adi,parabirimi from tedarikci order by adi   ' );
Qry1.Open;


for i:=1 to qry1.Recordcount  do   begin
CmbRCariHesap.items.add(Qry1.fieldbyname('adi').asstring);
CmbRParabirimi.items.add(Qry1.fieldbyname('parabirimi').asstring);
qry1.next;
end;
end;

procedure TFrmMenu.ResimKaydet(Fform: Tform; Field: string;TmpTag:integer);
var
  jpeg: TJPEGImage;
  Stream: TMemoryStream;
  BlobField: TBlobField;
  MS: TMemoryStream;
  J1: TJPEGImage;
  i:integer;
begin

//Resim Kaydetme iþlemi (Baþladý)

BlobField := Qry1.FieldByName(Field) as TBlobField;

  jpeg := TJPEGImage.Create;
  try

  for i:=0 to  fform.ComponentCount-1 do
      begin
        if fform.components[i] is TImage then
           begin
             if TImage(fform.components[i]).Tag = TmpTag then
                 if (TImage(fform.components[i]).Picture.Graphic  <> nil) then
                     jpeg.Assign (TImage(fform.components[i]).Picture.Graphic);
            end;
      end;
    Stream := TMemoryStream.Create;
    try
       jpeg.SaveToStream (Stream);
       BlobField.LoadFromStream (Stream);
   finally
      Stream.Free;
    end;
  finally
    jpeg.Free;


  end;


//Resim Kaydetme iþlemi (Bitti)

end;


procedure TFrmMenu.ResimYukle(img:Timage ; Field: string; TmpDMQRY: TADOQuery);
var
  jpeg: TJPEGImage;
  Stream: TMemoryStream;
  BlobField: TBlobField;
  MS: TMemoryStream;
  J1: TJPEGImage;
   i:integer;

begin

// Resim Yükleme Ýþlemi Baþladý
             J1 := TJPEGImage.Create;
               MS := TMemoryStream.Create;
               try
                 with TmpDMQRY do
                 begin
                 TBlobField(Fieldbyname(Field)).SaveToStream(MS);
                 end;

                 MS.Seek(0,soFromBeginning);

                 with J1 do begin
                   PixelFormat := jf24Bit;
                   Scale := jsFullSize;
                   Grayscale := False;
                   Performance := jpBestQuality;
                   ProgressiveDisplay := True;
                   ProgressiveEncoding := True;
                   LoadFromStream(MS);
                 end;


                        if MS.Size >0 then
                           img.Picture.Assign(J1)
                        else
                           img.Picture.Assign(nil);



               finally
                 J1.Free;
                 MS.Free;
               end;
// Resim Yükleme Ýþlemi Bitti


end;

procedure TFrmMenu.SatFiyatnDeitir1Click(Sender: TObject);
begin
PnlStokFiyat.Visible :=True ;
end;

procedure TFrmMenu.SatisGetir(TmpVar:String);
var i:integer;
begin

BtnStTemizle.Click;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select * from satis where satisno=:satisno');
Qry1.Parameters.ParamByName('satisno').Value  := TmpVar;
Qry1.Prepared;
Qry1.Open;

if qry1.RecordCount = 0 Then exit;

AdvSatis.RowCount := qry1.RecordCount + 1 ;

for i:=1 to Qry1.recordcount do begin

LblSatisNo.Caption := 'Satýþ No: '+TmpVar ;


TxtSAciklama.Text := Qry1.FieldByName('aciklama').asstring   ;
CmbMusteri.Text := Qry1.FieldByName('MusteriAdi').asstring   ;
CmbMPbirimi.Text := Qry1.FieldByName('parabirimi').asstring   ;



CmbMusteri.Tag := Qry1.FieldByName('SatisNo').AsInteger    ;




AdvSatis.AddCheckBox(1,i,False,True);
AdvSatis.Cells[2,i] := Qry1.FieldByName('StokAdi').asstring   ;
AdvSatis.Cells[3,i] := Qry1.FieldByName('birim').asstring     ;
AdvSatis.Cells[4,i] := Qry1.FieldByName('adet').asstring      ;
AdvSatis.Cells[5,i] := FormatFloat('#,##0.00',qry1.FieldByName('Fiyat').Ascurrency);


AdvSatis.Cells[6,i] := Qry1.FieldByName('Kdv').asstring       ;
AdvSatis.Cells[7,i] := Qry1.FieldByName('indirim').asstring       ;
AdvSatis.Cells[8,i] := FloatTostr(TmpRound(qry1.FieldByName('Toplam').Ascurrency));
AdvSatis.Cells[9,i] := Qry1.FieldByName('id').asstring        ;

if Qry1.FieldByName('geriiadeadet').asstring = '' then
AdvSatis.Cells[10,i] := '0'
Else AdvSatis.Cells[10,i] := Qry1.FieldByName('geriiadeadet').asstring ;

CurrSGenelToplam.Value := Qry1.FieldByName('GenelToplam').ascurrency ;
CurrSOdeme.Value       := Qry1.FieldByName('Odeme').ascurrency ;
CurrSKalan.Value       := Qry1.FieldByName('Kalan').ascurrency ;
CmbSOdemeTuru.Text     := Qry1.FieldByName('OdemeTuru').AsString ;
TxtSCekNo.Text         := Qry1.FieldByName('CekNo').AsString ;
DtSCekTarihi.Date      := Qry1.FieldByName('CekTarihi').AsDateTime ;
CurrSEmek.Value        := Qry1.FieldByName('emek').ascurrency ;
qry1.Next;
end;

CizgiGetirAlt(BtnSatis,Satis);
AdvSatis.Colors[3,1]:= ClYellow ;
AdvSatis.Colors[6,1]:= ClYellow ;

BtnSKaydet.Enabled := False ;
BtnSiptal.Enabled  := True ;

AdvSatis.AutoNumberCol(0);
end;




procedure TFrmMenu.SatisListele;
var TmpSql:String;
i:integer;
TmpToplam,TmpGenelToplam:Currency;
begin

AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 2;
AdvRapor.ColCount :=16 ;

AdvRapor.Cells[1,0] := 'SatisNo';
AdvRapor.ColWidths[1] := 50 ;
AdvRapor.Cells[2,0] := 'Tarih';
AdvRapor.ColWidths[2] := 80 ;
AdvRapor.Cells[3,0] := 'Müþteri Adý';
AdvRapor.ColWidths[3] := 200 ;
AdvRapor.Cells[4,0] := 'Stok Adý';
AdvRapor.ColWidths[4] := 200 ;
AdvRapor.Cells[5,0] := 'Adet';
AdvRapor.ColWidths[5] := 50 ;
AdvRapor.Cells[6,0] := 'Fiyat';
AdvRapor.ColWidths[6] := 80 ;

AdvRapor.Cells[7,0] := 'Kdv';
AdvRapor.ColWidths[7] := 50 ;
AdvRapor.Cells[8,0] := 'Ýndirim';
AdvRapor.ColWidths[8] := 50 ;
AdvRapor.Cells[9,0] := 'Toplam';
AdvRapor.ColWidths[9] := 80 ;
AdvRapor.Cells[10,0] := 'Genel Toplam';
AdvRapor.ColWidths[10] := 0 ;
AdvRapor.Cells[11,0] := 'Odeme';
AdvRapor.ColWidths[11] := 80 ;
AdvRapor.Cells[12,0] := 'Kalan';
AdvRapor.ColWidths[12] := 80 ;
AdvRapor.Cells[13,0] := 'Odeme Türü';
AdvRapor.ColWidths[13] := 80 ;
AdvRapor.Cells[14,0] := 'Çek No';
AdvRapor.ColWidths[14] := 80 ;
AdvRapor.Cells[15,0] := 'Çek Tarihi';
AdvRapor.ColWidths[15] := 80 ;

TmpSql:= 'Select '+
' id,Tarih,MusteriAdi,StokAdi,Adet,Fiyat,Kdv,indirim,Toplam,GenelToplam,Odeme,Kalan,OdemeTuru,CekNo,SatisNo,CekTarihi '+
'from satis where durum=:durum and geriiade=:geriiade ' ;

if CmbRFMusteri.Text <> '' then
TmpSql:=TmpSql + ' and MusteriAdi=:MusteriAdi ' ;

if TxtRfSatisNo.Text <> '' then
TmpSql:=TmpSql + ' and SatisNo=:SatisNo ' ;


if TxtRxStokadi.Text <> '' then
TmpSql:=TmpSql + ' and StokAdi like :StokAdi ' ;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if CmbRFMusteri.Text <> '' then
Qry1.Parameters.ParamByName('MusteriAdi').Value := CmbRFMusteri.Text ;

if TxtRfSatisNo.Text <> '' then
Qry1.Parameters.ParamByName('SatisNo').Value := TxtRfSatisNo.Text ;

if ChkRFiptal.checked = True then
Qry1.Parameters.ParamByName('durum').Value    := 'iptal'
Else
Qry1.Parameters.ParamByName('durum').Value    := 'aktif';

if ChkGeriiade.checked = True then
Qry1.Parameters.ParamByName('geriiade').Value    := 'Y'
else
Qry1.Parameters.ParamByName('geriiade').Value    := 'N';





if TxtRxStokadi.Text <> '' then
Qry1.Parameters.ParamByName('StokAdi').Value := TxtRxStokadi.Text+'%' ;

Qry1.Prepared;
Qry1.Open;

if Qry1.RecordCount<>0 then AdvRapor.RowCount := Qry1.RecordCount  + 1 ;

TmpToplam:=0;
TmpGenelToplam:=0;
for i:=1 to Qry1.RecordCount do begin

AdvRapor.Cells[1,i] := qry1.FieldByName('SatisNo').AsString;
AdvRapor.Cells[2,i] := qry1.FieldByName('Tarih').AsString;
AdvRapor.Cells[3,i] := qry1.FieldByName('MusteriAdi').AsString;
AdvRapor.Cells[4,i] := qry1.FieldByName('StokAdi').AsString;
AdvRapor.Cells[5,i] := qry1.FieldByName('Adet').AsString;
AdvRapor.Cells[6,i] := FormatFloat('#,##0.00',qry1.FieldByName('Fiyat').Ascurrency);
AdvRapor.Cells[7,i] := qry1.FieldByName('Kdv').AsString;
AdvRapor.Cells[8,i] := qry1.FieldByName('indirim').AsString;
TmpToplam := TmpToplam + qry1.FieldByName('Toplam').Ascurrency ;
AdvRapor.Cells[9,i] := FormatFloat('#,##0.00',qry1.FieldByName('Toplam').Ascurrency);
TmpGenelToplam := TmpGenelToplam + qry1.FieldByName('GenelToplam').Ascurrency ;
AdvRapor.Cells[10,i] := FormatFloat('#,##0.00',qry1.FieldByName('GenelToplam').Ascurrency);
AdvRapor.Cells[11,i] := FormatFloat('#,##0.00',qry1.FieldByName('Odeme').Ascurrency);
AdvRapor.Cells[12,i] := FormatFloat('#,##0.00',qry1.FieldByName('Kalan').Ascurrency);
AdvRapor.Cells[13,i] := qry1.FieldByName('OdemeTuru').AsString;
AdvRapor.Cells[14,i] := qry1.FieldByName('CekNo').AsString;
AdvRapor.Cells[15,i] := qry1.FieldByName('CekTarihi').AsString;


AdvRapor.Cells[16,i] := qry1.FieldByName('id').AsString;
Qry1.Next;
end;

AdvRapor.AutoNumberCol(0);

AdvRapor.AddRow;
AdvRapor.Colors[9,AdvRapor.RowCount-1] := clYellow ;
AdvRapor.Cells[9,AdvRapor.RowCount-1]:= FormatFloat('#,##0.00',TmpToplam);
AdvRapor.Colors[10,AdvRapor.RowCount-1] := clYellow ;
AdvRapor.Cells[10,AdvRapor.RowCount-1]:= FormatFloat('#,##0.00',TmpGenelToplam);

end;


procedure TFrmMenu.SatisOzetListele;
var TmpSql:String;
i:integer;
TmpGenelToplam,TmpOdeme,TmpKalan:Currency;
begin

AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 2;
AdvRapor.ColCount :=11 ;

AdvRapor.Cells[1,0] := ' ';
AdvRapor.ColWidths[1] := 25 ;
AdvRapor.Cells[2,0] := 'SatisNo';
AdvRapor.ColWidths[2] := 50 ;
AdvRapor.Cells[3,0] := 'Tarih';
AdvRapor.ColWidths[3] := 80 ;
AdvRapor.Cells[4,0] := 'Müþteri Adý';
AdvRapor.ColWidths[4] := 200 ;
AdvRapor.Cells[5,0] := 'Genel Toplam';
AdvRapor.ColWidths[5] := 80 ;
AdvRapor.Cells[6,0] := 'Odeme';
AdvRapor.ColWidths[6] := 80 ;
AdvRapor.Cells[7,0] := 'Kalan';
AdvRapor.ColWidths[7] := 80 ;
AdvRapor.Cells[8,0] := 'Odeme Türü';
AdvRapor.ColWidths[8] := 80 ;
AdvRapor.Cells[9,0] := 'Çek No';
AdvRapor.ColWidths[9] := 80 ;
AdvRapor.Cells[10,0] := 'Çek Tarihi';
AdvRapor.ColWidths[10] := 80 ;

TmpSql:= 'Select '+
' Tarih,MusteriAdi,GenelToplam,Odeme,Kalan,OdemeTuru,CekNo,SatisNo,CekTarihi '+
'from satis where durum=:durum and geriiade=:geriiade group by Tarih,MusteriAdi,GenelToplam,Odeme,Kalan,OdemeTuru,CekNo,SatisNo,CekTarihi ' ;

if CmbRFMusteriOzet.Text <> '' then
TmpSql:=TmpSql + ' and MusteriAdi=:MusteriAdi ' ;

if TxtRfSatisNoOzet.Text <> '' then
TmpSql:=TmpSql + ' and SatisNo=:SatisNo ' ;


if TxtRxStokadiOzet.Text <> '' then
TmpSql:=TmpSql + ' and StokAdi like :StokAdi ' ;


Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if CmbRFMusteri.Text <> '' then
Qry1.Parameters.ParamByName('MusteriAdi').Value := CmbRFMusteriOzet.Text ;

if TxtRfSatisNo.Text <> '' then
Qry1.Parameters.ParamByName('SatisNo').Value := TxtRfSatisNoOzet.Text ;

if ChkRFiptalOzet.checked = True then
Qry1.Parameters.ParamByName('durum').Value    := 'iptal'
Else
Qry1.Parameters.ParamByName('durum').Value    := 'aktif';

if ChkGeriiadeOzet.checked = True then
Qry1.Parameters.ParamByName('geriiade').Value    := 'Y'
else
Qry1.Parameters.ParamByName('geriiade').Value    := 'N';



if TxtRxStokadiOzet.Text <> '' then
Qry1.Parameters.ParamByName('StokAdi').Value := TxtRxStokadiOzet.Text+'%' ;

Qry1.Prepared;
Qry1.Open;

if Qry1.RecordCount<>0 then AdvRapor.RowCount := Qry1.RecordCount  + 1 ;

TmpGenelToplam:=0;
TmpOdeme:=0;
TmpKalan:=0;
for i:=1 to Qry1.RecordCount do begin
AdvRapor.AddCheckBox(1,i,False,True);
AdvRapor.Cells[2,i] := qry1.FieldByName('SatisNo').AsString;
AdvRapor.Cells[3,i] := qry1.FieldByName('Tarih').AsString;
AdvRapor.Cells[4,i] := qry1.FieldByName('MusteriAdi').AsString;
TmpGenelToplam := TmpGenelToplam + qry1.FieldByName('GenelToplam').Ascurrency ;
AdvRapor.Cells[5,i] := FormatFloat('#,##0.00',qry1.FieldByName('GenelToplam').Ascurrency);
TmpOdeme := TmpOdeme + qry1.FieldByName('odeme').Ascurrency ;
AdvRapor.Cells[6,i] := FormatFloat('#,##0.00',qry1.FieldByName('Odeme').Ascurrency);
TmpKalan := TmpKalan + qry1.FieldByName('kalan').Ascurrency ;
AdvRapor.Cells[7,i] := FormatFloat('#,##0.00',qry1.FieldByName('Kalan').Ascurrency);
AdvRapor.Cells[8,i] := qry1.FieldByName('OdemeTuru').AsString;
AdvRapor.Cells[9,i] := qry1.FieldByName('CekNo').AsString;
AdvRapor.Cells[10,i] := qry1.FieldByName('CekTarihi').AsString;

Qry1.Next;
end;

AdvRapor.AutoNumberCol(0);

AdvRapor.AddRow;
AdvRapor.Colors[5,AdvRapor.RowCount-1] := clYellow ;
AdvRapor.Cells[5,AdvRapor.RowCount-1]:= FormatFloat('#,##0.00',TmpGenelToplam);
AdvRapor.Colors[6,AdvRapor.RowCount-1] := clYellow ;
AdvRapor.Cells[6,AdvRapor.RowCount-1]:= FormatFloat('#,##0.00',TmpOdeme);
AdvRapor.Colors[7,AdvRapor.RowCount-1] := clYellow ;
AdvRapor.Cells[7,AdvRapor.RowCount-1]:= FormatFloat('#,##0.00',TmpKalan);

end;

procedure TFrmMenu.ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
//showmessage('1');
TScrollBox(Sender).Perform(WM_VSCROLL,1,0);
end;

procedure TFrmMenu.ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
TScrollBox(Sender).Perform(WM_VSCROLL,0,0);
end;


procedure TFrmMenu.SetDBbinary(filename, Field: string; TmpDMQRY: TADOQuery);
var
  BlobField: TBlobField;
  Stream: TMemoryStream;
begin

  Stream := TMemoryStream.Create;
  try
     Stream.LoadFromFile(filename);
     (TmpDMQRY.FieldByName(Field) as TBlobField).LoadFromStream(Stream);
  finally
     Stream.Free;
  end;
end;


procedure TFrmMenu.Sil1Click(Sender: TObject);
var i:integer;
begin

for i:=1 to AdvRapor.RowCount -1  do begin

if AdvRapor.Cells[1,i]<>'Y' Then continue;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('select * from satis where satisno=:satisno ');
Qry1.Parameters.ParamByName('satisno').Value := AdvRapor.Cells[2,i]  ;
Qry1.Prepared;
Qry1.open;


QRepPropertyEN:=TQRepPropertyEN.Create(Self);
QRepPropertyEN.DateTime.Caption := DateTimeToStr(Now);
QRepPropertyEN.QrlSatisNo.Caption := 'Satýþ No :' + AdvRapor.Cells[2,i] ;
QRepPropertyEN.Print;
QRepPropertyEN.Free;

end;



end;

procedure TFrmMenu.CmbStokAdiGetir;
var i:integer;
begin


BtnStKaydet.enabled:=True;
BtnStGuncelle.enabled:=False;
BtnStSil.enabled:=False;

CmbStokAdi.clear;
CmbKdvSatis.clear;
CmbSatisFiyat.clear;
CmbBirim.clear;
CmbParabirimi.Clear;

Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select stokadi,KdvSatis,SatisFiyati,birim,parabirimi from stokfiyat order by stokadi   ' );
Qry1.Open;

for i:=1 to qry1.Recordcount  do   begin
CmbStokAdi.items.add(Qry1.fieldbyname('stokadi').asstring);
CmbKdvSatis.items.add(Qry1.fieldbyname('KdvSatis').asstring);
CmbSatisFiyat.items.add(FloatToStr(RoundTo(Qry1.fieldbyname('SatisFiyati').ascurrency,-2)) );
CmbBirim.items.add(Qry1.fieldbyname('birim').asstring);
CmbParabirimi.items.add(Qry1.fieldbyname('parabirimi').asstring);

qry1.next;
end;
end;

procedure TFrmMenu.StokFiyatMiktarListele;
var TmpSql:String;
i:integer;
TopAlisFiyati,TopKdvSatis,TopSatisOran,TopSatisFiyati,TmpAdet,TmpSatis,TmpSatisKdv,TmpAlis,TmpAlisKdv,TmpAlisind,TmpSatisoran:Currency;
begin
AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 2;
AdvRapor.ColCount := 9 ;

AdvRapor.ColWidths[1] := 20 ;
AdvRapor.Cells[2,0] := 'Stok Tarihi';
AdvRapor.ColWidths[2] := 80 ;
AdvRapor.Cells[3,0] := 'Kayýt Tarihi';
AdvRapor.ColWidths[3] := 80 ;
AdvRapor.Cells[4,0] := 'Stok Adý';
AdvRapor.ColWidths[4] := 200 ;
AdvRapor.Cells[5,0] := 'Birim';
AdvRapor.ColWidths[5] := 80 ;
AdvRapor.Cells[6,0] := 'Adet';
AdvRapor.ColWidths[6] := 80 ;
AdvRapor.Cells[7,0] := 'Toplam Alýþ Fiyatý';
AdvRapor.ColWidths[7] := 100 ;

{
AdvRapor.Cells[8,0] := 'Kdv Satýþ';
AdvRapor.ColWidths[8] := 100 ;
AdvRapor.Cells[9,0] := 'Satýþ Oraný';
AdvRapor.ColWidths[9] := 100 ;
}

AdvRapor.Cells[8,0] := 'Toplam Satýþ Fiyatý';
AdvRapor.ColWidths[8] := 100 ;



TmpSql:= TmpSql + 'Select '+
'id,stoktarihi,kayittarihi,stokadi,Adet,AlisFiyati,KdvSatis,SatisOran,SatisFiyati,Birim '+
' from stokfiyat where id<>0 ' ;

if TxtRFStokAdi.Text <> '' then
TmpSql:= TmpSql + ' and stokadi like :stokadi ' ;
if ChkBitmekUzere.Checked = True then
TmpSql:= TmpSql + ' and adet<11  ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if TxtRFStokAdi.Text <> '' then
Qry1.Parameters.ParamByName('stokadi').Value     := '%'+TxtRFStokAdi.Text +'%' ;

Qry1.Prepared;
Qry1.Open;

if Qry1.RecordCount<>0 then AdvRapor.RowCount := Qry1.RecordCount  + 1 ;

TopAlisFiyati:=0;
TopKdvSatis:=0;
TopSatisOran:=0;
TopSatisFiyati:=0;


for i:=1 to Qry1.RecordCount do begin

TmpAdet  := qry1.FieldByName('Adet').Ascurrency;
TmpSatis := qry1.FieldByName('SatisFiyati').Ascurrency ;
TmpSatisKdv := qry1.FieldByName('KdvSatis').Ascurrency ;
TmpAlis := qry1.FieldByName('AlisFiyati').Ascurrency ;

AdvRapor.AddCheckBox(1,i,False,True);
AdvRapor.Cells[2,i] := qry1.FieldByName('stoktarihi').AsString;
AdvRapor.Cells[3,i] := qry1.FieldByName('kayittarihi').AsString;
AdvRapor.Cells[4,i] := qry1.FieldByName('stokadi').AsString;
AdvRapor.Cells[5,i] := qry1.FieldByName('Birim').AsString;
AdvRapor.Cells[6,i] := qry1.FieldByName('Adet').AsString;

if qry1.FieldByName('Adet').Ascurrency<>0 then
TopAlisFiyati  := TopAlisFiyati + qry1.FieldByName('AlisFiyati').Ascurrency ;

TopKdvSatis    := TopKdvSatis + qry1.FieldByName('KdvSatis').Ascurrency ;
TopSatisOran   := TopSatisOran + qry1.FieldByName('SatisOran').Ascurrency ;
TopSatisFiyati := TopSatisFiyati + ( (TmpSatis*TmpAdet) + (TmpSatis*TmpAdet*(TmpSatisKdv/100)) ) ;

if qry1.FieldByName('Adet').Ascurrency=0 then
AdvRapor.Cells[7,i] := '0'
Else
AdvRapor.Cells[7,i] := FormatFloat('#,##0.00',TmpAlis);
//AdvRapor.Cells[8,i] := FormatFloat('#,##0.00',qry1.FieldByName('KdvSatis').Ascurrency);
//AdvRapor.Cells[9,i] := FormatFloat('#,##0.00',qry1.FieldByName('SatisOran').Ascurrency);
AdvRapor.Cells[8,i] := FormatFloat('#,##0.00',(TmpSatis*TmpAdet) + (TmpSatis*TmpAdet*(TmpSatisKdv/100)));
AdvRapor.Cells[11,i] := qry1.FieldByName('id').AsString;
Qry1.Next;
end;

AdvRapor.autonumbercol(0);

AdvRapor.AddRow;

AdvRapor.Cells[7,AdvRapor.Rowcount-1]  := FormatFloat('#,##0.00',TopAlisFiyati);
AdvRapor.Cells[8,AdvRapor.Rowcount-1]  := FormatFloat('#,##0.00',TopSatisFiyati);
//AdvRapor.Cells[9,AdvRapor.Rowcount-1]  := FormatFloat('#,##0.00',TopSatisOran);
//AdvRapor.Cells[10,AdvRapor.Rowcount-1] := FormatFloat('#,##0.00',TopSatisFiyati);

end;


procedure TFrmMenu.StokGetir(TmpVar:String;TmpVar2:String);
var i:integer;
begin

BtnStTemizle.Click;

if TmpVar2='faturano' Then begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select * from stok where FaturaNo=:FaturaNo');
Qry1.Parameters.ParamByName('FaturaNo').Value := TmpVar ;
Qry1.Prepared;
Qry1.Open;
end
Else if TmpVar2='sevkNo' Then begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('Select * from stok where  sevkNo=:sevkNo');
Qry1.Parameters.ParamByName('sevkNo').Value    := TmpVar ;
Qry1.Prepared;
Qry1.Open;
end;


AdvStok.RowCount := qry1.RecordCount + 1 ;


for i:=1 to AdvStok.RowCount - 1 do begin

TxtFaturaNo.text:= Qry1.FieldByName('faturano').asstring     ;
TxtSevkNo.text:= Qry1.FieldByName('Sevkno').asstring     ;
AdvStok.AddCheckBox(1,i,False,True);
AdvStok.Cells[2,i] := Qry1.FieldByName('stokadi').asstring      ;
DtAlimTarihi.Date := Qry1.FieldByName('alimtarihi').asdatetime   ;
CmbTedarikci.Text  := Qry1.FieldByName('tedarikci').asstring    ;
AdvStok.Cells[3,i] := Qry1.FieldByName('birim').asstring       ;
AdvStok.Cells[4,i] := Qry1.FieldByName('adet').asstring       ;
AdvStok.Cells[5,i] := FormatFloat('#,##0.00',qry1.FieldByName('Fiyati').Ascurrency);
AdvStok.Cells[6,i] := Qry1.FieldByName('ind').asstring       ;
AdvStok.Cells[7,i] := Qry1.FieldByName('kdv').asstring       ;
AdvStok.Cells[8,i] := FormatFloat('#,##0.00',qry1.FieldByName('alisfiyati').Ascurrency);
AdvStok.Cells[9,i] := FormatFloat('#,##0.00',qry1.FieldByName('alisfiyatibirim').Ascurrency);


AdvStok.Cells[10,i]  := FormatFloat('#,##0.00',qry1.FieldByName('kdvsatis').Ascurrency);
AdvStok.Cells[11,i] := FormatFloat('#,##0.00',qry1.FieldByName('satisoran').Ascurrency);
AdvStok.Cells[12,i] := FormatFloat('#,##0.00',qry1.FieldByName('satisfiyati').Ascurrency);
AdvStok.Cells[13,i] := Qry1.FieldByName('id').asstring  ;




if Qry1.FieldByName('geriiadeadet').asstring = '' then
AdvStok.Cells[14,i] := '0'
Else AdvStok.Cells[14,i] := Qry1.FieldByName('geriiadeadet').asstring ;



CurrGenelToplam.Value := Qry1.FieldByName('GenelToplam').ascurrency ;
qry1.Next;
end;

AdvStok.AutoNumberCol(0);

BtnStKaydet.enabled:=False;
BtnStGuncelle.enabled:=True;
BtnStSil.enabled:=True;

CizgiGetirAlt(BtnStokGiris,StokGiris);
end;

procedure TFrmMenu.StokListele;
var TmpSql:String;
i:integer;
TmpFiyati,TmpAlisFiyati,TmpSatisFiyati,TmpTopSatisFiyati:Currency;
begin
AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 2;
AdvRapor.ColCount := 15 ;

AdvRapor.Cells[1,0] := 'Tarih';
AdvRapor.ColWidths[1] := 80;
AdvRapor.Cells[2,0] := 'Stok';
AdvRapor.ColWidths[2] := 200 ;
AdvRapor.Cells[3,0] := 'Fatura No';
AdvRapor.ColWidths[3] := 80 ;
AdvRapor.Cells[4,0] := 'Sevk No';
AdvRapor.ColWidths[4] := 80 ;
AdvRapor.Cells[5,0] := 'Tedarikçi';
AdvRapor.ColWidths[5] := 150 ;
AdvRapor.Cells[6,0] := 'Adet';
AdvRapor.ColWidths[6] := 80 ;
AdvRapor.Cells[7,0] := 'Alýþ Fiyatý(B)';
AdvRapor.ColWidths[7] := 100 ;
AdvRapor.Cells[8,0] := 'ind %';
AdvRapor.ColWidths[8] := 100 ;
AdvRapor.Cells[9,0] := 'Kdv %';
AdvRapor.ColWidths[9] := 100 ;
AdvRapor.Cells[10,0] := 'Alýþ fiyatý(T)';
AdvRapor.ColWidths[10] := 100 ;
AdvRapor.Cells[11,0] := 'Kdv Satýþ';
AdvRapor.ColWidths[11] := 100 ;
AdvRapor.Cells[12,0] := 'Satýþ Oraný';
AdvRapor.ColWidths[12] := 100 ;
AdvRapor.Cells[13,0] := 'Satýþ Fiyatý(B)';
AdvRapor.ColWidths[13] := 100 ;
AdvRapor.Cells[14,0] := 'Satýþ Fiyatý(T)';
AdvRapor.ColWidths[14] := 100 ;


TmpSql:= TmpSql + 'Select '+
'id,alimtarihi,stokadi,faturano,sevkno,tedarikci,adet,fiyati,ind,kdv,alisfiyati,kdvsatis,satisoran,satisfiyati '+
' from stok where id<>0 ' ;

if TxtRStokAdi.Text <> '' then
TmpSql:= TmpSql + ' and stokadi like :stokadi ' ;

if TxtRTedarikci.Text <> '' then
TmpSql:= TmpSql + ' and tedarikci like :tedarikci ' ;

if TxtRFaturaNo.Text <> '' then
TmpSql:= TmpSql + ' and faturano like :faturano ' ;

if TxtRSevkNo.Text <> '' then
TmpSql:= TmpSql + ' and Sevkno like :sevkno ' ;



Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if TxtRStokAdi.Text <> '' then
Qry1.Parameters.ParamByName('stokadi').Value     := TxtRStokAdi.Text +'%' ;

if TxtRTedarikci.Text <> '' then
Qry1.Parameters.ParamByName('tedarikci').Value   := TxtRTedarikci.Text + '%' ;

if TxtRFaturaNo.Text <> '' then
Qry1.Parameters.ParamByName('faturano').Value    := TxtRFaturaNo.Text + '%' ;

if TxtRSevkNo.Text <> '' then
Qry1.Parameters.ParamByName('Sevkno').Value    := TxtRSevkNo.Text + '%' ;

Qry1.Prepared;
Qry1.Open;

if Qry1.RecordCount<>0 then AdvRapor.RowCount := Qry1.RecordCount  + 1 ;
TmpFiyati:=0;
TmpAlisFiyati:=0;
TmpSatisFiyati:=0;
TmpTopSatisFiyati:=0;
for i:=1 to Qry1.RecordCount do begin

AdvRapor.Cells[1,i] := qry1.FieldByName('alimtarihi').AsString;
AdvRapor.Cells[2,i] := qry1.FieldByName('Stokadi').AsString;
AdvRapor.Cells[3,i] := qry1.FieldByName('faturano').AsString;
AdvRapor.Cells[4,i] := qry1.FieldByName('Sevkno').AsString;
AdvRapor.Cells[5,i] := qry1.FieldByName('tedarikci').AsString;
AdvRapor.Cells[6,i] := qry1.FieldByName('Adet').AsString;


AdvRapor.Cells[7,i] := FormatFloat('#,##0.00',qry1.FieldByName('Fiyati').Ascurrency);
AdvRapor.Cells[8,i] := qry1.FieldByName('ind').AsString;
AdvRapor.Cells[9,i] := qry1.FieldByName('kdv').AsString;

TmpAlisFiyati := TmpAlisFiyati + qry1.FieldByName('alisfiyati').AsCurrency;
AdvRapor.Cells[10,i] := FormatFloat('#,##0.00',qry1.FieldByName('alisfiyati').Ascurrency);
AdvRapor.Cells[11,i] := qry1.FieldByName('kdvsatis').AsString;
AdvRapor.Cells[12,i] := qry1.FieldByName('satisoran').AsString;


AdvRapor.Cells[13,i] := FormatFloat('#,##0.00',qry1.FieldByName('satisfiyati').Ascurrency);

TmpTopSatisFiyati := TmpTopSatisFiyati + qry1.FieldByName('satisfiyati').Ascurrency*qry1.FieldByName('Adet').Ascurrency;
AdvRapor.Cells[14,i] := FormatFloat('#,##0.00',qry1.FieldByName('satisfiyati').Ascurrency*qry1.FieldByName('Adet').Ascurrency);

AdvRapor.Cells[15,i] := qry1.FieldByName('id').AsString;

Qry1.Next;
end;

AdvRapor.autonumbercol(0);

AdvRapor.AddRow;

AdvRapor.Colors[10,AdvRapor.RowCount-1] := clYellow ;
AdvRapor.Cells[10,AdvRapor.RowCount-1]:= FormatFloat('#,##0.00',TmpAlisFiyati);

AdvRapor.Colors[14,AdvRapor.RowCount-1] := clYellow ;
AdvRapor.Cells[14,AdvRapor.RowCount-1]:= FormatFloat('#,##0.00',TmpTopSatisFiyati);
end;

procedure TFrmMenu.StretchImage(var Image1: TImage; StretchType: Byte; NewWidth,
  NewHeight: Word; TmpSelf: TForm);
 var
  Jpeg1: TJpegImage;
  CompressedImage: TImage;
  Oran, OranW, OranH: Real;

const
  // Image Stretch Tipleri
  stAyniKalsin= 0;
  stBuyukseKucult= 1;
  stKucukseBuyult= 2;
  stHerDurumdaStretch= 3;
begin
  if Image1.Picture.Graphic<>nil then
  begin
    if (Image1.Picture.Graphic.Width >300) or (Image1.Picture.Graphic.Height>300) then
    begin
    //    ShowMessage('Geniþlik: '+IntToStr(Image1.Picture.Graphic.Width)+'  Yükseklik: '+IntToStr(Image1.Picture.Graphic.Height));
      CompressedImage:=TImage.Create(TmpSelf);
      if StretchType=stBuyukseKucult then
      begin
        if (Image1.Picture.Graphic.Width>newWidth) or
           (Image1.Picture.Graphic.Height>NewHeight) then
        begin
          OranW:=NewWidth/Image1.Picture.Graphic.Width*2;
          OranH:=NewHeight/Image1.Picture.Graphic.Height*2;
          if OranW>OranH then Oran:=OranH else Oran:=OranW;
          //\\ JCL Graphics ten dolayý iptal

          Stretch(Round(Image1.Picture.Graphic.Width*Oran),
                  Round(Image1.Picture.Graphic.Height*Oran),
                  rfBell, 1, Image1.Picture.Graphic, CompressedImage.Picture.Bitmap);

           Image1.Picture.Bitmap.Assign(CompressedImage.Picture.Bitmap);
        end;
      end else
      begin
        if StretchType=stKucukseBuyult then
        begin
          if (Image1.Picture.Graphic.Width<NewWidth) or
             (Image1.Picture.Graphic.Height<NewHeight) then
          begin
            OranW:=NewWidth/Image1.Picture.Graphic.Width;
            OranH:=NewHeight/Image1.Picture.Graphic.Height;
            if OranW>OranH then Oran:=OranH else Oran:=OranW;

            Stretch(Round(Image1.Picture.Graphic.Width*Oran),
                    Round(Image1.Picture.Graphic.Height*Oran),
                    rfBell, 1, Image1.Picture.Graphic, CompressedImage.Picture.Bitmap);


            Image1.Picture.Bitmap.Assign(CompressedImage.Picture.Bitmap);
          end;
        end else
        begin
          if StretchType=stHerDurumdaStretch then
          begin
            OranW:=NewWidth/Image1.Picture.Graphic.Width;
            OranH:=NewHeight/Image1.Picture.Graphic.Height;
            if OranW>OranH then Oran:=OranH else Oran:=OranW;

            Stretch(Round(Image1.Picture.Graphic.Width*Oran),
                    Round(Image1.Picture.Graphic.Height*Oran),
                    rfBell, 1, Image1.Picture.Graphic, CompressedImage.Picture.Bitmap);

            Image1.Picture.Bitmap.Assign(CompressedImage.Picture.Bitmap);
          end;
        end;
      end;
      CompressedImage.Free;
      // ShowMessage('Küçültüldü Geniþlik: '+IntToStr(Image1.Picture.Bitmap.Width)+'  Yükseklik: '+IntToStr(Image1.Picture.Bitmap.Height));
    end;
  end;
end;









function TFrmMenu.StrToCoord(AStr: string): TPoint;
var
  i: Integer;
begin
  i := System.Pos(',', AStr);
  if i < 2 then
    raise Exception.Create('Invalid input value for coordinate');

  Result.X := StrToInt(Trim(Copy(AStr, 1, i-1)));
  Result.Y := StrToInt(Trim(Copy(AStr, i+1, MAXINT)));
end;

procedure TFrmMenu.tedarikcigetir;
begin
Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add( 'Select * from tedarikci where id=:id ');
Qry1.Parameters.ParamByName('id').Value    := AdvRapor.Cells[5,AdvRapor.Row];
Qry1.Prepared := True;
Qry1.open;

CmbTParaBirimi.ItemIndex := CmbTParaBirimi.Items.IndexOf(Qry1.FieldByName('parabirimi').AsString );

TxtTedarikci.Tag   := Qry1.FieldByName('id').AsInteger    ;
TxtTedarikci.Text  := Qry1.FieldByName('adi').AsString    ;
TxtTedarikciX.Text  := Qry1.FieldByName('adi').AsString    ;
TxtTelNo.Text      := Qry1.FieldByName('telno').AsString  ;
MemAciklama.Text   := Qry1.FieldByName('aciklama').AsString ;
TxtEmail.Text      := Qry1.FieldByName('email').AsString  ;

BtnTKaydet.Enabled   := False  ;
BtnTGuncelle.Enabled   := True ;
BtnTSil.Enabled := True ;

CizgiGetirAlt(BtnTedarikci,Tedarikci);

end;

procedure TFrmMenu.TedarikciListele;
var TmpSql:String;
i:integer;
begin

AdvRapor.ClearRows(1,AdvRapor.RowCount-1);
AdvRapor.RowCount := 2;
AdvRapor.ColCount := 5 ;

AdvRapor.Cells[1,0] := 'Adý';
AdvRapor.ColWidths[1] := 200 ;
AdvRapor.Cells[2,0] := 'Tel No';
AdvRapor.ColWidths[2] := 150 ;
AdvRapor.Cells[3,0] := 'Açýklama';
AdvRapor.ColWidths[3] := 300 ;
AdvRapor.Cells[4,0] := 'Email';
AdvRapor.ColWidths[4] := 150 ;



TmpSql:= TmpSql + 'Select '+
'id, adi,telno,aciklama,email '+
' from tedarikci where id<>0 ' ;

if CmbRTedarikci.Text = 'Tedarikci Adý -Soyadý' then
TmpSql:= TmpSql + ' and adi like :adi ' ;

TmpSql:= TmpSql + ' order by adi' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);

if CmbRTedarikci.Text = 'Tedarikci Adý -Soyadý' then
Qry1.Parameters.ParamByName('adi').Value := TxtRRTedarikci.Text+'%' ;

Qry1.Prepared;
Qry1.Open;

if Qry1.RecordCount<>0 then AdvRapor.RowCount := Qry1.RecordCount  + 1 ;

for i:=1 to Qry1.RecordCount do begin

AdvRapor.Cells[1,i] := qry1.FieldByName('adi').AsString;
AdvRapor.Cells[2,i] := qry1.FieldByName('telno').AsString;
AdvRapor.Cells[3,i] := qry1.FieldByName('aciklama').AsString;
AdvRapor.Cells[4,i] := qry1.FieldByName('email').AsString;

AdvRapor.Cells[5,i] := qry1.FieldByName('id').AsString;
Qry1.Next;
end;

AdvRapor.autonumbercol(0);

end;

function TFrmMenu.TmpRound(Sayi: Currency): Currency;
var Tmpint,TmpFrac,TmpFrac2:String;
begin

Tmpint  := FloatToStr(int(Sayi))  ;
TmpFrac := FloatToStr(Frac(Sayi)) ;

TmpFrac2 := LeftStr(TmpFrac,4);

Result := StrToFloat(Tmpint + RightStr(TmpFrac2,Length(TmpFrac2)-1) );

end;

procedure TFrmMenu.TxtRCekNoKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then HesaplarListele;
end;

procedure TFrmMenu.TxtRFaturaNoKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then StokListele;
end;

procedure TFrmMenu.TxtRfSatisNoKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then SatisListele;
end;

procedure TFrmMenu.TxtRFStokAdiKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then StokFiyatMiktarListele;

end;

procedure TFrmMenu.TxtRMusteriKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then MusteriListele;
end;

procedure TFrmMenu.TxtRStokAdiKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then StokListele;

end;

procedure TFrmMenu.TxtRTedarikciKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then StokListele;

end;

procedure TFrmMenu.TxtRxStokadiKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then BitBtn4.click ;
end;

procedure TFrmMenu.TxtSifre00KeyPress(Sender: TObject; var Key: Char);
begin
If key = #13 then  btngiris.click;
end;




procedure TFrmMenu.YonetimCiz;
var i:integer;
begin
AdvYonetim10.Cells[2,1]:= 'Müþteri';
AdvYonetim10.Cells[2,2]:= 'Tedarikçi';
AdvYonetim10.Cells[2,3]:= 'Stok Giriþ';
AdvYonetim10.Cells[2,4]:= 'Satýþ';
AdvYonetim10.Cells[2,5]:= 'Hesaplar';
AdvYonetim10.Cells[2,6]:= 'Rapor';
AdvYonetim10.Cells[2,7]:= 'Analiz';
AdvYonetim10.Cells[2,8]:= 'Yönetim';


for i:=1 to 8 do
AdvYonetim10.AddCheckBox(1,i,False,True);

end;

procedure TFrmMenu.YonetimGetir;
var i:integer;
begin

AdvListe10.ClearRows(1,AdvListe10.RowCount-1);
AdvListe10.RowCount := 2;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(' Select id,Adi,Soyadi,KullaniciAdi from Yonetim ');
Qry1.Prepared := True;
Qry1.open;

if Qry1.RecordCount <>0 then
AdvListe10.RowCount := Qry1.RecordCount + 1;

for i:=1 to Qry1.RecordCount do begin

AdvListe10.Cells[1,i] := Qry1.FieldByName('Adi').AsString;
AdvListe10.Cells[2,i] := Qry1.FieldByName('Soyadi').AsString;
AdvListe10.Cells[3,i] := Qry1.FieldByName('KullaniciAdi').AsString;
AdvListe10.Cells[4,i] := Qry1.FieldByName('id').AsString;

Qry1.Next;
end;

end;

procedure TFrmMenu.Image12Click(Sender: TObject);
var i:integer;
begin
CmbTedarikci.clear;
CmbTPbirimi.clear;

Qry1.Close;
Qry1.Sql.Clear;
Qry1.SQL.Add( 'Select adi,parabirimi from tedarikci order by adi   ' );
Qry1.Open;

for i:=1 to qry1.Recordcount  do   begin
CmbTedarikci.items.add(Qry1.fieldbyname('adi').asstring);
CmbTPbirimi.items.add(Qry1.fieldbyname('parabirimi').asstring);

qry1.next;
end;
end;

procedure TFrmMenu.Image5Click(Sender: TObject);
begin
Application.Minimize;
end;

procedure TFrmMenu.Image6Click(Sender: TObject);
begin

Application.Terminate;



end;

end.


