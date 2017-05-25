unit UFormFichaProfissionalSemLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Objects, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Effects;

type
  TFormFichaProfissionalSemLogin = class(TForm)
    Layout2: TLayout;
    LytNome: TLayout;
    Rectangle2: TRectangle;
    LblNome: TLabel;
    LblProfissao: TLabel;
    LblCidade: TLabel;
    LytFoto: TLayout;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    LblServicosRealizadosview: TLabel;
    LblServicosRealizados: TLabel;
    Label1: TLabel;
    ImgAvaliacao: TImage;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    CircleFoto: TCircle;
    ShadowEffect3: TShadowEffect;
    LinkPropertyToFieldFillBitmapBitmap: TLinkPropertyToField;
    procedure BtnOrcamentoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFichaProfissionalSemLogin: TFormFichaProfissionalSemLogin;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UFormLogin, UDMPrincipal;

procedure TFormFichaProfissionalSemLogin.BtnOrcamentoClick(Sender: TObject);
begin
  ShowMessage('Voce precisa estar logado para solicitar o orçamento de um profissional!');
  if FormLogin = nil then
    application.CreateForm(TFormLogin,FormLogin);
  TFormLogin.Create(self).Show;
end;

procedure TFormFichaProfissionalSemLogin.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

//  if Key = vkHardwareBack then
//    close;

end;

end.
