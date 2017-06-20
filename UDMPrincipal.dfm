object DMPrincipal: TDMPrincipal
  OldCreateOrder = False
  Height = 456
  Width = 650
  object UniConnPrincipal: TUniConnection
    ProviderName = 'mySQL'
    Port = 2020
    Database = 'RestingaServicos'
    Username = 'root'
    Server = 'ielb.no-ip.org'
    Connected = True
    LoginPrompt = False
    Left = 44
    Top = 2
    EncryptedPassword = 'CEFFC6FFCFFFCBFF'
  end
  object QueryProfissoes: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select p.id,'
      '       p.Profissao_area_id,'
      '       p.Nome'
      
        'From Profissao p left join profissao_area pa on p.Profissao_area' +
        '_id = pa.id'
      'where pa.NomeArea = :pNome'
      'order by Nome;')
    Left = 164
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'pNome'
        Value = nil
      end>
    object QueryProfissoesid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryProfissoesProfissao_area_id: TLongWordField
      FieldName = 'Profissao_area_id'
      Required = True
    end
    object QueryProfissoesNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 255
    end
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 44
    Top = 52
  end
  object QueryPessoa: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select p.id,p.nomepessoa,p.foto,'
      '       pro.nome as Profissao,'
      '       n.imagem as Avaliacao'
      
        ' from pessoa p left join pessoa_profissao pp on p.id = pp.pessoa' +
        '_id'
      
        '               left join profissao pro on pp.profissao_id = pro.' +
        'id'
      
        '               left join notas n on p.nota = n.nota             ' +
        '   '
      ' where pessoa_tipo_id<>1'
      
        'and pro.nome = :pProfissao or :pProfissao = '#39'SELECIONE A PROFISS' +
        #195'O'#39
      ' Order by nomepessoa;'
      '')
    Left = 164
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pProfissao'
        Value = nil
      end>
    object QueryPessoaid: TLongWordField
      FieldName = 'id'
    end
    object QueryPessoanomepessoa: TStringField
      FieldName = 'nomepessoa'
      Required = True
      Size = 250
    end
    object QueryPessoaProfissao: TStringField
      FieldName = 'Profissao'
      ReadOnly = True
      Size = 120
    end
    object QueryPessoaAvaliacao: TBlobField
      FieldName = 'Avaliacao'
      ReadOnly = True
    end
    object QueryPessoafoto: TBlobField
      FieldName = 'foto'
    end
  end
  object QueryLogradouro: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT num_cep,'
      'concat_ws('#39' '#39',desc_tipo,desc_logradouro) logradouro,'
      'b.desc_bairro Bairro,'
      'c.desc_cidade Cidade,'
      'c.flg_estado UF'
      
        'FROM logradouro l left join bairro b on l.bairro_id = b.bairro_i' +
        'd'
      
        '                  left join cidade c on b.cidade_id = c.cidade_i' +
        'd'
      ' where num_cep = :pCep;')
    Left = 280
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCep'
        Value = nil
      end>
    object QueryLogradouronum_cep: TLongWordField
      FieldName = 'num_cep'
      Required = True
    end
    object QueryLogradourologradouro: TStringField
      FieldName = 'logradouro'
      ReadOnly = True
      Size = 56
    end
    object QueryLogradouroBairro: TStringField
      FieldName = 'Bairro'
      ReadOnly = True
      Size = 45
    end
    object QueryLogradouroCidade: TStringField
      FieldName = 'Cidade'
      ReadOnly = True
      Size = 60
    end
    object QueryLogradouroUF: TStringField
      FieldName = 'UF'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object QueryProfissional: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT p.id,p.nomepessoa,'
      'p.Descricao,'
      'p.nota,'
      'p.foto,'
      'n.imagem as Avaliacao,'
      'concat_ws('#39' - '#39',c.desc_cidade,c.flg_estado) as CidadeUF,'
      
        '(select count(pessoa_contratada_id) from servicos_prestados wher' +
        'e pessoa_contratada_id = p.id group by pessoa_contratada_id) as ' +
        'TotalAtendimentos,'
      'pro.nome as Profissao'
      'FROM pessoa p left join notas n on p.nota = n.nota'
      
        '              left join logradouro l on p.logradouro_cep=l.num_c' +
        'ep'
      '              left join bairro b on l.bairro_id = b.bairro_id'
      '              left join cidade c on b.cidade_id = c.cidade_id'
      
        '              left join pessoa_profissao pp on p.id = pp.pessoa_' +
        'id and flg_principal = true'
      
        '              left join profissao pro on pro.id = pp.profissao_i' +
        'd'
      'where p.id = :pId;')
    Left = 280
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pId'
        Value = nil
      end>
    object QueryProfissionalid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryProfissionalnomepessoa: TStringField
      FieldName = 'nomepessoa'
      Required = True
      Size = 250
    end
    object QueryProfissionalDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object QueryProfissionalnota: TLongWordField
      FieldName = 'nota'
    end
    object QueryProfissionalfoto: TBlobField
      FieldName = 'foto'
    end
    object QueryProfissionalAvaliacao: TBlobField
      FieldName = 'Avaliacao'
      ReadOnly = True
    end
    object QueryProfissionalCidadeUF: TStringField
      FieldName = 'CidadeUF'
      ReadOnly = True
      Size = 65
    end
    object QueryProfissionalTotalAtendimentos: TLargeintField
      FieldName = 'TotalAtendimentos'
      ReadOnly = True
    end
    object QueryProfissionalProfissao: TStringField
      FieldName = 'Profissao'
      ReadOnly = True
      Size = 120
    end
  end
  object QueryServicosPrestados: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT s.pessoa_contratente_id CodContratante,'
      's.pessoa_contratada_id CodContratado,'
      'P.NomePessoa Contratante,'
      's.Descricao,'
      'S.Nota_contratado,'
      'S.Data_termino,'
      'p.foto,'
      'n.imagem'
      
        'FROM servicos_prestados s left join pessoa p on s.pessoa_contrat' +
        'ente_id = p.id'
      'left join notas n on s.Nota_contratado = n.nota'
      'where s.pessoa_contratada_id = :pContratado_id limit 5;')
    Left = 416
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pContratado_id'
        Value = nil
      end>
    object QueryServicosPrestadosCodContratante: TLongWordField
      FieldName = 'CodContratante'
      Required = True
    end
    object QueryServicosPrestadosCodContratado: TLongWordField
      FieldName = 'CodContratado'
      Required = True
    end
    object QueryServicosPrestadosContratante: TStringField
      FieldName = 'Contratante'
      ReadOnly = True
      Size = 250
    end
    object QueryServicosPrestadosDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object QueryServicosPrestadosNota_contratado: TLongWordField
      FieldName = 'Nota_contratado'
      Required = True
    end
    object QueryServicosPrestadosData_termino: TDateTimeField
      FieldName = 'Data_termino'
      Required = True
    end
    object QueryServicosPrestadosfoto: TBlobField
      FieldName = 'foto'
      ReadOnly = True
    end
    object QueryServicosPrestadosimagem: TBlobField
      FieldName = 'imagem'
      ReadOnly = True
    end
  end
  object QueryBuscaUsuario: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT id, nome, pessoa_id'
      'FROM usuario'
      'where email = :pEmail'
      'and senha = :pSenha;')
    Left = 416
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pEmail'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pSenha'
        Value = nil
      end>
    object QueryBuscaUsuarioid: TLongWordField
      FieldName = 'id'
    end
    object QueryBuscaUsuarionome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 150
    end
    object QueryBuscaUsuariopessoa_id: TLongWordField
      FieldName = 'pessoa_id'
    end
  end
  object QueryUsuario: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO usuario'
      '  (id, Nome, Email, Senha, CPFCNPJ, pessoa_id)'
      'VALUES'
      '  (:id, :Nome, :Email, :Senha, :CPFCNPJ, :pessoa_id)')
    SQLDelete.Strings = (
      'DELETE FROM usuario'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE usuario'
      'SET'
      
        '  id = :id, Nome = :Nome, Email = :Email, Senha = :Senha, CPFCNP' +
        'J = :CPFCNPJ, pessoa_id = :pessoa_id'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM usuario'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT id, Nome, Email, Senha, CPFCNPJ, pessoa_id FROM usuario'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM usuario')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select * from usuario')
    FilterOptions = [foCaseInsensitive]
    Left = 548
    Top = 4
    object QueryUsuarioid: TLongWordField
      FieldName = 'id'
    end
    object QueryUsuarioNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 150
    end
    object QueryUsuarioEmail: TStringField
      FieldName = 'Email'
      Required = True
      Size = 255
    end
    object QueryUsuarioSenha: TStringField
      FieldName = 'Senha'
      Required = True
      Size = 45
    end
    object QueryUsuarioCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Required = True
      Size = 14
    end
    object QueryUsuariopessoa_id: TLongWordField
      FieldName = 'pessoa_id'
    end
  end
  object QueryCadastraPessoa: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoa'
      
        '  (id, NomePessoa, Logradouro_cep, numero, complemento, Descrica' +
        'o, CPFCNPJ, InscricaoEstatual, RazaoSocial, Pessoa_tipo_id, foto' +
        ', Nota)'
      'VALUES'
      
        '  (:id, :NomePessoa, :Logradouro_cep, :numero, :complemento, :De' +
        'scricao, :CPFCNPJ, :InscricaoEstatual, :RazaoSocial, :Pessoa_tip' +
        'o_id, :foto, :Nota)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE pessoa'
      'SET'
      
        '  id = :id, NomePessoa = :NomePessoa, Logradouro_cep = :Logradou' +
        'ro_cep, numero = :numero, complemento = :complemento, Descricao ' +
        '= :Descricao, CPFCNPJ = :CPFCNPJ, InscricaoEstatual = :Inscricao' +
        'Estatual, RazaoSocial = :RazaoSocial, Pessoa_tipo_id = :Pessoa_t' +
        'ipo_id, foto = :foto, Nota = :Nota'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM pessoa'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT id, NomePessoa, Logradouro_cep, numero, complemento, Desc' +
        'ricao, CPFCNPJ, InscricaoEstatual, RazaoSocial, Pessoa_tipo_id, ' +
        'foto, Nota FROM pessoa'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM pessoa')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select * from pessoa limit 1;')
    FilterOptions = [foCaseInsensitive]
    Left = 548
    Top = 52
    object QueryCadastraPessoaid: TLongWordField
      FieldName = 'id'
    end
    object QueryCadastraPessoaNomePessoa: TStringField
      FieldName = 'NomePessoa'
      Required = True
      Size = 250
    end
    object QueryCadastraPessoaLogradouro_cep: TLongWordField
      FieldName = 'Logradouro_cep'
    end
    object QueryCadastraPessoanumero: TStringField
      FieldName = 'numero'
      Size = 45
    end
    object QueryCadastraPessoacomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object QueryCadastraPessoaDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object QueryCadastraPessoaCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 16
    end
    object QueryCadastraPessoaInscricaoEstatual: TStringField
      FieldName = 'InscricaoEstatual'
      Size = 45
    end
    object QueryCadastraPessoaRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 255
    end
    object QueryCadastraPessoaPessoa_tipo_id: TLongWordField
      FieldName = 'Pessoa_tipo_id'
      Required = True
    end
    object QueryCadastraPessoafoto: TBlobField
      FieldName = 'foto'
    end
    object QueryCadastraPessoaNota: TLongWordField
      FieldName = 'Nota'
    end
  end
  object UniSQLAdicionaOrcamento: TUniSQL
    Connection = UniConnPrincipal
    SQL.Strings = (
      'INSERT INTO orcamento'
      
        '  (contratante_id, contratado_id, data_orcamento, Status, Descri' +
        'cao)'
      'VALUES'
      
        '  (:contratante_id, :contratado_id, :data_orcamento, :Status, :D' +
        'escricao)')
    Left = 416
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contratante_id'
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'contratado_id'
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'data_orcamento'
        Value = nil
      end
      item
        DataType = ftBoolean
        Name = 'STATUS'
        Value = nil
      end
      item
        DataType = ftMemo
        Name = 'Descricao'
        Value = ''
      end>
  end
  object QueryPessoaLogada: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select id, nomepessoa, foto from pessoa'
      'where id = :pId;')
    Left = 160
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pId'
        Value = nil
      end>
    object QueryPessoaLogadaid: TLongWordField
      FieldName = 'id'
    end
    object QueryPessoaLogadanomepessoa: TStringField
      FieldName = 'nomepessoa'
      Required = True
      Size = 250
    end
    object QueryPessoaLogadafoto: TBlobField
      FieldName = 'foto'
    end
  end
  object QuerySeguranca: TUniQuery
    SQLUpdate.Strings = (
      'UPDATE usuario'
      'SET'
      '  Senha = :Senha'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      'SELECT Senha FROM usuario'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM usuario')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT id,email, senha'
      'FROM usuario u'
      'where id = :pIdUsuario;')
    Left = 548
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdUsuario'
        Value = nil
      end>
    object QuerySegurancaid: TLongWordField
      FieldName = 'id'
    end
    object QuerySegurancaemail: TStringField
      FieldName = 'email'
      Required = True
      Size = 255
    end
    object QuerySegurancasenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 45
    end
  end
  object QueryContato: TUniQuery
    SQLUpdate.Strings = (
      'UPDATE pessoa'
      'SET'
      
        '  Logradouro_cep = :Logradouro_cep, numero = :numero, complement' +
        'o = :complemento'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      'SELECT Logradouro_cep, numero, complemento FROM pessoa'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM pessoa')
    Connection = UniConnPrincipal
    SQL.Strings = (
      
        'SELECT p.id, p.Logradouro_cep, p.numero, p.complemento, l.desc_l' +
        'ogradouro'
      'FROM pessoa p '
      'left join Logradouro l on p.Logradouro_cep = l.num_cep'
      'left join Usuario u on p.id = u.pessoa_id'
      'WHERE u.id= :pUsuario_id;')
    Left = 280
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pUsuario_id'
        Value = nil
      end>
    object QueryContatoLogradouro_cep: TLongWordField
      FieldName = 'Logradouro_cep'
    end
    object QueryContatonumero: TStringField
      FieldName = 'numero'
      Size = 45
    end
    object QueryContatocomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object QueryContatodesc_logradouro: TStringField
      FieldName = 'desc_logradouro'
      ReadOnly = True
      Size = 45
    end
    object QueryContatoid: TLongWordField
      FieldName = 'id'
    end
  end
  object QueryDadosPessoais: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoa'
      '  (id, NomePessoa, CPFCNPJ, foto, Data_nascimento)'
      'VALUES'
      '  (:id, :NomePessoa, :CPFCNPJ, :foto, :Data_nascimento)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE pessoa'
      'SET'
      
        '  id = :id, NomePessoa = :NomePessoa, CPFCNPJ = :CPFCNPJ, foto =' +
        ' :foto, Data_nascimento = :Data_nascimento'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM pessoa'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT id, NomePessoa, CPFCNPJ, foto, Data_nascimento FROM pesso' +
        'a'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM pessoa')
    Connection = UniConnPrincipal
    SQL.Strings = (
      
        'SELECT p.id, p.NomePessoa, p.CPFCNPJ, p.Data_nascimento, u.id us' +
        'uario_id,p.foto'
      'FROM pessoa p left join Usuario u on p.id = u.pessoa_id'
      'WHERE u.id= :pUsuario_id;')
    Left = 160
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pUsuario_id'
        Value = nil
      end>
    object QueryDadosPessoaisid: TLongWordField
      FieldName = 'id'
    end
    object QueryDadosPessoaisNomePessoa: TStringField
      FieldName = 'NomePessoa'
      Required = True
      Size = 250
    end
    object QueryDadosPessoaisCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 16
    end
    object QueryDadosPessoaisData_nascimento: TDateTimeField
      FieldName = 'Data_nascimento'
    end
    object QueryDadosPessoaisusuario_id: TLongWordField
      FieldName = 'usuario_id'
      ReadOnly = True
    end
    object QueryDadosPessoaisfoto: TBlobField
      FieldName = 'foto'
    end
  end
  object QueryTipoContato: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select * from contato_tipo'
      'order by nometipocontato;')
    Left = 416
    Top = 156
    object QueryTipoContatoid: TLongWordField
      FieldName = 'id'
    end
    object QueryTipoContatoNomeTipoContato: TStringField
      FieldName = 'NomeTipoContato'
      Required = True
      Size = 250
    end
  end
  object QueryDadosContato: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoa_contato'
      '  (id, Pessoa_id, Contato_tipo_id, contato)'
      'VALUES'
      '  (:id, :Pessoa_id, :Contato_tipo_id, :contato)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_contato'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE pessoa_contato'
      'SET'
      
        '  id = :id, Pessoa_id = :Pessoa_id, Contato_tipo_id = :Contato_t' +
        'ipo_id, contato = :contato'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_contato'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT id, Pessoa_id, Contato_tipo_id, contato FROM pessoa_conta' +
        'to'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM pessoa_contato')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT p.*, tp.NomeTipoContato'
      
        'FROM pessoa_contato p left join contato_tipo tp on p.contato_tip' +
        'o_id = tp.id'
      'where p.pessoa_id = :pPessoa_id;')
    Left = 280
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pPessoa_id'
        Value = nil
      end>
    object QueryDadosContatoid: TLongWordField
      FieldName = 'id'
    end
    object QueryDadosContatoPessoa_id: TLongWordField
      FieldName = 'Pessoa_id'
      Required = True
    end
    object QueryDadosContatoContato_tipo_id: TLongWordField
      FieldName = 'Contato_tipo_id'
      Required = True
    end
    object QueryDadosContatocontato: TStringField
      FieldName = 'contato'
      Required = True
      Size = 255
    end
    object QueryDadosContatoNomeTipoContato: TStringField
      FieldName = 'NomeTipoContato'
      ReadOnly = True
      Size = 250
    end
  end
  object QueryArea: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'Select * from profissao_area')
    Left = 548
    Top = 156
    object QueryAreaid: TLongWordField
      FieldName = 'id'
    end
    object QueryAreaNomeArea: TStringField
      FieldName = 'NomeArea'
      Required = True
      Size = 255
    end
  end
  object QueryOrcamentos: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT o.*, p.nomepessoa'
      'FROM orcamento o join pessoa p on o.contratado_id = p.id'
      'where contratante_id = :pId'
      'and Status = :pStatus'
      'order by data_orcamento;')
    Left = 160
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pId'
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'pStatus'
        Value = 0
      end>
    object QueryOrcamentosid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryOrcamentoscontratante_id: TLongWordField
      FieldName = 'contratante_id'
      Required = True
    end
    object QueryOrcamentoscontratado_id: TLongWordField
      FieldName = 'contratado_id'
      Required = True
    end
    object QueryOrcamentosdata_orcamento: TDateTimeField
      FieldName = 'data_orcamento'
      Required = True
    end
    object QueryOrcamentosStatus: TBooleanField
      FieldName = 'Status'
      Required = True
    end
    object QueryOrcamentosDescricao: TMemoField
      FieldName = 'Descricao'
      Required = True
      BlobType = ftMemo
    end
    object QueryOrcamentosnomepessoa: TStringField
      FieldName = 'nomepessoa'
      ReadOnly = True
      Size = 250
    end
  end
  object QueryOrcamento_Chat: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO orcamento_chat'
      '  (id, DataEnvio, Texto, orcamento_id, Pessoa_id)'
      'VALUES'
      '  (:id, :DataEnvio, :Texto, :orcamento_id, :Pessoa_id)')
    SQLDelete.Strings = (
      'DELETE FROM orcamento_chat'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE orcamento_chat'
      'SET'
      
        '  id = :id, DataEnvio = :DataEnvio, Texto = :Texto, orcamento_id' +
        ' = :orcamento_id, Pessoa_id = :Pessoa_id'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM orcamento_chat'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT id, DataEnvio, Texto, orcamento_id, Pessoa_id FROM orcame' +
        'nto_chat'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM orcamento_chat')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT o.*, p.NomePessoa'
      'FROM orcamento_chat o left join pessoa p on o.pessoa_id = p.id'
      'where orcamento_id = :pOrcamento_id'
      'order by DataEnvio;')
    Left = 280
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pOrcamento_id'
        Value = 4
      end>
    object QueryOrcamento_Chatid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryOrcamento_ChatDataEnvio: TDateTimeField
      FieldName = 'DataEnvio'
      Required = True
    end
    object QueryOrcamento_ChatTexto: TMemoField
      FieldName = 'Texto'
      Required = True
      BlobType = ftMemo
    end
    object QueryOrcamento_Chatorcamento_id: TLongWordField
      FieldName = 'orcamento_id'
      Required = True
    end
    object QueryOrcamento_ChatPessoa_id: TLongWordField
      FieldName = 'Pessoa_id'
      Required = True
    end
    object QueryOrcamento_ChatNomePessoa: TStringField
      FieldName = 'NomePessoa'
      ReadOnly = True
      Size = 250
    end
  end
  object QueryOrcamento_Proposta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO orcamento_proposta'
      
        '  (id, Orcamento_id, FormaPagamento_id, QtdParcelas, ValorTotal,' +
        ' DataInicio, DataPrevisao, Observacoes)'
      'VALUES'
      
        '  (:id, :Orcamento_id, :FormaPagamento_id, :QtdParcelas, :ValorT' +
        'otal, :DataInicio, :DataPrevisao, :Observacoes)')
    SQLDelete.Strings = (
      'DELETE FROM orcamento_proposta'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE orcamento_proposta'
      'SET'
      
        '  id = :id, Orcamento_id = :Orcamento_id, FormaPagamento_id = :F' +
        'ormaPagamento_id, QtdParcelas = :QtdParcelas, ValorTotal = :Valo' +
        'rTotal, DataInicio = :DataInicio, DataPrevisao = :DataPrevisao, ' +
        'Observacoes = :Observacoes'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM orcamento_proposta'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT id, Orcamento_id, FormaPagamento_id, QtdParcelas, ValorTo' +
        'tal, DataInicio, DataPrevisao, Observacoes FROM orcamento_propos' +
        'ta'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM orcamento_proposta')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT *'
      'FROM orcamento_proposta'
      'where orcamento_id = :pOrcamento_id;')
    Left = 548
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pOrcamento_id'
        Value = 4
      end>
    object QueryOrcamento_Propostaid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryOrcamento_PropostaOrcamento_id: TLongWordField
      FieldName = 'Orcamento_id'
      Required = True
    end
    object QueryOrcamento_PropostaFormaPagamento_id: TLongWordField
      FieldName = 'FormaPagamento_id'
      Required = True
    end
    object QueryOrcamento_PropostaQtdParcelas: TLongWordField
      FieldName = 'QtdParcelas'
    end
    object QueryOrcamento_PropostaValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Required = True
      currency = True
    end
    object QueryOrcamento_PropostaDataInicio: TDateTimeField
      FieldName = 'DataInicio'
      Required = True
    end
    object QueryOrcamento_PropostaDataPrevisao: TDateTimeField
      FieldName = 'DataPrevisao'
    end
    object QueryOrcamento_PropostaObservacoes: TMemoField
      FieldName = 'Observacoes'
      BlobType = ftMemo
    end
  end
  object QueryFormaPagamento: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select * from FormaPagamento;')
    Left = 416
    Top = 204
    object QueryFormaPagamentoid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryFormaPagamentoFormaPagamento: TStringField
      FieldName = 'FormaPagamento'
      Required = True
      Size = 200
    end
  end
  object QueryOrcamento_Contrato: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO orcamento_contrato'
      
        '  (id, Orcamento_id, Nota, Descricao, Status, DataAbertura, Data' +
        'Fechamento)'
      'VALUES'
      
        '  (:id, :Orcamento_id, :Nota, :Descricao, :Status, :DataAbertura' +
        ', :DataFechamento)')
    SQLDelete.Strings = (
      'DELETE FROM orcamento_contrato'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE orcamento_contrato'
      'SET'
      
        '  id = :id, Orcamento_id = :Orcamento_id, Nota = :Nota, Descrica' +
        'o = :Descricao, Status = :Status, DataAbertura = :DataAbertura, ' +
        'DataFechamento = :DataFechamento'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM orcamento_contrato'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT id, Orcamento_id, Nota, Descricao, Status, DataAbertura, ' +
        'DataFechamento FROM orcamento_contrato'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM orcamento_contrato')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT occ.*,'
      '       o.contratante_id,'
      '       o.contratado_id,'
      '       o.Descricao as DescOrcamento,'
      '       op.QtdParcelas,'
      '       op.ValorTotal,'
      '       op.Observacoes,'
      '       f.FormaPagamento,'
      '       p.NomePessoa as Profissional'
      
        'FROM orcamento_contrato occ left join orcamento o on occ.orcamen' +
        'to_id = o.id'
      
        '                            left join orcamento_proposta op on o' +
        '.id = op.orcamento_id'
      
        '                            left join FormaPagamento f on op.For' +
        'maPagamento_id = f.id'
      
        '                            left join pessoa p on p.id = o.contr' +
        'atado_id'
      'where o.contratante_id = :pContratante_id'
      'and occ.Status = :pStatus'
      'Order by dataabertura;')
    Active = True
    Left = 160
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pContratante_id'
        Value = 1
      end
      item
        DataType = ftBoolean
        Name = 'pStatus'
        Value = False
      end>
    object QueryOrcamento_Contratoid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryOrcamento_ContratoOrcamento_id: TLongWordField
      FieldName = 'Orcamento_id'
      Required = True
    end
    object QueryOrcamento_ContratoNota: TLongWordField
      FieldName = 'Nota'
    end
    object QueryOrcamento_ContratoDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object QueryOrcamento_ContratoStatus: TBooleanField
      FieldName = 'Status'
      Required = True
    end
    object QueryOrcamento_ContratoDataAbertura: TDateTimeField
      FieldName = 'DataAbertura'
      Required = True
    end
    object QueryOrcamento_ContratoDataFechamento: TDateTimeField
      FieldName = 'DataFechamento'
    end
    object QueryOrcamento_Contratocontratante_id: TLongWordField
      FieldName = 'contratante_id'
      ReadOnly = True
    end
    object QueryOrcamento_Contratocontratado_id: TLongWordField
      FieldName = 'contratado_id'
      ReadOnly = True
    end
    object QueryOrcamento_ContratoDescOrcamento: TMemoField
      FieldName = 'DescOrcamento'
      ReadOnly = True
      BlobType = ftMemo
    end
    object QueryOrcamento_ContratoQtdParcelas: TLongWordField
      FieldName = 'QtdParcelas'
      ReadOnly = True
    end
    object QueryOrcamento_ContratoValorTotal: TFloatField
      FieldName = 'ValorTotal'
      ReadOnly = True
    end
    object QueryOrcamento_ContratoObservacoes: TMemoField
      FieldName = 'Observacoes'
      ReadOnly = True
      BlobType = ftMemo
    end
    object QueryOrcamento_ContratoFormaPagamento: TStringField
      FieldName = 'FormaPagamento'
      ReadOnly = True
      Size = 200
    end
    object QueryOrcamento_ContratoProfissional: TStringField
      FieldName = 'Profissional'
      ReadOnly = True
      Size = 250
    end
  end
end
