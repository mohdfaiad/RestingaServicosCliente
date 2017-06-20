unit UFormChat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, FMX.Layouts, FMX.MultiView, FMX.Objects,
  FMX.Controls.Presentation, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Ani, FMX.Edit,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Effects, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.TabControl, FMX.EditBox, FMX.SpinBox, FMX.ListBox,
  FMX.ComboEdit;

type
  TFormChat = class(TFormModelo)
    RctContratar: TRectangle;
    BtnContratar: TButton;
    RctDadosOrcamento: TRectangle;
    LblTituloOrcamento: TLabel;
    GplDados: TGridPanelLayout;
    GplDadosLinha1: TGridPanelLayout;
    GplDadosLinha2: TGridPanelLayout;
    LblProfissional: TLabel;
    LblProfissionalNome: TLabel;
    LblData: TLabel;
    LblDataCriacao: TLabel;
    GplDescricao: TGridPanelLayout;
    Label1: TLabel;
    TxtDescricao: TText;
    RctChatOrcamento: TRectangle;
    LwChat: TListView;
    BtnEnviaMensagem: TButton;
    BindSourceDB1: TBindSourceDB;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    RctMensagem: TRectangle;
    EdtMensagemChat: TEdit;
    Layout1: TLayout;
    Layout2: TLayout;
    RctTituloDadosOrcamento: TRectangle;
    Rectangle1: TRectangle;
    Label3: TLabel;
    TbcOrcamento: TTabControl;
    TabItemGeral: TTabItem;
    TabItemValores: TTabItem;
    RctValores: TRectangle;
    RctValoresTitulo: TRectangle;
    Label2: TLabel;
    GplValores: TGridPanelLayout;
    Label4: TLabel;
    LblValortotal: TLabel;
    Label6: TLabel;
    LblDataInicio: TLabel;
    Label8: TLabel;
    LblDataFim: TLabel;
    GplDescricaoValores: TGridPanelLayout;
    Label5: TLabel;
    TxtObservacoes: TText;
    RctFormaPagamento: TRectangle;
    Rectangle3: TRectangle;
    Label7: TLabel;
    GplFormaPagamentoCampos: TGridPanelLayout;
    Label9: TLabel;
    CbxFormaPagamento: TComboBox;
    Label10: TLabel;
    RctAlterarFormaPagamento: TRectangle;
    Button1: TButton;
    BindSourceDB3: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB4: TBindSourceDB;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    LinkPropertyToFieldText7: TLinkPropertyToField;
    LinkPropertyToFieldText8: TLinkPropertyToField;
    CbxParcelas: TComboEdit;
    LinkFillControlToField3: TLinkFillControlToField;
    procedure BtnEnviaMensagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabItemValoresClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CbxFormaPagamentoChange(Sender: TObject);
    procedure BtnContratarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChat: TFormChat;

implementation

{$R *.fmx}

uses UDMPrincipal;

procedure TFormChat.BtnContratarClick(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  begin
    QueryOrcamento_Contrato.Close;
    QueryOrcamento_Contrato.ParamByName('pContratante_id').AsInteger := QueryPessoaLogadaid.Value;
    QueryOrcamento_Contrato.Open;

    QueryOrcamento_Contrato.Append;
    QueryOrcamento_ContratoOrcamento_id.Value := BindSourceDB1.DataSet.FieldByName('id').AsInteger;
    QueryOrcamento_ContratoStatus.Value := false;
    QueryOrcamento_ContratoDataAbertura.Value := now;
    QueryOrcamento_Contrato.Post;

    QueryOrcamentos.Edit;
    QueryOrcamentosStatus.Value := true;
    QueryOrcamentos.Post;

    ShowMessage('Orçamento aprovado com sucesso! Acompanhe o andamento do serviço pelo opção Contratos do Menu.');
    Close;
  end;


end;

procedure TFormChat.BtnEnviaMensagemClick(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  begin
    if EdtMensagemChat.Text<>'' then
    Begin
      QueryOrcamento_Chat.Append;
      QueryOrcamento_ChatDataEnvio.Value := now;
      QueryOrcamento_ChatTexto.Value := EdtMensagemChat.Text;
      QueryOrcamento_Chatorcamento_id.AsInteger := BindSourceDB1.DataSet.FieldByName('id').AsInteger;
      QueryOrcamento_ChatPessoa_id.AsInteger := QueryPessoaLogadaid.Value;
      QueryOrcamento_Chat.Post;
      QueryOrcamento_Chat.close;
      QueryOrcamento_Chat.open;
    End;
  end;

end;

procedure TFormChat.Button1Click(Sender: TObject);
begin
  inherited;
  dmprincipal.QueryOrcamento_Proposta.Post;

end;

procedure TFormChat.CbxFormaPagamentoChange(Sender: TObject);
begin
  inherited;
//  case CbxFormaPagamento.ItemIndex of
//    0:Begin
//        dmprincipal.QueryOrcamento_Proposta.edit;
//        dmprincipal.QueryOrcamento_PropostaQtdParcelas.AsInteger :=1;
////        CbxParcelas.Text := '1';
//        CbxParcelas.Enabled := false;
//      End;
//    1:CbxParcelas.Enabled := True;
//    2:CbxParcelas.Enabled := True;
//    3:Begin
//        dmprincipal.QueryOrcamento_Proposta.edit;
//        dmprincipal.QueryOrcamento_PropostaQtdParcelas.AsInteger :=1;
////        CbxParcelas.Text := '1';
//        CbxParcelas.Enabled := false;
//      End;
//  end;

end;

procedure TFormChat.FormShow(Sender: TObject);
begin
  inherited;
  with dmprincipal do
  Begin
    RctChatOrcamento.Enabled := not BindSourceDB1.DataSet.FieldByName('Status').AsBoolean;
    RctFormaPagamento.Enabled := not BindSourceDB1.DataSet.FieldByName('Status').AsBoolean;
    RctContratar.Visible := not BindSourceDB1.DataSet.FieldByName('Status').AsBoolean;

    QueryOrcamento_Chat.close;
    QueryOrcamento_Chat.ParamByName('pOrcamento_id').AsInteger := BindSourceDB1.DataSet.FieldByName('id').AsInteger;
    QueryOrcamento_Chat.open;
  End;

end;

procedure TFormChat.TabItemValoresClick(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  Begin
    QueryFormaPagamento.Close;
    QueryFormaPagamento.Open;
    QueryOrcamento_Proposta.Close;
    QueryOrcamento_Proposta.ParamByName('pOrcamento_id').AsInteger := BindSourceDB1.DataSet.FieldByName('id').AsInteger;
    QueryOrcamento_Proposta.Open;

    if QueryOrcamento_Proposta.IsEmpty then
      TabItemValores.Enabled := false
    else
    Begin
      TabItemValores.Enabled := True;
      QueryOrcamento_Proposta.Edit;
    End;

  End;


end;

end.
