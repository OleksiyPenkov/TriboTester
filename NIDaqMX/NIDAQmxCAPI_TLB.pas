unit NIDAQmxCAPI_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 9/29/2006 10:30:43 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\WINDOWS\system32\nidaqmx.tlb (1)
// LIBID: {3F91BB81-371C-4447-A3CF-110B9875D4B0}
// LCID: 0
// Helpfile: 
// HelpString: NI DAQmx C API
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses {LCLIntf,} ActiveX, Classes, Graphics, {StdVCL,} Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  NIDAQmxCAPIMajorVersion = 7;
  NIDAQmxCAPIMinorVersion = 4;

  LIBID_NIDAQmxCAPI: TGUID = '{3F91BB81-371C-4447-A3CF-110B9875D4B0}';


// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum DAQmxTaskMode
type
  DAQmxTaskMode = TOleEnum;
const
  DAQmx_Val_Task_Start = $00000000;
  DAQmx_Val_Task_Stop = $00000001;
  DAQmx_Val_Task_Verify = $00000002;
  DAQmx_Val_Task_Commit = $00000003;
  DAQmx_Val_Task_Reserve = $00000004;
  DAQmx_Val_Task_Unreserve = $00000005;
  DAQmx_Val_Task_Abort = $00000006;

// Constants for enum DAQmxWDTTaskAction
type
  DAQmxWDTTaskAction = TOleEnum;
const
  DAQmx_Val_ResetTimer = $00000000;
  DAQmx_Val_ClearExpiration = $00000001;

// Constants for enum DAQmxLineGrouping
type
  DAQmxLineGrouping = TOleEnum;
const
  DAQmx_Val_ChanPerLine = $00000000;
  DAQmx_Val_ChanForAllLines = $00000001;

// Constants for enum DAQmxFillMode
type
  DAQmxFillMode = TOleEnum;
const
  DAQmx_Val_GroupByChannel = $00000000;
  DAQmx_Val_GroupByScanNumber = $00000001;

// Constants for enum DAQmxSignalModifiers
type
  DAQmxSignalModifiers = TOleEnum;
const
  DAQmx_Val_DoNotInvertPolarity = $00000000;
  DAQmx_Val_InvertPolarity = $00000001;

// Constants for enum DAQmxAction
type
  DAQmxAction = TOleEnum;
const
  DAQmx_Val_Action_Commit = $00000000;
  DAQmx_Val_Action_Cancel = $00000001;

// Constants for enum DAQmxSoftwareTrigger
type
  DAQmxSoftwareTrigger = TOleEnum;
const
  DAQmx_Val_AdvanceTrigger = $000030C8;

// Constants for enum DAQmxEdge
type
  DAQmxEdge = TOleEnum;
const
  DAQmx_Val_Rising = $00002828;
  DAQmx_Val_Falling = $000027BB;

// Constants for enum DAQmxSwitchPathType
type
  DAQmxSwitchPathType = TOleEnum;
const
  DAQmx_Val_PathStatus_Available = $000028BF;
  DAQmx_Val_PathStatus_AlreadyExists = $000028C0;
  DAQmx_Val_PathStatus_Unsupported = $000028C1;
  DAQmx_Val_PathStatus_ChannelInUse = $000028C2;
  DAQmx_Val_PathStatus_SourceChannelConflict = $000028C3;
  DAQmx_Val_PathStatus_ChannelReservedForRouting = $000028C4;

// Constants for enum DAQmxTemperatureUnits
type
  DAQmxTemperatureUnits = TOleEnum;
const
  DAQmx_Val_DegC = $0000279F;
  DAQmx_Val_DegF = $000027A0;
  DAQmx_Val_Kelvins = $00002855;
  DAQmx_Val_DegR = $000027A1;

// Constants for enum DAQmxPowerUpStates
type
  DAQmxPowerUpStates = TOleEnum;
const
  DAQmx_Val_High = $000027D0;
  DAQmx_Val_Low = $000027E6;
  DAQmx_Val_Tristate = $00002846;

// Constants for enum DAQmxPowerUpChannelType
type
  DAQmxPowerUpChannelType = TOleEnum;
const
  DAQmx_Val_ChannelVoltage = $00000000;
  DAQmx_Val_ChannelCurrent = $00000001;

// Constants for enum DAQmxRelayPos
type
  DAQmxRelayPos = TOleEnum;
const
  DAQmx_Val_Open = $000028C5;
  DAQmx_Val_Closed = $000028C6;

// Constants for enum DAQmx_Cfg_Default
type
  DAQmx_Cfg_Default = TOleEnum;
const
  DAQmx_Val_Cfg_Default = $FFFFFFFF;

// Constants for enum DAQmx_Timeout_Values
type
  DAQmx_Timeout_Values = TOleEnum;
const
  DAQmx_Val_WaitInfinitely = $C0800000;

// Constants for enum DAQmx_NumSamples_Values
type
  DAQmx_NumSamples_Values = TOleEnum;
const
  DAQmx_Val_Auto = $FFFFFFFF;

// Constants for enum DAQmx_Save_Options_Values
type
  DAQmx_Save_Options_Values = TOleEnum;
const
  DAQmx_Val_Save_Overwrite = $00000001;
  DAQmx_Val_Save_AllowInteractiveEditing = $00000002;
  DAQmx_Val_Save_AllowInteractiveDeletion = $00000004;

// Constants for enum DAQmxEveryNSamplesEventType
type
  DAQmxEveryNSamplesEventType = TOleEnum;
const
  DAQmx_Val_Acquired_Into_Buffer = 1;
  DAQmx_Val_Transferred_From_Buffer = 2;

// Constants for enum DAQmxACExcitWireMode
type
  DAQmxACExcitWireMode = TOleEnum;
const
  DAQmx_Val_ACExcitWireMode_4Wire = $00000004;
  DAQmx_Val_ACExcitWireMode_5Wire = $00000005;

// Constants for enum DAQmxAIMeasurementType
type
  DAQmxAIMeasurementType = TOleEnum;
const
  DAQmx_Val_AIMeasurementType_Voltage = $00002852;
  DAQmx_Val_AIMeasurementType_Current = $00002796;
  DAQmx_Val_AIMeasurementType_Voltage_CustomWithExcitation = $00002853;
  DAQmx_Val_AIMeasurementType_Freq_Voltage = $000027C5;
  DAQmx_Val_AIMeasurementType_Resistance = $00002826;
  DAQmx_Val_AIMeasurementType_Temp_TC = $0000283F;
  DAQmx_Val_AIMeasurementType_Temp_Thrmstr = $0000283E;
  DAQmx_Val_AIMeasurementType_Temp_RTD = $0000283D;
  DAQmx_Val_AIMeasurementType_Temp_BuiltInSensor = $00002847;
  DAQmx_Val_AIMeasurementType_Strain_Gage = $0000283C;
  DAQmx_Val_AIMeasurementType_Position_LVDT = $00002870;
  DAQmx_Val_AIMeasurementType_Position_RVDT = $00002871;
  DAQmx_Val_AIMeasurementType_Accelerometer = $00002874;
  DAQmx_Val_AIMeasurementType_SoundPressure_Microphone = $00002872;
  DAQmx_Val_AIMeasurementType_TEDS_Sensor = $000030F3;

// Constants for enum DAQmxAOIdleOutputBehavior
type
  DAQmxAOIdleOutputBehavior = TOleEnum;
const
  DAQmx_Val_AOIdleOutputBehavior_ZeroVolts = $000030EE;
  DAQmx_Val_AOIdleOutputBehavior_HighImpedance = $000030EF;
  DAQmx_Val_AOIdleOutputBehavior_MaintainExistingValue = $000030F0;

// Constants for enum DAQmxAOOutputChannelType
type
  DAQmxAOOutputChannelType = TOleEnum;
const
  DAQmx_Val_AOOutputChannelType_Voltage = $00002852;
  DAQmx_Val_AOOutputChannelType_Current = $00002796;

// Constants for enum DAQmxAccelSensitivityUnits1
type
  DAQmxAccelSensitivityUnits1 = TOleEnum;
const
  DAQmx_Val_AccelSensitivityUnits1_mVoltsPerG = $000030DD;
  DAQmx_Val_AccelSensitivityUnits1_VoltsPerG = $000030DE;

// Constants for enum DAQmxAccelUnits2
type
  DAQmxAccelUnits2 = TOleEnum;
const
  DAQmx_Val_AccelUnits2_AccelUnit_g = $000027CA;
  DAQmx_Val_AccelUnits2_MetersPerSecondSquared = $000030B6;
  DAQmx_Val_AccelUnits2_FromCustomScale = $00002751;

// Constants for enum DAQmxAcquisitionType
const
  DAQmx_FiniteSamps = $000027C2;
  DAQmx_ContSamps = $0000278B;
  DAQmx_HWTimedSinglePoint = $000030EA;

// Constants for enum DAQmxActiveLevel
type
  DAQmxActiveLevel = TOleEnum;
const
  DAQmx_Val_ActiveLevel_AboveLvl = $0000276D;
  DAQmx_Val_ActiveLevel_BelowLvl = $0000277B;

// Constants for enum DAQmxAngleUnits1
type
  DAQmxAngleUnits1 = TOleEnum;
const
  DAQmx_Val_AngleUnits1_Degrees = $000027A2;
  DAQmx_Val_AngleUnits1_Radians = $00002821;
  DAQmx_Val_AngleUnits1_FromCustomScale = $00002751;

// Constants for enum DAQmxAngleUnits2
type
  DAQmxAngleUnits2 = TOleEnum;
const
  DAQmx_Val_AngleUnits2_Degrees = $000027A2;
  DAQmx_Val_AngleUnits2_Radians = $00002821;
  DAQmx_Val_AngleUnits2_Ticks = $00002840;
  DAQmx_Val_AngleUnits2_FromCustomScale = $00002751;

// Constants for enum DAQmxAutoZeroType1
type
  DAQmxAutoZeroType1 = TOleEnum;
const
  DAQmx_Val_AutoZeroType1_None = $000027F6;
  DAQmx_Val_AutoZeroType1_Once = $00002804;
  DAQmx_Val_AutoZeroType1_EverySample = $000027B4;

// Constants for enum DAQmxBreakMode
type
  DAQmxBreakMode = TOleEnum;
const
  DAQmx_Val_BreakMode_NoAction = $000027F3;
  DAQmx_Val_BreakMode_BreakBeforeMake = $0000277E;

// Constants for enum DAQmxBridgeConfiguration1
type
  DAQmxBridgeConfiguration1 = TOleEnum;
const
  DAQmx_Val_FullBridge = $000027C6;
  DAQmx_Val_HalfBridge = $000027CB;
  DAQmx_Val_QuarterBridge = $0000281E;
  DAQmx_Val_NoBridge = $000027F4;

  DAQmx_Val_Internal = 10200;
  DAQmx_Val_External = 10167;
  DAQmx_Val_None = 10168;

  DAQmx_Val_VoltsPerVolt = 15896; // Volts/Volt
  DAQmx_Val_mVoltsPerVolt = 15897; // mVolts/Volt
  DAQmx_Val_FromCustomScale = 10065; // From Custom Scale
  DAQmx_Val_FromTEDS = 12516; // From TEDS

// Constants for enum DAQmxBusType
type
  DAQmxBusType = TOleEnum;
const
  DAQmx_Val_BusType_PCI = $00003126;
  DAQmx_Val_BusType_PCIe = $0000352C;
  DAQmx_Val_BusType_PXI = $00003127;
  DAQmx_Val_BusType_SCXI = $00003128;
  DAQmx_Val_BusType_PCCard = $00003129;
  DAQmx_Val_BusType_USB = $0000312A;
  DAQmx_Val_BusType_CompactDAQ = $0000392D;
  DAQmx_Val_BusType_Unknown = $0000312C;

// Constants for enum DAQmxCIMeasurementType
type
  DAQmxCIMeasurementType = TOleEnum;
const
  DAQmx_Val_CIMeasurementType_CountEdges = $0000278D;
  DAQmx_Val_CIMeasurementType_Freq = $000027C3;
  DAQmx_Val_CIMeasurementType_Period = $00002810;
  DAQmx_Val_CIMeasurementType_PulseWidth = $00002877;
  DAQmx_Val_CIMeasurementType_SemiPeriod = $00002831;
  DAQmx_Val_CIMeasurementType_Position_AngEncoder = $00002878;
  DAQmx_Val_CIMeasurementType_Position_LinEncoder = $00002879;
  DAQmx_Val_CIMeasurementType_TwoEdgeSep = $0000281B;
  DAQmx_Val_CIMeasurementType_GPS_Timestamp = $0000287A;

// Constants for enum DAQmxCJCSource1
type
  DAQmxCJCSource1 = TOleEnum;
const
  DAQmx_Val_CJCSource1_BuiltIn = $000027D8;
  DAQmx_Val_CJCSource1_ConstVal = $00002784;
  DAQmx_Val_CJCSource1_Chan = $00002781;

// Constants for enum DAQmxCOOutputType
type
  DAQmxCOOutputType = TOleEnum;
const
  DAQmx_Val_COOutputType_Pulse_Time = $0000281D;
  DAQmx_Val_COOutputType_Pulse_Freq = $00002787;
  DAQmx_Val_COOutputType_Pulse_Ticks = $0000281C;

// Constants for enum DAQmxChannelType
type
  DAQmxChannelType = TOleEnum;
const
  DAQmx_Val_ChannelType_AI = $00002774;
  DAQmx_Val_ChannelType_AO = $00002776;
  DAQmx_Val_ChannelType_DI = $000027A7;
  DAQmx_Val_ChannelType_DO = $000027A9;
  DAQmx_Val_ChannelType_CI = $00002793;
  DAQmx_Val_ChannelType_CO = $00002794;

// Constants for enum DAQmxCountDirection1
type
  DAQmxCountDirection1 = TOleEnum;
const
  DAQmx_Val_CountDirection1_CountUp = $00002790;
  DAQmx_Val_CountDirection1_CountDown = $0000278C;
  DAQmx_Val_CountDirection1_ExtControlled = $00002856;

// Constants for enum DAQmxCounterFrequencyMethod
type
  DAQmxCounterFrequencyMethod = TOleEnum;
const
  DAQmx_Val_CounterFrequencyMethod_LowFreq1Ctr = $00002779;
  DAQmx_Val_CounterFrequencyMethod_HighFreq2Ctr = $000027AD;
  DAQmx_Val_CounterFrequencyMethod_LargeRng2Ctr = $000027DD;

// Constants for enum DAQmxCoupling1
type
  DAQmxCoupling1 = TOleEnum;
const
  DAQmx_Val_Coupling1_AC = $0000273D;
  DAQmx_Val_Coupling1_DC = $00002742;
  DAQmx_Val_Coupling1_GND = $00002752;

// Constants for enum DAQmxCoupling2
type
  DAQmxCoupling2 = TOleEnum;
const
  DAQmx_Val_Coupling2_AC = $0000273D;
  DAQmx_Val_Coupling2_DC = $00002742;

// Constants for enum DAQmxCurrentShuntResistorLocation1
type
  DAQmxCurrentShuntResistorLocation1 = TOleEnum;
const
  DAQmx_Val_CurrentShuntResistorLocation1_Internal = $000027D8;
  DAQmx_Val_CurrentShuntResistorLocation1_External = $000027B7;

// Constants for enum DAQmxCurrentUnits1
type
  DAQmxCurrentUnits1 = TOleEnum;
const
  DAQmx_Val_CurrentUnits1_Amps = $00002866;
  DAQmx_Val_CurrentUnits1_FromCustomScale = $00002751;
  DAQmx_Val_CurrentUnits1_FromTEDS = $000030E4;

// Constants for enum DAQmxCurrentUnits2
type
  DAQmxCurrentUnits2 = TOleEnum;
const
  DAQmx_Val_CurrentUnits2_Amps = $00002866;
  DAQmx_Val_CurrentUnits2_FromCustomScale = $00002751;

// Constants for enum DAQmxDataJustification1
type
  DAQmxDataJustification1 = TOleEnum;
const
  DAQmx_Val_DataJustification1_RightJustified = $00002827;
  DAQmx_Val_DataJustification1_LeftJustified = $000027E1;

// Constants for enum DAQmxDataTransferMechanism
type
  DAQmxDataTransferMechanism = TOleEnum;
const
  DAQmx_Val_DataTransferMechanism_DMA = $00002746;
  DAQmx_Val_DataTransferMechanism_Interrupts = $000027DC;
  DAQmx_Val_DataTransferMechanism_ProgrammedIO = $00002818;
  DAQmx_Val_DataTransferMechanism_USBbulk = $0000312E;

// Constants for enum DAQmxDeassertCondition
type
  DAQmxDeassertCondition = TOleEnum;
const
  DAQmx_Val_DeassertCondition_OnbrdMemMoreThanHalfFull = $000027FD;
  DAQmx_Val_DeassertCondition_OnbrdMemFull = $000027FC;
  DAQmx_Val_DeassertCondition_OnbrdMemCustomThreshold = $00003121;

// Constants for enum DAQmxDigitalDriveType
type
  DAQmxDigitalDriveType = TOleEnum;
const
  DAQmx_Val_DigitalDriveType_ActiveDrive = $0000311D;
  DAQmx_Val_DigitalDriveType_OpenCollector = $0000311E;

// Constants for enum DAQmxDigitalLineState
type
  DAQmxDigitalLineState = TOleEnum;
const
  DAQmx_Val_DigitalLineState_High = $000027D0;
  DAQmx_Val_DigitalLineState_Low = $000027E6;
  DAQmx_Val_DigitalLineState_Tristate = $00002846;
  DAQmx_Val_DigitalLineState_NoChange = $000027B0;

// Constants for enum DAQmxDigitalPatternCondition1
type
  DAQmxDigitalPatternCondition1 = TOleEnum;
const
  DAQmx_Val_DigitalPatternCondition1_PatternMatches = $0000280E;
  DAQmx_Val_DigitalPatternCondition1_PatternDoesNotMatch = $0000280D;

// Constants for enum DAQmxDigitalWidthUnits1
type
  DAQmxDigitalWidthUnits1 = TOleEnum;
const
  DAQmx_Val_DigitalWidthUnits1_SampClkPeriods = $0000282E;
  DAQmx_Val_DigitalWidthUnits1_Seconds = $0000287C;
  DAQmx_Val_DigitalWidthUnits1_Ticks = $00002840;

// Constants for enum DAQmxDigitalWidthUnits2
type
  DAQmxDigitalWidthUnits2 = TOleEnum;
const
  DAQmx_Val_DigitalWidthUnits2_Seconds = $0000287C;
  DAQmx_Val_DigitalWidthUnits2_Ticks = $00002840;

// Constants for enum DAQmxDigitalWidthUnits3
type
  DAQmxDigitalWidthUnits3 = TOleEnum;
const
  DAQmx_Val_DigitalWidthUnits3_Seconds = $0000287C;

// Constants for enum DAQmxEdge1
type
  DAQmxEdge1 = TOleEnum;
const
  DAQmx_Val_Edge1_Rising = $00002828;
  DAQmx_Val_Edge1_Falling = $000027BB;

// Constants for enum DAQmxEncoderType2
type
  DAQmxEncoderType2 = TOleEnum;
const
  DAQmx_Val_EncoderType2_X1 = $0000276A;
  DAQmx_Val_EncoderType2_X2 = $0000276B;
  DAQmx_Val_EncoderType2_X4 = $0000276C;
  DAQmx_Val_EncoderType2_TwoPulseCounting = $00002849;

// Constants for enum DAQmxEncoderZIndexPhase1
type
  DAQmxEncoderZIndexPhase1 = TOleEnum;
const
  DAQmx_Val_EncoderZIndexPhase1_AHighBHigh = $00002738;
  DAQmx_Val_EncoderZIndexPhase1_AHighBLow = $00002739;
  DAQmx_Val_EncoderZIndexPhase1_ALowBHigh = $0000273A;
  DAQmx_Val_EncoderZIndexPhase1_ALowBLow = $0000273B;

// Constants for enum DAQmxExcitationDCorAC
type
  DAQmxExcitationDCorAC = TOleEnum;
const
  DAQmx_Val_ExcitationDCorAC_DC = $00002742;
  DAQmx_Val_ExcitationDCorAC_AC = $0000273D;

// Constants for enum DAQmxExcitationSource
type
  DAQmxExcitationSource = TOleEnum;
const
  DAQmx_Val_ExcitationSource_Internal = $000027D8;
  DAQmx_Val_ExcitationSource_External = $000027B7;
  DAQmx_Val_ExcitationSource_None = $000027F6;

// Constants for enum DAQmxExcitationVoltageOrCurrent
type
  DAQmxExcitationVoltageOrCurrent = TOleEnum;
const
  DAQmx_Val_ExcitationVoltageOrCurrent_Voltage = $00002852;
  DAQmx_Val_ExcitationVoltageOrCurrent_Current = $00002796;

// Constants for enum DAQmxExportActions2
type
  DAQmxExportActions2 = TOleEnum;
const
  DAQmx_Val_ExportActions2_Pulse = $00002819;
  DAQmx_Val_ExportActions2_Toggle = $00002843;

// Constants for enum DAQmxExportActions3
type
  DAQmxExportActions3 = TOleEnum;
const
  DAQmx_Val_ExportActions3_Pulse = $00002819;
  DAQmx_Val_ExportActions3_Lvl = $000027E2;

// Constants for enum DAQmxExportActions5
type
  DAQmxExportActions5 = TOleEnum;
const
  DAQmx_Val_ExportActions5_Interlocked = $00003105;
  DAQmx_Val_ExportActions5_Pulse = $00002819;

// Constants for enum DAQmxFrequencyUnits
type
  DAQmxFrequencyUnits = TOleEnum;
const
  DAQmx_Val_FrequencyUnits_Hz = $00002885;
  DAQmx_Val_FrequencyUnits_FromCustomScale = $00002751;

// Constants for enum DAQmxFrequencyUnits2
type
  DAQmxFrequencyUnits2 = TOleEnum;
const
  DAQmx_Val_FrequencyUnits2_Hz = $00002885;

// Constants for enum DAQmxFrequencyUnits3
type
  DAQmxFrequencyUnits3 = TOleEnum;
const
  DAQmx_Val_FrequencyUnits3_Hz = $00002885;
  DAQmx_Val_FrequencyUnits3_Ticks = $00002840;
  DAQmx_Val_FrequencyUnits3_FromCustomScale = $00002751;

// Constants for enum DAQmxGpsSignalType1
type
  DAQmxGpsSignalType1 = TOleEnum;
const
  DAQmx_Val_GpsSignalType1_IRIGB = $00002756;
  DAQmx_Val_GpsSignalType1_PPS = $00002760;
  DAQmx_Val_GpsSignalType1_None = $000027F6;

// Constants for enum DAQmxHandshakeStartCondition
type
  DAQmxHandshakeStartCondition = TOleEnum;
const
  DAQmx_Val_HandshakeStartCondition_Immediate = $000027D6;
  DAQmx_Val_HandshakeStartCondition_WaitForHandshakeTriggerAssert = $00003106;
  DAQmx_Val_HandshakeStartCondition_WaitForHandshakeTriggerDeassert = $00003107;

// Constants for enum DAQmxInputDataTransferCondition
type
  DAQmxInputDataTransferCondition = TOleEnum;
const
  DAQmx_Val_InputDataTransferCondition_OnBrdMemMoreThanHalfFull = $000027FD;
  DAQmx_Val_InputDataTransferCondition_OnBrdMemNotEmpty = $00002801;
  DAQmx_Val_InputDataTransferCondition_OnbrdMemCustomThreshold = $00003121;
  DAQmx_Val_InputDataTransferCondition_WhenAcqComplete = $00003102;

// Constants for enum DAQmxInputTermCfg
type
  DAQmxInputTermCfg = TOleEnum;
const
  DAQmx_Val_InputTermCfg_RSE = $00002763;
  DAQmx_Val_InputTermCfg_NRSE = $0000275E;
  DAQmx_Val_InputTermCfg_Diff = $0000277A;
  DAQmx_Val_InputTermCfg_PseudoDiff = $000030F1;

// Constants for enum DAQmxLVDTSensitivityUnits1
type
  DAQmxLVDTSensitivityUnits1 = TOleEnum;
const
  DAQmx_Val_LVDTSensitivityUnits1_mVoltsPerVoltPerMillimeter = $000030DA;
  DAQmx_Val_LVDTSensitivityUnits1_mVoltsPerVoltPerMilliInch = $000030D9;

// Constants for enum DAQmxLengthUnits2
type
  DAQmxLengthUnits2 = TOleEnum;
const
  DAQmx_Val_LengthUnits2_Meters = $000027EB;
  DAQmx_Val_LengthUnits2_Inches = $0000288B;
  DAQmx_Val_LengthUnits2_FromCustomScale = $00002751;

// Constants for enum DAQmxLengthUnits3
type
  DAQmxLengthUnits3 = TOleEnum;
const
  DAQmx_Val_LengthUnits3_Meters = $000027EB;
  DAQmx_Val_LengthUnits3_Inches = $0000288B;
  DAQmx_Val_LengthUnits3_Ticks = $00002840;
  DAQmx_Val_LengthUnits3_FromCustomScale = $00002751;

// Constants for enum DAQmxLevel1
type
  DAQmxLevel1 = TOleEnum;
const
  DAQmx_Val_Level1_High = $000027D0;
  DAQmx_Val_Level1_Low = $000027E6;

// Constants for enum DAQmxLogicFamily
type
  DAQmxLogicFamily = TOleEnum;
const
  DAQmx_Val_LogicFamily_2point5V = $0000391C;
  DAQmx_Val_LogicFamily_3point3V = $0000391D;
  DAQmx_Val_LogicFamily_5V = $0000391B;

// Constants for enum DAQmxMIOAIConvertTbSrc
type
  DAQmxMIOAIConvertTbSrc = TOleEnum;
const
  DAQmx_Val_MIOAIConvertTbSrc_SameAsSampTimebase = $0000282C;
  DAQmx_Val_MIOAIConvertTbSrc_SameAsMasterTimebase = $0000282A;
  DAQmx_Val_MIOAIConvertTbSrc_20MHzTimebase = $000030F9;
  DAQmx_Val_MIOAIConvertTbSrc_80MHzTimebase = $0000392C;

// Constants for enum DAQmxOutputDataTransferCondition
type
  DAQmxOutputDataTransferCondition = TOleEnum;
const
  DAQmx_Val_OutputDataTransferCondition_OnBrdMemEmpty = $000027FB;
  DAQmx_Val_OutputDataTransferCondition_OnBrdMemHalfFullOrLess = $000027FF;
  DAQmx_Val_OutputDataTransferCondition_OnBrdMemNotFull = $00002802;

// Constants for enum DAQmxOutputTermCfg
type
  DAQmxOutputTermCfg = TOleEnum;
const
  DAQmx_Val_OutputTermCfg_RSE = $00002763;
  DAQmx_Val_OutputTermCfg_Diff = $0000277A;
  DAQmx_Val_OutputTermCfg_PseudoDiff = $000030F1;

// Constants for enum DAQmxOverwriteMode1
type
  DAQmxOverwriteMode1 = TOleEnum;
const
  DAQmx_Val_OverwriteMode1_OverwriteUnreadSamps = $0000280C;
  DAQmx_Val_OverwriteMode1_DoNotOverwriteUnreadSamps = $000027AF;

// Constants for enum DAQmxPolarity2
type
  DAQmxPolarity2 = TOleEnum;
const
  DAQmx_Val_Polarity2_ActiveHigh = $0000276F;
  DAQmx_Val_Polarity2_ActiveLow = $00002770;

// Constants for enum DAQmxProductCategory
type
  DAQmxProductCategory = TOleEnum;
const
  DAQmx_Val_ProductCategory_MSeriesDAQ = $00003933;
  DAQmx_Val_ProductCategory_ESeriesDAQ = $00003932;
  DAQmx_Val_ProductCategory_SSeriesDAQ = $00003934;
  DAQmx_Val_ProductCategory_BSeriesDAQ = $00003946;
  DAQmx_Val_ProductCategory_SCSeriesDAQ = $00003935;
  DAQmx_Val_ProductCategory_USBDAQ = $00003936;
  DAQmx_Val_ProductCategory_AOSeries = $00003937;
  DAQmx_Val_ProductCategory_DigitalIO = $00003938;
  DAQmx_Val_ProductCategory_TIOSeries = $00003945;
  DAQmx_Val_ProductCategory_DynamicSignalAcquisition = $00003939;
  DAQmx_Val_ProductCategory_Switches = $0000393A;
  DAQmx_Val_ProductCategory_CompactDAQChassis = $00003942;
  DAQmx_Val_ProductCategory_CSeriesModule = $00003943;
  DAQmx_Val_ProductCategory_SCXIModule = $00003944;
  DAQmx_Val_ProductCategory_Unknown = $0000312C;

// Constants for enum DAQmxRTDType1
type
  DAQmxRTDType1 = TOleEnum;
const
  DAQmx_Val_RTDType1_Pt3750 = $000030C1;
  DAQmx_Val_RTDType1_Pt3851 = $00002757;
  DAQmx_Val_RTDType1_Pt3911 = $000030C2;
  DAQmx_Val_RTDType1_Pt3916 = $00002755;
  DAQmx_Val_RTDType1_Pt3920 = $00002745;
  DAQmx_Val_RTDType1_Pt3928 = $000030C3;
  DAQmx_Val_RTDType1_Custom = $00002799;

// Constants for enum DAQmxRVDTSensitivityUnits1
type
  DAQmxRVDTSensitivityUnits1 = TOleEnum;
const
  DAQmx_Val_RVDTSensitivityUnits1_mVoltsPerVoltPerDegree = $000030DB;
  DAQmx_Val_RVDTSensitivityUnits1_mVoltsPerVoltPerRadian = $000030DC;

// Constants for enum DAQmxRawDataCompressionType
type
  DAQmxRawDataCompressionType = TOleEnum;
const
  DAQmx_Val_RawDataCompressionType_None = $000027F6;
  DAQmx_Val_RawDataCompressionType_LosslessPacking = $0000310B;
  DAQmx_Val_RawDataCompressionType_LossyLSBRemoval = $0000310C;

// Constants for enum DAQmxReadRelativeTo
type
  DAQmxReadRelativeTo = TOleEnum;
const
  DAQmx_Val_ReadRelativeTo_FirstSample = $000028B8;
  DAQmx_Val_ReadRelativeTo_CurrReadPos = $000028B9;
  DAQmx_Val_ReadRelativeTo_RefTrig = $000028BA;
  DAQmx_Val_ReadRelativeTo_FirstPretrigSamp = $000028BB;
  DAQmx_Val_ReadRelativeTo_MostRecentSamp = $000028BC;

// Constants for enum DAQmxRegenerationMode1
type
  DAQmxRegenerationMode1 = TOleEnum;
const
  DAQmx_Val_RegenerationMode1_AllowRegen = $00002771;
  DAQmx_Val_RegenerationMode1_DoNotAllowRegen = $000027AE;

// Constants for enum DAQmxResistanceConfiguration
type
  DAQmxResistanceConfiguration = TOleEnum;
const
  DAQmx_Val_ResistanceConfiguration_2Wire = $00000002;
  DAQmx_Val_ResistanceConfiguration_3Wire = $00000003;
  DAQmx_Val_ResistanceConfiguration_4Wire = $00000004;

// Constants for enum DAQmxResistanceUnits1
type
  DAQmxResistanceUnits1 = TOleEnum;
const
  DAQmx_Val_ResistanceUnits1_Ohms = $00002890;
  DAQmx_Val_ResistanceUnits1_FromCustomScale = $00002751;
  DAQmx_Val_ResistanceUnits1_FromTEDS = $000030E4;

// Constants for enum DAQmxResistanceUnits2
type
  DAQmxResistanceUnits2 = TOleEnum;
const
  DAQmx_Val_ResistanceUnits2_Ohms = $00002890;
  DAQmx_Val_ResistanceUnits2_FromCustomScale = $00002751;

// Constants for enum DAQmxResolutionType1
type
  DAQmxResolutionType1 = TOleEnum;
const
  DAQmx_Val_ResolutionType1_Bits = $0000277D;

// Constants for enum DAQmxSCXI1124Range
type
  DAQmxSCXI1124Range = TOleEnum;
const
  DAQmx_Val_SCXI1124Range_SCXI1124Range0to1V = $00003925;
  DAQmx_Val_SCXI1124Range_SCXI1124Range0to5V = $00003926;
  DAQmx_Val_SCXI1124Range_SCXI1124Range0to10V = $00003927;
  DAQmx_Val_SCXI1124Range_SCXI1124RangeNeg1to1V = $00003928;
  DAQmx_Val_SCXI1124Range_SCXI1124RangeNeg5to5V = $00003929;
  DAQmx_Val_SCXI1124Range_SCXI1124RangeNeg10to10V = $0000392A;
  DAQmx_Val_SCXI1124Range_SCXI1124Range0to20mA = $0000392B;

// Constants for enum DAQmxSampleClockActiveOrInactiveEdgeSelection
type
  DAQmxSampleClockActiveOrInactiveEdgeSelection = TOleEnum;
const
  DAQmx_Val_SampleClockActiveOrInactiveEdgeSelection_SampClkActiveEdge = $00003919;
  DAQmx_Val_SampleClockActiveOrInactiveEdgeSelection_SampClkInactiveEdge = $0000391A;

// Constants for enum DAQmxSampleInputDataWhen
type
  DAQmxSampleInputDataWhen = TOleEnum;
const
  DAQmx_Val_SampleInputDataWhen_HandshakeTriggerAsserts = $00003108;
  DAQmx_Val_SampleInputDataWhen_HandshakeTriggerDeasserts = $00003109;

// Constants for enum DAQmxSampleTimingType
type
  DAQmxSampleTimingType = TOleEnum;
const
  DAQmx_Val_SampleTimingType_SampClk = $00002894;
  DAQmx_Val_SampleTimingType_BurstHandshake = $00003104;
  DAQmx_Val_SampleTimingType_Handshake = $00002895;
  DAQmx_Val_SampleTimingType_Implicit = $000028D3;
  DAQmx_Val_SampleTimingType_OnDemand = $00002896;
  DAQmx_Val_SampleTimingType_ChangeDetection = $000030D8;
  DAQmx_Val_SampleTimingType_PipelinedSampClk = $0000394C;

// Constants for enum DAQmxScaleType
type
  DAQmxScaleType = TOleEnum;
const
  DAQmx_Val_ScaleType_Linear = $000028CF;
  DAQmx_Val_ScaleType_MapRanges = $000028D0;
  DAQmx_Val_ScaleType_Polynomial = $000028D1;
  DAQmx_Val_ScaleType_Table = $000028D2;

// Constants for enum DAQmxScaleType2
type
  DAQmxScaleType2 = TOleEnum;
const
  DAQmx_Val_ScaleType2_Polynomial = $000028D1;
  DAQmx_Val_ScaleType2_Table = $000028D2;

// Constants for enum DAQmxShuntCalSelect
type
  DAQmxShuntCalSelect = TOleEnum;
const
  DAQmx_Val_ShuntCalSelect_A = $000030E1;
  DAQmx_Val_ShuntCalSelect_B = $000030E2;
  DAQmx_Val_ShuntCalSelect_AandB = $000030E3;

// Constants for enum DAQmxSignal
type
  DAQmxSignal = TOleEnum;
const
  DAQmx_Val_Signal_AIConvertClock = $000030C4;
  DAQmx_Val_Signal_10MHzRefClock = $000030F8;
  DAQmx_Val_Signal_20MHzTimebaseClock = $000030C6;
  DAQmx_Val_Signal_SampleClock = $000030C7;
  DAQmx_Val_Signal_AdvanceTrigger = $000030C8;
  DAQmx_Val_Signal_ReferenceTrigger = $000030CA;
  DAQmx_Val_Signal_StartTrigger = $000030CB;
  DAQmx_Val_Signal_AdvCmpltEvent = $000030CC;
  DAQmx_Val_Signal_AIHoldCmpltEvent = $000030CD;
  DAQmx_Val_Signal_CounterOutputEvent = $000030CE;
  DAQmx_Val_Signal_ChangeDetectionEvent = $000030DF;
  DAQmx_Val_Signal_WDTExpiredEvent = $000030E0;

// Constants for enum DAQmxSignal2
type
  DAQmxSignal2 = TOleEnum;
const
  DAQmx_Val_Signal2_SampleCompleteEvent = $000030F2;
  DAQmx_Val_Signal2_CounterOutputEvent = $000030CE;
  DAQmx_Val_Signal2_ChangeDetectionEvent = $000030DF;
  DAQmx_Val_Signal2_SampleClock = $000030C7;

// Constants for enum DAQmxSlope1
type
  DAQmxSlope1 = TOleEnum;
const
  DAQmx_Val_Slope1_RisingSlope = $00002828;
  DAQmx_Val_Slope1_FallingSlope = $000027BB;

// Constants for enum DAQmxSoundPressureUnits1
type
  DAQmxSoundPressureUnits1 = TOleEnum;
const
  DAQmx_Val_SoundPressureUnits1_Pascals = $00002761;
  DAQmx_Val_SoundPressureUnits1_FromCustomScale = $00002751;

// Constants for enum DAQmxSourceSelection
type
  DAQmxSourceSelection = TOleEnum;
const
  DAQmx_Val_SourceSelection_Internal = $000027D8;
  DAQmx_Val_SourceSelection_External = $000027B7;

// Constants for enum DAQmxStrainGageBridgeType1
type
  DAQmxStrainGageBridgeType1 = TOleEnum;
const
  DAQmx_Val_StrainGageBridgeType1_FullBridgeI = $000027C7;
  DAQmx_Val_StrainGageBridgeType1_FullBridgeII = $000027C8;
  DAQmx_Val_StrainGageBridgeType1_FullBridgeIII = $000027C9;
  DAQmx_Val_StrainGageBridgeType1_HalfBridgeI = $000027CC;
  DAQmx_Val_StrainGageBridgeType1_HalfBridgeII = $000027CD;
  DAQmx_Val_StrainGageBridgeType1_QuarterBridgeI = $0000281F;
  DAQmx_Val_StrainGageBridgeType1_QuarterBridgeII = $00002820;

// Constants for enum DAQmxStrainUnits1
type
  DAQmxStrainUnits1 = TOleEnum;
const
  DAQmx_Val_StrainUnits1_Strain = $0000283B;
  DAQmx_Val_StrainUnits1_FromCustomScale = $00002751;

// Constants for enum DAQmxSwitchScanRepeatMode
type
  DAQmxSwitchScanRepeatMode = TOleEnum;
const
  DAQmx_Val_SwitchScanRepeatMode_Finite = $000027BC;
  DAQmx_Val_SwitchScanRepeatMode_Cont = $00002785;

// Constants for enum DAQmxSwitchUsageTypes
type
  DAQmxSwitchUsageTypes = TOleEnum;
const
  DAQmx_Val_SwitchUsageTypes_Source = $000028C7;
  DAQmx_Val_SwitchUsageTypes_Load = $000028C8;
  DAQmx_Val_SwitchUsageTypes_ReservedForRouting = $000028C9;

// Constants for enum DAQmxTEDSUnits
type
  DAQmxTEDSUnits = TOleEnum;
const
  DAQmx_Val_TEDSUnits_FromCustomScale = $00002751;
  DAQmx_Val_TEDSUnits_FromTEDS = $000030E4;

// Constants for enum DAQmxTemperatureUnits1
type
  DAQmxTemperatureUnits1 = TOleEnum;
const
  DAQmx_Val_TemperatureUnits1_DegC = $0000279F;
  DAQmx_Val_TemperatureUnits1_DegF = $000027A0;
  DAQmx_Val_TemperatureUnits1_Kelvins = $00002855;
  DAQmx_Val_TemperatureUnits1_DegR = $000027A1;
  DAQmx_Val_TemperatureUnits1_FromCustomScale = $00002751;

// Constants for enum DAQmxThermocoupleType1
type
  DAQmxThermocoupleType1 = TOleEnum;
const
  DAQmx_Val_ThermocoupleType1_J_Type_TC = $00002758;
  DAQmx_Val_ThermocoupleType1_K_Type_TC = $00002759;
  DAQmx_Val_ThermocoupleType1_N_Type_TC = $0000275D;
  DAQmx_Val_ThermocoupleType1_R_Type_TC = $00002762;
  DAQmx_Val_ThermocoupleType1_S_Type_TC = $00002765;
  DAQmx_Val_ThermocoupleType1_T_Type_TC = $00002766;
  DAQmx_Val_ThermocoupleType1_B_Type_TC = $0000273F;
  DAQmx_Val_ThermocoupleType1_E_Type_TC = $00002747;

// Constants for enum DAQmxTimeUnits
type
  DAQmxTimeUnits = TOleEnum;
const
  DAQmx_Val_TimeUnits_Seconds = $0000287C;
  DAQmx_Val_TimeUnits_FromCustomScale = $00002751;

// Constants for enum DAQmxTimeUnits2
type
  DAQmxTimeUnits2 = TOleEnum;
const
  DAQmx_Val_TimeUnits2_Seconds = $0000287C;

// Constants for enum DAQmxTimeUnits3
type
  DAQmxTimeUnits3 = TOleEnum;
const
  DAQmx_Val_TimeUnits3_Seconds = $0000287C;
  DAQmx_Val_TimeUnits3_Ticks = $00002840;
  DAQmx_Val_TimeUnits3_FromCustomScale = $00002751;

// Constants for enum DAQmxTimingResponseMode
type
  DAQmxTimingResponseMode = TOleEnum;
const
  DAQmx_Val_TimingResponseMode_SingleCycle = $00003915;
  DAQmx_Val_TimingResponseMode_Multicycle = $00003916;

// Constants for enum DAQmxTriggerType4
type
  DAQmxTriggerType4 = TOleEnum;
const
  DAQmx_Val_TriggerType4_DigEdge = $000027A6;
  DAQmx_Val_TriggerType4_None = $000027F6;

// Constants for enum DAQmxTriggerType5
type
  DAQmxTriggerType5 = TOleEnum;
const
  DAQmx_Val_TriggerType5_DigEdge = $000027A6;
  DAQmx_Val_TriggerType5_Software = $00002834;
  DAQmx_Val_TriggerType5_None = $000027F6;

// Constants for enum DAQmxTriggerType6
type
  DAQmxTriggerType6 = TOleEnum;
const
  DAQmx_Val_TriggerType6_AnlgLvl = $00002775;
  DAQmx_Val_TriggerType6_AnlgWin = $00002777;
  DAQmx_Val_TriggerType6_DigLvl = $000027A8;
  DAQmx_Val_TriggerType6_DigPattern = $0000289E;
  DAQmx_Val_TriggerType6_None = $000027F6;

// Constants for enum DAQmxTriggerType8
type
  DAQmxTriggerType8 = TOleEnum;
const
  DAQmx_Val_TriggerType8_AnlgEdge = $00002773;
  DAQmx_Val_TriggerType8_DigEdge = $000027A6;
  DAQmx_Val_TriggerType8_DigPattern = $0000289E;
  DAQmx_Val_TriggerType8_AnlgWin = $00002777;
  DAQmx_Val_TriggerType8_None = $000027F6;

// Constants for enum DAQmxTriggerType9
type
  DAQmxTriggerType9 = TOleEnum;
const
  DAQmx_Val_TriggerType9_Interlocked = $00003105;
  DAQmx_Val_TriggerType9_None = $000027F6;

// Constants for enum DAQmxUnderflowBehavior
type
  DAQmxUnderflowBehavior = TOleEnum;
const
  DAQmx_Val_UnderflowBehavior_HaltOutputAndError = $00003917;
  DAQmx_Val_UnderflowBehavior_PauseUntilDataAvailable = $00003918;

// Constants for enum DAQmxUnitsPreScaled
type
  DAQmxUnitsPreScaled = TOleEnum;
const
  DAQmx_Val_UnitsPreScaled_Volts = $0000286C;
  DAQmx_Val_UnitsPreScaled_Amps = $00002866;
  DAQmx_Val_UnitsPreScaled_DegF = $000027A0;
  DAQmx_Val_UnitsPreScaled_DegC = $0000279F;
  DAQmx_Val_UnitsPreScaled_DegR = $000027A1;
  DAQmx_Val_UnitsPreScaled_Kelvins = $00002855;
  DAQmx_Val_UnitsPreScaled_Strain = $0000283B;
  DAQmx_Val_UnitsPreScaled_Ohms = $00002890;
  DAQmx_Val_UnitsPreScaled_Hz = $00002885;
  DAQmx_Val_UnitsPreScaled_Seconds = $0000287C;
  DAQmx_Val_UnitsPreScaled_Meters = $000027EB;
  DAQmx_Val_UnitsPreScaled_Inches = $0000288B;
  DAQmx_Val_UnitsPreScaled_Degrees = $000027A2;
  DAQmx_Val_UnitsPreScaled_Radians = $00002821;
  DAQmx_Val_UnitsPreScaled_g = $000027CA;
  DAQmx_Val_UnitsPreScaled_MetersPerSecondSquared = $000030B6;
  DAQmx_Val_UnitsPreScaled_Pascals = $00002761;
  DAQmx_Val_UnitsPreScaled_FromTEDS = $000030E4;

// Constants for enum DAQmxVoltageUnits1
type
  DAQmxVoltageUnits1 = TOleEnum;
const
  DAQmx_Val_VoltageUnits1_Volts = $0000286C;
  DAQmx_Val_VoltageUnits1_FromCustomScale = $00002751;
  DAQmx_Val_VoltageUnits1_FromTEDS = $000030E4;

// Constants for enum DAQmxVoltageUnits2
type
  DAQmxVoltageUnits2 = TOleEnum;
const
  DAQmx_Val_VoltageUnits2_Volts = $0000286C;
  DAQmx_Val_VoltageUnits2_FromCustomScale = $00002751;

// Constants for enum DAQmxWaitMode
type
  DAQmxWaitMode = TOleEnum;
const
  DAQmx_Val_WaitMode_WaitForInterrupt = $000030EB;
  DAQmx_Val_WaitMode_Poll = $000030EC;
  DAQmx_Val_WaitMode_Yield = $000030ED;
  DAQmx_Val_WaitMode_Sleep = $00003103;

// Constants for enum DAQmxWaitMode2
type
  DAQmxWaitMode2 = TOleEnum;
const
  DAQmx_Val_WaitMode2_Poll = $000030EC;
  DAQmx_Val_WaitMode2_Yield = $000030ED;
  DAQmx_Val_WaitMode2_Sleep = $00003103;

// Constants for enum DAQmxWaitMode3
type
  DAQmxWaitMode3 = TOleEnum;
const
  DAQmx_Val_WaitMode3_WaitForInterrupt = $000030EB;
  DAQmx_Val_WaitMode3_Poll = $000030EC;

// Constants for enum DAQmxWaitMode4
type
  DAQmxWaitMode4 = TOleEnum;
const
  DAQmx_Val_WaitMode4_WaitForInterrupt = $000030EB;
  DAQmx_Val_WaitMode4_Poll = $000030EC;

// Constants for enum DAQmxWindowTriggerCondition1
type
  DAQmxWindowTriggerCondition1 = TOleEnum;
const
  DAQmx_Val_WindowTriggerCondition1_EnteringWin = $000027B3;
  DAQmx_Val_WindowTriggerCondition1_LeavingWin = $000027E0;

// Constants for enum DAQmxWindowTriggerCondition2
type
  DAQmxWindowTriggerCondition2 = TOleEnum;
const
  DAQmx_Val_WindowTriggerCondition2_InsideWin = $000027D7;
  DAQmx_Val_WindowTriggerCondition2_OutsideWin = $0000280B;

// Constants for enum DAQmxWriteBasicTEDSOptions
type
  DAQmxWriteBasicTEDSOptions = TOleEnum;
const
  DAQmx_Val_WriteBasicTEDSOptions_WriteToEEPROM = $000030FA;
  DAQmx_Val_WriteBasicTEDSOptions_WriteToPROM = $000030FB;
  DAQmx_Val_WriteBasicTEDSOptions_DoNotWrite = $000030FC;

// Constants for enum DAQmxWriteRelativeTo
type
  DAQmxWriteRelativeTo = TOleEnum;
const
  DAQmx_Val_WriteRelativeTo_FirstSample = $000028B8;
  DAQmx_Val_WriteRelativeTo_CurrWritePos = $000028BE;

// Constants for enum __MIDL___MIDL_itf_NIDAQmx_0000_0001
type
  __MIDL___MIDL_itf_NIDAQmx_0000_0001 = TOleEnum;
const
  DAQmxSuccess = $00000000;
  ErrorCOCannotKeepUpInHWTimedSinglePoint = $FFFCCC73;
  ErrorWaitForNextSampClkDetected3OrMoreSampClks = $FFFCCC75;
  ErrorWaitForNextSampClkDetectedMissedSampClk = $FFFCCC76;
  ErrorWriteNotCompleteBeforeSampClk = $FFFCCC77;
  ErrorReadNotCompleteBeforeSampClk = $FFFCCC78;
  ErrorSCXI1600ImportNotSupported = $FFFCEE2A;
  ErrorPowerSupplyConfigurationFailed = $FFFCEE2B;
  ErrorIEPEWithDCNotAllowed = $FFFCEE2C;
  ErrorMinTempForThermocoupleTypeOutsideAccuracyForPolyScaling = $FFFCEE2D;
  ErrorDevImportFailedNoDeviceToOverwriteAndSimulationNotSupported = $FFFCEE2E;
  ErrorDevImportFailedDeviceNotSupportedOnDestination = $FFFCEE2F;
  ErrorFirmwareIsTooOld = $FFFCEE30;
  ErrorFirmwareCouldntUpdate = $FFFCEE31;
  ErrorFirmwareIsCorrupt = $FFFCEE32;
  ErrorFirmwareTooNew = $FFFCEE33;
  ErrorSampClockCannotBeExportedFromExternalSampClockSrc = $FFFCEE34;
  ErrorPhysChanReservedForInputWhenDesiredForOutput = $FFFCEE35;
  ErrorPhysChanReservedForOutputWhenDesiredForInput = $FFFCEE36;
  ErrorSpecifiedCDAQSlotNotEmpty = $FFFCEE37;
  ErrorDeviceDoesNotSupportSimulation = $FFFCEE38;
  ErrorInvalidCDAQSlotNumberSpecd = $FFFCEE39;
  ErrorCSeriesModSimMustMatchCDAQChassisSim = $FFFCEE3A;
  ErrorSCCCabledDevMustNotBeSimWhenSCCCarrierIsNotSim = $FFFCEE3B;
  ErrorSCCModSimMustMatchSCCCarrierSim = $FFFCEE3C;
  ErrorSCXIModuleDoesNotSupportSimulation = $FFFCEE3D;
  ErrorSCXICableDevMustNotBeSimWhenModIsNotSim = $FFFCEE3E;
  ErrorSCXIDigitizerSimMustNotBeSimWhenModIsNotSim = $FFFCEE3F;
  ErrorSCXIModSimMustMatchSCXIChassisSim = $FFFCEE40;
  ErrorSimPXIDevReqSlotAndChassisSpecd = $FFFCEE41;
  ErrorSimDevConflictWithRealDev = $FFFCEE42;
  ErrorInsufficientDataForCalibration = $FFFCEE43;
  ErrorTriggerChannelMustBeEnabled = $FFFCEE44;
  ErrorCalibrationDataConflictCouldNotBeResolved = $FFFCEE45;
  ErrorSoftwareTooNewForSelfCalibrationData = $FFFCEE46;
  ErrorSoftwareTooNewForExtCalibrationData = $FFFCEE47;
  ErrorSelfCalibrationDataTooNewForSoftware = $FFFCEE48;
  ErrorExtCalibrationDataTooNewForSoftware = $FFFCEE49;
  ErrorSoftwareTooNewForEEPROM = $FFFCEE4A;
  ErrorEEPROMTooNewForSoftware = $FFFCEE4B;
  ErrorSoftwareTooNewForHardware = $FFFCEE4C;
  ErrorHardwareTooNewForSoftware = $FFFCEE4D;
  ErrorTaskCannotRestartFirstSampNotAvailToGenerate = $FFFCEE4E;
  ErrorOnlyUseStartTrigSrcPrptyWithDevDataLines = $FFFCEE4F;
  ErrorOnlyUsePauseTrigSrcPrptyWithDevDataLines = $FFFCEE50;
  ErrorOnlyUseRefTrigSrcPrptyWithDevDataLines = $FFFCEE51;
  ErrorPauseTrigDigPatternSizeDoesNotMatchSrcSize = $FFFCEE52;
  ErrorLineConflictCDAQ = $FFFCEE53;
  ErrorCannotWriteBeyondFinalFiniteSample = $FFFCEE54;
  ErrorRefAndStartTriggerSrcCantBeSame = $FFFCEE55;
  ErrorMemMappingIncompatibleWithPhysChansInTask = $FFFCEE56;
  ErrorOutputDriveTypeMemMappingConflict = $FFFCEE57;
  ErrorCAPIDeviceIndexInvalid = $FFFCEE58;
  ErrorRatiometricDevicesMustUseExcitationForScaling = $FFFCEE59;
  ErrorPropertyRequiresPerDeviceCfg = $FFFCEE5A;
  ErrorAICouplingAndAIInputSourceConflict = $FFFCEE5B;
  ErrorOnlyOneTaskCanPerformDOMemoryMappingAtATime = $FFFCEE5C;
  ErrorTooManyChansForAnalogRefTrigCDAQ = $FFFCEE5D;
  ErrorSpecdPropertyValueIsIncompatibleWithSampleTimingType = $FFFCEE5E;
  ErrorCPUNotSupportedRequireSSE = $FFFCEE5F;
  ErrorSpecdPropertyValueIsIncompatibleWithSampleTimingResponseMode = $FFFCEE60;
  ErrorConflictingNextWriteIsLastAndRegenModeProperties = $FFFCEE61;
  ErrorMStudioOperationDoesNotSupportDeviceContext = $FFFCEE62;
  ErrorPropertyValueInChannelExpansionContextInvalid = $FFFCEE63;
  ErrorHWTimedNonBufferedAONotSupported = $FFFCEE64;
  ErrorWaveformLengthNotMultOfQuantum = $FFFCEE65;
  ErrorDSAExpansionMixedBoardsWrongOrderInPXIChassis = $FFFCEE66;
  ErrorPowerLevelTooLowForOOK = $FFFCEE67;
  ErrorDeviceComponentTestFailure = $FFFCEE68;
  ErrorUserDefinedWfmWithOOKUnsupported = $FFFCEE69;
  ErrorInvalidDigitalModulationUserDefinedWaveform = $FFFCEE6A;
  ErrorBothRefInAndRefOutEnabled = $FFFCEE6B;
  ErrorBothAnalogAndDigitalModulationEnabled = $FFFCEE6C;
  ErrorBufferedOpsNotSupportedInSpecdSlotForCDAQ = $FFFCEE6D;
  ErrorPhysChanNotSupportedInSpecdSlotForCDAQ = $FFFCEE6E;
  ErrorResourceReservedWithConflictingSettings = $FFFCEE6F;
  ErrorInconsistentAnalogTrigSettingsCDAQ = $FFFCEE70;
  ErrorTooManyChansForAnalogPauseTrigCDAQ = $FFFCEE71;
  ErrorAnalogTrigNotFirstInScanListCDAQ = $FFFCEE72;
  ErrorTooManyChansGivenTimingType = $FFFCEE73;
  ErrorSampClkTimebaseDivWithExtSampClk = $FFFCEE74;
  ErrorCantSaveTaskWithPerDeviceTimingProperties = $FFFCEE75;
  ErrorConflictingAutoZeroMode = $FFFCEE76;
  ErrorSampClkRateNotSupportedWithEAREnabled = $FFFCEE77;
  ErrorSampClkTimebaseRateNotSpecd = $FFFCEE78;
  ErrorSessionCorruptedByDLLReload = $FFFCEE79;
  ErrorActiveDevNotSupportedWithChanExpansion = $FFFCEE7A;
  ErrorSampClkRateInvalid = $FFFCEE7B;
  ErrorExtSyncPulseSrcCannotBeExported = $FFFCEE7C;
  ErrorSyncPulseMinDelayToStartNeededForExtSyncPulseSrc = $FFFCEE7D;
  ErrorSyncPulseSrcInvalid = $FFFCEE7E;
  ErrorSampClkTimebaseRateInvalid = $FFFCEE7F;
  ErrorSampClkTimebaseSrcInvalid = $FFFCEE80;
  ErrorSampClkRateMustBeSpecd = $FFFCEE81;
  ErrorInvalidAttributeName = $FFFCEE82;
  ErrorCJCChanNameMustBeSetWhenCJCSrcIsScannableChan = $FFFCEE83;
  ErrorHiddenChanMissingInChansPropertyInCfgFile = $FFFCEE84;
  ErrorChanNamesNotSpecdInCfgFile = $FFFCEE85;
  ErrorDuplicateHiddenChanNamesInCfgFile = $FFFCEE86;
  ErrorDuplicateChanNameInCfgFile = $FFFCEE87;
  ErrorInvalidSCCModuleForSlotSpecd = $FFFCEE88;
  ErrorInvalidSCCSlotNumberSpecd = $FFFCEE89;
  ErrorInvalidSectionIdentifier = $FFFCEE8A;
  ErrorInvalidSectionName = $FFFCEE8B;
  ErrorDAQmxVersionNotSupported = $FFFCEE8C;
  ErrorSWObjectsFoundInFile = $FFFCEE8D;
  ErrorHWObjectsFoundInFile = $FFFCEE8E;
  ErrorLocalChannelSpecdWithNoParentTask = $FFFCEE8F;
  ErrorTaskReferencesMissingLocalChannel = $FFFCEE90;
  ErrorTaskReferencesLocalChannelFromOtherTask = $FFFCEE91;
  ErrorTaskMissingChannelProperty = $FFFCEE92;
  ErrorInvalidLocalChanName = $FFFCEE93;
  ErrorInvalidEscapeCharacterInString = $FFFCEE94;
  ErrorInvalidTableIdentifier = $FFFCEE95;
  ErrorValueFoundInInvalidColumn = $FFFCEE96;
  ErrorMissingStartOfTable = $FFFCEE97;
  ErrorFileMissingRequiredDAQmxHeader = $FFFCEE98;
  ErrorDeviceIDDoesNotMatch = $FFFCEE99;
  ErrorBufferedOperationsNotSupportedOnSelectedLines = $FFFCEE9A;
  ErrorPropertyConflictsWithScale = $FFFCEE9B;
  ErrorInvalidINIFileSyntax = $FFFCEE9C;
  ErrorDeviceInfoFailedPXIChassisNotIdentified = $FFFCEE9D;
  ErrorInvalidHWProductNumber = $FFFCEE9E;
  ErrorInvalidHWProductType = $FFFCEE9F;
  ErrorInvalidNumericFormatSpecd = $FFFCEEA0;
  ErrorDuplicatePropertyInObject = $FFFCEEA1;
  ErrorInvalidEnumValueSpecd = $FFFCEEA2;
  ErrorTEDSSensorPhysicalChannelConflict = $FFFCEEA3;
  ErrorTooManyPhysicalChansForTEDSInterfaceSpecd = $FFFCEEA4;
  ErrorIncapableTEDSInterfaceControllingDeviceSpecd = $FFFCEEA5;
  ErrorSCCCarrierSpecdIsMissing = $FFFCEEA6;
  ErrorIncapableSCCDigitizingDeviceSpecd = $FFFCEEA7;
  ErrorAccessorySettingNotApplicable = $FFFCEEA8;
  ErrorDeviceAndConnectorSpecdAlreadyOccupied = $FFFCEEA9;
  ErrorIllegalAccessoryTypeForDeviceSpecd = $FFFCEEAA;
  ErrorInvalidDeviceConnectorNumberSpecd = $FFFCEEAB;
  ErrorInvalidAccessoryName = $FFFCEEAC;
  ErrorMoreThanOneMatchForSpecdDevice = $FFFCEEAD;
  ErrorNoMatchForSpecdDevice = $FFFCEEAE;
  ErrorProductTypeAndProductNumberConflict = $FFFCEEAF;
  ErrorExtraPropertyDetectedInSpecdObject = $FFFCEEB0;
  ErrorRequiredPropertyMissing = $FFFCEEB1;
  ErrorCantSetAuthorForLocalChan = $FFFCEEB2;
  ErrorInvalidTimeValue = $FFFCEEB3;
  ErrorInvalidTimeFormat = $FFFCEEB4;
  ErrorDigDevChansSpecdInModeOtherThanParallel = $FFFCEEB5;
  ErrorCascadeDigitizationModeNotSupported = $FFFCEEB6;
  ErrorSpecdSlotAlreadyOccupied = $FFFCEEB7;
  ErrorInvalidSCXISlotNumberSpecd = $FFFCEEB8;
  ErrorAddressAlreadyInUse = $FFFCEEB9;
  ErrorSpecdDeviceDoesNotSupportRTSI = $FFFCEEBA;
  ErrorSpecdDeviceIsAlreadyOnRTSIBus = $FFFCEEBB;
  ErrorIdentifierInUse = $FFFCEEBC;
  ErrorWaitForNextSampleClockOrReadDetected3OrMoreMissedSampClks = $FFFCEEBD;
  ErrorHWTimedAndDataXferPIO = $FFFCEEBE;
  ErrorNonBufferedAndHWTimed = $FFFCEEBF;
  ErrorCTROutSampClkPeriodShorterThanGenPulseTrainPeriodPolled = $FFFCEEC0;
  ErrorCTROutSampClkPeriodShorterThanGenPulseTrainPeriod2 = $FFFCEEC1;
  ErrorCOCannotKeepUpInHWTimedSinglePointPolled = $FFFCEEC2;
  ErrorWriteRecoveryCannotKeepUpInHWTimedSinglePoint = $FFFCEEC3;
  ErrorNoChangeDetectionOnSelectedLineForDevice = $FFFCEEC4;
  ErrorSMIOPauseTriggersNotSupportedWithChannelExpansion = $FFFCEEC5;
  ErrorClockMasterForExternalClockNotLongestPipeline = $FFFCEEC6;
  ErrorUnsupportedUnicodeByteOrderMarker = $FFFCEEC7;
  ErrorTooManyInstructionsInLoopInScript = $FFFCEEC8;
  ErrorPLLNotLocked = $FFFCEEC9;
  ErrorIfElseBlockNotAllowedInFiniteRepeatLoopInScript = $FFFCEECA;
  ErrorIfElseBlockNotAllowedInConditionalRepeatLoopInScript = $FFFCEECB;
  ErrorClearIsLastInstructionInIfElseBlockInScript = $FFFCEECC;
  ErrorInvalidWaitDurationBeforeIfElseBlockInScript = $FFFCEECD;
  ErrorMarkerPosInvalidBeforeIfElseBlockInScript = $FFFCEECE;
  ErrorInvalidSubsetLengthBeforeIfElseBlockInScript = $FFFCEECF;
  ErrorInvalidWaveformLengthBeforeIfElseBlockInScript = $FFFCEED0;
  ErrorGenerateOrFiniteWaitInstructionExpectedBeforeIfElseBlockInScript = $FFFCEED1;
  ErrorCalPasswordNotSupported = $FFFCEED2;
  ErrorSetupCalNeededBeforeAdjustCal = $FFFCEED3;
  ErrorMultipleChansNotSupportedDuringCalSetup = $FFFCEED4;
  ErrorDevCannotBeAccessed = $FFFCEED5;
  ErrorSampClkRateDoesntMatchSampClkSrc = $FFFCEED6;
  ErrorSampClkRateNotSupportedWithEARDisabled = $FFFCEED7;
  ErrorLabVIEWVersionDoesntSupportDAQmxEvents = $FFFCEED8;
  ErrorCOReadyForNewValNotSupportedWithOnDemand = $FFFCEED9;
  ErrorCIHWTimedSinglePointNotSupportedForMeasType = $FFFCEEDA;
  ErrorOnDemandNotSupportedWithHWTimedSinglePoint = $FFFCEEDB;
  ErrorHWTimedSinglePointAndDataXferNotProgIO = $FFFCEEDC;
  ErrorMemMapAndHWTimedSinglePoint = $FFFCEEDD;
  ErrorCannotSetPropertyWhenHWTimedSinglePointTaskIsRunning = $FFFCEEDE;
  ErrorCTROutSampClkPeriodShorterThanGenPulseTrainPeriod = $FFFCEEDF;
  ErrorTooManyEventsGenerated = $FFFCEEE0;
  ErrorMStudioCppRemoveEventsBeforeStop = $FFFCEEE1;
  ErrorCAPICannotRegisterSyncEventsFromMultipleThreads = $FFFCEEE2;
  ErrorReadWaitNextSampClkWaitMismatchTwo = $FFFCEEE3;
  ErrorReadWaitNextSampClkWaitMismatchOne = $FFFCEEE4;
  ErrorDAQmxSignalEventTypeNotSupportedByChanTypesOrDevicesInTask = $FFFCEEE5;
  ErrorCannotUnregisterDAQmxSoftwareEventWhileTaskIsRunning = $FFFCEEE6;
  ErrorAutoStartWriteNotAllowedEventRegistered = $FFFCEEE7;
  ErrorAutoStartReadNotAllowedEventRegistered = $FFFCEEE8;
  ErrorCannotGetPropertyWhenTaskNotReservedCommittedOrRunning = $FFFCEEE9;
  ErrorSignalEventsNotSupportedByDevice = $FFFCEEEA;
  ErrorEveryNSamplesAcqIntoBufferEventNotSupportedByDevice = $FFFCEEEB;
  ErrorEveryNSampsTransferredFromBufferEventNotSupportedByDevice = $FFFCEEEC;
  ErrorCAPISyncEventsTaskStateChangeNotAllowedFromDifferentThread = $FFFCEEED;
  ErrorDAQmxSWEventsWithDifferentCallMechanisms = $FFFCEEEE;
  ErrorCantSaveChanWithPolyCalScaleAndAllowInteractiveEdit = $FFFCEEEF;
  ErrorChanDoesNotSupportCJC = $FFFCEEF0;
  ErrorCOReadyForNewValNotSupportedWithHWTimedSinglePoint = $FFFCEEF1;
  ErrorDACAllowConnToGndNotSupportedByDevWhenRefSrcExt = $FFFCEEF2;
  ErrorCantGetPropertyTaskNotRunning = $FFFCEEF3;
  ErrorCantSetPropertyTaskNotRunning = $FFFCEEF4;
  ErrorCantSetPropertyTaskNotRunningCommitted = $FFFCEEF5;
  ErrorAIEveryNSampsEventIntervalNotMultipleOf2 = $FFFCEEF6;
  ErrorInvalidTEDSPhysChanNotAI = $FFFCEEF7;
  ErrorCAPICannotPerformTaskOperationInAsyncCallback = $FFFCEEF8;
  ErrorEveryNSampsTransferredFromBufferEventAlreadyRegistered = $FFFCEEF9;
  ErrorEveryNSampsAcqIntoBufferEventAlreadyRegistered = $FFFCEEFA;
  ErrorEveryNSampsTransferredFromBufferNotForInput = $FFFCEEFB;
  ErrorEveryNSampsAcqIntoBufferNotForOutput = $FFFCEEFC;
  ErrorAOSampTimingTypeDifferentIn2Tasks = $FFFCEEFD;
  ErrorCouldNotDownloadFirmwareHWDamaged = $FFFCEEFE;
  ErrorCouldNotDownloadFirmwareFileMissingOrDamaged = $FFFCEEFF;
  ErrorCannotRegisterDAQmxSoftwareEventWhileTaskIsRunning = $FFFCEF00;
  ErrorDifferentRawDataCompression = $FFFCEF01;
  ErrorConfiguredTEDSInterfaceDevNotDetected = $FFFCEF02;
  ErrorCompressedSampSizeExceedsResolution = $FFFCEF03;
  ErrorChanDoesNotSupportCompression = $FFFCEF04;
  ErrorDifferentRawDataFormats = $FFFCEF05;
  ErrorSampClkOutputTermIncludesStartTrigSrc = $FFFCEF06;
  ErrorStartTrigSrcEqualToSampClkSrc = $FFFCEF07;
  ErrorEventOutputTermIncludesTrigSrc = $FFFCEF08;
  ErrorCOMultipleWritesBetweenSampClks = $FFFCEF09;
  ErrorDoneEventAlreadyRegistered = $FFFCEF0A;
  ErrorSignalEventAlreadyRegistered = $FFFCEF0B;
  ErrorCannotHaveTimedLoopAndDAQmxSignalEventsInSameTask = $FFFCEF0C;
  ErrorNeedLabVIEW711PatchToUseDAQmxEvents = $FFFCEF0D;
  ErrorStartFailedDueToWriteFailure = $FFFCEF0E;
  ErrorDataXferCustomThresholdNotDMAXferMethodSpecifiedForDev = $FFFCEF0F;
  ErrorDataXferRequestConditionNotSpecifiedForCustomThreshold = $FFFCEF10;
  ErrorDataXferCustomThresholdNotSpecified = $FFFCEF11;
  ErrorCAPISyncCallbackNotSupportedOnThisPlatform = $FFFCEF12;
  ErrorCalChanReversePolyCoefNotSpecd = $FFFCEF13;
  ErrorCalChanForwardPolyCoefNotSpecd = $FFFCEF14;
  ErrorChanCalRepeatedNumberInPreScaledVals = $FFFCEF15;
  ErrorChanCalTableNumScaledNotEqualNumPrescaledVals = $FFFCEF16;
  ErrorChanCalTableScaledValsNotSpecd = $FFFCEF17;
  ErrorChanCalTablePreScaledValsNotSpecd = $FFFCEF18;
  ErrorChanCalScaleTypeNotSet = $FFFCEF19;
  ErrorChanCalExpired = $FFFCEF1A;
  ErrorChanCalExpirationDateNotSet = $FFFCEF1B;
  Error3OutputPortCombinationGivenSampTimingType653x = $FFFCEF1C;
  Error3InputPortCombinationGivenSampTimingType653x = $FFFCEF1D;
  Error2OutputPortCombinationGivenSampTimingType653x = $FFFCEF1E;
  Error2InputPortCombinationGivenSampTimingType653x = $FFFCEF1F;
  ErrorPatternMatcherMayBeUsedByOneTrigOnly = $FFFCEF20;
  ErrorNoChansSpecdForPatternSource = $FFFCEF21;
  ErrorChangeDetectionChanNotInTask = $FFFCEF22;
  ErrorChangeDetectionChanNotTristated = $FFFCEF23;
  ErrorWaitModeValueNotSupportedNonBuffered = $FFFCEF24;
  ErrorWaitModePropertyNotSupportedNonBuffered = $FFFCEF25;
  ErrorCantSavePerLineConfigDigChanSoInteractiveEditsAllowed = $FFFCEF26;
  ErrorCantSaveNonPortMultiLineDigChanSoInteractiveEditsAllowed = $FFFCEF27;
  ErrorBufferSizeNotMultipleOfEveryNSampsEventIntervalNoIrqOnDev = $FFFCEF28;
  ErrorGlobalTaskNameAlreadyChanName = $FFFCEF29;
  ErrorGlobalChanNameAlreadyTaskName = $FFFCEF2A;
  ErrorAOEveryNSampsEventIntervalNotMultipleOf2 = $FFFCEF2B;
  ErrorSampleTimebaseDivisorNotSupportedGivenTimingType = $FFFCEF2C;
  ErrorHandshakeEventOutputTermNotSupportedGivenTimingType = $FFFCEF2D;
  ErrorChangeDetectionOutputTermNotSupportedGivenTimingType = $FFFCEF2E;
  ErrorReadyForTransferOutputTermNotSupportedGivenTimingType = $FFFCEF2F;
  ErrorRefTrigOutputTermNotSupportedGivenTimingType = $FFFCEF30;
  ErrorStartTrigOutputTermNotSupportedGivenTimingType = $FFFCEF31;
  ErrorSampClockOutputTermNotSupportedGivenTimingType = $FFFCEF32;
  Error20MhzTimebaseNotSupportedGivenTimingType = $FFFCEF33;
  ErrorSampClockSourceNotSupportedGivenTimingType = $FFFCEF34;
  ErrorRefTrigTypeNotSupportedGivenTimingType = $FFFCEF35;
  ErrorPauseTrigTypeNotSupportedGivenTimingType = $FFFCEF36;
  ErrorHandshakeTrigTypeNotSupportedGivenTimingType = $FFFCEF37;
  ErrorStartTrigTypeNotSupportedGivenTimingType = $FFFCEF38;
  ErrorRefClkSrcNotSupported = $FFFCEF39;
  ErrorDataVoltageLowAndHighIncompatible = $FFFCEF3A;
  ErrorInvalidCharInDigPatternString = $FFFCEF3B;
  ErrorCantUsePort3AloneGivenSampTimingTypeOn653x = $FFFCEF3C;
  ErrorCantUsePort1AloneGivenSampTimingTypeOn653x = $FFFCEF3D;
  ErrorPartialUseOfPhysicalLinesWithinPortNotSupported653x = $FFFCEF3E;
  ErrorPhysicalChanNotSupportedGivenSampTimingType653x = $FFFCEF3F;
  ErrorCanExportOnlyDigEdgeTrigs = $FFFCEF40;
  ErrorRefTrigDigPatternSizeDoesNotMatchSourceSize = $FFFCEF41;
  ErrorStartTrigDigPatternSizeDoesNotMatchSourceSize = $FFFCEF42;
  ErrorChangeDetectionRisingAndFallingEdgeChanDontMatch = $FFFCEF43;
  ErrorPhysicalChansForChangeDetectionAndPatternMatch653x = $FFFCEF44;
  ErrorCanExportOnlyOnboardSampClk = $FFFCEF45;
  ErrorInternalSampClkNotRisingEdge = $FFFCEF46;
  ErrorRefTrigDigPatternChanNotInTask = $FFFCEF47;
  ErrorRefTrigDigPatternChanNotTristated = $FFFCEF48;
  ErrorStartTrigDigPatternChanNotInTask = $FFFCEF49;
  ErrorStartTrigDigPatternChanNotTristated = $FFFCEF4A;
  ErrorPXIStarAndClock10Sync = $FFFCEF4B;
  ErrorGlobalChanCannotBeSavedSoInteractiveEditsAllowed = $FFFCEF4C;
  ErrorTaskCannotBeSavedSoInteractiveEditsAllowed = $FFFCEF4D;
  ErrorInvalidGlobalChan = $FFFCEF4E;
  ErrorEveryNSampsEventAlreadyRegistered = $FFFCEF4F;
  ErrorEveryNSampsEventIntervalZeroNotSupported = $FFFCEF50;
  ErrorChanSizeTooBigForU16PortWrite = $FFFCEF51;
  ErrorChanSizeTooBigForU16PortRead = $FFFCEF52;
  ErrorBufferSizeNotMultipleOfEveryNSampsEventIntervalWhenDMA = $FFFCEF53;
  ErrorWriteWhenTaskNotRunningCOTicks = $FFFCEF54;
  ErrorWriteWhenTaskNotRunningCOFreq = $FFFCEF55;
  ErrorWriteWhenTaskNotRunningCOTime = $FFFCEF56;
  ErrorAOMinMaxNotSupportedDACRangeTooSmall = $FFFCEF57;
  ErrorAOMinMaxNotSupportedGivenDACRange = $FFFCEF58;
  ErrorAOMinMaxNotSupportedGivenDACRangeAndOffsetVal = $FFFCEF59;
  ErrorAOMinMaxNotSupportedDACOffsetValInappropriate = $FFFCEF5A;
  ErrorAOMinMaxNotSupportedGivenDACOffsetVal = $FFFCEF5B;
  ErrorAOMinMaxNotSupportedDACRefValTooSmall = $FFFCEF5C;
  ErrorAOMinMaxNotSupportedGivenDACRefVal = $FFFCEF5D;
  ErrorAOMinMaxNotSupportedGivenDACRefAndOffsetVal = $FFFCEF5E;
  ErrorWhenAcqCompAndNumSampsPerChanExceedsOnBrdBufSize = $FFFCEF5F;
  ErrorWhenAcqCompAndNoRefTrig = $FFFCEF60;
  ErrorWaitForNextSampClkNotSupported = $FFFCEF61;
  ErrorDevInUnidentifiedPXIChassis = $FFFCEF62;
  ErrorMaxSoundPressureMicSensitivitRelatedAIPropertiesNotSupportedByDev = $FFFCEF63;
  ErrorMaxSoundPressureAndMicSensitivityNotSupportedByDev = $FFFCEF64;
  ErrorAOBufferSizeZeroForSampClkTimingType = $FFFCEF65;
  ErrorAOCallWriteBeforeStartForSampClkTimingType = $FFFCEF66;
  ErrorInvalidCalLowPassCutoffFreq = $FFFCEF67;
  ErrorSimulationCannotBeDisabledForDevCreatedAsSimulatedDev = $FFFCEF68;
  ErrorCannotAddNewDevsAfterTaskConfiguration = $FFFCEF69;
  ErrorDifftSyncPulseSrcAndSampClkTimebaseSrcDevMultiDevTask = $FFFCEF6A;
  ErrorTermWithoutDevInMultiDevTask = $FFFCEF6B;
  ErrorSyncNoDevSampClkTimebaseOrSyncPulseInPXISlot2 = $FFFCEF6C;
  ErrorPhysicalChanNotOnThisConnector = $FFFCEF6D;
  ErrorNumSampsToWaitNotGreaterThanZeroInScript = $FFFCEF6E;
  ErrorNumSampsToWaitNotMultipleOfAlignmentQuantumInScript = $FFFCEF6F;
  ErrorEveryNSamplesEventNotSupportedForNonBufferedTasks = $FFFCEF70;
  ErrorBufferedAndDataXferPIO = $FFFCEF71;
  ErrorCannotWriteWhenAutoStartFalseAndTaskNotRunning = $FFFCEF72;
  ErrorNonBufferedAndDataXferInterrupts = $FFFCEF73;
  ErrorWriteFailedMultipleCtrsWithFREQOUT = $FFFCEF74;
  ErrorReadNotCompleteBefore3SampClkEdges = $FFFCEF75;
  ErrorCtrHWTimedSinglePointAndDataXferNotProgIO = $FFFCEF76;
  ErrorPrescalerNot1ForInputTerminal = $FFFCEF77;
  ErrorPrescalerNot1ForTimebaseSrc = $FFFCEF78;
  ErrorSampClkTimingTypeWhenTristateIsFalse = $FFFCEF79;
  ErrorOutputBufferSizeNotMultOfXferSize = $FFFCEF7A;
  ErrorSampPerChanNotMultOfXferSize = $FFFCEF7B;
  ErrorWriteToTEDSFailed = $FFFCEF7C;
  ErrorSCXIDevNotUsablePowerTurnedOff = $FFFCEF7D;
  ErrorCannotReadWhenAutoStartFalseBufSizeZeroAndTaskNotRunning = $FFFCEF7E;
  ErrorCannotReadWhenAutoStartFalseHWTimedSinglePtAndTaskNotRunning = $FFFCEF7F;
  ErrorCannotReadWhenAutoStartFalseOnDemandAndTaskNotRunning = $FFFCEF80;
  ErrorSimultaneousAOWhenNotOnDemandTiming = $FFFCEF81;
  ErrorMemMapAndSimultaneousAO = $FFFCEF82;
  ErrorWriteFailedMultipleCOOutputTypes = $FFFCEF83;
  ErrorWriteToTEDSNotSupportedOnRT = $FFFCEF84;
  ErrorVirtualTEDSDataFileError = $FFFCEF85;
  ErrorTEDSSensorDataError = $FFFCEF86;
  ErrorDataSizeMoreThanSizeOfEEPROMOnTEDS = $FFFCEF87;
  ErrorPROMOnTEDSContainsBasicTEDSData = $FFFCEF88;
  ErrorPROMOnTEDSAlreadyWritten = $FFFCEF89;
  ErrorTEDSDoesNotContainPROM = $FFFCEF8A;
  ErrorHWTimedSinglePointNotSupportedAI = $FFFCEF8B;
  ErrorHWTimedSinglePointOddNumChansInAITask = $FFFCEF8C;
  ErrorCantUseOnlyOnBoardMemWithProgrammedIO = $FFFCEF8D;
  ErrorSwitchDevShutDownDueToHighTemp = $FFFCEF8E;
  ErrorExcitationNotSupportedWhenTermCfgDiff = $FFFCEF8F;
  ErrorTEDSMinElecValGEMaxElecVal = $FFFCEF90;
  ErrorTEDSMinPhysValGEMaxPhysVal = $FFFCEF91;
  ErrorCIOnboardClockNotSupportedAsInputTerm = $FFFCEF92;
  ErrorInvalidSampModeForPositionMeas = $FFFCEF93;
  ErrorTrigWhenAOHWTimedSinglePtSampMode = $FFFCEF94;
  ErrorDAQmxCantUseStringDueToUnknownChar = $FFFCEF95;
  ErrorDAQmxCantRetrieveStringDueToUnknownChar = $FFFCEF96;
  ErrorClearTEDSNotSupportedOnRT = $FFFCEF97;
  ErrorCfgTEDSNotSupportedOnRT = $FFFCEF98;
  ErrorProgFilterClkCfgdToDifferentMinPulseWidthBySameTask1PerDev = $FFFCEF99;
  ErrorProgFilterClkCfgdToDifferentMinPulseWidthByAnotherTask1PerDev = $FFFCEF9A;
  ErrorNoLastExtCalDateTimeLastExtCalNotDAQmx = $FFFCEF9C;
  ErrorCannotWriteNotStartedAutoStartFalseNotOnDemandHWTimedSglPt = $FFFCEF9D;
  ErrorCannotWriteNotStartedAutoStartFalseNotOnDemandBufSizeZero = $FFFCEF9E;
  ErrorCOInvalidTimingSrcDueToSignal = $FFFCEF9F;
  ErrorCIInvalidTimingSrcForSampClkDueToSampTimingType = $FFFCEFA0;
  ErrorCIInvalidTimingSrcForEventCntDueToSampMode = $FFFCEFA1;
  ErrorNoChangeDetectOnNonInputDigLineForDev = $FFFCEFA2;
  ErrorEmptyStringTermNameNotSupported = $FFFCEFA3;
  ErrorMemMapEnabledForHWTimedNonBufferedAO = $FFFCEFA4;
  ErrorDevOnboardMemOverflowDuringHWTimedNonBufferedGen = $FFFCEFA5;
  ErrorCODAQmxWriteMultipleChans = $FFFCEFA6;
  ErrorCantMaintainExistingValueAOSync = $FFFCEFA7;
  ErrorMStudioMultiplePhysChansNotSupported = $FFFCEFA8;
  ErrorCantConfigureTEDSForChan = $FFFCEFA9;
  ErrorWriteDataTypeTooSmall = $FFFCEFAA;
  ErrorReadDataTypeTooSmall = $FFFCEFAB;
  ErrorMeasuredBridgeOffsetTooHigh = $FFFCEFAC;
  ErrorStartTrigConflictWithCOHWTimedSinglePt = $FFFCEFAD;
  ErrorSampClkRateExtSampClkTimebaseRateMismatch = $FFFCEFAE;
  ErrorInvalidTimingSrcDueToSampTimingType = $FFFCEFAF;
  ErrorVirtualTEDSFileNotFound = $FFFCEFB0;
  ErrorMStudioNoForwardPolyScaleCoeffs = $FFFCEFB1;
  ErrorMStudioNoReversePolyScaleCoeffs = $FFFCEFB2;
  ErrorMStudioNoPolyScaleCoeffsUseCalc = $FFFCEFB3;
  ErrorMStudioNoForwardPolyScaleCoeffsUseCalc = $FFFCEFB4;
  ErrorMStudioNoReversePolyScaleCoeffsUseCalc = $FFFCEFB5;
  ErrorCOSampModeSampTimingTypeSampClkConflict = $FFFCEFB6;
  ErrorDevCannotProduceMinPulseWidth = $FFFCEFB7;
  ErrorCannotProduceMinPulseWidthGivenPropertyValues = $FFFCEFB8;
  ErrorTermCfgdToDifferentMinPulseWidthByAnotherTask = $FFFCEFB9;
  ErrorTermCfgdToDifferentMinPulseWidthByAnotherProperty = $FFFCEFBA;
  ErrorDigSyncNotAvailableOnTerm = $FFFCEFBB;
  ErrorDigFilterNotAvailableOnTerm = $FFFCEFBC;
  ErrorDigFilterEnabledMinPulseWidthNotCfg = $FFFCEFBD;
  ErrorDigFilterAndSyncBothEnabled = $FFFCEFBE;
  ErrorHWTimedSinglePointAOAndDataXferNotProgIO = $FFFCEFBF;
  ErrorNonBufferedAOAndDataXferNotProgIO = $FFFCEFC0;
  ErrorProgIODataXferForBufferedAO = $FFFCEFC1;
  ErrorTEDSLegacyTemplateIDInvalidOrUnsupported = $FFFCEFC2;
  ErrorTEDSMappingMethodInvalidOrUnsupported = $FFFCEFC3;
  ErrorTEDSLinearMappingSlopeZero = $FFFCEFC4;
  ErrorAIInputBufferSizeNotMultOfXferSize = $FFFCEFC5;
  ErrorNoSyncPulseExtSampClkTimebase = $FFFCEFC6;
  ErrorNoSyncPulseAnotherTaskRunning = $FFFCEFC7;
  ErrorAOMinMaxNotInGainRange = $FFFCEFC8;
  ErrorAOMinMaxNotInDACRange = $FFFCEFC9;
  ErrorDevOnlySupportsSampClkTimingAO = $FFFCEFCA;
  ErrorDevOnlySupportsSampClkTimingAI = $FFFCEFCB;
  ErrorTEDSIncompatibleSensorAndMeasType = $FFFCEFCC;
  ErrorTEDSMultipleCalTemplatesNotSupported = $FFFCEFCD;
  ErrorTEDSTemplateParametersNotSupported = $FFFCEFCE;
  ErrorParsingTEDSData = $FFFCEFCF;
  ErrorMultipleActivePhysChansNotSupported = $FFFCEFD0;
  ErrorNoChansSpecdForChangeDetect = $FFFCEFD1;
  ErrorInvalidCalVoltageForGivenGain = $FFFCEFD2;
  ErrorInvalidCalGain = $FFFCEFD3;
  ErrorMultipleWritesBetweenSampClks = $FFFCEFD4;
  ErrorInvalidAcqTypeForFREQOUT = $FFFCEFD5;
  ErrorSuitableTimebaseNotFoundTimeCombo2 = $FFFCEFD6;
  ErrorSuitableTimebaseNotFoundFrequencyCombo2 = $FFFCEFD7;
  ErrorRefClkRateRefClkSrcMismatch = $FFFCEFD8;
  ErrorNoTEDSTerminalBlock = $FFFCEFD9;
  ErrorCorruptedTEDSMemory = $FFFCEFDA;
  ErrorTEDSNotSupported = $FFFCEFDB;
  ErrorTimingSrcTaskStartedBeforeTimedLoop = $FFFCEFDC;
  ErrorPropertyNotSupportedForTimingSrc = $FFFCEFDD;
  ErrorTimingSrcDoesNotExist = $FFFCEFDE;
  ErrorInputBufferSizeNotEqualSampsPerChanForFiniteSampMode = $FFFCEFDF;
  ErrorFREQOUTCannotProduceDesiredFrequency2 = $FFFCEFE0;
  ErrorExtRefClkRateNotSpecified = $FFFCEFE1;
  ErrorDeviceDoesNotSupportDMADataXferForNonBufferedAcq = $FFFCEFE2;
  ErrorDigFilterMinPulseWidthSetWhenTristateIsFalse = $FFFCEFE3;
  ErrorDigFilterEnableSetWhenTristateIsFalse = $FFFCEFE4;
  ErrorNoHWTimingWithOnDemand = $FFFCEFE5;
  ErrorCannotDetectChangesWhenTristateIsFalse = $FFFCEFE6;
  ErrorCannotHandshakeWhenTristateIsFalse = $FFFCEFE7;
  ErrorLinesUsedForStaticInputNotForHandshakingControl = $FFFCEFE8;
  ErrorLinesUsedForHandshakingControlNotForStaticInput = $FFFCEFE9;
  ErrorLinesUsedForStaticInputNotForHandshakingInput = $FFFCEFEA;
  ErrorLinesUsedForHandshakingInputNotForStaticInput = $FFFCEFEB;
  ErrorDifferentDITristateValsForChansInTask = $FFFCEFEC;
  ErrorTimebaseCalFreqVarianceTooLarge = $FFFCEFED;
  ErrorTimebaseCalFailedToConverge = $FFFCEFEE;
  ErrorInadequateResolutionForTimebaseCal = $FFFCEFEF;
  ErrorInvalidAOGainCalConst = $FFFCEFF0;
  ErrorInvalidAOOffsetCalConst = $FFFCEFF1;
  ErrorInvalidAIGainCalConst = $FFFCEFF2;
  ErrorInvalidAIOffsetCalConst = $FFFCEFF3;
  ErrorDigOutputOverrun = $FFFCEFF4;
  ErrorDigInputOverrun = $FFFCEFF5;
  ErrorAcqStoppedDriverCantXferDataFastEnough = $FFFCEFF6;
  ErrorChansCantAppearInSameTask = $FFFCEFF7;
  ErrorInputCfgFailedBecauseWatchdogExpired = $FFFCEFF8;
  ErrorAnalogTrigChanNotExternal = $FFFCEFF9;
  ErrorTooManyChansForInternalAIInputSrc = $FFFCEFFA;
  ErrorTEDSSensorNotDetected = $FFFCEFFB;
  ErrorPrptyGetSpecdActiveItemFailedDueToDifftValues = $FFFCEFFC;
  ErrorRoutingDestTermPXIClk10InNotInSlot2 = $FFFCEFFE;
  ErrorRoutingDestTermPXIStarXNotInSlot2 = $FFFCEFFF;
  ErrorRoutingSrcTermPXIStarXNotInSlot2 = $FFFCF000;
  ErrorRoutingSrcTermPXIStarInSlot16AndAbove = $FFFCF001;
  ErrorRoutingDestTermPXIStarInSlot16AndAbove = $FFFCF002;
  ErrorRoutingDestTermPXIStarInSlot2 = $FFFCF003;
  ErrorRoutingSrcTermPXIStarInSlot2 = $FFFCF004;
  ErrorRoutingDestTermPXIChassisNotIdentified = $FFFCF005;
  ErrorRoutingSrcTermPXIChassisNotIdentified = $FFFCF006;
  ErrorFailedToAcquireCalData = $FFFCF007;
  ErrorBridgeOffsetNullingCalNotSupported = $FFFCF008;
  ErrorAIMaxNotSpecified = $FFFCF009;
  ErrorAIMinNotSpecified = $FFFCF00A;
  ErrorOddTotalBufferSizeToWrite = $FFFCF00B;
  ErrorOddTotalNumSampsToWrite = $FFFCF00C;
  ErrorBufferWithWaitMode = $FFFCF00D;
  ErrorBufferWithHWTimedSinglePointSampMode = $FFFCF00E;
  ErrorCOWritePulseLowTicksNotSupported = $FFFCF00F;
  ErrorCOWritePulseHighTicksNotSupported = $FFFCF010;
  ErrorCOWritePulseLowTimeOutOfRange = $FFFCF011;
  ErrorCOWritePulseHighTimeOutOfRange = $FFFCF012;
  ErrorCOWriteFreqOutOfRange = $FFFCF013;
  ErrorCOWriteDutyCycleOutOfRange = $FFFCF014;
  ErrorInvalidInstallation = $FFFCF015;
  ErrorRefTrigMasterSessionUnavailable = $FFFCF016;
  ErrorRouteFailedBecauseWatchdogExpired = $FFFCF017;
  ErrorDeviceShutDownDueToHighTemp = $FFFCF018;
  ErrorNoMemMapWhenHWTimedSinglePoint = $FFFCF019;
  ErrorWriteFailedBecauseWatchdogExpired = $FFFCF01A;
  ErrorDifftInternalAIInputSrcs = $FFFCF01B;
  ErrorDifftAIInputSrcInOneChanGroup = $FFFCF01C;
  ErrorInternalAIInputSrcInMultChanGroups = $FFFCF01D;
  ErrorSwitchOpFailedDueToPrevError = $FFFCF01E;
  ErrorWroteMultiSampsUsingSingleSampWrite = $FFFCF01F;
  ErrorMismatchedInputArraySizes = $FFFCF020;
  ErrorCantExceedRelayDriveLimit = $FFFCF021;
  ErrorDACRngLowNotEqualToMinusRefVal = $FFFCF022;
  ErrorCantAllowConnectDACToGnd = $FFFCF023;
  ErrorWatchdogTimeoutOutOfRangeAndNotSpecialVal = $FFFCF024;
  ErrorNoWatchdogOutputOnPortReservedForInput = $FFFCF025;
  ErrorNoInputOnPortCfgdForWatchdogOutput = $FFFCF026;
  ErrorWatchdogExpirationStateNotEqualForLinesInPort = $FFFCF027;
  ErrorCannotPerformOpWhenTaskNotReserved = $FFFCF028;
  ErrorPowerupStateNotSupported = $FFFCF029;
  ErrorWatchdogTimerNotSupported = $FFFCF02A;
  ErrorOpNotSupportedWhenRefClkSrcNone = $FFFCF02B;
  ErrorSampClkRateUnavailable = $FFFCF02C;
  ErrorPrptyGetSpecdSingleActiveChanFailedDueToDifftVals = $FFFCF02D;
  ErrorPrptyGetImpliedActiveChanFailedDueToDifftVals = $FFFCF02E;
  ErrorPrptyGetSpecdActiveChanFailedDueToDifftVals = $FFFCF02F;
  ErrorNoRegenWhenUsingBrdMem = $FFFCF030;
  ErrorNonbufferedReadMoreThanSampsPerChan = $FFFCF031;
  ErrorWatchdogExpirationTristateNotSpecdForEntirePort = $FFFCF032;
  ErrorPowerupTristateNotSpecdForEntirePort = $FFFCF033;
  ErrorPowerupStateNotSpecdForEntirePort = $FFFCF034;
  ErrorCantSetWatchdogExpirationOnDigInChan = $FFFCF035;
  ErrorCantSetPowerupStateOnDigInChan = $FFFCF036;
  ErrorPhysChanNotInTask = $FFFCF037;
  ErrorPhysChanDevNotInTask = $FFFCF038;
  ErrorDigInputNotSupported = $FFFCF039;
  ErrorDigFilterIntervalNotEqualForLines = $FFFCF03A;
  ErrorDigFilterIntervalAlreadyCfgd = $FFFCF03B;
  ErrorCantResetExpiredWatchdog = $FFFCF03C;
  ErrorActiveChanTooManyLinesSpecdWhenGettingPrpty = $FFFCF03D;
  ErrorActiveChanNotSpecdWhenGetting1LinePrpty = $FFFCF03E;
  ErrorDigPrptyCannotBeSetPerLine = $FFFCF03F;
  ErrorSendAdvCmpltAfterWaitForTrigInScanlist = $FFFCF040;
  ErrorDisconnectionRequiredInScanlist = $FFFCF041;
  ErrorTwoWaitForTrigsAfterConnectionInScanlist = $FFFCF042;
  ErrorActionSeparatorRequiredAfterBreakingConnectionInScanlist = $FFFCF043;
  ErrorConnectionInScanlistMustWaitForTrig = $FFFCF044;
  ErrorActionNotSupportedTaskNotWatchdog = $FFFCF045;
  ErrorWfmNameSameAsScriptName = $FFFCF046;
  ErrorScriptNameSameAsWfmName = $FFFCF047;
  ErrorDSFStopClock = $FFFCF048;
  ErrorDSFReadyForStartClock = $FFFCF049;
  ErrorWriteOffsetNotMultOfIncr = $FFFCF04A;
  ErrorDifferentPrptyValsNotSupportedOnDev = $FFFCF04B;
  ErrorRefAndPauseTrigConfigured = $FFFCF04C;
  ErrorFailedToEnableHighSpeedInputClock = $FFFCF04D;
  ErrorEmptyPhysChanInPowerUpStatesArray = $FFFCF04E;
  ErrorActivePhysChanTooManyLinesSpecdWhenGettingPrpty = $FFFCF04F;
  ErrorActivePhysChanNotSpecdWhenGetting1LinePrpty = $FFFCF050;
  ErrorPXIDevTempCausedShutDown = $FFFCF051;
  ErrorInvalidNumSampsToWrite = $FFFCF052;
  ErrorOutputFIFOUnderflow2 = $FFFCF053;
  ErrorRepeatedAIPhysicalChan = $FFFCF054;
  ErrorMultScanOpsInOneChassis = $FFFCF055;
  ErrorInvalidAIChanOrder = $FFFCF056;
  ErrorReversePowerProtectionActivated = $FFFCF057;
  ErrorInvalidAsynOpHandle = $FFFCF058;
  ErrorFailedToEnableHighSpeedOutput = $FFFCF059;
  ErrorCannotReadPastEndOfRecord = $FFFCF05A;
  ErrorAcqStoppedToPreventInputBufferOverwriteOneDataXferMech = $FFFCF05B;
  ErrorZeroBasedChanIndexInvalid = $FFFCF05C;
  ErrorNoChansOfGivenTypeInTask = $FFFCF05D;
  ErrorSampClkSrcInvalidForOutputValidForInput = $FFFCF05E;
  ErrorOutputBufSizeTooSmallToStartGen = $FFFCF05F;
  ErrorInputBufSizeTooSmallToStartAcq = $FFFCF060;
  ErrorExportTwoSignalsOnSameTerminal = $FFFCF061;
  ErrorChanIndexInvalid = $FFFCF062;
  ErrorRangeSyntaxNumberTooBig = $FFFCF063;
  ErrorNULLPtr = $FFFCF064;
  ErrorScaledMinEqualMax = $FFFCF065;
  ErrorPreScaledMinEqualMax = $FFFCF066;
  ErrorPropertyNotSupportedForScaleType = $FFFCF067;
  ErrorChannelNameGenerationNumberTooBig = $FFFCF068;
  ErrorRepeatedNumberInScaledValues = $FFFCF069;
  ErrorRepeatedNumberInPreScaledValues = $FFFCF06A;
  ErrorLinesAlreadyReservedForOutput = $FFFCF06B;
  ErrorSwitchOperationChansSpanMultipleDevsInList = $FFFCF06C;
  ErrorInvalidIDInListAtBeginningOfSwitchOperation = $FFFCF06D;
  ErrorMStudioInvalidPolyDirection = $FFFCF06E;
  ErrorMStudioPropertyGetWhileTaskNotVerified = $FFFCF06F;
  ErrorRangeWithTooManyObjects = $FFFCF070;
  ErrorCppDotNetAPINegativeBufferSize = $FFFCF071;
  ErrorCppCantRemoveInvalidEventHandler = $FFFCF072;
  ErrorCppCantRemoveEventHandlerTwice = $FFFCF073;
  ErrorCppCantRemoveOtherObjectsEventHandler = $FFFCF074;
  ErrorDigLinesReservedOrUnavailable = $FFFCF075;
  ErrorDSFFailedToResetStream = $FFFCF076;
  ErrorDSFReadyForOutputNotAsserted = $FFFCF077;
  ErrorSampToWritePerChanNotMultipleOfIncr = $FFFCF078;
  ErrorAOPropertiesCauseVoltageBelowMin = $FFFCF079;
  ErrorAOPropertiesCauseVoltageOverMax = $FFFCF07A;
  ErrorPropertyNotSupportedWhenRefClkSrcNone = $FFFCF07B;
  ErrorAIMaxTooSmall = $FFFCF07C;
  ErrorAIMaxTooLarge = $FFFCF07D;
  ErrorAIMinTooSmall = $FFFCF07E;
  ErrorAIMinTooLarge = $FFFCF07F;
  ErrorBuiltInCJCSrcNotSupported = $FFFCF080;
  ErrorTooManyPostTrigSampsPerChan = $FFFCF081;
  ErrorTrigLineNotFoundSingleDevRoute = $FFFCF082;
  ErrorDifferentInternalAIInputSources = $FFFCF083;
  ErrorDifferentAIInputSrcInOneChanGroup = $FFFCF084;
  ErrorInternalAIInputSrcInMultipleChanGroups = $FFFCF085;
  ErrorCAPIChanIndexInvalid = $FFFCF086;
  ErrorCollectionDoesNotMatchChanType = $FFFCF087;
  ErrorOutputCantStartChangedRegenerationMode = $FFFCF088;
  ErrorOutputCantStartChangedBufferSize = $FFFCF089;
  ErrorChanSizeTooBigForU32PortWrite = $FFFCF08A;
  ErrorChanSizeTooBigForU8PortWrite = $FFFCF08B;
  ErrorChanSizeTooBigForU32PortRead = $FFFCF08C;
  ErrorChanSizeTooBigForU8PortRead = $FFFCF08D;
  ErrorInvalidDigDataWrite = $FFFCF08E;
  ErrorInvalidAODataWrite = $FFFCF08F;
  ErrorWaitUntilDoneDoesNotIndicateDone = $FFFCF090;
  ErrorMultiChanTypesInTask = $FFFCF091;
  ErrorMultiDevsInTask = $FFFCF092;
  ErrorCannotSetPropertyWhenTaskRunning = $FFFCF093;
  ErrorCannotGetPropertyWhenTaskNotCommittedOrRunning = $FFFCF094;
  ErrorLeadingUnderscoreInString = $FFFCF095;
  ErrorTrailingSpaceInString = $FFFCF096;
  ErrorLeadingSpaceInString = $FFFCF097;
  ErrorInvalidCharInString = $FFFCF098;
  ErrorDLLBecameUnlocked = $FFFCF099;
  ErrorDLLLock = $FFFCF09A;
  ErrorSelfCalConstsInvalid = $FFFCF09B;
  ErrorInvalidTrigCouplingExceptForExtTrigChan = $FFFCF09C;
  ErrorWriteFailsBufferSizeAutoConfigured = $FFFCF09D;
  ErrorExtCalAdjustExtRefVoltageFailed = $FFFCF09E;
  ErrorSelfCalFailedExtNoiseOrRefVoltageOutOfCal = $FFFCF09F;
  ErrorExtCalTemperatureNotDAQmx = $FFFCF0A0;
  ErrorExtCalDateTimeNotDAQmx = $FFFCF0A1;
  ErrorSelfCalTemperatureNotDAQmx = $FFFCF0A2;
  ErrorSelfCalDateTimeNotDAQmx = $FFFCF0A3;
  ErrorDACRefValNotSet = $FFFCF0A4;
  ErrorAnalogMultiSampWriteNotSupported = $FFFCF0A5;
  ErrorInvalidActionInControlTask = $FFFCF0A6;
  ErrorPolyCoeffsInconsistent = $FFFCF0A7;
  ErrorSensorValTooLow = $FFFCF0A8;
  ErrorSensorValTooHigh = $FFFCF0A9;
  ErrorWaveformNameTooLong = $FFFCF0AA;
  ErrorIdentifierTooLongInScript = $FFFCF0AB;
  ErrorUnexpectedIDFollowingSwitchChanName = $FFFCF0AC;
  ErrorRelayNameNotSpecifiedInList = $FFFCF0AD;
  ErrorUnexpectedIDFollowingRelayNameInList = $FFFCF0AE;
  ErrorUnexpectedIDFollowingSwitchOpInList = $FFFCF0AF;
  ErrorInvalidLineGrouping = $FFFCF0B0;
  ErrorCtrMinMax = $FFFCF0B1;
  ErrorWriteChanTypeMismatch = $FFFCF0B2;
  ErrorReadChanTypeMismatch = $FFFCF0B3;
  ErrorWriteNumChansMismatch = $FFFCF0B4;
  ErrorOneChanReadForMultiChanTask = $FFFCF0B5;
  ErrorCannotSelfCalDuringExtCal = $FFFCF0B6;
  ErrorMeasCalAdjustOscillatorPhaseDAC = $FFFCF0B7;
  ErrorInvalidCalConstCalADCAdjustment = $FFFCF0B8;
  ErrorInvalidCalConstOscillatorFreqDACValue = $FFFCF0B9;
  ErrorInvalidCalConstOscillatorPhaseDACValue = $FFFCF0BA;
  ErrorInvalidCalConstOffsetDACValue = $FFFCF0BB;
  ErrorInvalidCalConstGainDACValue = $FFFCF0BC;
  ErrorInvalidNumCalADCReadsToAverage = $FFFCF0BD;
  ErrorInvalidCfgCalAdjustDirectPathOutputImpedance = $FFFCF0BE;
  ErrorInvalidCfgCalAdjustMainPathOutputImpedance = $FFFCF0BF;
  ErrorInvalidCfgCalAdjustMainPathPostAmpGainAndOffset = $FFFCF0C0;
  ErrorInvalidCfgCalAdjustMainPathPreAmpGain = $FFFCF0C1;
  ErrorInvalidCfgCalAdjustMainPreAmpOffset = $FFFCF0C2;
  ErrorMeasCalAdjustCalADC = $FFFCF0C3;
  ErrorMeasCalAdjustOscillatorFrequency = $FFFCF0C4;
  ErrorMeasCalAdjustDirectPathOutputImpedance = $FFFCF0C5;
  ErrorMeasCalAdjustMainPathOutputImpedance = $FFFCF0C6;
  ErrorMeasCalAdjustDirectPathGain = $FFFCF0C7;
  ErrorMeasCalAdjustMainPathPostAmpGainAndOffset = $FFFCF0C8;
  ErrorMeasCalAdjustMainPathPreAmpGain = $FFFCF0C9;
  ErrorMeasCalAdjustMainPathPreAmpOffset = $FFFCF0CA;
  ErrorInvalidDateTimeInEEPROM = $FFFCF0CB;
  ErrorUnableToLocateErrorResources = $FFFCF0CC;
  ErrorDotNetAPINotUnsigned32BitNumber = $FFFCF0CD;
  ErrorInvalidRangeOfObjectsSyntaxInString = $FFFCF0CE;
  ErrorAttemptToEnableLineNotPreviouslyDisabled = $FFFCF0CF;
  ErrorInvalidCharInPattern = $FFFCF0D0;
  ErrorIntermediateBufferFull = $FFFCF0D1;
  ErrorLoadTaskFailsBecauseNoTimingOnDev = $FFFCF0D2;
  ErrorCAPIReservedParamNotNULLNorEmpty = $FFFCF0D3;
  ErrorCAPIReservedParamNotNULL = $FFFCF0D4;
  ErrorCAPIReservedParamNotZero = $FFFCF0D5;
  ErrorSampleValueOutOfRange = $FFFCF0D6;
  ErrorChanAlreadyInTask = $FFFCF0D7;
  ErrorVirtualChanDoesNotExist = $FFFCF0D8;
  ErrorChanNotInTask = $FFFCF0DA;
  ErrorTaskNotInDataNeighborhood = $FFFCF0DB;
  ErrorCantSaveTaskWithoutReplace = $FFFCF0DC;
  ErrorCantSaveChanWithoutReplace = $FFFCF0DD;
  ErrorDevNotInTask = $FFFCF0DE;
  ErrorDevAlreadyInTask = $FFFCF0DF;
  ErrorCanNotPerformOpWhileTaskRunning = $FFFCF0E1;
  ErrorCanNotPerformOpWhenNoChansInTask = $FFFCF0E2;
  ErrorCanNotPerformOpWhenNoDevInTask = $FFFCF0E3;
  ErrorCannotPerformOpWhenTaskNotRunning = $FFFCF0E5;
  ErrorOperationTimedOut = $FFFCF0E6;
  ErrorCannotReadWhenAutoStartFalseAndTaskNotRunningOrCommitted = $FFFCF0E7;
  ErrorCannotWriteWhenAutoStartFalseAndTaskNotRunningOrCommitted = $FFFCF0E8;
  ErrorTaskVersionNew = $FFFCF0EA;
  ErrorChanVersionNew = $FFFCF0EB;
  ErrorEmptyString = $FFFCF0ED;
  ErrorChannelSizeTooBigForPortReadType = $FFFCF0EE;
  ErrorChannelSizeTooBigForPortWriteType = $FFFCF0EF;
  ErrorExpectedNumberOfChannelsVerificationFailed = $FFFCF0F0;
  ErrorNumLinesMismatchInReadOrWrite = $FFFCF0F1;
  ErrorOutputBufferEmpty = $FFFCF0F2;
  ErrorInvalidChanName = $FFFCF0F3;
  ErrorReadNoInputChansInTask = $FFFCF0F4;
  ErrorWriteNoOutputChansInTask = $FFFCF0F5;
  ErrorPropertyNotSupportedNotInputTask = $FFFCF0F7;
  ErrorPropertyNotSupportedNotOutputTask = $FFFCF0F8;
  ErrorGetPropertyNotInputBufferedTask = $FFFCF0F9;
  ErrorGetPropertyNotOutputBufferedTask = $FFFCF0FA;
  ErrorInvalidTimeoutVal = $FFFCF0FB;
  ErrorAttributeNotSupportedInTaskContext = $FFFCF0FC;
  ErrorAttributeNotQueryableUnlessTaskIsCommitted = $FFFCF0FD;
  ErrorAttributeNotSettableWhenTaskIsRunning = $FFFCF0FE;
  ErrorDACRngLowNotMinusRefValNorZero = $FFFCF0FF;
  ErrorDACRngHighNotEqualRefVal = $FFFCF100;
  ErrorUnitsNotFromCustomScale = $FFFCF101;
  ErrorInvalidVoltageReadingDuringExtCal = $FFFCF102;
  ErrorCalFunctionNotSupported = $FFFCF103;
  ErrorInvalidPhysicalChanForCal = $FFFCF104;
  ErrorExtCalNotComplete = $FFFCF105;
  ErrorCantSyncToExtStimulusFreqDuringCal = $FFFCF106;
  ErrorUnableToDetectExtStimulusFreqDuringCal = $FFFCF107;
  ErrorInvalidCloseAction = $FFFCF108;
  ErrorExtCalFunctionOutsideExtCalSession = $FFFCF109;
  ErrorInvalidCalArea = $FFFCF10A;
  ErrorExtCalConstsInvalid = $FFFCF10B;
  ErrorStartTrigDelayWithExtSampClk = $FFFCF10C;
  ErrorDelayFromSampClkWithExtConv = $FFFCF10D;
  ErrorFewerThan2PreScaledVals = $FFFCF10E;
  ErrorFewerThan2ScaledValues = $FFFCF10F;
  ErrorPhysChanOutputType = $FFFCF110;
  ErrorPhysChanMeasType = $FFFCF111;
  ErrorInvalidPhysChanType = $FFFCF112;
  ErrorLabVIEWEmptyTaskOrChans = $FFFCF113;
  ErrorLabVIEWInvalidTaskOrChans = $FFFCF114;
  ErrorInvalidRefClkRate = $FFFCF115;
  ErrorInvalidExtTrigImpedance = $FFFCF116;
  ErrorHystTrigLevelAIMax = $FFFCF117;
  ErrorLineNumIncompatibleWithVideoSignalFormat = $FFFCF118;
  ErrorTrigWindowAIMinAIMaxCombo = $FFFCF119;
  ErrorTrigAIMinAIMax = $FFFCF11A;
  ErrorHystTrigLevelAIMin = $FFFCF11B;
  ErrorInvalidSampRateConsiderRIS = $FFFCF11C;
  ErrorInvalidReadPosDuringRIS = $FFFCF11D;
  ErrorImmedTrigDuringRISMode = $FFFCF11E;
  ErrorTDCNotEnabledDuringRISMode = $FFFCF11F;
  ErrorMultiRecWithRIS = $FFFCF120;
  ErrorInvalidRefClkSrc = $FFFCF121;
  ErrorInvalidSampClkSrc = $FFFCF122;
  ErrorInsufficientOnBoardMemForNumRecsAndSamps = $FFFCF123;
  ErrorInvalidAIAttenuation = $FFFCF124;
  ErrorACCouplingNotAllowedWith50OhmImpedance = $FFFCF125;
  ErrorInvalidRecordNum = $FFFCF126;
  ErrorZeroSlopeLinearScale = $FFFCF127;
  ErrorZeroReversePolyScaleCoeffs = $FFFCF128;
  ErrorZeroForwardPolyScaleCoeffs = $FFFCF129;
  ErrorNoReversePolyScaleCoeffs = $FFFCF12A;
  ErrorNoForwardPolyScaleCoeffs = $FFFCF12B;
  ErrorNoPolyScaleCoeffs = $FFFCF12C;
  ErrorReversePolyOrderLessThanNumPtsToCompute = $FFFCF12D;
  ErrorReversePolyOrderNotPositive = $FFFCF12E;
  ErrorNumPtsToComputeNotPositive = $FFFCF12F;
  ErrorWaveformLengthNotMultipleOfIncr = $FFFCF130;
  ErrorCAPINoExtendedErrorInfoAvailable = $FFFCF131;
  ErrorCVIFunctionNotFoundInDAQmxDLL = $FFFCF132;
  ErrorCVIFailedToLoadDAQmxDLL = $FFFCF133;
  ErrorNoCommonTrigLineForImmedRoute = $FFFCF134;
  ErrorNoCommonTrigLineForTaskRoute = $FFFCF135;
  ErrorF64PrptyValNotUnsignedInt = $FFFCF136;
  ErrorRegisterNotWritable = $FFFCF137;
  ErrorInvalidOutputVoltageAtSampClkRate = $FFFCF138;
  ErrorStrobePhaseShiftDCMBecameUnlocked = $FFFCF139;
  ErrorDrivePhaseShiftDCMBecameUnlocked = $FFFCF13A;
  ErrorClkOutPhaseShiftDCMBecameUnlocked = $FFFCF13B;
  ErrorOutputBoardClkDCMBecameUnlocked = $FFFCF13C;
  ErrorInputBoardClkDCMBecameUnlocked = $FFFCF13D;
  ErrorInternalClkDCMBecameUnlocked = $FFFCF13E;
  ErrorDCMLock = $FFFCF13F;
  ErrorDataLineReservedForDynamicOutput = $FFFCF140;
  ErrorInvalidRefClkSrcGivenSampClkSrc = $FFFCF141;
  ErrorNoPatternMatcherAvailable = $FFFCF142;
  ErrorInvalidDelaySampRateBelowPhaseShiftDCMThresh = $FFFCF143;
  ErrorStrainGageCalibration = $FFFCF144;
  ErrorInvalidExtClockFreqAndDivCombo = $FFFCF145;
  ErrorCustomScaleDoesNotExist = $FFFCF146;
  ErrorOnlyFrontEndChanOpsDuringScan = $FFFCF147;
  ErrorInvalidOptionForDigitalPortChannel = $FFFCF148;
  ErrorUnsupportedSignalTypeExportSignal = $FFFCF149;
  ErrorInvalidSignalTypeExportSignal = $FFFCF14A;
  ErrorUnsupportedTrigTypeSendsSWTrig = $FFFCF14B;
  ErrorInvalidTrigTypeSendsSWTrig = $FFFCF14C;
  ErrorRepeatedPhysicalChan = $FFFCF14D;
  ErrorResourcesInUseForRouteInTask = $FFFCF14E;
  ErrorResourcesInUseForRoute = $FFFCF14F;
  ErrorRouteNotSupportedByHW = $FFFCF150;
  ErrorResourcesInUseForExportSignalPolarity = $FFFCF151;
  ErrorResourcesInUseForInversionInTask = $FFFCF152;
  ErrorResourcesInUseForInversion = $FFFCF153;
  ErrorExportSignalPolarityNotSupportedByHW = $FFFCF154;
  ErrorInversionNotSupportedByHW = $FFFCF155;
  ErrorOverloadedChansExistNotRead = $FFFCF156;
  ErrorInputFIFOOverflow2 = $FFFCF157;
  ErrorCJCChanNotSpecd = $FFFCF158;
  ErrorCtrExportSignalNotPossible = $FFFCF159;
  ErrorRefTrigWhenContinuous = $FFFCF15A;
  ErrorIncompatibleSensorOutputAndDeviceInputRanges = $FFFCF15B;
  ErrorCustomScaleNameUsed = $FFFCF15C;
  ErrorPropertyValNotSupportedByHW = $FFFCF15D;
  ErrorPropertyValNotValidTermName = $FFFCF15E;
  ErrorResourcesInUseForProperty = $FFFCF15F;
  ErrorCJCChanAlreadyUsed = $FFFCF160;
  ErrorForwardPolynomialCoefNotSpecd = $FFFCF161;
  ErrorTableScaleNumPreScaledAndScaledValsNotEqual = $FFFCF162;
  ErrorTableScalePreScaledValsNotSpecd = $FFFCF163;
  ErrorTableScaleScaledValsNotSpecd = $FFFCF164;
  ErrorIntermediateBufferSizeNotMultipleOfIncr = $FFFCF165;
  ErrorEventPulseWidthOutOfRange = $FFFCF166;
  ErrorEventDelayOutOfRange = $FFFCF167;
  ErrorSampPerChanNotMultipleOfIncr = $FFFCF168;
  ErrorCannotCalculateNumSampsTaskNotStarted = $FFFCF169;
  ErrorScriptNotInMem = $FFFCF16A;
  ErrorOnboardMemTooSmall = $FFFCF16B;
  ErrorReadAllAvailableDataWithoutBuffer = $FFFCF16C;
  ErrorPulseActiveAtStart = $FFFCF16D;
  ErrorCalTempNotSupported = $FFFCF16E;
  ErrorDelayFromSampClkTooLong = $FFFCF16F;
  ErrorDelayFromSampClkTooShort = $FFFCF170;
  ErrorAIConvRateTooHigh = $FFFCF171;
  ErrorDelayFromStartTrigTooLong = $FFFCF172;
  ErrorDelayFromStartTrigTooShort = $FFFCF173;
  ErrorSampRateTooHigh = $FFFCF174;
  ErrorSampRateTooLow = $FFFCF175;
  ErrorPFI0UsedForAnalogAndDigitalSrc = $FFFCF176;
  ErrorPrimingCfgFIFO = $FFFCF177;
  ErrorCannotOpenTopologyCfgFile = $FFFCF178;
  ErrorInvalidDTInsideWfmDataType = $FFFCF179;
  ErrorRouteSrcAndDestSame = $FFFCF17A;
  ErrorReversePolynomialCoefNotSpecd = $FFFCF17B;
  ErrorDevAbsentOrUnavailable = $FFFCF17C;
  ErrorNoAdvTrigForMultiDevScan = $FFFCF17D;
  ErrorInterruptsInsufficientDataXferMech = $FFFCF17E;
  ErrorInvalidAttentuationBasedOnMinMax = $FFFCF17F;
  ErrorCabledModuleCannotRouteSSH = $FFFCF180;
  ErrorCabledModuleCannotRouteConvClk = $FFFCF181;
  ErrorInvalidExcitValForScaling = $FFFCF182;
  ErrorNoDevMemForScript = $FFFCF183;
  ErrorScriptDataUnderflow = $FFFCF184;
  ErrorNoDevMemForWaveform = $FFFCF185;
  ErrorStreamDCMBecameUnlocked = $FFFCF186;
  ErrorStreamDCMLock = $FFFCF187;
  ErrorWaveformNotInMem = $FFFCF188;
  ErrorWaveformWriteOutOfBounds = $FFFCF189;
  ErrorWaveformPreviouslyAllocated = $FFFCF18A;
  ErrorSampClkTbMasterTbDivNotAppropriateForSampTbSrc = $FFFCF18B;
  ErrorSampTbRateSampTbSrcMismatch = $FFFCF18C;
  ErrorMasterTbRateMasterTbSrcMismatch = $FFFCF18D;
  ErrorSampsPerChanTooBig = $FFFCF18E;
  ErrorFinitePulseTrainNotPossible = $FFFCF18F;
  ErrorExtMasterTimebaseRateNotSpecified = $FFFCF190;
  ErrorExtSampClkSrcNotSpecified = $FFFCF191;
  ErrorInputSignalSlowerThanMeasTime = $FFFCF192;
  ErrorCannotUpdatePulseGenProperty = $FFFCF193;
  ErrorInvalidTimingType = $FFFCF194;
  ErrorPropertyUnavailWhenUsingOnboardMemory = $FFFCF197;
  ErrorCannotWriteAfterStartWithOnboardMemory = $FFFCF199;
  ErrorNotEnoughSampsWrittenForInitialXferRqstCondition = $FFFCF19A;
  ErrorNoMoreSpace = $FFFCF19B;
  ErrorSamplesCanNotYetBeWritten = $FFFCF19C;
  ErrorGenStoppedToPreventIntermediateBufferRegenOfOldSamples = $FFFCF19D;
  ErrorGenStoppedToPreventRegenOfOldSamples = $FFFCF19E;
  ErrorSamplesNoLongerWriteable = $FFFCF19F;
  ErrorSamplesWillNeverBeGenerated = $FFFCF1A0;
  ErrorNegativeWriteSampleNumber = $FFFCF1A1;
  ErrorNoAcqStarted = $FFFCF1A2;
  ErrorSamplesNotYetAvailable = $FFFCF1A4;
  ErrorAcqStoppedToPreventIntermediateBufferOverflow = $FFFCF1A5;
  ErrorNoRefTrigConfigured = $FFFCF1A6;
  ErrorCannotReadRelativeToRefTrigUntilDone = $FFFCF1A7;
  ErrorSamplesNoLongerAvailable = $FFFCF1A9;
  ErrorSamplesWillNeverBeAvailable = $FFFCF1AA;
  ErrorNegativeReadSampleNumber = $FFFCF1AB;
  ErrorExternalSampClkAndRefClkThruSameTerm = $FFFCF1AC;
  ErrorExtSampClkRateTooLowForClkIn = $FFFCF1AD;
  ErrorExtSampClkRateTooHighForBackplane = $FFFCF1AE;
  ErrorSampClkRateAndDivCombo = $FFFCF1AF;
  ErrorSampClkRateTooLowForDivDown = $FFFCF1B0;
  ErrorProductOfAOMinAndGainTooSmall = $FFFCF1B1;
  ErrorInterpolationRateNotPossible = $FFFCF1B2;
  ErrorOffsetTooLarge = $FFFCF1B3;
  ErrorOffsetTooSmall = $FFFCF1B4;
  ErrorProductOfAOMaxAndGainTooLarge = $FFFCF1B5;
  ErrorMinAndMaxNotSymmetric = $FFFCF1B6;
  ErrorInvalidAnalogTrigSrc = $FFFCF1B7;
  ErrorTooManyChansForAnalogRefTrig = $FFFCF1B8;
  ErrorTooManyChansForAnalogPauseTrig = $FFFCF1B9;
  ErrorTrigWhenOnDemandSampTiming = $FFFCF1BA;
  ErrorInconsistentAnalogTrigSettings = $FFFCF1BB;
  ErrorMemMapDataXferModeSampTimingCombo = $FFFCF1BC;
  ErrorInvalidJumperedAttr = $FFFCF1BD;
  ErrorInvalidGainBasedOnMinMax = $FFFCF1BE;
  ErrorInconsistentExcit = $FFFCF1BF;
  ErrorTopologyNotSupportedByCfgTermBlock = $FFFCF1C0;
  ErrorBuiltInTempSensorNotSupported = $FFFCF1C1;
  ErrorInvalidTerm = $FFFCF1C2;
  ErrorCannotTristateTerm = $FFFCF1C3;
  ErrorCannotTristateBusyTerm = $FFFCF1C4;
  ErrorNoDMAChansAvailable = $FFFCF1C5;
  ErrorInvalidWaveformLengthWithinLoopInScript = $FFFCF1C6;
  ErrorInvalidSubsetLengthWithinLoopInScript = $FFFCF1C7;
  ErrorMarkerPosInvalidForLoopInScript = $FFFCF1C8;
  ErrorIntegerExpectedInScript = $FFFCF1C9;
  ErrorPLLBecameUnlocked = $FFFCF1CA;
  ErrorPLLLock = $FFFCF1CB;
  ErrorDDCClkOutDCMBecameUnlocked = $FFFCF1CC;
  ErrorDDCClkOutDCMLock = $FFFCF1CD;
  ErrorClkDoublerDCMBecameUnlocked = $FFFCF1CE;
  ErrorClkDoublerDCMLock = $FFFCF1CF;
  ErrorSampClkDCMBecameUnlocked = $FFFCF1D0;
  ErrorSampClkDCMLock = $FFFCF1D1;
  ErrorSampClkTimebaseDCMBecameUnlocked = $FFFCF1D2;
  ErrorSampClkTimebaseDCMLock = $FFFCF1D3;
  ErrorAttrCannotBeReset = $FFFCF1D4;
  ErrorExplanationNotFound = $FFFCF1D5;
  ErrorWriteBufferTooSmall = $FFFCF1D6;
  ErrorSpecifiedAttrNotValid = $FFFCF1D7;
  ErrorAttrCannotBeRead = $FFFCF1D8;
  ErrorAttrCannotBeSet = $FFFCF1D9;
  ErrorNULLPtrForC_Api = $FFFCF1DA;
  ErrorReadBufferTooSmall = $FFFCF1DB;
  ErrorBufferTooSmallForString = $FFFCF1DC;
  ErrorNoAvailTrigLinesOnDevice = $FFFCF1DD;
  ErrorTrigBusLineNotAvail = $FFFCF1DE;
  ErrorCouldNotReserveRequestedTrigLine = $FFFCF1DF;
  ErrorTrigLineNotFound = $FFFCF1E0;
  ErrorSCXI1126ThreshHystCombination = $FFFCF1E1;
  ErrorAcqStoppedToPreventInputBufferOverwrite = $FFFCF1E2;
  ErrorTimeoutExceeded = $FFFCF1E3;
  ErrorInvalidDeviceID = $FFFCF1E4;
  ErrorInvalidAOChanOrder = $FFFCF1E5;
  ErrorSampleTimingTypeAndDataXferMode = $FFFCF1E6;
  ErrorBufferWithOnDemandSampTiming = $FFFCF1E7;
  ErrorBufferAndDataXferMode = $FFFCF1E8;
  ErrorMemMapAndBuffer = $FFFCF1E9;
  ErrorNoAnalogTrigHW = $FFFCF1EA;
  ErrorTooManyPretrigPlusMinPostTrigSamps = $FFFCF1EB;
  ErrorInconsistentUnitsSpecified = $FFFCF1EC;
  ErrorMultipleRelaysForSingleRelayOp = $FFFCF1ED;
  ErrorMultipleDevIDsPerChassisSpecifiedInList = $FFFCF1EE;
  ErrorDuplicateDevIDInList = $FFFCF1EF;
  ErrorInvalidRangeStatementCharInList = $FFFCF1F0;
  ErrorInvalidDeviceIDInList = $FFFCF1F1;
  ErrorTriggerPolarityConflict = $FFFCF1F2;
  ErrorCannotScanWithCurrentTopology = $FFFCF1F3;
  ErrorUnexpectedIdentifierInFullySpecifiedPathInList = $FFFCF1F4;
  ErrorSwitchCannotDriveMultipleTrigLines = $FFFCF1F5;
  ErrorInvalidRelayName = $FFFCF1F6;
  ErrorSwitchScanlistTooBig = $FFFCF1F7;
  ErrorSwitchChanInUse = $FFFCF1F8;
  ErrorSwitchNotResetBeforeScan = $FFFCF1F9;
  ErrorInvalidTopology = $FFFCF1FA;
  ErrorAttrNotSupported = $FFFCF1FB;
  ErrorUnexpectedEndOfActionsInList = $FFFCF1FC;
  ErrorPowerBudgetExceeded = $FFFCF1FD;
  ErrorHWUnexpectedlyPoweredOffAndOn = $FFFCF1FE;
  ErrorSwitchOperationNotSupported = $FFFCF1FF;
  ErrorOnlyContinuousScanSupported = $FFFCF200;
  ErrorSwitchDifferentTopologyWhenScanning = $FFFCF201;
  ErrorDisconnectPathNotSameAsExistingPath = $FFFCF202;
  ErrorConnectionNotPermittedOnChanReservedForRouting = $FFFCF203;
  ErrorCannotConnectSrcChans = $FFFCF204;
  ErrorCannotConnectChannelToItself = $FFFCF205;
  ErrorChannelNotReservedForRouting = $FFFCF206;
  ErrorCannotConnectChansDirectly = $FFFCF207;
  ErrorChansAlreadyConnected = $FFFCF208;
  ErrorChanDuplicatedInPath = $FFFCF209;
  ErrorNoPathToDisconnect = $FFFCF20A;
  ErrorInvalidSwitchChan = $FFFCF20B;
  ErrorNoPathAvailableBetween2SwitchChans = $FFFCF20C;
  ErrorExplicitConnectionExists = $FFFCF20D;
  ErrorSwitchDifferentSettlingTimeWhenScanning = $FFFCF20E;
  ErrorOperationOnlyPermittedWhileScanning = $FFFCF20F;
  ErrorOperationNotPermittedWhileScanning = $FFFCF210;
  ErrorHardwareNotResponding = $FFFCF211;
  ErrorInvalidSampAndMasterTimebaseRateCombo = $FFFCF213;
  ErrorNonZeroBufferSizeInProgIOXfer = $FFFCF214;
  ErrorVirtualChanNameUsed = $FFFCF215;
  ErrorPhysicalChanDoesNotExist = $FFFCF216;
  ErrorMemMapOnlyForProgIOXfer = $FFFCF217;
  ErrorTooManyChans = $FFFCF218;
  ErrorCannotHaveCJTempWithOtherChans = $FFFCF219;
  ErrorOutputBufferUnderwrite = $FFFCF21A;
  ErrorSensorInvalidCompletionResistance = $FFFCF21D;
  ErrorVoltageExcitIncompatibleWith2WireCfg = $FFFCF21E;
  ErrorIntExcitSrcNotAvailable = $FFFCF21F;
  ErrorCannotCreateChannelAfterTaskVerified = $FFFCF220;
  ErrorLinesReservedForSCXIControl = $FFFCF221;
  ErrorCouldNotReserveLinesForSCXIControl = $FFFCF222;
  ErrorCalibrationFailed = $FFFCF223;
  ErrorReferenceFrequencyInvalid = $FFFCF224;
  ErrorReferenceResistanceInvalid = $FFFCF225;
  ErrorReferenceCurrentInvalid = $FFFCF226;
  ErrorReferenceVoltageInvalid = $FFFCF227;
  ErrorEEPROMDataInvalid = $FFFCF228;
  ErrorCabledModuleNotCapableOfRoutingAI = $FFFCF229;
  ErrorChannelNotAvailableInParallelMode = $FFFCF22A;
  ErrorExternalTimebaseRateNotKnownForDelay = $FFFCF22B;
  ErrorFREQOUTCannotProduceDesiredFrequency = $FFFCF22C;
  ErrorMultipleCounterInputTask = $FFFCF22D;
  ErrorCounterStartPauseTriggerConflict = $FFFCF22E;
  ErrorCounterInputPauseTriggerAndSampleClockInvalid = $FFFCF22F;
  ErrorCounterOutputPauseTriggerInvalid = $FFFCF230;
  ErrorCounterTimebaseRateNotSpecified = $FFFCF231;
  ErrorCounterTimebaseRateNotFound = $FFFCF232;
  ErrorCounterOverflow = $FFFCF233;
  ErrorCounterNoTimebaseEdgesBetweenGates = $FFFCF234;
  ErrorCounterMaxMinRangeFreq = $FFFCF235;
  ErrorCounterMaxMinRangeTime = $FFFCF236;
  ErrorSuitableTimebaseNotFoundTimeCombo = $FFFCF237;
  ErrorSuitableTimebaseNotFoundFrequencyCombo = $FFFCF238;
  ErrorInternalTimebaseSourceDivisorCombo = $FFFCF239;
  ErrorInternalTimebaseSourceRateCombo = $FFFCF23A;
  ErrorInternalTimebaseRateDivisorSourceCombo = $FFFCF23B;
  ErrorExternalTimebaseRateNotknownForRate = $FFFCF23C;
  ErrorAnalogTrigChanNotFirstInScanList = $FFFCF23D;
  ErrorNoDivisorForExternalSignal = $FFFCF23E;
  ErrorAttributeInconsistentAcrossRepeatedPhysicalChannels = $FFFCF240;
  ErrorCannotHandshakeWithPort0 = $FFFCF241;
  ErrorControlLineConflictOnPortC = $FFFCF242;
  ErrorLines4To7ConfiguredForOutput = $FFFCF243;
  ErrorLines4To7ConfiguredForInput = $FFFCF244;
  ErrorLines0To3ConfiguredForOutput = $FFFCF245;
  ErrorLines0To3ConfiguredForInput = $FFFCF246;
  ErrorPortConfiguredForOutput = $FFFCF247;
  ErrorPortConfiguredForInput = $FFFCF248;
  ErrorPortConfiguredForStaticDigitalOps = $FFFCF249;
  ErrorPortReservedForHandshaking = $FFFCF24A;
  ErrorPortDoesNotSupportHandshakingDataIO = $FFFCF24B;
  ErrorCannotTristate8255OutputLines = $FFFCF24C;
  ErrorTemperatureOutOfRangeForCalibration = $FFFCF24F;
  ErrorCalibrationHandleInvalid = $FFFCF250;
  ErrorPasswordRequired = $FFFCF251;
  ErrorIncorrectPassword = $FFFCF252;
  ErrorPasswordTooLong = $FFFCF253;
  ErrorCalibrationSessionAlreadyOpen = $FFFCF254;
  ErrorSCXIModuleIncorrect = $FFFCF255;
  ErrorAttributeInconsistentAcrossChannelsOnDevice = $FFFCF256;
  ErrorSCXI1122ResistanceChanNotSupportedForCfg = $FFFCF257;
  ErrorBracketPairingMismatchInList = $FFFCF258;
  ErrorInconsistentNumSamplesToWrite = $FFFCF259;
  ErrorIncorrectDigitalPattern = $FFFCF25A;
  ErrorIncorrectNumChannelsToWrite = $FFFCF25B;
  ErrorIncorrectReadFunction = $FFFCF25C;
  ErrorPhysicalChannelNotSpecified = $FFFCF25D;
  ErrorMoreThanOneTerminal = $FFFCF25E;
  ErrorMoreThanOneActiveChannelSpecified = $FFFCF25F;
  ErrorInvalidNumberSamplesToRead = $FFFCF260;
  ErrorAnalogWaveformExpected = $FFFCF261;
  ErrorDigitalWaveformExpected = $FFFCF262;
  ErrorActiveChannelNotSpecified = $FFFCF263;
  ErrorFunctionNotSupportedForDeviceTasks = $FFFCF264;
  ErrorFunctionNotInLibrary = $FFFCF265;
  ErrorLibraryNotPresent = $FFFCF266;
  ErrorDuplicateTask = $FFFCF267;
  ErrorInvalidTask = $FFFCF268;
  ErrorInvalidChannel = $FFFCF269;
  ErrorInvalidSyntaxForPhysicalChannelRange = $FFFCF26A;
  ErrorMinNotLessThanMax = $FFFCF26E;
  ErrorSampleRateNumChansConvertPeriodCombo = $FFFCF26F;
  ErrorAODuringCounter1DMAConflict = $FFFCF271;
  ErrorAIDuringCounter0DMAConflict = $FFFCF272;
  ErrorInvalidAttributeValue = $FFFCF273;
  ErrorSuppliedCurrentDataOutsideSpecifiedRange = $FFFCF274;
  ErrorSuppliedVoltageDataOutsideSpecifiedRange = $FFFCF275;
  ErrorCannotStoreCalConst = $FFFCF276;
  ErrorSCXIModuleNotFound = $FFFCF277;
  ErrorDuplicatePhysicalChansNotSupported = $FFFCF278;
  ErrorTooManyPhysicalChansInList = $FFFCF279;
  ErrorInvalidAdvanceEventTriggerType = $FFFCF27A;
  ErrorDeviceIsNotAValidSwitch = $FFFCF27B;
  ErrorDeviceDoesNotSupportScanning = $FFFCF27C;
  ErrorScanListCannotBeTimed = $FFFCF27D;
  ErrorConnectOperatorInvalidAtPointInList = $FFFCF27E;
  ErrorUnexpectedSwitchActionInList = $FFFCF27F;
  ErrorUnexpectedSeparatorInList = $FFFCF280;
  ErrorExpectedTerminatorInList = $FFFCF281;
  ErrorExpectedConnectOperatorInList = $FFFCF282;
  ErrorExpectedSeparatorInList = $FFFCF283;
  ErrorFullySpecifiedPathInListContainsRange = $FFFCF284;
  ErrorConnectionSeparatorAtEndOfList = $FFFCF285;
  ErrorIdentifierInListTooLong = $FFFCF286;
  ErrorDuplicateDeviceIDInListWhenSettling = $FFFCF287;
  ErrorChannelNameNotSpecifiedInList = $FFFCF288;
  ErrorDeviceIDNotSpecifiedInList = $FFFCF289;
  ErrorSemicolonDoesNotFollowRangeInList = $FFFCF28A;
  ErrorSwitchActionInListSpansMultipleDevices = $FFFCF28B;
  ErrorRangeWithoutAConnectActionInList = $FFFCF28C;
  ErrorInvalidIdentifierFollowingSeparatorInList = $FFFCF28D;
  ErrorInvalidChannelNameInList = $FFFCF28E;
  ErrorInvalidNumberInRepeatStatementInList = $FFFCF28F;
  ErrorInvalidTriggerLineInList = $FFFCF290;
  ErrorInvalidIdentifierInListFollowingDeviceID = $FFFCF291;
  ErrorInvalidIdentifierInListAtEndOfSwitchAction = $FFFCF292;
  ErrorDeviceRemoved = $FFFCF293;
  ErrorRoutingPathNotAvailable = $FFFCF294;
  ErrorRoutingHardwareBusy = $FFFCF295;
  ErrorRequestedSignalInversionForRoutingNotPossible = $FFFCF296;
  ErrorInvalidRoutingDestinationTerminalName = $FFFCF297;
  ErrorInvalidRoutingSourceTerminalName = $FFFCF298;
  ErrorRoutingNotSupportedForDevice = $FFFCF299;
  ErrorWaitIsLastInstructionOfLoopInScript = $FFFCF29A;
  ErrorClearIsLastInstructionOfLoopInScript = $FFFCF29B;
  ErrorInvalidLoopIterationsInScript = $FFFCF29C;
  ErrorRepeatLoopNestingTooDeepInScript = $FFFCF29D;
  ErrorMarkerPositionOutsideSubsetInScript = $FFFCF29E;
  ErrorSubsetStartOffsetNotAlignedInScript = $FFFCF29F;
  ErrorInvalidSubsetLengthInScript = $FFFCF2A0;
  ErrorMarkerPositionNotAlignedInScript = $FFFCF2A1;
  ErrorSubsetOutsideWaveformInScript = $FFFCF2A2;
  ErrorMarkerOutsideWaveformInScript = $FFFCF2A3;
  ErrorWaveformInScriptNotInMem = $FFFCF2A4;
  ErrorKeywordExpectedInScript = $FFFCF2A5;
  ErrorBufferNameExpectedInScript = $FFFCF2A6;
  ErrorProcedureNameExpectedInScript = $FFFCF2A7;
  ErrorScriptHasInvalidIdentifier = $FFFCF2A8;
  ErrorScriptHasInvalidCharacter = $FFFCF2A9;
  ErrorResourceAlreadyReserved = $FFFCF2AA;
  ErrorSelfTestFailed = $FFFCF2AC;
  ErrorADCOverrun = $FFFCF2AD;
  ErrorDACUnderflow = $FFFCF2AE;
  ErrorInputFIFOUnderflow = $FFFCF2AF;
  ErrorOutputFIFOUnderflow = $FFFCF2B0;
  ErrorSCXISerialCommunication = $FFFCF2B1;
  ErrorDigitalTerminalSpecifiedMoreThanOnce = $FFFCF2B2;
  ErrorDigitalOutputNotSupported = $FFFCF2B4;
  ErrorInconsistentChannelDirections = $FFFCF2B5;
  ErrorInputFIFOOverflow = $FFFCF2B6;
  ErrorTimeStampOverwritten = $FFFCF2B7;
  ErrorStopTriggerHasNotOccurred = $FFFCF2B8;
  ErrorRecordNotAvailable = $FFFCF2B9;
  ErrorRecordOverwritten = $FFFCF2BA;
  ErrorDataNotAvailable = $FFFCF2BB;
  ErrorDataOverwrittenInDeviceMemory = $FFFCF2BC;
  ErrorDuplicatedChannel = $FFFCF2BD;
  WarningTimestampCounterRolledOver = $00030D43;
  WarningInputTerminationOverloaded = $00030D44;
  WarningADCOverloaded = $00030D45;
  WarningPLLUnlocked = $00030D47;
  WarningCounter0DMADuringAIConflict = $00030D48;
  WarningCounter1DMADuringAOConflict = $00030D49;
  WarningStoppedBeforeDone = $00030D4A;
  WarningRateViolatesSettlingTime = $00030D4B;
  WarningRateViolatesMaxADCRate = $00030D4C;
  WarningUserDefInfoStringTooLong = $00030D4D;
  WarningTooManyInterruptsPerSecond = $00030D4E;
  WarningPotentialGlitchDuringWrite = $00030D4F;
  WarningDevNotSelfCalibratedWithDAQmx = $00030D50;
  WarningAISampRateTooLow = $00030D51;
  WarningAIConvRateTooLow = $00030D52;
  WarningReadOffsetCoercion = $00030D53;
  WarningPretrigCoercion = $00030D54;
  WarningSampValCoercedToMax = $00030D55;
  WarningSampValCoercedToMin = $00030D56;
  WarningPropertyVersionNew = $00030D58;
  WarningUserDefinedInfoTooLong = $00030D59;
  WarningCAPIStringTruncatedToFitBuffer = $00030D5A;
  WarningSampClkRateTooLow = $00030D5B;
  WarningPossiblyInvalidCTRSampsInFiniteDMAAcq = $00030D5C;
  WarningRISAcqCompletedSomeBinsNotFilled = $00030D5D;
  WarningPXIDevTempExceedsMaxOpTemp = $00030D5E;
  WarningOutputGainTooLowForRFFreq = $00030D5F;
  WarningOutputGainTooHighForRFFreq = $00030D60;
  WarningMultipleWritesBetweenSampClks = $00030D61;
  WarningDeviceMayShutDownDueToHighTemp = $00030D62;
  WarningRateViolatesMinADCRate = $00030D63;
  WarningSampClkRateAboveDevSpecs = $00030D64;
  WarningCOPrevDAQmxWriteSettingsOverwrittenForHWTimedSinglePoint = $00030D65;
  WarningLowpassFilterSettlingTimeExceedsUserTimeBetween2ADCConversions = $00030D66;
  WarningLowpassFilterSettlingTimeExceedsDriverTimeBetween2ADCConversions = $00030D67;
  WarningSampClkRateViolatesSettlingTimeForGen = $00030D68;
  WarningInvalidCalConstValueForAI = $00030D69;
  WarningInvalidCalConstValueForAO = $00030D6A;
  WarningChanCalExpired = $00030D6B;
  WarningUnrecognizedEnumValueEncounteredInStorage = $00030D6C;
  WarningTableCRCNotCorrect = $00030D6D;
  WarningExternalCRCNotCorrect = $00030D6E;
  WarningSelfCalCRCNotCorrect = $00030D6F;
  WarningDeviceSpecExceeded = $00030D70;
  WarningOnlyGainCalibrated = $00030D71;
  WarningReadNotCompleteBeforeSampClk = $00033388;
  WarningWriteNotCompleteBeforeSampClk = $00033389;
  WarningWaitForNextSampClkDetectedMissedSampClk = $0003338A;
  ErrorRoutingDestTermPXIClk10InNotInStarTriggerSlot_Routing = $FFFEA3B6;
  ErrorRoutingDestTermPXIClk10InNotInSystemTimingSlot_Routing = $FFFEA3B7;
  ErrorRoutingDestTermPXIStarXNotInStarTriggerSlot_Routing = $FFFEA3B8;
  ErrorRoutingDestTermPXIStarXNotInSystemTimingSlot_Routing = $FFFEA3B9;
  ErrorRoutingSrcTermPXIStarXNotInStarTriggerSlot_Routing = $FFFEA3BA;
  ErrorRoutingSrcTermPXIStarXNotInSystemTimingSlot_Routing = $FFFEA3BB;
  ErrorRoutingSrcTermPXIStarInNonStarTriggerSlot_Routing = $FFFEA3BC;
  ErrorRoutingDestTermPXIStarInNonStarTriggerSlot_Routing = $FFFEA3BD;
  ErrorRoutingDestTermPXIStarInStarTriggerSlot_Routing = $FFFEA3BE;
  ErrorRoutingDestTermPXIStarInSystemTimingSlot_Routing = $FFFEA3BF;
  ErrorRoutingSrcTermPXIStarInStarTriggerSlot_Routing = $FFFEA3C0;
  ErrorRoutingSrcTermPXIStarInSystemTimingSlot_Routing = $FFFEA3C1;
  ErrorInvalidSignalModifier_Routing = $FFFEA3C2;
  ErrorRoutingDestTermPXIClk10InNotInSlot2_Routing = $FFFEA3C3;
  ErrorRoutingDestTermPXIStarXNotInSlot2_Routing = $FFFEA3C4;
  ErrorRoutingSrcTermPXIStarXNotInSlot2_Routing = $FFFEA3C5;
  ErrorRoutingSrcTermPXIStarInSlot16AndAbove_Routing = $FFFEA3C6;
  ErrorRoutingDestTermPXIStarInSlot16AndAbove_Routing = $FFFEA3C7;
  ErrorRoutingDestTermPXIStarInSlot2_Routing = $FFFEA3C8;
  ErrorRoutingSrcTermPXIStarInSlot2_Routing = $FFFEA3C9;
  ErrorRoutingDestTermPXIChassisNotIdentified_Routing = $FFFEA3CA;
  ErrorRoutingSrcTermPXIChassisNotIdentified_Routing = $FFFEA3CB;
  ErrorTrigLineNotFoundSingleDevRoute_Routing = $FFFEA3CC;
  ErrorNoCommonTrigLineForRoute_Routing = $FFFEA3CD;
  ErrorResourcesInUseForRouteInTask_Routing = $FFFEA3CE;
  ErrorResourcesInUseForRoute_Routing = $FFFEA3CF;
  ErrorRouteNotSupportedByHW_Routing = $FFFEA3D0;
  ErrorResourcesInUseForInversionInTask_Routing = $FFFEA3D1;
  ErrorResourcesInUseForInversion_Routing = $FFFEA3D2;
  ErrorInversionNotSupportedByHW_Routing = $FFFEA3D3;
  ErrorResourcesInUseForProperty_Routing = $FFFEA3D4;
  ErrorRouteSrcAndDestSame_Routing = $FFFEA3D5;
  ErrorDevAbsentOrUnavailable_Routing = $FFFEA3D6;
  ErrorInvalidTerm_Routing = $FFFEA3D7;
  ErrorCannotTristateTerm_Routing = $FFFEA3D8;
  ErrorCannotTristateBusyTerm_Routing = $FFFEA3D9;
  ErrorCouldNotReserveRequestedTrigLine_Routing = $FFFEA3DA;
  ErrorTrigLineNotFound_Routing = $FFFEA3DB;
  ErrorRoutingPathNotAvailable_Routing = $FFFEA3DC;
  ErrorRoutingHardwareBusy_Routing = $FFFEA3DD;
  ErrorRequestedSignalInversionForRoutingNotPossible_Routing = $FFFEA3DE;
  ErrorInvalidRoutingDestinationTerminalName_Routing = $FFFEA3DF;
  ErrorInvalidRoutingSourceTerminalName_Routing = $FFFEA3E0;
  ErrorCouldNotConnectToServer_Routing = $FFFEA4BC;
  ErrorDeviceNameNotFound_Routing = $FFFEA573;
  ErrorLocalRemoteDriverVersionMismatch_Routing = $FFFEA574;
  ErrorDuplicateDeviceName_Routing = $FFFEA575;
  ErrorRuntimeAborting_Routing = $FFFEA57A;
  ErrorRuntimeAborted_Routing = $FFFEA57B;
  ErrorResourceNotInPool_Routing = $FFFEA57C;
  ErrorDriverDeviceGUIDNotFound_Routing = $FFFEA57F;
  ErrorValueInvalid = $FFFF2CF9;
  ErrorValueNotInSet = $FFFF2CFA;
  ErrorValueOutOfRange = $FFFF2CFB;
  ErrorTypeUnknown = $FFFF2CFC;
  ErrorInterconnectBridgeRouteReserved = $FFFF2D04;
  ErrorInterconnectBridgeRouteNotPossible = $FFFF2D05;
  ErrorInterconnectLineReserved = $FFFF2D06;
  ErrorInterconnectBusNotFound = $FFFF2D0E;
  ErrorEndpointNotFound = $FFFF2D0F;
  ErrorResourceNotFound = $FFFF2D10;
  ErrorPALBusResetOccurred = $FFFF3990;
  ErrorPALWaitInterrupted = $FFFF39F4;
  ErrorPALMessageUnderflow = $FFFF3A25;
  ErrorPALMessageOverflow = $FFFF3A26;
  ErrorPALThreadAlreadyDead = $FFFF3A54;
  ErrorPALThreadStackSizeNotSupported = $FFFF3A55;
  ErrorPALThreadControllerIsNotThreadCreator = $FFFF3A56;
  ErrorPALThreadHasNoThreadObject = $FFFF3A57;
  ErrorPALThreadCouldNotRun = $FFFF3A58;
  ErrorPALSyncTimedOut = $FFFF3A8A;
  ErrorPALReceiverSocketInvalid = $FFFF3AB9;
  ErrorPALSocketListenerInvalid = $FFFF3ABA;
  ErrorPALSocketListenerAlreadyRegistered = $FFFF3ABB;
  ErrorPALDispatcherAlreadyExported = $FFFF3ABC;
  ErrorPALDMALinkEventMissed = $FFFF3AEE;
  ErrorPALBusError = $FFFF3B13;
  ErrorPALRetryLimitExceeded = $FFFF3B14;
  ErrorPALTransferOverread = $FFFF3B15;
  ErrorPALTransferOverwritten = $FFFF3B16;
  ErrorPALPhysicalBufferFull = $FFFF3B17;
  ErrorPALPhysicalBufferEmpty = $FFFF3B18;
  ErrorPALLogicalBufferFull = $FFFF3B19;
  ErrorPALLogicalBufferEmpty = $FFFF3B1A;
  ErrorPALTransferAborted = $FFFF3B1B;
  ErrorPALTransferStopped = $FFFF3B1C;
  ErrorPALTransferInProgress = $FFFF3B1D;
  ErrorPALTransferNotInProgress = $FFFF3B1E;
  ErrorPALCommunicationsFault = $FFFF3B1F;
  ErrorPALTransferTimedOut = $FFFF3B20;
  ErrorPALMemoryBlockCheckFailed = $FFFF3B4E;
  ErrorPALMemoryPageLockFailed = $FFFF3B4F;
  ErrorPALMemoryFull = $FFFF3B50;
  ErrorPALMemoryAlignmentFault = $FFFF3B51;
  ErrorPALMemoryConfigurationFault = $FFFF3B52;
  ErrorPALDeviceInitializationFault = $FFFF3B81;
  ErrorPALDeviceNotSupported = $FFFF3B82;
  ErrorPALDeviceUnknown = $FFFF3B83;
  ErrorPALDeviceNotFound = $FFFF3B84;
  ErrorPALFeatureDisabled = $FFFF3BA7;
  ErrorPALComponentBusy = $FFFF3BA8;
  ErrorPALComponentAlreadyInstalled = $FFFF3BA9;
  ErrorPALComponentNotUnloadable = $FFFF3BAA;
  ErrorPALComponentNeverLoaded = $FFFF3BAB;
  ErrorPALComponentAlreadyLoaded = $FFFF3BAC;
  ErrorPALComponentCircularDependency = $FFFF3BAD;
  ErrorPALComponentInitializationFault = $FFFF3BAE;
  ErrorPALComponentImageCorrupt = $FFFF3BAF;
  ErrorPALFeatureNotSupported = $FFFF3BB0;
  ErrorPALFunctionNotFound = $FFFF3BB1;
  ErrorPALFunctionObsolete = $FFFF3BB2;
  ErrorPALComponentTooNew = $FFFF3BB3;
  ErrorPALComponentTooOld = $FFFF3BB4;
  ErrorPALComponentNotFound = $FFFF3BB5;
  ErrorPALVersionMismatch = $FFFF3BB6;
  ErrorPALFileFault = $FFFF3BDF;
  ErrorPALFileWriteFault = $FFFF3BE0;
  ErrorPALFileReadFault = $FFFF3BE1;
  ErrorPALFileSeekFault = $FFFF3BE2;
  ErrorPALFileCloseFault = $FFFF3BE3;
  ErrorPALFileOpenFault = $FFFF3BE4;
  ErrorPALDiskFull = $FFFF3BE5;
  ErrorPALOSFault = $FFFF3BE6;
  ErrorPALOSInitializationFault = $FFFF3BE7;
  ErrorPALOSUnsupported = $FFFF3BE8;
  ErrorPALCalculationOverflow = $FFFF3C01;
  ErrorPALHardwareFault = $FFFF3C18;
  ErrorPALFirmwareFault = $FFFF3C19;
  ErrorPALSoftwareFault = $FFFF3C1A;
  ErrorPALMessageQueueFull = $FFFF3C44;
  ErrorPALResourceAmbiguous = $FFFF3C45;
  ErrorPALResourceBusy = $FFFF3C46;
  ErrorPALResourceInitialized = $FFFF3C47;
  ErrorPALResourceNotInitialized = $FFFF3C48;
  ErrorPALResourceReserved = $FFFF3C49;
  ErrorPALResourceNotReserved = $FFFF3C4A;
  ErrorPALResourceNotAvailable = $FFFF3C4B;
  ErrorPALResourceOwnedBySystem = $FFFF3C4C;
  ErrorPALBadToken = $FFFF3C9C;
  ErrorPALBadThreadMultitask = $FFFF3C9D;
  ErrorPALBadLibrarySpecifier = $FFFF3C9E;
  ErrorPALBadAddressSpace = $FFFF3C9F;
  ErrorPALBadWindowType = $FFFF3CA0;
  ErrorPALBadAddressClass = $FFFF3CA1;
  ErrorPALBadWriteCount = $FFFF3CA2;
  ErrorPALBadWriteOffset = $FFFF3CA3;
  ErrorPALBadWriteMode = $FFFF3CA4;
  ErrorPALBadReadCount = $FFFF3CA5;
  ErrorPALBadReadOffset = $FFFF3CA6;
  ErrorPALBadReadMode = $FFFF3CA7;
  ErrorPALBadCount = $FFFF3CA8;
  ErrorPALBadOffset = $FFFF3CA9;
  ErrorPALBadMode = $FFFF3CAA;
  ErrorPALBadDataSize = $FFFF3CAB;
  ErrorPALBadPointer = $FFFF3CAC;
  ErrorPALBadSelector = $FFFF3CAD;
  ErrorPALBadDevice = $FFFF3CAE;
  ErrorPALIrrelevantAttribute = $FFFF3CAF;
  ErrorPALValueConflict = $FFFF3CB0;
  WarningPALValueConflict = $0000C350;
  WarningPALIrrelevantAttribute = $0000C351;
  WarningPALBadDevice = $0000C352;
  WarningPALBadSelector = $0000C353;
  WarningPALBadPointer = $0000C354;
  WarningPALBadDataSize = $0000C355;
  WarningPALBadMode = $0000C356;
  WarningPALBadOffset = $0000C357;
  WarningPALBadCount = $0000C358;
  WarningPALBadReadMode = $0000C359;
  WarningPALBadReadOffset = $0000C35A;
  WarningPALBadReadCount = $0000C35B;
  WarningPALBadWriteMode = $0000C35C;
  WarningPALBadWriteOffset = $0000C35D;
  WarningPALBadWriteCount = $0000C35E;
  WarningPALBadAddressClass = $0000C35F;
  WarningPALBadWindowType = $0000C360;
  WarningPALBadThreadMultitask = $0000C363;
  WarningPALResourceOwnedBySystem = $0000C3B4;
  WarningPALResourceNotAvailable = $0000C3B5;
  WarningPALResourceNotReserved = $0000C3B6;
  WarningPALResourceReserved = $0000C3B7;
  WarningPALResourceNotInitialized = $0000C3B8;
  WarningPALResourceInitialized = $0000C3B9;
  WarningPALResourceBusy = $0000C3BA;
  WarningPALResourceAmbiguous = $0000C3BB;
  WarningPALFirmwareFault = $0000C3E7;
  WarningPALHardwareFault = $0000C3E8;
  WarningPALOSUnsupported = $0000C418;
  WarningPALOSFault = $0000C41A;
  WarningPALFunctionObsolete = $0000C44E;
  WarningPALFunctionNotFound = $0000C44F;
  WarningPALFeatureNotSupported = $0000C450;
  WarningPALComponentInitializationFault = $0000C452;
  WarningPALComponentAlreadyLoaded = $0000C454;
  WarningPALComponentNotUnloadable = $0000C456;
  WarningPALMemoryAlignmentFault = $0000C4AF;
  WarningPALMemoryHeapNotEmpty = $0000C4B3;
  WarningPALTransferNotInProgress = $0000C4E2;
  WarningPALTransferInProgress = $0000C4E3;
  WarningPALTransferStopped = $0000C4E4;
  WarningPALTransferAborted = $0000C4E5;
  WarningPALLogicalBufferEmpty = $0000C4E6;
  WarningPALLogicalBufferFull = $0000C4E7;
  WarningPALPhysicalBufferEmpty = $0000C4E8;
  WarningPALPhysicalBufferFull = $0000C4E9;
  WarningPALTransferOverwritten = $0000C4EA;
  WarningPALTransferOverread = $0000C4EB;
  WarningPALDispatcherAlreadyExported = $0000C544;
  WarningPALSyncAbandoned = $0000C577;
  WarningValueNotInSet = $0000D306;

type

// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}
  PWordBool1 = ^WordBool; {*}
  PDouble1 = ^Double; {*}
  PSmallint1 = ^Smallint; {*}
  PByte1 = ^Byte; {*}
  PUserType1 = ^DAQmxSwitchPathType; {*}
  PUserType2 = ^DAQmxRelayPos; {*}
  PWideString1 = ^WideString; {*}
  PUserType3 = ^DAQmxDigitalLineState; {*}
  PUserType4 = ^DAQmxPowerUpStates; {*}
  PUserType5 = ^DAQmxPowerUpChannelType; {*}
  PUserType6 = ^DAQmxAIMeasurementType; {*}
  PUserType7 = ^DAQmxVoltageUnits1; {*}
  PUserType8 = ^DAQmxTemperatureUnits1; {*}
  PUserType9 = ^DAQmxThermocoupleType1; {*}
  PUserType10 = ^DAQmxScaleType2; {*}
  PUserType11 = ^DAQmxCJCSource1; {*}
  PUserType12 = ^DAQmxRTDType1; {*}
  PUserType13 = ^DAQmxCurrentUnits1; {*}
  PUserType14 = ^DAQmxStrainUnits1; {*}
  PUserType15 = ^DAQmxStrainGageBridgeType1; {*}
  PUserType16 = ^DAQmxResistanceUnits1; {*}
  PUserType17 = ^DAQmxFrequencyUnits; {*}
  PUserType18 = ^DAQmxLengthUnits2; {*}
  PUserType19 = ^DAQmxLVDTSensitivityUnits1; {*}
  PUserType20 = ^DAQmxAngleUnits1; {*}
  PUserType21 = ^DAQmxRVDTSensitivityUnits1; {*}
  PUserType22 = ^DAQmxSoundPressureUnits1; {*}
  PUserType23 = ^DAQmxAccelUnits2; {*}
  PUserType24 = ^DAQmxAccelSensitivityUnits1; {*}
  PUserType25 = ^DAQmxCoupling1; {*}
  PUserType26 = ^DAQmxInputTermCfg; {*}
  PUserType27 = ^DAQmxResistanceConfiguration; {*}
  PUserType28 = ^DAQmxBridgeConfiguration1; {*}
  PUserType29 = ^DAQmxShuntCalSelect; {*}
  PUserType30 = ^DAQmxCurrentShuntResistorLocation1; {*}
  PUserType31 = ^DAQmxExcitationSource; {*}
  PUserType32 = ^DAQmxExcitationDCorAC; {*}
  PUserType33 = ^DAQmxExcitationVoltageOrCurrent; {*}
  PUserType34 = ^DAQmxACExcitWireMode; {*}
  PUserType35 = ^DAQmxSourceSelection; {*}
  PUserType36 = ^DAQmxResolutionType1; {*}
  PUserType37 = ^DAQmxDataJustification1; {*}
  PUserType38 = ^DAQmxAutoZeroType1; {*}
  PUserType39 = ^DAQmxDataTransferMechanism; {*}
  PUserType40 = ^DAQmxInputDataTransferCondition; {*}
  PUserType41 = ^DAQmxRawDataCompressionType; {*}
  PUserType42 = ^DAQmxAOOutputChannelType; {*}
  PUserType43 = ^DAQmxVoltageUnits2; {*}
  PUserType44 = ^DAQmxAOIdleOutputBehavior; {*}
  PUserType45 = ^DAQmxOutputTermCfg; {*}
  PUserType46 = ^DAQmxOutputDataTransferCondition; {*}
  PUserType47 = ^DAQmxLogicFamily; {*}
  PUserType48 = ^DAQmxSampleClockActiveOrInactiveEdgeSelection; {*}
  PUserType49 = ^DAQmxDigitalDriveType; {*}
  PUserType50 = ^DAQmxCIMeasurementType; {*}
  PUserType51 = ^DAQmxFrequencyUnits3; {*}
  PUserType52 = ^DAQmxEdge1; {*}
  PUserType53 = ^DAQmxCounterFrequencyMethod; {*}
  PUserType54 = ^DAQmxTimeUnits3; {*}
  PUserType55 = ^DAQmxCountDirection1; {*}
  PUserType56 = ^DAQmxAngleUnits2; {*}
  PUserType57 = ^DAQmxLengthUnits3; {*}
  PUserType58 = ^DAQmxEncoderType2; {*}
  PUserType59 = ^DAQmxEncoderZIndexPhase1; {*}
  PUserType60 = ^DAQmxTimeUnits; {*}
  PUserType61 = ^DAQmxGpsSignalType1; {*}
  PUserType62 = ^DAQmxLevel1; {*}
  PUserType63 = ^DAQmxCOOutputType; {*}
  PUserType64 = ^DAQmxTimeUnits2; {*}
  PUserType65 = ^DAQmxFrequencyUnits2; {*}
  PUserType66 = ^DAQmxChannelType; {*}
  PUserType67 = ^DAQmxPolarity2; {*}
  PUserType68 = ^DAQmxExportActions3; {*}
  PUserType69 = ^DAQmxDigitalWidthUnits3; {*}
  PUserType70 = ^DAQmxExportActions2; {*}
  PUserType71 = ^DAQmxExportActions5; {*}
  PUserType72 = ^DAQmxDeassertCondition; {*}
  PUserType73 = ^DAQmxProductCategory; {*}
  PUserType74 = ^DAQmxBusType; {*}
  PUserType75 = ^DAQmxReadRelativeTo; {*}
  PUserType76 = ^DAQmxOverwriteMode1; {*}
  PUserType77 = ^DAQmxWaitMode; {*}
  PUserType78 = ^DAQmxWaitMode3; {*}
  PUserType79 = ^DAQmxWaitMode4; {*}
  PUserType80 = ^DAQmxSwitchUsageTypes; {*}
  PUserType81 = ^DAQmxBreakMode; {*}
  PUserType82 = ^DAQmxSwitchScanRepeatMode; {*}
  PUserType83 = ^DAQmxUnitsPreScaled; {*}
  PUserType84 = ^DAQmxScaleType; {*}
  PUserType86 = ^DAQmxSampleTimingType; {*}
  PUserType87 = ^DAQmxUnderflowBehavior; {*}
  PUserType88 = ^DAQmxHandshakeStartCondition; {*}
  PUserType89 = ^DAQmxSampleInputDataWhen; {*}
  PUserType90 = ^DAQmxMIOAIConvertTbSrc; {*}
  PUserType91 = ^DAQmxDigitalWidthUnits2; {*}
  PUserType92 = ^DAQmxTriggerType8; {*}
  PUserType93 = ^DAQmxDigitalPatternCondition1; {*}
  PUserType94 = ^DAQmxSlope1; {*}
  PUserType95 = ^DAQmxCoupling2; {*}
  PUserType96 = ^DAQmxWindowTriggerCondition1; {*}
  PUserType97 = ^DAQmxDigitalWidthUnits1; {*}
  PUserType98 = ^DAQmxTriggerType5; {*}
  PUserType99 = ^DAQmxTriggerType9; {*}
  PUserType100 = ^DAQmxTriggerType6; {*}
  PUserType101 = ^DAQmxActiveLevel; {*}
  PUserType102 = ^DAQmxWindowTriggerCondition2; {*}
  PUserType103 = ^DAQmxTriggerType4; {*}
  PUserType104 = ^DAQmxWriteRelativeTo; {*}
  PUserType105 = ^DAQmxRegenerationMode1; {*}
  PUserType106 = ^DAQmxWaitMode2; {*}
  PUserType107 = ^DAQmxTimingResponseMode; {*}

  ErrorCodes = __MIDL___MIDL_itf_NIDAQmx_0000_0001; 

implementation

uses ComObj;

end.
