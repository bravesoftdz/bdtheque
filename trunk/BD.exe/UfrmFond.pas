unit UfrmFond;

interface

{.$D-}
{$WARN SYMBOL_DEPRECATED OFF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ImgList, Menus,
  ComCtrls, ExtCtrls, Buttons, ActnList, Printers, iniFiles, jpeg, Contnrs, ToolWin, UBdtForms,
  PngImageList, pngImage, PngFunctions;

type
  TActionUpdate = function: Boolean of object;

  TStack = class(Contnrs.TStack) // surcharge pour pouvoir acceder � List
    //  published
    //    property List;
  end;

  TfrmFond = class(TbdtForm)
    ImageList1: TImageList;
    boutons_32x32_hot: TPngImageList;
    ActionsOutils: TActionList;
    actChangementOptions: TAction;
    actAideContextuelle: TAction;
    actAfficheStatsGenerales: TAction;
    actAfficheStock: TAction;
    PrinterSetupDialog1: TPrinterSetupDialog;
    actAfficheRecherche: TAction;
    actImpression: TAction;
    actApercuImpression: TAction;
    actActualiseRepertoire: TAction;
    actRelireOptions: TAction;
    actQuitter: TAction;
    actAfficheStatsEmprunteurs: TAction;
    actAfficheStatsAlbums: TAction;
    actPersonnaliseBarre: TAction;
    boutons_16x16_hot: TPngImageList;
    ShareImageList: TPngImageList;
    ActionList1: TActionList;
    actAideSommaire: TAction;
    actAideAbout: TAction;
    actModeGestion: TAction;
    actModeConsultation: TAction;
    actModeEntretien: TAction;
    actStatsInfosBDtheque: TAction;
    actStatsListeCompletesAlbums: TAction;
    actStatsAlbumsEmpruntes: TAction;
    ActionsStatistiques: TActionList;
    StatsInfosBDApp: TAction;
    StatsInfosBDPrn: TAction;
    StatsListeCompletesAlbumsApp: TAction;
    StatsListeCompletesAlbumsPrn: TAction;
    StatsAlbumsEmpruntesApp: TAction;
    StatsAlbumsEmpruntesPrn: TAction;
    CheminBase: TAction;
    actChangeMode: TAction;
    HistoriqueBack: TAction;
    HistoriqueNext: TAction;
    Splitter1: TSplitter;
    actAfficheSeriesIncompletes: TAction;
    actAffichePrevisionsSorties: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    MainMenu1: TMainMenu;
    BDthque1: TMenuItem;
    Outils1: TMenuItem;
    Aide1: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    Mode1: TMenuItem;
    N1: TMenuItem;
    Etats1: TMenuItem;
    N2: TMenuItem;
    Actualiserlerpertoire1: TMenuItem;
    Relirelesoptions1: TMenuItem;
    Quitter1: TMenuItem;
    N4: TMenuItem;
    Consultation1: TMenuItem;
    Gestion1: TMenuItem;
    Entretien1: TMenuItem;
    Albums1: TMenuItem;
    N5: TMenuItem;
    Basededonnes1: TMenuItem;
    Listecompltedesalbums1: TMenuItem;
    Albumsempruntes1: TMenuItem;
    Aperuavantimpression1: TMenuItem;
    Imprimer1: TMenuItem;
    Aperuavantimpression2: TMenuItem;
    Imprimer2: TMenuItem;
    InformationsBDthque1: TMenuItem;
    Aperuavantimpression3: TMenuItem;
    Imprimer3: TMenuItem;
    Recherche1: TMenuItem;
    Albumsemprunts1: TMenuItem;
    AfficheSeriesIncompletes1: TMenuItem;
    AffichePrevisionsSorties1: TMenuItem;
    N6: TMenuItem;
    Statistiques1: TMenuItem;
    Gnrales1: TMenuItem;
    Emprunteurs1: TMenuItem;
    Albums2: TMenuItem;
    N7: TMenuItem;
    Options1: TMenuItem;
    Personnaliser1: TMenuItem;
    Sommaire1: TMenuItem;
    Aidecontextuelle1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Cheminbase1: TMenuItem;
    Apropos1: TMenuItem;
    boutons_32x32_norm: TPngImageList;
    boutons_16x16_norm: TPngImageList;
    actNouvelAchat: TAction;
    N11: TMenuItem;
    Achat1: TMenuItem;
    actMiseAJour: TAction;
    N12: TMenuItem;
    Vrifierlaversion1: TMenuItem;
    PopupMenu1: TPopupMenu;
    mnuBack: TMenuItem;
    mnuNext: TMenuItem;
    Aperuavantimpression4: TMenuItem;
    Impression1: TMenuItem;
    N8: TMenuItem;
    Scripts1: TMenuItem;
    actScripts: TAction;
    P1: TMenuItem;
    actPublier: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actChangementOptionsExecute(Sender: TObject);
    procedure actAideContextuelleExecute(Sender: TObject);
    procedure actAfficheStatsGeneralesExecute(Sender: TObject);
    procedure actAfficheStockExecute(Sender: TObject);
    procedure actAfficheRechercheExecute(Sender: TObject);
    procedure actImpressionExecute(Sender: TObject);
    procedure actApercuImpressionExecute(Sender: TObject);
    procedure actChangeModeExecute(Sender: TObject);
    procedure actActualiseRepertoireExecute(Sender: TObject);
    procedure actRelireOptionsExecute(Sender: TObject);
    procedure actQuitterExecute(Sender: TObject);
    procedure actAfficheStatsEmprunteursExecute(Sender: TObject);
    procedure actAfficheStatsAlbumsExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPersonnaliseBarreExecute(Sender: TObject);
    procedure LoadToolBarres;
    procedure ActionsOutilsUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actAideSommaireExecute(Sender: TObject);
    procedure actAideAboutExecute(Sender: TObject);
    procedure actModeGestionExecute(Sender: TObject);
    procedure actStatsInfosBDthequeExecute(Sender: TObject);
    procedure StatsEmpruntsExecute(Sender: TObject);
    procedure actStatsListeCompletesAlbumsExecute(Sender: TObject);
    procedure actStatsAlbumsEmpruntesExecute(Sender: TObject);
    procedure StatsInfosBDAppExecute(Sender: TObject);
    procedure StatsListeCompletesAlbumsAppExecute(Sender: TObject);
    procedure StatsAlbumsEmpruntesAppExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure actModeConsultationExecute(Sender: TObject);
    procedure HistoriqueBackExecute(Sender: TObject);
    procedure HistoriqueNextExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionsStatistiquesUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actModeEntretienExecute(Sender: TObject);
    procedure actAfficheSeriesIncompletesExecute(Sender: TObject);
    procedure actAffichePrevisionsSortiesExecute(Sender: TObject);
    procedure MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
    procedure actNouvelAchatExecute(Sender: TObject);
    procedure actMiseAJourExecute(Sender: TObject);
    procedure actScriptsExecute(Sender: TObject);
    procedure actPublierExecute(Sender: TObject);
  private
    { D�clarations priv�es }
    FToolOriginal: TStringList;
    FModalWindows: TStack;
    procedure ChargeToolBarres(sl: TStringList);
    procedure WMSyscommand(var msg: TWmSysCommand); message WM_SYSCOMMAND;
    procedure HistoriqueChanged(Sender: TObject);
    procedure HistoriqueChosen(Sender: TObject);
  protected
    procedure Loaded; override;
  public
    { D�clarations publiques }
    FCurrentForm: TForm;
    FToolCurrent: TStringList;
    procedure MergeMenu(MergedMenu: TMainMenu);
    function IsShowing(Classe: TFormClass): Boolean;
    procedure SetChildForm(Form: TForm; Alignement: TAlign = alClient);
    function SetModalChildForm(Form: TForm; Alignement: TAlign = alClient): Integer;
    procedure RechargeToolBar;
  end;

var
  frmFond: TfrmFond;

implementation

{$R *.DFM}

uses
  ProceduresBDtk, UfrmRepertoire, CommonConst, UfrmOptions, UfrmStatsGeneral,
  UfrmStatsEmprunteurs, UfrmStatsAlbums, LoadComplet, Impression, UfrmGestion, UfrmCustomize,
  UfrmAboutBox, UdmPrinc, Types, Procedures, UHistorique, UfrmEntretien, ShellAPI, Math,
  UfrmScripts, UfrmPublier;

procedure TfrmFond.WMSyscommand(var msg: TWmSysCommand);
begin
  case (msg.CmdType and $FFF0) of
    SC_CLOSE: actQuitter.Execute;
    else
      inherited;
  end;
end;

procedure TfrmFond.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  with TIniFile.Create(FichierIni) do
    try
      case WindowState of
        wsMaximized: DeleteKey('Options', 'WS');
        wsNormal: WriteString('Options', 'WS', Format('%dx%d-%dx%d', [Width, Height, Left, Top]));
      end;
    finally
      Free;
    end;

  Historique.OnChange := nil;
  FreeAndNil(FModalWindows);
  FreeAndNil(FToolOriginal);
  FreeAndNil(FToolCurrent);
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Free;
end;

procedure RGBToHSV(R, G, B: Integer; var H, S, V: Integer);
var
  Delta: Integer;
  Min: Integer;
begin
  Min := MinIntValue([R, G, B]);
  V := MaxIntValue([R, G, B]);
  Delta := V - Min;
  if V = 0 then
    S := 0
  else
    S := (255 * Delta) div V;
  if S <> 0 then
  begin
    if R = V then
      H := (40 * (G - B)) div Delta
    else
    begin
      if G = V then
        H := 80 + (40 * (B - R)) div Delta
      else
      begin
        if B = V then
          H := 160 + (40 * (R - G)) div Delta;
      end;
    end;
    if H < 0 then
      H := H + 240;
  end;
end;

procedure HSVtoRGB(H, S, V: Integer; var R, G, B: Integer);
var
  f: Single;
  p, q, t: Integer;
begin
  if S = 0 then
  begin
    R := V;
    G := V;
    B := V;
  end
  else
  begin
    f := Frac(H / 40);
    p := Round(V * (1 - S / 255));
    q := Round(V * (1 - S * f / 255));
    t := Round(V * (1 - S * (1 - f) / 255));
    case (h div 40) mod 6 of
      0:
      begin
        R := V;
        G := t;
        B := p;
      end;
      1:
      begin
        R := q;
        G := V;
        B := p;
      end;
      2:
      begin
        R := p;
        G := V;
        B := t;
      end;
      3:
      begin
        R := p;
        G := q;
        B := V;
      end;
      4:
      begin
        R := t;
        G := p;
        B := V;
      end;
      5:
      begin
        R := V;
        G := p;
        B := q;
      end;
    end;
  end;
end;

function ColorToGray(AColor: TColor): TColor;
var
  H, S, V: Integer;
  R, G, B: Integer;
begin
  AColor := ColorToRGB(AColor);
  RGBToHSV(GetRValue(AColor), GetGValue(AColor), GetBValue(AColor), H, S, V);
  HSVtoRGB(H, 0, V, R, G, B);
  Result := RGB(R, G, B);
end;

procedure PNGtoGray(png: TPNGImage);
var
  h, w: Integer;
begin
  for h := 0 to Pred(png.Height) do
    for w := 0 to Pred(png.Width) do
      png.Pixels[w, h] := ColorToGray(png.Pixels[w, h]);
end;

procedure TfrmFond.FormCreate(Sender: TObject);
var
  i: Integer;
  tlb: TToolButton;
begin
  FModalWindows := TStack.Create;
  FToolOriginal := TStringList.Create;
  for i := 0 to ToolBar1.ButtonCount - 1 do
  begin
    tlb := ToolBar1.Buttons[i];
    if Assigned(tlb) then
    begin
      if Assigned(tlb.Action) then
      begin
        if TActionList(tlb.Action.Owner) <> ActionList1 then
          FToolOriginal.Add(Format('b%d=%s', [i, tlb.Action.Name]));
      end
      else if (tlb.Caption = '-') then
        FToolOriginal.Add(Format('b%d=%s', [i, 'X']));
    end;
  end;
  FToolCurrent := TStringList.Create;
  FToolCurrent.Assign(FToolOriginal);
  LoadToolBarres;
  Caption := Application.Title;
  Historique.OnChange := HistoriqueChanged;

  boutons_32x32_norm.BeginUpdate;
  boutons_16x16_norm.BeginUpdate;
  boutons_16x16_hot.BeginUpdate;
  for i := 0 to Pred(boutons_32x32_hot.Count) do
  begin
    boutons_32x32_norm.PngImages.Add.Assign(boutons_32x32_hot.PngImages[i]);
    MakeImageBlended(boutons_32x32_norm.PngImages[i].PngImage);

    boutons_16x16_hot.PngImages.Add.Assign(boutons_32x32_hot.PngImages[i]);
    boutons_16x16_norm.PngImages.Add.Assign(boutons_32x32_norm.PngImages[i]);
  end;
  boutons_32x32_norm.EndUpdate;
  boutons_16x16_norm.EndUpdate;
  boutons_16x16_hot.EndUpdate;
end;

procedure TfrmFond.actChangementOptionsExecute(Sender: TObject);
begin
  with TFrmOptions.Create(Self) do
    try
      if ShowModal <> mrOk then
        Exit;
    finally
      Free;
    end;
  if Assigned(FCurrentForm) and Assigned(FCurrentForm.Menu) then
    if TGlobalVar.Utilisateur.Options.GrandesIconesMenus then
      FCurrentForm.Menu.Images := boutons_32x32_hot
    else
      FCurrentForm.Menu.Images := boutons_16x16_hot;
  if TGlobalVar.Utilisateur.Options.GrandesIconesMenus then
    Menu.Images := boutons_32x32_hot
  else
    Menu.Images := boutons_16x16_hot;
  Historique.AddWaiting(fcRecreateToolBar);
end;

procedure TfrmFond.RechargeToolBar;
begin
  ChargeToolBarres(FToolCurrent);
end;

procedure TfrmFond.actAideContextuelleExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXTPOPUP, 0);
end;

procedure TfrmFond.actAfficheStatsGeneralesExecute(Sender: TObject);
var
  R: TStats;
begin
  R := TStats.Create(False);
  with TStatsGeneralesCreate(Self, R) do
    try
      ShowModal;
    finally
      Free;
      R.Free;
    end;
end;

procedure TfrmFond.actAfficheStockExecute(Sender: TObject);
begin
  Historique.AddWaiting(fcStock);
end;

procedure TfrmFond.actAfficheRechercheExecute(Sender: TObject);
begin
  Historique.AddWaiting(fcRecherche);
end;

procedure TfrmFond.actImpressionExecute(Sender: TObject);
var
  iImpression: IImpressionApercu;
begin
  if Assigned(FCurrentForm) and FCurrentForm.GetInterface(IImpressionApercu, iImpression) then
    iImpression.ImpressionExecute(Sender);
end;

procedure TfrmFond.actApercuImpressionExecute(Sender: TObject);
var
  iImpression: IImpressionApercu;
begin
  if Assigned(FCurrentForm) and FCurrentForm.GetInterface(IImpressionApercu, iImpression) then
    iImpression.ApercuExecute(Sender);
end;

procedure TfrmFond.actChangeModeExecute(Sender: TObject);
begin
  if not actChangeMode.Checked then
    actModeGestion.Execute
  else
    actModeConsultation.Execute;
end;

procedure TfrmFond.actActualiseRepertoireExecute(Sender: TObject);
begin
  FrmRepertoire.vstAlbums.InitializeRep;
  FrmRepertoire.vstEmprunteurs.InitializeRep;
  FrmRepertoire.vstAuteurs.InitializeRep;
end;

procedure TfrmFond.actRelireOptionsExecute(Sender: TObject);
begin
  LitOptions;
end;

procedure TfrmFond.actQuitterExecute(Sender: TObject);
var
  i: integer;
begin
  i := 0;
  while i < Application.ComponentCount do
    if (Application.Components[i] is TDataModule) and (Application.Components[i] <> DMPrinc) then
      Application.Components[i].Free
    else
      Inc(i);
  Close;
end;

procedure TfrmFond.actAfficheStatsEmprunteursExecute(Sender: TObject);
var
  R: TStats;
begin
  R := TStats.Create(False);
  with TStatsEmprunteursCreate(Self, R) do
    try
      ShowModal;
    finally
      Free;
      R.Free;
    end;
end;

procedure TfrmFond.actAfficheStatsAlbumsExecute(Sender: TObject);
var
  R: TStats;
begin
  R := TStats.Create(False);
  with TStatsAlbumsCreate(Self, R) do
    try
      ShowModal;
    finally
      Free;
      R.Free;
    end;
end;

procedure TfrmFond.ChargeToolBarres(sl: TStringList);

  function GetAction(Name: string): TAction;
  var
    i: Integer;
    act: TCustomAction;
  begin
    if not CompareMem(PChar(Name), PChar('act'), 3) then
      Name := 'act' + Name;
    Result := nil;
    for i := 0 to ActionsOutils.ActionCount - 1 do
    begin
      act := TCustomAction(ActionsOutils.Actions[i]);
      if (act <> nil) and SameText(Name, act.Name) then
      begin
        Result := act as TAction;
        Exit;
      end;
    end;
  end;

  function NewAction(aAction: TAction): TToolButton;
  begin
    Result := TToolButton.Create(ToolBar1);
    with Result do
    begin
      Parent := ToolBar1;
      if aAction = nil then
      begin
        Style := tbsSeparator;
        Width := 8;
      end
      else
      begin
        if aAction = HistoriqueBack then
        begin
          Style := tbsDropDown;
          MenuItem := mnuBack;
        end;
        if aAction = HistoriqueNext then
        begin
          Style := tbsDropDown;
          MenuItem := mnuNext;
        end;
        Cursor := crHandPoint;
        Action := aAction;
      end;
    end;
  end;

type
  TTypeButton = (tbSep, tbBut);
var
  i: Integer;
  s1, s2: string;
  LastButton: TTypeButton;
  aAction: TAction;
var
  LockWindow: ILockWindow;
begin
  LockWindow := TLockWindow.Create(Self);

  for i := 0 to ToolBar1.ButtonCount - 1 do
    ToolBar1.Buttons[0].Free;

  if TGlobalVar.Utilisateur.Options.GrandesIconesBarre then
  begin
    ToolBar1.Images := boutons_32x32_norm;
    ToolBar1.HotImages := boutons_32x32_hot;
  end
  else
  begin
    ToolBar1.Images := boutons_16x16_norm;
    ToolBar1.HotImages := boutons_16x16_hot;
  end;
  ToolBar1.ButtonHeight := 0; // force la barre � se redimensionner correctement
  ToolBar1.ButtonWidth := 0;

  LastButton := tbSep;
  for i := sl.Count - 1 downto 0 do
  begin
    s1 := sl.Names[i];
    s2 := sl.Values[s1];
    if s2 = 'X' then
    begin
      if LastButton <> tbSep then
        NewAction(nil);
      LastButton := tbSep;
    end
    else
    begin
      aAction := GetAction(s2);
      if aAction <> nil then
      begin
        NewAction(GetAction(s2));
        LastButton := tbBut;
      end;
    end;
  end;

  if LastButton <> tbSep then
    NewAction(nil);
  NewAction(HistoriqueNext);
  NewAction(HistoriqueBack);
end;

procedure TfrmFond.LoadToolBarres;
var
  sl: TStringList;
begin
  if FileExists(FichierIni) then
    with TIniFile.Create(FichierIni) do
    begin
      sl := TStringList.Create;
      try
        ReadSections(sl);
        if sl.IndexOf('Barre') = -1 then
          Exit;
        sl.Clear;
        ReadSectionValues('Barre', sl);
        ChargeToolBarres(sl);
        FToolCurrent.Assign(sl);
      finally
        sl.Free;
        Free;
      end;
    end;
end;

procedure TfrmFond.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  with TIniFile.Create(FichierIni) do
    try
      EraseSection('Barre');
      for i := 0 to Pred(FToolCurrent.Count) do
        WriteString('Barre', FToolCurrent.Names[i], FToolCurrent.ValueFromIndex[i]);
    finally
      Free;
    end;
end;

procedure TfrmFond.actPersonnaliseBarreExecute(Sender: TObject);
begin
  with TFrmCustomize.Create(Self) do
    try
      if ShowModal = mrOk then
        Historique.AddWaiting(fcRecreateToolBar);
    finally
      Free;
    end;
end;

procedure TfrmFond.ActionsOutilsUpdate(Action: TBasicAction; var Handled: Boolean);
var
  ModeConsult: Boolean;
  iImpression: IImpressionApercu;
begin
  Handled := TGlobalVar.Mode_en_cours = mdEditing;
  if not Handled then
  begin
    ModeConsult := TGlobalVar.Mode_en_cours = mdConsult;
    actActualiseRepertoire.Enabled := ModeConsult;

    if Assigned(FCurrentForm) and FCurrentForm.GetInterface(IImpressionApercu, iImpression) then
    begin
      try
        actImpression.Enabled := iImpression.ImpressionUpdate;
      except
        actImpression.Enabled := False;
      end;
      try
        actApercuImpression.Enabled := iImpression.ApercuUpdate;
      except
        actApercuImpression.Enabled := False;
      end;
    end
    else
    begin
      actImpression.Enabled := False;
      actApercuImpression.Enabled := False;
    end;
    actAfficheRecherche.Enabled := ModeConsult;
    actAfficheStock.Enabled := ModeConsult;
    actNouvelAchat.Enabled := ModeConsult;
    actModeConsultation.Checked := Assigned(FrmRepertoire);
    actModeGestion.Checked := Assigned(FrmGestions);
    actModeConsultation.Enabled := not actModeConsultation.Checked;
    actModeGestion.Enabled := not actModeGestion.Checked;
    actChangeMode.Checked := actModeGestion.Checked;
  end;
end;

procedure TfrmFond.actAideSommaireExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TfrmFond.actAideAboutExecute(Sender: TObject);
begin
  with TFrmAboutBox.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmFond.actModeGestionExecute(Sender: TObject);
var
  LockWindow: ILockWindow;
begin
  if actModeGestion.Checked then
    Exit;
  LockWindow := TLockWindow.Create(Self);
  if Assigned(FrmRepertoire) then
    FreeAndNil(FrmRepertoire);
  Application.CreateForm(TFrmGestions, FrmGestions);
  SetChildForm(FrmGestions);
end;

procedure TfrmFond.actModeConsultationExecute(Sender: TObject);
var
  LockWindow: ILockWindow;
begin
  if actModeConsultation.Checked then
    Exit;
  LockWindow := TLockWindow.Create(Self);
  FrmGestions := nil;
  Application.CreateForm(TFrmRepertoire, FrmRepertoire);
  SetChildForm(FrmRepertoire, alLeft);
  Historique.Refresh;
end;

procedure TfrmFond.actStatsInfosBDthequeExecute(Sender: TObject);
begin
  ImpressionInfosBDtheque(TAction(Sender).ActionComponent.Tag = 1);
end;

procedure TfrmFond.StatsEmpruntsExecute(Sender: TObject);
begin
  ImpressionEmprunts(TAction(Sender).ActionComponent.Tag = 1, seTous, ssTous, -1, -1, True, True);
end;

procedure TfrmFond.actStatsListeCompletesAlbumsExecute(Sender: TObject);
begin
  ImpressionListeCompleteAlbums(TAction(Sender).ActionComponent.Tag = 1);
end;

procedure TfrmFond.actStatsAlbumsEmpruntesExecute(Sender: TObject);
begin
  ImpressionEmprunts(TAction(Sender).ActionComponent.Tag = 1, seTous, ssTous, -1, -1, True, True);
end;

procedure TfrmFond.StatsInfosBDAppExecute(Sender: TObject);
begin
  actStatsInfosBDtheque.ActionComponent := TComponent(Sender);
  actStatsInfosBDtheque.Execute;
end;

procedure TfrmFond.StatsListeCompletesAlbumsAppExecute(Sender: TObject);
begin
  actStatsListeCompletesAlbums.ActionComponent := TComponent(Sender);
  actStatsListeCompletesAlbums.Execute;
end;

procedure TfrmFond.StatsAlbumsEmpruntesAppExecute(Sender: TObject);
begin
  actStatsAlbumsEmpruntes.ActionComponent := TComponent(Sender);
  actStatsAlbumsEmpruntes.Execute;
end;

procedure TfrmFond.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
begin
  CheminBase.Caption := DMPrinc.UIBDataBase.DatabaseName;
  HistoriqueBack.Enabled := (TGlobalVar.Mode_en_cours = mdConsult) and Bool(Historique.CurrentConsultation);
  HistoriqueNext.Enabled := (TGlobalVar.Mode_en_cours = mdConsult) and Bool(Historique.CountConsultation) and (Historique.CurrentConsultation <> Historique.CountConsultation - 1);
end;

function TfrmFond.SetModalChildForm(Form: TForm; Alignement: TAlign): Integer;
var
  LockWindow: ILockWindow;
  me: IModeEditing;
  CurrentMenu: TMainMenu;
begin
  LockWindow := TLockWindow.Create(Self);
  me := TModeEditing.Create;
  Result := 0;
  if not Assigned(Form) then
    Exit;
  Application.ModalStarted;
  Form.BorderStyle := bsNone;
  Form.Parent := Self;
  if FModalWindows.Count > 0 then
  begin
    TForm(FModalWindows.Peek).Enabled := False;
    CurrentMenu := TForm(FModalWindows.Peek).Menu;
  end
  else
    CurrentMenu := FCurrentForm.Menu;
  if Assigned(FrmRepertoire) then
    FrmRepertoire.Visible := False;
  FModalWindows.Push(Form);
  try
    Form.Show;
    Form.Align := Alignement;
    MergeMenu(Form.Menu);
    LockWindow := nil;
    repeat
      Application.HandleMessage;
      Result := Form.ModalResult;
    until Result <> 0;
  finally
    FModalWindows.Pop;
    if FModalWindows.Count > 0 then
      TForm(FModalWindows.Peek).Enabled := True;
    if Assigned(FrmRepertoire) then
      FrmRepertoire.Visible := FModalWindows.Count = 0;
    MergeMenu(CurrentMenu);
    Application.ModalFinished;
  end;
end;

function TfrmFond.IsShowing(Classe: TFormClass): Boolean;
var
  i: Integer;
  c: TObject;
begin
  Result := False;
  i := 0;
  while not Result and (i < FModalWindows.Count) do
  begin
    c := FModalWindows.List[i];
    Result := c is Classe;
    Inc(i);
  end;
end;

procedure TfrmFond.MergeMenu(MergedMenu: TMainMenu);

  procedure ProcessMenuItem(MenuItem: TMenuItem);
  var
    i: Integer;
  begin
    if MenuItem.Caption = cLineCaption then
      Exit;
    if Assigned(MenuItem.Parent) then
      MenuItem.OnMeasureItem := MeasureMenuItem;
    for i := 0 to Pred(MenuItem.Count) do
      ProcessMenuItem(MenuItem.Items[i]);
  end;

var
  i: Integer;
begin
  if Assigned(MergedMenu) then
  begin
    if TGlobalVar.Utilisateur.Options.GrandesIconesMenus then
      MergedMenu.Images := boutons_32x32_hot
    else
      MergedMenu.Images := boutons_16x16_hot;
    for i := 0 to Pred(MergedMenu.Items.Count) do
      MergedMenu.Items[i].GroupIndex := 50;
  end;
  Menu.Merge(MergedMenu);
  for i := 0 to Pred(Menu.Items.Count) do
    ProcessMenuItem(Menu.Items[i]);
end;

procedure TfrmFond.SetChildForm(Form: TForm; Alignement: TAlign = alClient);
var
  LockWindow: ILockWindow;
begin
  if not Assigned(Form) then
  begin
    if (TGlobalVar.Mode_en_cours = mdConsult) then
      Historique.Last
    else if Assigned(FCurrentForm) then
      SetChildForm(FCurrentForm);
    Exit;
  end;
  LockWindow := TLockWindow.Create(Self);
  try
    if Assigned(FCurrentForm) then
      FreeAndNil(FCurrentForm);
  except
  end;
  Form.BorderStyle := bsNone;
  Form.Parent := Self;
  Form.Visible := True;
  Form.Align := Alignement;
  if not (Form is TFrmRepertoire) then
  begin
    FCurrentForm := Form;
    MergeMenu(FCurrentForm.Menu);
  end
  else
    FCurrentForm := nil;
  if Form is TFrmRepertoire then
    Splitter1.Left := ClientWidth - Splitter1.Width;
  Form.left := 0;
end;

procedure TfrmFond.HistoriqueBackExecute(Sender: TObject);
begin
  Historique.Back;
end;

procedure TfrmFond.HistoriqueNextExecute(Sender: TObject);
begin
  Historique.Next;
end;

procedure TfrmFond.FormShow(Sender: TObject);
begin
  Splitter1.Left := ClientWidth;
end;

procedure TfrmFond.ActionsStatistiquesUpdate(Action: TBasicAction; var Handled: Boolean);
var
  i: Integer;
begin
  if TGlobalVar.Mode_en_cours = mdEditing then
  begin
    for i := 0 to Pred(ActionsStatistiques.ActionCount) do
      TAction(ActionsStatistiques.Actions[i]).Enabled := False;
    Handled := True;
  end
  else
    for i := 0 to Pred(ActionsStatistiques.ActionCount) do
      TAction(ActionsStatistiques.Actions[i]).Enabled := True;
end;

procedure TfrmFond.actModeEntretienExecute(Sender: TObject);
begin
  SetModalChildForm(TFrmEntretien.Create(Self));
end;

procedure TfrmFond.actAfficheSeriesIncompletesExecute(Sender: TObject);
begin
  Historique.AddWaiting(fcSeriesIncompletes);
end;

procedure TfrmFond.actAffichePrevisionsSortiesExecute(Sender: TObject);
begin
  Historique.AddWaiting(fcPrevisionsSorties);
end;

procedure TfrmFond.MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);

  procedure SetMenuSize;
  var
    NonClientMetrics: TNonClientMetrics;
  begin
    NonClientMetrics.cbSize := sizeof(NonClientMetrics);
    if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    begin
      Height := NonClientMetrics.iMenuHeight;
    end;
  end;

var
  il: TCustomImageList;
begin
  il := TMenuItem(Sender).GetImageList;
  if not Assigned(il) or (TMenuItem(Sender).ImageIndex = -1) then
    SetMenuSize
  else
    Height := il.Height + 3;
end;

procedure TfrmFond.actNouvelAchatExecute(Sender: TObject);
begin
  Historique.AddWaiting(fcPrevisionsAchats);
end;

procedure TfrmFond.actMiseAJourExecute(Sender: TObject);
begin
  DMPrinc.CheckVersion(True);
end;

procedure TfrmFond.HistoriqueChanged(Sender: TObject);
const
  MaxNbItems = 10;
var
  i: Integer;
  mnu: TMenuItem;
begin
  //  mnuBack.Items.Count = Historique.CurrentConsultation;
  //  mnuNext.Items.Count = Historique.CountConsultation - Historique.CurrentConsultation - 1;
  //  mnuCurrent.Items.Count = 1 (Historique.CurrentConsultation);

  mnuBack.Clear;
  for i := Max(0, Historique.CurrentConsultation - MaxNbItems) to (Historique.CurrentConsultation - 1) do
  begin
    mnu := TMenuItem.Create(Self);
    mnu.Caption := Historique.GetDescription(i);
    mnu.Tag := i;
    mnu.OnClick := HistoriqueChosen;
    mnuBack.Insert(0, mnu);
  end;
  if (Historique.CurrentConsultation - MaxNbItems > 0) then
  begin
    mnu := TMenuItem.Create(Self);
    mnu.Caption := '...';
    mnu.Enabled := False;
    mnuBack.Add(mnu);
  end;
  mnuNext.Clear;
  for i := (Historique.CurrentConsultation + 1) to Min(Pred(Historique.CountConsultation), Historique.CurrentConsultation + MaxNbItems) do
  begin
    mnu := TMenuItem.Create(Self);
    mnu.Caption := Historique.GetDescription(i);
    mnu.Tag := i;
    mnu.OnClick := HistoriqueChosen;
    mnuNext.Add(mnu);
  end;
  if (Historique.CurrentConsultation + MaxNbItems < Pred(Historique.CountConsultation)) then
  begin
    mnu := TMenuItem.Create(Self);
    mnu.Caption := '...';
    mnu.Enabled := False;
    mnuNext.Add(mnu);
  end;
end;

procedure TfrmFond.HistoriqueChosen(Sender: TObject);
begin
  Historique.GoConsultation(TComponent(Sender).Tag);
end;

procedure TfrmFond.actScriptsExecute(Sender: TObject);
begin
  Historique.AddWaiting(fcScripts);
end;

procedure TfrmFond.actPublierExecute(Sender: TObject);
begin
  with TfrmPublier.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmFond.Loaded;
var
  s, Taille, Position: string;
  i, iWidth, iHeight, iLeft, iTop: Integer;
begin
  inherited;
  with TIniFile.Create(FichierIni) do
    try
      s := ReadString('Options', 'WS', '');
      if s <> '' then
        try
          i := Pos('-', s);
          Taille := Copy(s, 1, i - 1);
          Position := Copy(s, i + 1, MaxInt);

          i := Pos('x', Taille);
          iWidth := StrToInt(Copy(Taille, 1, i - 1));
          iHeight := StrToInt(Copy(Taille, i + 1, MaxInt));

          i := Pos('x', Position);
          iLeft := StrToInt(Copy(Position, 1, i - 1));
          iTop := StrToInt(Copy(Position, i + 1, MaxInt));

          WindowState := wsNormal;
          SetBounds(iLeft, iTop, iWidth, iHeight);
        except
          // on ne fait rien en cas d'erreur: la ligne DOIT �tre correcte
          Assert(False, 'Taille de fen�tre mal d�cod�e');
        end;
    finally
      Free;
    end;
end;

end.
