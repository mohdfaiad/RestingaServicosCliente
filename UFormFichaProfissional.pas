unit UFormFichaProfissional;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, FMX.Layouts, FMX.MultiView, FMX.Objects, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Effects;

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
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldTag: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    CircleFoto: TCircle;
    LinkPropertyToFieldFillBitmapBitmap2: TLinkPropertyToField;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    procedure BtnOrcamentoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses UDMPrincipal, UFormSolicitaOrcamento, UFormSolicitaOrcamento2;

procedure TFormFichaProfissional.BtnOrcamentoClick(Sender: TObject);
begin
  inherited;
  if FormSolicitaOrcamento2=nil then
    Application.CreateForm(TFormSolicitaOrcamento2,FormSolicitaOrcamento2);
  TFormSolicitaOrcamento2.create(self).show;

end;

procedure TFormFichaProfissional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  action := TCloseAction.caFree;
//  FreeAndNil(FormFichaProfissional);

end;

procedure TFormFichaProfissional.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkHardwareBack then
    close;
end;

end.
