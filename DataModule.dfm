object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1042#1086#1087#1088#1086#1089#1099)
    Left = 112
    Top = 56
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.15.0;Data Source=C:\Users\Roman\Des' +
      'ktop\OTHER TRASH\Delphi projects\test\DATA.accdb;Persist Securit' +
      'y Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.15.0'
    Left = 32
    Top = 56
  end
end
