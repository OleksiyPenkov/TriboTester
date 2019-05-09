unit frm_Main;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.Actions, frm_BaseChart, unit_ForceSensor, RzPanel,
  RzButton, RzStatus, frm_NiError, unit_Config, unit_Globals, unit_CondFile,
  unit_Routines, unit_CustomDriver, unit_Driver, unit_DriverPZ, files_list,
  frm_CalibrationD;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    ActionList: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    actFileNew: TAction;
    actFileSave: TAction;
    actFileExit: TAction;
    actFileOpen: TAction;
    actFileSaveAs: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    est1: TMenuItem;
    Run1: TMenuItem;
    Stop1: TMenuItem;
    ool1: TMenuItem;
    Options1: TMenuItem;
    Calibrate1: TMenuItem;
    actTestRun: TAction;
    actTestStop: TAction;
    RzStatusBar1: TRzStatusBar;
    RzToolbar1: TRzToolbar;
    ilToolBar: TImageList;
    btnTestStart: TRzToolButton;
    btnTestPause: TRzToolButton;
    RzSpacer1: TRzSpacer;
    BtnStop: TRzToolButton;
    RzSpacer2: TRzSpacer;
    btnTestConditions: TRzToolButton;
    actTestPause: TAction;
    actTestConditions: TAction;
    TestStatus: TRzStatusPane;
    btnSettings: TRzToolButton;
    actToolsSettings: TAction;
    Timer: TTimer;
    stTextTime: TRzStatusPane;
    N2: TMenuItem;
    Conditions1: TMenuItem;
    actToolsCalibration: TAction;
    RzSpacer4: TRzSpacer;
    BtnNew: TRzToolButton;
    BtnOpen: TRzToolButton;
    BtnSave: TRzToolButton;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    RzVersionInfo: TRzVersionInfo;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    N3: TMenuItem;
    DriveReconnect1: TMenuItem;
    actDriveReconnect: TAction;
    actToolsViewer: TAction;
    RzSpacer3: TRzSpacer;
    BtnView: TRzToolButton;
    rzstspn1: TRzStatusPane;
    stCycles: TRzStatusPane;
    actIndentation: TAction;
    Indentation1: TMenuItem;
    N4: TMenuItem;
    actToolsStaticLoading: TAction;
    actToolsStaticLoading1: TMenuItem;
    actToolsScratch: TAction;
    Scratchtest1: TMenuItem;
    actDisplacementCalibration: TAction;
    DispCalibration1: TMenuItem;
    N5: TMenuItem;
    TestProgress: TRzProgressStatus;
    FilesList1: TFilesList;
    FilesList: TFilesList;
    procedure actFileExitExecute(Sender: TObject);
    procedure actTestRunExecute(Sender: TObject);
    procedure actTestStopExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actToolsSettingsExecute(Sender: TObject);
    procedure actTestConditionsExecute(Sender: TObject);
    procedure n(Sender: TObject);
    procedure actToolsCalibrationExecute(Sender: TObject);
    procedure actFileNewExecute(Sender: TObject);
    procedure actFileOpenExecute(Sender: TObject);
    procedure actFileSaveExecute(Sender: TObject);
    procedure actFileSaveAsExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FilesListFile(Sender: TObject; const F: TSearchRec);
    procedure actDriveReconnectExecute(Sender: TObject);
    procedure actToolsViewerExecute(Sender: TObject);
    procedure actIndentationExecute(Sender: TObject);
    procedure actToolsStaticLoadingExecute(Sender: TObject);
    procedure WindowArrangeAllExecute(Sender: TObject);
    procedure actToolsScratchExecute(Sender: TObject);
    procedure actDisplacementCalibrationExecute(Sender: TObject);
  private
    { Private declarations }
    FNormalChartWin: TBaseChart;
    FLateralChartWin: TBaseChart;
    FFrictionChartWin: TBaseChart;

    FList: TStringList;

    FLastFileName: TFileName;
    FPassedCycles: Integer;
    FProgramEndedNormally: Boolean;
    procedure SetChartWindow(Form: TBaseChart; Name: string;const  YMin, YMax: double);
    procedure ProcessObservationPause;
    procedure ProcessTestPause;

  public
    { Public declarations }
    procedure CreateCharts;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses unit_Const, unit_Helpers,  frm_settings, frm_TestConditions, System.DateUtils,
  frm_Calibration, frm_JoyStick, unit_CursorChanger, ShellApi, frm_Indenation,
  frm_StaticLoading, frm_ScratchTest;

procedure TfrmMain.actTestConditionsExecute(Sender: TObject);
begin
  if Assigned(frmTestConditions) then
  begin
    frmTestConditions.ShowConditions(UseDeadWeight, FConditions);
    if frmTestConditions.Run then actTestRunExecute(Sender);
  end;

end;

procedure TfrmMain.actTestRunExecute(Sender: TObject);
var
  Load: Double;
  CursorChanger: ICursorSaver;
  FileName: string;
begin
  try
    try
      FPassedCycles := 0;
      FProgramEndedNormally := False;
      
      CursorChanger := TCursorSaver.Create;
      actTestRun.Enabled := False;
      ShowPopup('Hardware initialization ...');

      FConfig.LoadSensors(ForceSensor.NormalChannel, ForceSensor.LateralChannel);

      SamplingRate := FConditions.SamplingRate;

      FileName := ChangeFileExt(FConditions.FileName, '.raw');
      ForceSensor.FileName := GenerateFileName(FileName, FilesList, FList);

      SetChartWindow(FNormalChartWin, 'Normal Force (' + ForceUnit + ')', 0, 1.2 * FConditions.Load);
      SetChartWindow(FLateralChartWin,'Friction Force (' + ForceUnit + ')', - 1.2 * FConditions.Load, 1.2 * FConditions.Load);
      SetChartWindow(FFrictionChartWin,'Friction Coefficient', 0, 2);

      UpdatePopup('Program uploading...');

      case FConditions.Mode of
        tmByTime     : Drive.ContProgSet(FConditions.Stroke, FConditions.Speed);
        tmByCycle    : Drive.CycleProgSet(FConditions.NumberOfCycles, FConditions.Stroke, FConditions.Speed);
        tmObservation, tmPaused: Drive.CycleProgSet(FConditions.ObservationInterval, FConditions.Stroke, FConditions.Speed);
      end;

      UpdatePopup('Applying of the normal load...');

      if UseDeadWeight then
        Load := FConditions.Load
      else
        case FConditions.LoadMode of
          lmForce : Load := SetNormalForce(FConditions.Load);
          lmDisplacement : Load := SetNormalForceD(FConditions.Load);
        end;

      if Terminate then raise Exception.Create('Terminated by user');;

      UpdatePopup('Test launching ...');     //

      ForceSensor.CreateFrictionTask;       //
      ForceSensor.StartFrictionTask(Load, True);  // костыл?
      ForceSensor.StopFrictionTask(True);         //
      Sleep(100);

      if Terminate then raise Exception.Create('Terminated by user');;

      if FConditions.UseFeedback then Drive.ZSpeedD(1750);

      ForceSensor.CreateFrictionTask;

      if ForceSensor.StartFrictionTask(Load, False) then
      begin
        CurrentProgramStep := 0;
        actTestStop.Enabled := True;
        frmJoyStick.Enabled := False;
        actToolsViewer.Enabled := False;
        TestStatus.Caption := 'Running ...';
        Sleep(100);
        Drive.ProgramRun;
        Timer.Enabled := True;
      end
      else begin
       actTestRun.Enabled := True;
       actTestStop.Enabled := False;
       actToolsViewer.Enabled := True;
      end;

    except
      on Exception do
      begin
        actTestRun.Enabled := True;
      end;
    end;
  finally
    HidePopup;
  end;
end;

procedure TfrmMain.actTestStopExecute(Sender: TObject);

  function CheckFileSize:boolean;
  var
    F: file of byte;
    Size: longint;
  begin
    AssignFile(F, ForceSensor.FileName);
    Reset(F);
    Size := FileSize(F);
    CloseFile(F);
    Result := Size < MaxFileSizeToShow;
  end;

begin
  Timer.Enabled := False;
  TestStatus.Caption := 'Stopping ...';  TestStatus.Update;
  ForceSensor.StopFrictionTask;
  Drive.ProgramStop;
  actTestStop.Enabled := False;
  actTestRun.Enabled  := True;
  frmJoyStick.Enabled := True;
  actToolsViewer.Enabled := True;
  TestStatus.Caption  := 'Ready';
  Terminate := False;

  if (FConditions.Mode = tmByCycle) and FProgramEndedNormally then
    CyclesPassed := Drive.CyclesPassed;

  if CheckFileSize then ProcessResults(ForceSensor.FileName, FNormalChartWin.Line, FLateralChartWin.Line, FFrictionChartWin.Line);

  stCycles.Caption := IntToStr(FConditions.NumberOfCycles);
  TestProgress.Percent := 100;
end;

procedure TfrmMain.actToolsCalibrationExecute(Sender: TObject);
begin
  try
    if not Assigned(frmCalibration) then  frmCalibration := TfrmCalibration.Create(Self);
    ShowPopup('Hardware initialization ...');

    FConfig.LoadSensors(ForceSensor.NormalChannel, ForceSensor.LateralChannel);

    SamplingRate := FConfig.Section<TAcquisitionOptions>.SamplingRate;


    ForceSensor.FileName := FConditions.FileName;
  finally
    HidePopup;
  end;
  frmCalibration.Sensor := ForceSensor;
  frmCalibration.Show;
end;

procedure TfrmMain.actToolsScratchExecute(Sender: TObject);
begin
  frmScratchTest.Show;
end;

procedure TfrmMain.actToolsSettingsExecute(Sender: TObject);
begin
  frmSettings.ShowModal;
end;

procedure TfrmMain.actToolsStaticLoadingExecute(Sender: TObject);
begin
  frmStaticLoading.ShowModal;
end;

procedure TfrmMain.actToolsViewerExecute(Sender: TObject);
begin
  if not (FileExists(PWideChar(TConfig.Section<TPathOptions>.ViewerPath))) then
    ShowMessage('TriboViewer not found! Please, check settings.')
  else
    ShellExecute(Handle, 'open', PWideChar(TConfig.Section<TPathOptions>.ViewerPath),
               PWideChar(ForceSensor.FileName), nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.SetChartWindow(Form:TBaseChart; Name: string; const  YMin, YMax: double);
begin
  Form.Caption := Name;
  Form.Chart.LeftAxis.Title.Caption := Name;

  Form.SetScale(ReadDataSize, PlotSize - ReadDataSize - 1, YMin, YMax);

  Form.Line.SeriesColor := TConfig.Section<TChartOptions>.LineColor;
  Form.Line.LinePen.Visible := True;
  Form.Line.LinePen.Width := TConfig.Section<TChartOptions>.LineWidth;

  Form.ResetScale;
end;


procedure TfrmMain.WindowArrangeAllExecute(Sender: TObject);
var
  CH, CW: integer;
begin

  CH := ClientHeight - RzStatusBar1.Height-RzToolbar1.Height - 5;
  CW := ClientWidth - 5;

  FFrictionChartWin.Top := 0;
  FFrictionChartWin.Left := 0;
  FFrictionChartWin.Width := CW;
  FFrictionChartWin.Height := CH - frmJoyStick.Height - frmNiError.Height;

  FNormalChartWin.Top := FFrictionChartWin.Height;
  FNormalChartWin.Left := 0;
  FNormalChartWin.Width := CW - frmJoyStick.Width;
  FNormalChartWin.Height := (CH - FFrictionChartWin.Height) div 2;

  FLateralChartWin.Top := FFrictionChartWin.Height + FNormalChartWin.Height;
  FLateralChartWin.Left := 0;
  FLateralChartWin.Width := FNormalChartWin.Width;
  FLateralChartWin.Height := FNormalChartWin.Height;

  frmJoyStick.Top := FFrictionChartWin.Height;
  frmJoyStick.Left := CW - frmJoyStick.Width;

  frmNiError.Top := FFrictionChartWin.Height + frmJoyStick.Height;
  frmNiError.Left := CW - frmNiError.Width;

end;

procedure TfrmMain.CreateCharts;
begin
  FNormalChartWin := TBaseChart.Create(Application);

  FNormalChartWin.Top := TConfig.Section<TWindowsOptions>.NormalTop;
  FNormalChartWin.Left := TConfig.Section<TWindowsOptions>.NormalLeft;
  FNormalChartWin.Width := TConfig.Section<TWindowsOptions>.NormalWidht;
  FNormalChartWin.Height := TConfig.Section<TWindowsOptions>.NormalHeight;

  //---------------------------------------------------------------------------
  FLateralChartWin := TBaseChart.Create(Application);

  FLateralChartWin.Top := TConfig.Section<TWindowsOptions>.FrictionTop;
  FLateralChartWin.Left := TConfig.Section<TWindowsOptions>.FrictionLeft;
  FLateralChartWin.Width := TConfig.Section<TWindowsOptions>.FrictionWidht;
  FLateralChartWin.Height := TConfig.Section<TWindowsOptions>.FrictionHeight;

  //---------------------------------------------------------------------------
  FFrictionChartWin := TBaseChart.Create(Application);

  FFrictionChartWin.Top := TConfig.Section<TWindowsOptions>.COFTop;
  FFrictionChartWin.Left := TConfig.Section<TWindowsOptions>.COFLeft;
  FFrictionChartWin.Width := TConfig.Section<TWindowsOptions>.COFWidht;
  FFrictionChartWin.Height := TConfig.Section<TWindowsOptions>.COFHeight;

  SetChartWindow(FNormalChartWin, 'Normal Force (' + ForceUnit + ')', 0, 11);
  SetChartWindow(FLateralChartWin,'Friction Force (' + ForceUnit + ')',-6, 6);
  SetChartWindow(FFrictionChartWin,'Friction Coefficient', 0, 2);

  ForceSensor := TForceSensor.Create;
  ForceSensor.Init(FLateralChartWin.Line, FNormalChartWin.Line, FFrictionChartWin.Line,
                    TConfig.Section<TChartOptions>.LateralChartDraw,
                    TConfig.Section<TChartOptions>.NormalChartDraw,
                    TConfig.Section<TChartOptions>.FrictionChartDraw,
                    nil, frmNiError.ErrorLabel);

  case TConfig.Section<TPortOptions>.ControllerType of
    0: begin
         DriveA := TDrive.Create;
         Drive := DriveA;
       end;
    1: begin
         DrivePZ := TDrivePZ.Create;
         Drive := DrivePZ;
       end;
  end;
  actDriveReconnect.Execute;
end;

procedure TfrmMain.actDisplacementCalibrationExecute(Sender: TObject);
begin
  try
    if not Assigned(frmCalibrationD) then  frmCalibrationD := TfrmCalibrationD.Create(Self);
    ShowPopup('Hardware initialization ...');

    FConfig.LoadSensors(ForceSensor.NormalChannel, ForceSensor.LateralChannel);

    SamplingRate := FConfig.Section<TAcquisitionOptions>.SamplingRate;


    ForceSensor.FileName := FConditions.FileName;
  finally
    HidePopup;
  end;
  frmCalibrationD.Sensor := ForceSensor;
  frmCalibrationD.Show;
end;

procedure TfrmMain.actDriveReconnectExecute(Sender: TObject);
begin
  with frmNiError do
    Drive.InitPort(cmldConn, cmldTx, cmldRx,
                   lblDriveStatus, lblXError, lblYError,
                   //jvldX, jvldY,
                   TConfig.Section<TPortOptions>.Adress,
                   TConfig.Section<TPortOptions>.BaudRate);

//  Drive.XHome;
end;

procedure TfrmMain.actFileExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actFileNewExecute(Sender: TObject);
begin
  FConditions.FileName := 'C:\TriboTests\Penkov\%Date%\Si_insitu_##.raw';
  FConditions.Duration := 10;
  FConditions.Mode := tmByCycle;
  FConditions.NumberOfCycles := 10;
  FConditions.ObservationInterval := 50;
  FConditions.SamplingRate := 20;
  FConditions.Load := 2;
  FConditions.Stroke := 2;
  FConditions.Speed  := 2;
  FConditions.LoadMode := lmForce;

  FLastFileName := 'Default';
  Caption := 'CNW Tribotester: Default';

  actTestConditions.Execute;
end;

procedure TfrmMain.actFileOpenExecute(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    FLastFileName := dlgOpen.FileName;
    LoadConditions(FLastFileName, FConditions);
    Caption := 'CNW Tribotester: ' + ExtractFileName(FLastFileName);
    actTestConditions.Execute;
   end;
end;

procedure TfrmMain.actFileSaveAsExecute(Sender: TObject);
begin
  if dlgSave.Execute then
  begin
    FLastFileName := dlgSave.FileName;
    SaveConditions(FLastFileName, FConditions);
    Caption := 'CNW Tribotester: ' + ExtractFileName(FLastFileName);
  end;
end;

procedure TfrmMain.actFileSaveExecute(Sender: TObject);
begin
  if FLastFileName <> 'Default' then
     SaveConditions(FLastFileName, FConditions)
  else
    actFileSaveAs.Execute;
end;

procedure TfrmMain.actIndentationExecute(Sender: TObject);
begin
  frmIndentation.ShowModal;
end;

procedure TfrmMain.FilesListFile(Sender: TObject; const F: TSearchRec);
begin
  FList.Add(F.Name);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Do you want to quit application?', mtConfirmation, [mbYes, mbNo], 0)=mrNo then
  begin
    CanClose := False;
    Exit;
  end;

  TConfig.Section<TWindowsOptions>.NormalTop := FNormalChartWin.Top;
  TConfig.Section<TWindowsOptions>.NormalLeft := FNormalChartWin.Left;
  TConfig.Section<TWindowsOptions>.NormalWidht := FNormalChartWin.Width;
  TConfig.Section<TWindowsOptions>.NormalHeight := FNormalChartWin.Height;


  TConfig.Section<TWindowsOptions>.FrictionTop := FLateralChartWin.Top;
  TConfig.Section<TWindowsOptions>.FrictionLeft := FLateralChartWin.Left;
  TConfig.Section<TWindowsOptions>.FrictionWidht := FLateralChartWin.Width;
  TConfig.Section<TWindowsOptions>.FrictionHeight := FLateralChartWin.Height;


  TConfig.Section<TWindowsOptions>.COFTop := FFrictionChartWin.Top;
  TConfig.Section<TWindowsOptions>.COFLeft := FFrictionChartWin.Left;
  TConfig.Section<TWindowsOptions>.COFWidht := FFrictionChartWin.Width;
  TConfig.Section<TWindowsOptions>.COFHeight := FFrictionChartWin.Height;

  FConfig.Section<TWindowsOptions>.JTop := frmJoyStick.Top;
  FConfig.Section<TWindowsOptions>.JLeft := frmJoyStick.Left;

  FConfig.Section<TWindowsOptions>.STop := frmNiError.Top;
  FConfig.Section<TWindowsOptions>.SLeft := frmNiError.Left;

  FreeAndNil(FConfig);
  FreeAndNil(ForceSensor);
  FreeAndNil(FList);

  CanClose := True;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  FConfig := TConfig.Create;
  FList := TStringList.Create;

  SetForceUnit(TConfig.Section<TAcquisitionOptions>.ForceUnitIndex);
  UseDeadWeight := TConfig.Section<TAcquisitionOptions>.LoadingMethod = 1;

  actFileNew.Execute;
  if ParamCount > 0 then
  begin
    LoadConditions(ParamStr(1), FConditions);
    Caption := 'CNW Tribotester: ' + ParamStr(1);
  end;

end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Escape then Terminate := True;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
//  TileMode := tbHorizontal;
//  Tile;

  if not TConfig.Section<TChartOptions>.LateralChartDraw then FLateralChartWin.WindowState := wsMinimized;
  if not TConfig.Section<TChartOptions>.NormalChartDraw then FNormalChartWin.WindowState := wsMinimized;
  if not TConfig.Section<TChartOptions>.FrictionChartDraw then FFrictionChartWin.WindowState := wsMinimized;

end;

procedure TfrmMain.ProcessTestPause;
begin
  Inc(FPassedCycles, FConditions.ObservationInterval);

  if FPassedCycles >= FConditions.NumberOfCycles then
  begin
    actTestStop.Execute;
    Exit;
  end;
  ForceSensor.PauseFrictionTask;
  Drive.ProgramStop;


  frmMain.Caption := Format('Tribo (%d of %d)',[FPassedCycles, FConditions.NumberOfCycles]);
  frmMain.Update;
  ShowMessage(Format('Observation (%d of %d). Press OK to continue the test!',[FPassedCycles, FConditions.NumberOfCycles]));

  CurrentProgramStep := 0;
  ForceSensor.ContinueFrictionTask;
  Drive.ProgramRun;
  Timer.Enabled := True;
end;

procedure TfrmMain.ProcessObservationPause;
  procedure Pause (Count: integer);
  var
    i: integer;
  begin
  for I := 1 to Count do
  begin
    Sleep(500);
    Drive.ReadPosition;
    Application.ProcessMessages;
  end;
  end;

begin
  Inc(FPassedCycles, FConditions.ObservationInterval);

  Drive.ProgramStop;
  ForceSensor.PauseFrictionTask;
  Drive.ZHome;
  Pause(5);

  Drive.XSpeed(4);
  Drive.XPosition(TConfig.Section<TDriverOptions>.ServicePosition);
  Pause(3);
  ShowMessage('INSTALL safety stoppers!');

//  Drive.XHome;
//  Pause(5);
  Drive.XSpeed(2);
  Drive.XPosition(TConfig.Section<TDriverOptions>.ObservationPosition);


  if FPassedCycles >= FConditions.NumberOfCycles then
  begin
    actTestStop.Execute;
    ShowMessage('The test is completed.');
    Exit;
  end;

  Pause(9);
  frmMain.Caption := Format('Tribo (%d of %d)',[FPassedCycles, FConditions.NumberOfCycles]);
  frmMain.Update;
  ShowMessage(Format('Observation (%d of %d). Press OK to continue the test!',[FPassedCycles, FConditions.NumberOfCycles]));

  Drive.XSpeed(4);
  Drive.XPosition(TConfig.Section<TDriverOptions>.ServicePosition);
  Pause(3);
  ShowMessage('REMOVE safety stoppers!');

  Drive.XHome;
  Pause(7);


  Drive.XSpeed(1);
  Drive.XPosition(TConfig.Section<TDriverOptions>.TestPosition);
  Pause(3);

  ShowPopup('Hardware initialization ...');
  Drive.CycleProgSet(FConditions.ObservationInterval, FConditions.Stroke, FConditions.Speed);
  UpdatePopup('Applying of the normal load...');

  SetNormalForce(FConditions.Load);

  UpdatePopup('Hardware re-initialization ...');
  ForceSensor.ContinueFrictionTask;
//  Pause(5);
  CurrentProgramStep := 0;
  Drive.ProgramRun;
  Timer.Enabled := True;
  HidePopup;
end;


procedure TfrmMain.n(Sender: TObject);
var
  time: TDateTime;
  timestr: string;
begin
  Timer.Enabled := False;

  time := SecondsBetween(Now, TestStartTime);

  case FConditions.Mode of
    tmByTime:     if time >= FConditions.Duration then actTestStop.Execute
                        else Timer.Enabled := True;

    tmByCycle:    begin
                    Drive.ReadStep;
                    if (CurrentProgramStep > 9) then
                    begin
                      FProgramEndedNormally := True;
                      actTestStop.Execute;
                    end
                    else
                      Timer.Enabled := True;
                  end;

    tmObservation:begin
                    Drive.ReadStep;
                    if CurrentProgramStep = 10 then ProcessObservationPause
                          else Timer.Enabled := True;
                  end;

    tmPaused:     begin
                    Drive.ReadStep;
                    if CurrentProgramStep = 10 then ProcessTestPause
                    else Timer.Enabled := True;
                  end;
  end;

  DateTimeToString(timestr, 'hh:mm:ss', Now - TestStartTime);
  stTextTime.Caption := timestr;
  stTextTime.Repaint;

  stCycles.Caption := IntToStr(CyclesPassed);
  stCycles.Repaint;

  TestProgress.Percent := Round(CyclesPassed / FConditions.NumberOfCycles * 100);
end;

end.
