unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Unit1;

type
  TSecondClass2 = class(TFirstClass)
    public
    procedure access;
  end;
  TForm2 = class(TForm)
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TSecondClass2 }

procedure TSecondClass2.access;
begin
  //priv:=1;
  publ:='publ';
  prot:=100.123;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Obj:=TFirstClass.Create;
  Obj.priv:=1;
  Obj.publ:='publ';
  Obj.prot:=100.123;
  Obj.Free;
end;

end.
