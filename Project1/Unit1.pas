unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, jpeg, Vcl.ExtCtrls,
  Vcl.Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    ADOQuery1: TADOQuery;
    Image2: TImage;
    ADOStoredProc1: TADOStoredProc;
    ADOQuery2: TADOQuery;
    ADOQuery2UserID: TAutoIncField;
    ADOQuery2DisplayName: TWideStringField;
    ADOQuery2AccountEnabled: TBooleanField;
    ADOQuery2Photo: TBlobField;
    ADOQuery2Phone: TWideStringField;
    ADOQuery2Address: TWideStringField;
    ADOQuery2Note: TWideStringField;
    DataSource2: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1UserID: TcxGridDBColumn;
    cxGrid1DBTableView1DisplayName: TcxGridDBColumn;
    cxGrid1DBTableView1AccountEnabled: TcxGridDBColumn;
    cxGrid1DBTableView1Photo: TcxGridDBColumn;
    cxGrid1DBTableView1Phone: TcxGridDBColumn;
    cxGrid1DBTableView1Address: TcxGridDBColumn;
    cxGrid1DBTableView1Note: TcxGridDBColumn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    AdoQuery2.Open;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  MyJpeg: TJpegImage;
  MS: TMemoryStream;
  Image:TblobField;
  Something:variant;
begin
      Image1.Picture.LoadFromFile(OpenDialog1.FileName);
      MyJpeg := TJpegImage.Create;
      MyJpeg.Assign(Image1.Picture);
      // MyJpeg.CompressionQuality := 90;
      // MyJpeg.Compress;
      MS := TMemoryStream.Create;
      MyJpeg.SaveToStream(MS);
      MS.Position := 0;
           with ADOStoredProc1 do
           begin
         //   Parameters.Clear;
            ProcedureName:='[dbo].[InsertNewPhoto]';
            Parameters.Refresh();
       //           Image.loadFromStream(MS);
//           (Parameters.ParamByName('@photo').Value).Image;
            Parameters.ParamByName('@photo').LoadFromStream(MS, ftBlob);
            Parameters.ParamByName('@USERID').Value:=AdoQuery2.FieldByName('USERID').Value;
            Parameters.ParamByName('@AllGood').Direction:=pdOutput;
            Prepared := True;
            ExecProc;
            AdoQuery2.Refresh;
     //        Parameters.ParamByName('@AllGood').Direction:=pdOutput;
//            SomeThing:=Parameters.ParamValues['@AllGood'];
            ShowMessage(Parameters.ParamValues['@AllGood']);
           end;

{      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Text :=
        'UPDATE Userlist SET Photo=:Photo WHERE USERID=:USERID';
      ADOQuery1.Parameters.ParamByName('USERID').Value := AdoTable1.FieldByName('USERID').Value;
      AdoTable1.Edit;
      (ADOTable1.FieldByName('Photo') as TBlobField).loadFromStream(MS);
     // ADOTable1.FieldByName('Photo').Value:=loadFromStream(MS, ftBlob);
      ADOTable1.Post;}

      MS.Position := 0;
      Image1.Picture.Assign(MyJpeg);
      MS.Free;
      MyJpeg.Free;

     image1.Picture:=Nil;


  //AdoTable1.Close;
 // Application.Terminate;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
var
  blobstream : TADOBlobStream;
  jpeg       : TJPEGImage;
begin
     AdoQuery2.Open;
    if not AdoQuery2.FieldByName('Photo').IsNull then
      begin
        try
        blobstream := TADOBlobStream.Create(TBlobField(AdoQuery2.FieldByName('Photo')), bmRead);
        jpeg  := TJPEGImage.Create;
        jpeg.LoadFromStream(blobstream);
        Form1.Image2.Picture.Bitmap.Assign(jpeg);
        finally
        jpeg.Free;
        blobstream.Free;
      end
    end;
end;
procedure TForm1.N1Click(Sender: TObject);
begin
 if  OpenDialog1.Execute then
   begin
     image1.Picture.LoadFromFile(opendialog1.FileName);
   end;
end;

end.
