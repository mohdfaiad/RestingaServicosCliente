unit UFormDadosPessoais;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Edit, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView,
  FMX.Controls.Presentation;

type
  TFormDadosPessoais = class(TFormModelo)
    LblTituloMinhaConta: TLabel;
    ImgFoto: TImage;
    ImgCamera: TImage;
    LblNomeCompleto: TLabel;
    LblDataNascimento: TLabel;
    LblCPF: TLabel;
    EdtNomeCompleto: TEdit;
    EdtDatanascimento: TEdit;
    EdtCPF: TEdit;
    BtnSalvar: TButton;
    RctSalvar: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDadosPessoais: TFormDadosPessoais;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

end.
