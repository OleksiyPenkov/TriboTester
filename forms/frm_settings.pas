
unit frm_settings;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Mask,
  ExtCtrls,
  ComCtrls,
  ImgList,
  RzPanel,
  unit_Config,
  RzRadGrp,
  RzEdit,
  RzCmboBx,
  RzButton,
  RzRadChk,
  RzSpnEdt,
  RzBtnEdt, CPortCtl, unit_Const;

type
  TfrmSettings = class(TForm)
    pcSetPages: TPageControl;
    tSensors: TTabSheet;
    dlgColors: TColorDialog;
    pnButtons: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    gbLateral: TRzGroupBox;
    cbAddress: TRzComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    edVMin: TRzNumericEdit;
    edVMax: TRzNumericEdit;
    edResistance: TRzNumericEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbbBridgeConfig: TRzComboBox;
    Label7: TLabel;
    gbUnits: TRzRadioGroup;
    cbbExcValue: TRzComboBox;
    gbSource: TRzRadioGroup;
    gbNormal: TRzGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cbAdressN: TRzComboBox;
    edNameN: TEdit;
    edVMinN: TRzNumericEdit;
    edVMaxN: TRzNumericEdit;
    edResistanceN: TRzNumericEdit;
    cbbBridgeConfigN: TRzComboBox;
    gbUnitsN: TRzRadioGroup;
    cbbExcValueN: TRzComboBox;
    gbSourceN: TRzRadioGroup;
    cbConnectedN: TRzCheckBox;
    cbConnected: TRzCheckBox;
    edFactorN: TRzNumericEdit;
    lblScaleFactorN: TLabel;
    lblScaleFactorL: TLabel;
    edFactor: TRzNumericEdit;
    tsCharts: TTabSheet;
    RzGroupBox3: TRzGroupBox;
    chkNormal: TCheckBox;
    chkLateral: TCheckBox;
    chkFriction: TCheckBox;
    RzGroupBox4: TRzGroupBox;
    Label17: TLabel;
    tsAcqusition: TTabSheet;
    RzGroupBox5: TRzGroupBox;
    edLoadingSteps1: TRzNumericEdit;
    Label19: TLabel;
    edAmpN: TRzNumericEdit;
    Label20: TLabel;
    edAmpL: TRzNumericEdit;
    Label21: TLabel;
    tsPaths: TTabSheet;
    RzGroupBox6: TRzGroupBox;
    edViewerPath: TRzButtonEdit;
    dlgOpen: TOpenDialog;
    tsStages: TTabSheet;
    tsStageY: TTabSheet;
    RzGroupBox7: TRzGroupBox;
    edXSpeedScale: TLabeledEdit;
    edXStrokeScale: TLabeledEdit;
    edXSpeedMultiplayer: TLabeledEdit;
    edXHomeLow: TLabeledEdit;
    edXHomeHigh: TLabeledEdit;
    edXStartSpeed: TLabeledEdit;
    edXDeceleration: TLabeledEdit;
    edXAcceleration: TLabeledEdit;
    edXSpeed1: TLabeledEdit;
    edXSpeed2: TLabeledEdit;
    edXSpeed3: TLabeledEdit;
    edXSpeed4: TLabeledEdit;
    chkXAutoHome: TCheckBox;
    bxTime1: TRzGroupBox;
    edZSpeedScale: TLabeledEdit;
    edZStrokeScale: TLabeledEdit;
    edZSpeedMultiplayer: TLabeledEdit;
    edZHomeLow: TLabeledEdit;
    edZHomeHigh: TLabeledEdit;
    edZStartSpeed: TLabeledEdit;
    edZDeceleration: TLabeledEdit;
    edZAcceleration: TLabeledEdit;
    edZSpeed1: TLabeledEdit;
    edZSpeed2: TLabeledEdit;
    edZSpeed3: TLabeledEdit;
    edZSpeed4: TLabeledEdit;
    chkZAutoHome: TCheckBox;
    tsPort: TTabSheet;
    chkReverse: TCheckBox;
    RzGroupBox8: TRzGroupBox;
    Label22: TLabel;
    cbPort: TComComboBox;
    cbBaudRate: TComComboBox;
    Label23: TLabel;
    Label24: TLabel;
    Combo3: TComComboBox;
    Combo4: TComComboBox;
    Label25: TLabel;
    Label26: TLabel;
    Combo5: TComComboBox;
    Combo6: TComComboBox;
    Label27: TLabel;
    RzGroupBox9: TRzGroupBox;
    cbController: TComboBox;
    chkReverseZ: TCheckBox;
    RzGroupBox10: TRzGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    edtLineWidth: TRzSpinEdit;
    edtLineColor: TColorBox;
    cbbForceUnits: TComboBox;
    edLoadingSteps2: TRzNumericEdit;
    Label16: TLabel;
    edLoadingSteps3: TRzNumericEdit;
    Label18: TLabel;
    edLoadingDelay: TRzNumericEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edLoadingRange1: TRzNumericEdit;
    edLoadingRange2: TRzNumericEdit;
    Label33: TLabel;
    edFeedbackCoefficient: TRzNumericEdit;
    Label34: TLabel;
    RzGroupBox1: TRzGroupBox;
    Label35: TLabel;
    edSamplingRate: TRzNumericEdit;
    rgLoadingMethod: TRadioGroup;

    procedure SaveSettingsClick(Sender: TObject);
    procedure ShowHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edViewerPathButtonClick(Sender: TObject);
    procedure edXStrokeScaleChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgLoadingMethodClick(Sender: TObject);


  private
    FChanged: boolean;

  public
    procedure LoadSetting;
    procedure SaveSettings;
    property Changed:boolean read FChanged write FChanged;
  end;

var
  frmSettings: TfrmSettings;

implementation

uses
  StrUtils,
  Character,
  unit_Globals,
  unit_Helpers,
  NIDAQmxCAPI_TLB, unit_Routines, unit_ForceSensor;

{$R *.dfm}

procedure TfrmSettings.LoadSetting;
begin
  with TConfig.Section<TAcquisitionOptions> do
  begin
    edSamplingRate.IntValue := SamplingRate;
    cbbForceUnits.ItemIndex := ForceUnitIndex;
    rgLoadingMethod.ItemIndex := LoadingMethod;
  end;

  with TConfig.Section<TChartOptions> do
  begin
    chkNormal.Checked := NormalChartDraw;
    chkLateral.Checked := LateralChartDraw;
    chkFriction.Checked := FrictionChartDraw;

    edtLineWidth.Value := LineWidth;
    edtLineColor.Selected := LineColor;
  end;

   {---------------    Friction Sensor ---------------------------------------}

  with TConfig.Section<TLateralSOptions> do
  begin
    cbConnected.Checked := Connected;

    edtName.Text := Name;
    cbAddress.Text := Adress;

    edVMin.Value := Min;
    edVMax.Value := Max;
    edResistance.Value := Resistance;
    edFactor.Value := Factor;

    edAmpL.IntValue := Amplification;

    case Units of
      DAQmx_Val_mVoltsPerVolt: gbUnits.ItemIndex := 0;
      DAQmx_Val_VoltsPerVolt:  gbUnits.ItemIndex := 1;
    end;

    case ExcitSource of
      DAQmx_Val_Internal: gbSource.ItemIndex := 0;
      DAQmx_Val_External: gbSource.ItemIndex := 1;
      DAQmx_Val_None:     gbSource.ItemIndex := 2;
    end;

    case BridgeConfig of
      DAQmx_Val_FullBridge: cbbBridgeConfig.ItemIndex := 0;
      DAQmx_Val_HalfBridge: cbbBridgeConfig.ItemIndex := 1;
      DAQmx_Val_QuarterBridge: cbbBridgeConfig.ItemIndex := 1;
    end;

    case Round(ExcitValue * 10) of
      25: cbbExcValue.ItemIndex := 0;
      30  : cbbExcValue.ItemIndex := 1;
      50  : cbbExcValue.ItemIndex := 2;
      100 : cbbExcValue.ItemIndex := 3;
    end;
  end;

   {---------------    Normal Sensor ---------------------------------------}

  with TConfig.Section<TNormalSOptions> do
  begin
     cbConnectedN.Checked := Connected;

    edNameN.Text := Name;
    cbAdressN.Text := Adress;

    edVMinN.Value := Min;
    edVMaxN.Value := Max;
    edResistanceN.Value := Resistance;
    edFactorN.Value := Factor;

    edAmpN.IntValue := Amplification;

    case Units of
      DAQmx_Val_mVoltsPerVolt: gbUnitsN.ItemIndex := 0;
      DAQmx_Val_VoltsPerVolt:  gbUnitsN.ItemIndex := 1;
    end;

    case ExcitSource of
      DAQmx_Val_Internal: gbSourceN.ItemIndex := 0;
      DAQmx_Val_External: gbSourceN.ItemIndex := 1;
      DAQmx_Val_None:     gbSourceN.ItemIndex := 2;
    end;

    case BridgeConfig of
      DAQmx_Val_FullBridge: cbbBridgeConfigN.ItemIndex := 0;
      DAQmx_Val_HalfBridge: cbbBridgeConfigN.ItemIndex := 1;
      DAQmx_Val_QuarterBridge: cbbBridgeConfigN.ItemIndex := 1;
    end;

    case Round(ExcitValue * 10) of
      25  : cbbExcValueN.ItemIndex := 0;
      30  : cbbExcValueN.ItemIndex := 1;
      50  : cbbExcValueN.ItemIndex := 2;
      100 : cbbExcValueN.ItemIndex := 3;
    end;
  end;

  {----------- Paths ---------------------------------------------------------}
  with TConfig.Section<TPathOptions> do
  begin
    edViewerPath.Text := ViewerPath;
  end;

  {---------- Stage X --------------------------------------------------------}
  with TConfig.Section<TStageXOptions> do
  begin
    edXStrokeScale.Text := IntToStr(StrokeScale);
    edXSpeedScale.Text := IntToStr(SpeedScale);
    edXSpeedMultiplayer.Text := IntToStr(SpeedMultiplayer);
    edXAcceleration.Text := IntToStr(AccelerationRate);
    edXDeceleration.Text := IntToStr(DecelerationRate);
    edXStartSpeed.Text := IntToStr(StartSpeed);
    edXSpeed1.Text := IntToStr(DriveSpeed1);
    edXSpeed2.Text := IntToStr(DriveSpeed2);
    edXSpeed3.Text := IntToStr(DriveSpeed3);
    edXSpeed4.Text := IntToStr(DriveSpeed4);
    edXHomeLow.Text := IntToStr(HomeLow);
    edXHomeHigh.Text := IntToStr(HomeHigh);

    chkReverse.Checked := Reverse;
    chkXAutoHome.Checked := HomeAuto;
  end;

  {---------- Stage Z --------------------------------------------------------}
  with TConfig.Section<TStageZOptions> do
  begin
    edZStrokeScale.Text := IntToStr(StrokeScale);
    edZSpeedScale.Text := IntToStr(SpeedScale);
    edZSpeedMultiplayer.Text := IntToStr(SpeedMultiplayer);
    edZAcceleration.Text := IntToStr(AccelerationRate);
    edZDeceleration.Text := IntToStr(DecelerationRate);
    edZStartSpeed.Text := IntToStr(StartSpeed);
    edZSpeed1.Text := IntToStr(DriveSpeed1);
    edZSpeed2.Text := IntToStr(DriveSpeed2);
    edZSpeed3.Text := IntToStr(DriveSpeed3);
    edZSpeed4.Text := IntToStr(DriveSpeed4);
    edZHomeLow.Text := IntToStr(HomeLow);
    edZHomeHigh.Text := IntToStr(HomeHigh);

    chkZAutoHome.Checked := HomeAuto;
    chkReverseZ.Checked := Reverse;

    edLoadingSteps1.Value := LoadingSteps1 ;
    edLoadingSteps2.Value := LoadingSteps2;
    edLoadingSteps3.Value := LoadingSteps3;
    edLoadingDelay.Value  := LoadingDelay;
    edLoadingRange1.Value := LoadingRange1;
    edLoadingRange2.Value := LoadingRange2;

    edFeedbackCoefficient.Value := FBCoeff;
  end;

  with TConfig.Section<TPortOptions> do
  begin
    cbPort.Text := Adress;
    cbBaudRate.ItemIndex := BaudRate;
    cbController.ItemIndex := ControllerType;
  end;

 end;

procedure TfrmSettings.rgLoadingMethodClick(Sender: TObject);
begin
  gbNormal.Enabled := rgLoadingMethod.ItemIndex = 0;
//  if frmSettings.Showing then ShowMessage('Restart the program to apply new settings!');
end;

procedure TfrmSettings.SaveSettings;
begin
  with TConfig.Section<TAcquisitionOptions> do
  begin
    SamplingRate := edSamplingRate.IntValue;
    ForceUnitIndex := cbbForceUnits.ItemIndex;
    SetForceUnit(ForceUnitIndex);
    LoadingMethod := rgLoadingMethod.ItemIndex
  end;

  with TConfig.Section<TChartOptions> do
  begin
    NormalChartDraw := chkNormal.Checked;
    LateralChartDraw := chkLateral.Checked;
    FrictionChartDraw := chkFriction.Checked;

    LineWidth := edtLineWidth.IntValue;
    LineColor := edtLineColor.Selected;
  end;

  {---------------    Friction Sensor ---------------------------------------}

  with TConfig.Section<TLateralSOptions> do
  begin
    Connected := cbConnected.Checked;

    Name := edtName.Text;
    Adress := cbAddress.Text;

    Min := edVMin.Value;
    Max := edVMax.Value;
    Resistance := edResistance.Value;
    Factor := edFactor.Value;

    Amplification := edAmpL.IntValue;

    case gbUnits.ItemIndex of
      0: Units := DAQmx_Val_mVoltsPerVolt;
      1: Units := DAQmx_Val_VoltsPerVolt;
    end;

    case gbSource.ItemIndex of
      0: ExcitSource := DAQmx_Val_Internal;
      1: ExcitSource := DAQmx_Val_External;
      2: ExcitSource := DAQmx_Val_None;
    end;

    case cbbBridgeConfig.ItemIndex of
      0: BridgeConfig := DAQmx_Val_FullBridge;
      1: BridgeConfig := DAQmx_Val_HalfBridge;
      2: BridgeConfig := DAQmx_Val_QuarterBridge;
    end;

    ExcitValue := StrToFloat(cbbExcValue.Text);
  end;

  {---------------    Normal Sensor ---------------------------------------}

  with TConfig.Section<TNormalSOptions> do
  begin
    Connected := cbConnectedN.Checked;

    Name := edNameN.Text;
    Adress := cbAdressN.Text;

    Min := edVMinN.Value;
    Max := edVMaxN.Value;
    Resistance := edResistanceN.Value;
    Factor := edFactorN.Value;

    Amplification := edAmpN.IntValue;

    case gbUnitsN.ItemIndex of
      0: Units := DAQmx_Val_mVoltsPerVolt;
      1: Units := DAQmx_Val_VoltsPerVolt;
    end;

    case gbSourceN.ItemIndex of
      0: ExcitSource := DAQmx_Val_Internal;
      1: ExcitSource := DAQmx_Val_External;
      2: ExcitSource := DAQmx_Val_None;
    end;

    case cbbBridgeConfigN.ItemIndex of
      0: BridgeConfig := DAQmx_Val_FullBridge;
      1: BridgeConfig := DAQmx_Val_HalfBridge;
      2: BridgeConfig := DAQmx_Val_QuarterBridge;
    end;

    ExcitValue := StrToFloat(cbbExcValueN.Text);
  end;

  {----------- Paths ---------------------------------------------------------}
  with TConfig.Section<TPathOptions> do
  begin
    ViewerPath := edViewerPath.Text;
  end;

  {---------- Stage X --------------------------------------------------------}
  with TConfig.Section<TStageXOptions> do
  begin
    StrokeScale := StrToInt(edXStrokeScale.Text);
    SpeedScale := StrToInt(edXSpeedScale.Text);
    SpeedMultiplayer := StrToInt(edXSpeedMultiplayer.Text);
    AccelerationRate := StrToInt(edXAcceleration.Text);
    DecelerationRate := StrToInt(edXDeceleration.Text);
    StartSpeed := StrToInt(edXStartSpeed.Text);
    DriveSpeed1 := StrToInt(edXSpeed1.Text);
    DriveSpeed2 := StrToInt(edXSpeed2.Text);
    DriveSpeed3 := StrToInt(edXSpeed3.Text);
    DriveSpeed4 := StrToInt(edXSpeed4.Text);
    HomeLow := StrToInt(edXHomeLow.Text);
    HomeHigh := StrToInt(edXHomeHigh.Text);

    Reverse := chkReverse.Checked;
    HomeAuto := chkXAutoHome.Checked;
  end;

  {---------- Stage Z --------------------------------------------------------}
  with TConfig.Section<TStageZOptions> do
  begin
    StrokeScale := StrToInt(edZStrokeScale.Text);
    SpeedScale := StrToInt(edZSpeedScale.Text);
    SpeedMultiplayer := StrToInt(edZSpeedMultiplayer.Text);
    AccelerationRate := StrToInt(edZAcceleration.Text);
    DecelerationRate := StrToInt(edZDeceleration.Text);
    StartSpeed := StrToInt(edZStartSpeed.Text);
    DriveSpeed1 := StrToInt(edZSpeed1.Text);
    DriveSpeed2 := StrToInt(edZSpeed2.Text);
    DriveSpeed3 := StrToInt(edZSpeed3.Text);
    DriveSpeed4 := StrToInt(edZSpeed4.Text);
    HomeLow := StrToInt(edZHomeLow.Text);
    HomeHigh := StrToInt(edZHomeHigh.Text);

    HomeAuto := chkzAutoHome.Checked;
    Reverse := chkReverseZ.Checked;

    LoadingSteps1 := edLoadingSteps1.IntValue;
    LoadingSteps2 := edLoadingSteps2.IntValue;
    LoadingSteps3 := edLoadingSteps3.IntValue;
    LoadingDelay  := edLoadingDelay.IntValue;
    LoadingRange1 := edLoadingRange1.Value;
    LoadingRange2 := edLoadingRange2.Value;

    FBCoeff := edFeedbackCoefficient.Value;
  end;

  with TConfig.Section<TPortOptions> do
  begin
    Adress := cbPort.Text;
    BaudRate := cbBaudRate.ItemIndex;
    ControllerType := cbController.ItemIndex;
  end;
end;


procedure TfrmSettings.ShowHelpClick(Sender: TObject);
begin
//  HtmlHelp(Application.Handle, PChar(TConfig.SystemFileName[sfAppHelp]), HH_HELP_CONTEXT, pcSetPages.ActivePage.HelpContext);
end;

procedure TfrmSettings.SaveSettingsClick(Sender: TObject);
begin
  SaveSettings;
  TConfig.LoadSensors(ForceSensor.NormalChannel, ForceSensor.LateralChannel);
  if FChanged then
  begin
    UpdateDriveSettings;
    UpdateSpeeds;
  end;
  Close;
end;


procedure TfrmSettings.edViewerPathButtonClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    edViewerPath.Text := dlgOpen.FileName;
  end;
end;

procedure TfrmSettings.edXStrokeScaleChange(Sender: TObject);
begin
  FChanged := True;
end;

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  cbbForceUnits.Items.Clear;
  cbbForceUnits.Items.Add(ForceUnits[0]);
  cbbForceUnits.Items.Add(ForceUnits[1]);
  cbbForceUnits.Items.Add(ForceUnits[2]);
  cbbForceUnits.Items.Add(ForceUnits[3]);
end;

procedure TfrmSettings.FormShow(Sender: TObject);
begin
  pcSetPages.ActivePageIndex := 0;
  LoadSetting;
  FChanged := False;
  lblScaleFactorN.Caption := Format('Scale Factor (%s/mV)',[ForceUnit]);
  lblScaleFactorL.Caption := Format('Scale Factor (%s/mV)',[ForceUnit]);
end;

//
//
//
end.
