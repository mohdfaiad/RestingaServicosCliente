unit UFormMinhaConta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView,
  FMX.Controls.Presentation;

type
  TFormMinhaConta = class(TFormModelo)
    LblTituloMinhaConta: TLabel;
    RctDadosPessoais: TRectangle;
    RctSeguranca: TRectangle;
    RctContato: TRectangle;
    LblDadosPessoais: TLabel;
    LblContato: TLabel;
    LblSeguranca: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMinhaConta: TFormMinhaConta;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

end.
