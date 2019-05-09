object frmIndentation: TfrmIndentation
  Left = 0
  Top = 0
  Caption = 'Indenation'
  ClientHeight = 721
  ClientWidth = 971
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  DesignSize = (
    971
    721)
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 286
    Height = 696
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
      Height = 106
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
        Text = '0.01'
      end
      object edStep: TLabeledEdit
        Left = 10
        Top = 72
        Width = 97
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'Step ('#181'm)'
        TabOrder = 1
        Text = '0.5'
      end
      object edMaxDepth: TLabeledEdit
        Left = 155
        Top = 24
        Width = 97
        Height = 21
        EditLabel.Width = 81
        EditLabel.Height = 13
        EditLabel.Caption = 'Max. Depth ('#181'm)'
        TabOrder = 2
        Text = '50'
      end
      object edMaxForce: TLabeledEdit
        Left = 155
        Top = 72
        Width = 97
        Height = 21
        EditLabel.Width = 77
        EditLabel.Height = 13
        EditLabel.Caption = 'Max. Force (gF)'
        TabOrder = 3
        Text = '5'
      end
    end
    object rgMode: TRadioGroup
      AlignWithMargins = True
      Left = 5
      Top = 167
      Width = 276
      Height = 105
      Align = alTop
      Caption = 'Indentation mode'
      ItemIndex = 0
      Items.Strings = (
        'Single point'
        'Single point multicycle'
        'Multi points')
      TabOrder = 2
      OnClick = rgModeClick
    end
    object pnlMulti: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 278
      Width = 276
      Height = 107
      Align = alTop
      BorderOuter = fsFlatRounded
      Enabled = False
      TabOrder = 3
      object Label1: TLabel
        Left = 10
        Top = 64
        Width = 84
        Height = 13
        Caption = 'Auto Save folder '
        Enabled = False
      end
      object edPoints: TLabeledEdit
        Left = 5
        Top = 24
        Width = 84
        Height = 21
        EditLabel.Width = 82
        EditLabel.Height = 13
        EditLabel.Caption = 'N of indentations'
        Enabled = False
        NumbersOnly = True
        TabOrder = 0
        Text = '10'
      end
      object edSaveN: TLabeledEdit
        Left = 168
        Top = 24
        Width = 84
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Save every'
        Enabled = False
        NumbersOnly = True
        TabOrder = 1
        Text = '5'
      end
      object edPath: TRzButtonEdit
        Left = 5
        Top = 80
        Width = 263
        Height = 21
        Text = ''
        Enabled = False
        TabOrder = 2
        AltBtnWidth = 15
        ButtonWidth = 30
        OnButtonClick = edPathButtonClick
      end
    end
    object pnlXShift: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 391
      Width = 276
      Height = 66
      Align = alTop
      BorderOuter = fsFlatRounded
      Enabled = False
      TabOrder = 4
      object edXShift: TLabeledEdit
        Left = 13
        Top = 29
        Width = 124
        Height = 21
        EditLabel.Width = 120
        EditLabel.Height = 13
        EditLabel.Caption = 'X-Axis displacement ('#181'm)'
        Enabled = False
        NumbersOnly = True
        TabOrder = 0
        Text = '100'
      end
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 702
    Width = 971
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    object pnDepth: TRzStatusPane
      Left = 688
      Top = 0
      Width = 144
      Height = 19
      Align = alRight
      Caption = ''
    end
    object pnForce: TRzStatusPane
      Left = 832
      Top = 0
      Width = 139
      Height = 19
      Align = alRight
      Caption = ''
    end
  end
  object Chart1: TChart
    AlignWithMargins = True
    Left = 295
    Top = 35
    Width = 673
    Height = 664
    Margins.Top = 35
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    View3D = False
    Zoom.Pen.Mode = pmNotXor
    Align = alClient
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Line: TPointSeries
      ClickableLine = False
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
    Left = 891
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
