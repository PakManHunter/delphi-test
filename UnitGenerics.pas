unit UnitGenerics;

interface

  type
     TGenericsClass<T>=class
     fT:T;
     procedure SetT(value:T);
     function  GetT:T;
    end;


implementation

function TGenericsClass<T>.GetT:T;
begin
  result:=fT;
end;

procedure TGenericsClass<T>.SetT(value:T);
begin
  fT:=Value;
end;

end.
