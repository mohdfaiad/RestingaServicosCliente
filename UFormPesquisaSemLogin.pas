unit UFormPesquisaSemLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Layouts;

type
  TFormPesquisaSemLogin = class(TForm)
    LblTitulo: TLabel;
    RctServicos: TRectangle;
    CbxServicos: TComboBox;
    LstVwProfissionais: TListView;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    BindSourceDB1: TBindSourceDB;
    StyleBook1: TStyleBook;
    BtnMostraComboArea: TButton;
    BtnSeta1: TButton;
    BtnSeta2: TButton;
    CbxArea: TComboBox;
    LinkFillControlToField: TLinkFillControlToField;
    BindSourceDB3: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    LytPessoa: TLayout;
    RctArea: TRectangle;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure LstVwProfissionaisItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure CbxServicosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CbxAreaChange(Sender: TObject);
    procedure BtnMostraComboAreaClick(Sender: TObject);
  private
    { Private declarations }
  public
    Area:integer;
    Status:Integer;
    { Public declarations }
  end;

var
  FormPesquisaSemLogin: TFormPesquisaSemLogin;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UDMPrincipal, UFormLogin, UFormFichaProfissionalSemLogin;

procedure TFormPesquisaSemLogin.BtnMostraComboAreaClick(Sender: TObject);
begin

  RctArea.Visible := not RctArea.Visible;
  if RctArea.Visible then
  Begin
    BtnSeta1.StyleLookup := 'arrowuptoolbutton';
    BtnSeta2.StyleLookup := 'arrowuptoolbutton';
  End
  Else
  Begin
    BtnSeta1.StyleLookup := 'arrowdowntoolbutton';
    BtnSeta2.StyleLookup := 'arrowdowntoolbutton';
  End;

end;

procedure TFormPesquisaSemLogin.CbxAreaChange(Sender: TObject);
begin
  with DMPrincipal do
  Begin
    QueryProfissoes.Close;
    QueryProfissoes.ParamByName('pNome').AsString := CbxArea.Selected.Text;
    QueryProfissoes.Open;
  End;
  RctArea.Visible := false;
  BtnSeta1.StyleLookup := 'arrowdowntoolbutton';
  BtnSeta2.StyleLookup := 'arrowdowntoolbutton';

end;

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


procedure TFormPesquisaSemLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

//  action := TCloseAction.caFree;
//  FreeAndNil(FormPesquisaSemLogin);

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
  with DMPrincipal do
  begin
    QueryArea.Close;
    QueryArea.Open;
    RctArea.Visible := true;
    BtnSeta1.StyleLookup := 'arrowuptoolbutton';
    BtnSeta2.StyleLookup := 'arrowuptoolbutton';
  end;

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
    close;

  end;
end;

end.
