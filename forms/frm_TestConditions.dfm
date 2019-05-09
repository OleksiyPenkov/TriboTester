object frmTestConditions: TfrmTestConditions
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Test conditions'
  ClientHeight = 445
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 478
    Height = 390
    Align = alClient
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object RzGroupBox1: TRzGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 468
      Height = 132
      Align = alTop
      BorderOuter = fsFlatRounded
      Caption = 'Output file'
      TabOrder = 0
      object Label2: TLabel
        Left = 10
        Top = 23
        Width = 25
        Height = 16
        Caption = 'Path'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 47
        Width = 60
        Height = 16
        Caption = 'Comment:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edFileName: TRzButtonEdit
        Left = 44
        Top = 20
        Width = 421
        Height = 24
        Text = ''
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        AltBtnWidth = 15
        ButtonWidth = 30
        OnButtonClick = edFileNameButtonClick
      end
      object mmComment: TMemo
        Left = 10
        Top = 66
        Width = 455
        Height = 59
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object rgMode: TRzRadioGroup
      AlignWithMargins = True
      Left = 5
      Top = 199
      Width = 468
      Height = 50
      Align = alTop
      Caption = 'Test mode'
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Limit by Time'
        'Limit by Cycles'
        'With Observation'
        'With a Pause')
      ParentFont = False
      StartXPos = 15
      StartYPos = 8
      TabOrder = 1
      OnClick = rgModeClick
    end
    object bxTime: TRzGroupBox
      Left = 5
      Top = 251
      Width = 185
      Height = 50
      Caption = 'By Time'
      TabOrder = 2
      object Label1: TLabel
        Left = 7
        Top = 22
        Width = 111
        Height = 16
        Caption = 'Test duration (min)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edTestDuration: TRzNumericEdit
        Left = 124
        Top = 19
        Width = 49
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DisplayFormat = ',0;(,0)'
        Value = 10.000000000000000000
      end
    end
    object bxCycles: TRzGroupBox
      Left = 196
      Top = 251
      Width = 282
      Height = 50
      Caption = 'By Cycles'
      Enabled = False
      TabOrder = 3
      object Label3: TLabel
        Left = 7
        Top = 22
        Width = 67
        Height = 16
        Caption = 'Total cycles'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 168
        Top = 22
        Width = 43
        Height = 16
        Caption = 'Interval'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edCycles: TRzNumericEdit
        Left = 83
        Top = 19
        Width = 60
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DisplayFormat = ',0;(,0)'
        Value = 200.000000000000000000
      end
      object edInterval: TRzNumericEdit
        Left = 216
        Top = 19
        Width = 60
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DisplayFormat = ',0;(,0)'
        Value = 50.000000000000000000
      end
    end
    object bxCommon: TRzGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 302
      Width = 468
      Height = 83
      Align = alBottom
      TabOrder = 4
      object Label4: TLabel
        Left = 141
        Top = 22
        Width = 113
        Height = 16
        Caption = 'Sliding stroke (mm)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 158
        Top = 57
        Width = 96
        Height = 16
        Caption = 'Speed (mm/sec)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 313
        Top = 22
        Width = 116
        Height = 16
        Caption = 'Sampling Rate (cps)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblForce: TLabel
        Left = 10
        Top = 22
        Width = 100
        Height = 16
        Caption = 'Normal Load (gF)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edStroke: TRzNumericEdit
        Left = 257
        Top = 19
        Width = 48
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        IntegersOnly = False
        DisplayFormat = '0.00;-0.00'
        Value = 2.000000000000000000
      end
      object edSpeed: TRzNumericEdit
        Left = 257
        Top = 54
        Width = 48
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = '0.00;-0.00'
        Value = 2.000000000000000000
      end
      object edSamplingRate: TRzNumericEdit
        Left = 432
        Top = 19
        Width = 33
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DisplayFormat = ',0;(,0)'
        Value = 10.000000000000000000
      end
      object edLoad: TRzNumericEdit
        Left = 10
        Top = 54
        Width = 100
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = '0.00;-0.00'
        Value = 1.000000000000000000
      end
    end
    object rzLoadMode: TRzRadioGroup
      AlignWithMargins = True
      Left = 5
      Top = 143
      Width = 221
      Height = 50
      Margins.Right = 250
      Align = alTop
      Caption = 'Loading mode'
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Real force'
        'Displacement')
      ParentFont = False
      StartXPos = 15
      StartYPos = 8
      TabOrder = 5
      OnClick = rgModeClick
    end
    object cbFeedback: TCheckBox
      Left = 252
      Top = 168
      Width = 155
      Height = 17
      Caption = 'Use active load feedback'
      TabOrder = 6
    end
  end
  object RzPanel2: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 399
    Width = 478
    Height = 43
    Align = alBottom
    BorderOuter = fsFlatRounded
    TabOrder = 1
    object btnSave: TButton
      Left = 398
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Save'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 12
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
    object bntSaveAndRun: TButton
      Left = 252
      Top = 10
      Width = 140
      Height = 25
      Caption = 'Save && Run'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bntSaveAndRunClick
    end
  end
  object dlgSave: TSaveDialog
    DefaultExt = '*.dat'
    Filter = 'DAT|*.dat|txt|*.txt'
    Left = 419
    Top = 83
  end
end
