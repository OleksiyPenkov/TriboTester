unit frm_Calibration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, unit_ForceSensor,
  RzBorder, RzRadGrp, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, unit_Helpers, unit_Globals;


type
  TfrmCalibration = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    btnClose: TButton;
    rzSignalPos: TRzMeter;
    rzSignalNeg: TRzMeter;
    tmrTimer: TTimer;
    RzGroupBox1: TRzGroupBox;
    lblValue: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    gbRange: TRzRadioGroup;
    RzGroupBox2: TRzGroupBox;
    chkZero: TCheckBox;
    RzGroupBox3: TRzGroupBox;
    btnMeasure: TButton;
    btnCont: TButton;
    btnStop: TButton;
    RzGroupBox4: TRzGroupBox;
    Chart: TChart;
    edtForce: TEdit;
    btnAdd: TButton;
    btnClear: TButton;
    btnCalc: TButton;
    lblB: TLabel;
    Series: TPointSeries;
    Line: TLineSeries;
    lblSens: TLabel;
    gbSensor: TRzRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblValueF: TLabel;
    lblUnits: TLabel;
    procedure btnMeasureClick(Sender: TObject);
    procedure tmrTimerTimer(Sender: TObject);
    procedure btnContClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnStopClick(Sender: TObject);
    procedure gbRangeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FForceSensor: TForceSensor;
    FMax: double;

    Value: double;

    procedure DrawBars(Value: double);
    procedure Interpol;

    { Private declarations }
  public
    { Public declarations }
    property Sensor: TForceSensor  read FForceSensor write FForceSensor;
  end;

var
  frmCalibration: TfrmCalibration;

implementation

{$R *.dfm}



procedure TfrmCalibration.btnAddClick(Sender: TObject);
begin
  Series.AddXY(Value, StrToFloat(edtForce.Text));
end;

procedure TfrmCalibration.btnCalcClick(Sender: TObject);
begin
  Interpol;
end;

procedure TfrmCalibration.btnClearClick(Sender: TObject);
begin
  Line.Clear;
  Series.Clear;
end;

procedure TfrmCalibration.btnCloseClick(Sender: TObject);
begin
  btnStopClick(Sender);
  Close;
end;

procedure TfrmCalibration.btnContClick(Sender: TObject);
begin
  case gbSensor.ItemIndex of
    0: FForceSensor.CreateSingleForceTask(FForceSensor.NormalChannel, chkZero.Checked);
    1: FForceSensor.CreateSingleForceTask(FForceSensor.LateralChannel, chkZero.Checked);
  end;

  gbSensor.Enabled := False;
  tmrTimer.Enabled := True;
  btnCont.Enabled := False;
  btnStop.Enabled := True;
end;

procedure TfrmCalibration.btnMeasureClick(Sender: TObject);
begin
  case gbSensor.ItemIndex of
    0: FForceSensor.CreateSingleForceTask(FForceSensor.NormalChannel, chkZero.Checked);
    1: FForceSensor.CreateSingleForceTask(FForceSensor.LateralChannel, chkZero.Checked);
  end;

  Value := FForceSensor.GetNormalForceValue(50);
  lblValue.Caption := FloatToStrF(Value, ffFixed, 4,3);
  FForceSensor.StopSingleFroceTask;
  DrawBars(Value);
end;

procedure TfrmCalibration.btnStopClick(Sender: TObject);
begin
  tmrTimer.Enabled := False;

  FForceSensor.StopSingleFroceTask;

  btnCont.Enabled := True;
  btnStop.Enabled := False;
  gbSensor.Enabled := True;
end;

procedure TfrmCalibration.DrawBars(Value: double);
begin
  if Value > 0 then
  begin
    rzSignalPos.Value := Round(Value / FMax * 100);
    rzSignalNeg.Value := 0;
  end
  else begin
    rzSignalPos.Value := 0;
    rzSignalNeg.Value := Abs(Round(Value / FMax * 100));
  end;
end;

procedure TfrmCalibration.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrTimer.Enabled := False;
  FForceSensor.StopSingleFroceTask;
end;

procedure TfrmCalibration.FormCreate(Sender: TObject);
begin
  FMax := 1;
  rzSignalPos.Value := 0;
  rzSignalNeg.Value := 0;


  Series.AddXY(0,0);
  Series.AddXY(0.5, 1);
  Series.AddXY(0.99, 2);
  Series.AddXY(2.05, 4);
  Series.AddXY(3.95, 8);

end;

procedure TfrmCalibration.FormShow(Sender: TObject);
begin
  lblUnits.Caption := '(' + ForceUnit + ')';
  lblSens.Caption := '(' + ForceUnit + '/mV)';
  Chart.Axes.Left.Title.Caption := 'Force (' + ForceUnit + ')';
end;

procedure TfrmCalibration.gbRangeClick(Sender: TObject);
begin
  case gbRange.ItemIndex of
    0: FMax := 1;
    1: FMax := 2.5;
    2: FMax := 5;
    3: FMax := 10;
    4: FMax := 20;
  end;
end;

procedure TfrmCalibration.Interpol;
var
  i, N: Integer;
  A,B: Double;
  x,y,xy, x2: Double;
begin
  x := 0;
  y := 0;
  xy := 0;
  x2 := 0;

  N := Series.Count;

  for I := 0 to Series.Count - 1 do
  begin
    x := x + Series.XValues[i];
    x2 := x2 + Sqr(Series.XValues[i]);
    xy := xy + Series.XValues[i] * Series.YValues[i];
    y := y + Series.YValues[i];
  end;

  a := (N * xy - x*y)/(N*x2 - Sqr(x));
  b := (y - a*x)/ N;

  lblB.Caption := FloatToStrF(a, ffFixed, 4,3);

  Line.Clear;

  Line.AddXY(Series.XValues[0], b + a * Series.XValues[0]);
  Line.AddXY(Series.XValues[N - 1], b + a * Series.XValues[N - 1]);

end;

procedure TfrmCalibration.tmrTimerTimer(Sender: TObject);
begin
  Value := FForceSensor.GetNormalForceValue(5);
  lblValue.Caption := FloatToStrF(Value, ffFixed, 4,3);
  case gbSensor.ItemIndex of
    0:   lblValueF.Caption := FloatToStrF(Value * FForceSensor.NormalChannel.Factor, ffFixed, 4,3);
    1:   lblValueF.Caption := FloatToStrF(Value * FForceSensor.LateralChannel.Factor, ffFixed, 4,3);
  end;
  DrawBars(Value);
  Application.ProcessMessages;
end;

end.
