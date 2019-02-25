program YapiMarket;

uses
  Forms,
  UntMenu in 'UntMenu.pas' {FrmMenu},
  RepPropertyTR2 in 'Rapor\RepPropertyTR2.pas' {QRepPropertyTR2: TQuickRep},
  UntResizeimage in 'Resizeimage\UntResizeimage.pas' {FrmResizeimage},
  RepPropertyTR in 'Rapor\RepPropertyTR.pas' {QRepPropertyTR: TQuickRep},
  RepHesaplar in 'Rapor\RepHesaplar.pas' {QRepHesaplar: TQuickRep},
  RepPropertyEN2 in 'Rapor\RepPropertyEN2.pas' {QRepPropertyEN2: TQuickRep},
  UntKontrol in 'Kontrol\UntKontrol.pas' {FrmKontrol},
  RepPropertyEN in 'Rapor\RepPropertyEN.pas' {QRepPropertyEN: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Yapý Market';
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmKontrol, FrmKontrol);
  Application.Run;
end.
