unit frm_TestConditions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzBtnEdt, Vcl.ExtCtrls, RzPanel, unit_Globals, RzRadGrp, unit_Helpers;

type
  TfrmTestConditions = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    btnSave: TButton;
    Button1: TButton;
    dlgSave: TSaveDialog;
    RzGroupBox1: TRzGroupBox;
    edFileName: TRzButtonEdit;
    Label2: TLabel;
    rgMode: TRzRadioGroup;
    bxTime: TRzGroupBox;
    Label1: TLabel;
    edTestDuration: TRzNumericEdit;
    bxCycles: TRzGroupBox;
    Label3: TLabel;
    edCycles: TRzNumericEdit;
    bxCommon: TRzGroupBox;
    edStroke: TRzNumericEdit;
    Label4: TLabel;
    edSpeed: TRzNumericEdit;
    Label5: TLabel;
    edSamplingRate: TRzNumericEdit;
    Label6: TLabel;
    edLoad: TRzNumericEdit;
    lblForce: TLabel;
    mmComment: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    edInterval: TRzNumericEdit;
    rzLoadMode: TRzRadioGroup;
    cbFeedback: TCheckBox;
    bntSaveAndRun: TButton;
    procedure edFileNameButtonClick(Sender: TObject);
    procedure rgModeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bntSaveAndRunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Run : boolean;

    procedure ShowConditions( DeadWeight: boolean; var Conditions: TTestConditions);

  end;

var
  frmTestConditions: TfrmTestConditions;

implementation

{$R *.dfm}

procedure TfrmTestConditions.bntSaveAndRunClick(Sender: TObject);
begin
  Run := True;
  ModalResult := mrOk;
end;

procedure TfrmTestConditions.edFileNameButtonClick(Sender: TObject);
begin
  if dlgSave.Execute then
  begin
    edFileName.Text := dlgSave.FileName;
  end;
end;

procedure TfrmTestConditions.FormShow(Sender: TObject);
begin
  lblForce.Caption := 'Normal force (' + ForceUnit + ')';
end;

procedure TfrmTestConditions.rgModeClick(Sender: TObject);
begin
  bxTime.Enabled   := (rgMode.ItemIndex = 0);
  bxCycles.Enabled := (rgMode.ItemIndex >= 1);
end;

procedure TfrmTestConditions.ShowConditions;
begin
  Run := False;

  if DeadWeight then
  begin
    rzLoadMode.Enabled := False;
  end;


  edFileName.Text := Conditions.FileName;
  edTestDuration.IntValue := Round(Conditions.Duration / 60);
  rgMode.ItemIndex := Ord(Conditions.Mode);

  edInterval.IntValue := Conditions.ObservationInterval;
  edCycles.IntValue := Conditions.NumberOfCycles;
  edSpeed.Value := Conditions.Speed;
  edStroke.Value := Conditions.Stroke;
  edSamplingRate.IntValue := Conditions.SamplingRate;
  edLoad.Value := Conditions.Load;
  mmComment.Text := Conditions.Comment;
  rzLoadMode.ItemIndex := Ord(Conditions.LoadMode);
  cbFeedback.Checked := Conditions.UseFeedback;


  if (ShowModal = mrOk) then
  begin
    Conditions.FileName := edFileName.Text;
    Conditions.Duration := edTestDuration.IntValue * 60;

    Conditions.ObservationInterval := edInterval.IntValue;
    Conditions.NumberOfCycles := edCycles.IntValue;
    Conditions.Mode := TTestMode(rgMode.ItemIndex);
    Conditions.Speed := edSpeed.Value;
    Conditions.Stroke := edStroke.Value;
    Conditions.SamplingRate := edSamplingRate.IntValue;
    Conditions.Load := edLoad.Value;
    Conditions.Comment := mmComment.Text;
    Conditions.LoadMode := TLoadMode(rzLoadMode.ItemIndex);
    Conditions.UseFeedback := cbFeedback.Checked;
  end;
end;

end.
