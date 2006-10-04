library BDT_UDF;

uses
  FastMM4 in '..\..\..\..\Common\FastMM464\FastMM4.pas',
  FastMM4Messages in '..\..\..\..\Common\FastMM464\FastMM4Messages.pas',
  Windows,
  SysUtils,
  Classes,
  //  IBHeader,
  IBExternals,
  Divers in '..\..\..\..\Common\Divers.pas',
  ib_util in 'D:\Program Files\Firebird\Firebird_1_5\include\ib_util.pas',
  Math;

{$R *.res}

function CreateResult(const Chaine: string): PChar;
var
  s: string;
begin
  s := Chaine + #0;
  Result := ib_util_malloc(Length(s));
  StrCopy(Result, PChar(s));
end;

function Trim(Chaine: PChar): PChar; cdecl; export;
begin
  Result := CreateResult(SysUtils.Trim(Chaine));
end;

function Soundex(Chaine: PChar; var OrigineTitre: Integer): PChar; cdecl; export;
var
  s: string;
begin
  case OrigineTitre of
    1: s := BaseSoundex(Chaine, 'FR');
    2: s := BaseSoundex(Chaine, 'EN');
    else
      s := '';
  end;
  Result := CreateResult(s);
end;

function Upper(Chaine: PChar): PChar; cdecl; export;
begin
  Result := CreateResult(UpperCase(SansAccents(Chaine)));
end;

procedure UpperBlob(BlobIn, BlobOut: PBlob); cdecl; export;
var
  buffer: array of Char;
  LongueurLue, i: Integer;
begin
  try
    if Assigned(BlobIn.BlobHandle) and (BlobIn.SegmentCount > 0) then begin
      SetLength(buffer, BlobIn.MaxSegmentLength);
      while LongBool(BlobIn.GetSegment(BlobIn.BlobHandle, @buffer[0], BlobIn.MaxSegmentLength, LongueurLue)) do begin
        for i := 0 to LongueurLue - 1 do
          buffer[i] := UpperCase(SansAccents(buffer[i]))[1];
        BlobOut.PutSegment(BlobOut.BlobHandle, @buffer[0], LongueurLue);
      end;
    end;
  except
  end; // pour �tre s�r de ne pas faire planter le serveur !!!!
end;

function SubString(Chaine: PChar; var Position, Longueur: Integer): PChar; cdecl; export;
begin
  Result := CreateResult(Copy(Chaine, Position, Longueur));
end;

function FormatTitre(const Titre: string): string;
var
  i, j: Integer;
  Dummy: string;
begin
  Result := Titre;
  try
    i := LastDelimiter('[', Titre);
    if i > 0 then begin
      j := PosInText(i, Titre, ']');
      if j = 0 then Exit;
      Dummy := Copy(Titre, i + 1, j - i - 1);
      if Length(Dummy) > 0 then
        if Dummy[Length(Dummy)] <> '''' then Dummy := Dummy + ' ';
      Result := Dummy + Copy(Titre, 1, i - 1) + Copy(Titre, j + 1, Length(Titre));
    end;
  finally
    Result := SysUtils.Trim(Result);
  end;
end;

function FormatTitle(Titre: PChar): PChar; cdecl; export;
begin
  Result := CreateResult(FormatTitre(Titre));
end;

function CompareChaines1(Chaine1, Chaine2: PChar): Float; cdecl; export;

  function DoCompare(const S1, S2: string): Float;
  var
    i, l: Integer;
    Str1, Str2: string;
  begin
    Result := 0;
    if S1 = S2 then
      Result := 100
    else try
      if Length(S1) > Length(S2) then begin
        Str1 := S2;
        Str2 := S1;
      end
      else begin
        Str1 := S1;
        Str2 := S2;
      end;

      for l := Length(Str1) downto 1 do
        for i := 1 to Length(Str2) - l + 1 do
          if Pos(Copy(Str2, i, l), Str1) > 0 then begin
            Result := l;
            Exit;
          end;
    finally
      // on converti en %
      Result := Result / Length(Str2) * 100;
    end;
  end;

  function ChercheMeilleurTaux(const Str1, Str2: string): Float;
  var
    S1, S2, F1, F2: string;
    R: Float;
  begin
    F1 := FormatTitre(Str1);
    F2 := FormatTitre(Str2);

    S1 := OnlyAlphaNum(Str1);
    S2 := OnlyAlphaNum(Str2);
    Result := DoCompare(S1, S2);
    if Result = 100 then Exit;

    if F2 <> Str2 then begin
      S2 := OnlyAlphaNum(F2);
      R := DoCompare(S1, S2);
      if R > Result then Result := R;
      if Result = 100 then Exit;
    end;

    if F1 <> Str1 then begin
      S1 := OnlyAlphaNum(F1);
      S2 := OnlyAlphaNum(Str2);
      R := DoCompare(S1, S2);
      if R > Result then Result := R;
      if Result = 100 then Exit;

      if F2 <> Str2 then begin
        S2 := OnlyAlphaNum(F2);
        R := DoCompare(S1, S2);
        if R > Result then Result := R;
        if Result = 100 then Exit;
      end;
    end;
  end;

begin
  Result := ChercheMeilleurTaux(UpperCase(SansAccents(Chaine1)), UpperCase(SansAccents(Chaine2)));
end;

function CompareChaines2(Chaine1, Chaine2: PChar): Float; cdecl; export;

  function DoCompare(const S1, S2: string): Float;
  var
    c, i, l, L1, L2: Integer;
    Str1, Str2: string;
  begin
    Result := 0;
    if S1 = S2 then
      Result := 100
    else try
      if Length(S1) > Length(S2) then begin
        Str1 := S2;
        Str2 := S1;
      end
      else begin
        Str1 := S1;
        Str2 := S2;
      end;

      L1 := Length(Str1);
      L2 := Length(Str2);

      for i := 1 - L1 to L2 - 1 do begin
        // si on n'a plus assez de caract�res pour faire mieux on s'arr�te
        if Result >= L2 - i then Exit;

        c := 0;
        for l := Max(1, 1 - i) to Min(L1, L2 - i) do
          if Str1[l] = Str2[i + l] then Inc(c);
        if c > Result then begin
          Result := c;
          // si on a retrouv� la chaine compl�te, on ne pourra pas faire mieux
          if Result = L1 then Exit;
        end;
      end;
    finally
      // on converti en %
      Result := Result / Length(Str2) * 100;
    end;
  end;

  function ChercheMeilleurTaux(const Str1, Str2: string): Float;
  var
    S1, S2, F1, F2: string;
    R: Float;
  begin
    F1 := FormatTitre(Str1);
    F2 := FormatTitre(Str2);

    S1 := OnlyAlphaNum(Str1);
    S2 := OnlyAlphaNum(Str2);
    Result := DoCompare(S1, S2);
    if Result = 100 then Exit;

    if F2 <> Str2 then begin
      S2 := OnlyAlphaNum(F2);
      R := DoCompare(S1, S2);
      if R > Result then Result := R;
      if Result = 100 then Exit;
    end;

    if F1 <> Str1 then begin
      S1 := OnlyAlphaNum(F1);
      S2 := OnlyAlphaNum(Str2);
      R := DoCompare(S1, S2);
      if R > Result then Result := R;
      if Result = 100 then Exit;

      if F2 <> Str2 then begin
        S2 := OnlyAlphaNum(F2);
        R := DoCompare(S1, S2);
        if R > Result then Result := R;
        if Result = 100 then Exit;
      end;
    end;
  end;

begin
  Result := ChercheMeilleurTaux(UpperCase(SansAccents(Chaine1)), UpperCase(SansAccents(Chaine2)));
end;

function CompareChaines(Chaine1, Chaine2: PChar): Float; cdecl; export;
begin
  Result := (CompareChaines1(Chaine1, Chaine2) + CompareChaines2(Chaine1, Chaine2)) / 2;
end;

function ValidFileName(const FileName: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(FileName) do
    if FileName[i] in ['/', '\', ':', '*', '?', '"', '<', '>', '|'] then
      Result := Result + '_'
    else
      Result := Result + FileName[i];
end;

procedure WriteLog(chaine: string);
begin
  with TStringList.Create do try
    if FileExists('G:\Programmation\MEDIA.KIT\BDth�que 1.0\UDF\bdt_udf.log') then LoadFromFile('G:\Programmation\MEDIA.KIT\BDth�que 1.0\UDF\bdt_udf.log');
    Add('-- ' + DateTimeToStr(Now) + ' --');
    Add(chaine);
    SaveToFile('G:\Programmation\MEDIA.KIT\BDth�que 1.0\UDF\bdt_udf.log');
  finally
    free;
  end;
end;

function SaveBlobToFile(Path, FileName: PChar; Blob: PBlob): Integer; cdecl; export;
var
  buffer: array of Char;
  LongueurLue: Integer;
  BlobS: TMemoryStream;
begin
  try
    FileName := PChar(Path + ValidFileName(FileName));
    BlobS := TMemoryStream.Create;
    with BlobS do try
      Seek(0, soBeginning);
      if Assigned(Blob.BlobHandle) and (Blob.SegmentCount > 0) then begin
        SetLength(buffer, Blob.MaxSegmentLength);
        while LongBool(Blob.GetSegment(Blob.BlobHandle, @buffer[0], Blob.MaxSegmentLength, LongueurLue)) do
          BlobS.Write(buffer[0], LongueurLue);

        ForceDirectories(Path);
        if FileExists(FileName) then DeleteFile(FileName);
        BlobS.SaveToFile(FileName);
      end;
      Result := BlobS.Size;
    finally
      Free;
    end;
  except Result := 0;
  end; // pour �tre s�r de ne pas faire planter le serveur !!!!
end;

procedure LoadBlobFromFile(Path, FileName: PChar; Blob: PBlob); cdecl; export;
var
  buffer: array[0..4095] of Char;
  FS: TFileStream;
begin
  try
    FileName := PChar(Path + ValidFileName(FileName));
    if not FileExists(FileName) then Exit;

    FS := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    with FS do try
      while Position < Size do
        Blob.PutSegment(Blob.BlobHandle, @buffer[0], Read(buffer, Length(buffer)));
    finally
      Free;
    end;
  except
  end; // pour �tre s�r de ne pas faire planter le serveur !!!!
end;

type
  PSearchRec = ^TSearchRec;

function FindFileFirst(Path: PChar; var Attr: Integer): PSearchRec; cdecl; export;
var
  i: Integer;
begin
  New(Result);
  i := FindFirst(Path, Attr, Result^);
  if i <> 0 then begin
    FindClose(Result^);
    Dispose(Result);
    Result := PSearchRec(-i);
  end;
end;

function FindFileNext(var Sr: PSearchRec): PSearchRec; cdecl; export;
var
  i: Integer;
begin
  Result := sr;
  i := FindNext(Result^);
  if i <> 0 then begin
    FindClose(Result^);
    Dispose(Result);
    Result := PSearchRec(-i);
  end;
end;

function ExtractFileName(var Sr: PSearchRec): PChar; cdecl; export;
begin
  Result := CreateResult(sr^.Name);
end;

function ExtractFileAttr(var Sr: PSearchRec): Integer; cdecl; export;
begin
  Result := sr^.Attr;
end;

function ExtractFileSize(var Sr: PSearchRec): Integer; cdecl; export;
begin
  Result := sr^.Size;
end;

function SearchFileName(Path, FileName: PChar; var Reserve: Integer): PChar; cdecl; export;
var
  toAdd, Fichier, ext: string;
  Index: Integer;
begin
  ext := ExtractFileExt(FileName);
  Fichier := IncludeTrailingPathDelimiter(Path) + ChangeFileExt(FileName, '');
  Index := 0;
  toAdd := ext;
  while FileExists(Fichier + toAdd) do begin
    Inc(Index);
    toAdd := Format(' (%d)%s', [Index, ext]);
  end;
  if Reserve <> 0 then begin
    ForceDirectories(Path);
    TFileStream.Create(Fichier + toAdd, fmCreate).Free;
  end;
  Result := CreateResult(Fichier + toAdd);
end;

function DeleteFile(FileName: PChar): Integer; cdecl; export;
begin
  if Windows.DeleteFile(FileName) then
    Result := 0
  else
    Result := GetLastError;
end;

function CreateGUID: PChar; cdecl; export;
var
  GUID: TGUID;
begin
  if SysUtils.CreateGUID(GUID) = S_OK then
    Result := CreateResult(GUIDToString(GUID))
  else
    Result := nil;
end;

function UDFLength(Chaine: PChar): Integer; cdecl; export;
begin
  Result := StrLen(Chaine);
end;

exports
  Soundex, Upper, UpperBlob, SubString,
  SaveBlobToFile, LoadBlobFromFile,
  DeleteFile,
  FindFileFirst, FindFileNext,
  SearchFileName,
  ExtractFileName, ExtractFileAttr, ExtractFileSize,
  CreateGUID, Trim,
  CompareChaines name 'IdenticalString',
  CompareChaines1 name 'IdenticalString1',
  CompareChaines2 name 'IdenticalString2',
  FormatTitle,
  UDFLength name 'Length';

begin
end.

