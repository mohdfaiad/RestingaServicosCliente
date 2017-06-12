unit UFormDadosPessoais;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Edit, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView,
  FMX.Controls.Presentation;

type
  TFormDadosPessoais = class(TFormModelo)
    LblTituloDadosPessoais: TLabel;
    ImgFoto: TImage;
    ImgCamera: TImage;
    LblNomeCompleto: TLabel;
    LblDataNascimento: TLabel;
    LblCPF: TLabel;
    EdtNomeCompleto: TEdit;
    EdtDatanascimento: TEdit;
    EdtCPF: TEdit;
    BtnSalvar: TButton;
    RctSalvar: TRectangle;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    function validaCampo:boolean;

  end;

var
  FormDadosPessoais: TFormDadosPessoais;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormSplash;

{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormDadosPessoais.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  if validaCampo then
  begin
    DMPrincipal.QueryDadosPessoais.Post;
    showMessage('Dados salvos com sucesso');
    Close;
  end;
end;


procedure TFormDadosPessoais.FormShow(Sender: TObject);
begin
  inherited;
  with DMPRincipal do
  begin
    QueryDadosPessoais.Close;
    QueryDadosPessoais.ParamByName('pUsuario_Id').Value:= FormSplash.Pessoa_id;
    QueryDadosPessoais.Open;
    QueryDadosPessoais.Edit;
  end;
end;


function TFormDadosPessoais.validaCampo: boolean;
begin
  with DMPrincipal do
  begin
    if EdtNomeCompleto.Text<>'' then
    begin
      if EdtCPF.Text<>'' then
      begin
        if EdtDatanascimento.Text<>'' then
        begin
          result:=true;
        end
        else
        begin
          showMessage('Campo Data de Nascimento não pode estar vazio');
          result:=false;
        end;
      end
      else
      begin
        showMessage('Campo CPF não pode estar vazio');
        result:=false;
      end;
    end
    else
    begin
      showMessage('Campo Nome não pode estar vazio');
      result:=false;
    end;

  end;
end;

end.
