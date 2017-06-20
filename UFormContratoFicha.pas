unit UFormContratoFicha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView, FMX.Controls.Presentation, FMX.TabControl;

type
  TFormContratoFicha = class(TFormModelo)
    TbciGeral: TTabControl;
    RctContratar: TRectangle;
    BtnContratar: TButton;
    TabItemGeral: TTabItem;
    TabItemValoresEPrazos: TTabItem;
    RctDadosOrcamento: TRectangle;
    GplDados: TGridPanelLayout;
    GplDadosLinha1: TGridPanelLayout;
    LblProfissional: TLabel;
    LblProfissionalNome: TLabel;
    GplDadosLinha2: TGridPanelLayout;
    LblData: TLabel;
    LblDataCriacao: TLabel;
    GplDescricao: TGridPanelLayout;
    Label1: TLabel;
    TxtDescricao: TText;
    RctTituloDadosOrcamento: TRectangle;
    LblTituloOrcamento: TLabel;
    RctValores: TRectangle;
    RctValoresTitulo: TRectangle;
    Label2: TLabel;
    GplValores: TGridPanelLayout;
    Label4: TLabel;
    LblValortotal: TLabel;
    GplDescricaoValores: TGridPanelLayout;
    Label5: TLabel;
    TxtObservacoes: TText;
    Label3: TLabel;
    LblPagamento: TLabel;
    Label9: TLabel;
    LblParcela: TLabel;
    BindSourceDB1: TBindSourceDB;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    LinkPropertyToFieldText7: TLinkPropertyToField;
    LinkPropertyToFieldText8: TLinkPropertyToField;
    procedure BtnContratarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormContratoFicha: TFormContratoFicha;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormFinalizarContrato;

procedure TFormContratoFicha.BtnContratarClick(Sender: TObject);
begin
  inherited;
  if FormFinalizarContrato = nil then
    application.CreateForm(TFormFinalizarContrato,FormFinalizarContrato);
  TFormFinalizarContrato.Create(self).Show;
  close;
end;

end.
