unit UMAJ1_2_3_26;

interface

implementation

uses UIB, Updates;

procedure MAJ1_2_3_26(Query: TUIBScript);
begin
  Query.Script.Clear;

  Query.Script.Add('ALTER PROCEDURE ACHATALBUMS_BY_EDITEUR (');
  Query.Script.Add('    id_editeur char(38),');
  Query.Script.Add('    filtre varchar(125))');
  Query.Script.Add('returns (');
  Query.Script.Add('    id_album char(38),');
  Query.Script.Add('    titrealbum varchar(150),');
  Query.Script.Add('    tome smallint,');
  Query.Script.Add('    tomedebut smallint,');
  Query.Script.Add('    tomefin smallint,');
  Query.Script.Add('    horsserie smallint,');
  Query.Script.Add('    integrale smallint,');
  Query.Script.Add('    moisparution smallint,');
  Query.Script.Add('    anneeparution smallint,');
  Query.Script.Add('    id_serie char(38),');
  Query.Script.Add('    titreserie varchar(150),');
  Query.Script.Add('    achat smallint,');
  Query.Script.Add('    complet integer)');
  Query.Script.Add('as');
  Query.Script.Add('declare variable swhere varchar(133);');
  Query.Script.Add('BEGIN');
  Query.Script.Add('  swhere = '''';');
  Query.Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
  Query.Script.Add('  FOR execute statement');
  Query.Script.Add('     ''SELECT a.ID_ALBUM,');
  Query.Script.Add('             a.TITREALBUM,');
  Query.Script.Add('             a.TOME,');
  Query.Script.Add('             a.TOMEDEBUT,');
  Query.Script.Add('             a.TOMEFIN,');
  Query.Script.Add('             a.HORSSERIE,');
  Query.Script.Add('             a.INTEGRALE,');
  Query.Script.Add('             a.MOISPARUTION,');
  Query.Script.Add('             a.ANNEEPARUTION,');
  Query.Script.Add('             a.ID_SERIE,');
  Query.Script.Add('             s.TITRESERIE,');
  Query.Script.Add('             a.ACHAT,');
  Query.Script.Add('             a.COMPLET');
  Query.Script.Add('      from albums a LEFT JOIN series s on a.id_serie = s.ID_SERIE');
  Query.Script.Add('      WHERE coalesce(s.id_editeur, -1) = '''''' || :id_editeur || '''''' '' || swhere ||');
  Query.Script.Add('      ''ORDER BY COALESCE(UPPERTITREALBUM, UPPERTITRESERIE), UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
  Query.Script.Add('      INTO :ID_ALBUM,');
  Query.Script.Add('           :TITREALBUM,');
  Query.Script.Add('           :TOME,');
  Query.Script.Add('           :TOMEDEBUT,');
  Query.Script.Add('           :TOMEFIN,');
  Query.Script.Add('           :HORSSERIE,');
  Query.Script.Add('           :INTEGRALE,');
  Query.Script.Add('           :MOISPARUTION,');
  Query.Script.Add('           :ANNEEPARUTION,');
  Query.Script.Add('           :ID_SERIE,');
  Query.Script.Add('           :TITRESERIE,');
  Query.Script.Add('           :ACHAT,');
  Query.Script.Add('           :COMPLET');
  Query.Script.Add('  DO');
  Query.Script.Add('  BEGIN');
  Query.Script.Add('    SUSPEND;');
  Query.Script.Add('  END');
  Query.Script.Add('end;');

  Query.Script.Add('ALTER PROCEDURE ALBUMS_BY_ANNEE (');
  Query.Script.Add('    annee integer,');
  Query.Script.Add('    filtre varchar(125))');
  Query.Script.Add('returns (');
  Query.Script.Add('    id_album char(38),');
  Query.Script.Add('    titrealbum varchar(150),');
  Query.Script.Add('    tome smallint,');
  Query.Script.Add('    tomedebut smallint,');
  Query.Script.Add('    tomefin smallint,');
  Query.Script.Add('    horsserie smallint,');
  Query.Script.Add('    integrale smallint,');
  Query.Script.Add('    moisparution smallint,');
  Query.Script.Add('    anneeparution smallint,');
  Query.Script.Add('    id_serie char(38),');
  Query.Script.Add('    titreserie varchar(150),');
  Query.Script.Add('    achat smallint,');
  Query.Script.Add('    complet integer)');
  Query.Script.Add('as');
  Query.Script.Add('declare variable swhere varchar(200);');
  Query.Script.Add('BEGIN');
  Query.Script.Add('  if (:Annee = -1) then sWhere = ''ANNEEPARUTION is null '';');
  Query.Script.Add('                   else sWhere = ''ANNEEPARUTION = '' || :ANNEE || '' '';');
  Query.Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
  Query.Script.Add('  for execute statement');
  Query.Script.Add('      ''SELECT ID_ALBUM,');
  Query.Script.Add('             TITREALBUM,');
  Query.Script.Add('             TOME,');
  Query.Script.Add('             TOMEDEBUT,');
  Query.Script.Add('             TOMEFIN,');
  Query.Script.Add('             HORSSERIE,');
  Query.Script.Add('             INTEGRALE,');
  Query.Script.Add('             MOISPARUTION,');
  Query.Script.Add('             ANNEEPARUTION,');
  Query.Script.Add('             ID_SERIE,');
  Query.Script.Add('             TITRESERIE,');
  Query.Script.Add('             ACHAT,');
  Query.Script.Add('             COMPLET');
  Query.Script.Add('        FROM vw_liste_albums');
  Query.Script.Add('        WHERE '' || :sWHERE ||');
  Query.Script.Add('        ''ORDER BY COALESCE(UPPERTITREALBUM, UPPERTITRESERIE), UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
  Query.Script.Add('        INTO :ID_ALBUM,');
  Query.Script.Add('             :TITREALBUM,');
  Query.Script.Add('             :TOME,');
  Query.Script.Add('             :TOMEDEBUT,');
  Query.Script.Add('             :TOMEFIN,');
  Query.Script.Add('             :HORSSERIE,');
  Query.Script.Add('             :INTEGRALE,');
  Query.Script.Add('             :MOISPARUTION,');
  Query.Script.Add('             :ANNEEPARUTION,');
  Query.Script.Add('             :ID_SERIE,');
  Query.Script.Add('             :TITRESERIE,');
  Query.Script.Add('             :ACHAT,');
  Query.Script.Add('             :COMPLET');
  Query.Script.Add('      DO');
  Query.Script.Add('      BEGIN');
  Query.Script.Add('        SUSPEND;');
  Query.Script.Add('      END');
  Query.Script.Add('end;');

  Query.Script.Add('ALTER PROCEDURE ALBUMS_BY_COLLECTION (');
  Query.Script.Add('    id_collection char(38),');
  Query.Script.Add('    filtre varchar(125))');
  Query.Script.Add('returns (');
  Query.Script.Add('    id_album char(38),');
  Query.Script.Add('    titrealbum varchar(150),');
  Query.Script.Add('    tome smallint,');
  Query.Script.Add('    tomedebut smallint,');
  Query.Script.Add('    tomefin smallint,');
  Query.Script.Add('    horsserie smallint,');
  Query.Script.Add('    integrale smallint,');
  Query.Script.Add('    moisparution smallint,');
  Query.Script.Add('    anneeparution smallint,');
  Query.Script.Add('    id_serie char(38),');
  Query.Script.Add('    titreserie varchar(150),');
  Query.Script.Add('    achat smallint,');
  Query.Script.Add('    complet integer)');
  Query.Script.Add('as');
  Query.Script.Add('declare variable swhere varchar(200);');
  Query.Script.Add('BEGIN');
  Query.Script.Add('  if (:ID_COLLECTION = CAST('''' AS CHAR(38))) then sWhere = ''e.ID_COLLECTION is null '';');
  Query.Script.Add('                           else sWhere = ''e.ID_COLLECTION = '''''' || :ID_COLLECTION || '''''' '';');
  Query.Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
  Query.Script.Add('  for execute statement');
  Query.Script.Add('      ''SELECT a.ID_ALBUM,');
  Query.Script.Add('             a.TITREALBUM,');
  Query.Script.Add('             a.TOME,');
  Query.Script.Add('             a.TOMEDEBUT,');
  Query.Script.Add('             a.TOMEFIN,');
  Query.Script.Add('             a.HORSSERIE,');
  Query.Script.Add('             a.INTEGRALE,');
  Query.Script.Add('             a.MOISPARUTION,');
  Query.Script.Add('             a.ANNEEPARUTION,');
  Query.Script.Add('             a.ID_SERIE,');
  Query.Script.Add('             s.TITRESERIE,');
  Query.Script.Add('             a.ACHAT,');
  Query.Script.Add('             a.COMPLET');
  Query.Script.Add('      from albums a left join editions e on a.ID_ALBUM = e.id_album');
  Query.Script.Add('                    left join series s on a.id_serie = s.ID_SERIE');
  Query.Script.Add('      WHERE '' || :sWHERE ||');
  Query.Script.Add('     ''ORDER BY COALESCE(UPPERTITREALBUM, UPPERTITRESERIE), UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
  Query.Script.Add('      INTO :ID_ALBUM,');
  Query.Script.Add('           :TITREALBUM,');
  Query.Script.Add('           :TOME,');
  Query.Script.Add('           :TOMEDEBUT,');
  Query.Script.Add('           :TOMEFIN,');
  Query.Script.Add('           :HORSSERIE,');
  Query.Script.Add('           :INTEGRALE,');
  Query.Script.Add('           :MOISPARUTION,');
  Query.Script.Add('           :ANNEEPARUTION,');
  Query.Script.Add('           :ID_SERIE,');
  Query.Script.Add('           :TITRESERIE,');
  Query.Script.Add('           :ACHAT,');
  Query.Script.Add('           :COMPLET');
  Query.Script.Add('      DO');
  Query.Script.Add('      BEGIN');
  Query.Script.Add('        SUSPEND;');
  Query.Script.Add('      END');
  Query.Script.Add('end;');

  Query.Script.Add('ALTER PROCEDURE ALBUMS_BY_EDITEUR (');
  Query.Script.Add('    id_editeur char(38),');
  Query.Script.Add('    filtre varchar(125))');
  Query.Script.Add('returns (');
  Query.Script.Add('    id_album char(38),');
  Query.Script.Add('    titrealbum varchar(150),');
  Query.Script.Add('    tome smallint,');
  Query.Script.Add('    tomedebut smallint,');
  Query.Script.Add('    tomefin smallint,');
  Query.Script.Add('    horsserie smallint,');
  Query.Script.Add('    integrale smallint,');
  Query.Script.Add('    moisparution smallint,');
  Query.Script.Add('    anneeparution smallint,');
  Query.Script.Add('    id_serie char(38),');
  Query.Script.Add('    titreserie varchar(150),');
  Query.Script.Add('    achat smallint,');
  Query.Script.Add('    complet integer)');
  Query.Script.Add('as');
  Query.Script.Add('declare variable swhere varchar(133);');
  Query.Script.Add('BEGIN');
  Query.Script.Add('  swhere = '''';');
  Query.Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
  Query.Script.Add('  FOR execute statement');
  Query.Script.Add('     ''SELECT a.ID_ALBUM,');
  Query.Script.Add('             a.TITREALBUM,');
  Query.Script.Add('             a.TOME,');
  Query.Script.Add('             a.TOMEDEBUT,');
  Query.Script.Add('             a.TOMEFIN,');
  Query.Script.Add('             a.HORSSERIE,');
  Query.Script.Add('             a.INTEGRALE,');
  Query.Script.Add('             a.MOISPARUTION,');
  Query.Script.Add('             a.ANNEEPARUTION,');
  Query.Script.Add('             a.ID_SERIE,');
  Query.Script.Add('             s.TITRESERIE,');
  Query.Script.Add('             a.ACHAT,');
  Query.Script.Add('             a.COMPLET');
  Query.Script.Add('      from albums a LEFT join editions e on a.ID_ALBUM = e.id_album');
  Query.Script.Add('                    LEFT join series s on a.id_serie = s.ID_SERIE');
  Query.Script.Add('      WHERE coalesce(e.id_editeur, -1) = '''''' || :id_editeur || '''''' '' || swhere ||');
  Query.Script.Add('      ''ORDER BY COALESCE(UPPERTITREALBUM, UPPERTITRESERIE), UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
  Query.Script.Add('      INTO :ID_ALBUM,');
  Query.Script.Add('           :TITREALBUM,');
  Query.Script.Add('           :TOME,');
  Query.Script.Add('           :TOMEDEBUT,');
  Query.Script.Add('           :TOMEFIN,');
  Query.Script.Add('           :HORSSERIE,');
  Query.Script.Add('           :INTEGRALE,');
  Query.Script.Add('           :MOISPARUTION,');
  Query.Script.Add('           :ANNEEPARUTION,');
  Query.Script.Add('           :ID_SERIE,');
  Query.Script.Add('           :TITRESERIE,');
  Query.Script.Add('           :ACHAT,');
  Query.Script.Add('           :COMPLET');
  Query.Script.Add('  DO');
  Query.Script.Add('  BEGIN');
  Query.Script.Add('    SUSPEND;');
  Query.Script.Add('  END');
  Query.Script.Add('end;');

  Query.Script.Add('ALTER PROCEDURE ALBUMS_BY_GENRE (');
  Query.Script.Add('    id_genre char(38),');
  Query.Script.Add('    filtre varchar(125))');
  Query.Script.Add('returns (');
  Query.Script.Add('    id_album char(38),');
  Query.Script.Add('    titrealbum varchar(150),');
  Query.Script.Add('    tome smallint,');
  Query.Script.Add('    tomedebut smallint,');
  Query.Script.Add('    tomefin smallint,');
  Query.Script.Add('    horsserie smallint,');
  Query.Script.Add('    integrale smallint,');
  Query.Script.Add('    moisparution smallint,');
  Query.Script.Add('    anneeparution smallint,');
  Query.Script.Add('    id_serie char(38),');
  Query.Script.Add('    titreserie varchar(150),');
  Query.Script.Add('    achat smallint,');
  Query.Script.Add('    complet integer)');
  Query.Script.Add('as');
  Query.Script.Add('declare variable swhere varchar(200);');
  Query.Script.Add('BEGIN');
  Query.Script.Add('  if (:ID_Genre = CAST('''' AS CHAR(38))) then sWhere = ''ID_Genre is null '';');
  Query.Script.Add('                      else sWhere = ''ID_genre = '''''' || :ID_genre || '''''' '';');
  Query.Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
  Query.Script.Add('  for execute statement');
  Query.Script.Add('      ''SELECT ID_ALBUM,');
  Query.Script.Add('             TITREALBUM,');
  Query.Script.Add('             TOME,');
  Query.Script.Add('             TOMEDEBUT,');
  Query.Script.Add('             TOMEFIN,');
  Query.Script.Add('             HORSSERIE,');
  Query.Script.Add('             INTEGRALE,');
  Query.Script.Add('             MOISPARUTION,');
  Query.Script.Add('             ANNEEPARUTION,');
  Query.Script.Add('             a.ID_SERIE,');
  Query.Script.Add('             TITRESERIE,');
  Query.Script.Add('             ACHAT,');
  Query.Script.Add('             COMPLET');
  Query.Script.Add('       FROM VW_LISTE_ALBUMS a LEFT JOIN GENRESERIES gs ON gs.id_serie = a.id_serie');
  Query.Script.Add('                              LEFT JOIN GENRES g ON gs.id_genre = g.ID_GENRE');
  Query.Script.Add('       WHERE '' || :sWHERE ||');
  Query.Script.Add('      ''ORDER BY coalesce(UPPERTITREALBUM, UPPERTITRESERIE), UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
  Query.Script.Add('       INTO :ID_ALBUM,');
  Query.Script.Add('            :TITREALBUM,');
  Query.Script.Add('            :TOME,');
  Query.Script.Add('            :TOMEDEBUT,');
  Query.Script.Add('            :TOMEFIN,');
  Query.Script.Add('            :HORSSERIE,');
  Query.Script.Add('            :INTEGRALE,');
  Query.Script.Add('            :MOISPARUTION,');
  Query.Script.Add('            :ANNEEPARUTION,');
  Query.Script.Add('            :ID_SERIE,');
  Query.Script.Add('            :TITRESERIE,');
  Query.Script.Add('            :ACHAT,');
  Query.Script.Add('            :COMPLET');
  Query.Script.Add('      DO');
  Query.Script.Add('      BEGIN');
  Query.Script.Add('        SUSPEND;');
  Query.Script.Add('      END');
  Query.Script.Add('end;');

  Query.Script.Add('ALTER PROCEDURE ALBUMS_BY_INITIALE (');
  Query.Script.Add('    initiale char(1),');
  Query.Script.Add('    filtre varchar(125))');
  Query.Script.Add('returns (');
  Query.Script.Add('    id_album char(38),');
  Query.Script.Add('    titrealbum varchar(150),');
  Query.Script.Add('    tome smallint,');
  Query.Script.Add('    tomedebut smallint,');
  Query.Script.Add('    tomefin smallint,');
  Query.Script.Add('    horsserie smallint,');
  Query.Script.Add('    integrale smallint,');
  Query.Script.Add('    moisparution smallint,');
  Query.Script.Add('    anneeparution smallint,');
  Query.Script.Add('    id_serie char(38),');
  Query.Script.Add('    titreserie varchar(150),');
  Query.Script.Add('    achat smallint,');
  Query.Script.Add('    complet integer)');
  Query.Script.Add('as');
  Query.Script.Add('declare variable swhere varchar(133);');
  Query.Script.Add('BEGIN');
  Query.Script.Add('  swhere = '''';');
  Query.Script.Add('  if (filtre is not null and filtre <> '''') then swhere = '' and '' || filtre || '' '';');
  Query.Script.Add('  FOR execute statement');
  Query.Script.Add('     ''SELECT a.ID_ALBUM,');
  Query.Script.Add('             a.TITREALBUM,');
  Query.Script.Add('             a.TOME,');
  Query.Script.Add('             a.TOMEDEBUT,');
  Query.Script.Add('             a.TOMEFIN,');
  Query.Script.Add('             a.HORSSERIE,');
  Query.Script.Add('             a.INTEGRALE,');
  Query.Script.Add('             a.MOISPARUTION,');
  Query.Script.Add('             a.ANNEEPARUTION,');
  Query.Script.Add('             a.ID_SERIE,');
  Query.Script.Add('             s.TITRESERIE,');
  Query.Script.Add('             a.ACHAT,');
  Query.Script.Add('             a.COMPLET');
  Query.Script.Add('      FROM ALBUMS a LEFT JOIN SERIES s ON s.ID_SERIE = a.id_serie');
  Query.Script.Add('      WHERE coalesce(a.initialetitrealbum, s.initialetitreserie) = '''''' ||: INITIALE || '''''' '' || swhere ||');
  Query.Script.Add('      ''ORDER BY coalesce(UPPERTITREALBUM, UPPERTITRESERIE), UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST ''');
  Query.Script.Add('      INTO :ID_ALBUM,');
  Query.Script.Add('           :TITREALBUM,');
  Query.Script.Add('           :TOME,');
  Query.Script.Add('           :TOMEDEBUT,');
  Query.Script.Add('           :TOMEFIN,');
  Query.Script.Add('           :HORSSERIE,');
  Query.Script.Add('           :INTEGRALE,');
  Query.Script.Add('           :MOISPARUTION,');
  Query.Script.Add('           :ANNEEPARUTION,');
  Query.Script.Add('           :ID_SERIE,');
  Query.Script.Add('           :TITRESERIE,');
  Query.Script.Add('           :ACHAT,');
  Query.Script.Add('           :COMPLET');
  Query.Script.Add('  DO');
  Query.Script.Add('  BEGIN');
  Query.Script.Add('    SUSPEND;');
  Query.Script.Add('  END');
  Query.Script.Add('end;');

  Query.Script.Add('ALTER PROCEDURE ALBUMS_BY_AUTEUR (');
  Query.Script.Add('    id_auteur char(38),');
  Query.Script.Add('    filtre varchar(125))');
  Query.Script.Add('returns (');
  Query.Script.Add('    id_album char(38),');
  Query.Script.Add('    titrealbum varchar(150),');
  Query.Script.Add('    tome smallint,');
  Query.Script.Add('    tomedebut smallint,');
  Query.Script.Add('    tomefin smallint,');
  Query.Script.Add('    horsserie smallint,');
  Query.Script.Add('    integrale smallint,');
  Query.Script.Add('    moisparution smallint,');
  Query.Script.Add('    anneeparution smallint,');
  Query.Script.Add('    id_serie char(38),');
  Query.Script.Add('    titreserie varchar(150),');
  Query.Script.Add('    metier smallint,');
  Query.Script.Add('    achat smallint,');
  Query.Script.Add('    complet integer)');
  Query.Script.Add('as');
  Query.Script.Add('declare variable swhere varchar(200);');
  Query.Script.Add('BEGIN');
  Query.Script.Add('  swhere = '''';');
  Query.Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
  Query.Script.Add('  FOR execute statement');
  Query.Script.Add('     ''SELECT A.ID_ALBUM,');
  Query.Script.Add('             A.TITREALBUM,');
  Query.Script.Add('             A.TOME,');
  Query.Script.Add('             A.TOMEDEBUT,');
  Query.Script.Add('             A.TOMEFIN,');
  Query.Script.Add('             A.HORSSERIE,');
  Query.Script.Add('             A.INTEGRALE,');
  Query.Script.Add('             A.MOISPARUTION,');
  Query.Script.Add('             A.ANNEEPARUTION,');
  Query.Script.Add('             A.ID_SERIE,');
  Query.Script.Add('             A.TITRESERIE,');
  Query.Script.Add('             AU.metier,');
  Query.Script.Add('             A.ACHAT,');
  Query.Script.Add('             A.COMPLET');
  Query.Script.Add('      FROM vw_liste_albums A INNER JOIN auteurs au on a.ID_album = au.ID_album');
  Query.Script.Add('      WHERE au.ID_personne = '''''' || :id_auteur || '''''' '' || swhere ||');
  Query.Script.Add('      ''ORDER BY UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST, coalesce(UPPERTITREALBUM, UPPERTITRESERIE), METIER''');
  Query.Script.Add('      INTO :ID_ALBUM,');
  Query.Script.Add('           :TITREALBUM,');
  Query.Script.Add('           :TOME,');
  Query.Script.Add('           :TOMEDEBUT,');
  Query.Script.Add('           :TOMEFIN,');
  Query.Script.Add('           :HORSSERIE,');
  Query.Script.Add('           :INTEGRALE,');
  Query.Script.Add('           :MOISPARUTION,');
  Query.Script.Add('           :ANNEEPARUTION,');
  Query.Script.Add('           :ID_SERIE,');
  Query.Script.Add('           :TITRESERIE,');
  Query.Script.Add('           :METIER,');
  Query.Script.Add('           :ACHAT,');
  Query.Script.Add('           :COMPLET');
  Query.Script.Add('      DO');
  Query.Script.Add('      BEGIN');
  Query.Script.Add('        SUSPEND;');
  Query.Script.Add('      END');
  Query.Script.Add('end;');

  Query.ExecuteScript;
end;

initialization

RegisterFBUpdate('1.2.3.26', @MAJ1_2_3_26);

end.
