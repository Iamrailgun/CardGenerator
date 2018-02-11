unit Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin;

type
  TSettingsForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Edit1: TEdit;
    ColorDialog1: TColorDialog;
    ColorDialog2: TColorDialog;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure AcceptSettings();
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;
  LblText, BGColor:TColor;

implementation

{$R *.dfm}

uses MainUnit, DataModule;

procedure TSettingsForm.AcceptSettings;
var I:Integer;
begin
  MainUnit.LblC := SettingsForm.Panel1.Color;
  MainUnit.CardBgC := Panel2.Color;
  MainUnit.LblFontSize := SpinEdit1.Value;
  if MainUnit.CLblList.Count > 0 then
    for I := 0 to MainUnit.CLblList.Count - 1 do
    begin
      TLabel(MainUnit.CLblList[I]).Font.Color := Panel1.Color;
      TLabel(MainUnit.CLblList[I]).Font.Size := SpinEdit1.Value;
    end;
  if MainUnit.LblList.Count > 0 then
    for I := 0 to MainUnit.LblList.Count - 1 do
    begin
      TLabel(MainUnit.LblList[I]).Font.Color := Panel1.Color;
      TLabel(MainUnit.LblList[I]).Font.Size := SpinEdit1.Value;
    end;
  if MainUnit.CardList.Count > 0 then
    for I := 0 to MainUnit.CardList.Count - 1 do
      TPanel(MainUnit.CardList[I]).Color := Panel2.Color;;
end;

procedure TSettingsForm.Button1Click(Sender: TObject);
var I:Integer;
begin
  AcceptSettings;
end;

procedure TSettingsForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TSettingsForm.Button3Click(Sender: TObject);
begin
  AcceptSettings;
  Close;
end;

procedure TSettingsForm.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    DataModule.ConStrList[2] := 'Data Source=' + OpenDialog1.FileName + ';';
    Edit1.Text := DataModule.ConStrList[2];
    DataModule.DM.RCCStr;
    MainUnit.Form1.OnShow(Sender);
  end;
  ShowMessage(DataModule.ConStrList[2]);
end;

procedure TSettingsForm.FormShow(Sender: TObject);
begin
  Edit1.Text := DataModule.ConStrList[2];
end;

procedure TSettingsForm.Panel1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Panel1.Color := ColorDialog1.Color;
end;

procedure TSettingsForm.Panel2Click(Sender: TObject);
begin
  if ColorDialog2.Execute then
    Panel2.Color := ColorDialog2.Color
end;

end.
