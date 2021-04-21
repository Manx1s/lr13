unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
  FA:word;
    procedure SetA(const Value: word);
    { Private declarations }
  public
  property A:word read FA write SetA;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
A:=100;
Memo1.lines.add(Inttostr(A));
end;

procedure TForm1.SetA(const Value: word);
begin
  FA := Value+5000;
end;

end.