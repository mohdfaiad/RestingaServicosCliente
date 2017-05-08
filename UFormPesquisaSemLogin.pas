unit UFormPesquisaSemLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFormPesquisaSemLogin = class(TForm)
    LblTitulo: TLabel;
    RctServicos: TRectangle;
    CbxServicos: TComboBox;
    LstVwProfissionais: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    procedure CbxServicosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure LstVwProfissionaisItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaSemLogin: TFormPesquisaSemLogin;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormLogin, UFormFichaProfissionalSemLogin;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormPesquisaSemLogin.CbxServicosChange(Sender: TObject);
begin
  with DMPrincipal do
  Begin
    QueryPessoa.Close;
    QueryPessoa.ParamByName('pProfissao').AsString :=  CbxServicos.Selected.Text;
    QueryPessoa.Open;

    if QueryPessoa.IsEmpty then
      ShowMessage('Sem profissionais para essa atividade!');
  End;

end;

procedure TFormPesquisaSemLogin.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    key := 0;
    close;
  end;
end;

procedure TFormPesquisaSemLogin.FormShow(Sender: TObject);
begin
  DMPrincipal.QueryProfissoes.Close;
  DMPrincipal.QueryProfissoes.Open;
end;

procedure TFormPesquisaSemLogin.LstVwProfissionaisItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
  id:string;
begin
  id := LstvwProfissionais.items[LstvwProfissionais.Selected.Index].Data['id'].ToString;

  with DMPrincipal do
  begin
    QueryProfissional.Close;
    QueryProfissional.ParamByName('pId').AsInteger := strtoint(id);
    QueryProfissional.Open;

    QueryServicosPrestados.Close;
    QueryServicosPrestados.ParamByName('pContratado_id').AsInteger := strtoint(id);
    QueryServicosPrestados.Open;
    TFormFichaProfissionalSemLogin.Create(self).Show;

  end;
end;

end.
