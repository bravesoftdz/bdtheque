unit UMAJ2_2_3_16;

interface

implementation

uses
  SysUtils, UIB, UIBLib, Updates;

procedure MAJ2_2_3_16(Query: TUIBScript);
begin
  with Query do
  begin
    Script.Clear;

    Script.Add('alter table albums add id_univers t_guid, add id_univers_racine t_guid;');
    Script.Add('alter table series add id_univers t_guid, add id_univers_racine t_guid;');
    Script.Add('alter table parabd add id_univers t_guid, add id_univers_racine t_guid;');

    Script.Add('create domain t_siteweb as varchar(255) character set utf8 collate utf8;');

    Script.Add('create table univers (');
    Script.Add('  id_univers t_guid_notnull,');
    Script.Add('  nomunivers t_nom_utf8 not null,');
    Script.Add('  description t_description_utf8,');
    Script.Add('  initialenomunivers t_initiale_utf8,');
    Script.Add('  siteweb t_siteweb,');
    Script.Add('  id_univers_parent t_guid,');
    Script.Add('  id_univers_racine t_guid,');
    Script.Add('  dc_univers t_timestamp_notnull,');
    Script.Add('  dm_univers t_timestamp_notnull');
    Script.Add(');');

    Script.Add('alter table univers add constraint pk_univers primary key (id_univers);');

    Script.Add('create or alter trigger univers_uniqid_biu0 for univers');
    Script.Add('active before insert or update position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  if (new.id_univers is null) then new.id_univers = old.id_univers;');
    Script.Add('  if (new.id_univers is null) then new.id_univers = udf_createguid();');
    Script.Add('');
    Script.Add('  if (new.dc_univers is null) then new.dc_univers = old.dc_univers;');
    Script.Add('');
    Script.Add('  new.dm_univers = cast(''now'' as timestamp);');
    Script.Add('  if (inserting or new.dc_univers is null) then new.dc_univers = new.dm_univers;');
    Script.Add('end;');

    Script.Add('create or alter trigger univers_dv for univers');
    Script.Add('active before insert or update position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  if (new.nomunivers is distinct from old.nomunivers) then begin');
    Script.Add('    select initiale from get_initiale(new.nomunivers) into new.initialenomunivers;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (new.id_univers_parent is null) then');
    Script.Add('    new.id_univers_racine = new.id_univers;');
    Script.Add('  else');
    Script.Add('    if (new.id_univers_parent is distinct from old.id_univers_parent) then');
    Script.Add('      select');
    Script.Add('        id_univers_racine');
    Script.Add('      from');
    Script.Add('        univers');
    Script.Add('      where');
    Script.Add('        id_univers = new.id_univers_parent');
    Script.Add('      into');
    Script.Add('        new.id_univers_racine;');
    Script.Add('end;');

    Script.Add('create or alter trigger univers_univers_ref for univers');
    Script.Add('active after update or delete position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  if (deleting) then');
    Script.Add('  begin');
    Script.Add('    update univers set id_univers_parent = old.id_univers_parent where id_univers_parent = old.id_univers;');
    Script.Add('    update series set id_univers = null, id_univers_racine = null where id_univers = old.id_univers;');
    Script.Add('    update albums set id_univers = null, id_univers_racine = null where id_univers = old.id_univers;');
    Script.Add('    update parabd set id_univers = null, id_univers_racine = null where id_univers = old.id_univers;');
    Script.Add('  end');
    Script.Add('  if (updating) then');
    Script.Add('  begin');
    Script.Add('    if (new.id_univers_racine is distinct from old.id_univers_racine) then begin');
    Script.Add('      update univers set id_univers_racine = new.id_univers_racine where id_univers_parent = new.id_univers and id_univers_racine is distinct from new.id_univers_racine;');
    Script.Add('      update series set id_univers_racine = new.id_univers_racine where id_univers = new.id_univers and id_univers_racine is distinct from new.id_univers_racine;');
    Script.Add('      update albums set id_univers_racine = new.id_univers_racine where id_univers = new.id_univers and id_univers_racine is distinct from new.id_univers_racine;');
    Script.Add('      update parabd set id_univers_racine = new.id_univers_racine where id_univers = new.id_univers and id_univers_racine is distinct from new.id_univers_racine;');
    Script.Add('    end');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('create or alter trigger univers_logsup_ad0 for univers');
    Script.Add('active after delete position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  insert into suppressions(tablename, fieldname, id) values (''UNIVERS'', ''id_univers'', old.id_univers);');
    Script.Add('end;');

    Script.Add('create or alter trigger series_dv for series');
    Script.Add('active before insert or update position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  if (new.titreserie is distinct from old.titreserie) then begin');
    Script.Add('    new.soundextitreserie = udf_soundex(new.titreserie, 1);');
    Script.Add('    select initiale from get_initiale(new.titreserie) into new.initialetitreserie;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (new.id_univers is distinct from old.id_univers) then begin');
    Script.Add('    if (new.id_univers is null) then');
    Script.Add('      new.id_univers_racine = null;');
    Script.Add('    else');
    Script.Add('      select id_univers_racine from univers where id_univers = new.id_univers into new.id_univers_racine;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('create or alter trigger series_au0 for series');
    Script.Add('active after update position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  if (new.id_univers is distinct from old.id_univers) then begin');
    Script.Add('    update albums set id_univers = new.id_univers where id_serie = new.id_serie;');
    Script.Add('    update parabd set id_univers = new.id_univers where id_serie = new.id_serie;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('create or alter trigger parabd_dv for parabd');
    Script.Add('active before insert or update position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  if (new.titreparabd is null) then');
    Script.Add('  begin');
    Script.Add('    new.soundextitreparabd = null;');
    Script.Add('    new.initialetitreparabd = null;');
    Script.Add('  end else');
    Script.Add('  if (new.titreparabd is distinct from old.titreparabd) then');
    Script.Add('  begin');
    Script.Add('    new.soundextitreparabd = udf_soundex(new.titreparabd, 1);');
    Script.Add('    select initiale from get_initiale(new.titreparabd) into new.initialetitreparabd;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (new.id_serie is distinct from old.id_serie) then');
    Script.Add('  begin');
    Script.Add('    if (new.id_serie is null) then');
    Script.Add('      new.id_univers = null;');
    Script.Add('    else');
    Script.Add('      select id_univers from series where id_serie = new.id_serie into new.id_univers;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (new.id_univers is distinct from old.id_univers) then');
    Script.Add('  begin');
    Script.Add('    if (new.id_univers is null) then');
    Script.Add('      new.id_univers_racine = null;');
    Script.Add('    else');
    Script.Add('      select id_univers_racine from univers where id_univers = new.id_univers into new.id_univers_racine;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('create or alter trigger albums_dv for albums');
    Script.Add('active before insert or update position 0');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  if (new.titrealbum is null) then begin');
    Script.Add('    new.soundextitrealbum = null;');
    Script.Add('    new.initialetitrealbum = null;');
    Script.Add('  end else');
    Script.Add('  if (new.titrealbum is distinct from old.titrealbum) then begin');
    Script.Add('    new.soundextitrealbum = udf_soundex(new.titrealbum, 1);');
    Script.Add('    select initiale from get_initiale(new.titrealbum) into new.initialetitrealbum;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (new.id_serie is distinct from old.id_serie) then');
    Script.Add('  begin');
    Script.Add('    if (new.id_serie is null) then');
    Script.Add('      new.id_univers = null;');
    Script.Add('    else');
    Script.Add('      select id_univers from series where id_serie = new.id_serie into new.id_univers;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (new.id_univers is distinct from old.id_univers) then');
    Script.Add('  begin');
    Script.Add('    if (new.id_univers is null) then');
    Script.Add('      new.id_univers_racine = null;');
    Script.Add('    else');
    Script.Add('      select id_univers_racine from univers where id_univers = new.id_univers into new.id_univers_racine;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('drop trigger albums_idserie_biu;');

    Script.Add('create or alter view vw_initiales_univers(');
    Script.Add('    initialenomunivers,');
    Script.Add('    countinitiale)');
    Script.Add('as');
    Script.Add('select');
    Script.Add('  initialenomunivers, count(id_univers)');
    Script.Add('from');
    Script.Add('  univers');
    Script.Add('group by');
    Script.Add('  initialenomunivers');
    Script.Add(';');

    Script.Add('create or alter view vw_liste_albums(');
    Script.Add('    id_album,');
    Script.Add('    titrealbum,');
    Script.Add('    tome,');
    Script.Add('    tomedebut,');
    Script.Add('    tomefin,');
    Script.Add('    horsserie,');
    Script.Add('    integrale,');
    Script.Add('    moisparution,');
    Script.Add('    anneeparution,');
    Script.Add('    id_serie,');
    Script.Add('    titreserie,');
    Script.Add('    achat,');
    Script.Add('    complet,');
    Script.Add('    notation,');
    Script.Add('    initialetitrealbum,');
    Script.Add('    initialetitreserie,');
    Script.Add('    id_univers,');
    Script.Add('    nomunivers,');
    Script.Add('    id_univers_racine)');
    Script.Add('as');
    Script.Add('select');
    Script.Add('  a.id_album, a.titrealbum, a.tome, a.tomedebut, a.tomefin, a.horsserie, a.integrale, a.moisparution, a.anneeparution,');
    Script.Add('  a.id_serie, s.titreserie, a.achat, a.complet, a.notation, coalesce(a.initialetitrealbum, s.initialetitreserie),');
    Script.Add('  s.initialetitreserie, a.id_univers, u.nomunivers, a.id_univers_racine');
    Script.Add('from');
    Script.Add('  albums a');
    Script.Add('  left join series s on');
    Script.Add('    s.id_serie = a.id_serie');
    Script.Add('  left join univers u on');
    Script.Add('    u.id_univers = a.id_univers');
    Script.Add(';');

    Script.Add('create or alter procedure albums_by_univers (');
    Script.Add('    in_id_univers type of column univers.id_univers,');
    Script.Add('    filtre varchar(125) character set none)');
    Script.Add('returns (');
    Script.Add('    id_album type of column albums.id_album,');
    Script.Add('    titrealbum type of column albums.titrealbum,');
    Script.Add('    tome type of column albums.tome,');
    Script.Add('    tomedebut type of column albums.tomedebut,');
    Script.Add('    tomefin type of column albums.tomefin,');
    Script.Add('    horsserie type of column albums.horsserie,');
    Script.Add('    integrale type of column albums.integrale,');
    Script.Add('    moisparution type of column albums.moisparution,');
    Script.Add('    anneeparution type of column albums.anneeparution,');
    Script.Add('    notation type of column albums.notation,');
    Script.Add('    id_serie type of column albums.id_serie,');
    Script.Add('    titreserie type of column series.titreserie,');
    Script.Add('    achat type of column albums.achat,');
    Script.Add('    complet type of column albums.complet,');
    Script.Add('    id_univers type of column albums.id_univers,');
    Script.Add('    id_univers_racine type of column albums.id_univers)');
    Script.Add('as');
    Script.Add('declare variable swhere varchar(130);');
    Script.Add('begin');
    Script.Add('  if (:in_id_univers = cast('''' as char(38))) then');
    Script.Add('    swhere = ''id_univers is null '';');
    Script.Add('  else');
    Script.Add('    swhere = ''id_univers = '''''' || :in_id_univers || '''''' '';');
    Script.Add('  if (filtre is not null and filtre <> '''') then');
    Script.Add('    swhere = swhere || ''and '' || filtre || '' '';');
    Script.Add('  for execute statement');
    Script.Add('    ''select');
    Script.Add('      id_album, titrealbum, tome, tomedebut, tomefin, horsserie,');
    Script.Add('      integrale, moisparution, anneeparution, notation, id_serie,');
    Script.Add('      titreserie, achat, complet, id_univers, id_univers_racine');
    Script.Add('    from');
    Script.Add('      vw_liste_albums');
    Script.Add('    where');
    Script.Add('      '' || :swhere || ''');
    Script.Add('    order by');
    Script.Add('      horsserie nulls first, integrale nulls first, tome nulls first,');
    Script.Add('      anneeparution nulls first, moisparution nulls first, titrealbum''');
    Script.Add('    into');
    Script.Add('      :id_album, :titrealbum, :tome, :tomedebut, :tomefin, :horsserie,');
    Script.Add('      :integrale, :moisparution, :anneeparution, :notation, :id_serie,');
    Script.Add('      :titreserie, :achat, :complet, :id_univers, :id_univers_racine');
    Script.Add('  do');
    Script.Add('  begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('create or alter procedure univers_by_initiale (');
    Script.Add('    initiale t_initiale_utf8)');
    Script.Add('returns (');
    Script.Add('    id_univers type of column univers.id_univers,');
    Script.Add('    nomunivers type of column univers.nomunivers)');
    Script.Add('as');
    Script.Add('begin');
    Script.Add('  for');
    Script.Add('    select');
    Script.Add('      id_univers, nomunivers');
    Script.Add('    from');
    Script.Add('      univers');
    Script.Add('    where');
    Script.Add('      initialenomunivers = :initiale');
    Script.Add('    order by');
    Script.Add('      nomunivers');
    Script.Add('    into');
    Script.Add('      :id_univers, :nomunivers');
    Script.Add('  do');
    Script.Add('    suspend;');
    Script.Add('end;');

    Script.Add('create or alter procedure univers_albums (');
    Script.Add('    filtre varchar(125) character set none)');
    Script.Add('returns (');
    Script.Add('    nomunivers type of column univers.nomunivers,');
    Script.Add('    countunivers integer,');
    Script.Add('    id_univers type of column univers.id_univers)');
    Script.Add('as');
    Script.Add('declare variable swhere varchar(132);');
    Script.Add('begin');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then');
    Script.Add('    swhere = ''and '' || filtre;');
    Script.Add('');
    Script.Add('  for execute statement');
    Script.Add('    ''select');
    Script.Add('      nomunivers, id_univers, count(id_album)');
    Script.Add('    from');
    Script.Add('      vw_liste_albums');
    Script.Add('    where');
    Script.Add('      id_univers is not null '' || swhere || ''');
    Script.Add('    group by');
    Script.Add('      nomunivers, id_univers''');
    Script.Add('    into');
    Script.Add('      :nomunivers, :id_univers, :countunivers');
    Script.Add('  do');
    Script.Add('    suspend;');
    Script.Add('end;');

{$IFDEF DEBUG}
    Script.Add('insert into univers (id_univers, nomunivers, id_univers_parent) values (''{B68B648F-557A-46E7-A748-2E7AD8BA3237}'', ''1'', null);');
    Script.Add('insert into univers (id_univers, nomunivers, id_univers_parent) values (''{CCAD0B74-34BA-4700-8845-5887CB7D6F71}'', ''2'', null);');
    Script.Add('insert into univers (id_univers, nomunivers, id_univers_parent) values (''{035B1F45-B3B2-4714-9B29-9F700F22AB77}'', ''3_2'', ''{CCAD0B74-34BA-4700-8845-5887CB7D6F71}'');');
    Script.Add('insert into univers (id_univers, nomunivers, id_univers_parent) values (''{8C61EE3C-3CA5-4B95-97C0-F458FE03935B}'', ''4_2'', ''{CCAD0B74-34BA-4700-8845-5887CB7D6F71}'');');
    Script.Add('insert into univers (id_univers, nomunivers, id_univers_parent) values (''{E71C8D22-8232-4ED2-8059-4219E4AFA374}'', ''5_3_2'', ''{035B1F45-B3B2-4714-9B29-9F700F22AB77}'');');
{$ENDIF}

    ExecuteScript;
  end;
end;

initialization

RegisterFBUpdate('2.2.3.16', @MAJ2_2_3_16);

end.
