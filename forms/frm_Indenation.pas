unit frm_Indenation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  Vcl.Buttons, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart,
  RzPanel, Vcl.ExtCtrls, RzStatus, Vcl.Mask, RzEdit, RzBtnEdt, RzShellDialogs;

type
  TfrmIndentation = class(TForm)
    RzPanel1: TRzPanel;
    RzStatusBar1: TRzStatusBar;
    Chart1: TChart;
    btnSave: TBitBtn;
    Line: TPointSeries;
    pnDepth: TRzStatusPane;
    pnForce: TRzStatusPane;
    dlgSave: TSaveDialog;
    RzPanel2: TRzPanel;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    RzPanel3: TRzPanel;
    edContactForce: TLabeledEdit;
    edStep: TLabeledEdit;
    edMaxDepth: TLabeledEdit;
    edMaxForce: TLabeledEdit;
    rgMode: TRadioGroup;
    pnlMulti: TRzPanel;
    edPoints: TLabeledEdit;
    edSaveN: TLabeledEdit;
    edPath: TRzButtonEdit;
    Label1: TLabel;
    pnlXShift: TRzPanel;
    edXShift: TLabeledEdit;
    dlgFolder: TRzSelectFolderDialog;
    procedure btnStopClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure rgModeClick(Sender: TObject);
    procedure edPathButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndentation: TfrmIndentation;

implementation

uses
  unit_Routines,
  unit_Globals,
  unit_Helpers, unit_Const;

{$R *.dfm}

procedure TfrmIndentation.btnStopClick(Sender: TObject);
begin
  Terminate := True;
end;

procedure TfrmIndentation.edPathButtonClick(Sender: TObject);
begin
  if dlgFolder.Execute then
    edPath.Text := dlgFolder.SelectedPathName;
end;

procedure TfrmIndentation.rgModeClick(Sender: TObject);
begin
  case rgMode.ItemIndex of
    0: begin
         pnlMulti.Enabled := False;
         pnlXShift.Enabled := False;
       end;
    1: begin
         pnlMulti.Enabled := True;
         pnlXShift.Enabled := False;
       end;
    2: begin
         pnlMulti.Enabled := True;
         pnlXShift.Enabled := True;
       end;
  end;
end;

procedure TfrmIndentation.btnSaveClick(Sender: TObject);
begin
  if dlgSave.Execute then
    IndentationToFile(dlgSave.FileName, Header);
end;

procedure TfrmIndentation.btnStartClick(Sender: TObject);
var
  Conditions: TIndentationConditions;
begin
  try
    btnStart.Enabled := False;
    btnStop.Enabled := True;
    btnSave.Enabled := False;

    with Conditions do
    begin
      ContactForce := StrToFloat(edContactForce.Text);
      MaxDepth := StrToFloat(edMaxDepth.Text);
      MaxForce := StrToFloat(edMaxForce.Text);
      Step := StrToFloat(edStep.Text);
      XShift := StrToInt(edXShift.Text);
      Folder := edPath.Text;
      N := StrToInt(edPoints.Text);
      SaveN := StrToInt(edSaveN.Text);
    end;

    case rgMode.ItemIndex of
      0: Indentation(Conditions, Line, pnDepth, pnForce);
      1: begin
           Conditions.XShift := 0;
           MultiIndentation(Conditions, Line, pnDepth, pnForce);
      end;
      2: MultiIndentation(Conditions, Line, pnDepth, pnForce);
    end;

  finally
    btnStart.Enabled := True;
    btnStop.Enabled := False;
    btnSave.Enabled := True;
   // HidePopup;
  end;
end;

end.
