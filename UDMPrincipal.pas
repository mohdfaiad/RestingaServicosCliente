unit UDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, UniProvider, MySQLUniProvider, MemDS, DBAccess, Uni;

type
  TDMPrincipal = class(TDataModule)
    UniConnPrincipal: TUniConnection;
    QueryProfissoes: TUniQuery;
    QueryProfissoesid: TIntegerField;
    QueryProfissoesnome: TStringField;
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
