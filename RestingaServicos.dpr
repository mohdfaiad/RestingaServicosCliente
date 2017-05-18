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
  UFormSolicitaOrcamento in 'UFormSolicitaOrcamento.pas' {FormSolicitaOrcamento},
  UFormContratos in 'UFormContratos.pas' {FormModelo1},
  UFormServicos in 'UFormServicos.pas' {FormModelo2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSplash, FormSplash);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TFormModelo1, FormModelo1);
  Application.CreateForm(TFormModelo1, FormModelo1);
  Application.CreateForm(TFormModelo2, FormModelo2);
  Application.Run;
end.
