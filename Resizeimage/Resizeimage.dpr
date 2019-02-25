program Resizeimage;

uses
  Forms,
  UntResizeimage in 'UntResizeimage.pas' {FrmResizeimage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmResizeimage, FrmResizeimage);
  Application.Run;
end.
