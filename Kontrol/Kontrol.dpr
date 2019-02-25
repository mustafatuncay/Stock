program Kontrol;

uses
  Forms,
  UntKontrol in 'UntKontrol.pas' {FrmKontrol},
  UntDm in '..\genel\UntDm.pas' {Dm: TDataModule},
  UntReservation2 in '..\UntReservation2.pas' {FrmReservation2},
  UntGlobal in '..\genel\UntGlobal.pas',
  UntOnay in '..\DlgForms\UntOnay.pas' {FrmOnay},
  UntUyari in '..\DlgForms\UntUyari.pas' {FrmUyari},
  UntProjectGlobal in '..\genel\UntProjectGlobal.pas',
  UntTransfers in '..\UntTransfers.pas' {FrmTransfers},
  RepTransfer in '..\Reports\RepTransfer.pas' {QRepTransfers: TQuickRep},
  UntCustomer in '..\UntCustomer.pas' {FrmCustomer},
  UntDlgCustomer in '..\DlgForms\UntDlgCustomer.pas' {FrmDlgCustomer},
  UntDlgTransfer in '..\DlgForms\UntDlgTransfer.pas' {FrmDlgTransfer},
  RepReservation in '..\Reports\RepReservation.pas' {QRepReservation: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFrmKontrol, FrmKontrol);
  Application.CreateForm(TQRepReservation, QRepReservation);
  Application.CreateForm(TQRepTransfers, QRepTransfers);
  Application.Run;
end.
