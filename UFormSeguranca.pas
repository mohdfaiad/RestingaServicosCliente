unit UFormSeguranca;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Edit, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView,
  FMX.Controls.Presentation;

type
  TFormSeguranca = class(TFormModelo)
    LblTituloSeguranca: TLabel;
    RecEmail: TRectangle;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    RctAlterarSenha: TRectangle;
    LblSenhaAtual: TLabel;
    EdtSenhaAtual: TEdit;
    LblNovaSenha: TLabel;
    EdtNovaSenha: TEdit;
    LblConfirmaSenha: TLabel;
    EdtConfirmaSenha: TEdit;
    LblAlterarSenha: TLabel;
    BtnSalvar: TButton;
    RctSalvar: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSeguranca: TFormSeguranca;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

end.
