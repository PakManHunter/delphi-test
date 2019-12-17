unit formAuth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfAuth = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAuth: TfAuth;

implementation

{$R *.dfm}
uses
   formMain;

var
  fmMain:TFmMain;

procedure TfAuth.Button1Click(Sender: TObject);
begin
if Edit1.Text='111' then
  begin
    fmMain:=TFmMain.Create(Application);
    fAuth.Hide;
    fAuth:=nil;
    fmMain.Show;
  end
  else
  begin
     ShowMessage('¬веден некорректный пароль!');
     Edit1.Clear;
     Edit1.SetFocus;
  end;
end;

procedure TfAuth.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
