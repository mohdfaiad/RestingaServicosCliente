unit UFormFinalizarContrato;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView, FMX.Controls.Presentation, FMX.ListBox;

type
  TFormFinalizarContrato = class(TFormModelo)
    Rectangle1: TRectangle;
    RctTituloDadosOrcamento: TRectangle;
    LblTituloOrcamento: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    RctAlterarFormaPagamento: TRectangle;
    Button1: TButton;
    Label1: TLabel;
    CbxNota: TComboBox;
    Rectangle2: TRectangle;
    Label2: TLabel;
    TxtDescricao: TText;
    BindSourceDB1: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFinalizarContrato: TFormFinalizarContrato;

implementation

{$R *.fmx}

uses UDMPrincipal;

procedure TFormFinalizarContrato.Button1Click(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  Begin
    QueryOrcamento_ContratoStatus.Value := true;
    QueryOrcamento_Contrato.post;
    ShowMessage('Contrato finalizado com sucesso! Obrigado por usar o Restinga Serviços!');
    Close;
  End;

end;

procedure TFormFinalizarContrato.FormShow(Sender: TObject);
begin
  inherited;
  with DMPrincipal do
  Begin
    QueryOrcamento_Contrato.Edit;

  End;

end;

end.
