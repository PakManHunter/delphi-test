unit formMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB;

type
  TFmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure BtnHwindClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

  type
    Memo = class(TMemo)
    end;

   type
      TNewButton = class (TButton)
      constructor Create(AOwner: TComponent; T:integer;
                             L:integer;
                             W:integer;
                             H:integer;
                             N:string); reintroduce;
      end;

type
  TNewAdoTable = class (TAdoTable)
  private
  public
      constructor Create(AOwner: TComponent); override;
      procedure OpenAdoTable(AdoTableName:string);
  end;

  TNewAdoConnection = class (TAdoConnection)
  public
     constructor Create(AOwner: TComponent);override;
   end;

var
  FmMain: TFmMain;
  AdoTableNew: TNewAdoTable;
  AdoNewConnection: TNewAdoConnection;
  Memo1, Memo2 :Memo;
  button1, button2: TNewButton;

implementation

uses
  UnitClassInterface, UnitAbstractClass, UnitClassSimple;

{$R *.dfm}

Constructor TNewAdoConnection.Create(AOwner: TComponent);
begin
  inherited;
  self.ConnectionString:='';
end;


Constructor TNewButton.Create(
                        AOwner : TComponent;
                       T,L,W,H : integer;
                             N : string);
begin
     inherited Create(AOWner);
     self.Parent := AOwner as TWinControl;
     self.Top:=T;
     self.Left:=L;
     self.Width:=W;
     self.Height:=H;
     self.Caption:=N;
end;

Constructor TNewAdoTable.Create(AOwner: TComponent);
begin
    inherited;
end;

procedure TnewAdoTable.OpenAdoTable(AdoTableName: string);
begin
  self.TableName:=AdoTableName;
end;

procedure TFmmain.BtnHwindClick(Sender: TObject);
 var
  h: HWND;
begin
    if FindWindow(nil, 'EditPlus') <> 0 then
            begin
                  h := findwindow(nil, 'EditPlus');
                  SetWindowPos(h, HWND_BOTTOM, 1, 1, 20, 20, swp_nosize)
            end
    else
        ShowMessage('Окно НЕ найдено');
end;

procedure TFmMain.ButtonClick(Sender: TObject);
  var
     MyInterface:IMyInterface;
     cocktail: TCocktail;
     MyClass, MyClass2 :TSimpleClass;


    begin
     MyInterface:=TMyClass.Create;
     try
         MyInterface.SayHello;
         Memo1.Lines.Add(MyInterface.SayHello);
         Memo1.Lines.Add(IntToStr(MyInterface._AddRef));
     finally

     end;

     MyInterface:=TMyClassNew.Create;
     try
         MyInterface.SayHello;
         Memo1.Lines.Add(MyInterface.SayHello);
     finally

     end;

     cocktail := TBloodyMary.Create;
     try
         cocktail.Prepare;
         Memo1.Lines.Add(cocktail.MTextClass);
     finally
         cocktail.Free;
     end;

     cocktail := TIrishCoffee.Create;
     try
         cocktail.Prepare;
         Memo1.Lines.Add(cocktail.MTextClass);
     finally
         cocktail.Free;
     end;

     MyClass := TSimpleClass.Create;
     try
          Memo1.Lines.Add(MyClass.TName);
     finally
        // MyClass.Free;
     end;

     MyClass2 := TSimpleClass.Create;
     try
          Memo1.Lines.Add(MyClass2.TName);
     finally
        // MyClass.Free;
     end;


    // AdoTableNew.Create(fmMain);

end;

procedure TFmMain.FormCreate(Sender: TObject);
begin
     AdoNewConnection:=TNewAdoConnection.Create(Self);
     AdoTableNew:=TNewAdoTable.Create(self);
     AdoTableNew.OpenAdoTable('Test');
     AdoTableNew.Connection:=AdoNewConnection;

     Memo1:=Memo.Create(self);
     Memo1.Parent:=FmMain;

     FmMain.Height:=400;

     Memo1.Top:=8;
     Memo1.Width:=619;
     Memo1.Height:=234;
     Memo1.Left:=8;
     Memo1.ReadOnly:=True;

     Button1:=TNewButton.Create(self, 245, 8,200,50,'Кнопка 1');
     Button2:=TNewButton.Create(self, 300, 8,200,50,'Кнопка 2');
     button1.OnClick:= BtnHwindClick;

end;

procedure TFmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   self.Caption := 'x = '+x.ToString+' y = '+Y.ToString;
end;

end.
