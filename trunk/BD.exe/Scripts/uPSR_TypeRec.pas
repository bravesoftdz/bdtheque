unit uPSR_TypeRec;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface

uses
  SysUtils, Classes, uPSComponent, uPSRuntime, uPSCompiler;

{ run-time registration functions }
procedure RIRegister_TGenre(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEdition(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerie(CL: TPSRuntimeClassImporter);
procedure RIRegister_TCollection(CL: TPSRuntimeClassImporter);
procedure RIRegister_TAlbum(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEditeur(CL: TPSRuntimeClassImporter);
procedure RIRegister_TAuteur(CL: TPSRuntimeClassImporter);
procedure RIRegister_TPersonnage(CL: TPSRuntimeClassImporter);
procedure RIRegister_TCouverture(CL: TPSRuntimeClassImporter);
procedure RIRegister_TBasePointeur(CL: TPSRuntimeClassImporter);
procedure RIRegister_TypeRec(CL: TPSRuntimeClassImporter);

implementation

uses
  Windows, DB, ComCtrls, JvUIB, StdCtrls, Commun, TypeRec;

(* === run-time registration functions === *)

procedure TGenreQuantite_W(Self: TGenre; const T: Integer);
begin
  Self.Quantite := T;
end;

procedure TGenreQuantite_R(Self: TGenre; var T: Integer);
begin
  T := Self.Quantite;
end;

procedure TGenreGenre_W(Self: TGenre; const T: string);
begin
  Self.Genre := T;
end;

procedure TGenreGenre_R(Self: TGenre; var T: string);
begin
  T := Self.Genre;
end;

procedure TEditionCollection_W(Self: TEdition; const T: TCollection);
begin
  Self.Collection := T;
end;

procedure TEditionCollection_R(Self: TEdition; var T: TCollection);
begin
  T := Self.Collection;
end;

procedure TEditionEditeur_W(Self: TEdition; const T: TEditeur);
begin
  Self.Editeur := T;
end;

procedure TEditionEditeur_R(Self: TEdition; var T: TEditeur);
begin
  T := Self.Editeur;
end;

procedure TEditionISBN_W(Self: TEdition; const T: string);
begin
  Self.ISBN := T;
end;

procedure TEditionISBN_R(Self: TEdition; var T: string);
begin
  T := Self.ISBN;
end;

procedure TEditionAnneeEdition_W(Self: TEdition; const T: Integer);
begin
  Self.AnneeEdition := T;
end;

procedure TEditionAnneeEdition_R(Self: TEdition; var T: Integer);
begin
  T := Self.AnneeEdition;
end;

procedure TSerieCollection_W(Self: TSerie; const T: TCollection);
begin
  Self.Collection := T;
end;

procedure TSerieCollection_R(Self: TSerie; var T: TCollection);
begin
  T := Self.Collection;
end;

procedure TSerieEditeur_W(Self: TSerie; const T: TEditeur);
begin
  Self.Editeur := T;
end;

procedure TSerieEditeur_R(Self: TSerie; var T: TEditeur);
begin
  T := Self.Editeur;
end;

procedure TSerieTitreSerie_W(Self: TSerie; const T: string);
begin
  Self.TitreSerie := T;
end;

procedure TSerieTitreSerie_R(Self: TSerie; var T: string);
begin
  T := Self.TitreSerie;
end;

procedure TCollectionEditeur_W(Self: TCollection; const T: TEditeur);
begin
  Self.Editeur := T;
end;

procedure TCollectionEditeur_R(Self: TCollection; var T: TEditeur);
begin
  T := Self.Editeur;
end;

procedure TCollectionNomCollection_W(Self: TCollection; const T: string);
begin
  Self.NomCollection := T;
end;

procedure TCollectionNomCollection_R(Self: TCollection; var T: string);
begin
  T := Self.NomCollection;
end;

procedure TAlbumAchat_W(Self: TAlbum; const T: Boolean);
begin
  Self.Achat := T;
end;

procedure TAlbumAchat_R(Self: TAlbum; var T: Boolean);
begin
  T := Self.Achat;
end;

procedure TAlbumHorsSerie_W(Self: TAlbum; const T: Boolean);
begin
  Self.HorsSerie := T;
end;

procedure TAlbumHorsSerie_R(Self: TAlbum; var T: Boolean);
begin
  T := Self.HorsSerie;
end;

procedure TAlbumIntegrale_W(Self: TAlbum; const T: Boolean);
begin
  Self.Integrale := T;
end;

procedure TAlbumIntegrale_R(Self: TAlbum; var T: Boolean);
begin
  T := Self.Integrale;
end;

procedure TAlbumStock_W(Self: TAlbum; const T: Boolean);
begin
  Self.Stock := T;
end;

procedure TAlbumStock_R(Self: TAlbum; var T: Boolean);
begin
  T := Self.Stock;
end;

procedure TAlbumMoisParution_W(Self: TAlbum; const T: Integer);
begin
  Self.MoisParution := T;
end;

procedure TAlbumMoisParution_R(Self: TAlbum; var T: Integer);
begin
  T := Self.MoisParution;
end;

procedure TAlbumAnneeParution_W(Self: TAlbum; const T: Integer);
begin
  Self.AnneeParution := T;
end;

procedure TAlbumAnneeParution_R(Self: TAlbum; var T: Integer);
begin
  T := Self.AnneeParution;
end;

procedure TAlbumEditeur_W(Self: TAlbum; const T: string);
begin
  Self.Editeur := T;
end;

procedure TAlbumEditeur_R(Self: TAlbum; var T: string);
begin
  T := Self.Editeur;
end;

procedure TAlbumSerie_W(Self: TAlbum; const T: string);
begin
  Self.Serie := T;
end;

procedure TAlbumSerie_R(Self: TAlbum; var T: string);
begin
  T := Self.Serie;
end;

procedure TAlbumTitre_W(Self: TAlbum; const T: string);
begin
  Self.Titre := T;
end;

procedure TAlbumTitre_R(Self: TAlbum; var T: string);
begin
  T := Self.Titre;
end;

procedure TAlbumTomeFin_W(Self: TAlbum; const T: Integer);
begin
  Self.TomeFin := T;
end;

procedure TAlbumTomeFin_R(Self: TAlbum; var T: Integer);
begin
  T := Self.TomeFin;
end;

procedure TAlbumTomeDebut_W(Self: TAlbum; const T: Integer);
begin
  Self.TomeDebut := T;
end;

procedure TAlbumTomeDebut_R(Self: TAlbum; var T: Integer);
begin
  T := Self.TomeDebut;
end;

procedure TAlbumTome_W(Self: TAlbum; const T: Integer);
begin
  Self.Tome := T;
end;

procedure TAlbumTome_R(Self: TAlbum; var T: Integer);
begin
  T := Self.Tome;
end;

procedure TEditeurNomEditeur_W(Self: TEditeur; const T: string);
begin
  Self.NomEditeur := T;
end;

procedure TEditeurNomEditeur_R(Self: TEditeur; var T: string);
begin
  T := Self.NomEditeur;
end;

procedure TAuteurMetier_W(Self: TAuteur; const T: Integer);
begin
  Self.Metier := T;
end;

procedure TAuteurMetier_R(Self: TAuteur; var T: Integer);
begin
  T := Self.Metier;
end;

procedure TAuteurPersonne_W(Self: TAuteur; const T: TPersonnage);
begin
  Self.Personne := T;
end;

procedure TAuteurPersonne_R(Self: TAuteur; var T: TPersonnage);
begin
  T := Self.Personne;
end;

procedure TPersonnageNom_W(Self: TPersonnage; const T: string);
begin
  Self.Nom := T;
end;

procedure TPersonnageNom_R(Self: TPersonnage; var T: string);
begin
  T := Self.Nom;
end;

procedure TCouverturesCategorie_W(Self: TCouverture; const T: string);
begin
  Self.sCategorie := T;
end;

procedure TCouverturesCategorie_R(Self: TCouverture; var T: string);
begin
  T := Self.sCategorie;
end;

procedure TCouvertureCategorie_W(Self: TCouverture; const T: Smallint);
begin
  Self.Categorie := T;
end;

procedure TCouvertureCategorie_R(Self: TCouverture; var T: Smallint);
begin
  T := Self.Categorie;
end;

procedure TCouvertureNewStockee_W(Self: TCouverture; const T: Boolean);
begin
  Self.NewStockee := T;
end;

procedure TCouvertureNewStockee_R(Self: TCouverture; var T: Boolean);
begin
  T := Self.NewStockee;
end;

procedure TCouvertureNewNom_W(Self: TCouverture; const T: string);
begin
  Self.NewNom := T;
end;

procedure TCouvertureNewNom_R(Self: TCouverture; var T: string);
begin
  T := Self.NewNom;
end;

procedure RIRegister_TGenre(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TGenre) do
  begin
    RegisterPropertyHelper(@TGenreGenre_R, @TGenreGenre_W, 'Genre');
    RegisterPropertyHelper(@TGenreQuantite_R, @TGenreQuantite_W, 'Quantite');
  end;
end;

procedure RIRegister_TEdition(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEdition) do
  begin
    RegisterPropertyHelper(@TEditionAnneeEdition_R, @TEditionAnneeEdition_W, 'AnneeEdition');
    RegisterPropertyHelper(@TEditionISBN_R, @TEditionISBN_W, 'ISBN');
    RegisterPropertyHelper(@TEditionEditeur_R, @TEditionEditeur_W, 'Editeur');
    RegisterPropertyHelper(@TEditionCollection_R, @TEditionCollection_W, 'Collection');
  end;
end;

procedure RIRegister_TSerie(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerie) do
  begin
    RegisterPropertyHelper(@TSerieTitreSerie_R, @TSerieTitreSerie_W, 'TitreSerie');
    RegisterPropertyHelper(@TSerieEditeur_R, @TSerieEditeur_W, 'Editeur');
    RegisterPropertyHelper(@TSerieCollection_R, @TSerieCollection_W, 'Collection');
  end;
end;

procedure RIRegister_TCollection(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TCollection) do
  begin
    RegisterPropertyHelper(@TCollectionNomCollection_R, @TCollectionNomCollection_W, 'NomCollection');
    RegisterPropertyHelper(@TCollectionEditeur_R, @TCollectionEditeur_W, 'Editeur');
  end;
end;

procedure RIRegister_TAlbum(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TAlbum) do
  begin
    RegisterPropertyHelper(@TAlbumTome_R, @TAlbumTome_W, 'Tome');
    RegisterPropertyHelper(@TAlbumTomeDebut_R, @TAlbumTomeDebut_W, 'TomeDebut');
    RegisterPropertyHelper(@TAlbumTomeFin_R, @TAlbumTomeFin_W, 'TomeFin');
    RegisterPropertyHelper(@TAlbumTitre_R, @TAlbumTitre_W, 'Titre');
    RegisterPropertyHelper(@TAlbumSerie_R, @TAlbumSerie_W, 'Serie');
    RegisterPropertyHelper(@TAlbumEditeur_R, @TAlbumEditeur_W, 'Editeur');
    RegisterPropertyHelper(@TAlbumAnneeParution_R, @TAlbumAnneeParution_W, 'AnneeParution');
    RegisterPropertyHelper(@TAlbumMoisParution_R, @TAlbumMoisParution_W, 'MoisParution');
    RegisterPropertyHelper(@TAlbumStock_R, @TAlbumStock_W, 'Stock');
    RegisterPropertyHelper(@TAlbumIntegrale_R, @TAlbumIntegrale_W, 'Integrale');
    RegisterPropertyHelper(@TAlbumHorsSerie_R, @TAlbumHorsSerie_W, 'HorsSerie');
    RegisterPropertyHelper(@TAlbumAchat_R, @TAlbumAchat_W, 'Achat');
  end;
end;

procedure RIRegister_TEditeur(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditeur) do
  begin
    RegisterPropertyHelper(@TEditeurNomEditeur_R, @TEditeurNomEditeur_W, 'NomEditeur');
  end;
end;

procedure RIRegister_TAuteur(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TAuteur) do
  begin
    RegisterPropertyHelper(@TAuteurPersonne_R, @TAuteurPersonne_W, 'Personne');
    RegisterPropertyHelper(@TAuteurMetier_R, @TAuteurMetier_W, 'Metier');
  end;
end;

procedure RIRegister_TPersonnage(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TPersonnage) do
  begin
    RegisterPropertyHelper(@TPersonnageNom_R, @TPersonnageNom_W, 'Nom');
  end;
end;

procedure RIRegister_TCouverture(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TCouverture) do
  begin
    RegisterPropertyHelper(@TCouvertureNewNom_R, @TCouvertureNewNom_W, 'NewNom');
    RegisterPropertyHelper(@TCouvertureNewStockee_R, @TCouvertureNewStockee_W, 'NewStockee');
    RegisterPropertyHelper(@TCouvertureCategorie_R, @TCouvertureCategorie_W, 'Categorie');
    RegisterPropertyHelper(@TCouverturesCategorie_R, @TCouverturesCategorie_W, 'sCategorie');
  end;
end;

procedure RIRegister_TBasePointeur(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TBasePointeur) do
  begin
  end;
end;

procedure RIRegister_TypeRec(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TBasePointeur(CL);
  RIRegister_TCouverture(CL);
  RIRegister_TPersonnage(CL);
  RIRegister_TAuteur(CL);
  RIRegister_TEditeur(CL);
  RIRegister_TAlbum(CL);
  RIRegister_TCollection(CL);
  RIRegister_TSerie(CL);
  RIRegister_TEdition(CL);
  RIRegister_TGenre(CL);
end;

end.
