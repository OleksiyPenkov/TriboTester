object BaseChart: TBaseChart
  Left = 197
  Top = 117
  Caption = 'MDI Child'
  ClientHeight = 284
  ClientWidth = 1029
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Chart: TChart
    Left = 0
    Top = 0
    Width = 1029
    Height = 265
    Cursor = crCross
    Legend.Visible = False
    MarginLeft = 10
    MarginRight = 10
    MarginUnits = muPixels
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Increment = 100.000000000000000000
    BottomAxis.Maximum = 1000.000000000000000000
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.LabelsFormat.Margins.Left = 0
    LeftAxis.LabelsFormat.Margins.Top = 0
    LeftAxis.LabelsFormat.Margins.Right = 0
    LeftAxis.LabelsFormat.Margins.Bottom = 0
    LeftAxis.LabelsOnAxis = False
    LeftAxis.Maximum = 300.000000000000000000
    LeftAxis.Minimum = 2.500000000000000000
    LeftAxis.PositionUnits = muPixels
    LeftAxis.Title.Caption = 'Force'
    LeftAxis.Title.Font.Height = -16
    LeftAxis.Title.Font.Style = [fsBold]
    View3D = False
    Zoom.Pen.Mode = pmNotXor
    Align = alClient
    TabOrder = 0
    OnMouseMove = ChartMouseMove
    ExplicitWidth = 653
    ExplicitHeight = 482
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Line: TLineSeries
      ColorEachLine = False
      SeriesColor = 8404992
      Shadow.Visible = False
      Brush.BackColor = clDefault
      Dark3D = False
      LinePen.Color = clNavy
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Status: TRzStatusBar
    Left = 0
    Top = 265
    Width = 1029
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    ExplicitTop = 482
    ExplicitWidth = 653
    object RzStatusPane1: TRzStatusPane
      Left = 0
      Top = 0
      Width = 41
      Height = 19
      Align = alLeft
      Alignment = taRightJustify
      Caption = 'X:'
    end
    object StatusX: TRzStatusPane
      Left = 41
      Top = 0
      Width = 72
      Height = 19
      Align = alLeft
      Caption = ''
    end
    object Status1: TRzStatusPane
      Left = 113
      Top = 0
      Width = 17
      Height = 19
      Align = alLeft
      Alignment = taRightJustify
      Caption = 'Y:'
      ExplicitLeft = 112
    end
    object StatusY: TRzStatusPane
      Left = 130
      Top = 0
      Height = 19
      Align = alLeft
      Caption = ''
      ExplicitLeft = 653
      ExplicitHeight = 20
    end
    object Statu3: TRzStatusPane
      Left = 230
      Top = 0
      Height = 19
      Align = alLeft
      Alignment = taRightJustify
      Caption = 'Last Value:'
      ExplicitLeft = 653
      ExplicitHeight = 20
    end
    object StatusLast: TRzStatusPane
      Left = 330
      Top = 0
      Height = 19
      Align = alLeft
      Caption = ''
      ExplicitLeft = 653
      ExplicitHeight = 20
    end
  end
end
