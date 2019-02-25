unit RepToplanti;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt,  qrpctrls, jpeg, QRCtrls, pngimage;

type
  TQRepToplanti = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRImage1: TQRImage;
    QRLabel15: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    ftg: TQRLabel;
    gthyh: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QrlTarihSaat: TQRLabel;
    QrlBirim: TQRLabel;
    QrlTarihNo: TQRLabel;
    QrlGorusmeTarihi: TQRLabel;
    QrlYer: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QrlAksiyonPlani: TQRLabel;
    QrlKatilanlar: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
  private

  public

  end;

var
  QRepToplanti: TQRepToplanti;

implementation







{$R *.DFM}

uses RepTalepSikayet, UntMenu;

end.
