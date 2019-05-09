unit frm_CalibrationD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, unit_ForceSensor,
  RzBorder, RzRadGrp, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, unit_CustomDriver, unit_Globals, unit_Helpers;


type
  TfrmCalibrationD = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    btnClose: TButton;
    rzSignalPos: TRzMeter;
    RzGroupBox1: TRzGroupBox;
    lblValue: TLabel;
    Label1: TLabel;
    RzGroupBox4: TRzGroupBox;
    Chart: TChart;
    Series: TPointSeries;
    Line: TLineSeries;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblValueF: TLabel;
    lblUnit: TLabel;
    lblB: TLabel;
    lblStepsUnit: TLabel;
    btnCont: TButton;
    btnStop: TButton;
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnContClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FForceSensor: TForceSensor;
    FMax: double;

    Value: double;

    FDoStop: Boolean;

    procedure DrawBars(Value: double);
    procedure Interpol;

    { Private declarations }
  public
    { Public declarations }
    property Sensor: TForceSensor  read FForceSensor write FForceSensor;
  end;

var
  frmCalibrationD: TfrmCalibrationD;

implementation

{$R *.dfm}



procedure TfrmCalibrationD.btnCalcClick(Sender: TObject);
begin
  Interpol;
end;

procedure TfrmCalibrationD.btnCloseClick(Sender: TObject);
begin
  btnStopClick(Sender);
  Close;
end;

procedure TfrmCalibrationD.btnContClick(Sender: TObject);
const
  Step = 100;
var
  X: Integer;
begin
  btnCont.Enabled := False;
  btnStop.Enabled := True;

  FForceSensor.CreateSingleForceTask(FForceSensor.NormalChannel, True);

  Value := Abs(FForceSensor.GetNormalizedValue(50));
  X := 0;
  Series.Clear;


  FDoStop := False;


  while Value <= 3 do
  begin
    Drive.ZShift(Step);
    inc(X, Step);

    Value := Abs(FForceSensor.GetNormalizedValue(50));

    if Value > 0.1 then Series.AddXY(X, Value);
    DrawBars(Value);
    lblValue.Caption := IntToStr(X);
    lblValueF.Caption := FloatToStrF(Value, ffFixed, 4,3);


    Application.ProcessMessages;

    if FDoStop then Break;
  end;


  FForceSensor.StopSingleFroceTask;
  Drive.ZShift(Round(-1.1 * X));
  Interpol;

  btnCont.Enabled := True;
  btnStop.Enabled := False;
end;

procedure TfrmCalibrationD.btnStopClick(Sender: TObject);
begin
  FForceSensor.StopSingleFroceTask;
  btnCont.Enabled := True;
  btnStop.Enabled := False;
  FDoStop := True;
end;

procedure TfrmCalibrationD.DrawBars(Value: double);
begin
  rzSignalPos.Value := Round(Value / FMax * 100);
end;

procedure TfrmCalibrationD.FormCreate(Sender: TObject);
begin
  FMax := 5;
  rzSignalPos.Value := 0;


  Series.AddXY(0,0);
  Series.AddXY(0.5, 1);
  Series.AddXY(0.99, 2);
  Series.AddXY(2.05, 4);
  Series.AddXY(3.95, 8);

end;

procedure TfrmCalibrationD.FormShow(Sender: TObject);
begin
  lblUnit.Caption := '(' + ForceUnit + ')';
  lblStepsUnit.Caption := '(Steps/' + ForceUnit + ')';
end;

procedure TfrmCalibrationD.Interpol;
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

  Stiffness := 1 / a;
  lblB.Caption := FloatToStrF(Stiffness, ffFixed, 10,1);

  Line.Clear;

  Line.AddXY(Series.XValues[0], b + a * Series.XValues[0]);
  Line.AddXY(Series.XValues[N - 1], b + a * Series.XValues[N - 1]);


end;

end.
