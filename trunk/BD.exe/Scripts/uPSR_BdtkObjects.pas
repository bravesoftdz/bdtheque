unit uPSR_BdtkObjects;

{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface

uses
  SysUtils, Classes, uPSRuntime, Generics.Collections;

{ run-time registration functions }
procedure RIRegister_TStringList(CL: TPSRuntimeClassImporter);
procedure RIRegister_TObjectList(CL: TPSRuntimeClassImporter);
procedure RIRegister_TObjectListOfAuteur(CL: TPSRuntimeClassImporter);
procedure RIRegister_TObjectListOfEditionComplete(CL: TPSRuntimeClassImporter);

procedure RIRegister_TAuteur(CL: TPSRuntimeClassImporter);
procedure RIRegister_TAlbumComplet(CL: TPSRuntimeClassImporter; isUpdate: Boolean);
procedure RIRegister_TEditionComplete(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerieComplete(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEditeurComplet(CL: TPSRuntimeClassImporter);

procedure RIRegister_TScriptChoix(CL: TPSRuntimeClassImporter);

procedure RIRegister_BdtkObjects(CL: TPSRuntimeClassImporter; isUpdate: Boolean);

implementation

uses
  TypeRec, LoadComplet, LoadCompletImport, UMetadata, Commun, UScriptsFonctions;

(* === run-time registration functions === *)

procedure TAlbumCompletEdition_R(Self: TAlbumComplet; var T: TEditionComplete);
begin
  if Self.Editions.Editions.Count = 0 then
  begin
    Self.Editions.Editions.Add(TEditionComplete.Create(GUID_NULL));
    Self.Editions.Editions[0].New;
  end;
  T := Self.Editions.Editions[0];
end;

procedure TAlbumCompletSerie_R(Self: TAlbumComplet; var T: TSerieComplete);
begin
  T := Self.Serie;
end;

procedure TAlbumCompletNotes_R(Self: TAlbumComplet; var T: TStringList);
begin
  T := Self.Notes;
end;

procedure TAlbumCompletSujet_R(Self: TAlbumComplet; var T: TStringList);
begin
  T := Self.Sujet;
end;

procedure TAlbumCompletColoristes_R(Self: TAlbumComplet; var T: TObjectList<TAuteur>);
begin
  T := Self.Coloristes;
end;

procedure TAlbumCompletDessinateurs_R(Self: TAlbumComplet; var T: TObjectList<TAuteur>);
begin
  T := Self.Dessinateurs;
end;

procedure TAlbumCompletScenaristes_R(Self: TAlbumComplet; var T: TObjectList<TAuteur>);
begin
  T := Self.Scenaristes;
end;

procedure TAlbumCompletIntegrale_W(Self: TAlbumComplet; const T: Boolean);
begin
  Self.Integrale := T;
end;

procedure TAlbumCompletIntegrale_R(Self: TAlbumComplet; var T: Boolean);
begin
  T := Self.Integrale;
end;

procedure TAlbumCompletHorsSerie_W(Self: TAlbumComplet; const T: Boolean);
begin
  Self.HorsSerie := T;
end;

procedure TAlbumCompletHorsSerie_R(Self: TAlbumComplet; var T: Boolean);
begin
  T := Self.HorsSerie;
end;

procedure TAlbumCompletTitre_W(Self: TAlbumComplet; const T: string);
begin
  Self.Titre := T;
end;

procedure TAlbumCompletTitre_R(Self: TAlbumComplet; var T: string);
begin
  T := Self.Titre;
end;

procedure TAlbumCompletTomeFin_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.TomeFin := T;
end;

procedure TAlbumCompletTomeFin_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.TomeFin;
end;

procedure TAlbumCompletTomeDebut_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.TomeDebut := T;
end;

procedure TAlbumCompletTomeDebut_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.TomeDebut;
end;

procedure TAlbumCompletTome_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.Tome := T;
end;

procedure TAlbumCompletTome_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.Tome;
end;

procedure TAlbumCompletAnneeParution_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.AnneeParution := T;
end;

procedure TAlbumCompletAnneeParution_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.AnneeParution;
end;

procedure TAlbumCompletMoisParution_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.MoisParution := T;
end;

procedure TAlbumCompletMoisParution_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.MoisParution;
end;

procedure TObjectListOfEditionCompleteItems_W(Self: TObjectList<TEditionComplete>; const T: TEditionComplete; const t1: Integer);
begin
  Self.Items[t1] := T;
end;

procedure TObjectListOfEditionCompleteItems_R(Self: TObjectList<TEditionComplete>; var T: TEditionComplete; const t1: Integer);
begin
  T := Self.Items[t1];
end;

procedure TObjectListOfAuteurItems_W(Self: TObjectList<TAuteur>; const T: TAuteur; const t1: Integer);
begin
  Self.Items[t1] := T;
end;

procedure TObjectListOfObjectCount_R(Self: TObjectList<TAuteur>; var T: Integer);
begin
  T := Self.Count;
end;

procedure TObjectListOfAuteurItems_R(Self: TObjectList<TAuteur>; var T: TAuteur; const t1: Integer);
begin
  T := Self.Items[t1];
end;

procedure TEditionCompleteNotes_R(Self: TEditionComplete; var T: TStringList);
begin
  T := Self.Notes;
end;

procedure TEditionCompleteDateAchat_W(Self: TEditionComplete; const T: TDateTime);
begin
  Self.DateAchat := T;
end;

procedure TEditionCompleteDateAchat_R(Self: TEditionComplete; var T: TDateTime);
begin
  T := Self.DateAchat;
end;

procedure TEditionCompleteNumeroPerso_W(Self: TEditionComplete; const T: string);
begin
  Self.NumeroPerso := T;
end;

procedure TEditionCompleteNumeroPerso_R(Self: TEditionComplete; var T: string);
begin
  T := Self.NumeroPerso;
end;

procedure TEditionCompleteISBN_W(Self: TEditionComplete; const T: string);
begin
  Self.ISBN := T;
end;

procedure TEditionCompleteISBN_R(Self: TEditionComplete; var T: string);
begin
  T := Self.ISBN;
end;

procedure TEditionCompleteGratuit_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Gratuit := T;
end;

procedure TEditionCompleteGratuit_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Gratuit;
end;

procedure TEditionCompleteOffert_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Offert := T;
end;

procedure TEditionCompleteOffert_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Offert;
end;

procedure TEditionCompletePrete_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Prete := T;
end;

procedure TEditionCompletePrete_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Prete;
end;

procedure TEditionCompleteStock_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Stock := T;
end;

procedure TEditionCompleteStock_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Stock;
end;

procedure TEditionCompleteDedicace_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Dedicace := T;
end;

procedure TEditionCompleteDedicace_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Dedicace;
end;

procedure TEditionCompleteVO_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.VO := T;
end;

procedure TEditionCompleteVO_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.VO;
end;

procedure TEditionCompleteCouleur_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Couleur := T;
end;

procedure TEditionCompleteCouleur_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Couleur;
end;

procedure TEditionCompletePrixCote_W(Self: TEditionComplete; const T: Currency);
begin
  Self.PrixCote := T;
end;

procedure TEditionCompletePrixCote_R(Self: TEditionComplete; var T: Currency);
begin
  T := Self.PrixCote;
end;

procedure TEditionCompletePrix_W(Self: TEditionComplete; const T: Currency);
begin
  Self.Prix := T;
end;

procedure TEditionCompletePrix_R(Self: TEditionComplete; var T: Currency);
begin
  T := Self.Prix;
end;

procedure TEditionCompleteAnneeCote_W(Self: TEditionComplete; const T: Integer);
begin
  Self.AnneeCote := T;
end;

procedure TEditionCompleteAnneeCote_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.AnneeCote;
end;

procedure TEditionCompleteOrientation_W(Self: TEditionComplete; const T: Integer);
begin
  Self.Orientation := MakeOption(T, Self.Orientation.Caption);
end;

procedure TEditionCompleteOrientation_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.Orientation.Value;
end;

procedure TEditionCompleteFormatEdition_W(Self: TEditionComplete; const T: Integer);
begin
  Self.FormatEdition := MakeOption(T, Self.FormatEdition.Caption);
end;

procedure TEditionCompleteFormatEdition_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.FormatEdition.Value;
end;

procedure TEditionCompleteNombreDePages_W(Self: TEditionComplete; const T: Integer);
begin
  Self.NombreDePages := T;
end;

procedure TEditionCompleteNombreDePages_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.NombreDePages;
end;

procedure TEditionCompleteReliure_W(Self: TEditionComplete; const T: Integer);
begin
  Self.Reliure := MakeOption(T, Self.Reliure.Caption);
end;

procedure TEditionCompleteReliure_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.Reliure.Value;
end;

procedure TEditionCompleteSensLecture_W(Self: TEditionComplete; const T: Integer);
begin
  Self.SensLecture := MakeOption(T, Self.SensLecture.Caption);
end;

procedure TEditionCompleteSensLecture_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.SensLecture.Value;
end;

procedure TEditionCompleteEtat_W(Self: TEditionComplete; const T: Integer);
begin
  Self.Etat := MakeOption(T, Self.Etat.Caption);
end;

procedure TEditionCompleteEtat_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.Etat.Value;
end;

procedure TEditionCompleteAnneeEdition_W(Self: TEditionComplete; const T: Integer);
begin
  Self.AnneeEdition := T;
end;

procedure TEditionCompleteAnneeEdition_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.AnneeEdition;
end;

procedure TEditionCompleteTypeEdition_W(Self: TEditionComplete; const T: Integer);
begin
  Self.TypeEdition := MakeOption(T, Self.TypeEdition.Caption);
end;

procedure TEditionCompleteTypeEdition_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.TypeEdition.Value;
end;

procedure TEditionCompleteCollection_W(Self: TEditionComplete; const T: string);
begin
  Self.Collection.NomCollection := T;
end;

procedure TEditionCompleteCollection_R(Self: TEditionComplete; var T: string);
begin
  T := Self.Collection.NomCollection;
end;

function TEditionCompleteCreate: TEditionComplete;
begin
  Result := TEditionComplete.Create(GUID_NULL);
end;

procedure TEditionCompleteEditeur_R(Self: TEditionComplete; var T: TEditeurComplet);
begin
  T := Self.Editeur;
end;

procedure TSerieCompleteCollection_W(Self: TSerieComplete; const T: string);
begin
  Self.Collection.NomCollection := T;
end;

procedure TSerieCompleteCollection_R(Self: TSerieComplete; var T: string);
begin
  T := Self.Collection.NomCollection;
end;

procedure TSerieCompleteEditeur_R(Self: TSerieComplete; var T: TEditeurComplet);
begin
  T := Self.Editeur;
end;

procedure TSerieCompleteSiteWeb_W(Self: TSerieComplete; const T: string);
begin
  Self.SiteWeb := T;
end;

procedure TSerieCompleteSiteWeb_R(Self: TSerieComplete; var T: string);
begin
  T := Self.SiteWeb;
end;

procedure TSerieCompleteNotes_R(Self: TSerieComplete; var T: TStringList);
begin
  T := Self.Notes;
end;

procedure TSerieCompleteSujet_R(Self: TSerieComplete; var T: TStringList);
begin
  T := Self.Sujet;
end;

procedure TSerieCompleteGenres_R(Self: TSerieComplete; var T: TStringList);
begin
  T := Self.Genres;
end;

procedure TSerieCompleteTerminee_W(Self: TSerieComplete; const T: Integer);
begin
  Self.Terminee := T;
end;

procedure TSerieCompleteTerminee_R(Self: TSerieComplete; var T: Integer);
begin
  T := Self.Terminee;
end;

procedure TSerieCompleteNbAlbums_W(Self: TSerieComplete; const T: Integer);
begin
  Self.NbAlbums := T;
end;

procedure TSerieCompleteNbAlbums_R(Self: TSerieComplete; var T: Integer);
begin
  T := Self.NbAlbums;
end;

procedure TSerieCompleteColoristes_R(Self: TSerieComplete; var T: TObjectList<TAuteur>);
begin
  T := Self.Coloristes;
end;

procedure TSerieCompleteDessinateurs_R(Self: TSerieComplete; var T: TObjectList<TAuteur>);
begin
  T := Self.Dessinateurs;
end;

procedure TSerieCompleteScenaristes_R(Self: TSerieComplete; var T: TObjectList<TAuteur>);
begin
  T := Self.Scenaristes;
end;

procedure TSerieCompleteTitre_W(Self: TSerieComplete; const T: string);
begin
  Self.Titre := T;
end;

procedure TSerieCompleteTitre_R(Self: TSerieComplete; var T: string);
begin
  T := Self.Titre;
end;

procedure TEditeurCompletSiteWeb_W(Self: TEditeurComplet; const T: string);
begin
  Self.SiteWeb := T;
end;

procedure TEditeurCompletSiteWeb_R(Self: TEditeurComplet; var T: string);
begin
  T := Self.SiteWeb;
end;

procedure TEditeurCompletNomEditeur_W(Self: TEditeurComplet; const T: string);
begin
  Self.NomEditeur := T;
end;

procedure TEditeurCompletNomEditeur_R(Self: TEditeurComplet; var T: string);
begin
  T := Self.NomEditeur;
end;

procedure TAuteurNomAuteur_W(Self: TAuteur; const T: string);
begin
  Self.Personne.Nom := T;
end;

procedure TAuteurNomAuteur_R(Self: TAuteur; var T: string);
begin
  T := Self.Personne.Nom;
end;

procedure TAuteurMetier_W(Self: TAuteur; const T: TMetierAuteur);
begin
  Self.Metier := T;
end;

procedure TAuteurMetier_R(Self: TAuteur; var T: TMetierAuteur);
begin
  T := Self.Metier;
end;

procedure TScriptChoixTitre_W(Self: TScriptChoix; const T: string);
begin
  Self.Titre := T;
end;

procedure TScriptChoixTitre_R(Self: TScriptChoix; var T: string);
begin
  T := Self.Titre;
end;

procedure RIRegister_TStringList(CL: TPSRuntimeClassImporter);
begin
  with CL.FindClass('TStringList') do
  begin
    RegisterMethod(@Split, 'Split');
  end;
end;

procedure RIRegister_TObjectList(CL: TPSRuntimeClassImporter);
begin
  with CL.Add2(TObjectList<TObject>, 'TObjectList') do
  begin
    RegisterMethod(@TObjectList<TObject>.Delete, 'Delete');
    RegisterPropertyHelper(@TObjectListOfObjectCount_R, nil, 'Count');
  end;
end;

procedure RIRegister_TObjectListOfAuteur(CL: TPSRuntimeClassImporter);
begin
  with CL.Add2(TObjectList<TAuteur>, 'TObjectListOfAuteur') do
  begin
    RegisterMethod(@TObjectList<TAuteur>.Add, 'Add');
    RegisterMethod(@TObjectList<TAuteur>.Insert, 'Insert');
    RegisterPropertyHelper(@TObjectListOfAuteurItems_R, @TObjectListOfAuteurItems_W, 'Items');
  end;
end;

procedure RIRegister_TObjectListOfEditionComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add2(TObjectList<TEditionComplete>, 'TObjectListOfEditionComplete') do
  begin
    RegisterMethod(@TObjectList<TEditionComplete>.Add, 'Add');
    RegisterMethod(@TObjectList<TEditionComplete>.Insert, 'Insert');
    RegisterPropertyHelper(@TObjectListOfEditionCompleteItems_R, @TObjectListOfEditionCompleteItems_W, 'Items');
  end;
end;

procedure RIRegister_TAlbumComplet(CL: TPSRuntimeClassImporter; isUpdate: Boolean);
begin
  with CL.Add(TAlbumComplet) do
  begin
    RegisterPropertyHelper(@TAlbumCompletTitre_R, @TAlbumCompletTitre_W, 'Titre');
    RegisterPropertyHelper(@TAlbumCompletSerie_R, nil, 'Serie');
    RegisterPropertyHelper(@TAlbumCompletMoisParution_R, @TAlbumCompletMoisParution_W, 'MoisParution');
    RegisterPropertyHelper(@TAlbumCompletAnneeParution_R, @TAlbumCompletAnneeParution_W, 'AnneeParution');
    RegisterPropertyHelper(@TAlbumCompletTome_R, @TAlbumCompletTome_W, 'Tome');
    RegisterPropertyHelper(@TAlbumCompletTomeDebut_R, @TAlbumCompletTomeDebut_W, 'TomeDebut');
    RegisterPropertyHelper(@TAlbumCompletTomeFin_R, @TAlbumCompletTomeFin_W, 'TomeFin');
    RegisterPropertyHelper(@TAlbumCompletHorsSerie_R, @TAlbumCompletHorsSerie_W, 'HorsSerie');
    RegisterPropertyHelper(@TAlbumCompletIntegrale_R, @TAlbumCompletIntegrale_W, 'Integrale');
    RegisterPropertyHelper(@TAlbumCompletScenaristes_R, nil, 'Scenaristes');
    RegisterPropertyHelper(@TAlbumCompletDessinateurs_R, nil, 'Dessinateurs');
    RegisterPropertyHelper(@TAlbumCompletColoristes_R, nil, 'Coloristes');
    RegisterPropertyHelper(@TAlbumCompletSujet_R, nil, 'Sujet');
    RegisterPropertyHelper(@TAlbumCompletNotes_R, nil, 'Notes');
    RegisterPropertyHelper(@TAlbumCompletEdition_R, nil, 'Edition');

    RegisterMethod(@TAlbumComplet.Clear, 'Clear');
    if isUpdate then
      RegisterMethod(@ImportUpdate, 'Import')
    else
      RegisterMethod(@ImportNew, 'Import');
  end;
end;

procedure RIRegister_TSerieComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerieComplete) do
  begin
    RegisterPropertyHelper(@TSerieCompleteTitre_R, @TSerieCompleteTitre_W, 'Titre');
    RegisterPropertyHelper(@TSerieCompleteTerminee_R, @TSerieCompleteTerminee_W, 'Terminee');
    RegisterPropertyHelper(@TSerieCompleteGenres_R, nil, 'Genres');
    RegisterPropertyHelper(@TSerieCompleteSujet_R, nil, 'Sujet');
    RegisterPropertyHelper(@TSerieCompleteNotes_R, nil, 'Notes');
    RegisterPropertyHelper(@TSerieCompleteEditeur_R, nil, 'Editeur');
    RegisterPropertyHelper(@TSerieCompleteCollection_R, @TSerieCompleteCollection_W, 'Collection');
    RegisterPropertyHelper(@TSerieCompleteSiteWeb_R, @TSerieCompleteSiteWeb_W, 'SiteWeb');
    RegisterPropertyHelper(@TSerieCompleteNbAlbums_R, @TSerieCompleteNbAlbums_W, 'NbAlbums');
    RegisterPropertyHelper(@TSerieCompleteScenaristes_R, nil, 'Scenaristes');
    RegisterPropertyHelper(@TSerieCompleteDessinateurs_R, nil, 'Dessinateurs');
    RegisterPropertyHelper(@TSerieCompleteColoristes_R, nil, 'Coloristes');
  end;
end;

procedure RIRegister_TEditionComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditionComplete) do
  begin
    RegisterConstructor(@TEditionCompleteCreate, 'Create');
    RegisterPropertyHelper(@TEditionCompleteEditeur_R, nil, 'Editeur');
    RegisterPropertyHelper(@TEditionCompleteCollection_R, @TEditionCompleteCollection_W, 'Collection');
    RegisterPropertyHelper(@TEditionCompleteTypeEdition_R, @TEditionCompleteTypeEdition_W, 'TypeEdition');
    RegisterPropertyHelper(@TEditionCompleteAnneeEdition_R, @TEditionCompleteAnneeEdition_W, 'AnneeEdition');
    RegisterPropertyHelper(@TEditionCompleteEtat_R, @TEditionCompleteEtat_W, 'Etat');
    RegisterPropertyHelper(@TEditionCompleteReliure_R, @TEditionCompleteReliure_W, 'Reliure');
    RegisterPropertyHelper(@TEditionCompleteNombreDePages_R, @TEditionCompleteNombreDePages_W, 'NombreDePages');
    RegisterPropertyHelper(@TEditionCompleteFormatEdition_R, @TEditionCompleteFormatEdition_W, 'FormatEdition');
    RegisterPropertyHelper(@TEditionCompleteOrientation_R, @TEditionCompleteOrientation_W, 'Orientation');
    RegisterPropertyHelper(@TEditionCompleteAnneeCote_R, @TEditionCompleteAnneeCote_W, 'AnneeCote');
    RegisterPropertyHelper(@TEditionCompleteSensLecture_R, @TEditionCompleteSensLecture_W, 'SensLecture');
    RegisterPropertyHelper(@TEditionCompletePrix_R, @TEditionCompletePrix_W, 'Prix');
    RegisterPropertyHelper(@TEditionCompletePrixCote_R, @TEditionCompletePrixCote_W, 'PrixCote');
    RegisterPropertyHelper(@TEditionCompleteCouleur_R, @TEditionCompleteCouleur_W, 'Couleur');
    RegisterPropertyHelper(@TEditionCompleteVO_R, @TEditionCompleteVO_W, 'VO');
    //    RegisterPropertyHelper(@TEditionCompleteDedicace_R, @TEditionCompleteDedicace_W, 'Dedicace');
    //    RegisterPropertyHelper(@TEditionCompleteStock_R, @TEditionCompleteStock_W, 'Stock');
    //    RegisterPropertyHelper(@TEditionCompletePrete_R, @TEditionCompletePrete_W, 'Prete');
    //    RegisterPropertyHelper(@TEditionCompleteOffert_R, @TEditionCompleteOffert_W, 'Offert');
    RegisterPropertyHelper(@TEditionCompleteGratuit_R, @TEditionCompleteGratuit_W, 'Gratuit');
    RegisterPropertyHelper(@TEditionCompleteISBN_R, @TEditionCompleteISBN_W, 'ISBN');
    //    RegisterPropertyHelper(@TEditionCompleteDateAchat_R, @TEditionCompleteDateAchat_W, 'DateAchat');
    //    RegisterPropertyHelper(@TEditionCompleteNotes_R, nil, 'Notes');
    //    RegisterPropertyHelper(@TEditionCompleteNumeroPerso_R, @TEditionCompleteNumeroPerso_W, 'NumeroPerso');
    //    RegisterPropertyHelper(@TEditionCompleteCouvertures_R, nil, 'Couvertures');
    RegisterMethod(@AddImageFromURL, 'AddImageFromURL');
  end;
end;

procedure RIRegister_TEditeurComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditeurComplet) do
  begin
    RegisterPropertyHelper(@TEditeurCompletNomEditeur_R, @TEditeurCompletNomEditeur_W, 'NomEditeur');
    RegisterPropertyHelper(@TEditeurCompletSiteWeb_R, @TEditeurCompletSiteWeb_W, 'SiteWeb');
  end;
end;

procedure RIRegister_TAuteur(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TAuteur) do
  begin
    RegisterPropertyHelper(@TAuteurNomAuteur_R, @TAuteurNomAuteur_W, 'NomAuteur');
    RegisterPropertyHelper(@TAuteurMetier_R, @TAuteurMetier_W, 'Metier');
  end;
end;

procedure RIRegister_TScriptChoix(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TScriptChoix) do
  begin
    RegisterConstructor(@TScriptChoix.Create, 'Create');

    RegisterMethod(@TScriptChoix.Show, 'Show');
    RegisterMethod(@TScriptChoix.ResetList, 'ResetList');
    RegisterMethod(@TScriptChoix.AjoutChoix, 'AjoutChoix');
    RegisterMethod(@TScriptChoix.AjoutChoixWithThumb, 'AjoutChoixWithThumb');
    RegisterPropertyHelper(@TScriptChoixTitre_R, @TScriptChoixTitre_W, 'Titre');
  end;
end;

procedure RIRegister_BdtkObjects(CL: TPSRuntimeClassImporter; isUpdate: Boolean);
begin
  RIRegister_TStringList(CL);
  RIRegister_TObjectList(CL);

  RIRegister_TAuteur(CL);
  RIRegister_TObjectListOfAuteur(CL);
  RIRegister_TEditeurComplet(CL);
  RIRegister_TSerieComplete(CL);
  RIRegister_TEditionComplete(CL);
  RIRegister_TAlbumComplet(CL, isUpdate);

  RIRegister_TScriptChoix(CL);
end;

end.
