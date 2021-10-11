object Form1: TForm1
  Left = 223
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '2D Graphika'
  ClientHeight = 660
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Image2: TImage
    Left = -236
    Top = -89
    Width = 1350
    Height = 927
  end
  object Image1: TImage
    Left = 89
    Top = 738
    Width = 119
    Height = 31
    OnClick = Image1Click
  end
  object Image4: TImage
    Left = 128
    Top = 394
    Width = 50
    Height = 60
  end
  object Image5: TImage
    Left = 128
    Top = 492
    Width = 50
    Height = 61
  end
  object Image6: TImage
    Left = 128
    Top = 591
    Width = 50
    Height = 60
  end
  object MediaPlayer1: TMediaPlayer
    Left = 404
    Top = 148
    Width = 307
    Height = 37
    Visible = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 24
    Top = 32
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 120
    Top = 64
  end
  object Timer3: TTimer
    Interval = 29000
    Left = 56
    Top = 136
  end
end
