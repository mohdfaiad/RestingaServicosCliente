program RestingaServicos;

uses
  System.StartUpCopy,
  FMX.Forms,
  UFormSplash in 'UFormSplash.pas' {FormSplash},
  UDMPrincipal in 'UDMPrincipal.pas' {DMPrincipal: TDataModule},
  UFormModelo in 'UFormModelo.pas' {FormModelo},
  UFormPrincipal in 'UFormPrincipal.pas' {FormPrincipal},
  UFormSelecaoInicial in 'UFormSelecaoInicial.pas' {FormSelecaoInicial},
  UFormSelecionaArea in 'UFormSelecionaArea.pas' {FormSelecionaArea},
  UFormLogin in 'UFormLogin.pas' {FormLogin},
  UFormPesquisaSemLogin in 'UFormPesquisaSemLogin.pas' {FormPesquisaSemLogin},
  UFormCadastroUsuario in 'UFormCadastroUsuario.pas' {FormCadastroUsuario},
  UUtil in 'UUtil.pas',
  UFormEsqueceuSenha in 'UFormEsqueceuSenha.pas' {FormEsqueceuSenha},
  UFormFichaProfissionalSemLogin in 'UFormFichaProfissionalSemLogin.pas' {FormFichaProfissionalSemLogin},
  UFormFichaProfissional in 'UFormFichaProfissional.pas' {FormFichaProfissional},
  UFormSolicitaOrcamento in 'UFormSolicitaOrcamento.pas' {FormSolicitaOrcamento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSplash, FormSplash);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.Run;
end.
