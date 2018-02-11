object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Settings'
  ClientHeight = 346
  ClientWidth = 683
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object Label4: TLabel
    Left = 8
    Top = 19
    Width = 86
    Height = 23
    Caption = #1055#1091#1090#1100' '#1082' '#1041#1044
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 53
    Width = 313
    Height = 160
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1084' '#1082#1072#1088#1090#1086#1095#1077#1082
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 76
      Width = 104
      Height = 23
      Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072
    end
    object Label2: TLabel
      Left = 16
      Top = 117
      Width = 119
      Height = 23
      Caption = #1062#1074#1077#1090' '#1079#1072#1076#1085#1080#1082#1072
    end
    object Label3: TLabel
      Left = 16
      Top = 34
      Width = 138
      Height = 23
      Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072
    end
    object SpinEdit1: TSpinEdit
      Left = 176
      Top = 31
      Width = 121
      Height = 33
      MaxValue = 50
      MinValue = 10
      TabOrder = 0
      Value = 20
    end
    object Panel1: TPanel
      Left = 176
      Top = 70
      Width = 121
      Height = 35
      BevelInner = bvRaised
      BevelKind = bkSoft
      Color = clBlack
      ParentBackground = False
      TabOrder = 1
      OnClick = Panel1Click
    end
    object Panel2: TPanel
      Left = 176
      Top = 111
      Width = 121
      Height = 35
      BevelInner = bvRaised
      BevelKind = bkSoft
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      OnClick = Panel2Click
    end
  end
  object Button1: TButton
    Left = 131
    Top = 309
    Width = 113
    Height = 29
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 12
    Top = 309
    Width = 113
    Height = 29
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 120
    Top = 16
    Width = 433
    Height = 31
    ReadOnly = True
    TabOrder = 3
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 250
    Top = 309
    Width = 113
    Height = 29
    Caption = #1054#1082
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 559
    Top = 17
    Width = 122
    Height = 29
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button4Click
  end
  object ColorDialog1: TColorDialog
    Left = 624
    Top = 288
  end
  object ColorDialog2: TColorDialog
    Left = 552
    Top = 288
  end
  object OpenDialog1: TOpenDialog
    Left = 488
    Top = 288
  end
end
