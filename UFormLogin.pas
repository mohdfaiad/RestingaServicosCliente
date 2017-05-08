unit UFormLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.Controls.Presentation;

type
  TFormLogin = class(TForm)
    Layout2: TLayout;
    Image6: TImage;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    LblSenha: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    BtnEntrar: TButton;
    RctUsuario: TRectangle;
    RctSenha: TRectangle;
    EdtSenha: TEdit;
    RctEntrar: TRectangle;
    RctCadastrar: TRectangle;
    BtnCadastrar: TButton;
    SpeedButton1: TSpeedButton;
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function validaCampos:boolean;
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormPrincipal, UFormSplash, UFormCadastroUsuario, UFormEsqueceuSenha;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormLogin.BtnCadastrarClick(Sender: TObject);
begin
  if FormCadastroUsuario=nil then
    application.CreateForm(TFormCadastroUsuario,FormCadastroUsuario);
  TFormCadastroUsuario.Create(self).Show;
end;

procedure TFormLogin.BtnEntrarClick(Sender: TObject);
begin

  if validaCampos then
  begin
    with DMPrincipal do
    Begin
      QueryBuscaUsuario.Close;
      QueryBuscaUsuario.ParamByName('pEmail').AsString := EdtEmail.Text;
      QueryBuscaUsuario.ParamByName('pSenha').AsString := EdtSenha.Text;
      QueryBuscaUsuario.Open;

      if QueryBuscaUsuario.IsEmpty then
        ShowMessage('E-mail ou senha invalido!')
      else
      Begin
        FormSplash.Nome_Pessoa := QueryBuscaUsuarionome.AsString;
        FormSplash.Pessoa_id := QueryBuscaUsuarioid.AsInteger;
        if FormPrincipal = nil then
          application.CreateForm(TFormPrincipal,FormPrincipal);
        TFormPrincipal.Create(self).Show;
        //FormPrincipal.CbxProfissoes.ItemIndex := formpesquisa
      End;
    End;
  end;

end;

procedure TFormLogin.SpeedButton1Click(Sender: TObject);
begin

  if FormEsqueceuSenha = nil then
    application.CreateForm(TFormEsqueceuSenha,FormEsqueceuSenha);
  TFormEsqueceuSenha.Create(self).Show;

end;

function TFormLogin.validaCampos: boolean;
begin

   if EdtEmail.Text='' then
   begin
     ShowMessage('Preencha o campo Usuario');
     EdtEmail.SetFocus;
     result := false;
   end
   else
   Begin
     if EdtSenha.Text='' then
     begin
       ShowMessage('Preencha o campo Senha');
       EdtSenha.SetFocus;
       result := false;
     end
     Else
      result := true;
   End;

end;

end.
