unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDM = class(TDataModule)
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RCCStr;
  end;

var
  DM: TDM;
  ConStr:string;
  ConStrList:TStringList;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.RCCStr;
var I:integer;
begin
  for I := 0 to ConStrList.Count - 1 do
    ConStr := ConStr + ConStrList[i];
  ADOConnection1.ConnectionString := ConStr;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  ConStrList := TStringList.Create;
  ConStrList.add('Provider=Microsoft.ACE.OLEDB.15.0;');
  ConStrList.add('User ID=Admin;');
  ConStrList.add('Data Source=DATA.accdb;');
  ConStrList.add('Mode=Share Deny None;');
  ConStrList.add('Jet OLEDB:System database="";');
  ConStrList.add('Jet OLEDB:Registry Path="";');
  ConStrList.add('Jet OLEDB:Database Password="";');
  ConStrList.add('Jet OLEDB:Engine Type=6;');
  ConStrList.add('Jet OLEDB:Database Locking Mode=1;');
  ConStrList.add('Jet OLEDB:Global Partial Bulk Ops=2;');
  ConStrList.add('Jet OLEDB:Global Bulk Transactions=1;');
  ConStrList.add('Jet OLEDB:New Database Password="";');
  ConStrList.add('Jet OLEDB:Create System Database=False;');
  ConStrList.add('Jet OLEDB:Encrypt Database=False;');
  ConStrList.add('Jet OLEDB:Compact Without Replica Repair=False;');
  ConStrList.add('Jet OLEDB:SFP=False;Jet OLEDB:Support Complex Data=False;');
  ConStrList.add('Jet OLEDB:Bypass UserInfo Validation=False;');
  ConStrList.add('Jet OLEDB:Limited DB Caching=False;');
  ConStrList.add('Jet OLEDB:Bypass ChoiceField Validation=False;');
  for I := 0 to ConStrList.Count - 1 do
    ConStr := ConStr + ConStrList[i];
  ADOConnection1.ConnectionString := ConStr;
  //  ConnectionStr := ConnectionStr +'Jet OLEDB:Don't Copy Locale on Compact=False;';
end;

end.
