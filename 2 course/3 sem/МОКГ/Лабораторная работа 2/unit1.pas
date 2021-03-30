unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var stor, i, dl,x0,y0 : integer;
    a, b ,l : double;
begin
dl :=StrToInt(Edit2.Text) ;
stor:=StrToInt(Edit1.Text);
l:= 2*pi/stor;
Image1.Canvas.clear;
x0:= Image1.Width div 2;
y0:= Image1.Height div 2;
a:=x0+dl*cos(l*0);
b:=y0+dl*sin(l*0);
Image1.Canvas.MoveTo(round(a),round(b));
for i:=1 to stor do
begin
a:=x0+dl*cos(l*i);
b:=y0+dl*sin(l*i);
Image1.Canvas.LineTo(round(a),round(b));

end
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  If (Edit1.Text='') or (Edit2.Text='') then Button1.Enabled:=False
else Button1.Enabled:=True;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  Case Key of
'0'..'9',#8: ;
else Key:=chr(0);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
end;




end.

