unit unit_Helpers;

interface

uses

  Files_list,
  Classes,
  VCLTee.Series;


  procedure ShowPopup(const Msg: string);
  procedure UpdatePopup(const Msg: string);
  procedure HidePopup;
  function GetSpecialPath(CSIDL: word): string;
  function CreateFolders(const Root: string; const Path: string): Boolean;
  function GenerateFileName(template: string; FileList: TFilesList; List: TStringList):string;
  procedure IndentationToFile(FileName, Header: string);
  procedure ScratchToFile(FileName, Header: string);
  procedure SetForceUnit(Index: integer);

implementation

uses
  frm_info_popup,
  ShellApi,
  Windows,
  ActiveX,
  UrlMon,
  Graphics,
  StrUtils,
  SysUtils,
  IOUtils,
  Vcl.Forms,
  ShlObj,
  IdHashMessageDigest,
  Math,
  Vcl.HtmlHelpViewer,
  Vcl.Dialogs,
  unit_Globals,
  unit_Const;

procedure SetForceUnit;
begin
  ForceUnit := ForceUnits[Index];
end;

procedure IndentationToFile;
var
  List: TStringList;
  i: Integer;
begin
  try
    CreateFolders('', ExtractFilePath(FileName));
    List := TStringList.Create;
    List.Text := Header;
    for I := 0 to High(IndentationData) - 1 do
      List.Add(Format('%f%s%.5f',[IndentationData[i].Pd, #9, IndentationData[i].Fn]));

    List.SaveToFile(FileName);
  finally
    FreeAndNil(List);
  end;
end;

procedure ScratchToFile;
var
  List: TStringList;
  i: Integer;
begin
  try
    CreateFolders('', ExtractFilePath(FileName));
    List := TStringList.Create;
    List.Text := Header;
    for I := 0 to High(ScratchData) - 1 do
      List.Add(Format('%f%s%.5f%s%.5f',[ScratchData[i].X, #9, ScratchData[i].Nf, #9, ScratchData[i].Ff]));

    List.SaveToFile(FileName);
  finally
    FreeAndNil(List);
  end;
end;

procedure ShowPopup(const Msg: string);
begin
  if not Assigned(frmInfoPopup) then
            frmInfoPopup := TfrmInfoPopup.Create(nil);

  frmInfoPopup.lblText.Caption := Msg;
  frmInfoPopup.Show;
  frmInfoPopup.Refresh;
end;

procedure UpdatePopup(const Msg: string);
begin
  if Assigned(frmInfoPopup) then
  begin
    frmInfoPopup.lblText.Caption := Msg;
    frmInfoPopup.lblText.Repaint;
    frmInfoPopup.Refresh;
  end;
end;

procedure HidePopup;
begin
  if Assigned(frmInfoPopup) then
  begin
    frmInfoPopup.Hide;
  end;
end;

function GetSpecialPath(CSIDL: word): string;
var
  S: string;
begin
  SetLength(S, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(S), CSIDL, True) then
    S := '';
  Result := IncludeTrailingPathDelimiter(PChar(S));
end;

function CreateFolders(const Root: string; const Path: string): Boolean;
var
  FullPath: string;
begin
  if Path = '\' then
    FullPath := Root + Path
  else
    FullPath := TPath.Combine(Root, Path);

  Result := SysUtils.ForceDirectories(FullPath);
end;





function GenerateFileName(template: string; FileList: TFilesList; List: TStringList):string;
var
  Date: string;
  Path, FileName: string;
  PartFileName: string;
  DateFormat: TFormatSettings;
begin
  DateFormat := TFormatSettings.Create(LOCALE_SYSTEM_DEFAULT);
  DateFormat.DateSeparator := '-';
  DateFormat.ShortDateFormat := 'yyyy-mm-dd';
  DateFormat.LongDateFormat := 'yyyy-mm-dd';
  Date := DateToStr(Now, DateFormat);

  Path := ExtractFilePath(template);
  FileName := ExtractFileName(Template);

  PartFileName := StringReplace(FileName,'##','*', [rfReplaceAll]);


  Path := StringReplace(Path, '%Date%', Date, [rfReplaceAll]);
  CreateFolders('', Path);

  List.Clear;
  FileList.TargetPath := Path;
  FileList.Mask := PartFileName;
  FileList.Process;

  FileName:= StringReplace(FileName, '##', Format('%.*d',[2, List.Count + 1]),[]);



  Result := Path + FileName;
end;


end.
