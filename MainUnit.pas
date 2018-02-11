unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure N3Click(Sender: TObject);
  private
    function GetRndQns(num: Byte):TStrings;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Cn, Ln:Integer;
  CardList:TList;
  CLblList:TList;
  LblList:TList;
  CardBgC:TColor;
  LblC:TColor;
  LblFontSize:Byte;
  Xlbl:TLabel;
  LastQnsList:TStringList;

implementation

{$R *.dfm}

uses DataModule, Settings;


function TForm1.GetRndQns(num: Byte):TStrings;
var IndexList:TStringList;
    I, J, Count: Byte;
    Unique:Boolean;
    ResultStrs:TStrings;
begin
  ResultStrs := TStringList.Create;
  Count := DM.ADOQuery1.RecordCount;
  IndexList := TStringList.Create;
  for I := 0 to num - 1 do
  begin
    repeat
      Unique := true;
      DM.ADOQuery1.MoveBy(Random(Count)- Count div 2);
      if IndexList.Count = 0 then
        Continue;
      for j := 0 to IndexList.Count - 1 do
      begin
        if IndexList[j].ToInteger = DM.ADOQuery1.RecNo then
          Unique := false;
      end;
    until Unique;
    IndexList.Add(DM.ADOQuery1.RecNo.ToString);
    ResultStrs.Add(DM.ADOQuery1.Fields[1].AsString);
  end;
  Result := ResultStrs;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Settings.SettingsForm.ShowModal;
end;

procedure TForm1.Button1Click(Sender: TObject);
var Card, LastCard:TPanel;
    lbl, Clbl:TLabel;
    I, J:Byte;
    T, Ch, Lbh, Sbw, LastCardH, LastLblH:Integer;
    Qns:TStrings;
    CardP, ClblP, lblP:Pointer;
begin
  Qns := TStringList.Create;
  Lbh := 50;
  Sbw := Form1.Width - 100;
  LastCardH := 0;
  if CardList.Count > 0 then
  begin
    LastCard := TPanel(CardList[CardList.Count - 1]);
    LastCardH := LastCard.Top + LastCard.Height + 15;
  end;
  for I := 0 to SpinEdit1.Value - 1 do
  Begin
    Card := TPanel.Create(Form1);
    With Card Do
    Begin
      Parent := ScrollBox1;
      ParentBackground := false;
      Color := CardBgC;
      Width := Sbw;
      Left := 10;
      Top := LastCardH;
      BorderStyle := bsSingle;
      Name := 'Card' + Cn.ToString;
      Caption := string.Empty;
      Anchors := [akLeft, akTop, akRight];
    End;
    Qns := GetRndQns(SpinEdit2.Value);
    Clbl := TLabel.Create(Form1);
    With Clbl do
    Begin
      Parent := Card;
      Caption := 'Вариант ' + IntToStr(Cn + 1);
      Left := (Form1.Width div 2) - 70;
      Top := 10;
      Font.Size := LblFontSize;
      Font.Color := LblC;
    End;
    ClblP := Clbl;
    CLblList.Add(ClblP);
    for J := 0 to Qns.Count - 1 do
    Begin
      Lbl := TLabel.Create(Form1);
      With Lbl do
      Begin
        Parent := Card;
        Height := Lbh;
        WordWrap := true;
        AutoSize := false;
        Caption := Qns[J];
        Width := Card.Width - 10;
        Top := J * (Lbh + 20) + Lbh + 10;
        Left := 10;
        Name := 'Lbl' + Ln.ToString;
        Anchors := [akLeft, akTop, akRight];
        Font.Size := LblFontSize;
      Font.Color := LblC;
      End;
      LastLblH := lbl.top + Lbh + 20;
      Inc(Ln);
      lblP := lbl;
      LblList.Add(lbl);
    End;
    Inc(Cn);
    Card.Height := LastLblH;
    CardP := Card;
    CardList.Add(Card);
    LastCardH := Card.Top + Card.Height + 20;
    Form1.Refresh;
  End;
end;

procedure TForm1.Button2Click(Sender: TObject);
var I:Byte;
begin
  if CLblList.Count > 0 then
    for I := 0 to CLblList.Count - 1 do
      TPanel(CLblList[I]).Free;
  if LblList.Count > 0 then
    for I := 0 to LblList.Count - 1 do
      TPanel(LblList[I]).Free;
  if CardList.Count > 0 then
    for I := 0 to CardList.Count - 1 do
      TPanel(CardList[I]).Free;
  CLblList.Clear;
  LblList.Clear;
  CardList.Clear;
  Cn := 0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Byte;
begin
  try
    DM.ADOConnection1.Connected := false;
    DM.ADOQuery1.Close;
    if LblList.Count > 0 then
      for I := 0 to LblList.Count - 1 do
        TPanel(LblList[I]).Free;
    LblList.Clear;
    if CLblList.Count > 0 then
      for I := 0 to CLblList.Count - 1 do
        TPanel(CLblList[I]).Free;
    CLblList.Clear;
    if CardList.Count > 0 then
      for I := 0 to CardList.Count - 1 do
        TPanel(CardList[I]).Free;
    CardList.Clear;
  except
    on e:exception do
      ShowMessage(e.Message);
  end;
end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  var I: integer;
begin
  Handled := PtInRect(ScrollBox1.ClientRect, ScrollBox1.ScreenToClient(MousePos));
  if Handled then
    for I := 1 to Mouse.WheelScrollLines do
    try
      if WheelDelta > 0 then
        ScrollBox1.Perform(WM_VSCROLL, SB_LINEUP, 0)
      else
        ScrollBox1.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
    finally
      ScrollBox1.Perform(WM_VSCROLL, SB_ENDSCROLL, 0);
    end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  I: Integer;
begin
  Xlbl.Top := ScrollBox1.Height;
  if CLblList.Count > 0 then
    for I := 0 to CLblList.Count - 1 do
      TLabel(CLblList[I]).Left := (Form1.Width div 2) - 70;
  if CardList.Count > 0 then
    for I := 0 to CardList.Count - 1 do
      TPanel(CardList[i]).Width := Form1.Width - 100;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Randomize;
  Cn := 0;
  Ln := 0;
  CardBgC := clBtnFace;
  LblFontSize := 20;
  LblC := clBlack;
  try
    DM.ADOConnection1.Connected := true;
    DM.ADOQuery1.Open;
    SpinEdit2.MaxValue := DM.ADOQuery1.RecordCount - 1;
  except
    on e:exception do
      ShowMessage('Error! ' + e.Message);
  end;
  CardList := TList.Create;
  CLblList := TList.Create;
  LblList := TList.Create;
  LastQnsList := TStringList.Create;
  Xlbl := TLabel.Create(Form1);
  Xlbl.Top := ScrollBox1.Height;
  Xlbl.Caption := string.Empty;
  xLbl.Parent := ScrollBox1;
end;

end.
