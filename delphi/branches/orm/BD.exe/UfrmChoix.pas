unit UfrmChoix;
{$D-}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, UBdtForms, UframBoutons, UfrmFond;

type
  TfrmChoix = class(TbdtForm)
    BtnChoix1: TButton;
    BtnChoix2: TButton;
    framBoutons1: TframBoutons;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.DFM}

end.
