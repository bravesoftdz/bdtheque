unit UfrmConsultationAlbum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, ExtCtrls, DBCtrls, StdCtrls, Menus, ComCtrls,
  UfrmFond, VDTButton, ActnList, Buttons, ReadOnlyCheckBox, ToolWin, VirtualTrees, ProceduresBDtk, UbdtForms, StrUtils,
  jpeg, ShellAPI, LoadComplet, CRFurtif, Generics.Defaults;

type
  TfrmConsultationAlbum = class(TBdtForm, IImpressionApercu)
    Popup3: TPopupMenu;
    Informations1: TMenuItem;
    Emprunts1: TMenuItem;
    MenuItem1: TMenuItem;
    Adresse1: TMenuItem;
    ActionList1: TActionList;
    FicheImprime: TAction;
    FicheApercu: TAction;
    EmpruntApercu: TAction;
    EmpruntImprime: TAction;
    CouvertureImprime: TAction;
    CouvertureApercu: TAction;
    ScrollBox2: TScrollBox;
    l_remarques: TLabel;
    l_sujet: TLabel;
    Label1: TLabel;
    l_annee: TLabel;
    remarques: TMemo;
    sujet: TMemo;
    l_acteurs: TLabel;
    l_realisation: TLabel;
    lvScenaristes: TVDTListView;
    lvDessinateurs: TVDTListView;
    Couverture: TImage;
    Label4: TLabel;
    lvSerie: TVDTListView;
    Label5: TLabel;
    TitreAlbum: TLabel;
    Label6: TLabel;
    VDTButton3: TCRFurtifLight;
    VDTButton4: TCRFurtifLight;
    Memo1: TMemo;
    lvColoristes: TVDTListView;
    Label7: TLabel;
    Integrale: TReadOnlyCheckBox;
    Label11: TLabel;
    AnneeParution: TLabel;
    TitreSerie: TLabel;
    Label14: TLabel;
    Tome: TLabel;
    Bevel1: TBevel;
    lvEditions: TListBox;
    HorsSerie: TReadOnlyCheckBox;
    MainMenu1: TMainMenu;
    Fiche1: TMenuItem;
    Emprunts2: TMenuItem;
    Couverture1: TMenuItem;
    Aperuavantimpression1: TMenuItem;
    Aperuavantimpression2: TMenuItem;
    Aperuavantimpression3: TMenuItem;
    Aperuavantimpression4: TMenuItem;
    Aperuavantimpression5: TMenuItem;
    Aperuavantimpression6: TMenuItem;
    PanelEdition: TPanel;
    ISBN: TLabel;
    Editeur: TLabel;
    Prix: TLabel;
    Lbl_numero: TLabel;
    Lbl_type: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    nbemprunts: TLabel;
    Label9: TLabel;
    Collection: TLabel;
    Label16: TLabel;
    AnneeEdition: TLabel;
    Etat: TLabel;
    Label10: TLabel;
    Reliure: TLabel;
    Label13: TLabel;
    TypeEdition: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    AcheteLe: TLabel;
    Label15: TLabel;
    Pages: TLabel;
    Label17: TLabel;
    lbOrientation: TLabel;
    Label19: TLabel;
    lbFormat: TLabel;
    cbVO: TReadOnlyCheckBox;
    ListeEmprunts: TVirtualStringTree;
    ajouter: TButton;
    cbCouleur: TReadOnlyCheckBox;
    cbStock: TReadOnlyCheckBox;
    edNotes: TMemo;
    cbOffert: TReadOnlyCheckBox;
    cbDedicace: TReadOnlyCheckBox;
    Label18: TLabel;
    lbCote: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lbSensLecture: TLabel;
    Label22: TLabel;
    lbNumeroPerso: TLabel;
    procedure lvScenaristesDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImpRep(Sender: TObject);
    procedure ajouterClick(Sender: TObject);
    procedure Impression1Click(Sender: TObject);
    procedure Imprimer1Click(Sender: TObject);
    procedure Imprimer2Click(Sender: TObject);
    procedure ListeEmpruntsDblClick(Sender: TObject);
    procedure CouvertureDblClick(Sender: TObject);
    procedure lvSerieDblClick(Sender: TObject);
    procedure VDTButton1Click(Sender: TObject);
    procedure VDTButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListeEmpruntsGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure ListeEmpruntsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure ListeEmpruntsHeaderClick(Sender: TVTHeader; Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lvEditionsClick(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure EditeurClick(Sender: TObject);
    procedure TitreSerieDblClick(Sender: TObject);
    procedure TitreSerieClick(Sender: TObject);
    procedure lvScenaristesData(Sender: TObject; Item: TListItem);
    procedure lvDessinateursData(Sender: TObject; Item: TListItem);
    procedure lvColoristesData(Sender: TObject; Item: TListItem);
    procedure lvSerieData(Sender: TObject; Item: TListItem);
    procedure lvSerieGetImageIndex(Sender: TObject; Item: TListItem);
  private
    { D�clarations priv�es }
    CurrentCouverture: Integer;
    FAlbum: TAlbumComplet;
    FCurrentEdition: TEditionComplete;
    procedure ShowCouverture(Num: Integer);
    procedure ImpressionExecute(Sender: TObject);
    procedure ApercuExecute(Sender: TObject);
    function ImpressionUpdate: Boolean;
    function ApercuUpdate: Boolean;
    function GetID_Album: TGUID;
    procedure SetID_Album(const Value: TGUID);
    procedure ClearForm;
  public
    { D�clarations publiques }
    property Album: TAlbumComplet read FAlbum;
    property ID_Album: TGUID read GetID_Album write SetID_Album;
  end;

implementation

{$R *.DFM}

uses Commun, TypeRec, CommonConst, MAJ, Impression, DateUtils, UHistorique, Procedures,
  Divers, Textes;

var
  FSortColumn: Integer;
  FSortDirection: TSortDirection;

procedure TfrmConsultationAlbum.lvScenaristesDblClick(Sender: TObject);
begin
  if Assigned(TListView(Sender).Selected) then Historique.AddWaiting(fcAuteur, TAuteur(TListView(Sender).Selected.Data).Personne.ID, 0);
end;

procedure TfrmConsultationAlbum.FormCreate(Sender: TObject);
begin
  FAlbum := TAlbumComplet.Create;
  PrepareLV(Self);
  CurrentCouverture := 0;
  ListeEmprunts.Header.Columns[0].Width := 100;
  FSortColumn := 0;
  FSortDirection := sdDescending;
  ListeEmprunts.Header.Columns[1].ImageIndex := 1;
  Couverture.Picture := nil;
end;

procedure TfrmConsultationAlbum.FormDestroy(Sender: TObject);
begin
  ClearForm;
  FAlbum.Free;
end;

procedure TfrmConsultationAlbum.ClearForm;
begin
  lvScenaristes.Items.Count := 0;
  lvDessinateurs.Items.Count := 0;
  lvColoristes.Items.Count := 0;
  lvSerie.Items.Count := 0;
  ListeEmprunts.Clear;
  lvEditions.Items.Clear;
  FCurrentEdition := nil;
end;

procedure TfrmConsultationAlbum.ImpRep(Sender: TObject);
begin
  if lvEditions.ItemIndex > -1 then
    ImpressionFicheAlbum(ID_Album, TEditionComplete(lvEditions.Items.Objects[lvEditions.ItemIndex]).ID_Edition, TComponent(Sender).Tag = 1)
  else
    ImpressionFicheAlbum(ID_Album, GUID_NULL, TComponent(Sender).Tag = 1);
end;

procedure TfrmConsultationAlbum.ajouterClick(Sender: TObject);
begin
  if SaisieMouvementAlbum(ID_Album, TEditionComplete(lvEditions.Items.Objects[lvEditions.ItemIndex]).ID_Edition, cbStock.Checked) then Historique.Refresh;
end;

procedure TfrmConsultationAlbum.Impression1Click(Sender: TObject);
begin
  ImpRep(Sender);
end;

procedure TfrmConsultationAlbum.Imprimer1Click(Sender: TObject);
begin
  ImpressionEmpruntsAlbum(ID_Album, TComponent(Sender).Tag = 1);
end;

procedure TfrmConsultationAlbum.Imprimer2Click(Sender: TObject);
begin
  ImpressionCouvertureAlbum(ID_Album, TCouverture(FCurrentEdition.Couvertures[CurrentCouverture]).ID, TComponent(Sender).Tag = 1);
end;

procedure TfrmConsultationAlbum.ListeEmpruntsDblClick(Sender: TObject);
begin
  if Assigned(ListeEmprunts.FocusedNode) then Historique.AddWaiting(fcEmprunteur, TEmprunt(FCurrentEdition.Emprunts.Emprunts[ListeEmprunts.FocusedNode.Index]).Emprunteur.ID);
end;

procedure TfrmConsultationAlbum.CouvertureDblClick(Sender: TObject);
begin
  Historique.AddWaiting(fcCouverture, ID_Album, TCouverture(FCurrentEdition.Couvertures[CurrentCouverture]).ID);
end;

procedure TfrmConsultationAlbum.lvSerieDblClick(Sender: TObject);
begin
  if Assigned(lvSerie.Selected) and (not IsEqualGUID(TAlbum(lvSerie.Selected.Data).ID, ID_Album)) then Historique.AddWaiting(fcAlbum, TAlbum(lvSerie.Selected.Data).ID);
end;

procedure TfrmConsultationAlbum.VDTButton1Click(Sender: TObject);
begin
  ShowCouverture(Succ(CurrentCouverture));
end;

procedure TfrmConsultationAlbum.VDTButton2Click(Sender: TObject);
begin
  ShowCouverture(Pred(CurrentCouverture));
end;

procedure TfrmConsultationAlbum.ShowCouverture(Num: Integer);
var
  hg: IHourGlass;
  ms: TStream;
  jpg: TJPEGImage;
begin
  Label4.Visible := FCurrentEdition.Couvertures.Count = 0;

  if FCurrentEdition.Couvertures.Count > 0 then begin
    hg := THourGlass.Create;
    if Num < 0 then Num := Pred(FCurrentEdition.Couvertures.Count);
    if Num > Pred(FCurrentEdition.Couvertures.Count) then Num := 0;
    CurrentCouverture := Num;
    Couverture.Picture := nil;
    try
      ms := GetCouvertureStream(False, TCouverture(FCurrentEdition.Couvertures[Num]).ID, Couverture.Height, Couverture.Width, TGlobalVar.Utilisateur.Options.AntiAliasing);
      if Assigned(ms) then try
        jpg := TJPEGImage.Create;
        try
          jpg.LoadFromStream(ms);
          Couverture.Picture.Assign(jpg);
          Couverture.Transparent := False;
        finally
          jpg.Free;
        end;
      finally
        ms.Free;
      end
      else
        Couverture.Picture.Assign(nil);
    except
      Couverture.Picture.Assign(nil);
    end;

    Label18.Visible := not Assigned(Couverture.Picture.Graphic);
    if Label18.Visible then begin
      Couverture.OnDblClick := nil;
      Couverture.Cursor := crDefault;
      ms := TResourceStream.Create(HInstance, 'IMAGENONVALIDE', RT_RCDATA);
      jpg := TJPEGImage.Create;
      try
        jpg.LoadFromStream(ms);
        Couverture.Picture.Assign(jpg);
        Couverture.Transparent := True;
      finally
        jpg.Free;
        ms.Free;
      end;
    end
    else begin
      Couverture.OnDblClick := CouvertureDblClick;
      Couverture.Cursor := crHandPoint;
    end;
  end
  else
    Couverture.Picture.Assign(nil);
end;

procedure TfrmConsultationAlbum.FormShow(Sender: TObject);
var
  i: integer;
begin
  lvEditions.ItemIndex := 0;
  lvEditions.OnClick(lvEditions);
  Resize;

  // le TListView est aussi une merde! le MakeVisible ne peut fonctionner que si on a un handle

  // lvSerie.HandleNeeded n'est d'aucune utilit�!!!!

  // conclusion:
  // TODO: virer le TListView!!!!!!!

  for i := 0 to Pred(lvSerie.Items.Count) do
    if IsEqualGUID(TAlbum(lvSerie.Items[i].Data).ID, ID_Album) then
      if i = Pred(lvSerie.Items.Count)
        then lvSerie.Items[i].MakeVisible(False)
        else lvSerie.Items[i + 1].MakeVisible(False);
end;

procedure TfrmConsultationAlbum.ListeEmpruntsGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
begin
  if Column = 0 then
    if TEmprunt(FCurrentEdition.Emprunts.Emprunts[Node.Index]).Pret then
      ImageIndex := 3
    else
      ImageIndex := 2;
end;

procedure TfrmConsultationAlbum.ListeEmpruntsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  case Column of
    0: CellText := DateToStr(TEmprunt(FCurrentEdition.Emprunts.Emprunts[Node.Index]).Date);
    1: CellText := TEmprunt(FCurrentEdition.Emprunts.Emprunts[Node.Index]).Emprunteur.ChaineAffichage;
  end;
end;

type
  TEmpruntCompare = class(TComparer<TEmprunt>)
    function Compare(const Left, Right: TEmprunt): Integer; override;
  end;

  TEmpruntCompareDesc = class(TEmpruntCompare)
    function Compare(const Left, Right: TEmprunt): Integer; override;
  end;

function TEmpruntCompare.Compare(const Left, Right: TEmprunt): Integer;
begin
  case FSortColumn of
    0: Result := CompareDate(TEmprunt(Left).Date, TEmprunt(Right).Date);
    1: Result := CompareText(TEmprunt(Left).Emprunteur.Nom, TEmprunt(Right).Emprunteur.Nom);
    else
      Result := 0;
  end;
end;

function TEmpruntCompareDesc.Compare(const Left, Right: TEmprunt): Integer;
begin
  Result := -inherited;
end;

procedure TfrmConsultationAlbum.ListeEmpruntsHeaderClick(Sender: TVTHeader; Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Column <> FSortColumn then
    if Column = 0 then
      FSortDirection := sdDescending
    else
      FSortDirection := sdAscending
  else begin
    if FSortDirection = sdAscending then
      FSortDirection := sdDescending
    else
      FSortDirection := sdAscending;
  end;
  if FSortColumn <> -1 then ListeEmprunts.Header.Columns[FSortColumn].ImageIndex := -1;
  FSortColumn := Column;
  if FSortDirection = sdAscending then
    ListeEmprunts.Header.Columns[FSortColumn].ImageIndex := 0
  else
    ListeEmprunts.Header.Columns[FSortColumn].ImageIndex := 1;
  if FSortDirection = sdDescending then
    FCurrentEdition.Emprunts.Emprunts.Sort(TEmpruntCompareDesc.Create)
  else
    FCurrentEdition.Emprunts.Emprunts.Sort(TEmpruntCompare.Create);
  ListeEmprunts.Invalidate;
end;

procedure TfrmConsultationAlbum.lvEditionsClick(Sender: TObject);
begin
  PanelEdition.Visible := lvEditions.ItemIndex > -1;
  if PanelEdition.Visible then begin
    FCurrentEdition := TEditionComplete(lvEditions.Items.Objects[lvEditions.ItemIndex]);
    try
      ISBN.Caption := FCurrentEdition.ISBN;
      Editeur.Caption := FormatTitre(FCurrentEdition.Editeur.NomEditeur);
      if FCurrentEdition.Editeur.SiteWeb <> '' then begin
        Editeur.Font.Color := clBlue;
        Editeur.Font.Style := [fsUnderline];
        Editeur.Cursor := crHandPoint;
      end
      else begin
        Editeur.Font.Color := clWindowText;
        Editeur.Font.Style := [];
        Editeur.Cursor := crDefault;
      end;
      Collection.Caption := FCurrentEdition.Collection.ChaineAffichage;
      cbStock.Checked := FCurrentEdition.Stock;
      AnneeEdition.Caption := NonZero(IntToStr(FCurrentEdition.AnneeEdition));
      cbVO.Checked := FCurrentEdition.VO;
      cbOffert.Checked := FCurrentEdition.Offert;
      cbCouleur.Checked := FCurrentEdition.Couleur;
      cbDedicace.Checked := FCurrentEdition.Dedicace;
      TypeEdition.Caption := FCurrentEdition.TypeEdition.Caption;
      Reliure.Caption := FCurrentEdition.Reliure.Caption;
      Etat.Caption := FCurrentEdition.Etat.Caption;
      Pages.Caption := NonZero(IntToStr(FCurrentEdition.NombreDePages));
      lbOrientation.Caption := FCurrentEdition.Orientation.Caption;
      lbFormat.Caption := FCurrentEdition.FormatEdition.Caption;
      lbSensLecture.Caption := FCurrentEdition.SensLecture.Caption;
      lbNumeroPerso.Caption := FCurrentEdition.NumeroPerso;
      if cbOffert.Checked then
        Label12.Caption := rsTransOffertLe + ' :'
      else
        Label12.Caption := rsTransAcheteLe + ' :';
      AcheteLe.Caption := FCurrentEdition.sDateAchat;
      edNotes.Lines.Assign(FCurrentEdition.Notes);

      ShowCouverture(0);
      if FCurrentEdition.Gratuit then
        Prix.Caption := rsTransGratuit
      else if FCurrentEdition.Prix = 0 then
        Prix.Caption := ''
      else
        Prix.Caption := FormatCurr(FormatMonnaie, FCurrentEdition.Prix);

      if FCurrentEdition.PrixCote > 0 then
        lbCote.Caption := Format('%s (%d)', [FormatCurr(FormatMonnaie, FCurrentEdition.PrixCote), FCurrentEdition.AnneeCote])
      else
        lbCote.Caption := '';

      ListeEmprunts.RootNodeCount := FCurrentEdition.Emprunts.Emprunts.Count;
      nbEmprunts.Caption := IntToStr(FCurrentEdition.Emprunts.NBEmprunts);
    finally
      Ajouter.Enabled := True;
      CurrentCouverture := 0;
      VDTButton3.Visible := FCurrentEdition.Couvertures.Count > 1;
      VDTButton4.Visible := VDTButton3.Visible;
    end;
  end;
end;

procedure TfrmConsultationAlbum.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
begin
  CouvertureImprime.Enabled := Bool(FCurrentEdition.Couvertures.Count);
  CouvertureApercu.Enabled := CouvertureImprime.Enabled;
end;

procedure TfrmConsultationAlbum.ApercuExecute(Sender: TObject);
begin
  Impression1Click(Sender);
end;

function TfrmConsultationAlbum.ApercuUpdate: Boolean;
begin
  Result := True;
end;

procedure TfrmConsultationAlbum.ImpressionExecute(Sender: TObject);
begin
  Impression1Click(Sender);
end;

function TfrmConsultationAlbum.ImpressionUpdate: Boolean;
begin
  Result := True;
end;

procedure TfrmConsultationAlbum.EditeurClick(Sender: TObject);
var
  s: string;
begin
  s := FCurrentEdition.Editeur.SiteWeb;
  if s <> '' then
    ShellExecute(Application.DialogHandle, nil, PChar(s), nil, nil, SW_NORMAL);
end;

function TfrmConsultationAlbum.GetID_Album: TGUID;
begin
  Result := FAlbum.ID_Album;
end;

procedure TfrmConsultationAlbum.SetID_Album(const Value: TGUID);
var
  s, s2: string;
  i: Integer;
  PEd: TEditionComplete;
begin
  ClearForm;
  FAlbum.Fill(Value);

  Caption := 'Fiche d''album - ' + FAlbum.ChaineAffichage;
  TitreSerie.Caption := FormatTitre(FAlbum.Serie.Titre);
  if FAlbum.Serie.SiteWeb <> '' then begin
    TitreSerie.Font.Color := clBlue;
    TitreSerie.Font.Style := TitreSerie.Font.Style + [fsUnderline];
    TitreSerie.Cursor := crHandPoint;
  end
  else begin
    TitreSerie.Font.Color := clWindowText;
    TitreSerie.Font.Style := TitreSerie.Font.Style - [fsUnderline];
    TitreSerie.Cursor := crDefault;
  end;
  TitreAlbum.Caption := FormatTitre(FAlbum.Titre);
  Tome.Caption := NonZero(IntToStr(FAlbum.Tome));
  Integrale.Checked := FAlbum.Integrale;
  if Integrale.Checked then begin
    s := NonZero(IntToStr(FAlbum.TomeDebut));
    AjoutString(s, NonZero(IntToStr(FAlbum.TomeFin)), ' � ');
    s2 := Integrale.Caption;
    AjoutString(s2, s, ' ', '[', ']');
    Integrale.Caption := s2;
  end;
  HorsSerie.Checked := FAlbum.HorsSerie;
  AnneeParution.Caption := IIf(FAlbum.MoisParution > 0, ShortMonthNames[FAlbum.MoisParution] + ' ', '') + NonZero(IntToStr(FAlbum.AnneeParution));
  s := FAlbum.Sujet.Text;
  if s = '' then s := FAlbum.Serie.Sujet.Text;
  Sujet.Text := s;
  s := FAlbum.Notes.Text;
  if s = '' then s := FAlbum.Serie.Notes.Text;
  Remarques.Text := s;

  s := '';
  for i := 0 to Pred(FAlbum.Serie.Genres.Count) do
    AjoutString(s, FAlbum.Serie.Genres.ValueFromIndex[i], ', ');
  Memo1.Lines.Text := s;

  lvScenaristes.Items.BeginUpdate;
  lvDessinateurs.Items.BeginUpdate;
  lvColoristes.Items.BeginUpdate;

  lvScenaristes.Items.Count := FAlbum.Scenaristes.Count;
  lvDessinateurs.Items.Count := FAlbum.Dessinateurs.Count;
  lvColoristes.Items.Count := FAlbum.Coloristes.Count;

  lvScenaristes.Items.EndUpdate;
  lvDessinateurs.Items.EndUpdate;
  lvColoristes.Items.EndUpdate;

  lvSerie.Items.BeginUpdate;
  lvSerie.Items.Count := FAlbum.Serie.Albums.Count;
  lvSerie.Items.EndUpdate;
  if FAlbum.Serie.Albums.Count = 1 then
    lvSerie.SmallImages := nil;

  lvEditions.Items.BeginUpdate;
  for i := 0 to Pred(FAlbum.Editions.Editions.Count) do begin
    PEd := FAlbum.Editions.Editions[i];
    lvEditions.AddItem(PEd.ChaineAffichage, PEd);
  end;
  lvEditions.Items.EndUpdate;
  lvEditions.Visible := FAlbum.Editions.Editions.Count > 1;
end;

procedure TfrmConsultationAlbum.TitreSerieDblClick(Sender: TObject);
begin
  if IsDownKey(VK_CONTROL) then
    Historique.AddWaiting(fcSerie, FAlbum.Serie.ID_Serie);
end;

procedure TfrmConsultationAlbum.TitreSerieClick(Sender: TObject);
var
  s: string;
begin
  if not IsDownKey(VK_CONTROL) then begin
    s := FAlbum.Serie.SiteWeb;
    if s <> '' then
      ShellExecute(Application.DialogHandle, nil, PChar(s), nil, nil, SW_NORMAL);
  end;
end;

procedure TfrmConsultationAlbum.lvScenaristesData(Sender: TObject; Item: TListItem);
begin
  Item.Data := FAlbum.Scenaristes[Item.Index];
  Item.Caption := TAuteur(Item.Data).ChaineAffichage;
end;

procedure TfrmConsultationAlbum.lvDessinateursData(Sender: TObject; Item: TListItem);
begin
  Item.Data := FAlbum.Dessinateurs[Item.Index];
  Item.Caption := TAuteur(Item.Data).ChaineAffichage;
end;

procedure TfrmConsultationAlbum.lvColoristesData(Sender: TObject; Item: TListItem);
begin
  Item.Data := FAlbum.Coloristes[Item.Index];
  Item.Caption := TAuteur(Item.Data).ChaineAffichage;
end;

procedure TfrmConsultationAlbum.lvSerieData(Sender: TObject; Item: TListItem);
begin
  Item.Data := FAlbum.Serie.Albums[Item.Index];
  Item.Caption := TAlbum(Item.Data).ChaineAffichage;
end;

procedure TfrmConsultationAlbum.lvSerieGetImageIndex(Sender: TObject; Item: TListItem);
begin
  if IsEqualGUID(TAlbum(Item.Data).ID, ID_Album) then
    Item.ImageIndex := 1
  else
    Item.ImageIndex := -1;
end;

end.
