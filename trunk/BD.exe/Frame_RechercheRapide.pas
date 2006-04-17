unit Frame_RechercheRapide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTree, Buttons, VDTButton, StdCtrls, DBEditLabeled;

type
  TOnSearchEvent = procedure(Sender: TObject; NextSearch: Boolean) of object;
  TOnNewEvent = procedure(Sender: TObject) of object;

  TFrameRechercheRapide = class(TFrame)
    edSearch: TEditLabeled;
    btNext: TVDTButton;
    btNew: TVDTButton;
    procedure EditLabeled1Click(Sender: TObject);
    procedure edSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btNewClick(Sender: TObject);
  private
    FVirtualTreeView: TVirtualStringTree;
    FOnSearch: TOnSearchEvent;
    FOnNew: TOnNewEvent;
    procedure SetVirtualTreeView(const Value: TVirtualStringTree);
    procedure SetShowNewButton(const Value: Boolean);
    function GetShowNewButton: Boolean;
    procedure DoSearch(NextSearch: Boolean);
  protected
    procedure DoOnSearch(NextSearch: Boolean);
    procedure DoOnNew;
    procedure SetEnabled(Value: Boolean); override;
  public
    { D�clarations publiques }
    constructor Create(AOwner: TComponent); override;
    property VirtualTreeView: TVirtualStringTree read FVirtualTreeView write SetVirtualTreeView;
    property ShowNewButton: Boolean read GetShowNewButton write SetShowNewButton;
    property OnSearch: TOnSearchEvent read FOnSearch write FOnSearch;
    property OnNew: TOnNewEvent read FOnNew write FOnNew;
  end;

implementation

uses
  Proc_Gestions;

{$R *.dfm}

constructor TFrameRechercheRapide.Create(AOwner: TComponent);
begin
  inherited;
  ShowNewButton := True;
end;

procedure TFrameRechercheRapide.DoOnNew;
begin
  if Assigned(FOnNew) then FOnNew(Self);
end;

procedure TFrameRechercheRapide.DoOnSearch(NextSearch: Boolean);
begin
  if Assigned(FOnSearch) then FOnSearch(Self, NextSearch);
end;

procedure TFrameRechercheRapide.DoSearch(NextSearch: Boolean);
begin
  if Assigned(FVirtualTreeView) then begin
    FVirtualTreeView.Find(edSearch.Text, NextSearch);
    DoOnSearch(NextSearch);
  end;
end;

procedure TFrameRechercheRapide.EditLabeled1Click(Sender: TObject);
begin
  DoSearch(Sender = btNext);
end;

procedure TFrameRechercheRapide.edSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then DoSearch(True);
end;

function TFrameRechercheRapide.GetShowNewButton: Boolean;
begin
  Result := btNew.Visible;
end;

procedure TFrameRechercheRapide.SetShowNewButton(const Value: Boolean);
begin
  btNew.Visible := Value;
  if Value then begin
    btNew.Left := Self.Width - btNew.Width;
    btNext.Left := btNew.Left - btNext.Width - 1;
    edSearch.Width := btNext.Left - 1;
  end
  else begin
    btNext.Left := Self.Width - btNext.Width;
    edSearch.Width := btNext.Left - 1;
  end;
end;

procedure TFrameRechercheRapide.SetVirtualTreeView(const Value: TVirtualStringTree);
begin
  FVirtualTreeView := Value;
  if Assigned(FVirtualTreeView) then begin
    try
      edSearch.LinkControls.Add(btNext);
    except
      // y est peut-�tre d�j�
    end;
    try
      edSearch.LinkControls.Add(btNew);
    except
      // y est peut-�tre d�j�
    end;
    FVirtualTreeView.LinkControls.Assign(edSearch.LinkControls);
  end;
  edSearch.Enabled := Assigned(FVirtualTreeView);
  btNext.Enabled := edSearch.Enabled;
  btNew.Enabled := edSearch.Enabled;
end;

procedure TFrameRechercheRapide.btNewClick(Sender: TObject);
begin
  if Assigned(FOnNew) then
    FOnNew(Self)
  else if Assigned(FVirtualTreeView) then
    case FVirtualTreeView.Mode of
      vmNone: ;
      vmEditeurs: AjouterEditeurs(FVirtualTreeView, edSearch.Text);
      vmCollections: AjouterCollections(FVirtualTreeView, edSearch.Text);
      vmPersonnes: AjouterAuteurs(FVirtualTreeView, edSearch.Text);
      vmSeries: AjouterSeries(FVirtualTreeView, edSearch.Text);
      vmAlbums,
        vmAlbumsAnnee,
        vmAlbumsCollection,
        vmAlbumsEditeur,
        vmAlbumsGenre,
        vmAlbumsSerie: AjouterAlbums(FVirtualTreeView, edSearch.Text);
      vmGenres: AjouterGenres(FVirtualTreeView, edSearch.Text);
      vmEmprunteurs: AjouterEmprunteurs(FVirtualTreeView, edSearch.Text);
      vmParaBDSerie: AjouterParaBD(FVirtualTreeView, edSearch.Text);
      else
        Assert(True, 'Mode non pr�vu dans l''ajout')
    end;
end;

procedure TFrameRechercheRapide.SetEnabled(Value: Boolean);
begin
  inherited;
  edSearch.Enabled := Value;
  btNext.Enabled := Value;
  btNew.Enabled := Value;
end;

end.
