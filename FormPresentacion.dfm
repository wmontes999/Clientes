object FrmPresentacion: TFrmPresentacion
  Left = 272
  Top = 129
  Width = 427
  Height = 267
  BorderIcons = []
  Caption = 'Cargando....'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 64
    Width = 193
    Height = 29
    Caption = 'CRUD Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 128
    Width = 185
    Height = 20
    Caption = 'Registro de Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TrmPresentacion: TTimer
    Interval = 2000
    OnTimer = TrmPresentacionTimer
    Left = 256
    Top = 16
  end
end
