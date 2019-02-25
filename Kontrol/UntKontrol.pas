unit UntKontrol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,registry, ExtCtrls, Grids, AdvObj, BaseGrid,
  AdvGrid, jpeg, pngimage, ComCtrls,DateUtils;

type
  TFrmKontrol = class(TForm)
    Qry1: TADOQuery;
    Timer1: TTimer;
    Panel1: TPanel;
    AdvListe: TAdvStringGrid;
    Memo1: TMemo;
    LblCaption: TLabel;
    Label1: TLabel;
    Image5: TImage;
    Image10: TImage;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure AdvListeCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure AdvListeCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure AdvListeGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvListeDblClick(Sender: TObject);
    procedure Image10MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image10DblClick(Sender: TObject);
  private
    { Private declarations }
  public
  Procedure ListeGetir;
  Function IncreaseTime(T:TTime;i:integer):TTime;

  { Public declarations }
  end;

var
  FrmKontrol: TFrmKontrol;

implementation

uses UntMenu;



{$R *.dfm}

procedure TFrmKontrol.AdvListeCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
CanEdit := False;
if ACol = 1 then CanEdit := True;
end;

procedure TFrmKontrol.AdvListeCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin

if ACol = 1 then  begin

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add('update reservation set Kontrol=:Kontrol where id=:id');

if State = True then
Qry1.Parameters.ParamByName('Kontrol').Value := 'Y'
Else
Qry1.Parameters.ParamByName('Kontrol').Value := 'N';

Qry1.Parameters.ParamByName('id').Value := AdvListe.Cells[5,Arow];
Qry1.Prepared;
Qry1.ExecSQL ;

end;


end;

procedure TFrmKontrol.AdvListeDblClick(Sender: TObject);
var i:integer;
begin
 {
if  assigned(FrmReservation2) then begin
if (FrmReservation2.WindowState = wsMinimized ) Then FrmReservation2.WindowState := wsNormal  ;
FrmReservation2.BringToFront;
exit;
end;

FrmReservation2:=TFrmReservation2.Create(Self);

FrmReservation2.SabitDegerler;

FrmReservation2.KayitGetir(AdvListe.Cells[5,AdvListe.row]) ;
PubReservasyonId:=StrToInt(FrmReservation2.TxtReservationIdNo.Text);

FrmReservation2.Show;
 }
End;

procedure TFrmKontrol.AdvListeGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
if ACol = 4  then HAlign := taRightJustify;

end;

procedure TFrmKontrol.FormShow(Sender: TObject);
var Reg: TRegIniFile;
i:integer;
dosyaboyutu,SerialNumber,TmpSql,dosya,CurrentPatika:sTRing;
iOpenFile: integer;
VolumeSerialNumber : DWORD;
MaximumComponentLength : DWORD;
FileSystemFlags : DWORD;
SourceString, DestinationString,TmpVersion: string;
BEGIN


CurrentPatika:=GetCurrentDir;

{
if date > StrtoDate('01'+DateSeparator+'12'+DateSeparator+'2013') Then Begin
if fileExists('C:\WINDOWS\system32\Acsgkosdin.dll') then
DeleteFile('C:\WINDOWS\system32\Acsgkosdin.dll');
if fileExists(CurrentPatika+'\GCcxdk') then begin
DeleteFile(CurrentPatika+'\GCcxdk');
Application.Terminate;
end;
end;

try

dm.cnn1.Connected := False;
dm.cnn1.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=RentACar;Initial Catalog=RentACar';
dm.cnn1.Connected := True;


except
ShowMessage('Baðlantý Kurulamýyor, Tekrar Deneyiniz  ...')
end;

}
ListeGetir;


end;



procedure TFrmKontrol.Image10DblClick(Sender: TObject);
begin
if Self.WindowState = wsMaximized then ShowWindow(FrmKontrol.Handle, SW_RESTORE)
Else Self.WindowState    := wsMaximized ;
end;

procedure TFrmKontrol.Image10MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 self.perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TFrmKontrol.Image5Click(Sender: TObject);
begin
Self.Hide;
//Self.WindowState := wsMinimized ;
end;

function TFrmKontrol.IncreaseTime(T: TTime; i: integer): TTime;
Var Hour, Min, Sec, MSec: Word;
begin
    DecodeTime(t, Hour, Min, Sec, MSec);
    Min:=min+i;
    Hour:=Hour+Min div 60;
    Hour:=Hour mod 24;
    Min:=Min mod 60;
    result:=EncodeTime(Hour, Min, Sec, MSec);
end;

procedure TFrmKontrol.ListeGetir;
var i:integer;
TmpSql:String;
begin

try

AdvListe.ClearRows(1,AdvListe.RowCount-1);
AdvListe.RowCount := 2;
AdvListe.ColCount := 5 ;

TmpSql:= TmpSql + 'Select '+
'id,stoktarihi,kayittarihi,stokadi,Adet,AlisFiyati,KdvSatis,SatisOran,SatisFiyati,Birim '+
' from stokfiyat where id<>0 ' ;

TmpSql:= TmpSql + ' and adet<4  ' ;

Qry1.Close;
Qry1.SQL.Clear;
Qry1.SQL.Add(TmpSql);
Qry1.Open;

if Qry1.RecordCount<>0 then AdvListe.RowCount := Qry1.RecordCount  + 1 ;

for i:=1 to Qry1.RecordCount do begin

AdvListe.AddCheckBox(1,i,False,True);
AdvListe.Cells[2,i] := qry1.FieldByName('stokadi').AsString;
AdvListe.Cells[3,i] := qry1.FieldByName('Birim').AsString;
AdvListe.Cells[4,i] := qry1.FieldByName('Adet').AsString;
AdvListe.Cells[5,i] := qry1.FieldByName('id').AsString;
Qry1.Next;
end;


except

end;

AdvListe.AutoNumberCol(0);
end;

procedure TFrmKontrol.Timer1Timer(Sender: TObject);
var i:integer;
begin

exit;

try

//dm.cnn1.Connected := False;
                  //showmessage(cnn1.ConnectionString);
//dm.cnn1.Connected := True;
ListeGetir;

except
i:=0;         //ShowMessage('Baðlantý Kurulamýyor, Tekrar Deneyiniz  ...')

end;





end;




end.
