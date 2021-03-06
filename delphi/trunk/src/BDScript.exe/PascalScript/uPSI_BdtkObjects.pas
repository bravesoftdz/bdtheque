unit uPSI_BdtkObjects;

interface

uses
  SysUtils, Classes, uPSComponent, uPSCompiler, uPSRuntime, UScriptEngineIntf;

type
  TPSImport_BdtkObjects = class(TPSPlugin)
  private
    FMasterEngine: Pointer;
    procedure SetMasterEngine(const Value: IMasterEngine);
    function GetMasterEngine: IMasterEngine;
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;

    property MasterEngine: IMasterEngine read GetMasterEngine write SetMasterEngine;
  end;

implementation

uses
  uPSC_BdtkObjects,
  uPSR_BdtkObjects;

{ TPSImport_LoadComplet }

procedure TPSImport_BdtkObjects.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_BdtkObjects(CompExec.Comp);
end;

procedure TPSImport_BdtkObjects.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_BdtkObjects(ri, MasterEngine.AlbumToUpdate);
end;

function TPSImport_BdtkObjects.GetMasterEngine: IMasterEngine;
begin
  Result := IMasterEngine(FMasterEngine);
end;

procedure TPSImport_BdtkObjects.SetMasterEngine(const Value: IMasterEngine);
begin
  FMasterEngine := Pointer(Value);
end;

end.
