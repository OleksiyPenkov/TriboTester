unit frm_NiError;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel,
  CPortCtl;

type
  TfrmNiError = class(TForm)
    RzGroupBox1: TRzGroupBox;
    ErrorLabel: TLabel;
    RzGroupBox2: TRzGroupBox;
    lblDriveStatus: TLabel;
    rzgrpbx1: TRzGroupBox;
    cmldTx: TComLed;
    cmldRx: TComLed;
    cmldConn: TComLed;
    lblXError: TLabel;
    lblYError: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNiError: TfrmNiError;

implementation

{$R *.dfm}

uses unit_Config;

procedure TfrmNiError.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caMinimize;
end;

procedure TfrmNiError.FormCreate(Sender: TObject);
begin
  Top := FConfig.Section<TWindowsOptions>.STop;
  Left := FConfig.Section<TWindowsOptions>.SLeft;
end;

end.
