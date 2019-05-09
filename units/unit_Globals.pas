unit unit_Globals;

interface

uses unit_Const, SysUtils, unit_CustomDriver;

type

  TTestMode = (tmByTime, tmByCycle, tmObservation, tmPaused);
  TLoadMode = (lmForce, lmDisplacement);

  TChannelRecord = record
    Address: AnsiString;
    Name: AnsiString;
    VMin, VMax: Double;
    ExcValue: Double;
    Units: Integer;
    ExcSource: Integer;
    BridgeConf: Integer;
    Resistance: Double;
    Connected: Boolean;
    Factor: Double;
    Amplification: Integer;
  end;

  TTestConditions = record
    FileName: string;
    Duration: Integer;
    Stroke: Double;
    NumberOfCycles: Integer;
    ObservationInterval: Integer;
    Speed: Double;
    SamplingRate: Integer;
    Mode: TTestMode;
    Load: double;
    LoadMode: TLoadMode;
    Comment: string;
    UseFeedback: boolean;

    function TargetCycles: Integer;
  end;

  TIndentationConditions = record
    ContactForce, MaxDepth, MaxForce, Step: Double;
    XShift, N, SaveN: integer;
    Folder: string;
  end;

  TStaticConditions = record
    ContactForce, MaxForce: Double;
  end;

  TScratchConditions = record
    ContactForce, MaxForce: Double;
    Steps, Distanse: Integer;
  end;


var
  CyclesPassed: Longint;

  DataValuesL: array [0..PlotSize - 1] of Double;
  DataValuesN: array [0..PlotSize - 1] of Double;

  IndentationData:array of record
                    Pd, Fn: Double;
                  end;

  ScratchData:array of record
                    X, Ff, Nf: Double;
                  end;


  FFrictionTaskHandle : LongInt;
  OutDataFile:TextFile;

  TestStartTime: TDateTime;

  SamplingRate: integer;

  FConditions: TTestConditions;

  Terminate: Boolean;

  OnUserTerminate: Exception;

  CurrentProgramStep: integer;

  Stiffness : Double;

  UseDeadWeight: boolean;

  // константы приводов

  XSpeeds:array [0..4] of Integer;
  ZSpeeds:array [0..4] of Integer;

  ForceUnit : string;

  SpringStifness: double;

var
  Drive : TCustomDrive;

implementation

{ TTestConditions }

function TTestConditions.TargetCycles: Integer;
begin

end;

initialization
begin
  OnUserTerminate := Exception.Create('Terminated by user');
  Stiffness := 0;
end;

end.

