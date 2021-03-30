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
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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





procedure TForm1.FormCreate(Sender: TObject);
begin
    Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
end;



procedure TForm1.Button1Click(Sender: TObject);
var
  xmax,xmin,ymax,ymin,rb,h,w,i,ySc,xSc: integer;
  A,B,kY,kX,x,y,s,g,F: real;
begin
   h:=image1.Height;
   w:=image1.Width;
   xmin:=StrtoInt(Edit3.Text);
   ymin:=StrtoInt(Edit5.Text);
   xmax:=StrtoInt(Edit4.Text);
   ymax:=StrtoInt(Edit6.Text);
   rb:=StrtoInt(Edit7.Text);
   A:=StrtoFloat(Edit1.Text);
   B:=StrtoFloat(Edit2.Text);
   kX := w/(Xmax - Xmin);
   kY := h/(Ymax - Ymin);
   image1.Canvas.Rectangle(0,0,w,h);
   image1.Canvas.MoveTo(0,round(ymax*Ky));
   image1.Canvas.LineTo(w,round(ymax*Ky));
   image1.Canvas.MoveTo(round(-xmin*Kx),0);
   image1.Canvas.LineTo(round(-xmin*Kx),h);
   image1.Canvas.MoveTo(round (xmin), round(sqrt(x*x + 5)/(2*x+ sqrt(x*x + 0.5))));
  x := xmin;
  while x <= xmax do
  begin
  y := sqrt(x*x + 5)/(2*x+ sqrt(x*x + 0.5));
  Xsc:=round((x-xmin)*Kx);
  Ysc:=round(h-(y-ymin)*Ky);
  Image1.Canvas.LineTo(Xsc,Ysc);
  x := x + 0.1;
  end;
  s := 0;
g := (B - A) / rb;
x := A;
for i := 1 to rb do
begin
y := sqrt(x*x + 5)/(2*x+ sqrt(x*x + 0.5));
s := s + y;
Image1.Canvas.Pen.Color := clRed;
Image1.Canvas.Rectangle(Round((Xmin * (-1) + x)*kX), Round(h - (abs(Ymin) + y)*kY), Round((Xmin * (-1) + x + g)*kX), Round(h - abs(Ymin)*kY));
x := x + g;
end;
F := s * g;
Edit8.Text := FloattoStr(F);
end;


procedure TForm1.Edit1Change(Sender: TObject);
begin
    If (Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='') or (Edit4.Text='') or (Edit5.Text='') or(Edit6.Text='') or (Edit7.Text='')  then Button1.Enabled:=False
  else Button1.Enabled:=True;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
    Case Key of
  '0'..'9','-',',',#8: ;
  else Key:=chr(0);
  end;
end;

end.

