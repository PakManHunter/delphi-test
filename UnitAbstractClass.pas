unit UnitAbstractClass;

interface

type
  TCocktail = class
  protected
    procedure AddFirstIngridient(); virtual; abstract; //Добавление первого ингридиента
    procedure AddSeconsIngridient(); virtual; abstract; //Добавление второго ингридиента
    procedure AddDecorations(); virtual; abstract; //Добавление украшений
    function GetName(): string; virtual; abstract; //Название
  private
      TextClass:string;
  public
    procedure Prepare; //Алгоритм приготовления коктейля
    property MTextClass:string read TextClass write TextClass;
  end;

  type
  TBloodyMary = class (TCocktail)
  protected
    procedure AddFirstIngridient();override;
    procedure AddSeconsIngridient();override;
    procedure AddDecorations();override;
    function GetName(): string;override;
  end;

  type
  TIrishCoffee = class (TCocktail)
  protected
    procedure AddFirstIngridient();override;
    procedure AddSeconsIngridient();override;
    procedure AddDecorations();override;
    function GetName(): string;override;
  end;

implementation

procedure TBloodyMary.AddDecorations;
begin
  TextClass:=TextClass+'Добавляем лед'+' ';
end;

procedure TBloodyMary.AddFirstIngridient;
begin
  TextClass:=TextClass+'50мл водки'+' ';
end;

procedure TBloodyMary.AddSeconsIngridient;
begin
  TextClass:=TextClass+'150мл томатного сока'+' ';
end;

function TBloodyMary.GetName: string;
begin
  result := 'Кровавая Мэри';
end;

procedure TIrishCoffee.AddDecorations;
begin
  TextClass:=TextClass+'50 сливки (33%)'+' ';
end;

procedure TIrishCoffee.AddFirstIngridient;
begin
  TextClass:=TextClass+'50мл ирландского виски'+' ';
end;

procedure TIrishCoffee.AddSeconsIngridient;
begin
  TextClass:=TextClass+'80мл кофе'+' ';
end;

function TIrishCoffee.GetName: string;
begin
  result := 'Ирландский кофе';
end;

procedure TCocktail.Prepare;
begin
  TextClass:='Готовим коктейль ' + GetName()+TextClass+' ';
  AddFirstIngridient();
  AddSeconsIngridient();
  AddDecorations();
  //TextClass:='Ваш коктейль готов';
end;

end.
