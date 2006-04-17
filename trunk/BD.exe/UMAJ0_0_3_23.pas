unit UMAJ0_0_3_23;

interface

implementation

uses JvUIB, Updates;

procedure MAJ0_0_3_23(Query: TJvUIBScript);
begin
  with Query do begin
    Script.Clear;

    Script.Add('ALTER PROCEDURE ALBUMS_BY_ANNEE (');
    Script.Add('    ANNEE INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  if (:Annee = -1) then sWhere = ''ANNEEPARUTION is null '';');
    Script.Add('                   else sWhere = ''ANNEEPARUTION = '' || :ANNEE || '' '';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
    Script.Add('  for execute statement');
    Script.Add('      ''SELECT REFALBUM,');
    Script.Add('             TITREALBUM,');
    Script.Add('             TOME,');
    Script.Add('             TOMEDEBUT,');
    Script.Add('             TOMEFIN,');
    Script.Add('             HORSSERIE,');
    Script.Add('             INTEGRALE,');
    Script.Add('             ANNEEPARUTION,');
    Script.Add('             REFSERIE,');
    Script.Add('             TITRESERIE,');
    Script.Add('             ACHAT,');
    Script.Add('             COMPLET');
    Script.Add('        FROM vw_liste_albums');
    Script.Add('        WHERE '' || :sWHERE ||');
    Script.Add('        ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST''');
    Script.Add('        INTO :REFALBUM,');
    Script.Add('             :TITREALBUM,');
    Script.Add('             :TOME,');
    Script.Add('             :TOMEDEBUT,');
    Script.Add('             :TOMEFIN,');
    Script.Add('             :HORSSERIE,');
    Script.Add('             :INTEGRALE,');
    Script.Add('             :ANNEEPARUTION,');
    Script.Add('             :REFSERIE,');
    Script.Add('             :TITRESERIE,');
    Script.Add('             :ACHAT,');
    Script.Add('             :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_AUTEUR(');
    Script.Add('    REFAUTEUR INTEGER)');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    METIER SMALLINT)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ANNEES_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    ANNEEPARUTION INTEGER,');
    Script.Add('    COUNTANNEE INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE COLLECTIONS_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    NOMCOLLECTION VARCHAR(50),');
    Script.Add('    COUNTCOLLECTION INTEGER,');
    Script.Add('    REFCOLLECTION INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE EDITEURS_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    NOMEDITEUR VARCHAR(50),');
    Script.Add('    COUNTEDITEUR INTEGER,');
    Script.Add('    REFEDITEUR INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE GENRES_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    GENRE VARCHAR(30),');
    Script.Add('    COUNTGENRE INTEGER,');
    Script.Add('    REFGENRE INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('DROP VIEW VW_LISTE_GENRES_ALBUMS;');
    Script.Add('DROP VIEW VW_LISTE_EDITEURS_ALBUMS;');
    Script.Add('DROP VIEW VW_LISTE_COLLECTIONS_ALBUMS;');
    Script.Add('DROP VIEW VW_LISTE_ALBUMS;');

    Script.Add('CREATE VIEW VW_LISTE_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    UPPERTITRESERIE,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       s.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       s.UPPERTITRESERIE,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM ALBUMS a INNER JOIN SERIES s ON s.refserie = a.refserie;');

    Script.Add('CREATE VIEW VW_LISTE_COLLECTIONS_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFCOLLECTION,');
    Script.Add('    NOMCOLLECTION,');
    Script.Add('    UPPERNOMCOLLECTION,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       c.REFCOLLECTION,');
    Script.Add('       c.NOMCOLLECTION,');
    Script.Add('       c.UPPERNOMCOLLECTION,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN EDITIONS e ON e.refalbum = a.refalbum');
    Script.Add('                       LEFT JOIN COLLECTIONS c ON e.refcollection = c.refcollection;');

    Script.Add('CREATE VIEW VW_LISTE_EDITEURS_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFEDITEUR,');
    Script.Add('    NOMEDITEUR,');
    Script.Add('    UPPERNOMEDITEUR,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       e.REFEDITEUR,');
    Script.Add('       e.NOMEDITEUR,');
    Script.Add('       e.UPPERNOMEDITEUR,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN EDITIONS ed ON ed.refalbum = a.refalbum');
    Script.Add('                       LEFT JOIN EDITEURS e ON e.refediteur = ed.refediteur;');

    Script.Add('CREATE VIEW VW_LISTE_GENRES_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFGENRE,');
    Script.Add('    GENRE,');
    Script.Add('    UPPERGENRE,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       g.REFGENRE,');
    Script.Add('       g.GENRE,');
    Script.Add('       g.UPPERGENRE,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN GENRESERIES gs ON gs.refserie = a.refserie');
    Script.Add('                       LEFT JOIN GENRES g ON gs.refgenre = g.refgenre;');
    
    Script.Add('ALTER PROCEDURE ALBUMS_BY_AUTEUR (');
    Script.Add('    REFAUTEUR INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    METIER SMALLINT,');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
    Script.Add('  FOR execute statement');
    Script.Add('     ''SELECT A.REFALBUM,');
    Script.Add('             A.TITREALBUM,');
    Script.Add('             A.TOME,');
    Script.Add('             A.TOMEDEBUT,');
    Script.Add('             A.TOMEFIN,');
    Script.Add('             A.HORSSERIE,');
    Script.Add('             A.INTEGRALE,');
    Script.Add('             A.ANNEEPARUTION,');
    Script.Add('             A.REFSERIE,');
    Script.Add('             A.TITRESERIE,');
    Script.Add('             AU.metier,');
    Script.Add('             A.ACHAT,');
    Script.Add('             A.COMPLET');
    Script.Add('      FROM vw_liste_albums A INNER JOIN auteurs au on a.refalbum = au.refalbum');
    Script.Add('      WHERE au.refpersonne = '''''' || :RefAuteur || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, ANNEEPARUTION NULLS FIRST, UPPERTITREALBUM, METIER''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :METIER,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('END;');

    Script.Add('ALTER PROCEDURE ANNEES_ALBUMS (');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    COUNTANNEE INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(133);');
    Script.Add('begin');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''AND '' || filtre;');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             CAST(-1 AS SMALLINT),');
    Script.Add('             Count(REFALBUM)');
    Script.Add('      from vw_liste_albums');
    Script.Add('      where AnneeParution is null '' || SWHERE ||');
    Script.Add('     ''group by AnneeParution''');
    Script.Add('  into :AnneeParution,');
    Script.Add('       :countannee');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             AnneeParution,');
    Script.Add('             Count(REFALBUM)');
    Script.Add('      from vw_liste_albums');
    Script.Add('      where AnneeParution is not null '' || SWHERE ||');
    Script.Add('     ''group by AnneeParution''');
    Script.Add('  into :AnneeParution,');
    Script.Add('       :countannee');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE COLLECTIONS_ALBUMS (');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    NOMCOLLECTION VARCHAR(50),');
    Script.Add('    COUNTCOLLECTION INTEGER,');
    Script.Add('    REFCOLLECTION INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(133);');
    Script.Add('begin');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''AND '' || filtre;');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             CAST(''''-1'''' AS VARCHAR(50)),');
    Script.Add('             Count(REFALBUM),');
    Script.Add('             -1');
    Script.Add('      from vw_liste_collections_albums');
    Script.Add('      where REFCOLLECTION is null '' || SWHERE ||');
    Script.Add('     ''group by uppernomcollection, nomCOLLECTION, refCOLLECTION''');
    Script.Add('  into :nomCOLLECTION,');
    Script.Add('       :countCOLLECTION,');
    Script.Add('       :RefCOLLECTION');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             nomCOLLECTION,');
    Script.Add('             Count(REFALBUM),');
    Script.Add('             RefCOLLECTION');
    Script.Add('      from vw_liste_collections_albums');
    Script.Add('      where REFCOLLECTION is not null '' || SWHERE ||');
    Script.Add('     ''group by uppernomcollection, nomCOLLECTION, refCOLLECTION''');
    Script.Add('  into :nomCOLLECTION,');
    Script.Add('       :countCOLLECTION,');
    Script.Add('       :RefCOLLECTION');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE EDITEURS_ALBUMS (');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    NOMEDITEUR VARCHAR(50),');
    Script.Add('    COUNTEDITEUR INTEGER,');
    Script.Add('    REFEDITEUR INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(133);');
    Script.Add('begin');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''AND '' || filtre;');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             CAST(''''-1'''' AS VARCHAR(50)),');
    Script.Add('             Count(REFALBUM),');
    Script.Add('             -1');
    Script.Add('      from vw_liste_editeurs_albums');
    Script.Add('      where REFEDITEUR is null '' || SWHERE ||');
    Script.Add('     ''group by uppernomediteur, nomediteur, refediteur''');
    Script.Add('  into :nomediteur,');
    Script.Add('       :countediteur,');
    Script.Add('       :RefEditeur');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             nomediteur,');
    Script.Add('             Count(REFALBUM),');
    Script.Add('             RefEditeur');
    Script.Add('      from vw_liste_editeurs_albums');
    Script.Add('      where REFEDITEUR is not null '' || SWHERE ||');
    Script.Add('     ''group by uppernomediteur, nomediteur, refediteur''');
    Script.Add('  into :nomediteur,');
    Script.Add('       :countediteur,');
    Script.Add('       :RefEditeur');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE GENRES_ALBUMS (');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    GENRE VARCHAR(30),');
    Script.Add('    COUNTGENRE INTEGER,');
    Script.Add('    REFGENRE INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(132);');
    Script.Add('begin');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''AND '' || filtre;');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             CAST(''''-1'''' AS VARCHAR(30)),');
    Script.Add('             Count(REFALBUM),');
    Script.Add('             -1');
    Script.Add('      from vw_liste_genres_albums');
    Script.Add('      where REFGENRE is null '' || SWHERE ||');
    Script.Add('     ''group by uppergenre, Genre, refgenre''');
    Script.Add('  into :genre,');
    Script.Add('       :countgenre,');
    Script.Add('       :refgenre');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('     ''select');
    Script.Add('             Genre,');
    Script.Add('             Count(REFALBUM),');
    Script.Add('             refgenre');
    Script.Add('      from vw_liste_genres_albums');
    Script.Add('      where REFGENRE is not null '' || SWHERE ||');
    Script.Add('     ''group by uppergenre, Genre, refgenre''');
    Script.Add('  into :genre,');
    Script.Add('       :countgenre,');
    Script.Add('       :refgenre');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_COLLECTION (');
    Script.Add('    REFCOLLECTION INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  if (:refCOLLECTION = -1) then sWhere = ''e.refCOLLECTION is null '';');
    Script.Add('                           else sWhere = ''e.refCOLLECTION = '' || :refCOLLECTION || '' '';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
    Script.Add('  for execute statement');
    Script.Add('      ''SELECT a.REFALBUM,');
    Script.Add('             a.TITREALBUM,');
    Script.Add('             a.TOME,');
    Script.Add('             a.TOMEDEBUT,');
    Script.Add('             a.TOMEFIN,');
    Script.Add('             a.HORSSERIE,');
    Script.Add('             a.INTEGRALE,');
    Script.Add('             a.ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             s.TITRESERIE,');
    Script.Add('             a.ACHAT,');
    Script.Add('             a.COMPLET');
    Script.Add('      from albums a left join editions e on a.refalbum = e.refalbum');
    Script.Add('                    left join series s on a.refserie = s.refserie');
    Script.Add('      WHERE '' || :sWHERE ||');
    Script.Add('     ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_EDITEUR (');
    Script.Add('    REFEDITEUR INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM Integer,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME Smallint,');
    Script.Add('    TOMEDEBUT Smallint,');
    Script.Add('    TOMEFIN Smallint,');
    Script.Add('    HORSSERIE Smallint,');
    Script.Add('    INTEGRALE Smallint,');
    Script.Add('    ANNEEPARUTION Smallint,');
    Script.Add('    REFSERIE Integer,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT Smallint,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(133);');
    Script.Add('BEGIN');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
    Script.Add('  FOR execute statement');
    Script.Add('     ''SELECT a.REFALBUM,');
    Script.Add('             a.TITREALBUM,');
    Script.Add('             a.TOME,');
    Script.Add('             a.TOMEDEBUT,');
    Script.Add('             a.TOMEFIN,');
    Script.Add('             a.HORSSERIE,');
    Script.Add('             a.INTEGRALE,');
    Script.Add('             a.ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             s.TITRESERIE,');
    Script.Add('             a.ACHAT,');
    Script.Add('             a.COMPLET');
    Script.Add('      from albums a LEFT join editions e on a.refalbum = e.refalbum');
    Script.Add('                    LEFT join series s on a.refserie = s.refserie');
    Script.Add('      WHERE e.refediteur = '''''' || :refediteur || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('  DO');
    Script.Add('  BEGIN');
    Script.Add('    SUSPEND;');
    Script.Add('  END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_GENRE (');
    Script.Add('    REFGENRE INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  if (:RefGenre = -1) then sWhere = ''RefGenre is null '';');
    Script.Add('                      else sWhere = ''refgenre = '' || :refgenre || '' '';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
    Script.Add('  for execute statement');
    Script.Add('      ''SELECT REFALBUM,');
    Script.Add('             TITREALBUM,');
    Script.Add('             TOME,');
    Script.Add('             TOMEDEBUT,');
    Script.Add('             TOMEFIN,');
    Script.Add('             HORSSERIE,');
    Script.Add('             INTEGRALE,');
    Script.Add('             ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             TITRESERIE,');
    Script.Add('             ACHAT,');
    Script.Add('             COMPLET');
    Script.Add('       FROM VW_LISTE_ALBUMS a LEFT JOIN GENRESERIES gs ON gs.refserie = a.refserie');
    Script.Add('                              LEFT JOIN GENRES g ON gs.refgenre = g.refgenre');
    Script.Add('       WHERE '' || :sWHERE ||');
    Script.Add('      ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST''');
    Script.Add('       INTO :REFALBUM,');
    Script.Add('            :TITREALBUM,');
    Script.Add('            :TOME,');
    Script.Add('            :TOMEDEBUT,');
    Script.Add('            :TOMEFIN,');
    Script.Add('            :HORSSERIE,');
    Script.Add('            :INTEGRALE,');
    Script.Add('            :ANNEEPARUTION,');
    Script.Add('            :REFSERIE,');
    Script.Add('            :TITRESERIE,');
    Script.Add('            :ACHAT,');
    Script.Add('            :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_INITIALE (');
    Script.Add('    INITIALE CHAR(1),');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(133);');
    Script.Add('BEGIN');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
    Script.Add('  FOR execute statement');
    Script.Add('     ''SELECT a.REFALBUM,');
    Script.Add('             a.TITREALBUM,');
    Script.Add('             a.TOME,');
    Script.Add('             a.TOMEDEBUT,');
    Script.Add('             a.TOMEFIN,');
    Script.Add('             a.HORSSERIE,');
    Script.Add('             a.INTEGRALE,');
    Script.Add('             a.ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             s.TITRESERIE,');
    Script.Add('             a.ACHAT,');
    Script.Add('             a.COMPLET');
    Script.Add('      FROM ALBUMS a INNER JOIN SERIES s ON s.refserie = a.refserie');
    Script.Add('      WHERE a.initialetitrealbum = '''''' || :INITIALE || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('  DO');
    Script.Add('  BEGIN');
    Script.Add('    SUSPEND;');
    Script.Add('  END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_SERIE (');
    Script.Add('    SERIE INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(130);');
    Script.Add('BEGIN');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
    Script.Add('  FOR execute statement');
    Script.Add('      ''SELECT REFALBUM,');
    Script.Add('             TITREALBUM,');
    Script.Add('             TOME,');
    Script.Add('             TOMEDEBUT,');
    Script.Add('             TOMEFIN,');
    Script.Add('             HORSSERIE,');
    Script.Add('             INTEGRALE,');
    Script.Add('             ANNEEPARUTION,');
    Script.Add('             REFSERIE,');
    Script.Add('             TITRESERIE,');
    Script.Add('             ACHAT,');
    Script.Add('             COMPLET');
    Script.Add('      FROM vw_liste_albums');
    Script.Add('      WHERE refserie = '''''' || :serie || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY HORSSERIE NULLS FIRST, INTEGRALE NULLS First, TOME NULLS FIRST, ANNEEPARUTION NULLS FIRST, UPPERTITREALBUM''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('  DO');
    Script.Add('  BEGIN');
    Script.Add('    SUSPEND;');
    Script.Add('  END');
    Script.Add('end;');

    ExecuteScript;
  end;
end;

initialization
  RegisterUpdate('0.0.3.23', @MAJ0_0_3_23);

end.