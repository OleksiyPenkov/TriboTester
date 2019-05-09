unit unit_ForceSensor;

interface

uses
  Classes,
  Graphics,
  SysUtils,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  Vcl.ExtCtrls,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  Vcl.Controls,
  Vcl.StdCtrls,
  unit_Globals,

  unit_Const, unit_Helpers;

type

  TForceSensor = class (TObject)
    private

      FLabel: TLabel;
      FFileName: string;

      function IsError:boolean;
      function CreateChannel(Channel: TChannelRecord;
                             CreateCallback: boolean;
                             const ATaskHandle: Longint;
                             const ASamplingMode: Longint;
                             SetZero: Boolean = True): Boolean;
    public
      LateralChannel :  TChannelRecord ;
      NormalChannel :  TChannelRecord ;

      constructor Create;
      procedure Init(ALLine, ANLine, AFLine: TLineSeries;
                     ALDraw, ANDraw, AFDraw: Boolean;
                     ALog: TMemo; AError: TLabel);
      destructor Free;

      procedure CreateFrictionTask;
      function StartFrictionTask(AOffset: double; dummy: boolean):Boolean;
      procedure StopFrictionTask(dummy: Boolean = False);
      procedure PauseFrictionTask;
      procedure ContinueFrictionTask;

      function CreateScratchingTask:boolean;
      procedure StopScratchingTask;

      function CreateSingleForceTask(Channel: TChannelRecord; SetZero: Boolean = True):boolean;
      procedure StopSingleFroceTask;

      procedure CreateOutFile;
      procedure CloseOutFile;

      function GetNormalizedValue(count: Integer = 50): Double;
      function GetNormalForceValue(count: Integer = 10): Double;
      procedure GetScratchValies(var N,L: Double);
      property FileName:string read FFileName write FFileName;
  end;

  procedure Plot;


var
  ForceSensor: TForceSensor; // global object

implementation

uses
  NIDAQmxCAPI_TLB,
  {$IFDEF WIN64}
    nidaqmx64,
  {$ELSE}
    nidaqmx,
  {$ENDIF}
  System.DateUtils,
  frm_Main,
  frm_BaseChart;

var
  FrictionTaskHandle : LongInt;
  ScratchTaskHandle : LongInt;
  SingleForceHandle: LongInt;


  UseFeedback: boolean;

  NOffset: Double;
  FactorL, FactorN: Double;
  AmpL, AmpN: Integer;



  Lines: array [1..3] of record
           Series: TLineSeries;
           Draw: Boolean;
         end;

  DAQmxError: integer;

  DataDrawn: integer;
  TotalDataRead: UInt64;
  TotalDataWrite: UInt64;
  LastZero: UInt64;
  PlotRepaint: LongInt;
  FeedbackCount: Longint;
  LoadAveraged: double;

  AvgL, AvgN: Double;
  AvgCount: Integer;

  LoadMode : TLoadMode;
  TargetForce: Double;
  ZeroPassed : boolean;

  Counter: array [0 .. 4] of Double;
  CounterIndex: Byte;

  DataValuesL: array [0..PlotSize - 1] of Double;
  DataValuesN: array [0..PlotSize - 1] of Double;
  DataValuesF: array [0..PlotSize - 1] of Double;

{CallBack functions}

function EveryNCallbackFriction(ATaskHandle: Integer;
                                everyNsamplesEventType, nSamples: longint;
                                callbackData: Pointer): longint; export;  stdcall;
var
  read: LongInt;
  i: Integer;
  Data: array [0 .. 2 * ReadDataSize] of Double;
  LValue, NValue, LastValue: double;

  DeltaForce: double;
  Shift: integer;



begin

  DAQmxError := DAQmxReadAnalogF64(FrictionTaskHandle,
                                   ReadDataSize div 2,
                                   -1 ,
                                   DAQmx_Val_GroupByChannel,
                                   @data,
                                   2 * ReadDataSize,
                                   @read,
                                   NIL);

  if DataDrawn >= PlotSize then
  begin
    for I := 0 to PlotSize - 1 do
    begin
      DataValuesL[i] := DataValuesL[i + 1];
      DataValuesN[i] := DataValuesN[i + 1];
      DataValuesF[i] := DataValuesF[i + 1];
    end;
    DataDrawn := PlotSize - 1;
  end;

  if CounterIndex > 4 then
  begin
    for I := 0 to 3 do
      Counter[i] := Counter [i + 1];
    CounterIndex := 3;
  end;


  for I := 0 to read - 1 do
  begin
    LValue := data[i] * FactorL * AmpL;
    if UseDeadWeight then
      NValue := TargetForce
    else
      NValue := data[i + read] * FactorN * AmpN + NOffset;

    AvgL := AvgL + LValue;
    AvgN := AvgN + NValue;
    inc(AvgCount);

    if AvgCount = SamplingRate then
    begin

      if LoadMode = lmForce then
        AvgN := AvgN / AvgCount
      else
        AvgN := TargetForce;

      AvgL := AvgL / AvgCount;

      Writeln(OutDataFile, Format('%d%s%4.2f%s%4.2f',[TotalDataWrite, #9, AvgN , #9, AvgL]));

      DataValuesL[DataDrawn] := AvgL;
      DataValuesN[DataDrawn] := AvgN;

      Counter[CounterIndex]  := AvgL;
      Inc(CounterIndex);

      if AvgN <> 0 then
        DataValuesF[DataDrawn] := Abs(AvgL/AvgN)
      else
        DataValuesF[DataDrawn] := 0;

      inc(DataDrawn);
      Inc(PlotRepaint);
      inc(TotalDataWrite);

      if (TotalDataWrite - LastZero > 8) and
          ((Counter[0] < 0) and
          (Counter[1] < 0) and
          (Counter[3] > 0) and
          (Counter[4] > 0))
       then
       begin
         Inc(CyclesPassed);
         LastZero := TotalDataWrite - 3;
         ZeroPassed :=  True;
       end
       else begin
         LoadAveraged := LoadAveraged + AvgN;
         Inc(FeedbackCount);
         ZeroPassed := False;
       end;

      AvgL := 0;
      AvgN := 0;
      AvgCount := 0;
    end;
  end;
  Inc(TotalDataRead, read);


  if UseFeedback and (FeedbackCount = 10) then
  begin

    DeltaForce := TargetForce - LoadAveraged / (FeedbackCount);
    Shift := round(DeltaForce * SpringStifness);
    if not ZeroPassed then Drive.ZShift(Shift);

    FeedbackCount := 0;
    LoadAveraged := 0;
  end;


  if PlotRepaint > 10 then
  begin
    Plot;
    PlotRepaint := 0;
  end;

  Result := 0;
end;

function DoneCallback(ATaskHandle: Integer; status: int32;
  callbackData: Pointer): int32;  export;  stdcall;
begin
  Result := 0;
end;

procedure Plot;
var
  i, j: Integer;
  LastValue: Double;
begin
  for j := 1 to 3 do
  begin
    if not Lines[j].Draw then Continue;

    Lines[j].Series.Active := False;
    Lines[j].Series.Clear;

    for I := 1 to PlotSize - 1 do
    begin
      case j of
        1: Lines[j].Series.AddY(DataValuesF[i]);
        2: Lines[j].Series.AddY(DataValuesL[i]);
        3: Lines[j].Series.AddY(DataValuesN[i]);
      end;
    end;

    case j of
      1: LastValue := DataValuesF[PlotSize - 1];
      2: LastValue := DataValuesL[PlotSize - 1];
      3: LastValue := DataValuesN[PlotSize - 1];
    end;


    (Lines[j].Series.ParentChart.Owner as TBaseChart).LastValue := LastValue;
    Lines[j].Series.Active := True;
    Lines[j].Series.ParentChart.Repaint;
  end;

end;


{ TForceSensor }

procedure TForceSensor.CloseOutFile;
begin
  CloseFile(OutDataFile);
  Sleep(1000);
end;

procedure TForceSensor.ContinueFrictionTask;
begin
  DAQmxError := DAQmxTaskControl(FrictionTaskHandle, DAQmx_Val_Task_Start);
end;

constructor TForceSensor.Create;
begin
  inherited;

end;

function TForceSensor.CreateChannel;
var
  callbackdata: Pointer;
  S: int32;
begin
  callbackdata := nil;
  if not Channel.Connected then
  begin
    Result := True;
    Exit;
  end;
  Result := False;

  DAQmxError := DAQmxCreateAIBridgeChan(ATaskHandle,
                                        PAnsiChar(Channel.Address),
                                        PAnsiChar(Channel.Name),
                                        Channel.VMin,
                                        Channel.VMax, {maxValue}
                                        Channel.Units,   {units}
                                        Channel.BridgeConf,   {bridgeConfig}
                                        Channel.ExcSource,   {ExcitSource}
                                        Channel.ExcValue  , {ExcitValue}
                                        Channel.Resistance, {BridgeResistane}
                                        '');

  Result := IsError;
  if Result then Exit;

  S := 2 * ReadDataSize;
  DAQmxError := DAQmxResetSampQuantSampPerChan(ATaskHandle);
  DAQmxError := DAQmxCfgSampClkTiming(ATaskHandle,
                                      'OnboardClock',
                                      1.0,
                                      DAQmx_Val_Falling,
                                      ASamplingMode,   //10123   ASamplingMode
                                      S);

  Result := IsError;
  if Result then Exit;

  if SetZero then
  begin
    DAQmxError := DAQmxPerformBridgeOffsetNullingCal(ATaskHandle, PAnsiChar(AnsiString(Channel.Name)));
    Result := IsError;
    if Result then Exit;
  end;

  if CreateCallback then
  begin
    DAQmxError := DAQmxRegisterEveryNSamplesEvent(ATaskHandle,
                                                  DAQmx_Val_Acquired_Into_Buffer,
                                                  ReadDataSize div 2,
                                                  0,
                                                  Cardinal(@EveryNCallbackFriction),
                                                  callbackdata);
    Result := IsError;
    if Result then Exit;

    DAQmxError := DAQmxRegisterDoneEvent(ATaskHandle, 0, Cardinal(@DoneCallback), callbackdata);
    Result := IsError;
  end;
end;

procedure TForceSensor.CreateFrictionTask;
var
  Res: Boolean;
begin
  DAQmxError:= DAQmxCreateTask (PAnsiChar(AnsiString('FrictionTask')),@FrictionTaskHandle);
  Res := IsError;

  if not Res then
     Res := CreateChannel(LateralChannel, True, FrictionTaskHandle, DAQmx_ContSamps);

  if not Res and not UseDeadWeight then
     Res := CreateChannel(NormalChannel, False, FrictionTaskHandle, DAQmx_ContSamps);

  if Res then
  begin
    DAQmxClearTask(FrictionTaskHandle);
    FrictionTaskHandle := 0;
  end
  else begin
    FactorL := LateralChannel.Factor;
    FactorN := NormalChannel.Factor;
    AmpL    := LateralChannel.Amplification;
    AmpN    := NormalChannel.Amplification;
  end;
end;

function TForceSensor.CreateScratchingTask: boolean;
var
  Res: Boolean;
begin
  DAQmxError:= DAQmxCreateTask (PAnsiChar(AnsiString('ScratchTask')),@ScratchTaskHandle);
  Res := IsError;

  if not Res then
     Res := CreateChannel(LateralChannel, False, ScratchTaskHandle, DAQmx_FiniteSamps, True);

  if not Res then
     Res := CreateChannel(NormalChannel, False, ScratchTaskHandle, DAQmx_FiniteSamps, True);


  if Res then
  begin
    DAQmxClearTask(ScratchTaskHandle);
    ScratchTaskHandle := 0;
  end
  else begin
    FactorL := LateralChannel.Factor;
    FactorN := NormalChannel.Factor;
    AmpL    := LateralChannel.Amplification;
    AmpN    := NormalChannel.Amplification;
  end;
  Result := not Res;
end;

function TForceSensor.CreateSingleForceTask;
begin
  DAQmxError:= DAQmxCreateTask (PAnsiChar(AnsiString('SingleForceTask')),@SingleForceHandle);
  Result := IsError;

  if not Result then
    CreateChannel(Channel, False, SingleForceHandle, DAQmx_FiniteSamps, SetZero);

  Result := IsError;

  if SetZero then
  begin
    DAQmxError := DAQmxPerformBridgeOffsetNullingCal(SingleForceHandle, PAnsiChar(AnsiString(Channel.Name)));
    Result := IsError;
    if Result then Exit;
  end;


  if Result then
  begin
    DAQmxClearTask(SingleForceHandle);
    SingleForceHandle := 0;
  end;
end;

procedure TForceSensor.CreateOutFile;
begin
  AssignFile(OutDataFile, FFileName);
  Rewrite(OutDataFile);
  Writeln(OutDataFile, 'N'+ #9 + 'Fn' + #9 + 'Fl' + #9 + 'COF');
  Writeln(OutDataFile, '#' + #9 + 'gf' + #9 + 'gf' + #9 + '#');
  Writeln(OutDataFile,'');
  Writeln(OutDataFile,'' + FConditions.Comment);
  Writeln(OutDataFile,'Stroke: ' + #9 + FloatToStr(FConditions.Stroke) + #9 + 'Speed:' + #9 + FloatToStr(FConditions.Speed));
  Writeln(OutDataFile,'Duration:' + #9 + FloatToStr(FConditions.Duration) + #9 +  'Load:' + #9 + FloatToStr(FConditions.Load) + ForceUnit);
  Writeln(OutDataFile,'Cycles:' + #9 + FloatToStr(FConditions.NumberOfCycles) + #9 +  'Pause:' + #9 + FloatToStr(FConditions.ObservationInterval));
  Writeln(OutDataFile,'Sampling rate:' + #9 + FloatToStr(FConditions.SamplingRate));

  Sleep(1000);
end;

destructor TForceSensor.Free;
begin
  inherited Free;
end;

function TForceSensor.GetNormalizedValue(count: Integer): Double;
begin
  Result := GetNormalForceValue(count) * NormalChannel.Factor * NormalChannel.Amplification;
end;


procedure TForceSensor.GetScratchValies( var N, L: Double);
var
  read: LongInt;
  i: Integer;
  Data: array [0 .. 2 * ReadDataSize] of Double;
  LValue, NValue: double;
 begin
   DAQmxError := DAQmxReadAnalogF64(ScratchTaskHandle,
                                   ReadDataSize div 2,
                                   -1 ,
                                   DAQmx_Val_GroupByChannel,
                                   @data,
                                   2 * ReadDataSize,
                                   @read,
                                   NIL);


  L := 0;
  N := 0;

  for I := 0 to read - 1 do
  begin
    LValue := data[i] * FactorL * AmpL;
    NValue := data[i + read] * FactorN * AmpN + NOffset;

    L := L + LValue;
    N := N + NValue;
  end;


  if read > 0 then
  begin
    L := L / Read;
    N := N / Read;

  end
  else
  begin
    L := 0;
    N := 0;
  end;

end;

function TForceSensor.GetNormalForceValue(count: Integer): Double;
var
  read: LongInt;
  i: Integer;
  Data: array [0 .. 2 * ReadDataSize] of Double;
  NValue: double;
begin

  DAQmxError := DAQmxReadAnalogF64(SingleForceHandle,
                                   ReadDataSize,
                                   -1 ,
                                   DAQmx_Val_GroupByChannel,
                                   @data,
                                   ReadDataSize,
                                   @read,
                                   NIL);

  NValue := 0;
  for I := 0 to read - 1 do
    NValue := NValue + data[i];

  if read > 0 then
    Result := NValue / read
  else
    Result := 0;
end;

procedure TForceSensor.Init;
begin
  Lines[1].Series := AFLine;
  Lines[1].Draw := AFDraw;

  Lines[2].Series := ALLine;
  Lines[2].Draw := ALDraw;

  Lines[3].Series := ANLine;
  Lines[3].Draw := ANDraw;

  FLabel := AError;
end;

function TForceSensor.IsError: boolean;
const
  Size = 2048;
var
  Buffer: PAnsiChar;
  Res: LongInt;
begin
  Result := True;
  if DAQmxError <> 0 then
  begin
    GetMem(Buffer, Size);
    Res := DAQmxGetExtendedErrorInfo(Buffer, Size);

    FLabel.Caption := 'Status: Error!' + #13#10 + String(Buffer);
    FreeMem(Buffer)
  end
  else
  begin
     FLabel.Caption := 'Status: No errors';
     Result := False;
  end;
end;

procedure TForceSensor.PauseFrictionTask;
begin
  DAQmxError := DAQmxTaskControl(FrictionTaskHandle, DAQmx_Val_Task_Stop);
end;

function TForceSensor.StartFrictionTask(AOffset: double; dummy: boolean):boolean;
begin
  Result := False;

  if FrictionTaskHandle <> 0 then
  begin
    if not dummy then CreateOutFile;
    TotalDataRead := 0;
    LastZero := 0;
    CyclesPassed := 0;
    PlotRepaint := 0;
    TotalDataWrite := 0;
    FeedbackCount := 0;
    LoadAveraged := 0;

    UseFeedback := FConditions.UseFeedback;
    TargetForce := FConditions.Load;
    LoadMode := FConditions.LoadMode;

    AvgL :=0;
    AvgN :=0;
    AvgCount := 0;

    NOffset := AOffset;

    DAQmxError := DAQmxStartTask(FrictionTaskHandle);
    Result := not IsError;
    TestStartTime := Now;

    if not Result then
    begin
      if not dummy then CloseOutFile;
      DAQmxClearTask(FrictionTaskHandle);
    end;

  end;
end;

procedure TForceSensor.StopFrictionTask;
begin
  DAQmxError := DAQmxStopTask(FrictionTaskHandle);
  IsError;
  DAQmxWaitUntilTaskDone(FrictionTaskHandle, 0);
  DAQmxClearTask(FrictionTaskHandle);
  frmMain.actTestRun.Enabled := True;
  frmMain.actTestStop.Enabled := False;
  FrictionTaskHandle := 0;

  if not Dummy then CloseOutFile;
end;


procedure TForceSensor.StopScratchingTask;
begin
  DAQmxError := DAQmxStopTask(ScratchTaskHandle);
  IsError;
  DAQmxWaitUntilTaskDone(ScratchTaskHandle, 0);

  DAQmxClearTask(ScratchTaskHandle);
  ScratchTaskHandle := 0
end;

procedure TForceSensor.StopSingleFroceTask;
begin
  if SingleForceHandle <> 0 then
  begin
    DAQmxWaitUntilTaskDone(SingleForceHandle, 0);
    DAQmxError := DAQmxStopTask(SingleForceHandle);
    IsError;
    DAQmxClearTask(SingleForceHandle);
    SingleForceHandle := 0;
  end;
end;

end.
