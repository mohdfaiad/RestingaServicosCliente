unit UDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, UniProvider, MySQLUniProvider, MemDS, DBAccess, Uni;

type
  TDMPrincipal = class(TDataModule)
    UniConnPrincipal: TUniConnection;
    QueryProfissoes: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    QueryPessoa: TUniQuery;
    QueryLogradouro: TUniQuery;
    QueryLogradouronum_cep: TLongWordField;
    QueryLogradourologradouro: TStringField;
    QueryLogradouroBairro: TStringField;
    QueryLogradouroCidade: TStringField;
    QueryLogradouroUF: TStringField;
    QueryProfissional: TUniQuery;
    QueryProfissionalid: TLongWordField;
    QueryProfissionalnomepessoa: TStringField;
    QueryProfissionalDescricao: TMemoField;
    QueryProfissionalnota: TLongWordField;
    QueryProfissionalfoto: TBlobField;
    QueryProfissionalAvaliacao: TBlobField;
    QueryPessoaid: TLongWordField;
    QueryPessoanomepessoa: TStringField;
    QueryPessoaProfissao: TStringField;
    QueryPessoaAvaliacao: TBlobField;
    QueryPessoafoto: TBlobField;
    QueryProfissionalCidadeUF: TStringField;
    QueryProfissionalTotalAtendimentos: TLargeintField;
    QueryProfissionalProfissao: TStringField;
    QueryServicosPrestados: TUniQuery;
    QueryServicosPrestadosCodContratante: TLongWordField;
    QueryServicosPrestadosCodContratado: TLongWordField;
    QueryServicosPrestadosContratante: TStringField;
    QueryServicosPrestadosDescricao: TMemoField;
    QueryServicosPrestadosNota_contratado: TLongWordField;
    QueryServicosPrestadosData_termino: TDateTimeField;
    QueryServicosPrestadosfoto: TBlobField;
    QueryServicosPrestadosimagem: TBlobField;
    QueryBuscaUsuario: TUniQuery;
    QueryBuscaUsuarioid: TLongWordField;
    QueryBuscaUsuarionome: TStringField;
    QueryBuscaUsuariopessoa_id: TLongWordField;
    QueryUsuario: TUniQuery;
    QueryUsuarioid: TLongWordField;
    QueryUsuarioNome: TStringField;
    QueryUsuarioEmail: TStringField;
    QueryUsuarioSenha: TStringField;
    QueryUsuarioCPFCNPJ: TStringField;
    QueryUsuariopessoa_id: TLongWordField;
    QueryCadastraPessoa: TUniQuery;
    QueryCadastraPessoaid: TLongWordField;
    QueryCadastraPessoaNomePessoa: TStringField;
    QueryCadastraPessoaLogradouro_cep: TLongWordField;
    QueryCadastraPessoanumero: TStringField;
    QueryCadastraPessoacomplemento: TStringField;
    QueryCadastraPessoaDescricao: TMemoField;
    QueryCadastraPessoaCPFCNPJ: TStringField;
    QueryCadastraPessoaInscricaoEstatual: TStringField;
    QueryCadastraPessoaRazaoSocial: TStringField;
    QueryCadastraPessoaPessoa_tipo_id: TLongWordField;
    QueryCadastraPessoafoto: TBlobField;
    QueryCadastraPessoaNota: TLongWordField;
    UniSQLAdicionaOrcamento: TUniSQL;
    QueryPessoaLogada: TUniQuery;
    QueryPessoaLogadaid: TLongWordField;
    QueryPessoaLogadanomepessoa: TStringField;
    QueryPessoaLogadafoto: TBlobField;
    QuerySeguranca: TUniQuery;
    QuerySegurancaid: TLongWordField;
    QuerySegurancaemail: TStringField;
    QuerySegurancasenha: TStringField;
    QueryContato: TUniQuery;
    QueryContatoLogradouro_cep: TLongWordField;
    QueryContatonumero: TStringField;
    QueryContatocomplemento: TStringField;
    QueryDadosPessoais: TUniQuery;
    QueryDadosPessoaisid: TLongWordField;
    QueryDadosPessoaisNomePessoa: TStringField;
    QueryDadosPessoaisCPFCNPJ: TStringField;
    QueryDadosPessoaisData_nascimento: TDateTimeField;
    QueryDadosPessoaisusuario_id: TLongWordField;
    QueryContatodesc_logradouro: TStringField;
    QueryContatoid: TLongWordField;
    QueryTipoContato: TUniQuery;
    QueryTipoContatoid: TLongWordField;
    QueryTipoContatoNomeTipoContato: TStringField;
    QueryDadosContato: TUniQuery;
    QueryDadosContatoid: TLongWordField;
    QueryDadosContatoPessoa_id: TLongWordField;
    QueryDadosContatoContato_tipo_id: TLongWordField;
    QueryDadosContatocontato: TStringField;
    QueryDadosContatoNomeTipoContato: TStringField;
    QueryProfissoesid: TLongWordField;
    QueryProfissoesProfissao_area_id: TLongWordField;
    QueryProfissoesNome: TStringField;
    QueryArea: TUniQuery;
    QueryAreaid: TLongWordField;
    QueryAreaNomeArea: TStringField;
    QueryDadosPessoaisfoto: TBlobField;
    QueryOrcamentos: TUniQuery;
    QueryOrcamentosid: TLongWordField;
    QueryOrcamentoscontratante_id: TLongWordField;
    QueryOrcamentoscontratado_id: TLongWordField;
    QueryOrcamentosdata_orcamento: TDateTimeField;
    QueryOrcamentosStatus: TBooleanField;
    QueryOrcamentosDescricao: TMemoField;
    QueryOrcamentosnomepessoa: TStringField;
    QueryOrcamento_Chat: TUniQuery;
    QueryOrcamento_Chatid: TLongWordField;
    QueryOrcamento_ChatDataEnvio: TDateTimeField;
    QueryOrcamento_ChatTexto: TMemoField;
    QueryOrcamento_Chatorcamento_id: TLongWordField;
    QueryOrcamento_ChatPessoa_id: TLongWordField;
    QueryOrcamento_ChatNomePessoa: TStringField;
    QueryOrcamento_Proposta: TUniQuery;
    QueryOrcamento_Propostaid: TLongWordField;
    QueryOrcamento_PropostaOrcamento_id: TLongWordField;
    QueryOrcamento_PropostaFormaPagamento_id: TLongWordField;
    QueryOrcamento_PropostaQtdParcelas: TLongWordField;
    QueryOrcamento_PropostaValorTotal: TFloatField;
    QueryOrcamento_PropostaDataInicio: TDateTimeField;
    QueryOrcamento_PropostaDataPrevisao: TDateTimeField;
    QueryOrcamento_PropostaObservacoes: TMemoField;
    QueryFormaPagamento: TUniQuery;
    QueryFormaPagamentoid: TLongWordField;
    QueryFormaPagamentoFormaPagamento: TStringField;
    QueryOrcamento_Contrato: TUniQuery;
    QueryOrcamento_Contratoid: TLongWordField;
    QueryOrcamento_ContratoOrcamento_id: TLongWordField;
    QueryOrcamento_ContratoNota: TLongWordField;
    QueryOrcamento_ContratoDescricao: TMemoField;
    QueryOrcamento_ContratoStatus: TBooleanField;
    QueryOrcamento_ContratoDataAbertura: TDateTimeField;
    QueryOrcamento_ContratoDataFechamento: TDateTimeField;
    QueryOrcamento_Contratocontratante_id: TLongWordField;
    QueryOrcamento_Contratocontratado_id: TLongWordField;
    QueryOrcamento_ContratoDescOrcamento: TMemoField;
    QueryOrcamento_ContratoQtdParcelas: TLongWordField;
    QueryOrcamento_ContratoValorTotal: TFloatField;
    QueryOrcamento_ContratoObservacoes: TMemoField;
    QueryOrcamento_ContratoFormaPagamento: TStringField;
    QueryOrcamento_ContratoProfissional: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
