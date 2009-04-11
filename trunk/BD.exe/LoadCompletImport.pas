unit LoadCompletImport;

interface

uses
  Windows, SysUtils, Classes, LoadComplet, Generics.Collections, Graphics;

procedure ImportUpdate(Album: TAlbumComplet);
procedure ImportNew(Album: TAlbumComplet);

function AddImageFromURL(Edition: TEditionComplete; const URL: string; TypeImage: Integer): Integer;

implementation

uses
  UIB, Commun, VirtualTree, UfrmControlImport, Controls, UdmPrinc, WinInet,
  UHistorique, Proc_Gestions, Editions, UfrmValidationImport, UNet,
  TypeRec, CommonConst, Procedures, UMetadata, Divers;

procedure Import(Self: TAlbumComplet; isUpdate: Boolean);
var
  Qry: TUIBQuery;

  function SearchAssociation(Texte: string; TypeData: TVirtualMode; out Always: Boolean; ParentID: TGUID): TGUID;
  begin
    Result := GUID_NULL;

    if Trim(Texte) = '' then
    begin
      Result := GUID_FULL;
      Always := True;
      Exit;
    end;

    Qry.SQL.Text := 'select id, always from import_associations where chaine = :chaine and typedata = :typedata and parentid = :parentid';
    Qry.Prepare(True);
    Qry.Params.AsString[0] := Copy(Texte, 1, Qry.Params.SQLLen[0]);
    Qry.Params.AsInteger[1] := Integer(TypeData);
    Qry.Params.AsString[2] := GUIDToString(ParentID);
    Qry.Open;
    if not Qry.Eof and Qry.Bof then
    begin
      Result := StringToGUID(Qry.Fields.AsString[0]);
      Always := Qry.Fields.AsInteger[1] = 1;
    end;
  end;

  function CheckValue(Texte: string; TypeData: TVirtualMode; ParentID: TGUID; Objet: TObjetComplet = nil): TGUID; overload;
  var
    Toujours: Boolean;
  begin
    Result := SearchAssociation(Texte, TypeData, Toujours, ParentID);
    if not IsEqualGuid(Result, GUID_NULL) and Toujours then
      Exit;

    with TfrmControlImport.Create(nil) do
      try
        Mode := TypeData;
        framVTEdit1.ParentValue := ParentID;
        ObjetImport := Objet;
        Label2.Caption := Texte;
        if not IsEqualGuid(Result, GUID_NULL) then
          framVTEdit1.CurrentValue := Result
        else
        begin
          // on recherche le premier item correspondant
          framVTEdit1.VTEdit.Text := Texte;
          // on force l'edit � afficher le texte de l'item s�lectionn�
          framVTEdit1.VTEdit.CurrentValue := framVTEdit1.VTEdit.PopupWindow.TreeView.CurrentValue;
        end;

        Result := GUID_NULL; // on r�initialise pour �tre s�r de ne pas avoir de retour en cas d'annulatfion
        case ShowModalEx of
          mrCancel: Exit;
          mrIgnore:
          begin
            Result := GUID_FULL;
            Exit;
          end;
        end;

        // pourquoi on doit passer par une variable interm�diaire � cause des collections restera                         un grand myst�re pour moi
        // Result := framVTEdit1.CurrentValue;
        Result := SelectedValue;

        Qry.SQL.Text := 'update or insert into import_associations (chaine, id, parentid, typedata, always) values (:chaine, :id, :parentid, :typedata, :always)';
        Qry.Prepare(True);
        Qry.Params.AsString[0] := Copy(Texte, 1, Qry.Params.SQLLen[0]);
        Qry.Params.AsString[1] := GuidToString(Result);
        Qry.Params.AsString[2] := GuidToString(ParentID);
        Qry.Params.AsInteger[3] := Integer(TypeData);
        Qry.Params.AsBoolean[4] := CheckBox1.Checked;
        Qry.Execute;
      finally
        Free;
      end;
    Qry.Transaction.Commit;
  end;

  function CheckValue(Texte: string; TypeData: TVirtualMode): TGUID; inline; overload;
  begin
    Result := CheckValue(Texte, TypeData, GUID_NULL);
  end;

  function CheckListAuteurs(List: TObjectList<TAuteur>; OtherList: array of TObjectList<TAuteur>): Boolean;

    procedure RemoveAuteur(Index: integer);
    var
      i, j: Integer;
      nom: string;
    begin
      nom := List[Index].Personne.Nom;
      for i := Low(OtherList) to High(OtherList) do
        for j := Pred(OtherList[i].Count) downto 0 do
          if SameText(OtherList[i][j].Personne.Nom, Nom) then
            OtherList[i].Delete(j);
      List.Delete(Index);
    end;

  var
    dummyID: TGUID;

    procedure AcceptAuteur(Index: Integer);
    var
      i, j: Integer;
      nom: string;
    begin
      nom := List[Index].Personne.Nom;
      for i := Low(OtherList) to High(OtherList) do
        for j := Pred(OtherList[i].Count) downto 0 do
          if SameText(OtherList[i][j].Personne.Nom, Nom) then
            OtherList[i][j].Personne.Fill(dummyID);
      List[Index].Personne.Fill(dummyID);
    end;

  var
    i: Integer;
  begin
    Result := False;
    for i := Pred(List.Count) downto 0 do
      if IsEqualGUID(List[i].Personne.ID, GUID_NULL) then
      begin
        dummyID := CheckValue(List[i].Personne.Nom, vmPersonnes);
        if IsEqualGUID(dummyID, GUID_NULL) then
          Exit;
        if IsEqualGUID(dummyID, GUID_FULL) then
          RemoveAuteur(i)
        else
          AcceptAuteur(i);
      end;
    Result := True;
  end;

var
  dummyID: TGUID;
  i, j: Integer;
  PA: TAuteur;
  DefaultEdition, Edition: TEditionComplete;
begin
  with Self do
  begin
    with TfrmValidationImport.Create(nil) do
      try
        Album := Self;
        if ShowModal <> mrOk then
          Exit;
      finally
        Free;
      end;

    Qry := TUIBQuery.Create(nil);
    try
      Qry.Transaction := GetTransaction(DMPrinc.UIBDataBase);

      if not CheckListAuteurs(Scenaristes, [Dessinateurs, Coloristes, Serie.Scenaristes, Serie.Dessinateurs, Serie.Coloristes]) then
        Exit;
      if not CheckListAuteurs(Dessinateurs, [Coloristes, Serie.Scenaristes, Serie.Dessinateurs, Serie.Coloristes]) then
        Exit;
      if not CheckListAuteurs(Coloristes, [Serie.Scenaristes, Serie.Dessinateurs, Serie.Coloristes]) then
        Exit;

      if not CheckListAuteurs(Serie.Scenaristes, [Serie.Dessinateurs, Serie.Coloristes]) then
        Exit;
      if not CheckListAuteurs(Serie.Dessinateurs, [Serie.Coloristes]) then
        Exit;
      if not CheckListAuteurs(Serie.Coloristes, []) then
        Exit;

      for i := Pred(Serie.Genres.Count) downto 0 do
        if IsEqualGUID(StringToGUIDDef(Serie.Genres.Names[i], GUID_NULL), GUID_NULL) then
        begin
          dummyID := CheckValue(Serie.Genres[i], vmGenres);
          if IsEqualGUID(dummyID, GUID_NULL) then
            Exit;
          if IsEqualGUID(dummyID, GUID_FULL) then
            Serie.Genres.Delete(i)
          else
            Serie.Genres[i] := GUIDToString(dummyID) + '=' + Serie.Genres[i];
        end;

      if IsEqualGUID(Serie.Editeur.ID_Editeur, GUID_NULL) then
      begin
        dummyID := CheckValue(Serie.Editeur.NomEditeur, vmEditeurs, GUID_NULL, Serie.Editeur);
        if IsEqualGUID(dummyID, GUID_NULL) then
          Exit;
        if not IsEqualGUID(dummyID, GUID_FULL) then
        begin
          for j := 0 to Pred(Editions.Editions.Count) do
            if SameText(Serie.Editeur.NomEditeur, Editions.Editions[j].Editeur.NomEditeur) then
            begin
              Editions.Editions[j].Editeur.Fill(dummyID);
              Editions.Editions[j].Collection.Editeur.Fill(dummyID);
            end;
          Serie.Editeur.Fill(dummyID);
        end;
      end;

      if (Serie.Collection.NomCollection <> '') and IsEqualGUID(Serie.Collection.ID, GUID_NULL) then
      begin
        dummyID := CheckValue(Serie.Collection.NomCollection, vmCollections, dummyID);
        if IsEqualGUID(dummyID, GUID_NULL) then
          Exit;
        if not IsEqualGUID(dummyID, GUID_FULL) then
        begin
          for j := 0 to Pred(Editions.Editions.Count) do
            if SameText(Serie.Collection.NomCollection, Editions.Editions[j].Collection.NomCollection) then
              Editions.Editions[j].Collection.Fill(dummyID);
          Serie.Collection.Fill(dummyID);
        end;
      end;

      dummyID := CheckValue(Serie.Titre, vmSeries, GUID_NULL, Serie);
      if IsEqualGUID(dummyID, GUID_NULL) then
        Exit;
      if not IsEqualGUID(dummyID, GUID_FULL) then
      begin
        ID_Serie := dummyID;

        if Scenaristes.Count + Dessinateurs.Count + Coloristes.Count = 0 then
        begin
          for i := 0 to Pred(Serie.Scenaristes.Count) do
          begin
            PA := TAuteur.Create;
            PA.Fill(Serie.Scenaristes[i].Personne, ID_Album, GUID_NULL, TMetierAuteur(0));
            Scenaristes.Add(PA);
          end;

          for i := 0 to Pred(Serie.Dessinateurs.Count) do
          begin
            PA := TAuteur.Create;
            PA.Fill(Serie.Dessinateurs[i].Personne, ID_Album, GUID_NULL, TMetierAuteur(0));
            Dessinateurs.Add(PA);
          end;

          for i := 0 to Pred(Serie.Coloristes.Count) do
          begin
            PA := TAuteur.Create;
            PA.Fill(Serie.Coloristes[i].Personne, ID_Album, GUID_NULL, TMetierAuteur(0));
            Coloristes.Add(PA);
          end;
        end;
      end;

      DefaultEdition := TEditionComplete.Create(GUID_NULL);
      try
        for i := 0 to Pred(Editions.Editions.Count) do
        begin
          Edition := Editions.Editions[i];
          if not IsEqualGUID(ID_Serie, GUID_FULL) then
          begin
            if Edition.Couleur = DefaultEdition.Couleur then
              Edition.Couleur := IIf(Serie.Couleur = -1, DefaultEdition.Couleur, Serie.Couleur = 1);
            if Edition.VO = DefaultEdition.VO then
              Edition.VO := IIf(Serie.VO = -1, DefaultEdition.VO, Serie.VO = 1);
            if Edition.Etat.Value = DefaultEdition.Etat.Value then
              Edition.Etat := MakeOption(IIf(Serie.Etat.Value = -1, DefaultEdition.Etat.Value, Serie.Etat.Value), '');
            if Edition.Reliure.Value = DefaultEdition.Reliure.Value then
              Edition.Reliure := MakeOption(IIf(Serie.Reliure.Value = -1, DefaultEdition.Reliure.Value, Serie.Reliure.Value), '');
            if Edition.Orientation.Value = DefaultEdition.Orientation.Value then
              Edition.Orientation := MakeOption(IIf(Serie.Orientation.Value = -1, DefaultEdition.Orientation.Value, Serie.Orientation.Value), '');
            if Edition.FormatEdition.Value = DefaultEdition.FormatEdition.Value then
              Edition.FormatEdition := MakeOption(IIf(Serie.FormatEdition.Value = -1, DefaultEdition.FormatEdition.Value, Serie.FormatEdition.Value), '');
            if Edition.SensLecture.Value = DefaultEdition.SensLecture.Value then
              Edition.SensLecture := MakeOption(IIf(Serie.SensLecture.Value = -1, DefaultEdition.SensLecture.Value, Serie.SensLecture.Value), '');
            if Edition.TypeEdition.Value = DefaultEdition.TypeEdition.Value then
              Edition.TypeEdition := MakeOption(IIf(Serie.TypeEdition.Value = -1, DefaultEdition.TypeEdition.Value, Serie.TypeEdition.Value), '');
          end;

          if IsEqualGUID(Edition.Editeur.ID_Editeur, GUID_NULL) then
          begin
            dummyID := CheckValue(Edition.Editeur.NomEditeur, vmEditeurs, GUID_NULL, Edition.Editeur);
            if IsEqualGUID(dummyID, GUID_NULL) then
              Exit;
            if not IsEqualGUID(dummyID, GUID_FULL) then
            begin
              Edition.Editeur.Fill(dummyID);
              Edition.Collection.Editeur.Fill(dummyID);
            end;
          end;

          if IsEqualGUID(Edition.Collection.ID, GUID_NULL) then
          begin
            if Edition.Collection.NomCollection <> '' then
            begin
              dummyID := CheckValue(Edition.Collection.NomCollection, vmCollections, dummyID);
              if IsEqualGUID(dummyID, GUID_NULL) then
                Exit;
              if not IsEqualGUID(dummyID, GUID_FULL) then
                Edition.Collection.Fill(dummyID);
            end;
          end;
        end;
      finally
        DefaultEdition.Free;
      end;

      Qry.Transaction.Commit;
    finally
      Qry.Transaction.Free;
      Qry.Free;
    end;

    if not isUpdate then
    begin
      if IsEqualGUID(ID_Album, GUID_NULL) then
        New(False);
      CreationAlbum(Self);
    end;
  end;
end;

procedure ImportUpdate(Album: TAlbumComplet);
begin
  Import(Album, True);
end;

procedure ImportNew(Album: TAlbumComplet);
begin
  Import(Album, False);
end;

function AddImageFromURL(Edition: TEditionComplete; const URL: string; TypeImage: Integer): Integer;
var
  Stream: TFileStream;
  Couverture: TCouverture;
  tmpFile: string;
  P: PChar;
  sl: TStringList;
begin
  Result := -1;

  SetLength(tmpFile, MAX_PATH + 1);
  FillMemory(@tmpFile[1], Length(tmpFile) * SizeOf(Char), 1);
  GetTempFileName(TempPath, 'bdk', 0, @tmpFile[1]);
  P := @tmpFile[1];
  while P^ <> #0 do
    Inc(P);
  SetLength(tmpFile, (Integer(P) - Integer(@tmpFile[1])) div SizeOf(Char));

  if FileExists(tmpFile) then
    Stream := TFileStream.Create(tmpFile, fmOpenReadWrite, fmShareExclusive)
  else
    Stream := TFileStream.Create(tmpFile, fmCreate, fmShareExclusive);
  try
    if LoadStreamURL(URL, [], Stream) <> 200 then
      Exit;
  finally
    Stream.Free;
  end;

  Couverture := TCouverture.Create;
  Result := Edition.Couvertures.Add(Couverture);
  Couverture.NewNom := tmpFile;
  Couverture.OldNom := Couverture.NewNom;
  Couverture.NewStockee := TGlobalVar.Utilisateur.Options.ImagesStockees;
  Couverture.OldStockee := Couverture.NewStockee;
  Couverture.Categorie := TypeImage;
  sl := TStringList.Create;
  try
    // c'est pas g�nial de recharger la liste � chaque fois mais �a �vite du code usine � gaz
    LoadStrings(6, sl);
    Couverture.sCategorie := sl.Values[IntToStr(TypeImage)];
  finally
    sl.Free;
  end;
end;

end.