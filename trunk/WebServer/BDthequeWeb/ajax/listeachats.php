﻿<?
include_once '../routines.php';
?>
<div class='entete height60'>
	<H1>Prévisions d'achats</H1>
<?
$sql = 'select id_album, titrealbum, tome, tomedebut, tomefin, horsserie, integrale, moisparution, anneeparution, id_serie, titreserie, achat, complet from /*DB_PREFIX*/vw_liste_albums where achat = 1 order by uppertitreserie, horsserie, integrale, tome, anneeparution, moisparution, uppertitrealbum';
$rs = load_sql($sql);
?>
	<TABLE width=100%>
		<TR>
			<TH class=TitreAlbum>Album</TH>
			<TH width=10></TH>
			<TH>Série</TH>
		</TR>
	</TABLE>
</div>
<div class='body top60'>
	<TABLE width=100%>
<?
	$c = 0;
	while ($row = mysql_fetch_object($rs)) 
	{
?>
		<TR<?echo $c++ % 2?' bgcolor=#e5e5ff':''?>>
			<TD class=TitreAlbum><? echo AjaxLink('album', $row->id_album, display_titrealbum($row))?></TD>
			<TD width=10></TD>
			<TD class=Serie><? echo AjaxLink('serie', $row->id_serie, display_titreserie($row), 'série')?></TD>
		</TR>
<?
	}
?>
	</TABLE>
</div>