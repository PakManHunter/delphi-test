program ProjectClassIntreface;

uses
  Vcl.Forms,
  formMain in 'formMain.pas' {FmMain},
  UnitClassInterface in 'UnitClassInterface.pas',
  UnitAbstractClass in 'UnitAbstractClass.pas',
  UnitClassSimple in 'UnitClassSimple.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
