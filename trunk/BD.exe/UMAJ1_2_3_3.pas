unit UMAJ1_2_3_3;

interface

implementation

uses JvUIB, Updates;

procedure MAJ1_2_3_3(Query: TJvUIBScript);
begin
  with Query do begin
    Script.Clear;

    Script.Add('CREATE INDEX SERIES_IDX5 ON SERIES (UPPERTITRESERIE);');
    Script.Add('DROP INDEX SERIES_IDX1;');
    Script.Add('CREATE INDEX SERIES_IDX1 ON SERIES (INITIALETITRESERIE,ID_SERIE);');
    Script.Add('DROP INDEX SERIES_IDX2;');
    Script.Add('CREATE INDEX SERIES_IDX2 ON SERIES (TERMINEE,ID_SERIE);');

    Script.Add('DROP INDEX ALBUMS_IDX1;');
    Script.Add('CREATE INDEX ALBUMS_IDX1 ON ALBUMS (ANNEEPARUTION,ID_ALBUM);');
    Script.Add('DROP INDEX ALBUMS_IDX2;');
    Script.Add('CREATE INDEX ALBUMS_IDX2 ON ALBUMS (INITIALETITREALBUM,ID_ALBUM);');
    Script.Add('DROP INDEX ALBUMS_IDX7;');
    Script.Add('CREATE INDEX ALBUMS_IDX7 ON ALBUMS (ANNEEPARUTION,HORSSERIE,INTEGRALE,ACHAT,ID_ALBUM);');
    Script.Add('DROP INDEX ALBUMS_IDX4;');
    Script.Add('CREATE INDEX ALBUMS_IDX4 ON ALBUMS (HORSSERIE,INTEGRALE,ID_SERIE,ACHAT,ID_ALBUM);');
    Script.Add('DROP INDEX ALBUMS_IDX6;');
    Script.Add('CREATE INDEX ALBUMS_IDX6 ON ALBUMS (TOMEDEBUT,TOMEFIN,HORSSERIE,INTEGRALE,ID_SERIE,ID_ALBUM);');
    Script.Add('DROP INDEX ALBUMS_IDX8;');
    Script.Add('CREATE INDEX ALBUMS_IDX8 ON ALBUMS (ID_SERIE,ID_ALBUM);');

    Script.Add('DROP INDEX COUVERTURES_IDX1;');
    Script.Add('CREATE INDEX COUVERTURES_IDX1 ON COUVERTURES (ORDRE,ID_COUVERTURE);');
    Script.Add('DROP INDEX COUVERTURES_IDX2;');
    Script.Add('CREATE INDEX COUVERTURES_IDX2 ON COUVERTURES (ID_EDITION,ID_COUVERTURE);');
    Script.Add('DROP INDEX COUVERTURES_IDX3;');
    Script.Add('CREATE INDEX COUVERTURES_IDX3 ON COUVERTURES (CATEGORIEIMAGE,ID_COUVERTURE);');

    Script.Add('DROP INDEX EDITEURS_IDX2;');
    Script.Add('CREATE INDEX EDITEURS_IDX2 ON EDITEURS (INITIALENOMEDITEUR,ID_EDITEUR);');

    Script.Add('DROP INDEX EDITIONS_IDX1;');
    Script.Add('CREATE INDEX EDITIONS_IDX1 ON EDITIONS (ID_COLLECTION,ID_EDITION);');
    Script.Add('DROP INDEX EDITIONS_IDX2;');
    Script.Add('CREATE INDEX EDITIONS_IDX2 ON EDITIONS (ETAT,ID_EDITION);');
    Script.Add('DROP INDEX EDITIONS_IDX3;');
    Script.Add('CREATE INDEX EDITIONS_IDX3 ON EDITIONS (RELIURE,ID_EDITION);');
    Script.Add('DROP INDEX EDITIONS_IDX4;');
    Script.Add('CREATE INDEX EDITIONS_IDX4 ON EDITIONS (TYPEEDITION,ID_EDITION);');
    Script.Add('DROP INDEX EDITIONS_IDX5;');
    Script.Add('CREATE INDEX EDITIONS_IDX5 ON EDITIONS (ORIENTATION,ID_EDITION);');
    Script.Add('DROP INDEX EDITIONS_IDX6;');
    Script.Add('CREATE INDEX EDITIONS_IDX6 ON EDITIONS (FORMATEDITION,ID_EDITION);');

    Script.Add('DROP INDEX EMPRUNTEURS_IDX1;');
    Script.Add('CREATE INDEX EMPRUNTEURS_IDX1 ON EMPRUNTEURS (INITIALENOMEMPRUNTEUR,ID_EMPRUNTEUR);');

    Script.Add('DROP INDEX GENRES_IDX3;');
    Script.Add('CREATE INDEX GENRES_IDX3 ON GENRES (INITIALEGENRE,ID_GENRE);');

    Script.Add('DROP INDEX LISTES_IDX1;');
    Script.Add('CREATE INDEX LISTES_IDX1 ON LISTES (REF,ID_LISTE);');
    Script.Add('DROP INDEX LISTES_IDX2;');
    Script.Add('CREATE INDEX LISTES_IDX2 ON LISTES (CATEGORIE,ID_LISTE);');

    Script.Add('DROP INDEX PARABD_IDX1;');
    Script.Add('CREATE INDEX PARABD_IDX1 ON PARABD (CATEGORIEPARABD,ID_PARABD);');
    Script.Add('CREATE INDEX PARABD_IDX4 ON PARABD (UPPERTITREPARABD);');
    Script.Add('CREATE INDEX PARABD_IDX3 ON PARABD (INITIALETITREPARABD,ID_PARABD);');
    Script.Add('DROP INDEX PARABD_IDX2;');
    Script.Add('CREATE INDEX PARABD_IDX2 ON PARABD (ID_SERIE,ID_PARABD);');

    Script.Add('DROP INDEX PERSONNES_IDX2;');
    Script.Add('CREATE INDEX PERSONNES_IDX2 ON PERSONNES (INITIALENOMPERSONNE,ID_PERSONNE);');

    Script.Add('DROP INDEX SERIES_IDX3;');
    Script.Add('CREATE INDEX SERIES_IDX3 ON SERIES (ID_COLLECTION,ID_SERIE);');
    Script.Add('DROP INDEX SERIES_IDX4;');
    Script.Add('CREATE INDEX SERIES_IDX4 ON SERIES (ID_EDITEUR,ID_SERIE);');

    ExecuteScript;
  end;
end;

initialization
  RegisterUpdate('1.2.3.3', @MAJ1_2_3_3);

end.

