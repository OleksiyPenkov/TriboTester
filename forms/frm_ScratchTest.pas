unit frm_ScratchTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, RzShellDialogs,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, RzStatus,
  RzPanel, Vcl.Mask, RzEdit, RzBtnEdt, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmScratchTest = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    RzPanel3: TRzPanel;
    edContactForce: TLabeledEdit;
    edDistance: TLabeledEdit;
    edMaxForce: TLabeledEdit;
    RzStatusBar1: TRzStatusBar;
    pnDepth: TRzStatusPane;
    pnForce: TRzStatusPane;
    Chart1: TChart;
    btnSave: TBitBtn;
    dlgSave: TSaveDialog;
    dlgFolder: TRzSelectFolderDialog;
    edSteps: TLabeledEdit;
    Force: TLineSeries;
    Friction: TLineSeries;
    TimePane: TRzStatusPane;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScratchTest: TfrmScratchTest;

implementation

{$R *.dfm}

uses unit_Globals, unit_Routines, unit_Helpers, unit_Const;

procedure TfrmScratchTest.btnSaveClick(Sender: TObject);
begin
  if dlgSave.Execute then
    ScratchToFile(dlgSave.FileName, HeaderScr);
end;

procedure TfrmScratchTest.btnStartClick(Sender: TObject);
var
  Conditions: TScratchConditions;
begin
  try
    btnStart.Enabled := False;
    btnStop.Enabled := True;
    btnSave.Enabled := False;

    with Conditions do
    begin
      ContactForce := StrToFloat(edContactForce.Text);
      MaxForce := StrToFloat(edMaxForce.Text);
      Steps := StrToInt(edSteps.Text);
      Distanse := StrToInt(edDistance.Text);

      Force.Clear;
      Friction.Clear;

      Chart1.Axes.Left.Minimum := 0;
      Chart1.Axes.Left.Maximum := MaxForce;

      Chart1.Axes.Bottom.Minimum := 0;
      Chart1.Axes.Bottom.Maximum := Distanse;

      Chart1.Update;
    end;

    ScratchTest(Conditions, Force, Friction, pnDepth, pnForce, TimePane);

  finally
    btnStart.Enabled := True;
    btnStop.Enabled := False;
    btnSave.Enabled := True;
   // HidePopup;
  end;
end;

procedure TfrmScratchTest.btnStopClick(Sender: TObject);
begin
  Terminate := True;
end;

procedure TfrmScratchTest.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := btnStart.Enabled;
end;

end.
