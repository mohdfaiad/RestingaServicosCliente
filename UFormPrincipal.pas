unit UFormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.MultiView, FMX.Effects;

type
  TFormPrincipal = class(TFormModelo)
    CbxProfissoes: TComboBox;
    LstvwProfissionais: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    RctFundoPrincipal: TRectangle;
    Rectangle2: TRectangle;
    BtnMostraComboArea: TButton;
    CbxArea: TComboBox;
    BtnSeta1: TButton;
    BtnSeta2: TButton;
    BindSourceDB3: TBindSourceDB;
    LinkFillControlToField: TLinkFillControlToField;
    LinkFillControlToField3: TLinkFillControlToField;
    RctArea: TRectangle;
    procedure CbxProfissoesChange(Sender: TObject);
    procedure LstvwProfissionaisItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnMostraComboAreaClick(Sender: TObject);
    procedure CbxAreaChange(Sender: TObject);
  private
    { Private declarations }
  public
    area:Integer;
    Status:Integer;
    procedure consultaProfissional(Origem:Integer);

    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UDMPrincipal, UFormFichaProfissional;

procedure TFormPrincipal.BtnMostraComboAreaClick(Sender: TObject);
begin
  inherited;

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

procedure TFormPrincipal.CbxAreaChange(Sender: TObject);
begin
  inherited;
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

procedure TFormPrincipal.CbxProfissoesChange(Sender: TObject);
begin
  inherited;

  consultaProfissional(Status);

end;

procedure TFormPrincipal.consultaProfissional(Origem: Integer);
begin

  with DMPrincipal do
  Begin
    QueryPessoa.Close;
    QueryPessoa.ParamByName('pProfissao').AsString := CbxProfissoes.Selected.Text;
    QueryPessoa.Open;

    if QueryPessoa.IsEmpty then
      ShowMessage('Sem profissionais para essa atividade!');
  End;

end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  action := TCloseAction.caFree;
//  FreeAndNil(FormPrincipal);

end;

procedure TFormPrincipal.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkHardwareBack then
  begin
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

            end;
          end;
        end
      );
  end;

end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  begin
    QueryArea.Close;
    QueryArea.Open;
    RctArea.Visible := true;
    BtnSeta1.StyleLookup := 'arrowuptoolbutton';
    BtnSeta2.StyleLookup := 'arrowuptoolbutton';
  end;

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
    if FormFichaProfissional=nil then
      Application.CreateForm(TFormFichaProfissional,FormFichaProfissional);
    TFormFichaProfissional.Create(self).Show;
  end;

end;

end.
