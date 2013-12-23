unit uPSC_BdtkObjects;

interface

uses
  SysUtils, Classes, uPSCompiler;

{ compile-time registration functions }
procedure SIRegister_TStringList(CL: TPSPascalCompiler);
procedure SIRegister_TObjectList(CL: TPSPascalCompiler);
procedure SIRegister_TObjectListOfUnivers(CL: TPSPascalCompiler);
procedure SIRegister_TObjectListOfAuteur(CL: TPSPascalCompiler);
procedure SIRegister_TObjectListOfEditionComplete(CL: TPSPascalCompiler);

procedure SIRegister_TUnivers(CL: TPSPascalCompiler);
procedure SIRegister_TAuteur(CL: TPSPascalCompiler);
procedure SIRegister_TAlbumComplet(CL: TPSPascalCompiler);
procedure SIRegister_TEditionComplete(CL: TPSPascalCompiler);
procedure SIRegister_TSerieComplete(CL: TPSPascalCompiler);
procedure SIRegister_TEditeurComplet(CL: TPSPascalCompiler);

procedure SIRegister_TScriptChoix(CL: TPSPascalCompiler);

procedure SIRegister_BdtkObjects(CL: TPSPascalCompiler);

implementation

uses
  Windows, Dialogs, Entities.Lite, Commun, CommonConst, UdmPrinc, DateUtils, Entities.Full;

(* === compile-time registration functions === *)

procedure SIRegister_TStringList(CL: TPSPascalCompiler);
begin
  with CL.FindClass('TStringList') do
  begin
    RegisterMethod('procedure Split(const Chaine: string; Sep: Char)');
  end;
end;

procedure SIRegister_TObjectList(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObject' { TObjectList<> } ), 'TObjectList') do
  begin
    RegisterMethod('procedure Delete(Index: Integer)');
    RegisterProperty('Count', 'Integer', iptR);
  end;
end;

procedure SIRegister_TObjectListOfUnivers(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObjectList' { TObjectList<> } ), 'TObjectListOfUnivers') do
  begin
    RegisterMethod('function Add(AObject: TUnivers): Integer');
    RegisterMethod('procedure Insert(Index: Integer; AObject: TUnivers)');
    RegisterProperty('Items', 'TUnivers Integer', iptRW);
    SetDefaultPropery('Items');
  end;
end;

procedure SIRegister_TObjectListOfAuteur(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObjectList' { TObjectList<> } ), 'TObjectListOfAuteur') do
  begin
    RegisterMethod('function Add(AObject: TAuteur): Integer');
    RegisterMethod('procedure Insert(Index: Integer; AObject: TAuteur)');
    RegisterProperty('Items', 'TAuteur Integer', iptRW);
    SetDefaultPropery('Items');
  end;
end;

procedure SIRegister_TObjectListOfEditionComplete(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObjectList' { TObjectList<> } ), 'TObjectListOfEditionComplete') do
  begin
    RegisterMethod('function Add(AObject: TEditionComplete): Integer');
    RegisterMethod('procedure Insert(Index: Integer; AObject: TEditionComplete)');
    RegisterProperty('Items', 'TEditionComplete Integer', iptRW);
    SetDefaultPropery('Items');
  end;
end;

procedure SIRegister_TAlbumComplet(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObject' { TObjetComplet } ), 'TAlbumComplet') do
  begin
    RegisterProperty('DefaultSearch', 'string', iptR);

    RegisterProperty('Titre', 'string', iptRW);
    RegisterProperty('Serie', 'TSerieComplete', iptR);
    RegisterProperty('MoisParution', 'Integer', iptRW);
    RegisterProperty('AnneeParution', 'Integer', iptRW);
    RegisterProperty('Tome', 'Integer', iptRW);
    RegisterProperty('TomeDebut', 'Integer', iptRW);
    RegisterProperty('TomeFin', 'Integer', iptRW);
    RegisterProperty('HorsSerie', 'Boolean', iptRW);
    RegisterProperty('Integrale', 'Boolean', iptRW);
    RegisterProperty('Scenaristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , iptR);
    RegisterProperty('Dessinateurs', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , iptR);
    RegisterProperty('Coloristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , iptR);
    RegisterProperty('Sujet', 'LongString', iptRW);
    RegisterProperty('Notes', 'LongString', iptRW);
    RegisterProperty('Edition', 'TEditionComplete', iptR);
    RegisterProperty('Univers', 'TObjectListOfUnivers' { TObjectList<TUnivers> } , iptR);

    RegisterMethod('procedure Clear;');
    RegisterMethod('procedure Import;');
  end;
end;

procedure SIRegister_TSerieComplete(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObject' { TObjetComplet } ), 'TSerieComplete') do
  begin
    RegisterProperty('Titre', 'string', iptRW);
    RegisterProperty('Terminee', 'Integer', iptRW);
    RegisterProperty('Genres', 'TStringList', iptR);
    RegisterProperty('Sujet', 'LongString', iptRW);
    RegisterProperty('Notes', 'LongString', iptRW);
    RegisterProperty('Editeur', 'TEditeurComplet', iptR);
    RegisterProperty('Collection', 'string', iptRW);
    RegisterProperty('SiteWeb', 'string', iptRW);
    RegisterProperty('NbAlbums', 'Integer', iptRW);
    RegisterProperty('Scenaristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , iptR);
    RegisterProperty('Dessinateurs', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , iptR);
    RegisterProperty('Coloristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , iptR);
    RegisterProperty('Univers', 'TObjectListOfUnivers' { TObjectList<TUnivers> } , iptR);
  end;
end;

procedure SIRegister_TEditionComplete(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObject' { TObjetComplet } ), 'TEditionComplete') do
  begin
    RegisterMethod('constructor Create');

    RegisterProperty('Editeur', 'TEditeurComplet', iptR);
    RegisterProperty('Collection', 'string', iptRW);
    RegisterProperty('TypeEdition', 'Integer' { ROption } , iptRW);
    RegisterProperty('AnneeEdition', 'Integer', iptRW);
    RegisterProperty('Etat', 'Integer' { ROption } , iptRW);
    RegisterProperty('Reliure', 'Integer' { ROption } , iptRW);
    RegisterProperty('NombreDePages', 'Integer', iptRW);
    RegisterProperty('FormatEdition', 'Integer' { ROption } , iptRW);
    RegisterProperty('Orientation', 'Integer' { ROption } , iptRW);
    RegisterProperty('AnneeCote', 'Integer', iptRW);
    RegisterProperty('SensLecture', 'Integer' { ROption } , iptRW);
    RegisterProperty('Prix', 'Currency', iptRW);
    RegisterProperty('PrixCote', 'Currency', iptRW);
    RegisterProperty('Couleur', 'Boolean', iptRW);
    RegisterProperty('VO', 'Boolean', iptRW);
    // RegisterProperty('Dedicace', 'Boolean', iptRW);
    // RegisterProperty('Stock', 'Boolean', iptRW);
    // RegisterProperty('Prete', 'Boolean', iptRW);
    // RegisterProperty('Offert', 'Boolean', iptRW);
    RegisterProperty('Gratuit', 'Boolean', iptRW);
    RegisterProperty('ISBN', 'string', iptRW);
    // RegisterProperty('DateAchat', 'TDateTime', iptRW);
    // RegisterProperty('Notes', 'LongString', iptRW);
    // RegisterProperty('NumeroPerso', 'string', iptRW);
    // RegisterProperty('Couvertures', 'TMyObjectList<TCouverture>', iptR);
    RegisterMethod('function AddImageFromURL(const URL: string; TypeImage: Integer): Integer;');
  end;
end;

procedure SIRegister_TEditeurComplet(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObject' { TObjetComplet } ), 'TEditeurComplet') do
  begin
    RegisterProperty('NomEditeur', 'string', iptRW);
    RegisterProperty('SiteWeb', 'string', iptRW);
  end;
end;

procedure SIRegister_TUnivers(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObject' { TBaseRec } ), 'TUnivers') do
  begin
    RegisterProperty('NomUnivers', 'string', iptRW);
  end;
end;

procedure SIRegister_TAuteur(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TMetierAuteur', '(maScenariste, maDessinateur, maColoriste)');
  with CL.AddClassN(CL.FindClass('TObject' { TBaseRec } ), 'TAuteur') do
  begin
    RegisterProperty('NomAuteur', 'string', iptRW);
    RegisterProperty('Metier', 'TMetierAuteur', iptRW);
  end;
end;

procedure SIRegister_TScriptChoix(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TObject'), 'TScriptChoix') do
  begin
    RegisterMethod('constructor Create');

    RegisterMethod('function Show: string;');
    RegisterMethod('procedure ResetList;');
    RegisterMethod('procedure AjoutChoix(const Categorie, Libelle, Commentaire, Data: string);');
    RegisterMethod('procedure AjoutChoixWithThumb(const Categorie, Libelle, Commentaire, Data, URL: string);');
    RegisterMethod('function CategorieCount: Integer;');
    RegisterMethod('function ChoixCount: Integer;');
    RegisterMethod('function CategorieChoixCount(const Name: string): Integer;');
    RegisterProperty('Titre', 'string', iptRW);
  end;
end;

procedure SIRegister_BdtkObjects(CL: TPSPascalCompiler);
begin
  CL.AddTypeCopyN('LongString', 'string');

  SIRegister_TStringList(CL);
  SIRegister_TObjectList(CL);

  // les univers sont expos�s en chaine
  SIRegister_TUnivers(CL);
  // la liste des univers est expos�e en stringlist
  SIRegister_TObjectListOfUnivers(CL);
  SIRegister_TAuteur(CL);
  SIRegister_TObjectListOfAuteur(CL);
  SIRegister_TEditeurComplet(CL);
  SIRegister_TSerieComplete(CL);
  SIRegister_TEditionComplete(CL);
  SIRegister_TAlbumComplet(CL);

  SIRegister_TScriptChoix(CL);
end;

end.
