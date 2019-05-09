object frmScratchTest: TfrmScratchTest
  Left = 0
  Top = 0
  Caption = 'Scratch test'
  ClientHeight = 781
  ClientWidth = 1048
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    1048
    781)
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 286
    Height = 756
    Align = alLeft
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object RzPanel2: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 276
      Height = 44
      Align = alTop
      BorderOuter = fsFlatRounded
      TabOrder = 0
      object btnStart: TBitBtn
        Left = 5
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Start'
        TabOrder = 0
        OnClick = btnStartClick
      end
      object btnStop: TBitBtn
        Left = 193
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Stop'
        Enabled = False
        TabOrder = 1
        OnClick = btnStopClick
      end
    end
    object RzPanel3: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 55
      Width = 276
      Height = 146
      Align = alTop
      BorderOuter = fsFlatRounded
      TabOrder = 1
      object edContactForce: TLabeledEdit
        Left = 10
        Top = 24
        Width = 97
        Height = 21
        EditLabel.Width = 89
        EditLabel.Height = 13
        EditLabel.Caption = 'Contact force (gF)'
        TabOrder = 0
        Text = '0.05'
      end
      object edDistance: TLabeledEdit
        Left = 155
        Top = 24
        Width = 97
        Height = 21
        EditLabel.Width = 68
        EditLabel.Height = 13
        EditLabel.Caption = 'Distance (mm)'
        TabOrder = 1
        Text = '1'
      end
      object edMaxForce: TLabeledEdit
        Left = 9
        Top = 72
        Width = 97
        Height = 21
        EditLabel.Width = 77
        EditLabel.Height = 13
        EditLabel.Caption = 'Max. Force (gF)'
        TabOrder = 2
        Text = '10'
      end
      object edSteps: TLabeledEdit
        Left = 155
        Top = 72
        Width = 97
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Steps'
        TabOrder = 3
        Text = '100'
      end
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 762
    Width = 1048
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    object pnDepth: TRzStatusPane
      Left = 765
      Top = 0
      Width = 144
      Height = 19
      Align = alRight
      Caption = ''
      ExplicitLeft = 688
    end
    object pnForce: TRzStatusPane
      Left = 909
      Top = 0
      Width = 139
      Height = 19
      Align = alRight
      Caption = ''
      ExplicitLeft = 832
    end
    object TimePane: TRzStatusPane
      Left = 0
      Top = 0
      Height = 19
      Align = alLeft
      Caption = ''
      ExplicitLeft = 1048
      ExplicitHeight = 20
    end
  end
  object Chart1: TChart
    AlignWithMargins = True
    Left = 295
    Top = 35
    Width = 750
    Height = 724
    Margins.Top = 35
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Maximum = 24.000000000000000000
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 1111.044921875000000000
    LeftAxis.Minimum = 1061.181640625000000000
    View3D = False
    Zoom.Pen.Mode = pmNotXor
    Align = alClient
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Force: TLineSeries
      Marks.Callout.Length = 0
      Brush.BackColor = clDefault
      ClickableLine = False
      LinePen.Width = 3
      Pointer.Brush.Gradient.EndColor = 10708548
      Pointer.Gradient.EndColor = 10708548
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Friction: TLineSeries
      Marks.Callout.Length = 0
      Brush.BackColor = clDefault
      ClickableLine = False
      LinePen.Width = 3
      Pointer.Brush.Gradient.EndColor = 10708548
      Pointer.Gradient.EndColor = 10708548
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object btnSave: TBitBtn
    Left = 965
    Top = 5
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object dlgSave: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'TXT|*.txt'
    Left = 623
    Top = 131
  end
  object dlgFolder: TRzSelectFolderDialog
    Options = [sfdoCreateDeleteButtons, sfdoContextMenus, sfdoCreateFolderIcon, sfdoDeleteFolderIcon, sfdoShowHidden]
    Left = 400
    Top = 344
  end
end
