unit frm_StaticLoading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  RzPanel, RzLabel;

type
  TfrmStaticLoading = class(TForm)
    RzPanel2: TRzPanel;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    RzPanel3: TRzPanel;
    edContactForce: TLabeledEdit;
    edMaxForce: TLabeledEdit;
    lblForce: TRzLabel;
    btnUnload: TBitBtn;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnUnloadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStaticLoading: TfrmStaticLoading;

implementation

{$R *.dfm}

uses unit_Routines, unit_Globals;

procedure TfrmStaticLoading.btnStartClick(Sender: TObject);
var
  Conditions: TStaticConditions;
begin
  try
    btnStart.Enabled := False;
    btnStop.Enabled := True;
    btnUnload.Enabled := False;


    with Conditions do
    begin
      ContactForce := StrToFloat(edContactForce.Text);
      MaxForce := StrToFloat(edMaxForce.Text);
    end;

    StaticLoading(Conditions, lblForce);

  finally
    btnStart.Enabled := True;
    btnStop.Enabled := False;
    btnUnload.Enabled := True;
   // HidePopup;
  end;
end;

procedure TfrmStaticLoading.btnStopClick(Sender: TObject);
begin
  Terminate := True;
end;

procedure TfrmStaticLoading.btnUnloadClick(Sender: TObject);
begin
  Unloading;
  lblForce.Caption := '0.00 mN';
end;

end.
