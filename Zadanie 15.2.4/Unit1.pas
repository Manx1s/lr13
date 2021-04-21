unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  T1=class
    public
    procedure Test(I:integer); virtual;
    procedure fly; virtual;
    procedure look; virtual;
  end;
  T2=class(T1)
    public
    procedure test(I:integer); override;
    procedure fly; override;
    procedure look; override;
    procedure fly2; virtual;
  end;
  T3=class(T2)
    public
    procedure test(I:integer);
    procedure fly; virtual;
    procedure look; override;
  end;
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; T1_:T1;T2_:T2;T3_:T3;

implementation

{$R *.dfm}

{ T2 }

procedure T2.fly;
begin
  ShowMessage('T2.Fly');
end;

procedure T2.fly2;
begin
  ShowMessage('T2.Fly2');
end;

procedure T2.look;
begin
  ShowMessage('T2.look');

end;

procedure T2.test(I: integer);
begin
  ShowMessage('T2.Test(I:integer)');

end;

{ T3 }

procedure T3.fly;
begin
    ShowMessage('T3.fly');
end;

procedure T3.look;
begin
  ShowMessage('T3.look');
end;

procedure T3.test(I: integer);
begin
  ShowMessage('T3.Test(I:integer)');
end;

{ T1 }

procedure T1.fly;
begin
  ShowMessage('T1.fly');
end;

procedure T1.look;
begin
  ShowMessage('T1.look');
end;

procedure T1.Test(I: integer);
begin
  ShowMessage('T1.Test(I:integer)');
end;

procedure TForm1.Button1Click(Sender: TObject);
type
TVMT=array[0..100] of pointer;
GoProc = procedure(obj:T1);
var
pVMT:^TVMT;
pMethod:pointer;
pObj:pointer;
i,j,k,sum:integer;
begin
  memo1.Clear;
  T1_:=T1.Create;
  pObj:=pointer(T1_);
  pVMT:=pointer(pObj^);
  pMethod:=pVMT^[1];
   memo1.Lines.Add('pVMT указывает на VMT объекта класса '+ TObject(pObj).ClassName);
   memo1.Lines.Add('Адрес первого метода в VMT равен '+#9+IntToStr(longword(pVMT^[0])));
   memo1.Lines.Add('Адрес второго метода в VMT равен '+#9+IntToStr(longword(pVMT^[1])));
   memo1.Lines.Add('Адрес третьего метода в VMT равен '+#9+IntToStr(longword(pVMT^[2])));
   memo1.Lines.Add('');

   T2_:=T2.Create;
   pObj:=pointer(T2_);
   pVMT:=pointer(pObj^);
   memo1.Lines.Add('pVMT указывает на VMT объекта класса '+ TObject(pObj).ClassName);
   memo1.Lines.Add('Адрес первого метода в VMT равен '+#9+IntToStr(longword(pVMT^[0])));
   memo1.Lines.Add('Адрес второго метода в VMT равен '+#9+IntToStr(longword(pVMT^[1])));
   memo1.Lines.Add('Адрес третьего метода в VMT равен '+#9+IntToStr(longword(pVMT^[2])));
   memo1.Lines.Add('Адрес четвертого метода в VMT равен'+#9+IntToStr(longword(pVMT^[3])));
   memo1.Lines.Add('');
   FreeAndNil(T1_);
   FreeAndNil(T2_);
end;

procedure TForm1.Button2Click(Sender: TObject);
type
TVMT=array[0..100] of pointer;
GoProc = procedure(obj:T1);
var
pVMT:^TVMT;
pMethod:pointer;
pObj:pointer;
i,j,k,sum:integer;
begin
     T3_:=T3.Create;
   pObj:=pointer(T3_);
   pVMT:=pointer(pObj^);
   memo1.Lines.Add('pVMT указывает на VMT объекта класса '+ TObject(pObj).ClassName);
   memo1.Lines.Add('Адрес первого метода в VMT равен '+#9+IntToStr(longword(pVMT^[0])));
   memo1.Lines.Add('Адрес второго метода в VMT равен '+#9+IntToStr(longword(pVMT^[1])));
   memo1.Lines.Add('Адрес третьего метода в VMT равен '+#9+IntToStr(longword(pVMT^[2])));
   memo1.Lines.Add('Адрес четвертого метода в VMT равен'+#9+IntToStr(longword(pVMT^[3])));
   memo1.Lines.Add('');
   FreeAndNil(T3_);
end;

end.
