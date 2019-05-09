unit unit_Config;
interface
uses
  forms,
  Vcl.Graphics,
  iniFiles,
  rtti,
  sysUtils,
  generics.Collections,
  ShlObj,
  NIDAQmxCAPI_TLB,
  unit_Globals;

const
    DEFAULT_CONFIG_SECTION = 'COMMON';

type

  TTriboSystemFile = (
    sfSystemIniFile,
    sfAppHelp
  );

    /// <summary>
    ///     јтрибут класса названи€ секции в INI-файле
    /// </summary>
    SectionAttribute = class(TCustomAttribute)
      strict private
        FSection : string;
      public
        constructor Create(SectionName : string);
        property Section : string read FSection;
    end;

    /// <summary>
    ///     «начение пол€ по умолчанию (дл€ int, bool, string)
    /// </summary>
    DefaultValueAttribute = class(TCustomAttribute)
      strict private
        FValue : TValue;
      public
        constructor Create(aIntValue : integer); overload;
        constructor Create(aFloatValue : double); overload;
        constructor Create(aBoolValue : boolean); overload;
        constructor Create(aStringValue : string); overload;
        property Value : TValue read FValue;
    end;

    /// <summary>
    ///    Ѕазовый класс доступа к свойствам.
    ///     аждое свойство дл€ сохранени€/получани€ в INI *ƒолжно* иметь индекс.
    ///    в конечных классах дл€ каждого типа свойсства следует указывать один из
    ///    методов чтени€/записи:
    ///    - getIntegerValue/SetIntegerValue
    ///    - getBooleanValue/setBooleanValue
    ///    - getStringValue/SetStringValue
    ///    ѕеред каждым свойством должен быть описан атрибут DefaulValue
    ///    «начение по умолчанию строкового свойства может иметь подстроку
    ///    %PATH% дл€ замены ее директорией программы, двойные "/" удал€ютс€
    /// </summary>
    TBaseOptions = class(TObject)
      strict
      protected
        FCtx : TRttiContext;
        FIni : TIniFile;
        FSection : string;
        function getDefaultAttribute(prop : TRttiProperty) : DefaultValueAttribute;

        function getGenericValue<T>(index : integer): T;
        procedure SetGenericValue<T>(index : integer; value : T);

        function getBooleanValue(index : integer):boolean; virtual;
        function getIntegerValue(index : integer):integer; virtual;
        function getStringValue(index : integer):string; virtual;
        function getFloatValue(index: integer): double; virtual;

        procedure SetBooleanValue(index : integer; value : boolean); virtual;
        procedure SetIntegerValue(index : integer; value : integer); virtual;
        procedure SetStringValue(index : integer; value: string); virtual;
        procedure SetFloatValue(index: Integer; value: Double); virtual;

        function getProperty(index : integer) : TRttiProperty;
      public
        constructor Create(iniFile : TIniFile);
        destructor Destroy(); override;
    end;

    TBaseOptionsClass = class of TBaseOptions;


    [Section('NormalSensor')]
    TNormalSOptions = class(TBaseOptions)
    public
      [DefaultValue('Force/ai1')]
      property Adress : string index 0 read getStringValue write SetStringValue;
      [DefaultValue('myNormalForceChannel')]
      property Name : string index 1 read getStringValue write SetStringValue;
      [DefaultValue(True)]
      property Connected: boolean index 2 read  getBooleanValue write setBooleanValue;
      [DefaultValue(-2.4)]
      property Min : double index 3 read getFloatValue write SetFloatValue;
      [DefaultValue(2.4)]
      property Max : double index 4 read getFloatValue write SetFloatValue;
      [DefaultValue(DAQmx_Val_mVoltsPerVolt)]
      property Units : integer index 5 read getIntegerValue write SetIntegerValue;
      [DefaultValue(DAQmx_Val_FullBridge)]
      property BridgeConfig : integer index 6 read getIntegerValue write SetIntegerValue;
      [DefaultValue(DAQmx_Val_Internal)]
      property ExcitSource : integer index 7 read getIntegerValue write SetIntegerValue;
      [DefaultValue(2.5)]
      property ExcitValue : double index 8 read getFloatValue write SetFloatValue;
      [DefaultValue(120)]
      property Resistance : double index 9 read getFloatValue write SetFloatValue;
      [DefaultValue(2.76)]
      property Factor: double index 10 read getFloatValue write SetFloatValue;
      [DefaultValue(1)]
      property Amplification: integer index 11 read getIntegerValue write SetIntegerValue;
    end;


    [Section('LateralSensor')]
    TLateralSOptions = class(TBaseOptions)
    public
      [DefaultValue('Force/ai0')]
      property Adress : string index 0 read getStringValue write SetStringValue;
      [DefaultValue('myLateralForceChannel')]
      property Name : string index 1 read getStringValue write SetStringValue;
      [DefaultValue(True)]
      property Connected: boolean index 2 read  getBooleanValue write setBooleanValue;
      [DefaultValue(-2.4)]
      property Min : double index 3 read getFloatValue write SetFloatValue;
      [DefaultValue(2.4)]
      property Max : double index 4 read getFloatValue write SetFloatValue;
      [DefaultValue(DAQmx_Val_mVoltsPerVolt)]
      property Units : integer index 5 read getIntegerValue write SetIntegerValue;
      [DefaultValue(DAQmx_Val_FullBridge)]
      property BridgeConfig : integer index 6 read getIntegerValue write SetIntegerValue;
      [DefaultValue(DAQmx_Val_Internal)]
      property ExcitSource : integer index 7 read getIntegerValue write SetIntegerValue;
      [DefaultValue(2.5)]
      property ExcitValue : double index 8 read getFloatValue write SetFloatValue;
      [DefaultValue(120)]
      property Resistance : double index 9 read getFloatValue write SetFloatValue;
      [DefaultValue(3.62)]
      property Factor: double index 10 read getFloatValue write SetFloatValue;
      [DefaultValue(1)]
      property Amplification: integer index 11 read getIntegerValue write SetIntegerValue;
    end;


    [Section('Charts')]
    TChartOptions = class(TBaseOptions)
    public
      [DefaultValue(True)]
      property LateralChartDraw  : Boolean index 0 read getBooleanValue write SetBooleanvalue;
      [DefaultValue(False)]
      property NormalChartDraw  : Boolean index 1 read getBooleanValue write SetBooleanvalue;
      [DefaultValue(False)]
      property FrictionChartDraw  : Boolean index 2 read getBooleanValue write SetBooleanvalue;
      [DefaultValue(1)]
      property LineWidth: Integer index 3 read getIntegerValue write SetIntegerValue;
      [DefaultValue(clNavy)]
      property LineColor: Integer index 4 read getIntegerValue write SetIntegerValue;
    end;

    [Section('Acquisition')]
    TAcquisitionOptions = class(TBaseOptions)
    public
      [DefaultValue(20)]
      property SamplingRate: Integer index 0 read getIntegerValue write setIntegerValue;
      [DefaultValue(0)]
      property ForceUnitIndex: Integer index 1 read getIntegerValue write setIntegerValue;
      [DefaultValue(0)]
      property LoadingMethod: Integer index 2 read getIntegerValue write setIntegerValue;
    end;

    [Section('Driver')]
    TDriverOptions = class(TBaseOptions)
    public
      [DefaultValue(0)]
      property TestPosition : integer index 0 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(1000)]
      property ObservationPosition: Integer index 1 read getIntegerValue write setIntegerValue;
      [DefaultValue(10000)]
      property ServicePosition: Integer index 2 read getIntegerValue write setIntegerValue;
    end;

    [Section('StageX')]
    TStageXOptions = class(TBaseOptions)
    public
      [DefaultValue(1000)]
      property SpeedScale : integer index 0 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(10000)]
      property StrokeScale : integer index 1 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(100)]
      property SpeedMultiplayer : integer index 2 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(400)]
      property AccelerationRate: Integer index 3 read getIntegerValue write setIntegerValue;
      [DefaultValue(400)]
      property DecelerationRate: Integer index 4 read getIntegerValue write setIntegerValue;
      [DefaultValue(150)]
      property StartSpeed: Integer index 5 read getIntegerValue write setIntegerValue;
      [DefaultValue(10)]
      property DriveSpeed1: Integer index 6 read getIntegerValue write setIntegerValue;
      [DefaultValue(50)]
      property DriveSpeed2: Integer index 7 read getIntegerValue write setIntegerValue;
      [DefaultValue(250)]
      property DriveSpeed3: Integer index 8 read getIntegerValue write setIntegerValue;
      [DefaultValue(1000)]
      property DriveSpeed4: Integer index 9 read getIntegerValue write setIntegerValue;
      [DefaultValue(4000)]
      property DriveSpeed5: Integer index 10 read getIntegerValue write setIntegerValue;
      [DefaultValue(1000)]
      property HomeHigh: Integer index 11 read getIntegerValue write setIntegerValue;
      [DefaultValue(500)]
      property HomeLow: Integer index 12 read getIntegerValue write setIntegerValue;
      [DefaultValue(True)]
      property HomeAuto: boolean index 13 read getBooleanValue write setBooleanValue;
      [DefaultValue(False)]
      property Reverse: boolean index 14 read getBooleanValue write setBooleanValue;
    end;

    [Section('StageZ')]
    TStageZOptions = class(TBaseOptions)
    public
      [DefaultValue(1000)]
      property SpeedScale : integer index 0 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(10000)]
      property StrokeScale : integer index 1 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(100)]
      property SpeedMultiplayer : integer index 2 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(400)]
      property AccelerationRate: Integer index 3 read getIntegerValue write setIntegerValue;
      [DefaultValue(400)]
      property DecelerationRate: Integer index 4 read getIntegerValue write setIntegerValue;
      [DefaultValue(150)]
      property StartSpeed: Integer index 5 read getIntegerValue write setIntegerValue;
      [DefaultValue(10)]
      property DriveSpeed1: Integer index 6 read getIntegerValue write setIntegerValue;
      [DefaultValue(50)]
      property DriveSpeed2: Integer index 7 read getIntegerValue write setIntegerValue;
      [DefaultValue(250)]
      property DriveSpeed3: Integer index 8 read getIntegerValue write setIntegerValue;
      [DefaultValue(1000)]
      property DriveSpeed4: Integer index 9 read getIntegerValue write setIntegerValue;
      [DefaultValue(4000)]
      property DriveSpeed5: Integer index 10 read getIntegerValue write setIntegerValue;
      [DefaultValue(1000)]
      property HomeHigh: Integer index 11 read getIntegerValue write setIntegerValue;
      [DefaultValue(500)]
      property HomeLow: Integer index 12 read getIntegerValue write setIntegerValue;
      [DefaultValue(True)]
      property HomeAuto: boolean index 13 read getBooleanValue write setBooleanValue;
      [DefaultValue(False)]
      property Reverse: boolean index 14 read getBooleanValue write setBooleanValue;


      [DefaultValue(100)]
      property LoadingSteps1 : integer index 15 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(20)]
      property LoadingSteps2 : integer index 16 read GetIntegerValue write SetIntegerValue;
      [DefaultValue(5)]
      property LoadingSteps3 : integer index 17 read GetIntegerValue write SetIntegerValue;

      [DefaultValue(0.5)]
      property LoadingRange1 : double index 18 read getFloatValue write SetFloatValue;
      [DefaultValue(0.9)]
      property LoadingRange2 : double index 19 read getFloatValue write SetFloatValue;

      [DefaultValue(50)]
      property LoadingDelay : integer index 20 read GetIntegerValue write SetIntegerValue;

      [DefaultValue(1)]
      property FBCoeff : double index 21 read getFloatValue write SetFloatValue;

    end;

    [Section('Path')]
    TPathOptions = class(TBaseOptions)
    public
      [DefaultValue('')]
      property LastOpenOutFolder  : string index 0 read getStringValue write SetStringValue;
      [DefaultValue('C:\Tribo\TriboViewer.exe')]
      property ViewerPath         : string index 1 read getStringValue write SetStringValue;

    end;

    [Section('Port')]
    TPortOptions = class(TBaseOptions)
    public
      [DefaultValue('COM1')]
      property Adress  : string index 0 read getStringValue write SetStringValue;
      [DefaultValue(0)]
      property BaudRate  : integer index 1 read getIntegerValue write SetIntegerValue;
      [DefaultValue(0)]
      property ControllerType:Integer index 2 read getIntegerValue write setIntegerValue;
    end;

    [Section('Windows')]
    TWindowsOptions = class(TBaseOptions)
    public
      [DefaultValue(0)]
      property FrictionLeft  : integer index 0 read getIntegerValue write SetIntegerValue;
      [DefaultValue(0)]
      property FrictionTop   : integer index 1 read getIntegerValue write SetIntegerValue;
      [DefaultValue(300)]
      property FrictionHeight: integer index 2 read getIntegerValue write setIntegerValue;
      [DefaultValue(800)]
      property FrictionWidht : integer index 3 read getIntegerValue write setIntegerValue;

      //----------------------------------------------------------------------

      [DefaultValue(0)]
      property NormalLeft  : integer index 4 read getIntegerValue write SetIntegerValue;
      [DefaultValue(0)]
      property NormalTop   : integer index 5 read getIntegerValue write SetIntegerValue;
      [DefaultValue(300)]
      property NormalHeight: integer index 6 read getIntegerValue write setIntegerValue;
      [DefaultValue(800)]
      property NormalWidht : integer index 7 read getIntegerValue write setIntegerValue;


      //------------------------------------------------------------------------

      [DefaultValue(0)]
      property COFLeft  : integer index 8 read getIntegerValue write SetIntegerValue;
      [DefaultValue(0)]
      property COFTop   : integer index 9 read getIntegerValue write SetIntegerValue;
      [DefaultValue(300)]
      property COFHeight: integer index 10 read getIntegerValue write setIntegerValue;
      [DefaultValue(800)]
      property COFWidht : integer index 11 read getIntegerValue write setIntegerValue;

      //------------------------------------------------------------------------

      [DefaultValue(100)]
      property JLeft  : integer index 12 read getIntegerValue write SetIntegerValue;
      [DefaultValue(400)]
      property JTop   : integer index 13 read getIntegerValue write SetIntegerValue;

      [DefaultValue(500)]
      property SLeft  : integer index 14 read getIntegerValue write SetIntegerValue;
      [DefaultValue(400)]
      property STop   : integer index 15 read getIntegerValue write SetIntegerValue;



    end;


    /// <summary>
    ///      ласс дл€ работы с настройками
    /// </summary>
    TConfig = class(TObject)
      strict private
       class var
        FIni: TIniFile;

        FAppPath : string;
        FWorkDir: string;
        FErrorLog: Boolean;

        FOptions : TObjectList<TBaseOptions>;
      private
        class function GetSystemFileName(fileType: TTriboSystemFile): string; static;
        class function GetWorkPath: string; static;
      public
        class constructor Create();
        class destructor  Destroy();

        class procedure RegisterOptions(OptionsClass : TBaseOptionsClass);
        class function  Section<T:TBaseOptions>() : T;

        class procedure LoadSensors(out Normal, Lateral: TChannelRecord);
        class procedure SaveSensors(const Normal, Lateral: TChannelRecord);

        class property ErrorLog: Boolean read FErrorLog write FErrorLog;
        class property AppPath : string read FAppPath;

        class property WorkDir: string read FWorkDir;
        class property WorkPath: string read GetWorkPath;

        class property SystemFileName[fileType: TTriboSystemFile]: string read GetSystemFileName;
      end;

    EConfigException = Exception;

var
  FConfig : TConfig;

implementation
uses
  typinfo,
  strUtils,
  unit_Const,
  unit_Helpers;

{$REGION '--------------------- Create/Destroy ------------------------'}

class constructor TConfig.Create();
const
  STR_USELOCALDATA = 'uselocaldata';

var
  GlobalAppDataDir: string;
  IniFileName : string;
  UseLocalData: boolean;
begin

  FAppPath := ExtractFilePath(Application.ExeName);
  GlobalAppDataDir := GetSpecialPath(CSIDL_APPDATA) + APPDATA_DIR_NAME;

  UseLocalData := FileExists(FAppPath + STR_USELOCALDATA);

  FWorkDir := IfThen(UseLocalData, ExcludeTrailingPathDelimiter(FAppPath), GlobalAppDataDir);


  if not UseLocalData and not DirectoryExists(GlobalAppDataDir) then
      CreateFolders('', FWorkDir);

  IniFileName := WorkPath + SETTINGS_FILE_NAME;
  FIni := TIniFile.Create(IniFileName);

  FOptions := TObjectList<TBaseOptions>.Create();

  TConfig.RegisterOptions(TPathOptions);
  TConfig.RegisterOptions(TLateralSOptions );
  TConfig.RegisterOptions(TNormalSOptions );
  TConfig.RegisterOptions(TChartOptions);
  TConfig.RegisterOptions(TAcquisitionOptions);
  TConfig.RegisterOptions(TDriverOptions);
  TConfig.RegisterOptions(TStageXOptions);
  TConfig.RegisterOptions(TStageZOptions);
  TConfig.RegisterOptions(TPortOptions);
  TConfig.RegisterOptions(TWindowsOptions);


end;

class destructor TConfig.Destroy;
begin
  FOptions.Free();
  FIni.Free();
end;


class procedure TConfig.LoadSensors(out Normal, Lateral: TChannelRecord);
begin
  with Normal do
  begin
    Address := AnsiString(Section<TNormalSOptions>.Adress);
    Name := AnsiString(Section<TNormalSOptions>.Name);
    VMin := Section<TNormalSOptions>.Min;
    VMax := Section<TNormalSOptions>.Max;
    ExcValue := Section<TNormalSOptions>.ExcitValue;
    ExcSource := Section<TNormalSOptions>.ExcitSource;
    BridgeConf := Section<TNormalSOptions>.BridgeConfig;
    Resistance := Section<TNormalSOptions>.Resistance;
    Connected := Section<TNormalSOptions>.Connected;
    Units := Section<TNormalSOptions>.Units;
    Factor := Section<TNormalSOptions>.Factor;
    Amplification := Section<TNormalSOptions>.Amplification;
  end;

  with Lateral do
  begin
    Address := AnsiString(Section<TLateralSOptions>.Adress);
    Name := AnsiString(Section<TLateralSOptions>.Name);
    VMin := Section<TLateralSOptions>.Min;
    VMax := Section<TLateralSOptions>.Max;
    ExcValue := Section<TLateralSOptions>.ExcitValue;
    ExcSource := Section<TLateralSOptions>.ExcitSource;
    BridgeConf := Section<TLateralSOptions>.BridgeConfig;
    Resistance := Section<TLateralSOptions>.Resistance;
    Connected := Section<TLateralSOptions>.Connected;
    Units := Section<TLateralSOptions>.Units;
    Factor := Section<TLateralSOptions>.Factor;
    Amplification := Section<TLateralSOptions>.Amplification;
  end;

end;

class function TConfig.GetSystemFileName(fileType: TTriboSystemFile): string;
begin
 case fileType of
    sfAppHelp: Result := AppPath + APP_HELP_FILENAME;
  else
    Assert(False);
  end;
end;

class function TConfig.GetWorkPath: string;
begin
  Result := IncludeTrailingPathDelimiter(FWorkDir);
end;

class procedure TConfig.RegisterOptions(OptionsClass: TBaseOptionsClass);
var opt : TBaseOptions;
begin
    opt := OptionsClass.Create(FIni);
    FOptions.Add(opt);
end;

class function TConfig.Section<T>(): T;
var opt : TBaseOptions;
    ti : TRttiType;
    ctx : TRttiContext;
begin
    ti := ctx.GetType(typeInfo(T));
    try
        for opt in FOptions do begin
            if opt is ti.AsInstance.MetaclassType then
                exit(T(opt));
        end;
    finally
        ctx.Free();
    end;

    raise EConfigException.Create('Unregistered option group' + string(PTypeInfo(typeinfo(t)).Name));
end;

class procedure TConfig.SaveSensors(const Normal, Lateral: TChannelRecord);
begin
  with Normal do
  begin
    Section<TNormalSOptions>.Adress := string(Address);
    Section<TNormalSOptions>.Name := string(Name);
    Section<TNormalSOptions>.Min := VMin;
    Section<TNormalSOptions>.Max := VMax;
    Section<TNormalSOptions>.ExcitValue := ExcValue;
    Section<TNormalSOptions>.ExcitSource := ExcSource;
    Section<TNormalSOptions>.BridgeConfig := BridgeConf;
    Section<TNormalSOptions>.Resistance := Resistance;
    Section<TNormalSOptions>.Connected := Connected;
    Section<TNormalSOptions>.Units := Units;
    Section<TNormalSOptions>.Factor := Factor;
  end;

  with Lateral do
  begin
    Section<TLateralSOptions>.Adress := string(Address);
    Section<TLateralSOptions>.Name := string(Name);
    Section<TLateralSOptions>.Min := VMin;
    Section<TLateralSOptions>.Max := VMax;
    Section<TLateralSOptions>.ExcitValue := ExcValue;
    Section<TLateralSOptions>.ExcitSource := ExcSource;
    Section<TLateralSOptions>.BridgeConfig := BridgeConf;
    Section<TLateralSOptions>.Resistance := Resistance;
    Section<TLateralSOptions>.Connected := Connected;
    Section<TLateralSOptions>.Units := Units;
    Section<TLateralSOptions>.Factor := Factor;
  end;
end;

{$ENDREGION}

{$REGION '--------------------- TBaseOptions --------------------------'}
constructor TBaseOptions.Create(iniFile: TIniFile);
var ctx : TRttiContext;
    attr : TCustomAttribute;
    t : TRttiType;
begin
    inherited Create();
    FIni := iniFile;

    FCtx  := TRttiContext.Create();
    t := ctx.GetType(self.ClassType);
    for attr in t.GetAttributes() do begin
        if attr is SectionAttribute then begin
            FSection := SectionAttribute(attr).Section;
        end;
    end;
end;

destructor TBaseOptions.Destroy();
begin
    FCtx.Free();
    inherited;
end;

/// <summary>
/// извлечение атрибута DefaultValue дл€ свойства
/// </summary>
function TBaseOptions.getDefaultAttribute(prop: TRttiProperty): DefaultValueAttribute;
var attr : TCustomAttribute;
begin
    result := nil;
    for attr in prop.GetAttributes() do begin
        if attr is DefaultValueAttribute then begin
            result := attr as DefaultValueAttribute;
            exit;
        end;
    end;
end;

{$REGION '--------------------- get-Methods ---------------------------}
/// <summary>
///     Generic метод получен€и значени€ свойства.
///  если свойство в INI отсутствует, то возвращаетс€ значение атрибута DefaultValue
///  если атрибут не указан, то Default(T)
/// </summary>
function TBaseOptions.getGenericValue<T>(index: integer): T;
var prop : TRttiProperty;
    default : DefaultValueAttribute;
    value : TValue;
begin
    prop := getProperty(index);
    if not assigned(prop) then
        raise EConfigException.Create('Undefined property name');

    default := getDefaultAttribute(prop);

    if FIni.ValueExists(FSection, Prop.Name) then begin

        case prop.PropertyType.TypeKind of
            tkInteger : value := FIni.ReadInteger(FSection, prop.name, Default.Value.AsInteger);
            tkFloat :   value := FIni.ReadFloat(FSection, prop.name, Default.Value.AsExtended);
            tkString,
            tkUString : value := FIni.ReadString(FSection, prop.Name, Default.Value.asString);
            tkEnumeration : value := FIni.ReadInteger(FSection, prop.Name, ord(Default.Value.AsBoolean)) <> 0;
        end;

        result := value.AsType<T>;
    end
    else begin
        if assigned(default) then
             result := default.Value.AsType<T>
        else result := system.Default(T);
    end;
end;

function TBaseOptions.getBooleanValue(index: integer): boolean;
begin
    result := getGenericValue<boolean>(index);
end;

function TBaseOptions.getIntegerValue(index: integer): integer;
begin
    result := getGenericValue<integer>(index);
end;

function TBaseOptions.getFloatValue(index: integer): double;
begin
    result := getGenericValue<double>(index);
end;

function TBaseOptions.getStringValue(index: integer): string;
begin
    result := getGenericValue<string>(index);
    if ContainsText(result, '%PATH%') then begin
         result := ReplaceText(result, '%PATH%', TConfig.AppPath);
         result := ReplaceText(result, '\\', '\');
    end;
end;
{$ENDREGION}


{$REGION '--------------------- set Methods ---------------------------'}

/// <summary>
///     Generic-метод записи свойства в INI файл.
/// </summary>
procedure TBaseOptions.SetGenericValue<T>(index: integer; value: T);
var prop : TRttiProperty;
    newValue : TValue;
begin

    prop := getProperty(index);
    if not assigned(prop) then
        raise EConfigException.Create('Undefined property name');

    newValue := TValue.From<T>(value);

    case PTypeInfo(TypeInfo(T)).Kind of
        tkInteger : FIni.WriteInteger(FSection, prop.Name, newValue.AsInteger);
        tkFloat   : FIni.WriteFloat(FSection, prop.Name, newValue.AsExtended);
        tkString,
        tkUString : Fini.WriteString(FSection, prop.Name, newValue.AsString);
        tkEnumeration : FIni.WriteBool(FSection, prop.Name, newValue.AsBoolean);
    end;
end;

procedure TBaseOptions.SetBooleanValue(index: integer; value: boolean);
begin
    setGenericValue<boolean>(index, value);
end;


procedure TBaseOptions.SetIntegerValue(index, value: integer);
begin
    setGenericValue<integer>(index, value);
end;

procedure TBaseOptions.SetFloatValue(index: Integer; value: Double);
begin
    setGenericValue<Double>(index, value);
end;

procedure TBaseOptions.SetStringValue(index: integer; value: string);
begin
    setGenericValue<string>(index, value);
end;
{$ENDREGION}

/// <summary>
///     —войство класса по его индексу
/// </summary>
function TBaseOptions.getProperty(index: integer): TRttiProperty;
var t : TRttiType;
    props : TArray<TRttiProperty>;
begin
    result := nil;

    t := FCtx.GetType(self.ClassType);
    props := t.GetProperties();
    if index > Length(props) then
        raise EArgumentOutOfRangeException.Create(Format('TPrnsConfig. Property %d does not exists',[index]));

    result := props[index];
end;


{$ENDREGION}

{$REGION '--------------------- Attributes --------------------------'}
{ TSectionAttribute }

constructor SectionAttribute.Create(SectionName: string);
begin
    inherited Create();
    FSection := SectionName;
end;

{ DefaultValueAttribute }

constructor DefaultValueAttribute.Create(aIntValue: integer);
begin
    inherited Create();
    FValue := aIntValue;
end;

constructor DefaultValueAttribute.Create(aBoolValue: boolean);
begin
    inherited Create();
    FValue := aBoolValue;
end;

constructor DefaultValueAttribute.Create(aStringValue: string);
begin
    inherited Create();
    FValue := aStringValue;
end;

constructor DefaultValueAttribute.Create(aFloatValue: double);
begin
    inherited Create();
    FValue := aFloatValue;
end;

{$ENDREGION}

{ TAcquisitionOptions }

initialization

finalization

end.
