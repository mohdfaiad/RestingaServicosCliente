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
  UFormContratos in 'UFormContratos.pas' {FormContratos},
  UFormServicos in 'UFormServicos.pas' {FormServicos},
  UFormSolicitaOrcamento2 in 'UFormSolicitaOrcamento2.pas' {FormSolicitaOrcamento2},
  UFormChat in 'UFormChat.pas' {FormChat},
  UFormMinhaConta in 'UFormMinhaConta.pas' {FormMinhaConta},
  UFormDadosPessoais in 'UFormDadosPessoais.pas' {FormDadosPessoais},
  UFormContato in 'UFormContato.pas' {FormContato},
  UFormSeguranca in 'UFormSeguranca.pas' {FormSeguranca};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSplash, FormSplash);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TFormMinhaConta, FormMinhaConta);
  Application.CreateForm(TFormDadosPessoais, FormDadosPessoais);
  Application.CreateForm(TFormContato, FormContato);
  Application.CreateForm(TFormSeguranca, FormSeguranca);
  Application.CreateForm(TFormSeguranca, FormSeguranca);
  Application.Run;
end.
