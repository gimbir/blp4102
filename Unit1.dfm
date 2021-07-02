object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 480
  ClientWidth = 640
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 457
    Top = 89
    Width = 33
    Height = 49
    Caption = 'yukar'#305
    Visible = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 496
    Top = 89
    Width = 33
    Height = 49
    Caption = 'a'#351'a'#287#305
    Visible = False
    OnClick = SpeedButton2Click
  end
  object Panel1: TPanel
    Left = 520
    Top = 8
    Width = 112
    Height = 41
    Caption = 'SKOR: 0'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 5
    OnTimer = Timer1Timer
    Left = 80
    Top = 32
  end
end
