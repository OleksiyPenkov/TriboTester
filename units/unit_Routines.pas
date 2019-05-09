unit unit_Routines;

interface

uses
  unit_Globals,
  unit_Driver,
  unit_ForceSensor,
  unit_Helpers,
  System.SysUtils,
  VCLTee.Series,
  VCLTee.TeEngine,
  Classes,
  RzStatus,
  RzLabel;

  function SetNormalForce(Value: Double): double;
  function SetNormalForceD(Value: Double): double;

  procedure ProcessResults(Input: string; var Normal, Lateral, COF: TLineSeries);
  procedure Indentation(Conditions: TIndentationConditions;
                        var FD: TPointSeries;
                            PaneDepth: TRzStatusPane;
                            PaneForce: TRzStatusPane);

  procedure ScratchTest(Conditions: TScratchConditions;
                        var FD: TLineSeries;
                            FF: TLineSeries;
                            PaneDepth: TRzStatusPane;
                            PaneForce: TRzStatusPane;
                            TimePane: TRzStatusPane);

  procedure StaticLoading(Conditions: TStaticConditions; Force: TRzLabel);
  procedure Unloading;
  procedure UpdateDriveSettings;

  procedure MultiIndentation(Conditions: TIndentationConditions;
                             var FD: TPointSeries;
                                 PaneDepth: TRzStatusPane;
                                 PaneForce: TRzStatusPane);

  procedure UpdateSpeeds;

implementation

uses
  unit_Config,
  unit_Const,
  Vcl.Dialogs;

var
  LastZPos: Integer;


procedure UpdateSpeeds;
begin
  XSpeeds[0] := FConfig.Section<TStageXOptions>.DriveSpeed1;
  XSpeeds[1] := FConfig.Section<TStageXOptions>.DriveSpeed2;
  XSpeeds[2] := FConfig.Section<TStageXOptions>.DriveSpeed3;
  XSpeeds[3] := FConfig.Section<TStageXOptions>.DriveSpeed4;
  XSpeeds[4] := XSpeeds[3] * 2;

  ZSpeeds[0] := FConfig.Section<TStageZOptions>.DriveSpeed1;
  ZSpeeds[1] := FConfig.Section<TStageZOptions>.DriveSpeed2;
  ZSpeeds[2] := FConfig.Section<TStageZOptions>.DriveSpeed3;
  ZSpeeds[3] := FConfig.Section<TStageZOptions>.DriveSpeed4;
  ZSpeeds[4] := ZSpeeds[3] * 2;
end;

procedure UpdateDriveSettings;
begin
  ShowPopup('Update drive settings ...');
  Drive.InitControllerZ;
  Drive.InitControllerX(True);
  Drive.Reset;
  HidePopup;
end;


procedure MultiIndentation;
var
  i: Integer;
begin
  for I := 1 to Conditions.N do
  begin
    Indentation(Conditions, FD, PaneDepth, PaneForce);
    if (i = 1) or (i = Conditions.N) or (i mod Conditions.SaveN = 0) then
      IndentationToFile(Conditions.Folder + '\Indentation_' + IntToStr(i) + '.txt', Header);
    if Conditions.XShift <> 0 then
    begin
      UpdatePopup('Moving X stage ...');
      Sleep(2000);
      Drive.XShift(Conditions.XShift * 10);
    end;
  end;
end;

procedure Indentation;
var
  LastValue: Double;
  ZPos: Double;
  DS: Integer;
  i: Integer;
begin
  Terminate := False;
  ShowPopup('Aproaching ...');
  FD.Clear;

  SetLength(IndentationData, 0);

  DS := Round(Conditions.Step * 10);

  with ForceSensor do
  begin
    FConfig.LoadSensors(ForceSensor.NormalChannel, ForceSensor.LateralChannel);
    SamplingRate := FConditions.SamplingRate;

    if CreateSingleForceTask(NormalChannel, True) then Exit;


    try
      try
        // approaching to the surface

        Drive.ZSpeed(2);

        LastValue := GetNormalizedValue(20);
        while LastValue < Conditions.ContactForce do
        begin
          Drive.ZShift(DS);
          Sleep(10);
          LastValue := GetNormalizedValue(20);
          UpdatePopup(Format('Fine approaching... Fn = %3.3f %s', [LastValue, ForceUnit]));
          if Terminate then raise OnUserTerminate;
        end;

        UpdatePopup('Stabilisation ...');
        Sleep(1000);
        HidePopup;

        //loading
        Drive.ZSpeed(1);
        ZPos := 0; i := 0;
        while (ZPos <= Conditions.MaxDepth) and (LastValue <= Conditions.MaxForce) do
        begin
          Drive.ZShift(DS);
          Sleep(50);
          LastValue := GetNormalizedValue(50);
          ZPos := ZPos + Conditions.Step;
          FD.AddXY(ZPos, LastValue, '', $FF);


          inc(i);
          SetLength(IndentationData, i + 1);
          IndentationData[i].Pd := ZPos;
          IndentationData[i].Fn := LastValue;


          PaneDepth.Caption := Format('Depth = %f (µm)',[ZPos]);
          PaneForce.Caption := Format('Force = %f (%s)',[LastValue, ForceUnit]);
          if Terminate then raise OnUserTerminate;
        end;

        //unloading
        while (Zpos >=0) and (LastValue > 0.01)  do
        begin
          Drive.ZShift(-DS);
          Sleep(50);
          LastValue := GetNormalizedValue(20);
          ZPos := ZPos - Conditions.Step;
          FD.AddXY(ZPos, LastValue, '', $8000);

          inc(i);
          SetLength(IndentationData, i + 1);
          IndentationData[i].Pd := ZPos;
          IndentationData[i].Fn := LastValue;

          PaneDepth.Caption := Format('Depth = %f (µm)',[ZPos]);
          PaneForce.Caption := Format('Force = %f (%s)',[LastValue, ForceUnit]);
          if Terminate then raise OnUserTerminate;
        end;
        Drive.ZShift(-10000);
      except
        on Exception do;
      end;
    finally
      Drive.Stop;
      StopSingleFroceTask;
      HidePopup;
    end;
  end;
end;


procedure ScratchTest;
var
  LastValue: Double;
  ZPos, XPos: Double;
  LastFriction: Double;
  DS: Integer;
  DX: Integer;
  XStep: Double;
  i: Integer;
  Target: Double;
  DZ: Double;
  Distance: Double;
  StartTime: TTime;

begin
  Terminate := False;

  SetLength(ScratchData, 0);

  DS := 1;
  DZ := (Conditions.MaxForce - Conditions.ContactForce) / Conditions.Steps;

  Distance := Round(Conditions.Distanse * FConfig.Section<TStageXOptions>.StrokeScale);
  XStep := Distance / Conditions.Steps;
  DX := Round(XStep);

  if DX <=0 then
  begin
    ShowMessageUser('Wrong conditions! Step is too small!');
    Exit;
  end;


  with ForceSensor do
  begin
    FConfig.LoadSensors(ForceSensor.NormalChannel, ForceSensor.LateralChannel);
    SamplingRate := FConditions.SamplingRate;


        // approaching to the surface

    try
      try
        if not CreateScratchingTask  then Exit;


        ShowPopup('Rough aprocahing ...');
        Drive.ZSpeed(4);
        GetScratchValies(LastValue, LastFriction);
        while LastValue < Conditions.ContactForce do
        begin
          Drive.ZShift(DS * 10);
          Sleep(20);
          GetScratchValies(LastValue, LastFriction);
          UpdatePopup(Format('Rough approaching... Fn = %3.3f %s', [LastValue, ForceUnit]));
          if Terminate then raise OnUserTerminate;
        end;


        UpdatePopup('Fine approaching ...');
        Sleep(1000);
        Drive.ZSpeed(2);
        Drive.ZShift(-200);
        Sleep(1000);
        Drive.ZSpeed(1);
        Drive.XShift(DX * 10);
        Sleep(1000);
        Drive.ZSpeed(3);

        GetScratchValies(LastValue, LastFriction);
        while LastValue < Conditions.ContactForce do
        begin
          Drive.ZShift(DS*3);
          Sleep(20);
          GetScratchValies(LastValue, LastFriction);
          UpdatePopup(Format('Fine approaching... Fn = %3.3f %s', [LastValue, ForceUnit]));
          if Terminate then raise OnUserTerminate;
        end;

        UpdatePopup('Stabilisation ...');
        Sleep(1000);
        HidePopup;

        ZPos := 0; XPos := 0; i := 0;

        //loading
        Drive.ZSpeed(1);
        Drive.XSpeed(1);

        StartTime := Now;

        while (LastValue <= Conditions.MaxForce) and (i < Conditions.Steps) do
        begin
          Target := (i + 1) * DZ;
          while LastValue <= Target do
          begin
            Drive.ZShift(DS);
            Sleep(5);
            GetScratchValies(LastValue, LastFriction);
            if Terminate then raise OnUserTerminate;
          end;

          Drive.XShift(DX);
          //Sleep(50);

          ZPos := ZPos + DS;
          XPos := XPos + XStep/FConfig.Section<TStageXOptions>.StrokeScale;
          FD.AddXY(XPos, LastValue, '', $FF);
          FF.AddXY(XPos, Abs(LastFriction), '', $FFFF);

          SetLength(ScratchData, i + 1);
          ScratchData[i].X := XPos;
          ScratchData[i].Ff := Abs(LastFriction);
          ScratchData[i].Nf := LastValue;

          inc(i);
          PaneDepth.Caption := Format('Length = %f (mm)',[XPos]);
          PaneForce.Caption := Format('Force = %f (%s)',[LastValue, ForceUnit]);
          TimePane.Caption  := TimeToStr(Now - StartTime);
          if Terminate then raise OnUserTerminate;
        end;

      except
        on Exception do;
      end;
    finally
      Drive.Stop;
      StopScratchingTask;
      HidePopup;
    end;
  end;
end;

procedure StaticLoading(Conditions: TStaticConditions; Force: TRzLabel);
var
  LastValue: Double;
  DS: Integer;
begin
  Terminate := False;
  ShowPopup('Aproaching ...');

  SetLength(IndentationData, 0);

  DS := 10;

  with ForceSensor do
  begin
    FConfig.LoadSensors(ForceSensor.NormalChannel, ForceSensor.LateralChannel);
    SamplingRate := FConditions.SamplingRate;


    if CreateSingleForceTask(NormalChannel, True) then Exit;


    try
      try
        // approaching to the surface

        Drive.ZSpeed(2);

        LastValue := GetNormalizedValue(20);
        while LastValue < Conditions.ContactForce do
        begin
          Drive.ZShift(DS);
          Sleep(10);
          LastValue := GetNormalizedValue(20);
          UpdatePopup(Format('Fine approaching... Fn = %3.3f %s', [LastValue, ForceUnit]));
          if Terminate then raise OnUserTerminate;
        end;

        UpdatePopup('Stabilisation ...');
        Sleep(1000);
        HidePopup;

        //loading
        Drive.ZSpeed(1);
        LastZPos := 0;
        while (LastValue <= Conditions.MaxForce) do
        begin
          Drive.ZShift(DS);
          Sleep(50);
          LastValue := GetNormalizedValue(50);
          LastZPos := LastZPos + DS;

          Force.Caption := FloatToStrF(LastValue, ffFixed, 4, 2) + ' ' + ForceUnit;
          if Terminate then raise OnUserTerminate;
        end;

      except
        on Exception do;
      end;
    finally
      Drive.Stop;
      StopSingleFroceTask;
      HidePopup;
    end;
  end;
end;


procedure Unloading;
begin
  Drive.ZSpeed(3);
  Drive.ZShift(-(5 * LastZPos));
end;

function SetNormalForceD(Value: Double): double;
const
  N = 50;
var
  Step, i, Distance: integer;
begin
  Terminate := False;
  if Stiffness = 0 then
  begin
    ShowMessage('Suspension was not calibrated!' + #13#10 + 'Run calibration first!');
    Terminate := True;
    Exit;
  end;

  Distance := Round(Stiffness * FConditions.Load);
  Step := Round(Distance / N);

  for I := 1 to N do
  begin
    Drive.ZShift(Step);
    Sleep(500);
    UpdatePopup(Format('Load setting. Current value is %3.3f %s', [FConditions.Load * i / N, ForceUnit]));
  end;
  Result := FConditions.Load;
end;


function SetNormalForce(Value: Double): double;
var
  LastValue, DeltaForce: Double;
  DeltaSteps: integer;
begin
  Result := 0;
  Terminate := False;

  with ForceSensor do
  begin
    if CreateSingleForceTask(NormalChannel, True) then Exit;


    LastValue := GetNormalizedValue;

    try
      try
      Drive.ZSpeed(2);

      while LastValue <= (FConfig.Section<TStageZOptions>.LoadingRange1 * Value ) do
      begin
        Drive.ZShift(FConfig.Section<TStageZOptions>.LoadingSteps1);
        Sleep(FConfig.Section<TStageZOptions>.LoadingDelay);
        if Terminate then raise OnUserTerminate;

        LastValue := GetNormalizedValue(10);
        UpdatePopup(Format('Load setting. Current value is %3.3f %s', [LastValue, ForceUnit]));
      end;

      while LastValue <= (FConfig.Section<TStageZOptions>.LoadingRange2 * Value) do
      begin
        Drive.ZShift(FConfig.Section<TStageZOptions>.LoadingSteps2);
        Sleep(FConfig.Section<TStageZOptions>.LoadingDelay);
        if Terminate then raise OnUserTerminate;

        LastValue := GetNormalizedValue(10);
        UpdatePopup(Format('Load setting. Current value is %3.3f %s', [LastValue, ForceUnit]));
      end;

      Drive.ZSpeed(0);
      DeltaSteps := 0;
      DeltaForce := Value - LastValue;
      while LastValue <= Value do
      begin
        Drive.ZShift(FConfig.Section<TStageZOptions>.LoadingSteps3);
        Sleep(FConfig.Section<TStageZOptions>.LoadingDelay);

        Inc(DeltaSteps, FConfig.Section<TStageZOptions>.LoadingSteps3);


        if Terminate then raise OnUserTerminate;
        LastValue := GetNormalizedValue;
        UpdatePopup(Format('Load setting. Current value is %3.3f %s', [LastValue, ForceUnit]));
      end;

      SpringStifness := DeltaSteps / DeltaForce * FConfig.Section<TStageZOptions>.FBCoeff;  // <----------------------

      except
        on Exception do;
      end;
    finally
      Drive.Stop;
    end;

    StopSingleFroceTask;
    Result := LastValue;
  end;
end;

procedure Smooth(const N: Integer; var Data: TLineSeries);
var
  i,j, Max: Integer;
  s: Double;
begin
  Max := Data.Count - 1;
  for I := 0 to Max - N do
  begin
    S := 0;
    for j := 0 to N do
      S := S + Data.YValues[i + J];
    Data.YValues[i + N div 2] := S/(N + 1);
  end;
end;


procedure ProcessResults(Input: string; var Normal, Lateral, COF: TLineSeries);
var
  i: Integer;
  Output: TStringList;
  AvgFF: double;
  Count: integer;
  Window: integer;

  procedure ReadData;
  var
    i: integer;
    S: string;
    N,L: Double;


  begin
    AssignFile(OutDataFile, Input);
    Reset(OutDataFile);

    for I := 1 to 9 do
      Readln(OutDataFile, s);

    Count := 0;

    while not Eof(OutDataFile) do
    begin
      Readln(OutDataFile,i, N, L);

      Normal.AddXY(i, N);
      Lateral.AddXY(i, L);
      inc(Count);
    end;


    CloseFile(OutDataFile);
  end;

begin
  try
    Normal.Clear;
    Lateral.Clear;
    COF.Clear;


    ReadData;

    Window := Round(0.2 * Count);
    AvgFF := 0;
    for I := 5 to Count - Window do
      AvgFF := Lateral.YValues[i] + AvgFF;

    AvgFF := AvgFF / Count;
    for I := 0 to Count - 1 do
      Lateral.YValues[i] := Lateral.YValues[i] - AvgFF;


    Smooth(11, Normal);
    Smooth(7, Lateral);

    for I := 0 to Normal.Count - 1 do
    begin
      COF.AddXY(i, Abs(Lateral.YValues[i]/Normal.YValues[i]));
    end;


    Normal.ParentChart.BottomAxis.Minimum := Normal.MinXValue;
    Normal.ParentChart.BottomAxis.Maximum := Normal.MaxXValue;

    Lateral.ParentChart.BottomAxis.Minimum := Lateral.MinXValue;
    Lateral.ParentChart.BottomAxis.Maximum := Lateral.MaxXValue;

    COF.ParentChart.BottomAxis.Minimum := COF.MinXValue;
    COF.ParentChart.BottomAxis.Maximum := COF.MaxXValue;

    Normal.ParentChart.Update;
    Lateral.ParentChart.Update;
    COF.ParentChart.Update;


    Output := TStringList.Create;
    Output.LoadFromFile(Input);
    Output[6] := 'Cycles:' + #9 + IntToStr(CyclesPassed) + #9 +  'Pause:' + #9 + IntToStr(FConditions.ObservationInterval);
    Output.SaveToFile(Input);
  finally

    FreeAndNil(Output);
  end;


end;


end.
