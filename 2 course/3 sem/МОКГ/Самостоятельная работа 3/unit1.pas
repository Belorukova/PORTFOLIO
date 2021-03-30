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
  A,B,C,xmax,xmin,ymax,ymin,ysc,xsc,h,w: integer;
  Kx,Ky,shag,x,y,yp: real;
begin
    h:=image1.Height;
   w:=image1.Width;
   xmin:=StrtoInt(Edit4.Text);
   ymin:=StrtoInt(Edit5.Text);
   xmax:=StrtoInt(Edit6.Text);
   ymax:=StrtoInt(Edit7.Text);

   A:=StrtoInt(Edit1.Text);
   B:=StrtoInt(Edit2.Text);
   C:=StrtoInt(Edit3.Text);
   shag:=(xmax-xmin)/200;
   Kx:=w/(xmax-xmin);
   Ky:=h/(ymax-ymin);

    image1.Canvas.Rectangle(0,0,w,h);
   image1.Canvas.MoveTo(0,round(ymax*Ky));
   image1.Canvas.LineTo(w,round(ymax*Ky));
   image1.Canvas.MoveTo(round(-xmin*Kx),0);
   image1.Canvas.LineTo(round(-xmin*Kx),h);

   x:=xmin;
   while x < xmax do

   begin
   y:=a*x*x+b*x+c;
   if y=0 then begin
   label12.Caption:='Ошибка';
   x:=xmax+1;
   end
   else begin
   label11.Caption:='';
   yp:=1/y;
   xsc:=Round((x-xmin)*kx);
   ysc:=Round(Image1.Height-(yp-ymin)*ky);
   Image1.Canvas.ellipse(xsc,ysc,xsc+2,ysc+2);
   x:=x+shag;
   end ;
   end;
 end;




end.

