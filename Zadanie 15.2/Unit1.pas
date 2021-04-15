unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  T1 = class
    procedure Test(I: integer); overload; virtual;
  end;

  T2 = class(T1)
    procedure Test(S: string);  overload;
    procedure Test(I: integer); override;
  end;

  T3 = class(T2)
    procedure Test(I: integer);   override;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  T1_:T1;
  T2_:T2;
  T3_:T3;
implementation

{$R *.dfm}
{ T3 }

procedure T3.Test(I: integer);
begin
  ShowMessage('T3.Test(I:integer)');
end;

{ T2 }

procedure T2.Test(S: string);
begin
  ShowMessage('T2.Test(S:string)');
end;

procedure T2.Test(I: integer);
begin
  ShowMessage('T2.Test(I:integer)');
end;

{ T1 }

procedure T1.Test(I: integer);
begin
  ShowMessage('T1.Test(I:integer)');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
T2_:=T2.Create;
//T2_.Test('Ìועמה גûחûגאיסÿ!');
//T2_.Test(1000);
T2_.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  T1_:=T2.Create;
  T1_.Test(1000);
  T1_.Free;
  T1_:=T3.Create;
  T1_.Test(1000);
  T1_.Free;
  T2_:=T3.Create;
  T2_.Test(1000);
  T2_.Free;
end;

end.
