unit UFormCadastroUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, MaskUtils, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

type
  TFormCadastroUsuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtEmail: TEdit;
    EdtSenha: TEdit;
    Label4: TLabel;
    EdtCPFCNPJ: TEdit;
    Label5: TLabel;
    BtnCriarUsuario: TButton;
    RctBotao: TRectangle;
    Image6: TImage;
    procedure EdtCPFCNPJExit(Sender: TObject);
    procedure BtnCriarUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function validaCampos:boolean;
  end;

var
  FormCadastroUsuario: TFormCadastroUsuario;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormLogin;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormCadastroUsuario.BtnCriarUsuarioClick(Sender: TObject);
begin

  if validaCampos then
  Begin
    with DMPrincipal do
    Begin
      QueryUsuario.Append;
      QueryUsuarioNome.Value := EdtNome.Text;
      QueryUsuarioEmail.Value := EdtEmail.Text;
      QueryUsuarioSenha.Value := EdtSenha.Text;
      QueryUsuarioCPFCNPJ.Value := EdtCPFCNPJ.Text;
      QueryUsuario.post;
      ShowMessage('Usuário cadastrado com sucesso! entre com suas informações de login.');
      FormLogin.Show;
    End;
  End;

end;

procedure TFormCadastroUsuario.EdtCPFCNPJExit(Sender: TObject);
begin

  if length(EdtCPFCNPJ.Text) > 11  then
    EdtCPFCNPJ.Text := FormatMaskText('99.999.999/9999-99;0', EdtCPFCNPJ.Text)
  Else
    if length(EdtCPFCNPJ.Text) <= 11 then
      EdtCPFCNPJ.Text := FormatMaskText('999.999.999-99;0', EdtCPFCNPJ.Text);

end;

function TFormCadastroUsuario.validaCampos: boolean;
begin
  if EdtNome.Text='' then
  Begin
    ShowMessage('O nome deve ser informado!');
    EdtNome.SetFocus;
    result := false;
  End
  else
  Begin
    if EdtEmail.Text='' then
    Begin
      ShowMessage('O E-mail deve ser informado!');
      EdtEmail.SetFocus;
      result := false;
    End
    else
    Begin
      if EdtSenha.Text='' then
      Begin
        ShowMessage('A senha deve ser informada!');
        EdtSenha.SetFocus;
        result := false;
      End
      else
      Begin
        if ((length(EdtSenha.Text)<6) or (length(EdtSenha.Text)>20)) then
        Begin
          ShowMessage('A senha deve ter no minimo 6 e no maximo 20 caracteres!');
          EdtSenha.SetFocus;
          result := false;
        End
        else
        Begin
          if EdtCPFCNPJ.Text='' then
          Begin
            ShowMessage('O CPF/CNPJ deve ser informado!');
            EdtSenha.SetFocus;
            result := false;
          End
          else
          Begin
            DMPrincipal.QueryUsuario.Open;
            DMPrincipal.QueryUsuario.filtered := false;
            DMPrincipal.QueryUsuario.filter := 'Email = ' + QuotedStr(EdtEmail.Text) + ' or CPFCNPJ = ' + EdtCPFCNPJ.Text;
            DMPrincipal.QueryUsuario.filtered := True;

            if not DMPrincipal.QueryUsuario.IsEmpty then
            Begin
              ShowMessage('Email ou cpf/cnpj já cadastrado! Corrija as informações!');
              EdtEmail.SetFocus;
            End
            else
              result:=true;
            DMPrincipal.QueryUsuario.filtered := false;
          End;
        End;
      End;
    End;
  End;

end;

end.
