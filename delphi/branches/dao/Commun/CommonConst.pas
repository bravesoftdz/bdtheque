unit CommonConst;

interface

{$WARN UNIT_PLATFORM OFF}

uses
  System.SysUtils, Winapi.Windows, VCL.Forms, System.Classes, System.IOUtils, Divers;

var
  AppData: string = 'TetramCorp\BDTheque\';
  CommonAppData: string = 'TetramCorp\BDTheque\';
  DatabasePath: string = 'bd.gdb';
  DatabaseUserName: string = 'SYSDBA';
  DatabasePassword: string = 'masterkey';
  DatabaseRole: string = 'ReadOnly'; // AllAccess
  DatabaseLibraryName: string = 'fbembed.dll';
  TempPath: string = 'TC_BDTK';
  RepImages: string = 'Images\';
  RepWebServer: string = 'WebServer\';
  RepScripts: string = 'Scripts\';
  RessourcePic: string = 'BDPic.dll';
  HandleDLLPic: Integer = 0;
  FichierIni: string = 'Bd.ini';
  FormatMonnaieCourt: string = '';
  FormatPourcent: string = '';
  FormatMonnaie: string = '';
  FormatMonnaieSimple: string = '';

const
  TitreApplication = 'BDth�que';
  CopyrightTetramCorp = 'Copyright � Tetr�m Corp';

  csAll = '(Toutes)'; // All categories

type
  RSiteWeb = record
    Adresse: string;
    Cle: string;
    Modele: string;
    MySQLServeur: string;
    MySQLBDD: string;
    MySQLLogin: string;
    MySQLPassword: string;
    MySQLPrefix: string;
    BddVersion: string;
    Paquets: Integer;
  end;

  ROptions = record
    FicheAlbumWithCouverture, FicheParaBDWithImage, ModeDemarrage, Images: Boolean;
    SymboleMonnetaire: string;
    AntiAliasing: Boolean;
    ImagesStockees: Boolean;
    AvertirPret: Boolean;
    GrandesIconesMenus, GrandesIconesBarre: Boolean;
    VerifMAJDelai: Integer;
    LastVerifMAJ: TDateTime;
    SerieObligatoireAlbums, SerieObligatoireParaBD: Boolean;
    FormatTitreAlbum: Integer;
    SiteWeb: RSiteWeb;
    AfficheNoteListes: Boolean;
  end;

  RUtilisateur = record
    Options: ROptions;
    ExeVersion, AppVersion: TVersionNumber;
  end;

  TModeConsult = (mdLoad, mdConsult, mdEdit, mdEditing, mdEntretien, mdImportation, mdExportation, mdScript);

type
  TGlobalVar = class
  class var
    Mode_en_cours: TModeConsult;
    class var Utilisateur: RUtilisateur;
  end;

implementation

uses
  Winapi.ShellAPI, Winapi.SHFolder, System.IniFiles, System.StrUtils;

procedure EmptyTempPath;
var
  op: _SHFILEOPSTRUCT;
begin
  op.Wnd := INVALID_HANDLE_VALUE;
  op.wFunc := FO_DELETE;
  op.pFrom := PChar(TPath.Combine(TempPath, '*'));
  op.fFlags := FOF_SILENT or FOF_NOCONFIRMATION or FOF_NOERRORUI;
  SHFileOperation(op);
end;

procedure InitPath;
var
  buffer: array [0 .. MAX_PATH] of Char;
  parentPath: string;
begin
  TempPath := TPath.Combine(TPath.GetTempPath, TempPath);
  TDirectory.CreateDirectory(TempPath);
  EmptyTempPath;

  ZeroMemory(@buffer, Length(buffer) * SizeOf(Char));
  SHGetFolderPath(0, CSIDL_COMMON_APPDATA, 0, SHGFP_TYPE_CURRENT, buffer);
  CommonAppData := TPath.Combine(buffer, CommonAppData);
  TDirectory.CreateDirectory(CommonAppData);

  AppData := TPath.Combine(TPath.GetHomePath, AppData);
  TDirectory.CreateDirectory(AppData);

  // si le fichier ini est dans le r�pertoire parent de l'exe (correspond � la version de d�veloppement)
  // alors on utilise les anciennes valeurs par d�faut
  parentPath := TDirectory.GetParent(TPath.GetDirectoryName(TPath.GetLibraryPath));
  if TFile.Exists(TPath.Combine(parentPath, FichierIni)) then
  begin
    FichierIni := TPath.Combine(parentPath, FichierIni);
    DatabasePath := TPath.Combine(parentPath, DatabasePath);
    RepImages := TPath.Combine(parentPath, RepImages);
    RepScripts := TPath.Combine(parentPath, RepScripts);
    RepWebServer := TPath.Combine(parentPath, RepWebServer);
  end
  else
  begin
    FichierIni := TPath.Combine(AppData, FichierIni);
    DatabasePath := TPath.Combine(AppData, DatabasePath);
    RepImages := TPath.Combine(AppData, RepImages);
    RepScripts := TPath.Combine(CommonAppData, RepScripts);
    RepWebServer := TPath.Combine(CommonAppData, RepWebServer);
  end;
end;

procedure ReadIniFile;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(FichierIni);
  try
    DatabasePath := ini.ReadString('Database', 'Database', DatabasePath);
    DatabaseUserName := ini.ReadString('Database', 'UserName', DatabaseUserName);
    DatabasePassword := ini.ReadString('Database', 'Password', DatabasePassword);
    DatabaseRole := ini.ReadString('Database', 'Role', DatabaseRole);
    DatabaseLibraryName := ini.ReadString('Database', 'LibraryName', DatabaseLibraryName);
    RepImages := IncludeTrailingPathDelimiter(ini.ReadString('DIVERS', 'RepImages', RepImages));
    RepScripts := IncludeTrailingPathDelimiter(ini.ReadString('DIVERS', 'Scripts', RepScripts));
    RepWebServer := IncludeTrailingPathDelimiter(ini.ReadString('DIVERS', 'WebServer', RepWebServer));

    TGlobalVar.Utilisateur.Options.VerifMAJDelai := ini.ReadInteger('Divers', 'VerifMAJDelai', 4);
    TGlobalVar.Utilisateur.Options.LastVerifMAJ := ini.ReadInteger('Divers', 'LastVerifMAJ', 0);
  finally
    ini.Free;
  end;
end;

initialization

InitPath;
FormatMonnaieCourt := '#,##0.00';
FormatMonnaieSimple := '0.00';
FormatMonnaie := IIf(FormatSettings.CurrencyFormat in [0, 2], FormatSettings.CurrencyString + IIf(FormatSettings.CurrencyFormat = 2, ' ', ''), '') +
  FormatMonnaieCourt + IIf(FormatSettings.CurrencyFormat in [1, 3], IIf(FormatSettings.CurrencyFormat = 3, ' ', '') + FormatSettings.CurrencyString, '');
FormatPourcent := '%d (%f%%)';
TGlobalVar.Utilisateur.ExeVersion := GetFichierVersion(TPath.Combine(TPath.GetLibraryPath, 'bd.exe'));
TGlobalVar.Utilisateur.AppVersion := Format('%d.%d', [TGlobalVar.Utilisateur.ExeVersion.MajorVersion, TGlobalVar.Utilisateur.ExeVersion.MinorVersion]);
ReadIniFile;

finalization

if HandleDLLPic <> 0 then
  FreeLibrary(HandleDLLPic);

end.