program ProjectClassIntreface;

uses
  Vcl.Forms,
  formMain in 'formMain.pas' {FmMain},
  UnitClassInterface in 'UnitClassInterface.pas',
  UnitAbstractClass in 'UnitAbstractClass.pas',
  UnitClassSimple in 'UnitClassSimple.pas',
  formAuth in 'formAuth.pas' {fAuth},
  UnitGenerics in 'UnitGenerics.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfAuth, fAuth);
  fAuth.ShowModal;
  fAuth.Free;
  Application.Run;
end.
