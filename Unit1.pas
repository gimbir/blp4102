unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //Paddle Ozellikler
  py:Integer=470;
  px:Integer=200;
  pw:Integer=300;

  //Ball Ozellikler
  bx:Integer=100;
  by:Integer=100;
  bd:Integer=10;

  //Ball Speed
  bsx:Integer=3;
  bsy:Integer=-3;

  skor:Integer=0;
  yon:Integer;
implementation

{$R *.dfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_LEFT then SpeedButton1Click(sender);
  if Key=VK_RIGHT then SpeedButton2Click(sender);
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  yon:=0;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  yon:=1; //Sol
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  yon:=2; //Sağ
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
py:=ClientHeight;
  with Form1.Canvas do begin
    Brush.Color:=clBlack;
    Rectangle(0,0,clientWidth,ClientHeight);
    Brush.Color:=cLWhite;
    Rectangle(px,ClientHeight-10,pw,py);  //Paddle
    Rectangle(bx, by, bx+bd, by+bd);  //Ball
  end;
  // Top hareket
  bx:=bx+bsx;
  by:=by+bsy;

  // Yan duvarlardan sekme
  if by<=0 then bsy:=-bsy;
  if bx<=0 then bsx:=-bsx;
  if bx>=ClientWidth-5 then bsx:=-bsx;

  // Paddle'dan sekme
  if by>py-20 then begin
    if (bx>=px) and (bx<=pw) then begin

      // Top hızlandırma
      if bsx>0 then Inc(bsx) else Dec(bsx);
      if bsy>0 then Inc(bsy) else Dec(bsy);

      bsy:=-bsy;

      Inc(skor);
      Panel1.Caption:='SKOR: '+IntToStr(skor);
      Text:='SKOR: '+IntToStr(skor);
    end
    else if by>py then begin
      skor:=0;
      Panel1.Caption:='SKOR: '+IntToStr(skor);
      Text:='SKOR: '+IntToStr(skor);
      bx:=Random(ClientWidth);
      by:=Random(100);
      bsx:=3;
      bsy:=-3;

    end;
  end;

  // Paddle hareket
    if yon=1 then begin
      px:=px-8;
      pw:=pw-8;

      if px<0 then begin
        px:=0;
        pw:=px+100;
      end;
    end;
    if yon=2 then begin
      px:=px+8;;
      pw:=pw+8;

      if pw>ClientWidth then begin
        pw:=ClientWidth;
        px:=pw-100;
      end;
    end;
end;

end.
