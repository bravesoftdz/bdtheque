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
procedure RIRegister_TObjectListOfEditionFull(CL: TPSRuntimeClassImporter);

procedure RIRegister_TAuteur(CL: TPSRuntimeClassImporter);
procedure RIRegister_TAlbumFull(CL: TPSRuntimeClassImporter; isUpdate: Boolean);
procedure RIRegister_TEditionFull(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerieFull(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEditeurFull(CL: TPSRuntimeClassImporter);

procedure RIRegister_TScriptChoix(CL: TPSRuntimeClassImporter);

procedure RIRegister_BdtkObjects(CL: TPSRuntimeClassImporter; isUpdate: Boolean);

implementation

uses
  Entities.Lite, Entities.Full, UMetadata, Commun, UScriptsFonctions,
  Entities.FactoriesFull, Entities.Types;

(* === run-time registration functions === *)

procedure TAlbumCompletEdition_R(Self: TAlbumFull; var T: TEditionFull);
begin
  if Self.Editions.Count = 0 then
    Self.Editions.Add(TFactoryEditionFull.getInstance);
  T := Self.Editions[0];
end;

procedure TAlbumCompletDefaultSearch_R(Self: TAlbumFull; var T: string);
begin
  T := Self.DefaultSearch;
end;

procedure TAlbumCompletSerie_R(Self: TAlbumFull; var T: TSerieFull);
begin
  T := Self.Serie;
end;

procedure TAlbumCompletUnivers_R(Self: TAlbumFull; var T: TObjectList<TUniversLite>);
begin
  T := Self.Univers;
end;

procedure TAlbumCompletNotes_R(Self: TAlbumFull; var T: string);
begin
  T := Self.Notes;
end;

procedure TAlbumCompletNotes_W(Self: TAlbumFull; const T: string);
begin
  Self.Notes := T;
end;

procedure TAlbumCompletSujet_R(Self: TAlbumFull; var T: string);
begin
  T := Self.Sujet;
end;

procedure TAlbumCompletSujet_W(Self: TAlbumFull; const T: string);
begin
  Self.Sujet := T;
end;

procedure TAlbumCompletColoristes_R(Self: TAlbumFull; var T: TObjectList<TAuteurAlbumLite>);
begin
  T := Self.Coloristes;
end;

procedure TAlbumCompletDessinateurs_R(Self: TAlbumFull; var T: TObjectList<TAuteurAlbumLite>);
begin
  T := Self.Dessinateurs;
end;

procedure TAlbumCompletScenaristes_R(Self: TAlbumFull; var T: TObjectList<TAuteurAlbumLite>);
begin
  T := Self.Scenaristes;
end;

procedure TAlbumCompletIntegrale_W(Self: TAlbumFull; const T: Boolean);
begin
  Self.Integrale := T;
end;

procedure TAlbumCompletIntegrale_R(Self: TAlbumFull; var T: Boolean);
begin
  T := Self.Integrale;
end;

procedure TAlbumCompletHorsSerie_W(Self: TAlbumFull; const T: Boolean);
begin
  Self.HorsSerie := T;
end;

procedure TAlbumCompletHorsSerie_R(Self: TAlbumFull; var T: Boolean);
begin
  T := Self.HorsSerie;
end;

procedure TAlbumCompletTitre_W(Self: TAlbumFull; const T: string);
begin
  Self.TitreAlbum := T;
end;

procedure TAlbumCompletTitre_R(Self: TAlbumFull; var T: string);
begin
  T := Self.TitreAlbum;
end;

procedure TAlbumCompletTomeFin_W(Self: TAlbumFull; const T: Integer);
begin
  Self.TomeFin := T;
end;

procedure TAlbumCompletTomeFin_R(Self: TAlbumFull; var T: Integer);
begin
  T := Self.TomeFin;
end;

procedure TAlbumCompletTomeDebut_W(Self: TAlbumFull; const T: Integer);
begin
  Self.TomeDebut := T;
end;

procedure TAlbumCompletTomeDebut_R(Self: TAlbumFull; var T: Integer);
begin
  T := Self.TomeDebut;
end;

procedure TAlbumCompletTome_W(Self: TAlbumFull; const T: Integer);
begin
  Self.Tome := T;
end;

procedure TAlbumCompletTome_R(Self: TAlbumFull; var T: Integer);
begin
  T := Self.Tome;
end;

procedure TAlbumCompletAnneeParution_W(Self: TAlbumFull; const T: Integer);
begin
  Self.AnneeParution := T;
end;

procedure TAlbumCompletAnneeParution_R(Self: TAlbumFull; var T: Integer);
begin
  T := Self.AnneeParution;
end;

procedure TAlbumCompletMoisParution_W(Self: TAlbumFull; const T: Integer);
begin
  Self.MoisParution := T;
end;

procedure TAlbumCompletMoisParution_R(Self: TAlbumFull; var T: Integer);
begin
  T := Self.MoisParution;
end;

procedure TObjectListOfEditionCompleteItems_W(Self: TObjectList<TEditionFull>; const T: TEditionFull; const t1: Integer);
begin
  Self.Items[t1] := T;
end;

procedure TObjectListOfEditionCompleteItems_R(Self: TObjectList<TEditionFull>; var T: TEditionFull; const t1: Integer);
begin
  T := Self.Items[t1];
end;

procedure TObjectListOfAuteurSerieItems_W(Self: TObjectList<TAuteurSerieLite>; const T: TAuteurSerieLite; const t1: Integer);
begin
  Self.Items[t1] := T;
end;

procedure TObjectListOfAuteurAlbumItems_W(Self: TObjectList<TAuteurAlbumLite>; const T: TAuteurAlbumLite; const t1: Integer);
begin
  Self.Items[t1] := T;
end;

procedure TObjectListOfAuteurSerieItems_R(Self: TObjectList<TAuteurSerieLite>; var T: TAuteurSerieLite; const t1: Integer);
begin
  T := Self.Items[t1];
end;

procedure TObjectListOfAuteurAlbumItems_R(Self: TObjectList<TAuteurAlbumLite>; var T: TAuteurAlbumLite; const t1: Integer);
begin
  T := Self.Items[t1];
end;

procedure TObjectListOfObjectCount_R(Self: TObjectList<TObject>; var T: Integer);
begin
  T := Self.Count;
end;

procedure TEditionCompleteNotes_R(Self: TEditionFull; var T: string);
begin
  T := Self.Notes;
end;

procedure TEditionCompleteNotes_W(Self: TEditionFull; const T: string);
begin
  Self.Notes := T;
end;

procedure TEditionCompleteDateAchat_W(Self: TEditionFull; const T: TDateTime);
begin
  Self.DateAchat := T;
end;

procedure TEditionCompleteDateAchat_R(Self: TEditionFull; var T: TDateTime);
begin
  T := Self.DateAchat;
end;

procedure TEditionCompleteNumeroPerso_W(Self: TEditionFull; const T: string);
begin
  Self.NumeroPerso := T;
end;

procedure TEditionCompleteNumeroPerso_R(Self: TEditionFull; var T: string);
begin
  T := Self.NumeroPerso;
end;

procedure TEditionCompleteISBN_W(Self: TEditionFull; const T: string);
begin
  Self.ISBN := T;
end;

procedure TEditionCompleteISBN_R(Self: TEditionFull; var T: string);
begin
  T := Self.ISBN;
end;

procedure TEditionCompleteGratuit_W(Self: TEditionFull; const T: Boolean);
begin
  Self.Gratuit := T;
end;

procedure TEditionCompleteGratuit_R(Self: TEditionFull; var T: Boolean);
begin
  T := Self.Gratuit;
end;

procedure TEditionCompleteOffert_W(Self: TEditionFull; const T: Boolean);
begin
  Self.Offert := T;
end;

procedure TEditionCompleteOffert_R(Self: TEditionFull; var T: Boolean);
begin
  T := Self.Offert;
end;

procedure TEditionCompletePrete_W(Self: TEditionFull; const T: Boolean);
begin
  Self.Prete := T;
end;

procedure TEditionCompletePrete_R(Self: TEditionFull; var T: Boolean);
begin
  T := Self.Prete;
end;

procedure TEditionCompleteStock_W(Self: TEditionFull; const T: Boolean);
begin
  Self.Stock := T;
end;

procedure TEditionCompleteStock_R(Self: TEditionFull; var T: Boolean);
begin
  T := Self.Stock;
end;

procedure TEditionCompleteDedicace_W(Self: TEditionFull; const T: Boolean);
begin
  Self.Dedicace := T;
end;

procedure TEditionCompleteDedicace_R(Self: TEditionFull; var T: Boolean);
begin
  T := Self.Dedicace;
end;

procedure TEditionCompleteVO_W(Self: TEditionFull; const T: Boolean);
begin
  Self.VO := T;
end;

procedure TEditionCompleteVO_R(Self: TEditionFull; var T: Boolean);
begin
  T := Self.VO;
end;

procedure TEditionCompleteCouleur_W(Self: TEditionFull; const T: Boolean);
begin
  Self.Couleur := T;
end;

procedure TEditionCompleteCouleur_R(Self: TEditionFull; var T: Boolean);
begin
  T := Self.Couleur;
end;

procedure TEditionCompletePrixCote_W(Self: TEditionFull; const T: Currency);
begin
  Self.PrixCote := T;
end;

procedure TEditionCompletePrixCote_R(Self: TEditionFull; var T: Currency);
begin
  T := Self.PrixCote;
end;

procedure TEditionCompletePrix_W(Self: TEditionFull; const T: Currency);
begin
  Self.Prix := T;
end;

procedure TEditionCompletePrix_R(Self: TEditionFull; var T: Currency);
begin
  T := Self.Prix;
end;

procedure TEditionCompleteAnneeCote_W(Self: TEditionFull; const T: Integer);
begin
  Self.AnneeCote := T;
end;

procedure TEditionCompleteAnneeCote_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.AnneeCote;
end;

procedure TEditionCompleteOrientation_W(Self: TEditionFull; const T: Integer);
begin
  Self.Orientation := ROption.Create(T, Self.Orientation.Caption);
end;

procedure TEditionCompleteOrientation_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.Orientation.Value;
end;

procedure TEditionCompleteFormatEdition_W(Self: TEditionFull; const T: Integer);
begin
  Self.FormatEdition := ROption.Create(T, Self.FormatEdition.Caption);
end;

procedure TEditionCompleteFormatEdition_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.FormatEdition.Value;
end;

procedure TEditionCompleteNombreDePages_W(Self: TEditionFull; const T: Integer);
begin
  Self.NombreDePages := T;
end;

procedure TEditionCompleteNombreDePages_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.NombreDePages;
end;

procedure TEditionCompleteReliure_W(Self: TEditionFull; const T: Integer);
begin
  Self.Reliure := ROption.Create(T, Self.Reliure.Caption);
end;

procedure TEditionCompleteReliure_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.Reliure.Value;
end;

procedure TEditionCompleteSensLecture_W(Self: TEditionFull; const T: Integer);
begin
  Self.SensLecture := ROption.Create(T, Self.SensLecture.Caption);
end;

procedure TEditionCompleteSensLecture_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.SensLecture.Value;
end;

procedure TEditionCompleteEtat_W(Self: TEditionFull; const T: Integer);
begin
  Self.Etat := ROption.Create(T, Self.Etat.Caption);
end;

procedure TEditionCompleteEtat_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.Etat.Value;
end;

procedure TEditionCompleteAnneeEdition_W(Self: TEditionFull; const T: Integer);
begin
  Self.AnneeEdition := T;
end;

procedure TEditionCompleteAnneeEdition_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.AnneeEdition;
end;

procedure TEditionCompleteTypeEdition_W(Self: TEditionFull; const T: Integer);
begin
  Self.TypeEdition := ROption.Create(T, Self.TypeEdition.Caption);
end;

procedure TEditionCompleteTypeEdition_R(Self: TEditionFull; var T: Integer);
begin
  T := Self.TypeEdition.Value;
end;

procedure TEditionCompleteCollection_W(Self: TEditionFull; const T: string);
begin
  Self.Collection.NomCollection := T;
end;

procedure TEditionCompleteCollection_R(Self: TEditionFull; var T: string);
begin
  T := Self.Collection.NomCollection;
end;

function TEditionCompleteCreate: TEditionFull;
begin
  Result := TFactoryEditionFull.getInstance;
end;

procedure TEditionCompleteEditeur_R(Self: TEditionFull; var T: TEditeurFull);
begin
  T := Self.Editeur;
end;

procedure TSerieCompleteCollection_W(Self: TSerieFull; const T: string);
begin
  Self.Collection.NomCollection := T;
end;

procedure TSerieCompleteCollection_R(Self: TSerieFull; var T: string);
begin
  T := Self.Collection.NomCollection;
end;

procedure TSerieCompleteEditeur_R(Self: TSerieFull; var T: TEditeurFull);
begin
  T := Self.Editeur;
end;

procedure TSerieCompleteSiteWeb_W(Self: TSerieFull; const T: string);
begin
  Self.SiteWeb := T;
end;

procedure TSerieCompleteSiteWeb_R(Self: TSerieFull; var T: string);
begin
  T := Self.SiteWeb;
end;

procedure TSerieCompleteNotes_R(Self: TSerieFull; var T: string);
begin
  T := Self.Notes;
end;

procedure TSerieCompleteNotes_W(Self: TSerieFull; const T: string);
begin
  Self.Notes := T;
end;

procedure TSerieCompleteSujet_R(Self: TSerieFull; var T: string);
begin
  T := Self.Sujet;
end;

procedure TSerieCompleteSujet_W(Self: TSerieFull; const T: string);
begin
  Self.Sujet := T;
end;

procedure TSerieCompleteGenres_R(Self: TSerieFull; var T: TStringList);
begin
  T := Self.Genres;
end;

procedure TSerieCompleteTerminee_W(Self: TSerieFull; const T: Integer);
begin
  Self.Terminee := RTriStateValue.FromInteger(T);
end;

procedure TSerieCompleteTerminee_R(Self: TSerieFull; var T: Integer);
begin
  T := Self.Terminee;
end;

procedure TSerieCompleteNbAlbums_W(Self: TSerieFull; const T: Integer);
begin
  Self.NbAlbums := T;
end;

procedure TSerieCompleteNbAlbums_R(Self: TSerieFull; var T: Integer);
begin
  T := Self.NbAlbums;
end;

procedure TSerieCompleteColoristes_R(Self: TSerieFull; var T: TObjectList<TAuteurSerieLite>);
begin
  T := Self.Coloristes;
end;

procedure TSerieCompleteDessinateurs_R(Self: TSerieFull; var T: TObjectList<TAuteurSerieLite>);
begin
  T := Self.Dessinateurs;
end;

procedure TSerieCompleteScenaristes_R(Self: TSerieFull; var T: TObjectList<TAuteurSerieLite>);
begin
  T := Self.Scenaristes;
end;

procedure TSerieCompleteUnivers_R(Self: TSerieFull; var T: TObjectList<TUniversLite>);
begin
  T := Self.Univers;
end;

procedure TSerieCompleteTitre_W(Self: TSerieFull; const T: string);
begin
  Self.TitreSerie := T;
end;

procedure TSerieCompleteTitre_R(Self: TSerieFull; var T: string);
begin
  T := Self.TitreSerie;
end;

procedure TEditeurCompletSiteWeb_W(Self: TEditeurFull; const T: string);
begin
  Self.SiteWeb := T;
end;

procedure TEditeurCompletSiteWeb_R(Self: TEditeurFull; var T: string);
begin
  T := Self.SiteWeb;
end;

procedure TEditeurCompletNomEditeur_W(Self: TEditeurFull; const T: string);
begin
  Self.NomEditeur := T;
end;

procedure TEditeurCompletNomEditeur_R(Self: TEditeurFull; var T: string);
begin
  T := Self.NomEditeur;
end;

procedure TAuteurNomAuteur_W(Self: TAuteurLite; const T: string);
begin
  Self.Personne.Nom := T;
end;

procedure TAuteurNomAuteur_R(Self: TAuteurLite; var T: string);
begin
  T := Self.Personne.Nom;
end;

procedure TAuteurMetier_W(Self: TAuteurSerieLite; const T: TMetierAuteur);
begin
  Self.Metier := T;
end;

procedure TAuteurMetier_R(Self: TAuteurSerieLite; var T: TMetierAuteur);
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
  with CL.Add2(TObjectList<TAuteurSerieLite>, 'TObjectListOfAuteurSerie') do
  begin
    RegisterMethod(@TObjectList<TAuteurSerieLite>.Add, 'Add');
    RegisterMethod(@TObjectList<TAuteurSerieLite>.Insert, 'Insert');
    RegisterPropertyHelper(@TObjectListOfAuteurSerieItems_R, @TObjectListOfAuteurSerieItems_W, 'Items');
  end;
  with CL.Add2(TObjectList<TAuteurAlbumLite>, 'TObjectListOfAuteurAlbum') do
  begin
    RegisterMethod(@TObjectList<TAuteurAlbumLite>.Add, 'Add');
    RegisterMethod(@TObjectList<TAuteurAlbumLite>.Insert, 'Insert');
    RegisterPropertyHelper(@TObjectListOfAuteurAlbumItems_R, @TObjectListOfAuteurAlbumItems_W, 'Items');
  end;
end;

procedure RIRegister_TObjectListOfEditionFull(CL: TPSRuntimeClassImporter);
begin
  with CL.Add2(TObjectList<TEditionFull>, 'TObjectListOfEditionFull') do
  begin
    RegisterMethod(@TObjectList<TEditionFull>.Add, 'Add');
    RegisterMethod(@TObjectList<TEditionFull>.Insert, 'Insert');
    RegisterPropertyHelper(@TObjectListOfEditionCompleteItems_R, @TObjectListOfEditionCompleteItems_W, 'Items');
  end;
end;

procedure Import(Album: TAlbumFull);
begin
  Album.ReadyToImport := True;
end;

procedure RIRegister_TAlbumFull(CL: TPSRuntimeClassImporter; isUpdate: Boolean);
begin
  with CL.Add(TAlbumFull) do
  begin
    RegisterPropertyHelper(@TAlbumCompletDefaultSearch_R, nil, 'DefaultSearch');

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
    RegisterPropertyHelper(@TAlbumCompletSujet_R, @TAlbumCompletSujet_W, 'Sujet');
    RegisterPropertyHelper(@TAlbumCompletNotes_R, @TAlbumCompletNotes_W, 'Notes');
    RegisterPropertyHelper(@TAlbumCompletEdition_R, nil, 'Edition');
    RegisterPropertyHelper(@TAlbumCompletUnivers_R, nil, 'Univers');

    RegisterMethod(@TAlbumFull.Clear, 'Clear');
    RegisterMethod(@Import, 'Import')
  end;
end;

procedure RIRegister_TSerieFull(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerieFull) do
  begin
    RegisterPropertyHelper(@TSerieCompleteTitre_R, @TSerieCompleteTitre_W, 'Titre');
    RegisterPropertyHelper(@TSerieCompleteTerminee_R, @TSerieCompleteTerminee_W, 'Terminee');
    RegisterPropertyHelper(@TSerieCompleteGenres_R, nil, 'Genres');
    RegisterPropertyHelper(@TSerieCompleteSujet_R, @TSerieCompleteSujet_W, 'Sujet');
    RegisterPropertyHelper(@TSerieCompleteNotes_R, @TSerieCompleteNotes_W, 'Notes');
    RegisterPropertyHelper(@TSerieCompleteEditeur_R, nil, 'Editeur');
    RegisterPropertyHelper(@TSerieCompleteCollection_R, @TSerieCompleteCollection_W, 'Collection');
    RegisterPropertyHelper(@TSerieCompleteSiteWeb_R, @TSerieCompleteSiteWeb_W, 'SiteWeb');
    RegisterPropertyHelper(@TSerieCompleteNbAlbums_R, @TSerieCompleteNbAlbums_W, 'NbAlbums');
    RegisterPropertyHelper(@TSerieCompleteScenaristes_R, nil, 'Scenaristes');
    RegisterPropertyHelper(@TSerieCompleteDessinateurs_R, nil, 'Dessinateurs');
    RegisterPropertyHelper(@TSerieCompleteColoristes_R, nil, 'Coloristes');
    RegisterPropertyHelper(@TSerieCompleteUnivers_R, nil, 'Univers');
  end;
end;

procedure RIRegister_TEditionFull(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditionFull) do
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
    // RegisterPropertyHelper(@TEditionCompleteDedicace_R, @TEditionCompleteDedicace_W, 'Dedicace');
    // RegisterPropertyHelper(@TEditionCompleteStock_R, @TEditionCompleteStock_W, 'Stock');
    // RegisterPropertyHelper(@TEditionCompletePrete_R, @TEditionCompletePrete_W, 'Prete');
    // RegisterPropertyHelper(@TEditionCompleteOffert_R, @TEditionCompleteOffert_W, 'Offert');
    RegisterPropertyHelper(@TEditionCompleteGratuit_R, @TEditionCompleteGratuit_W, 'Gratuit');
    RegisterPropertyHelper(@TEditionCompleteISBN_R, @TEditionCompleteISBN_W, 'ISBN');
    // RegisterPropertyHelper(@TEditionCompleteDateAchat_R, @TEditionCompleteDateAchat_W, 'DateAchat');
    // RegisterPropertyHelper(@TEditionCompleteNotes_R, @TEditionCompleteNotes_W, 'Notes');
    // RegisterPropertyHelper(@TEditionCompleteNumeroPerso_R, @TEditionCompleteNumeroPerso_W, 'NumeroPerso');
    // RegisterPropertyHelper(@TEditionCompleteCouvertures_R, nil, 'Couvertures');
    RegisterMethod(@AddImageFromURL, 'AddImageFromURL');
  end;
end;

procedure RIRegister_TEditeurFull(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditeurFull) do
  begin
    RegisterPropertyHelper(@TEditeurCompletNomEditeur_R, @TEditeurCompletNomEditeur_W, 'NomEditeur');
    RegisterPropertyHelper(@TEditeurCompletSiteWeb_R, @TEditeurCompletSiteWeb_W, 'SiteWeb');
  end;
end;

procedure RIRegister_TAuteur(CL: TPSRuntimeClassImporter);
begin
  with CL.Add2(TAuteurSerieLite, 'TAuteur') do
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
    RegisterMethod(@TScriptChoix.CategorieCount, 'CategorieCount');
    RegisterMethod(@TScriptChoix.ChoixCount, 'ChoixCount');
    RegisterMethod(@TScriptChoix.CategorieChoixCount, 'CategorieChoixCount');
    RegisterPropertyHelper(@TScriptChoixTitre_R, @TScriptChoixTitre_W, 'Titre');
  end;
end;

procedure RIRegister_BdtkObjects(CL: TPSRuntimeClassImporter; isUpdate: Boolean);
begin
  RIRegister_TStringList(CL);
  RIRegister_TObjectList(CL);

  RIRegister_TAuteur(CL);
  RIRegister_TObjectListOfAuteur(CL);
  RIRegister_TEditeurFull(CL);
  RIRegister_TSerieFull(CL);
  RIRegister_TEditionFull(CL);
  RIRegister_TAlbumFull(CL, isUpdate);

  RIRegister_TScriptChoix(CL);
end;

end.
