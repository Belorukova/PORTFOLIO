unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
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

procedure TForm1.Image1Click(Sender: TObject);
begin
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
Image1.Canvas.MoveTo(100,50);
Image1.Canvas.pen.Color:= clblue;
Image1.Canvas.LineTo(70,85);
Image1.Canvas.pen.Color:= clRed;
Image1.Canvas.LineTo(150,109);
Image1.Canvas.pen.Color := clBlack;
Image1.Canvas.LineTo(100,50);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

