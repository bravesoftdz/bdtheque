unit UfrmRepertoire;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, StdCtrls, DBCtrls, Menus, Buttons, ComCtrls, ExtCtrls,
  ScanEdit, VDTButton, VirtualTrees, ActnList, VirtualTreeBdtk, jpeg, EditLabeled, ComboCheck, ProceduresBDtk,
  UframRechercheRapide, UBdtForms;

type
  TfrmRepertoire = class(TbdtForm)
    PageRep: TPageControl;
    TabAlbums: TTabSheet;
    vstAlbums: TVirtualStringTree;
    LightComboCheck1: TLightComboCheck;
    Label1: TLabel;
    TabAuteurs: TTabSheet;
    vstAuteurs: TVirtualStringTree;
    TabSeries: TTabSheet;
    TabParaBD: TTabSheet;
    vstParaBD: TVirtualStringTree;
    vstSeries: TVirtualStringTree;
    FrameRechercheRapideAlbums: TFramRechercheRapide;
    FrameRechercheRapideAuteurs: TFramRechercheRapide;
    FrameRechercheRapideSeries: TFramRechercheRapide;
    FrameRechercheRapideParaBD: TFramRechercheRapide;
    TabUnivers: TTabSheet;
    vstUnivers: TVirtualStringTree;
    FrameRechercheRapideUnivers: TframRechercheRapide;
    procedure FormCreate(Sender: TObject);
    procedure vstAlbumsDblClick(Sender: TObject);
    procedure LightComboCheck1Change(Sender: TObject);
    procedure FrameRechercheRapideedSearchKeyPress(Sender: TObject; var Key: Char);
    procedure vstAlbumsAfterItemPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect);
  private
    { Déclarations privées }
    procedure ChangeAlbumMode(Mode: TVirtualMode);
  public
    { Déclarations publiques }
  end;

var
  frmRepertoire: TfrmRepertoire;

implementation

uses
  CommonConst, IniFiles, Procedures, UHistorique, UfrmFond, Entities.Lite;

{$R *.DFM}

const
  PosAlbums = 0;
  PosSeries = 1;
  PosUnivers = 2;
  PosAuteurs = 3;
  PosParaBD = 4;

procedure TfrmRepertoire.FormCreate(Sender: TObject);
begin
  TGlobalVar.Mode_en_cours := mdConsult;
  PrepareLV(Self);
  TabAlbums.PageIndex := PosAlbums;
  TabAuteurs.PageIndex := PosAuteurs;
  TabSeries.PageIndex := PosSeries;
  TabUnivers.PageIndex := PosUnivers;
  TabParaBD.PageIndex := PosParaBD;

  ChargeImage(vstAlbums.Background, 'FONDVT');
  ChargeImage(vstUnivers.Background, 'FONDVT');
  ChargeImage(vstAuteurs.Background, 'FONDVT');
  ChargeImage(vstSeries.Background, 'FONDVT');
  ChargeImage(vstParaBD.Background, 'FONDVT');

  FrameRechercheRapideAlbums.VirtualTreeView := vstAlbums;
  FrameRechercheRapideAlbums.ShowNewButton := False;
  FrameRechercheRapideAuteurs.VirtualTreeView := vstAuteurs;
  FrameRechercheRapideAuteurs.ShowNewButton := False;
  FrameRechercheRapideSeries.VirtualTreeView := vstSeries;
  FrameRechercheRapideSeries.ShowNewButton := False;
  FrameRechercheRapideUnivers.VirtualTreeView := vstUnivers;
  FrameRechercheRapideUnivers.ShowNewButton := False;
  FrameRechercheRapideParaBD.VirtualTreeView := vstParaBD;
  FrameRechercheRapideParaBD.ShowNewButton := False;

  PageRep.ActivePageIndex := 0;

  vstAlbums.Mode := vmNone;
  with TIniFile.Create(FichierIni) do try
    LightComboCheck1.OnChange := nil;
    LightComboCheck1.Value := -1;
    LightComboCheck1.OnChange := LightComboCheck1Change;
    LightComboCheck1.Value := ReadInteger('Options', 'GroupBy', 1);
  finally
    Free;
  end;
  vstAuteurs.Mode := vmPersonnes;
  vstSeries.Mode := vmSeries;
  vstUnivers.Mode := vmUnivers;
  vstParaBD.Mode := vmParaBDSerie;
end;

procedure TfrmRepertoire.vstAlbumsAfterItemPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect);
begin
  if vstAlbums.GetNodeLevel(Node) > 0 then
    frmFond.DessineNote(TargetCanvas, ItemRect, TAlbumLite(vstAlbums.GetNodeBasePointer(Node)).Notation);
end;

procedure TfrmRepertoire.vstAlbumsDblClick(Sender: TObject);
begin
  case PageRep.ActivePageIndex of
    PosAlbums: with vstAlbums do
        if GetNodeLevel(FocusedNode) > 0 then Historique.AddWaiting(fcAlbum, CurrentValue);
    PosAuteurs: with vstAuteurs do
        if GetNodeLevel(FocusedNode) > 0 then Historique.AddWaiting(fcAuteur, CurrentValue);
    PosSeries: with vstSeries do
        if GetNodeLevel(FocusedNode) > 0 then Historique.AddWaiting(fcSerie, CurrentValue);
    PosUnivers: with vstUnivers do
        if GetNodeLevel(FocusedNode) > 0 then Historique.AddWaiting(fcUnivers, CurrentValue);
    PosParaBD: with vstParaBD do
        if GetNodeLevel(FocusedNode) > 0 then Historique.AddWaiting(fcParaBD, CurrentValue);
  end;
end;

procedure TfrmRepertoire.ChangeAlbumMode(Mode: TVirtualMode);
var
  i: TGUID;
const
  FirstTime: Boolean = True;
begin
  if (vstAlbums.Mode <> Mode) or FirstTime then begin
    i := vstAlbums.CurrentValue;
    vstAlbums.Mode := Mode;
    vstAlbums.CurrentValue := i;
  end;
  FirstTime := False;
end;

procedure TfrmRepertoire.LightComboCheck1Change(Sender: TObject);
const
  NewMode: array[0..5] of TVirtualMode = (vmAlbums, vmAlbumsSerie, vmAlbumsEditeur, vmAlbumsGenre, vmAlbumsAnnee, vmAlbumsCollection);
begin
  ChangeAlbumMode(NewMode[LightComboCheck1.Value]);
  with TIniFile.Create(FichierIni) do try
    WriteInteger('Options', 'GroupBy', LightComboCheck1.Value);
  finally
    Free;
  end;
end;

procedure TfrmRepertoire.FrameRechercheRapideedSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    TFramRechercheRapide(TWinControl(Sender).Parent).VirtualTreeView.OnDblClick(nil);
  end;
end;

end.

