object FrmEditCollection: TFrmEditCollection
  Left = 546
  Top = 535
  ActiveControl = edNom
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Saisie de Collection'
  ClientHeight = 186
  ClientWidth = 410
  Color = clBtnFace
  Constraints.MinWidth = 418
  Font.Charset = ANSI_CHARSET
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
  object Bevel2: TBevel
    Left = 0
    Top = 23
    Width = 410
    Height = 4
    Align = alTop
    Shape = bsBottomLine
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 27
    Width = 410
    Height = 159
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    DesignSize = (
      410
      159)
    object Label2: TLabel
      Left = 18
      Top = 10
      Width = 28
      Height = 13
      Hint = 'R'#233'f'#233'rence du support'
      Alignment = taRightJustify
      Caption = ' Nom:'
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 8
      Top = 34
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Editeur:'
    end
    object edNom: TEditLabeled
      Left = 52
      Top = 7
      Width = 353
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelKind = bkTile
      BorderStyle = bsNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      LinkControls = <
        item
          Control = Label2
        end>
      CurrencyChar = #0
    end
    object vtEditeurs: TVirtualStringTree
      Left = 52
      Top = 54
      Width = 353
      Height = 73
      Anchors = [akLeft, akTop, akRight]
      AnimationDuration = 0
      BevelKind = bkTile
      BorderStyle = bsNone
      ButtonFillMode = fmShaded
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      HintAnimation = hatNone
      HintMode = hmTooltip
      HotCursor = crHandPoint
      Indent = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnDblClick = vtEditeursDblClick
      Columns = <>
    end
    inline FrameRechercheRapide1: TFrameRechercheRapide
      Left = 52
      Top = 31
      Width = 353
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited btNext: TVDTButton
        Left = 312
      end
      inherited btNew: TVDTButton
        Left = 332
      end
      inherited edSearch: TEditLabeled
        Width = 313
        LinkControls = <
          item
            Control = Label5
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    DesignSize = (
      410
      23)
    object btnOK: TBitBtn
      Left = 255
      Top = 2
      Width = 74
      Height = 19
      Cursor = crHandPoint
      Hint = 'Valider les modifcations'
      Anchors = [akRight, akBottom]
      Caption = 'Enregistrer'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Frame11btnOKClick
    end
    object btnAnnuler: TBitBtn
      Left = 336
      Top = 2
      Width = 72
      Height = 19
      Cursor = crHandPoint
      Hint = 'Annuler les modifications'
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Annuler'
      ModalResult = 2
      TabOrder = 1
      OnClick = Frame11btnAnnulerClick
    end
  end
end
