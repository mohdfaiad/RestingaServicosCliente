unit UFormListaOrcamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox, Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView,
  FMX.Controls.Presentation, Xml.XMLDoc;

type
  TFormListaOrcamentos = class(TFormModelo)
    Rectangle1: TRectangle;
    Label1: TLabel;
    CbxOrcamento: TComboBox;
    LwOrcamento: TListView;
    BindSourceDB1: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    procedure CbxOrcamentoChange(Sender: TObject);
    procedure LwOrcamentoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BuscaOrcamento(Status:integer);
    { Public declarations }
  end;

var
  FormListaOrcamentos: TFormListaOrcamentos;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormChat;

procedure TFormListaOrcamentos.BuscaOrcamento(Status:integer);
begin
  with DMPrincipal do
  Begin
    QueryOrcamentos.Close;
    QueryOrcamentos.ParamByName('pId').AsInteger := QueryPessoaLogadaid.Value;
    QueryOrcamentos.ParamByName('pStatus').AsInteger := Status;
    QueryOrcamentos.Open;
  End;

end;

procedure TFormListaOrcamentos.CbxOrcamentoChange(Sender: TObject);
begin
  inherited;
  BuscaOrcamento(CbxOrcamento.ItemIndex);

end;

procedure TFormListaOrcamentos.FormShow(Sender: TObject);
begin
  inherited;
  CbxOrcamentoChange(self);
end;

procedure TFormListaOrcamentos.LwOrcamentoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
begin
  inherited;
  if FormChat = nil then
    application.CreateForm(TFormChat,FormChat);
  TFormChat.Create(self).Show;

end;

end.
