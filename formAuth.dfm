object fAuth: TfAuth
  Left = 0
  Top = 0
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 114
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 233
    Height = 97
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 16
      Width = 209
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object Button1: TButton
      Left = 16
      Top = 43
      Width = 97
      Height = 38
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 119
      Top = 43
      Width = 106
      Height = 38
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
