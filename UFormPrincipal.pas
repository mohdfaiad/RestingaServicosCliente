unit UFormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.MultiView;

type
  TFormPrincipal = class(TFormModelo)
    CbxProfissoes: TComboBox;
    LstvwProfissionais: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    RctFundoPrincipal: TRectangle;
    Rectangle2: TRectangle;
    procedure CbxProfissoesChange(Sender: TObject);
    procedure LstvwProfissionaisItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UDMPrincipal, UFormFichaProfissional;

procedure TFormPrincipal.CbxProfissoesChange(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  Begin
    QueryPessoa.Close;
    QueryPessoa.ParamByName('pProfissao').AsString :=  CbxProfissoes.Selected.Text;
    QueryPessoa.Open;

    if QueryPessoa.IsEmpty then
      ShowMessage('Sem profissionais para essa atividade!');
  End;

end;

procedure TFormPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := False;
  MessageDlg('Deseja realmente fechar o aplicativo?',
    System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const BotaoPressionado: TModalResult)
      begin
        case BotaoPressionado of
          mrYes:
          begin
            Application.Terminate;
          end;
          mrNo:
          begin
            Show;
          end;
        end;
      end
    );

end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  DMPrincipal.QueryProfissoes.Close;
  DMPrincipal.QueryProfissoes.Open;

end;

procedure TFormPrincipal.LstvwProfissionaisItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
  id:string;
begin
  inherited;
  id := LstvwProfissionais.items[LstvwProfissionais.Selected.Index].Data['id'].ToString;

  with DMPrincipal do
  begin
    QueryProfissional.Close;
    QueryProfissional.ParamByName('pId').AsInteger := strtoint(id);
    QueryProfissional.Open;

    QueryServicosPrestados.Close;
    QueryServicosPrestados.ParamByName('pContratado_id').AsInteger := strtoint(id);
    QueryServicosPrestados.Open;
    TFormFichaProfissional.Create(self).Show;

  end;

end;

end.
