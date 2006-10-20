unit MAJ;

interface

uses
  Windows, SysUtils, Forms, Controls, ComCtrls, TypeRec, LoadComplet, Classes, Commun;

function MAJConsultationAlbum(const Reference: TGUID): Boolean;
function MAJConsultationEmprunteur(const Reference: TGUID): Boolean;
function MAJConsultationAuteur(const Reference: TGUID): Boolean;
function MAJConsultationParaBD(const Reference: TGUID): Boolean;
function MAJConsultationSerie(const Reference: TGUID): Boolean;
procedure MAJStock;
procedure MAJSeriesIncompletes;
procedure MAJPrevisionsSorties;
procedure MAJPrevisionsAchats;
procedure MAJRecherche(const Reference: TGUID; TypeSimple: Integer = -1; Stream: TMemoryStream = nil);
function ZoomCouverture(isParaBD: Boolean; const ID_Item, ID_Couverture: TGUID): Boolean;

function SaisieMouvementAlbum(const MvtID_Album, MvtID_Edition: TGUID; MvtPret: Boolean; const MvtID_Emprunteur: string = sGUID_NULL): Boolean;
function SaisieMouvementEmprunteur(const MvtID_Emprunteur: TGUID; const MvtID_Album: TEditionsEmpruntees): Boolean;

implementation

uses
  CommonConst, Form_Stock, Main, DB, StdCtrls, JvUIB, JvUIBLib, Form_SeriesIncompletes,
  Form_PrevisionsSorties, Graphics, Form_ConsultationAlbum, Form_ConsultationEmprunteur, Form_SaisieEmpruntAlbum, Form_SaisieEmpruntEmprunteur, Form_Recherche,
  Form_ZoomCouverture, Form_ConsultationAuteur, Form_PrevisionAchats, UHistorique,
  Form_ConsultationParaBD, Form_ConsultationSerie;

function MAJConsultationAuteur(const Reference: TGUID): Boolean;
var
  FDest: TFrmConsultationAuteur;
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  //  if not (Mode_en_cours in [mdEdit, mdConsult]) then Exit;
  FDest := TFrmConsultationAuteur.Create(Fond);
  try
    FDest.ID_Auteur := Reference;
    Historique.SetDescription(FDest.Caption);
    Result := not FDest.Auteur.RecInconnu;
  finally
    Fond.SetChildForm(FDest);
  end;
end;

function MAJConsultationAlbum(const Reference: TGUID): Boolean;
var
  FDest: TFrmConsultationAlbum;
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  //  if not (Mode_en_cours in [mdEdit, mdConsult]) then Exit;
  FDest := TFrmConsultationAlbum.Create(Fond);
  try
    FDest.ID_Album := Reference;
    Historique.SetDescription(FDest.Caption);
    Result := not FDest.Album.RecInconnu;
  finally
    Fond.SetChildForm(FDest);
  end;
end;

function MAJConsultationSerie(const Reference: TGUID): Boolean;
var
  FDest: TFrmConsultationSerie;
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  //  if not (Mode_en_cours in [mdEdit, mdConsult]) then Exit;
  FDest := TFrmConsultationSerie.Create(Fond);
  try
    FDest.ID_Serie := Reference;
    Historique.SetDescription(FDest.Caption);
    Result := not FDest.Serie.RecInconnu;
  finally
    Fond.SetChildForm(FDest);
  end;
end;

function MAJConsultationParaBD(const Reference: TGUID): Boolean;
var
  FDest: TFrmConsultationParaBD;
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  //  if not (Mode_en_cours in [mdEdit, mdConsult]) then Exit;
  FDest := TFrmConsultationParaBD.Create(Fond);
  try
    FDest.ID_ParaBD := Reference;
    Historique.SetDescription(FDest.Caption);
    Result := not FDest.ParaBD.RecInconnu;
  finally
    Fond.SetChildForm(FDest);
  end;
end;

function MAJConsultationEmprunteur(const Reference: TGUID): Boolean;
var
  FDest: TFrmConsultationEmprunteur;
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  //  if not (Mode_en_cours in [mdEdit, mdConsult]) then Exit;
  FDest := TFrmConsultationEmprunteur.Create(Fond);
  try
    FDest.ID_Emprunteur := Reference;
    Historique.SetDescription(FDest.Caption);
    Result := not FDest.Emprunteur.RecInconnu;
  finally
    Fond.SetChildForm(FDest);
  end;
end;

function SaisieMouvementAlbum(const MvtID_Album, MvtID_Edition: TGUID; MvtPret: Boolean; const MvtID_Emprunteur: string): Boolean;
begin
  Result := False;
  if Mode_en_cours <> mdConsult then Exit;

  with TFrmSaisie_EmpruntAlbum.Create(Fond) do try
    pret.Checked := MvtPret;
    ID_Album := MvtID_Album;
    ID_Edition := MvtID_Edition;
    ID_Emprunteur := StringToGUID(MvtID_Emprunteur);
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

function SaisieMouvementEmprunteur(const MvtID_Emprunteur: TGUID; const MvtID_Album: TEditionsEmpruntees): Boolean;
var
  i: Integer;
begin
  Result := False;
  if Mode_en_cours <> mdConsult then Exit;
  with TFrmSaisie_EmpruntEmprunteur.Create(Fond) do try
    ID_Emprunteur := MvtID_Emprunteur;
    for i := Low(MvtID_Album) to High(MvtID_Album) do
      AjouteAlbum(MvtID_Album[i][0], MvtID_Album[i][1]);
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure _MAJFenetre(FormClass: TFormClass);
var
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  Fond.SetChildForm(FormClass.Create(Fond));
  Historique.SetDescription(Fond.FCurrentForm.Caption);
end;

procedure MAJPrevisionsAchats;
begin
  _MAJFenetre(TfrmPrevisionsAchats);
end;

procedure MAJPrevisionsSorties;
begin
  _MAJFenetre(TfrmPrevisionsSorties);
end;

procedure MAJSeriesIncompletes;
begin
  _MAJFenetre(TfrmSeriesIncompletes);
end;

procedure MAJStock;
begin
  _MAJFenetre(TFrmStock);
end;

procedure MAJRecherche(const Reference: TGUID; TypeSimple: Integer; Stream: TMemoryStream);
var
  FDest: TFrmRecherche;
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  if not (Mode_en_cours in [mdEdit, mdConsult]) then Exit;
  FDest := TFrmRecherche.Create(Fond);
  with FDest do begin
    // le TTreeView est une merde! si on fait la cr�ation de noeud avec Data
    // avant l'assignation du Handle, les Data risques de partir dans la nature

    // TreeView1.HandleNeeded n'est d'aucune utilit�!!!!

    // du coup, obligation de faire le SetChildForm AVANT de recr�er les crit�res de recherche

    // conclusion:
    // TODO: virer le TTreeView!!!!!!!

    Fond.SetChildForm(FDest);

    if Assigned(Stream) and (Stream.Size > 0) then begin
      LoadRechFromStream(Stream);
      btnRecherche.Click;
    end
    else if LightComboCheck1.ValidValue(TypeSimple) then begin
      LightComboCheck1.Value := TypeSimple;
      VTPersonnes.CurrentValue := Reference;
      SpeedButton1Click(nil);
    end;
  end;
  if Historique.CurrentConsultation = 0 then
    Historique.SetDescription('Accueil')
  else
    Historique.SetDescription(FDest.Caption);
end;

function ZoomCouverture(isParaBD: Boolean; const ID_Item, ID_Couverture: TGUID): Boolean;
var
  FDest: TFrmZoomCouverture;
begin
  FDest := TFrmZoomCouverture.Create(Fond);
  with FDest do try
    Result := LoadCouverture(isParaBD, ID_Item, ID_Couverture);
    Historique.SetDescription(FDest.Caption);
  finally
    Fond.SetChildForm(FDest);
  end;
end;

end.

