unit UnitAbstractClass;

interface

type
  TCocktail = class
  protected
    procedure AddFirstIngridient(); virtual; abstract; //���������� ������� �����������
    procedure AddSeconsIngridient(); virtual; abstract; //���������� ������� �����������
    procedure AddDecorations(); virtual; abstract; //���������� ���������
    function GetName(): string; virtual; abstract; //��������
  private
      TextClass:string;
  public
    procedure Prepare; //�������� ������������� ��������
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
  TextClass:=TextClass+'��������� ���'+' ';
end;

procedure TBloodyMary.AddFirstIngridient;
begin
  TextClass:=TextClass+'50�� �����'+' ';
end;

procedure TBloodyMary.AddSeconsIngridient;
begin
  TextClass:=TextClass+'150�� ��������� ����'+' ';
end;

function TBloodyMary.GetName: string;
begin
  result := '�������� ����';
end;

procedure TIrishCoffee.AddDecorations;
begin
  TextClass:=TextClass+'50 ������ (33%)'+' ';
end;

procedure TIrishCoffee.AddFirstIngridient;
begin
  TextClass:=TextClass+'50�� ����������� �����'+' ';
end;

procedure TIrishCoffee.AddSeconsIngridient;
begin
  TextClass:=TextClass+'80�� ����'+' ';
end;

function TIrishCoffee.GetName: string;
begin
  result := '���������� ����';
end;

procedure TCocktail.Prepare;
begin
  TextClass:='������� �������� ' + GetName()+TextClass+' ';
  AddFirstIngridient();
  AddSeconsIngridient();
  AddDecorations();
  //TextClass:='��� �������� �����';
end;

end.
