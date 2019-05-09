unit unit_CustomDriver;

interface

uses
  Classes,
  CPort,
  CPortCtl,
  Vcl.StdCtrls,
  unit_Const;

type

  TAxis = (X, Z);

  TCommand = record
    Com: string[3];
    Axis: TAxis;
    Data: Byte;
  end;


  TCustomDrive = class(TComponent)
    private
      FRealNumberOfCucles: Integer;


      procedure ProcessError(Value: string);
      procedure ProcessStep(Value: string);

      procedure MyPortRxChar(Sender: TObject; Count: Integer);
      procedure ProcessResponce;
      procedure CalcPosition(Value: string);

      procedure ZResetPos;

      procedure WriteReg(Axis: TAxis; Reg, Value: integer);
      procedure Send(Str: string);

    published
      FPort : TComPort;
      FTxLed : TComLed;
      FConLed : TComLed;
      FRxLed : TComLed;

      FStatus, FXError, FYError: TLabel;
    public
      FResponce: string;



      XPos, YPos: Double;

      XPosInt: Integer;

      constructor Create;
      destructor Free;

      procedure InitPort(Conn, Tx, Rx: TComLed;
                         Lbl1, Lbl2, Lbl3: TLabel;
                         Address: string;
                         Baudrate:integer); virtual;

      procedure InitControllerX(SkipProgram: boolean);
      procedure InitControllerZ;

      procedure GetVersion;
      procedure ZUp;
      procedure ZDown;
      procedure ZSpeed(speed: byte);
      procedure ZSpeedD(speed: Integer);
      procedure ZHome;
      procedure ZHomeAuto;
      procedure ZShift(Steps: integer);
      procedure ZStop;

      procedure XSpeed(speed: byte);
      procedure XLeft; virtual;
      procedure XRight; virtual;
      procedure XHome;
      procedure XPosition(Position: integer);
      procedure XShift(Steps: integer); virtual;

      procedure Stop;virtual;
      procedure ReadPosition;
      procedure ReadError;
      procedure ReadStep;

      procedure ContProgSet(const AStroke, ASpeed: double);
      procedure CycleProgSet(const N: Integer; const AStroke, ASpeed: double);

      procedure ProgramRun;
      procedure ProgramStop;
      procedure ProgramStep(Step : Integer = $00);
      procedure ProgramRestart;

      procedure Reset;
      procedure ProgramErase;
      procedure SetXSate(Value: string);
      procedure SetYSate(Value: string);
      procedure SetStatus(Value:string);

      property CyclesPassed : Integer read FRealNumberOfCucles;
  end;



implementation

uses
  System.SysUtils,
  unit_Globals,
  unit_Config;

const
  CLRL = #13;

{ TCustomDrive }

procedure TCustomDrive.CalcPosition(Value: string);
var
  p: Integer;
begin
  p := Pos(',', Value);

  XPosInt := StrToInt('$' + Copy(Value, 1, p - 1));

  XPos := XPosInt / 100;

  Delete(Value, 1, p);

  YPos := StrToInt('$' + Value)/200;
end;

procedure TCustomDrive.CycleProgSet(const N: Integer; const AStroke,
  ASpeed: double);
const

  Delay = 10;

var
  Stroke, Speed, Dec, Acc: Integer;
  N1, N2, N3: byte;
begin
  Send('RST');
  Sleep(100);

  Stroke := Round(AStroke * FConfig.Section<TStageXOptions>.StrokeScale);
  Speed := Round(ASpeed * FConfig.Section<TStageXOptions>.SpeedScale); // old value 50
  Acc := Round(Speed * 0.25);
  if Acc > FConfig.Section<TStageXOptions>.AccelerationRate then Acc := FConfig.Section<TStageXOptions>.AccelerationRate;
  Dec := Acc div 4;

  N1 :=0; N2 := 0; N3 := 0;

  if N >= 65535 then
  begin
    N1 := N div 65535;
    N2 := 255;
    N3 := 255;

    FRealNumberOfCucles := N1 * N2 * N3;
  end;

  if (N > 255) and (N < 65535) then
  begin
    N1 := 1;
    N2 := N div 255;
    N3 := 255;

    FRealNumberOfCucles := N2 * N3;
  end;

  if (N < 255) then
  begin
    N1 := 1;
    N2 := 1;
    N3 := N;

    FRealNumberOfCucles := N3;
  end ;

  ProgramErase;
 // program

  WriteReg(X, $00, $0000);   //
  WriteReg(X, $01, $C600 + N1); // cycle 1

  WriteReg(X, $02, $0000);   //
  WriteReg(X, $03, $C600 + N2); // cycle 2

  WriteReg(X, $04, $0000);   //
  WriteReg(X, $05, $C600 + N3); // cycle 3

  if Stroke > 0 then
  begin
      WriteReg(X, $06, Stroke);   //
      WriteReg(X, $07, $0600);   // Stroke +

      WriteReg(X, $08, Delay);   // delay
      WriteReg(X, $09, $C800);

      WriteReg(X, $0A, -Stroke);  // stroke -
      WriteReg(X, $0B, $06FF);
  end
  else begin
      WriteReg(X, $06, Stroke);   //
      WriteReg(X, $07, $06FF);   // Stroke +

      WriteReg(X, $08, Delay);   // delay
      WriteReg(X, $09, $C800);

      WriteReg(X, $0A, -Stroke);  // stroke -
      WriteReg(X, $0B, $0600);
  end;

  WriteReg(X, $0C, Delay);   // delay
  WriteReg(X, $0D, $C800);

  WriteReg(X, $0E, $0000);   // cycle 3
  WriteReg(X, $0F, $C700);

  WriteReg(X, $10, $0000);   // cycle 2
  WriteReg(X, $11, $C700);

  WriteReg(X, $12, $0000);   // cycle 1
  WriteReg(X, $13, $C700);

  WriteReg(X, $14, $0000);   // END
  WriteReg(X, $15, $DF00);


  WriteReg(X,$E7, Acc);  // acel
  WriteReg(X,$E8, Acc);  // acel
  WriteReg(X,$E9, Dec);  // decel
  WriteReg(X,$EE, Speed); // speed 4
end;

procedure TCustomDrive.ContProgSet(const AStroke, ASpeed: double);
const

  Delay = 10;

var
  Stroke, Speed, Dec: Integer;
begin
  Send('RST');
  Sleep(100);

  Stroke := Round(AStroke * FConfig.Section<TStageXOptions>.StrokeScale);
  Speed := Round(ASpeed * FConfig.Section<TStageXOptions>.SpeedScale);
  Dec :=  Round(Speed * 0.25);

  ProgramErase;

  // program

  WriteReg(X, $00, Stroke);   // +
  WriteReg(X, $04, -Stroke); // -

  WriteReg(X,$00, Stroke);   // stroke +
  WriteReg(X,$01, $0600);

  WriteReg(X,$02, Delay);   // delay
  WriteReg(X,$03, $C800);

  WriteReg(X,$04, -Stroke);  // stroke -
  WriteReg(X,$05, $06FF);

  WriteReg(X,$06, Delay);   // delay
  WriteReg(X,$07, $C800);

  WriteReg(X,$08, $0000);
  WriteReg(X,$09, $C500);   // go to 0

  WriteReg(X, $0A, $0000);   // END
  WriteReg(X, $0B, $DF00);

  WriteReg(X,$E7, Dec);  // acel
  WriteReg(X,$E8, Dec);  // acel
  WriteReg(X,$E9, Dec);  // decel
end;

constructor TCustomDrive.Create;
begin
  FPort := TComPort.Create(Nil);
  inherited Create(Nil);
end;

destructor TCustomDrive.Free;
begin
  FPort.Close;
  FreeAndNil(FPort);
  inherited Free;
end;

procedure TCustomDrive.GetVersion;
begin
  Send('VER');
end;

procedure TCustomDrive.InitControllerX(SkipProgram: boolean);
begin

  // initial program upload
  if not SkipProgram then ContProgSet(2, 2);

  //speed initialisation X
  WriteReg(X,$E6, FConfig.Section<TStageXOptions>.SpeedMultiplayer);
  WriteReg(X,$E8, FConfig.Section<TStageXOptions>.AccelerationRate);
  WriteReg(X,$E9, FConfig.Section<TStageXOptions>.DecelerationRate);
  WriteReg(X,$EA, FConfig.Section<TStageXOptions>.StartSpeed); // Start speed
  WriteReg(X,$EB, FConfig.Section<TStageXOptions>.DriveSpeed1); // speed 1
  WriteReg(X,$EC, FConfig.Section<TStageXOptions>.DriveSpeed2);
  WriteReg(X,$ED, FConfig.Section<TStageXOptions>.DriveSpeed3);
  WriteReg(X,$EE, FConfig.Section<TStageXOptions>.DriveSpeed4); // speed 4
  WriteReg(X,$F0, FConfig.Section<TStageXOptions>.HomeLow);
  WriteReg(X,$EF, FConfig.Section<TStageXOptions>.HomeHigh);
end;

procedure TCustomDrive.InitControllerZ;
begin
  //speed initialisation Z
  WriteReg(Z,$E6, FConfig.Section<TStageZOptions>.SpeedMultiplayer);
  WriteReg(Z,$E8, FConfig.Section<TStageZOptions>.AccelerationRate);
  WriteReg(Z,$E9, FConfig.Section<TStageZOptions>.DecelerationRate);
  WriteReg(Z,$EA, FConfig.Section<TStageZOptions>.StartSpeed);
  WriteReg(Z,$EB, FConfig.Section<TStageZOptions>.DriveSpeed1);
  WriteReg(Z,$EC, FConfig.Section<TStageZOptions>.DriveSpeed2);
  WriteReg(Z,$ED, FConfig.Section<TStageZOptions>.DriveSpeed3);
  WriteReg(Z,$EE, FConfig.Section<TStageZOptions>.DriveSpeed4);
  WriteReg(Z,$F0, FConfig.Section<TStageZOptions>.HomeLow);
  WriteReg(Z,$EF, FConfig.Section<TStageZOptions>.HomeHigh);
end;

procedure TCustomDrive.InitPort;
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
  InitControllerX(True);
  InitControllerZ;
end;


procedure TCustomDrive.MyPortRxChar(Sender: TObject; Count: Integer);
var
  S: string;
begin
  FPort.ReadStr(S, Count);
  FResponce := S;
  ProcessResponce;
end;

procedure TCustomDrive.ProcessError(Value: string);
var
  code: word;
  ErrorMessage: string;
  Axis: TAxis;
begin
  ErrorMessage := '';

  if Value[1] = 'X' then
    Axis :=X
  else
    Axis := Z;

  Delete(Value, 1, 1);
  Code := Hi(StrToInt64('$' + trim(Value)));

  case Code of
    08: ErrorMessage := 'Software Limit + Error';
    09: ErrorMessage := 'Software Limit - Error';
    10: ErrorMessage := 'Hardware Limit + Error';
    11: ErrorMessage := 'Hardware Limit - Error';
    12: ErrorMessage := 'Alarm Error';
    13: ErrorMessage := 'EMG Error';
    14: ErrorMessage := 'Program Error';
    15: ErrorMessage := 'Home Error';
  end;

  case Axis of
    X: SetXSate(ErrorMessage);
    Z: SetYSate(ErrorMessage);
  end;

end;

procedure TCustomDrive.ProcessResponce;
const
  Keys : array [1..6] of string[3] = ('VER', 'SPD', 'PRG', 'POS', 'IDC', 'ERD');

var
  Key, Str, SubStr: string;
  p: Integer;

  function KeyID(const Key: string): Integer; inline;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 1 to 6 do
      if Key = Keys[i] then
      begin
        Result := i;
        Break;
      end;
  end;

begin
  Str := FResponce;

  while Str <> '' do
  begin
    p := Pos(CLRL, Str);
    if p = 0 then p := Length(Str);

    SubStr := Copy(Str, 1, P - 1);
    Delete(Str, 1, P);

    Key := Copy(SubStr, 1, 3);
    Delete(SubStr, 1, 4);

    case KeyID(Key) of
      1: SetStatus(SubStr);
      4: CalcPosition(SubStr);
      5: ProcessStep(SubStr);
      6: ProcessError(SubStr);
    end;
  end;

end;

procedure TCustomDrive.ProcessStep(Value: string);
begin
  Delete(Value, 1, 1);
  CurrentProgramStep := StrToInt64(trim(Value));
end;

procedure TCustomDrive.ProgramErase;
var
  i: Integer;
begin
  for I := $00 to $7F do
    WriteReg(X, i, $FFFF);
  Sleep(100);
end;

procedure TCustomDrive.ProgramRestart;
begin
  Send('PRS X');
end;

procedure TCustomDrive.ProgramRun;
begin
  Send('PRG X00');
end;

procedure TCustomDrive.ProgramStep(Step : Integer = $00);
begin
  Send('PST X ' + IntToStr(Step));
end;

procedure TCustomDrive.ProgramStop;
begin
  Send('PSP X');
end;

procedure TCustomDrive.ReadError;
begin
  Send('ERD X');
  Send('ERD Y');
end;

procedure TCustomDrive.ReadPosition;
begin
  Send('POS');
  Sleep(100);
end;

procedure TCustomDrive.ReadStep;
begin
  Send('IDC X');
  Sleep(100);
end;

procedure TCustomDrive.Reset;
begin
  Send('RST');
end;

procedure TCustomDrive.Send(Str: string);
begin
  FPort.WriteStr(Str + CLRL);
  Sleep(40);
end;

procedure TCustomDrive.SetStatus(Value: string);
begin
  FStatus.Caption := Value;
end;

procedure TCustomDrive.SetXSate(Value: string);
begin
   FXError.Caption := Value;
end;

procedure TCustomDrive.SetYSate(Value: string);
begin
   FYError.Caption := Value;
end;


procedure TCustomDrive.Stop;
begin
  Send('STO XY');
end;

procedure TCustomDrive.WriteReg(Axis: TAxis; Reg, Value: integer);
var
  Str: string;
  Vs: string;
begin
  case Axis of
    X: Str := 'IHS X';
    Z: Str := 'IHS Y';
  end;
  if Value >= 0 then  Vs := IntToHex(Value, 4)
  else
  begin
    Vs := IntToHex(Value, 1);
    Delete(Vs, 1, 4);
  end;


  Send(Str + IntToHex(Reg, 4) + ',' + Vs);

end;

procedure TCustomDrive.XHome;
begin
  Send('HOM X');
end;

procedure TCustomDrive.XLeft;
begin
  if FConfig.Section<TStageXOptions>.Reverse then
    Send('JOG X')
  else
    Send('JOG -X');
end;

procedure TCustomDrive.XPosition(Position: integer);
begin
  Send('PAB ' + IntToStr(Position) + ',');
end;

procedure TCustomDrive.XRight;
begin
  if FConfig.Section<TStageXOptions>.Reverse then
    Send('JOG -X')
  else
    Send('JOG X');
end;

procedure TCustomDrive.XShift(Steps: integer);
begin
  Send('PIC ' + IntToStr(Steps) + ',');
end;

procedure TCustomDrive.XSpeed(speed: byte);
begin
  Send('SPD ' + IntToStr(XSpeeds[speed]) + ',');
end;

procedure TCustomDrive.ZDown;
begin
  if FConfig.Section<TStageZOptions>.Reverse then
    Send('JOG -Y')
  else
    Send('JOG Y');
end;

procedure TCustomDrive.ZHome;
begin
  ZSpeed(4);
  ZUp;
  Sleep(1000);
  Stop;
  ZResetPos;
end;

procedure TCustomDrive.ZHomeAuto;
begin
  Send('HOM Y');
end;

procedure TCustomDrive.ZResetPos;
begin
  Send('CLL Y');
end;

procedure TCustomDrive.ZShift(Steps: integer);
begin
  if FConfig.Section<TStageZOptions>.Reverse then
    Send('PIC ,' + IntToStr(-Steps))
  else
    Send('PIC ,' + IntToStr(Steps));
end;

procedure TCustomDrive.ZSpeed(speed: byte);
begin
    Send('SPD ,' + IntToStr(ZSpeeds[speed]));
end;

procedure TCustomDrive.ZSpeedD(speed: Integer);
begin
  Send('SPD ,' + IntToStr(speed));
end;

procedure TCustomDrive.ZStop;
begin
  Send('STO Y');
end;

procedure TCustomDrive.ZUp;
begin
  if FConfig.Section<TStageZOptions>.Reverse then
    Send('JOG Y')
  else
    Send('JOG -Y');
end;

end.
