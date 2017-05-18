unit UFormFichaProfissional;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, FMX.Layouts, FMX.MultiView, FMX.Objects, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TFormFichaProfissional = class(TFormModelo)
    LytDescricao: TLayout;
    Rectangle4: TRectangle;
    Label3: TLabel;
    RecOrcamento: TRectangle;
    BtnOrcamento: TButton;
    Label4: TLabel;
    RecDescricao: TRectangle;
    TxtDescricao: TText;
    RecAvaliacoes: TRectangle;
    LstVwAvaliacoes: TListView;
    LytFoto: TLayout;
    Rectangle2: TRectangle;
    ImgFoto: TImage;
    Layout3: TLayout;
    LblServicosRealizadosview: TLabel;
    LblServicosRealizados: TLabel;
    Label2: TLabel;
    ImgAvaliacao: TImage;
    LytNome: TLayout;
    Rectangle9: TRectangle;
    LblNome: TLabel;
    LblProfissao: TLabel;
    LblCidade: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldTag: TLinkPropertyToField;
    procedure BtnOrcamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFichaProfissional: TFormFichaProfissional;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UDMPrincipal, UFormSolicitaOrcamento;

procedure TFormFichaProfissional.BtnOrcamentoClick(Sender: TObject);
begin
  inherited;
  if FormSolicitaOrcamento=nil then
    Application.CreateForm(TFormSolicitaOrcamento,FormSolicitaOrcamento);
  TFormSolicitaOrcamento.create(self).show;

end;

end.
