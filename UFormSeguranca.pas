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
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    function validaCampos:boolean;
  end;

var
  FormSeguranca: TFormSeguranca;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormSplash;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormSeguranca.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  if validaCampos then
  begin
    showMessage('Senha alterada com sucesso!');
    close;
  end;


end;

function TFormSeguranca.validaCampos: boolean;
begin
  with DMPrincipal do
  begin
    QuerySeguranca.Close;
    QuerySeguranca.ParamByName('pIdUsuario').Value:= FormSplash.Pessoa_id;
    QuerySeguranca.Open;

    if EdtSenhaAtual.Text=QuerySegurancaSenha.AsString then
    begin
      if edtNovaSenha.Text <> QuerySegurancaSenha.AsString  then
      begin
        if edtNovaSenha.Text = edtConfirmaSenha.text then
        begin
          querySeguranca.Edit;
          QuerySegurancaSenha.Value:=edtConfirmaSenha.Text;
          QuerySeguranca.Post;
          result:=true;
        end
        else
        begin
          showMessage('Confirmação de Senha incorreta. Por favor, confira');
          edtNovaSenha.SetFocus;
          edtNovaSenha.Text:='';
          edtConfirmaSenha.Text:='';
          result:=false;
        end;
      end
      else
      begin
        showMessage('Por Favor insira outra senha');
        edtNovaSenha.SetFocus;
        edtNovaSenha.Text:='';
        result:=false;
      end;
    end
    else
    begin
      showMessage('Senha Atual incorreta');
      edtSenhaAtual.SetFocus;
      edtSenhaAtual.Text:='';
      result:=false;
    end;


  end;

end;

end.
