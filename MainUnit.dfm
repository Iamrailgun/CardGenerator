object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Card generator'
  ClientHeight = 494
  ClientWidth = 807
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnMouseWheel = FormMouseWheel
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    807
    494)
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 128
    Top = 10
    Width = 167
    Height = 19
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1072#1088#1080#1072#1085#1090#1086#1074
  end
  object Label2: TLabel
    Left = 337
    Top = 10
    Width = 236
    Height = 19
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1086#1087#1088#1086#1089#1086#1074' '#1074' '#1074#1072#1088#1080#1085#1090#1077
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 115
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object SpinEdit1: TSpinEdit
    Left = 128
    Top = 35
    Width = 89
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 500
    MinValue = 0
    ParentFont = False
    TabOrder = 1
    Value = 3
  end
  object SpinEdit2: TSpinEdit
    Left = 337
    Top = 35
    Width = 89
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 30
    MinValue = 0
    ParentFont = False
    TabOrder = 2
    Value = 3
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 73
    Width = 791
    Height = 413
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Button2: TButton
    Left = 8
    Top = 39
    Width = 115
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    Left = 720
    Top = 16
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N4Click
    end
  end
end
