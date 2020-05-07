unit frm_JoyStick;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unit_Driver, RzButton, Vcl.ExtCtrls, Vcl.StdCtrls, RzPanel, RzRadGrp,
  Vcl.Buttons, Vcl.Menus, Vcl.ImgList, Vcl.ComCtrls, System.ImageList;

type
  TfrmJoyStick = class(TForm)
    Timer: TTimer;
    rzgrpbx1: TRzGroupBox;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    btnStop: TBitBtn;
    btnTestProgram: TButton;
    btnStep: TButton;
    RzGroupBox3: TRzGroupBox;
    lblPos: TLabel;
    btnHomeZ: TButton;
    btnHomeX: TButton;
    btnGoTestPos: TButton;
    btnGoObservation: TButton;
    btnGoService: TButton;
    btnSetPos: TRzMenuButton;
    pmPositions: TPopupMenu;
    estingposition1: TMenuItem;
    Observationposition1: TMenuItem;
    Serviceposition1: TMenuItem;
    lblSetPos: TLabel;
    ilDirections: TImageList;
    RzPanel1: TRzPanel;
    trXSpeed: TTrackBar;
    trZSpeed: TTrackBar;
    lbl1: TLabel;
    Label1: TLabel;
    procedure RzBitBtn3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RzBitBtn3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure btnHomeZClick(Sender: TObject);
    procedure btnGoTestPosClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnTestProgramClick(Sender: TObject);
    procedure btnStepClick(Sender: TObject);
    procedure gbSpeedClick(Sender: TObject);
    procedure btnHomeXClick(Sender: TObject);
    procedure btnGoObservationClick(Sender: TObject);
    procedure btnGoServiceClick(Sender: TObject);
    procedure estingposition1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    Channel: Integer;
    OnDriving: Boolean;

    procedure UpdatePosition;

  public
    { Public declarations }
  end;

var
  frmJoyStick: TfrmJoyStick;

implementation

{$R *.dfm}

uses
  unit_Globals,
  unit_Config,
  unit_Helpers, unit_Routines;

{ TfrmJoyStick }

procedure TfrmJoyStick.btnStepClick(Sender: TObject);
begin
  Drive.ContProgSet(FConditions.Stroke, FConditions.Speed);
  Drive.ProgramStep;
  UpdatePosition;
end;

procedure TfrmJoyStick.btnStopClick(Sender: TObject);
begin
  Drive.Stop;
  Drive.ProgramStop;
end;

procedure TfrmJoyStick.btnTestProgramClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ShowPopup('X-Stage program uploading ...');
    case FConditions.Mode of
      tmByTime : Drive.ContProgSet(FConditions.Stroke, FConditions.Speed);
      tmByCycle: Drive.CycleProgSet(FConditions.NumberOfCycles, FConditions.Stroke, FConditions.Speed);
      tmObservation, tmPaused: Drive.CycleProgSet(FConditions.ObservationInterval, FConditions.Stroke, FConditions.Speed);
    end;
    Drive.ProgramRun;
    Timer.Enabled := True;
  finally
    HidePopup;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmJoyStick.estingposition1Click(Sender: TObject);
begin
  Drive.ReadPosition;
  Sleep(200);
  case (Sender as TMenuItem).Tag of
    50: TConfig.Section<TDriverOptions>.TestPosition := Drive.XPosInt;
    51: TConfig.Section<TDriverOptions>.ObservationPosition := Drive.XPosInt;
    52: TConfig.Section<TDriverOptions>.ServicePosition := Drive.XPosInt;
  end;

  lblSetPos.Caption := '<-- ' + (Sender as TMenuItem).Caption;
end;

procedure TfrmJoyStick.FormCreate(Sender: TObject);
begin
  UpdateSpeeds;

  Top := FConfig.Section<TWindowsOptions>.JTop;
  Left := FConfig.Section<TWindowsOptions>.JLeft;

end;

procedure TfrmJoyStick.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if [ssAlt] <> Shift then Exit;

  Drive.ZSpeed(trZSpeed.Position);
  Drive.XSpeed(trXSpeed.Position);

  case Key of
    VK_UP:    Drive.ZUp;
    VK_RIGHT: Drive.XRight;
    VK_Down:  Drive.ZDown;
    VK_Left:  Drive.XLeft;
  end;

  Timer.Enabled := True;
  OnDriving := True;
  Key := 0;

end;

procedure TfrmJoyStick.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if OnDriving then
  begin
    Channel := 0;
    Drive.Stop;
    UpdatePosition;
    OnDriving := False;
  end;
end;

procedure TfrmJoyStick.btnHomeXClick(Sender: TObject);
begin
  Timer.Enabled := True;
  Drive.XHome;
  Drive.XPos := 0;
  UpdatePosition;
end;

procedure TfrmJoyStick.btnHomeZClick(Sender: TObject);
begin
  if FConfig.Section<TStageZOptions>.HomeAuto then
    Drive.ZHomeAuto
  else
    Drive.ZHome;

  UpdatePosition;
end;

procedure TfrmJoyStick.btnGoObservationClick(Sender: TObject);
begin
  Timer.Enabled := True;
  Drive.XSpeed(4);
  Drive.XPosition(TConfig.Section<TDriverOptions>.ObservationPosition);
end;

procedure TfrmJoyStick.btnGoServiceClick(Sender: TObject);
begin
  Timer.Enabled := True;
  Drive.XSpeed(4);
  Drive.XPosition(TConfig.Section<TDriverOptions>.ServicePosition);
end;

procedure TfrmJoyStick.btnGoTestPosClick(Sender: TObject);
begin
  Timer.Enabled := True;
//  Drive.XSpeed(4);
  Drive.XPosition(TConfig.Section<TDriverOptions>.TestPosition);
end;

procedure TfrmJoyStick.gbSpeedClick(Sender: TObject);
begin
  Drive.ZSpeed(trZSpeed.Position);
  Drive.XSpeed(trXSpeed.Position);
end;

procedure TfrmJoyStick.RzBitBtn3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Channel := (Sender as TRzBitBtn).Tag;

  Drive.ZSpeed(trZSpeed.Position);
  Drive.XSpeed(trXSpeed.Position);

  case Channel of
    10: Drive.ZUp;
    11: Drive.XRight;
    12: Drive.ZDown;
    13: Drive.XLeft;
  end;
  Timer.Enabled := True;
end;

procedure TfrmJoyStick.RzBitBtn3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Channel := 0;
  Drive.Stop;
  UpdatePosition;
end;

procedure TfrmJoyStick.TimerTimer(Sender: TObject);
begin
  UpdatePosition;
  Application.ProcessMessages;
  Timer.Enabled := True;
end;

procedure TfrmJoyStick.UpdatePosition;
begin
  Timer.Enabled := False;;
  Drive.ReadError;
  Drive.ReadPosition;
  lblPos.Caption := Format('X: %3.1f Y: %3.1f',[Drive.XPos, Drive.YPos]);

  lblSetPos.Caption := '';
  if Drive.XPosInt = TConfig.Section<TDriverOptions>.TestPosition then lblSetPos.Caption := '<-- Testing position';
  if Drive.XPosInt = TConfig.Section<TDriverOptions>.ObservationPosition then lblSetPos.Caption := '<-- Observation position';
  if Drive.XPosInt = TConfig.Section<TDriverOptions>.ServicePosition then lblSetPos.Caption := '<-- Service position';

end;

end.
