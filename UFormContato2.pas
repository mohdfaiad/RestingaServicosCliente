unit UFormContato2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox, FMX.Edit, FMX.Layouts, Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Effects,
  FMX.MultiView, FMX.Controls.Presentation;

type
  TFormContato2 = class(TFormModelo)
    GplCEPNum: TGridPanelLayout;
    LblCEP: TLabel;
    LblNumero: TLabel;
    EdtCEP: TEdit;
    EdtNumero: TEdit;
    LblEndereco: TLabel;
    EdtEndereco: TEdit;
    LblComplemento: TLabel;
    EdtComplemento: TEdit;
    RctDadosContato: TRectangle;
    GplTipo: TGridPanelLayout;
    CbxTipo: TComboBox;
    EdtTipo: TEdit;
    BtnTipo: TButton;
    Label1: TLabel;
    LvwTipo: TListView;
    ImgLogo: TImage;
    RctSalvar: TRectangle;
    BtnSalvar: TButton;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnTipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    function validaCampos:boolean;

    { Public declarations }
  end;

var
  FormContato2: TFormContato2;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormSplash;

{ TFormContato2 }

procedure TFormContato2.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  if validaCampos then
  begin
    DMPrincipal.QueryContato.Post;
    showMessage('Dados de Contato alterados com Sucesso!');
    close;
  end;

end;

procedure TFormContato2.BtnTipoClick(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  Begin
    Application.ProcessMessages;
    QueryDadosContato.append;
    QueryDadosContatoPessoa_id.value := QueryPessoaLogadaid.Value;
    QueryDadosContatoContato_tipo_id.Value := BindSourceDB3.DataSet.FieldByName('id').AsInteger;
    QueryDadosContatocontato.AsString := EdtTipo.Text;
    QueryDadosContato.Post;
    QueryDadosContato.Close;
    QueryDadosContato.Open;
  End;

end;

procedure TFormContato2.FormShow(Sender: TObject);
begin
  inherited;
  with DMPRincipal do
  begin
    QueryContato.Close;
    QueryContato.ParamByName('pUsuario_Id').Value:= FormSplash.Pessoa_id;
    QueryContato.Open;
    QueryContato.Edit;

    QueryDadoscontato.Close;
    QueryDadoscontato.ParamByName('pPessoa_id').Value := QueryPessoaLogadaid.Value;
    QueryDadoscontato.Open;

    QueryTipoContato.Close;
    QueryTipoContato.Open;
  end;

end;

function TFormContato2.validaCampos: boolean;
begin
  with DMPrincipal do
  begin
    if EdtCEP.Text<>'' then
    begin
      if EdtNumero.Text<>'' then
      begin
        if EdtEndereco.Text<>'' then
        begin
          if EdtComplemento.Text<>'' then
          begin
            result:=true;
          end
          else
          begin
            showMessage('Campo Complemento não pode estar vazio');
            result:=false;
          end;
        end
        else
        begin
          showMessage('Campo Endereco não pode estar vazio');
          result:=false;
        end;
      end
      else
      begin
        showMessage('Campo Numero não pode estar vazio');
        result:=false;
      end;
    end
    else
    begin
      showMessage('Campo CEP não pode estar vazio');
      result:=false;
    end;

  end;

end;

end.
