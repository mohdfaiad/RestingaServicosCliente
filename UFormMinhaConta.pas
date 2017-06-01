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
    RctSeguranca: TRectangle;
    RctDadosPessoais: TRectangle;
    LblDadosPessoais: TLabel;
    LytBotoes: TLayout;
    LblSeguranca: TLabel;
    RctContato: TRectangle;
    LblContato: TLabel;
    procedure RctDadosPessoaisClick(Sender: TObject);
    procedure RctContatoClick(Sender: TObject);
    procedure RctSegurancaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMinhaConta: TFormMinhaConta;

implementation

{$R *.fmx}

uses UFormDadosPessoais, UFormContato, UFormSeguranca;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormMinhaConta.RctContatoClick(Sender: TObject);
begin
  inherited;
  if FormContato = nil then
    application.CreateForm(TFormContato,FormContato);
  TFormContato.Create(self).Show;
end;

procedure TFormMinhaConta.RctDadosPessoaisClick(Sender: TObject);
begin
  inherited;
  if FormDadosPessoais = nil then
    application.CreateForm(TFormDadosPessoais,FormDadosPessoais);
  TFormDadosPessoais.Create(self).Show;
end;

procedure TFormMinhaConta.RctSegurancaClick(Sender: TObject);
begin
  inherited;
  if FormSeguranca = nil then
    application.CreateForm(TFormSeguranca,FormSeguranca);
  TFormSeguranca.Create(self).Show;
end;

end.
