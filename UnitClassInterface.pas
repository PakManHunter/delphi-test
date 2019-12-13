unit UnitClassInterface;

interface

   type
     IMyInterface=interface(IUnknown)
     function SayHello:string;
    end;

   TMyClass=class (TInterfacedObject,IMyInterface)
    private
        TextClass:string;
        procedure AddTextString (MTextClass:string);
    public
    destructor Destroy(); override;
    function SayHello:string;
    property MTextClass:string read TextClass write AddTextString;

    end;

    TMyClassNew=class (TInterfacedObject,IMyInterface)
    private
        TextClass:string;
        procedure AddTextString (MTextClass:string);
    public
    function SayHello:string;
    property MTextClass:string read TextClass write AddTextString;
    end;


implementation

{ MyClass }

destructor TMyClass.Destroy;
begin
  TextClass:='Automatical destroying instance MyClass';
  inherited;
end;


function TMyClass.SayHello;
begin
    Result:='Hello from TMyClass';
end;
procedure TMyClass.AddTextString(MTextClass:string);
begin
    TextClass:=MTextClass+', а это ее хитрая реализация';
end;


function TMyClassNew.SayHello;
begin
    Result:='Hello from NewClass';
end;
procedure TMyClassNew.AddTextString(MTextClass:string);
begin
    TextClass:=MTextClass+', а это ее хитрая реализация нового класса';
end;

end.
