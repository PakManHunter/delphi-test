unit formMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB, Generics.Collections, Generics.Defaults;

type
  TFmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
          TCity=class
           private
             fCountry:string;
             fstrength:integer;
            public
              constructor Create(Country : string; Strength : integer);
              destructor Destroy; override;
              property Country : string read fCountry write fCountry;
              property Strength : integer read fStrength write fStrength;
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
  ButtChoiceVariant, ButtChoiceCoctail, ButtExit : TNewButton;
  City:TCity;
  CityInstances : integer = 0;

implementation

uses
  UnitClassInterface, UnitAbstractClass, UnitClassSimple, formAuth;

{$R *.dfm}

Constructor TNewAdoConnection.Create(AOwner: TComponent);
begin
  inherited;
  self.ConnectionString:='';
end;

constructor TCity.Create(Country: string; Strength: integer);
begin

  inc(CityInstances);

  fCountry := Country;
  fStrength := Strength;

end;

destructor TCity.Destroy;
begin
  dec(CityInstances);

  inherited;
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


procedure TFmMain.ButtonClick(Sender: TObject);
  var
     MyInterface:IMyInterface;
     cocktail: TCocktail;
     MyClass, MyClass2 :TSimpleClass;
     h: HWND;


    begin
    case (sender as TNewButton).Tag of
    1:
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
                       end;
      2:
                       begin
                          if FindWindow(nil, 'EditPlus') <> 0 then
                                  begin
                                        h := findwindow(nil, 'EditPlus');
                                        SetWindowPos(h, HWND_BOTTOM, 1, 1, 20, 20, swp_nosize)
                                  end
                          else
                              ShowMessage('Окно НЕ найдено');
                       end;
      3:
                       begin
                          Application.Terminate;
                       end;
    end;



end;

procedure TFmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    self.Free;
    Application.Terminate;
end;

procedure TFmMain.FormCreate(Sender: TObject);
var
   iCounts:byte;
   CityList : TList<TCity>;
begin
     AdoNewConnection:=TNewAdoConnection.Create(Self);
     AdoTableNew:=TNewAdoTable.Create(self);
     AdoTableNew.OpenAdoTable('Test');
     AdoTableNew.Connection:=AdoNewConnection;

     Memo1:=Memo.Create(self);
     Memo1.Parent:=self;

     self.Height:=400;

     Memo1.Top:=8;
     Memo1.Width:=619;
     Memo1.Height:=234;
     Memo1.Left:=8;
     Memo1.ReadOnly:=True;

     ButtChoiceVariant:=TNewButton.Create(self, 245, 8,200,50,'Коктейль');
     ButtChoiceCoctail:=TNewButton.Create(self, 245, 208,200,50,'Поиск окна');
     ButtExit:=TNewButton.Create(self, 300, 8,200,50,'Выход');
     ButtChoiceVariant.Tag:=1;
     ButtChoiceCoctail.Tag:=2;
     ButtExit.Tag:=3;
     ButtChoiceVariant.OnClick:= ButtonClick;
     ButtChoiceCoctail.OnClick:= ButtonClick;
     ButtExit.OnClick:=ButtonClick;

     CityList:=TList<TCity>.Create;

     Memo1.Lines.Add(CityInstances.ToString);

     CityList.Add(TCity.Create('Мурманск', 342000));
     CityList.Add(TCity.Create('Архангельск', 542000));


     Memo1.Lines.Add(CityList.Count.ToString());

     CityList.Delete(1);
     for city in cityList do
          Memo1.Lines.Add(City.Country+' '+City.Strength.ToString);

      Memo1.Lines.Add(CityList.Count.ToString());
end;

procedure TFmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   self.Caption := 'x = '+x.ToString+' y = '+Y.ToString;
end;

end.
