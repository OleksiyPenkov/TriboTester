program tribo;

uses
  Forms,
  frm_Main in 'forms\frm_Main.pas' {frmMain},
  unit_Const in 'units\unit_Const.pas',
  unit_ForceSensor in 'units\unit_ForceSensor.pas',
  unit_Globals in 'units\unit_Globals.pas',
  NIDAQmxCAPI_TLB in 'NIDaqMX\NIDAQmxCAPI_TLB.pas',
  frm_BaseChart in 'forms\frm_BaseChart.pas' {BaseChart},
  frm_NiError in 'forms\frm_NiError.pas' {frmNiError},
  frm_info_popup in 'forms\frm_info_popup.pas' {frmInfoPopup},
  unit_Helpers in 'units\unit_Helpers.pas',
  unit_Config in 'units\unit_Config.pas',
  frm_settings in 'forms\frm_settings.pas' {frmSettings},
  frm_TestConditions in 'forms\frm_TestConditions.pas' {frmTestConditions},
  frm_CalibrationD in 'forms\frm_CalibrationD.pas' {frmCalibrationD},
  unit_CondFile in 'units\unit_CondFile.pas',
  unit_CustomDriver in 'units\unit_CustomDriver.pas',
  unit_Routines in 'units\unit_Routines.pas',
  frm_JoyStick in 'forms\frm_JoyStick.pas' {frmJoyStick},
  unit_CursorChanger in 'units\unit_CursorChanger.pas',
  files_list in 'units\files_list.pas',
  Vcl.Themes,
  Vcl.Styles,
  {$IFDEF Win64}
  nidaqmx64 in 'NIDaqMX\nidaqmx64.pas',
  {$ELSE}
  nidaqmx in 'NIDaqMX\nidaqmx.pas',
  {$ENDIF}
  frm_Indenation in 'forms\frm_Indenation.pas' {frmIndentation},
  unit_DriverPZ in 'units\unit_DriverPZ.pas',
  unit_Driver in 'units\unit_Driver.pas',
  frm_StaticLoading in 'forms\frm_StaticLoading.pas' {frmStaticLoading},
  frm_ScratchTest in 'forms\frm_ScratchTest.pas' {frmScratchTest},
  frm_Calibration in 'forms\frm_Calibration.pas' {frmCalibration};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmNiError, frmNiError);
  Application.CreateForm(TfrmInfoPopup, frmInfoPopup);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmTestConditions, frmTestConditions);
  Application.CreateForm(TfrmJoyStick, frmJoyStick);
  Application.CreateForm(TfrmIndentation, frmIndentation);
  Application.CreateForm(TfrmStaticLoading, frmStaticLoading);
  Application.CreateForm(TfrmScratchTest, frmScratchTest);
  frmMain.CreateCharts;
  Application.Run;
end.
 
