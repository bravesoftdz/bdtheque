unit Form_Choix;
{$D-}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFrmChoix = class(TForm)
    BtnChoix1: TButton;
    BtnChoix2: TButton;
    BtnAnnuler: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.DFM}

end.
