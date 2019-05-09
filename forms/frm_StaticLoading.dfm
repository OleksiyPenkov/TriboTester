object frmStaticLoading: TfrmStaticLoading
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Static Loading'
  ClientHeight = 175
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel2: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 254
    Height = 95
    Align = alTop
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object lblForce: TRzLabel
      Left = 139
      Top = 21
      Width = 80
      Height = 29
      Alignment = taCenter
      Caption = '0.00 gF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnStart: TBitBtn
      Left = 10
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Load'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object btnStop: TBitBtn
      Left = 10
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Stop'
      Enabled = False
      TabOrder = 1
      OnClick = btnStopClick
    end
    object btnUnload: TBitBtn
      Left = 146
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Unload'
      Enabled = False
      TabOrder = 2
      OnClick = btnUnloadClick
    end
  end
  object RzPanel3: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 104
    Width = 254
    Height = 57
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
      Text = '0.1'
    end
    object edMaxForce: TLabeledEdit
      Left = 139
      Top = 24
      Width = 97
      Height = 21
      EditLabel.Width = 77
      EditLabel.Height = 13
      EditLabel.Caption = 'Max. Force (gF)'
      TabOrder = 1
      Text = '5'
    end
  end
end
