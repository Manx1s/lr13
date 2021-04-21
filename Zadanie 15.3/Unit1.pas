unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFirstClass = class
    private
    priv:integer;
    public
    publ:string;
    protected
    prot:real;
  end;
  TSecondClass1=class(TFirstClass)
    public
    procedure access;
  end;
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;   Obj:TFirstClass;

implementation
 uses Unit2;

{$R *.dfm}

{ TSecondClass1 }

procedure TSecondClass1.access;
begin
 priv:=1;
 publ:='publ';
 prot:=100.123;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Obj:=TFirstClass.Create;
  Obj.priv:=1;
  Obj.publ:='publ';
  Obj.prot:=100.123;
  Obj.Free;
end;

end.
