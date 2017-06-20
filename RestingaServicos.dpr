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
  UFormServicos in 'UFormServicos.pas' {FormServicos},
  UFormSolicitaOrcamento2 in 'UFormSolicitaOrcamento2.pas' {FormSolicitaOrcamento2},
  UFormChat in 'UFormChat.pas' {FormChat},
  UFormMinhaConta in 'UFormMinhaConta.pas' {FormMinhaConta},
  UFormDadosPessoais in 'UFormDadosPessoais.pas' {FormDadosPessoais},
  UFormSeguranca in 'UFormSeguranca.pas' {FormSeguranca},
  UFormListaOrcamentos in 'UFormListaOrcamentos.pas' {FormListaOrcamentos},
  UFormContato2 in 'UFormContato2.pas' {FormContato2},
  UFormListaContratos in 'UFormListaContratos.pas' {FormListaContratos},
  UFormContratoFicha in 'UFormContratoFicha.pas' {FormContratoFicha},
  UFormFinalizarContrato in 'UFormFinalizarContrato.pas' {FormFinalizarContrato};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSplash, FormSplash);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TFormListaContratos, FormListaContratos);
  Application.CreateForm(TFormContratoFicha, FormContratoFicha);
  Application.CreateForm(TFormFinalizarContrato, FormFinalizarContrato);
  Application.Run;
end.
