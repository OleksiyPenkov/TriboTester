object frmCalibration: TfrmCalibration
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Sensor calibration'
  ClientHeight = 519
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 17
    Top = 12
    Width = 96
    Height = 39
    Caption = 'Signal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 96
    Top = 12
    Width = 137
    Height = 39
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 261
    Top = 12
    Width = 70
    Height = 39
    Caption = '(mV)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 560
    Height = 462
    Align = alClient
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object rzSignalPos: TRzMeter
      Left = 16
      Top = 8
      Width = 41
      Height = 220
      Direction = dirUp
      BrushStyle = bsSolid
      Value = 60
      Seg1Count = 50
      Seg2Count = 30
      Seg3Count = 20
    end
    object rzSignalNeg: TRzMeter
      Left = 16
      Top = 227
      Width = 41
      Height = 220
      BorderOuter = fsFlatRounded
      Direction = dirDown
      BrushStyle = bsSolid
      Seg1Count = 50
      Seg2Count = 30
      Seg3Count = 20
    end
    object RzGroupBox1: TRzGroupBox
      Left = 223
      Top = 8
      Width = 332
      Height = 94
      BorderOuter = fsFlatRounded
      TabOrder = 0
      object lblValue: TLabel
        Left = 88
        Top = 4
        Width = 137
        Height = 39
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 9
        Top = 4
        Width = 96
        Height = 39
        Caption = 'Signal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 253
        Top = 4
        Width = 70
        Height = 39
        Caption = '(mV)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 47
        Width = 89
        Height = 39
        Caption = 'Value:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblValueF: TLabel
        Left = 88
        Top = 47
        Width = 137
        Height = 39
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUnits: TLabel
        Left = 253
        Top = 47
        Width = 59
        Height = 39
        Caption = '(gF)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object gbRange: TRzRadioGroup
      Left = 72
      Top = 67
      Width = 145
      Height = 85
      Caption = 'Range (mV)'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '1'
        '2.5'
        '5'
        '10'
        '20')
      StartXPos = 15
      StartYPos = 8
      TabOrder = 1
      OnClick = gbRangeClick
    end
    object RzGroupBox2: TRzGroupBox
      Left = 223
      Top = 102
      Width = 330
      Height = 50
      Caption = 'Options'
      TabOrder = 2
      object chkZero: TCheckBox
        Left = 11
        Top = 22
        Width = 97
        Height = 17
        Caption = 'Auto Zero'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object RzGroupBox3: TRzGroupBox
      Left = 72
      Top = 152
      Width = 483
      Height = 50
      TabOrder = 3
      object btnMeasure: TButton
        Left = 331
        Top = 15
        Width = 143
        Height = 25
        Caption = 'Get 50 counts'
        TabOrder = 0
        OnClick = btnMeasureClick
      end
      object btnCont: TButton
        Left = 5
        Top = 15
        Width = 75
        Height = 25
        Caption = 'Continious'
        TabOrder = 1
        OnClick = btnContClick
      end
      object btnStop: TButton
        Left = 105
        Top = 15
        Width = 75
        Height = 25
        Caption = 'Stop'
        Enabled = False
        TabOrder = 2
        OnClick = btnStopClick
      end
    end
    object RzGroupBox4: TRzGroupBox
      Left = 72
      Top = 201
      Width = 483
      Height = 261
      TabOrder = 4
      object lblB: TLabel
        Left = 395
        Top = 114
        Width = 86
        Height = 39
        Alignment = taCenter
        AutoSize = False
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSens: TLabel
        Left = 395
        Top = 159
        Width = 86
        Height = 39
        Alignment = taCenter
        AutoSize = False
        Caption = 'gF/mV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Chart: TChart
        AlignWithMargins = True
        Left = 4
        Top = 17
        Width = 385
        Height = 240
        Legend.Visible = False
        MarginBottom = 0
        MarginLeft = 5
        MarginRight = 0
        MarginTop = 0
        Title.Margins.Left = 3
        Title.Margins.Top = 2
        Title.Margins.Right = 3
        Title.Margins.Bottom = 2
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'Signal (mV)'
        LeftAxis.PositionUnits = muPixels
        LeftAxis.Title.Caption = 'Force (gF)'
        LeftAxis.Title.Font.Emboss.Smooth = False
        LeftAxis.Title.Pen.SmallSpace = 1
        LeftAxis.Title.ShapeCallout.Position = 12
        LeftAxis.Title.ShapeCallout.Size = 6
        View3D = False
        Zoom.Pen.Mode = pmNotXor
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 0
        object Series: TPointSeries
          ClickableLine = False
          Pointer.Brush.Gradient.EndColor = clRed
          Pointer.Gradient.EndColor = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Line: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object edtForce: TEdit
        Left = 399
        Top = 14
        Width = 73
        Height = 21
        Alignment = taRightJustify
        TabOrder = 1
        Text = '1'
      end
      object btnAdd: TButton
        Left = 399
        Top = 41
        Width = 75
        Height = 25
        Caption = 'Add'
        TabOrder = 2
        OnClick = btnAddClick
      end
      object btnClear: TButton
        Left = 397
        Top = 216
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 3
        OnClick = btnClearClick
      end
      object btnCalc: TButton
        Left = 399
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Calc'
        TabOrder = 4
        OnClick = btnCalcClick
      end
    end
    object gbSensor: TRzRadioGroup
      Left = 72
      Top = 8
      Width = 145
      Height = 56
      Caption = 'Channel'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'Lateral')
      StartXPos = 15
      StartYPos = 10
      TabOrder = 5
      VerticalSpacing = 10
    end
  end
  object RzPanel2: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 471
    Width = 560
    Height = 45
    Align = alBottom
    BorderOuter = fsFlatRounded
    TabOrder = 1
    object btnClose: TButton
      Left = 480
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Close'
      ModalResult = 8
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object tmrTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrTimerTimer
    Left = 19
    Top = 443
  end
end
