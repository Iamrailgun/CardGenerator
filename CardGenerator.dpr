program CardGenerator;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Settings in 'Settings.pas' {SettingsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.Run;
end.
