unit unit_DriverPZ;   // Newport AG-UC8

interface

uses
  CPort,
  CPortCtl,
  Vcl.StdCtrls,
  unit_Const,
  unit_CustomDriver;

type


  TDrivePZ = class(TCustomDrive)
    private


      procedure ProcessError(Value: string);

      procedure MyPortRxChar(Sender: TObject; Count: Integer); overload;
      procedure ProcessResponce; overload;
      procedure CalcPosition(Value: string); overload;

      procedure MoveZ(Steps: Integer);overload;
      procedure ZResetPos;overload;

      procedure Send(Str: string); overload;
    procedure ProcessStep(Value: string);
    procedure ProgramRestart;
    procedure ProgramRun;
    procedure ProgramStop;
    procedure ReadStep;
    public
      procedure InitPort(Conn, Tx, Rx: TComLed;
                         Lbl1, Lbl2, Lbl3: TLabel;
                         Address: string;
                         Baudrate:integer);override;

      procedure GetVersion; overload;
      procedure ZUp; overload;
      procedure ZDown; overload;
      procedure ZSpeed(speed: byte); overload;
      procedure ZHome; overload;
      procedure ZHomeAuto; overload;
      procedure ZShift(Steps: integer); overload;

      procedure XSpeed(speed: byte); overload;
      procedure XLeft; override;
      procedure XRight; override;
      procedure XHome; overload;
      procedure XPosition(Position: integer); overload;
      procedure XShift(Steps: integer); override;

      procedure Stop; override;
      procedure ReadPosition; overload;
      procedure ReadError; overload;
      procedure InitDrive;

  end;


var
  DrivePZ : TDrivePZ;


implementation

uses
  System.SysUtils,
  unit_Globals,
  unit_Config;

const
  CLRL = #13#10;

procedure TDrivePZ.MyPortRxChar(Sender: TObject; Count: Integer);
var
  S: string;
begin
  FPort.ReadStr(S, Count);
  FResponce := S;
  ProcessResponce;
end;

procedure TDrivePZ.ProcessError(Value: string);
var
  code: word;
  ErrorMessage: string;
  Axis: TAxis;
begin
  ErrorMessage := '';
end;

procedure TDrivePZ.ProcessResponce;

begin
  SetStatus(FResponce);
end;

procedure TDrivePZ.ProcessStep(Value: string);
begin
//
end;

procedure TDrivePZ.ProgramRestart;
begin
 //
end;

procedure TDrivePZ.ProgramRun;
begin
//
end;

procedure TDrivePZ.ProgramStop;
begin
 //
end;

procedure TDrivePZ.Send(Str: string);
begin
  FPort.WriteStr(Str + CLRL);
  Sleep(40);
end;

procedure TDrivePZ.Stop;
begin
  Send('1ST');
  Send('2ST');
end;


procedure TDrivePZ.XHome;
begin
  Send('HOM X');
end;

procedure TDrivePZ.XLeft;
begin
  if FConfig.Section<TStageXOptions>.Reverse then
    Send('1JA4')
  else
    Send('1JA-4');
end;

procedure TDrivePZ.XPosition(Position: integer);
begin

end;

procedure TDrivePZ.XRight;
begin
  if FConfig.Section<TStageXOptions>.Reverse then
    Send('1JA-4')
  else
    Send('1JA4');
end;

procedure TDrivePZ.XShift(Steps: integer);
begin
  Send('1PR' + IntToStr(Steps));
end;

procedure TDrivePZ.XSpeed(speed: byte);
begin

end;

procedure TDrivePZ.ZDown;
begin
  Send('2JA-1');
end;

procedure TDrivePZ.ZHome;
begin
  ZSpeed(3);
  ZUp;
  Sleep(2000);
  Stop;
  ZResetPos;
end;

procedure TDrivePZ.ZHomeAuto;
begin

end;

procedure TDrivePZ.ZResetPos;
begin

end;

procedure TDrivePZ.ZShift(Steps: integer);
begin
  Send('2PR' + IntToStr(Steps));
end;

procedure TDrivePZ.ZSpeed(speed: byte);
begin
  Send('SPD ,' + IntToStr(ZSpeeds[speed]));
end;

procedure TDrivePZ.ZUp;
begin
  Send('2JA-1');
end;

procedure TDrivePZ.CalcPosition(Value: string);
var
  p: Integer;
begin
  p := Pos(',', Value);

  XPosInt := StrToInt('$' + Copy(Value, 1, p - 1));

  XPos := XPosInt / 100;

  Delete(Value, 1, p);

  YPos := StrToInt('$' + Value)/200;
end;

procedure TDrivePZ.ReadError;
begin
  Send('TE');
end;

procedure TDrivePZ.ReadPosition;
begin

end;

procedure TDrivePZ.ReadStep;
begin

end;

procedure TDrivePZ.GetVersion;
begin
  Send('VE');
end;

procedure TDrivePZ.InitDrive;
begin
  Send('RS');
end;

procedure TDrivePZ.InitPort(Conn, Tx, Rx: TComLed; Lbl1, Lbl2, Lbl3: TLabel;
  Address: string; Baudrate: integer);
begin
  if not Assigned(FPort) then Exit;

  FPort.Port := Address;
  FPort.BaudRate := TBaudRate(Baudrate);
  FPort.StopBits := sbOneStopBit;
  FPort.DataBits := dbEight;
  FPort.Parity.Bits := prNone;
  FPort.Parity.Check := False;
  FPort.Parity.Replace := False;


  FPort.TriggersOnRxChar := True;

  FConLed := Conn;
  FConLed.ComPort := FPort;

  FTxLed := Tx;
  FTxLed.ComPort := FPort;

  FRxLed := Rx;
  FRxLed.ComPort := FPort;


  FStatus := Lbl1;
  FXError := Lbl2;
  FYError := Lbl3;


  FPort.OnRxChar := MyPortRxChar;

  try
    FPort.Connected := True;
  except

  end;

  if not FPort.Connected then Exit;

  GetVersion;
  ReadError;
  InitDrive;
end;

procedure TDrivePZ.MoveZ(Steps: Integer);
begin
  Send('2PR' + IntToStr(Steps));
end;

end.
