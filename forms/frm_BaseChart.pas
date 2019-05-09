unit frm_BaseChart;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, RzStatus, RzPanel, System.SysUtils;

type
  TBaseChart = class(TForm)
    Chart: TChart;
    Line: TLineSeries;
    Status: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    StatusX: TRzStatusPane;
    Status1: TRzStatusPane;
    StatusY: TRzStatusPane;
    Statu3: TRzStatusPane;
    StatusLast: TRzStatusPane;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    FXMin, FXMax, FYMin, FYMax: Double;

    procedure SetLastValue(const Value: Double);
    { Private declarations }
  public
    { Public declarations }
    property LastValue: Double write SetLastValue;
    procedure SetScale(const XMin, XMax, YMin, YMax: Double);
    procedure ResetScale;
  end;

implementation

{$R *.dfm}

procedure TBaseChart.ChartMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  xv, yv: single;
begin
  xv := Line.XScreenToValue(X);
  yv := Line.YScreenToValue(Y);

  StatusX.Caption := FloatToStrF(xv, ffFixed, 4, 3);
  StatusY.Caption := FloatToStrF(yv, ffFixed, 4, 3);
end;

procedure TBaseChart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caMinimize;
end;

procedure TBaseChart.ResetScale;
begin
  Line.Clear;

  Chart.BottomAxis.Maximum := FXMax;
  Chart.BottomAxis.Minimum := FXMin;
  Chart.BottomAxis.Increment := 1;

  Chart.LeftAxis.Minimum := FYMin;
  Chart.LeftAxis.Maximum := FYMax;

end;

procedure TBaseChart.SetScale(const XMin, XMax, YMin, YMax: Double);
begin
  FXMin := XMin;
  FXMax := XMax;
  FYMin := YMin;
  FYMax := YMax;

  ResetScale;
end;

procedure TBaseChart.SetLastValue(const Value: Double);
begin
  StatusLast.Caption := FloatToStrF(Value, ffFixed, 4, 3);
  StatusLast.Repaint;
end;

end.
