unit UnitClassSimple;

interface
type
  TSimpleClass = class
  protected
  private
      name:string;
  public
      Constructor Create;
      property TName:string read name write name;
  end;

implementation

Constructor TSimpleClass.Create;
begin
    self.name:='Собственное имя';
end;

end.
