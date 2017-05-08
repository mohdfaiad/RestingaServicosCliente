unit UFormEsqueceuSenha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, System.Actions, FMX.ActnList;

type
  TFormEsqueceuSenha = class(TForm)
    Image6: TImage;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    Enviar: TButton;
    Rectangle1: TRectangle;
    MMTextoEmail: TMemo;
    procedure EnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEsqueceuSenha: TFormEsqueceuSenha;

implementation

{$R *.fmx}

uses UUtil, UDMPrincipal, UFormLogin;

procedure TFormEsqueceuSenha.EnviarClick(Sender: TObject);
begin
  if EdtEmail.Text='' then
  Begin
    ShowMessage('Informe o email para prosseguir.');
    EdtEmail.SetFocus;
  End
  else
  Begin
    with DMPrincipal do
    Begin
      QueryUsuario.Close;
      QueryUsuario.open;
      QueryUsuario.filtered := false;
      QueryUsuario.filter := 'Email = ' + QuotedStr(EdtEmail.Text);
      QueryUsuario.filtered := True;

      if not QueryUsuario.IsEmpty then
      Begin
        MMTextoEmail.Lines.Clear;
        MMTextoEmail.Lines.Add('Voce solicitou a recupera��o da sua senha para acesso ao aplicativo restinga servi�os. ' + #13 + #13);
        MMTextoEmail.Lines.Add('Sua senha �: ' + QueryUsuarioSenha.AsString + #13 + #13);
        MMTextoEmail.Lines.Add('Caso n�o tenha solicitado a recupera��o de senha. entre em contato com nossa central de suporte.' + #13+#13);
        MMTextoEmail.Lines.Add('Atenciosamente:' + #13 + 'Equipe Restinga Servi�os.');

        if UUtil.MandarMail('servicosrestinga@gmail.com',EdtEmail.Text,'Senha - Restinga Servi�os',MMTextoEmail) then
        Begin
          ShowMessage('Mensagem enviada com sucesso! Verifique sua caixa de e-mail!');
          Formlogin.Show;
        end
        else
          Showmessage('N�o foi possivel enviar o email.');
      End
      Else
      Begin
        Showmessage('E-mail n�o encontrado! Informe um e-mail v�lido.');
        EdtEmail.Text := '';
        EdtEmail.SetFocus;
      End;

    End;
  End;

end;

end.
