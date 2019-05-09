object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  HelpContext = 144
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 451
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label31: TLabel
    Left = 110
    Top = 162
    Width = 76
    Height = 13
    Caption = 'Loading Steps 1'
  end
  object pcSetPages: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 455
    Height = 404
    ActivePage = tsAcqusition
    Align = alClient
    TabOrder = 0
    object tSensors: TTabSheet
      HelpContext = 143
      Caption = 'Sensors'
      object gbLateral: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 186
        Width = 441
        Height = 186
        Align = alTop
        Caption = 'Lateral Force'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 65
          Width = 39
          Height = 13
          Caption = 'Address'
        end
        object Label2: TLabel
          Left = 192
          Top = 65
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object Label3: TLabel
          Left = 24
          Top = 93
          Width = 22
          Height = 13
          Caption = 'Vmin'
        end
        object Label4: TLabel
          Left = 150
          Top = 92
          Width = 26
          Height = 13
          Caption = 'Vmax'
        end
        object Label5: TLabel
          Left = 280
          Top = 92
          Width = 76
          Height = 13
          Caption = 'Excitation Value'
        end
        object Label6: TLabel
          Left = 275
          Top = 119
          Width = 85
          Height = 13
          Caption = 'Bridge Resistance'
        end
        object Label7: TLabel
          Left = 8
          Top = 119
          Width = 98
          Height = 13
          Caption = 'Bridge Configuration'
        end
        object lblScaleFactorL: TLabel
          Left = 267
          Top = 32
          Width = 100
          Height = 13
          Caption = 'Scale Factor (gF/mV)'
        end
        object Label21: TLabel
          Left = 126
          Top = 32
          Width = 60
          Height = 13
          Caption = 'Amplification'
        end
        object cbAddress: TRzComboBox
          Left = 53
          Top = 62
          Width = 121
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Force/ai0'
            'Force/ai1'
            'Force/ai2'
            'Force/ai3')
        end
        object edtName: TEdit
          Left = 225
          Top = 62
          Width = 208
          Height = 21
          TabOrder = 1
        end
        object edVMin: TRzNumericEdit
          Left = 53
          Top = 89
          Width = 65
          Height = 21
          TabOrder = 2
          IntegersOnly = False
          DisplayFormat = '0;-0.000'
        end
        object edVMax: TRzNumericEdit
          Left = 178
          Top = 89
          Width = 65
          Height = 21
          TabOrder = 3
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
        object edResistance: TRzNumericEdit
          Left = 368
          Top = 116
          Width = 65
          Height = 21
          TabOrder = 4
          IntegersOnly = False
          DisplayFormat = ',0;(,0)'
        end
        object cbbBridgeConfig: TRzComboBox
          Left = 112
          Top = 116
          Width = 131
          Height = 21
          TabOrder = 5
          Items.Strings = (
            'Full Bridge'
            'Half Bridge'
            'Quarter Bridge')
        end
        object gbUnits: TRzRadioGroup
          Left = 8
          Top = 143
          Width = 161
          Height = 35
          Caption = 'Units'
          Columns = 2
          Items.Strings = (
            'mV/V'
            'V/V')
          TabOrder = 6
        end
        object cbbExcValue: TRzComboBox
          Left = 368
          Top = 89
          Width = 65
          Height = 21
          TabOrder = 7
          Items.Strings = (
            '2.5'
            '3'
            '5'
            '10')
          Values.Strings = (
            '2.5'
            '3'
            '5'
            '10')
        end
        object gbSource: TRzRadioGroup
          Left = 175
          Top = 143
          Width = 258
          Height = 35
          Caption = 'Excitation Source'
          Columns = 3
          Items.Strings = (
            'Internal'
            'External'
            'None')
          TabOrder = 8
        end
        object cbConnected: TRzCheckBox
          Left = 16
          Top = 31
          Width = 71
          Height = 15
          Caption = 'Connected'
          State = cbUnchecked
          TabOrder = 9
        end
        object edFactor: TRzNumericEdit
          Left = 368
          Top = 29
          Width = 65
          Height = 21
          TabOrder = 10
          IntegersOnly = False
          DisplayFormat = '0.00;-0.00'
          Value = 3.660000000000000000
        end
        object edAmpL: TRzNumericEdit
          Left = 192
          Top = 29
          Width = 65
          Height = 21
          TabOrder = 11
          Max = 1.000000000000000000
          Min = 1.000000000000000000
          DisplayFormat = '0'
          Value = 1.000000000000000000
        end
      end
      object gbNormal: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 441
        Height = 177
        Align = alTop
        Caption = 'Normal Force'
        TabOrder = 1
        object Label8: TLabel
          Left = 8
          Top = 51
          Width = 39
          Height = 13
          Caption = 'Address'
        end
        object Label9: TLabel
          Left = 192
          Top = 51
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object Label10: TLabel
          Left = 24
          Top = 79
          Width = 22
          Height = 13
          Caption = 'Vmin'
        end
        object Label11: TLabel
          Left = 150
          Top = 78
          Width = 26
          Height = 13
          Caption = 'Vmax'
        end
        object Label12: TLabel
          Left = 280
          Top = 78
          Width = 76
          Height = 13
          Caption = 'Excitation Value'
        end
        object Label13: TLabel
          Left = 275
          Top = 105
          Width = 85
          Height = 13
          Caption = 'Bridge Resistance'
        end
        object Label14: TLabel
          Left = 8
          Top = 105
          Width = 98
          Height = 13
          Caption = 'Bridge Configuration'
        end
        object lblScaleFactorN: TLabel
          Left = 267
          Top = 24
          Width = 100
          Height = 13
          Caption = 'Scale Factor (gF/mV)'
        end
        object Label20: TLabel
          Left = 126
          Top = 24
          Width = 60
          Height = 13
          Caption = 'Amplification'
        end
        object cbAdressN: TRzComboBox
          Left = 53
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Force/ai0'
            'Force/ai1'
            'Force/ai2'
            'Force/ai3')
        end
        object edNameN: TEdit
          Left = 225
          Top = 48
          Width = 208
          Height = 21
          TabOrder = 1
        end
        object edVMinN: TRzNumericEdit
          Left = 53
          Top = 75
          Width = 65
          Height = 21
          TabOrder = 2
          IntegersOnly = False
          DisplayFormat = '0;-0.000'
        end
        object edVMaxN: TRzNumericEdit
          Left = 178
          Top = 75
          Width = 65
          Height = 21
          TabOrder = 3
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
        object edResistanceN: TRzNumericEdit
          Left = 368
          Top = 102
          Width = 65
          Height = 21
          TabOrder = 4
          IntegersOnly = False
          DisplayFormat = ',0;(,0)'
        end
        object cbbBridgeConfigN: TRzComboBox
          Left = 112
          Top = 102
          Width = 131
          Height = 21
          TabOrder = 5
          Items.Strings = (
            'Full Bridge'
            'Half Bridge'
            'Quarter Bridge')
        end
        object gbUnitsN: TRzRadioGroup
          Left = 8
          Top = 129
          Width = 161
          Height = 35
          Caption = 'Units'
          Columns = 2
          Items.Strings = (
            'mV/V'
            'V/V')
          TabOrder = 6
        end
        object cbbExcValueN: TRzComboBox
          Left = 368
          Top = 75
          Width = 65
          Height = 21
          TabOrder = 7
          Items.Strings = (
            '2.5'
            '3'
            '5'
            '10')
          Values.Strings = (
            '2.5'
            '3'
            '5'
            '10')
        end
        object gbSourceN: TRzRadioGroup
          Left = 175
          Top = 129
          Width = 258
          Height = 35
          Caption = 'Excitation Source'
          Columns = 3
          Items.Strings = (
            'Internal'
            'External'
            'None')
          TabOrder = 8
        end
        object cbConnectedN: TRzCheckBox
          Left = 8
          Top = 23
          Width = 71
          Height = 15
          Caption = 'Connected'
          State = cbUnchecked
          TabOrder = 9
        end
        object edFactorN: TRzNumericEdit
          Left = 368
          Top = 21
          Width = 65
          Height = 21
          TabOrder = 10
          IntegersOnly = False
          DisplayFormat = '0.00;-0.00'
          Value = 3.660000000000000000
        end
        object edAmpN: TRzNumericEdit
          Left = 192
          Top = 21
          Width = 65
          Height = 21
          TabOrder = 11
          Max = 1.000000000000000000
          Min = 1.000000000000000000
          DisplayFormat = '0'
          Value = 1.000000000000000000
        end
      end
    end
    object tsCharts: TTabSheet
      Caption = 'Charts'
      ImageIndex = 1
      object RzGroupBox3: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 441
        Height = 54
        Align = alTop
        Caption = 'Visible Charts'
        TabOrder = 0
        object chkNormal: TCheckBox
          Left = 8
          Top = 23
          Width = 97
          Height = 17
          Caption = 'Normal Force'
          TabOrder = 0
        end
        object chkLateral: TCheckBox
          Left = 111
          Top = 23
          Width = 97
          Height = 17
          Caption = 'Friction Force'
          TabOrder = 1
        end
        object chkFriction: TCheckBox
          Left = 231
          Top = 23
          Width = 122
          Height = 17
          Caption = 'Friction Coefficient'
          TabOrder = 2
        end
      end
      object RzGroupBox4: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 127
        Width = 441
        Height = 58
        Align = alTop
        BorderOuter = fsFlatRounded
        Caption = 'Units'
        TabOrder = 1
        object Label17: TLabel
          Left = 8
          Top = 24
          Width = 53
          Height = 13
          Caption = 'Force units'
        end
        object cbbForceUnits: TComboBox
          Left = 67
          Top = 21
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'cbbForceUnits'
        end
      end
      object RzGroupBox10: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 63
        Width = 441
        Height = 58
        Align = alTop
        BorderOuter = fsFlatRounded
        Caption = 'Lines'
        TabOrder = 2
        object Label28: TLabel
          Left = 8
          Top = 24
          Width = 28
          Height = 13
          Caption = 'Width'
        end
        object Label29: TLabel
          Left = 231
          Top = 24
          Width = 25
          Height = 13
          Caption = 'Color'
        end
        object edtLineWidth: TRzSpinEdit
          Left = 50
          Top = 19
          Width = 47
          Height = 21
          Max = 100.000000000000000000
          Min = 1.000000000000000000
          Value = 1.000000000000000000
          TabOrder = 0
        end
        object edtLineColor: TColorBox
          Left = 285
          Top = 21
          Width = 145
          Height = 22
          TabOrder = 1
        end
      end
    end
    object tsAcqusition: TTabSheet
      Caption = 'Acqusition'
      ImageIndex = 2
      object Label34: TLabel
        Left = 15
        Top = 226
        Width = 101
        Height = 13
        Caption = 'Feedback Coefficient'
      end
      object RzGroupBox5: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 112
        Width = 441
        Align = alTop
        Caption = 'Loading'
        TabOrder = 0
        object Label19: TLabel
          Left = 7
          Top = 24
          Width = 76
          Height = 13
          Caption = 'Loading Steps 1'
        end
        object Label16: TLabel
          Left = 143
          Top = 24
          Width = 76
          Height = 13
          Caption = 'Loading Steps 2'
        end
        object Label18: TLabel
          Left = 286
          Top = 24
          Width = 76
          Height = 13
          Caption = 'Loading Steps 3'
        end
        object Label30: TLabel
          Left = 15
          Top = 72
          Width = 27
          Height = 13
          Caption = 'Delay'
        end
        object Label32: TLabel
          Left = 119
          Top = 72
          Width = 40
          Height = 13
          Caption = 'Range 1'
        end
        object Label33: TLabel
          Left = 227
          Top = 72
          Width = 40
          Height = 13
          Caption = 'Range 2'
        end
        object edLoadingSteps1: TRzNumericEdit
          Left = 89
          Top = 21
          Width = 37
          Height = 21
          TabOrder = 0
          Max = 1.000000000000000000
          Min = 1.000000000000000000
          DisplayFormat = ',0;(,0)'
          Value = 100.000000000000000000
        end
        object edLoadingSteps2: TRzNumericEdit
          Left = 225
          Top = 21
          Width = 37
          Height = 21
          TabOrder = 1
          Max = 1.000000000000000000
          Min = 1.000000000000000000
          DisplayFormat = ',0;(,0)'
          Value = 100.000000000000000000
        end
        object edLoadingSteps3: TRzNumericEdit
          Left = 368
          Top = 21
          Width = 37
          Height = 21
          TabOrder = 2
          Max = 1.000000000000000000
          Min = 1.000000000000000000
          DisplayFormat = ',0;(,0)'
          Value = 100.000000000000000000
        end
        object edLoadingDelay: TRzNumericEdit
          Left = 48
          Top = 69
          Width = 35
          Height = 21
          TabOrder = 3
          Max = 1.000000000000000000
          Min = 1.000000000000000000
          DisplayFormat = ',0;(,0)'
          Value = 50.000000000000000000
        end
        object edLoadingRange1: TRzNumericEdit
          Left = 165
          Top = 69
          Width = 37
          Height = 21
          TabOrder = 4
          IntegersOnly = False
          Max = 1.000000000000000000
          DisplayFormat = '0.00'
          Value = 0.500000000000000000
        end
        object edLoadingRange2: TRzNumericEdit
          Left = 273
          Top = 69
          Width = 37
          Height = 21
          TabOrder = 5
          IntegersOnly = False
          Max = 1.000000000000000000
          DisplayFormat = '0.00'
          Value = 0.800000000000000000
        end
      end
      object edFeedbackCoefficient: TRzNumericEdit
        Left = 125
        Top = 223
        Width = 37
        Height = 21
        TabOrder = 1
        IntegersOnly = False
        Max = 5.000000000000000000
        DisplayFormat = '0.00'
        Value = 1.000000000000000000
      end
      object RzGroupBox1: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 52
        Width = 441
        Height = 54
        Align = alTop
        Caption = 'Force Reading'
        TabOrder = 2
        ExplicitLeft = 6
        ExplicitTop = 11
        object Label35: TLabel
          Left = 7
          Top = 24
          Width = 68
          Height = 13
          Caption = 'Sampling Rate'
        end
        object edSamplingRate: TRzNumericEdit
          Left = 84
          Top = 21
          Width = 65
          Height = 21
          TabOrder = 0
          Max = 1.000000000000000000
          Min = 1.000000000000000000
          DisplayFormat = ',0;(,0)'
          Value = 100.000000000000000000
        end
      end
      object rgLoadingMethod: TRadioGroup
        Left = 0
        Top = 0
        Width = 447
        Height = 49
        Align = alTop
        Caption = 'Loading method'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Displacement'
          'Dead weight')
        TabOrder = 3
        OnClick = rgLoadingMethodClick
      end
    end
    object tsPaths: TTabSheet
      Caption = 'Folders'
      ImageIndex = 3
      object RzGroupBox6: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 441
        Height = 46
        Align = alTop
        Caption = 'Viewer Path'
        TabOrder = 0
        object edViewerPath: TRzButtonEdit
          AlignWithMargins = True
          Left = 4
          Top = 17
          Width = 433
          Height = 21
          Text = ''
          Align = alTop
          TabOrder = 0
          AltBtnWidth = 50
          ButtonWidth = 50
          OnButtonClick = edViewerPathButtonClick
        end
      end
    end
    object tsStages: TTabSheet
      Caption = 'Stages'
      ImageIndex = 4
      object RzGroupBox7: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 441
        Height = 182
        Align = alTop
        Caption = 'Stage X'
        TabOrder = 0
        object edXSpeedScale: TLabeledEdit
          Left = 118
          Top = 35
          Width = 90
          Height = 21
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'Speed Scale'
          NumbersOnly = True
          TabOrder = 0
          OnChange = edXStrokeScaleChange
        end
        object edXStrokeScale: TLabeledEdit
          Left = 23
          Top = 35
          Width = 89
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Stroke Scale'
          NumbersOnly = True
          TabOrder = 1
          OnChange = edXStrokeScaleChange
        end
        object edXSpeedMultiplayer: TLabeledEdit
          Left = 214
          Top = 35
          Width = 90
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'Speed multiplayer'
          NumbersOnly = True
          TabOrder = 2
          OnChange = edXStrokeScaleChange
        end
        object edXHomeLow: TLabeledEdit
          Left = 310
          Top = 35
          Width = 90
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'Home Search Low'
          NumbersOnly = True
          TabOrder = 3
          OnChange = edXStrokeScaleChange
        end
        object edXHomeHigh: TLabeledEdit
          Left = 310
          Top = 83
          Width = 90
          Height = 21
          EditLabel.Width = 87
          EditLabel.Height = 13
          EditLabel.Caption = 'Home Search High'
          NumbersOnly = True
          TabOrder = 4
          OnChange = edXStrokeScaleChange
        end
        object edXStartSpeed: TLabeledEdit
          Left = 214
          Top = 83
          Width = 90
          Height = 21
          EditLabel.Width = 57
          EditLabel.Height = 13
          EditLabel.Caption = 'Start Speed'
          NumbersOnly = True
          TabOrder = 5
          OnChange = edXStrokeScaleChange
        end
        object edXDeceleration: TLabeledEdit
          Left = 118
          Top = 83
          Width = 90
          Height = 21
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Decceleration'
          NumbersOnly = True
          TabOrder = 6
          OnChange = edXStrokeScaleChange
        end
        object edXAcceleration: TLabeledEdit
          Left = 23
          Top = 83
          Width = 89
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Acceleration'
          NumbersOnly = True
          TabOrder = 7
          OnChange = edXStrokeScaleChange
        end
        object edXSpeed1: TLabeledEdit
          Left = 23
          Top = 123
          Width = 89
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 1'
          NumbersOnly = True
          TabOrder = 8
          OnChange = edXStrokeScaleChange
        end
        object edXSpeed2: TLabeledEdit
          Left = 118
          Top = 123
          Width = 90
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 2'
          NumbersOnly = True
          TabOrder = 9
          OnChange = edXStrokeScaleChange
        end
        object edXSpeed3: TLabeledEdit
          Left = 214
          Top = 123
          Width = 90
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 3'
          NumbersOnly = True
          TabOrder = 10
          OnChange = edXStrokeScaleChange
        end
        object edXSpeed4: TLabeledEdit
          Left = 310
          Top = 123
          Width = 90
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 4'
          NumbersOnly = True
          TabOrder = 11
          OnChange = edXStrokeScaleChange
        end
        object chkXAutoHome: TCheckBox
          Left = 23
          Top = 154
          Width = 97
          Height = 17
          Caption = 'Auto Home'
          TabOrder = 12
        end
        object chkReverse: TCheckBox
          Left = 118
          Top = 154
          Width = 97
          Height = 17
          Caption = 'Reverse'
          TabOrder = 13
        end
      end
      object bxTime1: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 191
        Width = 441
        Height = 182
        Align = alBottom
        Caption = 'Stage Z'
        TabOrder = 1
        object edZSpeedScale: TLabeledEdit
          Left = 118
          Top = 35
          Width = 90
          Height = 21
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'Speed Scale'
          NumbersOnly = True
          TabOrder = 0
          OnChange = edXStrokeScaleChange
        end
        object edZStrokeScale: TLabeledEdit
          Left = 23
          Top = 35
          Width = 89
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Stroke Scale'
          NumbersOnly = True
          TabOrder = 1
          OnChange = edXStrokeScaleChange
        end
        object edZSpeedMultiplayer: TLabeledEdit
          Left = 214
          Top = 35
          Width = 90
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'Speed multiplayer'
          NumbersOnly = True
          TabOrder = 2
          OnChange = edXStrokeScaleChange
        end
        object edZHomeLow: TLabeledEdit
          Left = 310
          Top = 35
          Width = 90
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'Home Search Low'
          NumbersOnly = True
          TabOrder = 3
          OnChange = edXStrokeScaleChange
        end
        object edZHomeHigh: TLabeledEdit
          Left = 310
          Top = 83
          Width = 90
          Height = 21
          EditLabel.Width = 87
          EditLabel.Height = 13
          EditLabel.Caption = 'Home Search High'
          NumbersOnly = True
          TabOrder = 4
          OnChange = edXStrokeScaleChange
        end
        object edZStartSpeed: TLabeledEdit
          Left = 214
          Top = 83
          Width = 90
          Height = 21
          EditLabel.Width = 57
          EditLabel.Height = 13
          EditLabel.Caption = 'Start Speed'
          NumbersOnly = True
          TabOrder = 5
          OnChange = edXStrokeScaleChange
        end
        object edZDeceleration: TLabeledEdit
          Left = 118
          Top = 83
          Width = 90
          Height = 21
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Decceleration'
          NumbersOnly = True
          TabOrder = 6
          OnChange = edXStrokeScaleChange
        end
        object edZAcceleration: TLabeledEdit
          Left = 23
          Top = 83
          Width = 89
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Acceleration'
          NumbersOnly = True
          TabOrder = 7
          OnChange = edXStrokeScaleChange
        end
        object edZSpeed1: TLabeledEdit
          Left = 23
          Top = 123
          Width = 89
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 1'
          NumbersOnly = True
          TabOrder = 8
          OnChange = edXStrokeScaleChange
        end
        object edZSpeed2: TLabeledEdit
          Left = 118
          Top = 123
          Width = 90
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 2'
          NumbersOnly = True
          TabOrder = 9
          OnChange = edXStrokeScaleChange
        end
        object edZSpeed3: TLabeledEdit
          Left = 214
          Top = 123
          Width = 90
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 3'
          NumbersOnly = True
          TabOrder = 10
          OnChange = edXStrokeScaleChange
        end
        object edZSpeed4: TLabeledEdit
          Left = 310
          Top = 123
          Width = 90
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Drive Speed 4'
          NumbersOnly = True
          TabOrder = 11
          OnChange = edXStrokeScaleChange
        end
        object chkZAutoHome: TCheckBox
          Left = 23
          Top = 155
          Width = 97
          Height = 17
          Caption = 'Auto Home'
          TabOrder = 12
        end
        object chkReverseZ: TCheckBox
          Left = 118
          Top = 155
          Width = 97
          Height = 17
          Caption = 'Reverse'
          TabOrder = 13
        end
      end
    end
    object tsStageY: TTabSheet
      Caption = 'tsStageY'
      ImageIndex = 5
      TabVisible = False
    end
    object tsPort: TTabSheet
      Caption = 'Controller'
      ImageIndex = 6
      object RzGroupBox8: TRzGroupBox
        Left = 0
        Top = 57
        Width = 447
        Height = 319
        Align = alClient
        Caption = 'Port Settings'
        TabOrder = 0
        object Label22: TLabel
          Left = 10
          Top = 19
          Width = 20
          Height = 13
          Caption = 'Port'
        end
        object Label23: TLabel
          Left = 8
          Top = 44
          Width = 47
          Height = 13
          Caption = 'Baud rate'
        end
        object Label24: TLabel
          Left = 8
          Top = 67
          Width = 43
          Height = 13
          Caption = 'Data bits'
        end
        object Label25: TLabel
          Left = 8
          Top = 92
          Width = 42
          Height = 13
          Caption = 'Stop bits'
        end
        object Label26: TLabel
          Left = 8
          Top = 117
          Width = 28
          Height = 13
          Caption = 'Parity'
        end
        object Label27: TLabel
          Left = 8
          Top = 140
          Width = 58
          Height = 13
          Caption = 'Flow control'
        end
        object cbPort: TComComboBox
          Left = 80
          Top = 13
          Width = 129
          Height = 21
          ComProperty = cpPort
          Text = 'COM1'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
        end
        object cbBaudRate: TComComboBox
          Left = 80
          Top = 38
          Width = 129
          Height = 21
          ComProperty = cpBaudRate
          Text = 'Custom'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
        end
        object Combo3: TComComboBox
          Left = 80
          Top = 64
          Width = 129
          Height = 21
          ComProperty = cpDataBits
          Text = '5'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
        end
        object Combo4: TComComboBox
          Left = 80
          Top = 88
          Width = 129
          Height = 21
          ComProperty = cpStopBits
          Text = '1'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
        end
        object Combo5: TComComboBox
          Left = 80
          Top = 112
          Width = 129
          Height = 21
          ComProperty = cpParity
          Text = 'None'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
        end
        object Combo6: TComComboBox
          Left = 80
          Top = 136
          Width = 129
          Height = 21
          ComProperty = cpFlowControl
          Text = 'Hardware'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 5
        end
      end
      object RzGroupBox9: TRzGroupBox
        Left = 0
        Top = 0
        Width = 447
        Height = 57
        Align = alTop
        Caption = 'Controller type'
        TabOrder = 1
        object cbController: TComboBox
          Left = 8
          Top = 23
          Width = 425
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Autonics PMC-2HS-USB'
            'Newport AGILIS AG-UC8')
        end
      end
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 410
    Width = 461
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnButtons'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      461
      41)
    object btnOk: TButton
      Left = 283
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Save'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = SaveSettingsClick
    end
    object btnCancel: TButton
      Left = 378
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object btnHelp: TButton
      Left = 12
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Help'
      TabOrder = 2
      OnClick = ShowHelpClick
    end
  end
  object dlgColors: TColorDialog
    Left = 152
    Top = 352
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '.exe'
    Filter = '*.exe|*.exe'
    Left = 80
    Top = 280
  end
end
