Extension du Namespace Windows
------------------------------

ce projet n'est pas abouti...le but est ici d'explorer l'extension du bureau Windows avec un dossier virtuel.

j'ai choisi de repartir de z�ro, actuellement le projet merdoie autour de la notion de PItemIDList.

Le principe
-----------

MyShell.DLL export les fonctions suivantes

  DllRegisterServer
  DllUnregisterServer

  DllGetClassObject
  DllCanUnloadNow

 les deux premi�res sont invoqu�es par regsvr32.exe quand on enregistre (ou pas) la DLL

 les deux suivantes sont invoqu�es quand Windows a besoin de l'objet d�clar� lors de l'enregistrement.

la fonction RegisterShellFolder() de ShellFolder.pas permet de d�clarer un objet COM comme un dossier virtuel; d�s lors il apparait dans le "Poste de Travail" et Windows invoque la DLL quand il en a besoin.

DllGetClassObject est utilis� pour retrouver un IClassFactory responsable de la cr�ation des instances.
IClassFactory.CreateInstance permet d'instancier l'objet COM d�clar�

dans MyShell, c'est le m�me objet Delphi qui impl�mente IClassFactory et IShellFolder, ce n'est pas g�nant dans la mesure ou la DLL ne publie qu'un seul objet. Du coup utiliser la fonction QueryInterface de TObject pour passer de l'un � l'autre.

 DllCanUnloadNow retourne OK si toutes les instances de l'objet ont �t� lib�r�es.

Structure du programme
----------------------

 Je d�clare dans une unit�, une classe qui impl�mente une interface. Celle ci r�pond E_NOTIMPL sur chaque m�thode de l'interface, exemple :

 // IShellFolder
 function TShellFolder.ParseDisplayName(hwndOwner: HWND;
   pbcReserved: Pointer; lpszDisplayName: POLESTR; out pchEaten: ULONG;
   out ppidl: PItemIDList; var dwAttributes: ULONG): HResult; stdcall;
 begin
 {$IFDEF LOG}WriteLn(ClassName,'.IShellFolder.ParseDisplayName');{$ENDIF}
  Result:=E_NOTIMPL;
 end;

Si cette fonction doit �tre exploit�e dans ma classe d�riv�e, je la d�clare virtuelle, ce qui me permet d'avoir une classe d�riv�e d�barass�e de toutes les m�thodes dont elle n'a pas besoin.

-> Voir la diff�rence entre TShellFolder, qui impl�mente toutes les fonctions de IShellFodler, et TMyShell=class(TShellFolder) qui ne reprend en override que ce dont elle a besoin.

Paul TOTH
25 mai 2007