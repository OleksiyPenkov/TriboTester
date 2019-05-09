unit unit_CondFile;

interface

uses
  System.IniFiles, unit_Globals, System.SysUtils;


  procedure LoadConditions(const FileName: string; out Conditions: TTestConditions);
  procedure SaveConditions(const FileName: string; const Conditions: TTestConditions);

implementation

procedure LoadConditions(const FileName: string; out Conditions: TTestConditions);
var
  F: TIniFile;
begin
    try
    F := TIniFile.Create(FileName);

    Conditions.FileName := F.ReadString('Main', 'File', 'c:\TriboTests\');
    Conditions.Duration := F.ReadInteger('Main', 'Duration', 10);
    Conditions.Stroke := F.ReadFloat('Main', 'Stroke', 2);
    Conditions.NumberOfCycles := F.ReadInteger('Main', 'Cycles', 100);
    Conditions.ObservationInterval := F.ReadInteger('Main', 'Interval', 30);
    Conditions.Speed := F.ReadFloat('Main', 'Speed', 2);
    Conditions.SamplingRate := F.ReadInteger('Main', 'SamplingRate', 10);
    Conditions.Mode := TTestMode(F.ReadInteger('Main', 'Mode', 0));
    Conditions.Load := F.ReadFloat('Main', 'Load', 2);
    Conditions.Comment := F.ReadString('Main', 'Comment', '');
    Conditions.LoadMode := TLoadMode(F.ReadInteger('Main', 'LoadMode', 0));
    Conditions.UseFeedback := F.ReadBool('Main','Feedback', False);
  finally
    FreeAndNil(F);
  end;
end;

procedure SaveConditions(const FileName: string; const Conditions: TTestConditions);
var
  F: TIniFile;
begin
  try
    F := TIniFile.Create(FileName);

    F.WriteString('Main', 'File', Conditions.FileName);
    F.WriteInteger('Main', 'Duration', Conditions.Duration);
    F.WriteFloat('Main', 'Stroke', Conditions.Stroke);
    F.WriteInteger('Main', 'Cycles', Conditions.NumberOfCycles);
    F.WriteInteger('Main', 'Interval', Conditions.ObservationInterval);
    F.WriteFloat('Main', 'Speed', Conditions.Speed);
    F.WriteInteger('Main', 'SamplingRate', Conditions.SamplingRate);
    F.WriteInteger('Main', 'Mode', Ord(Conditions.Mode));
    F.WriteFloat('Main', 'Load', Conditions.Load);
    F.WriteString('Main', 'Comment', Conditions.Comment);
    F.WriteInteger('Main','LoadMode', Ord(Conditions.LoadMode));
    F.WriteBool('Main','Feedback', Conditions.UseFeedback);
  finally
    FreeAndNil(F);
  end;
end;


end.
