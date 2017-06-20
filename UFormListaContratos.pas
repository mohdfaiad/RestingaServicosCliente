unit UFormListaContratos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView, FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.ListBox;

type
  TFormListaContratos = class(TFormModelo)
    Rectangle1: TRectangle;
    Label1: TLabel;
    CbxContrato: TComboBox;
    LwContratos: TListView;
    BindSourceDB1: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    procedure CbxContratoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LwContratosItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
  procedure buscaContratos(Status:integer);
    { Public declarations }
  end;

var
  FormListaContratos: TFormListaContratos;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormContratoFicha;

{ TFormListaContratos }

procedure TFormListaContratos.buscaContratos(Status: integer);
begin
  with DMPrincipal do
  Begin
    QueryOrcamento_Contrato.Close;
    QueryOrcamento_Contrato.ParamByName('pContratante_id').AsInteger := QueryPessoaLogadaid.Value;
    QueryOrcamento_Contrato.ParamByName('pStatus').AsInteger := Status;
    QueryOrcamento_Contrato.Open;
  End;

end;

procedure TFormListaContratos.CbxContratoChange(Sender: TObject);
begin
  inherited;
  buscaContratos(CbxContrato.ItemIndex);
end;

procedure TFormListaContratos.FormShow(Sender: TObject);
begin
  inherited;
  CbxContratoChange(self);
end;

procedure TFormListaContratos.LwContratosItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
begin
  inherited;
  if FormContratoFicha=nil then
    application.CreateForm(TFormContratoFicha,FormContratoFicha);
  TFormContratoFicha.Create(self).Show;

end;

end.
