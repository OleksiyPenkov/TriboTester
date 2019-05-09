object frmNiError: TfrmNiError
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Device Status'
  ClientHeight = 292
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 388
    Height = 150
    Align = alTop
    BorderOuter = fsFlatRounded
    Caption = 'NI DAQ'
    TabOrder = 0
    object ErrorLabel: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 19
      Width = 376
      Height = 125
      Align = alClient
      AutoSize = False
      Caption = 'Not connected!'
      WordWrap = True
      ExplicitLeft = 152
      ExplicitTop = 48
      ExplicitWidth = 49
      ExplicitHeight = 13
    end
  end
  object RzGroupBox2: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 159
    Width = 388
    Height = 130
    Align = alClient
    BorderOuter = fsFlatRounded
    Caption = 'Servo'
    TabOrder = 1
    object lblDriveStatus: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 19
      Width = 376
      Height = 21
      Align = alTop
      AutoSize = False
      Caption = 'Not connected!'
      WordWrap = True
      ExplicitWidth = 340
    end
    object lblXError: TLabel
      AlignWithMargins = True
      Left = 53
      Top = 46
      Width = 329
      Height = 21
      Margins.Left = 50
      Align = alTop
      AutoSize = False
      WordWrap = True
      ExplicitLeft = 12
      ExplicitTop = 27
      ExplicitWidth = 340
    end
    object lblYError: TLabel
      AlignWithMargins = True
      Left = 53
      Top = 73
      Width = 329
      Height = 21
      Margins.Left = 50
      Align = alTop
      AutoSize = False
      WordWrap = True
      ExplicitLeft = 12
      ExplicitTop = 28
      ExplicitWidth = 340
    end
    object lbl1: TLabel
      Left = 29
      Top = 46
      Width = 10
      Height = 13
      Caption = 'X:'
    end
    object lbl2: TLabel
      Left = 29
      Top = 73
      Width = 10
      Height = 13
      Caption = 'Y:'
    end
    object rzgrpbx1: TRzGroupBox
      Left = 3
      Top = 94
      Width = 382
      Height = 33
      Align = alBottom
      TabOrder = 0
      object cmldTx: TComLed
        Left = 214
        Top = 6
        Width = 25
        Height = 25
        LedSignal = lsTx
        Kind = lkRedLight
      end
      object cmldRx: TComLed
        Left = 148
        Top = 6
        Width = 25
        Height = 25
        LedSignal = lsRx
        Kind = lkRedLight
      end
      object cmldConn: TComLed
        Left = 76
        Top = 6
        Width = 25
        Height = 25
        LedSignal = lsConn
        Kind = lkGreenLight
      end
      object lbl3: TLabel
        Left = 12
        Top = 12
        Width = 53
        Height = 13
        Caption = 'Port status'
      end
      object Label1: TLabel
        Left = 101
        Top = 12
        Width = 25
        Height = 13
        Caption = 'Conn'
      end
      object Label2: TLabel
        Left = 172
        Top = 12
        Width = 13
        Height = 13
        Caption = 'Rx'
      end
      object Label3: TLabel
        Left = 240
        Top = 12
        Width = 12
        Height = 13
        Caption = 'Tx'
      end
    end
  end
end
