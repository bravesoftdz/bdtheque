unit UMySQLMAJ1_0_0_0;

interface

uses Classes, Updates;

implementation

procedure MAJ1_0_0_0(Script: TStrings);
begin
  with Script do
  begin
    Script.Clear;
    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/options (');
    Add('  cle varchar(20) NOT NULL,');
    Add('  valeur varchar(100) default NULL,');
    Add('  PRIMARY KEY  (cle)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/albums (');
    Add('  id_album char(38) NOT NULL,');
    Add('  titrealbum varchar(150) default NULL,');
    Add('  moisparution smallint(6) default NULL,');
    Add('  anneeparution smallint(6) default NULL,');
    Add('  id_serie char(38) default NULL,');
    Add('  tome smallint(6) default NULL,');
    Add('  tomedebut smallint(6) default NULL,');
    Add('  tomefin smallint(6) default NULL,');
    Add('  horsserie smallint(6) default 0,');
    Add('  integrale smallint(6) default 0,');
    Add('  sujetalbum longtext,');
    Add('  remarquesalbum longtext,');
    Add('  achat smallint(6) default 0,');
    Add('  nbeditions int(11) default 0,');
    Add('  complet tinyint(4) default NULL,');
    Add('  uppertitrealbum varchar(150) default NULL,');
    Add('  uppersujetalbum longtext,');
    Add('  upperremarquesalbum longtext,');
    Add('  soundextitrealbum varchar(30) default NULL,');
    Add('  initialetitrealbum char(1) default NULL,');
    Add('  dc_albums timestamp,');
    Add('  dm_albums timestamp,');
    Add('  PRIMARY KEY (id_album),');
    Add('  KEY id_serie (id_serie),');
    Add('  FULLTEXT KEY uppertitrealbum (uppertitrealbum),');
    Add('  FULLTEXT KEY uppersujetalbum (uppersujetalbum),');
    Add('  FULLTEXT KEY upperremarquesalbum (upperremarquesalbum)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/series (');
    Add('  id_serie char(38) NOT NULL,');
    Add('  titreserie varchar(150) NOT NULL,');
    Add('  id_editeur char(38) default NULL,');
    Add('  id_collection char(38) default NULL,');
    Add('  sujetserie longtext,');
    Add('  remarquesserie longtext,');
    Add('  terminee smallint(6) default 0,');
    Add('  complete smallint(6) default 0,');
    Add('  siteweb varchar(255) default NULL,');
    Add('  suivremanquants smallint(6) default 1,');
    Add('  suivresorties smallint(6) default 1,');
    Add('  uppertitreserie varchar(150) default NULL,');
    Add('  initialetitreserie char(1) NOT NULL,');
    Add('  soundextitreserie varchar(30) default NULL,');
    Add('  uppersujetserie longtext,');
    Add('  upperremarquesserie longtext,');
    Add('  dc_series timestamp,');
    Add('  dm_series timestamp,');
    Add('  nb_albums int(11) default NULL,');
    Add('  PRIMARY KEY  (id_serie),');
    Add('  KEY id_editeur (id_editeur),');
    Add('  KEY id_collection (id_collection),');
    Add('  FULLTEXT KEY uppertitreserie (uppertitreserie)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/personnes (');
    Add('  id_personne char(38) NOT NULL,');
    Add('  nompersonne varchar(150) default NULL,');
    Add('  uppernompersonne varchar(150) default NULL,');
    Add('  initialenompersonne char(1) default NULL,');
    Add('  biographie longtext,');
    Add('  siteweb varchar(255) default NULL,');
    Add('  dc_personnes timestamp,');
    Add('  dm_personnes timestamp,');
    Add('  PRIMARY KEY  (id_personne),');
    Add('  FULLTEXT KEY uppernompersonne (uppernompersonne)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/editions (');
    Add('  id_edition char(38) NOT NULL,');
    Add('  id_album char(38) NOT NULL,');
    Add('  id_editeur char(38) NOT NULL,');
    Add('  id_collection char(38) default NULL,');
    Add('  anneeedition smallint(6) default NULL,');
    Add('  prix decimal(15,2) default NULL,');
    Add('  vo smallint(6) default 0,');
    Add('  couleur smallint(6) default 1,');
    Add('  isbn char(13) default NULL,');
    Add('  prete smallint(6) default 0,');
    Add('  stock smallint(6) default 1,');
    Add('  dedicace smallint(6) default 0,');
    Add('  etat int(11) default NULL,');
    Add('  reliure int(11) default NULL,');
    Add('  typeedition int(11) default NULL,');
    Add('  notes longtext,');
    Add('  dateachat date default NULL,');
    Add('  gratuit smallint(6) default 0,');
    Add('  offert smallint(6) default 0,');
    Add('  nombredepages int(11) default NULL,');
    Add('  orientation smallint(6) default NULL,');
    Add('  formatedition smallint(6) default NULL,');
    Add('  anneecote smallint(6) default NULL,');
    Add('  prixcote decimal(15,2) default NULL,');
    Add('  dc_editions timestamp,');
    Add('  dm_editions timestamp,');
    Add('  numeroperso varchar(25) default NULL,');
    Add('  senslecture smallint(6) default NULL,');
    Add('  PRIMARY KEY (id_edition),');
    Add('  KEY id_album (id_album),');
    Add('  KEY id_editeur (id_editeur),');
    Add('  KEY id_collection (id_collection)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/editeurs (');
    Add('  id_editeur char(38) NOT NULL,');
    Add('  nomediteur varchar(50) NOT NULL,');
    Add('  uppernomediteur varchar(50) NOT NULL,');
    Add('  initialenomediteur char(1) NOT NULL,');
    Add('  siteweb varchar(255) default NULL,');
    Add('  dc_editeurs timestamp,');
    Add('  dm_editeurs timestamp,');
    Add('  PRIMARY KEY (id_editeur)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/collections (');
    Add('  id_collection char(38) NOT NULL,');
    Add('  nomcollection varchar(50) NOT NULL,');
    Add('  id_editeur char(38) NOT NULL,');
    Add('  uppernomcollection varchar(50) NOT NULL,');
    Add('  initialenomcollection char(1) NOT NULL,');
    Add('  dc_collections timestamp,');
    Add('  dm_collections timestamp,');
    Add('  PRIMARY KEY (id_collection),');
    Add('  KEY id_editeur (id_editeur)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/genres (');
    Add('  id_genre char(38) NOT NULL,');
    Add('  genre varchar(30) default NULL,');
    Add('  uppergenre varchar(30) default NULL,');
    Add('  initialegenre char(1) default NULL,');
    Add('  dc_genres timestamp,');
    Add('  dm_genres timestamp,');
    Add('  PRIMARY KEY (id_genre)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/genreseries (');
    Add('  id_genreseries char(38) NOT NULL,');
    Add('  id_serie char(38) NOT NULL,');
    Add('  id_genre char(38) NOT NULL,');
    Add('  dc_genreseries timestamp,');
    Add('  dm_genreseries timestamp,');
    Add('  PRIMARY KEY (id_genreseries),');
    Add('  KEY id_serie (id_serie),');
    Add('  KEY id_genre (id_genre)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/auteurs (');
    Add('  id_auteur char(38) NOT NULL,');
    Add('  id_album char(38) NOT NULL,');
    Add('  id_personne char(38) NOT NULL,');
    Add('  metier smallint(6) NOT NULL,');
    Add('  dc_auteurs timestamp,');
    Add('  dm_auteurs timestamp,');
    Add('  PRIMARY KEY (id_auteur),');
    Add('  KEY id_album (id_album),');
    Add('  KEY id_personne (id_personne),');
    Add('  KEY metier (metier)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/listes (');
    Add('  id_liste char(38) NOT NULL,');
    Add('  ref int(11) NOT NULL,');
    Add('  categorie int(11) NOT NULL,');
    Add('  libelle varchar(50) default NULL,');
    Add('  ordre int(11) default NULL,');
    Add('  defaut smallint(6) default 0,');
    Add('  dc_listes timestamp,');
    Add('  dm_listes timestamp,');
    Add('  PRIMARY KEY  (id_liste),');
    Add('  KEY ref (ref)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/couvertures (');
    Add('  id_couverture char(38) NOT NULL,');
    Add('  id_album char(38) default NULL,');
    Add('  id_edition char(38) default NULL,');
    Add('  ordre int(11) default NULL,');
    Add('  categorieimage smallint(6) default NULL,');
    Add('  dc_couvertures timestamp,');
    Add('  dm_couvertures timestamp,');
    Add('  PRIMARY KEY  (id_couverture),');
    Add('  KEY id_album (id_album),');
    Add('  KEY id_edition (id_edition)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/albums_manquants (');
    Add('  id_serie char(38) default NULL,');
    Add('  countserie int(11) default NULL,');
    Add('  titreserie varchar(150) default NULL,');
    Add('  uppertitreserie varchar(150) default NULL,');
    Add('  tome int(11) default NULL,');
    Add('  id_editeur char(38) default NULL,');
    Add('  nomediteur varchar(50) default NULL,');
    Add('  id_collection char(38) default NULL,');
    Add('  nomcollection varchar(50) default NULL,');
    Add('  achat smallint(6) default NULL,');
    Add('  KEY id_serie (id_serie),');
    Add('  KEY id_editeur (id_editeur),');
    Add('  KEY id_collection (id_collection),');
    Add('  KEY uppertitreserie (uppertitreserie),');
    Add('  KEY tome (tome),');
    Add('  KEY achat (achat)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');

    Add('CREATE TABLE IF NOT EXISTS /*DB_PREFIX*/previsions_sorties (');
    Add('  id_serie char(38) default NULL,');
    Add('  titreserie varchar(150) default NULL,');
    Add('  uppertitreserie varchar(150) default NULL,');
    Add('  tome int(11) default NULL,');
    Add('  anneeparution int(11) default NULL,');
    Add('  moisparution int(11) default NULL,');
    Add('  id_editeur char(38) default NULL,');
    Add('  nomediteur varchar(50) default NULL,');
    Add('  id_collection char(38) default NULL,');
    Add('  nomcollection varchar(50) default NULL,');
    Add('  KEY id_serie (id_serie),');
    Add('  KEY uppertitreserie (uppertitreserie),');
    Add('  KEY tome (tome),');
    Add('  KEY parution (anneeparution,moisparution),');
    Add('  KEY id_editeur (id_editeur),');
    Add('  KEY id_collection (id_collection)');
    Add(') DEFAULT CHARSET=utf8;');
    Add('@@');


    Add('create view /*DB_PREFIX*/vw_liste_albums(');
    Add('    id_album,');
    Add('    titrealbum,');
    Add('    tome,');
    Add('    tomedebut,');
    Add('    tomefin,');
    Add('    horsserie,');
    Add('    integrale,');
    Add('    moisparution,');
    Add('    anneeparution,');
    Add('    id_serie,');
    Add('    titreserie,');
    Add('    uppertitrealbum,');
    Add('    uppertitreserie,');
    Add('    achat,');
    Add('    complet,');
    Add('    initialetitrealbum,');
    Add('    initialetitreserie)');
    Add('as');
    Add('select a.id_album,');
    Add('       a.titrealbum,');
    Add('       a.tome,');
    Add('       a.tomedebut,');
    Add('       a.tomefin,');
    Add('       a.horsserie,');
    Add('       a.integrale,');
    Add('       a.moisparution,');
    Add('       a.anneeparution,');
    Add('       a.id_serie,');
    Add('       s.titreserie,');
    Add('       a.uppertitrealbum,');
    Add('       s.uppertitreserie,');
    Add('       a.achat,');
    Add('       a.complet,');
    Add('       coalesce(a.initialetitrealbum, s.initialetitreserie),');
    Add('       s.initialetitreserie');
    Add('from /*DB_PREFIX*/albums a left join /*DB_PREFIX*/series s on s.id_serie = a.id_serie');
    Add(';');
    Add('@@');

    Add('create view /*DB_PREFIX*/vw_liste_editeurs_albums(');
    Add('    id_album,');
    Add('    titrealbum,');
    Add('    tome,');
    Add('    tomedebut,');
    Add('    tomefin,');
    Add('    horsserie,');
    Add('    integrale,');
    Add('    moisparution,');
    Add('    anneeparution,');
    Add('    id_serie,');
    Add('    titreserie,');
    Add('    uppertitrealbum,');
    Add('    id_editeur,');
    Add('    nomediteur,');
    Add('    uppernomediteur,');
    Add('    uppertitreserie,');
    Add('    achat,');
    Add('    complet)');
    Add('as');
    Add('select a.id_album,');
    Add('       a.titrealbum,');
    Add('       a.tome,');
    Add('       a.tomedebut,');
    Add('       a.tomefin,');
    Add('       a.horsserie,');
    Add('       a.integrale,');
    Add('       a.moisparution,');
    Add('       a.anneeparution,');
    Add('       a.id_serie,');
    Add('       a.titreserie,');
    Add('       a.uppertitrealbum,');
    Add('       e.id_editeur,');
    Add('       e.nomediteur,');
    Add('       e.uppernomediteur,');
    Add('       a.uppertitreserie,');
    Add('       a.achat,');
    Add('       a.complet');
    Add('from /*DB_PREFIX*/vw_liste_albums a left join /*DB_PREFIX*/editions ed on ed.id_album = a.id_album');
    Add('                       left join /*DB_PREFIX*/editeurs e on e.id_editeur = ed.id_editeur');
    Add(';');
    Add('@@');

    Add('create view /*DB_PREFIX*/vw_liste_collections_albums(');
    Add('    id_album,');
    Add('    titrealbum,');
    Add('    tome,');
    Add('    tomedebut,');
    Add('    tomefin,');
    Add('    horsserie,');
    Add('    integrale,');
    Add('    moisparution,');
    Add('    anneeparution,');
    Add('    id_serie,');
    Add('    titreserie,');
    Add('    uppertitrealbum,');
    Add('    id_collection,');
    Add('    nomcollection,');
    Add('    uppernomcollection,');
    Add('    uppertitreserie,');
    Add('    achat,');
    Add('    complet)');
    Add('as');
    Add('select a.id_album,');
    Add('       a.titrealbum,');
    Add('       a.tome,');
    Add('       a.tomedebut,');
    Add('       a.tomefin,');
    Add('       a.horsserie,');
    Add('       a.integrale,');
    Add('       a.moisparution,');
    Add('       a.anneeparution,');
    Add('       a.id_serie,');
    Add('       a.titreserie,');
    Add('       a.uppertitrealbum,');
    Add('       c.id_collection,');
    Add('       c.nomcollection,');
    Add('       c.uppernomcollection,');
    Add('       a.uppertitreserie,');
    Add('       a.achat,');
    Add('       a.complet');
    Add('from /*DB_PREFIX*/vw_liste_albums a left join /*DB_PREFIX*/editions e on e.id_album = a.id_album');
    Add('                       left join /*DB_PREFIX*/collections c on e.id_collection = c.id_collection');
    Add(';');
    Add('@@');

    Add('create view /*DB_PREFIX*/vw_liste_genres_albums(');
    Add('    id_album,');
    Add('    titrealbum,');
    Add('    tome,');
    Add('    tomedebut,');
    Add('    tomefin,');
    Add('    horsserie,');
    Add('    integrale,');
    Add('    moisparution,');
    Add('    anneeparution,');
    Add('    id_serie,');
    Add('    titreserie,');
    Add('    uppertitrealbum,');
    Add('    id_genre,');
    Add('    genre,');
    Add('    uppergenre,');
    Add('    uppertitreserie,');
    Add('    achat,');
    Add('    complet)');
    Add('as');
    Add('select a.id_album,');
    Add('       a.titrealbum,');
    Add('       a.tome,');
    Add('       a.tomedebut,');
    Add('       a.tomefin,');
    Add('       a.horsserie,');
    Add('       a.integrale,');
    Add('       a.moisparution,');
    Add('       a.anneeparution,');
    Add('       a.id_serie,');
    Add('       a.titreserie,');
    Add('       a.uppertitrealbum,');
    Add('       g.id_genre,');
    Add('       g.genre,');
    Add('       g.uppergenre,');
    Add('       a.uppertitreserie,');
    Add('       a.achat,');
    Add('       a.complet');
    Add('from /*DB_PREFIX*/vw_liste_albums a left join /*DB_PREFIX*/genreseries gs on gs.id_serie = a.id_serie');
    Add('                       left join /*DB_PREFIX*/genres g on gs.id_genre = g.id_genre');
    Add(';');
    Add('@@');
  end;
end;

initialization
  RegisterMySQLUpdate('1.0.0.0', @MAJ1_0_0_0);

end.

