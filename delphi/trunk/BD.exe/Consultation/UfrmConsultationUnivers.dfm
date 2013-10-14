object frmConsultationUnivers: TfrmConsultationUnivers
  Left = 1405
  Top = 196
  Caption = 'frmConsultationUnivers'
  ClientHeight = 489
  ClientWidth = 842
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox2: TScrollBox
    Left = 0
    Top = 0
    Width = 842
    Height = 489
    Align = alClient
    BorderStyle = bsNone
    ParentBackground = True
    TabOrder = 0
    DesignSize = (
      842
      489)
    object l_sujet: TLabel
      Left = 1
      Top = 35
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Description'
      Color = clWhite
      FocusControl = Description
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object NomUnivers: TLabel
      Left = 59
      Top = 5
      Width = 775
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Nom'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      OnClick = NomUniversClick
    end
    object Label6: TLabel
      Left = 25
      Top = 10
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nom :'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 0
      Top = 486
      Width = 842
      Height = 3
      Align = alBottom
      Shape = bsSpacer
    end
    object Description: TMemo
      Left = 59
      Top = 34
      Width = 775
      Height = 119
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      BorderStyle = bsNone
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    AutoMerge = True
    Images = frmFond.boutons_32x32_hot
    Left = 416
    Top = 24
    object Fiche1: TMenuItem
      Caption = 'Fiche'
      object Modifier1: TMenuItem
        Action = FicheModifier
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Aperuavantimpression1: TMenuItem
        Action = FicheApercu
      end
      object Imprimer1: TMenuItem
        Action = FicheImprime
      end
    end
  end
  object ActionList1: TActionList
    Left = 448
    Top = 24
    object ImageApercu: TAction
      Tag = 1
      Category = 'Image'
      Caption = 'Aper'#231'u avant impression'
      ImageIndex = 4
    end
    object ImageImprime: TAction
      Tag = 2
      Category = 'Image'
      Caption = 'Imprimer'
      ImageIndex = 3
    end
    object FicheApercu: TAction
      Tag = 1
      Category = 'Fiche'
      Caption = 'Aper'#231'u avant impression'
      ImageIndex = 4
      OnExecute = FicheApercuExecute
    end
    object FicheImprime: TAction
      Tag = 2
      Category = 'Fiche'
      Caption = 'Imprimer'
      ImageIndex = 3
      OnExecute = FicheApercuExecute
    end
    object FicheModifier: TAction
      Category = 'Fiche'
      Caption = 'Modifier'
      ImageIndex = 13
      OnExecute = FicheModifierExecute
    end
  end
end