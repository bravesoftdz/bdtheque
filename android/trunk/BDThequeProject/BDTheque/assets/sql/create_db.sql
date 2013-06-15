create table albums (
    id_album            char(38) not null primary key,
    moisparution        SMALLINT,
    anneeparution       SMALLINT,
    id_serie            char(38),
    tome                smallint default null,
    tomedebut           smallint,
    tomefin             smallint,
    horsserie           smallint default 0,
    integrale           smallint default 0,
    achat               smallint default 0,
    nbeditions          INTEGER DEFAULT 0,
    -- complet             COMPUTED BY (case when NBEDITIONS > 0 then 1 else 0 end),
    initialetitrealbum  char(1),
    dc_albums           timestamp not null,
    dm_albums           timestamp not null,
    titrealbum          varchar(150),
    soundextitrealbum   varchar(150),
    notation            smallint,
    sujetalbum          text,
    remarquesalbum      text
);

create table editeurs (
    id_editeur          char(38) not null primary key,
    initialenomediteur  char(1) not null,
    dc_editeurs         timestamp not null,
    dm_editeurs         timestamp not null,
    nomediteur          varchar(50),
    siteweb             varchar(255)
);

create table collections (
    id_collection          char(38) not null primary key,
    id_editeur             char(38) not null,
    initialenomcollection  char(1) not null,
    dc_collections         timestamp not null,
    dm_collections         timestamp not null,
    nomcollection          varchar(50) not null
);

create table series (
    id_serie            char(38) not null primary key,
    id_editeur          char(38) not null,
    id_collection       char(38),
    terminee            smallint,
    complete            smallint default 0,
    suivremanquants     smallint default 1,
    suivresorties       smallint default 1,
    initialetitreserie  char(1) not null,
    dc_series           timestamp not null,
    dm_series           timestamp not null,
    nb_albums           integer,
    vo                  smallint,
    couleur             smallint,
    titreserie          varchar(150) not null,
    soundextitreserie   varchar(150),
    notation            smallint,
    siteweb             varchar(255),
    sujetserie          text,
    remarquesserie      text,
    etat                char(38),
    reliure             char(38),
    typeedition         char(38),
    orientation         char(38),
    formatedition       char(38),
    senslecture         char(38)
);

create table personnes (
    id_personne          char(38) not null primary key,
    initialenompersonne  char(1) not null,
    dc_personnes         timestamp not null,
    dm_personnes         timestamp not null,
    nompersonne          varchar(150) not null,
    siteweb              varchar(255),
    biographie           text
);

create table auteurs (
    id_auteur    char(38) not null primary key,
    id_album     char(38) not null,
    id_personne  char(38) not null,
    metier       smallint not null,
    dc_auteurs   timestamp not null,
    dm_auteurs   timestamp not null
);

create table auteurs_series (
    id_auteur_series   char(38) not null primary key,
    id_serie           char(38) not null,
    id_personne        char(38) not null,
    metier             smallint not null,
    dc_auteurs_series  timestamp not null,
    dm_auteurs_series  timestamp not null
);
