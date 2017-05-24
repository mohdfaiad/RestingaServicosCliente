unit UFormModelo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.MultiView, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.Effects;

type
  TFormModelo = class(TForm)
    Lyt1: TLayout;
    TbPrincipal: TToolBar;
    RctMenuSuperior: TRectangle;
    BtnMenu: TButton;
    BtnBuscar: TButton;
    Lyt2: TLayout;
    ImgLogo: TImage;
    MvMenu: TMultiView;
    RctMenuTop: TRectangle;
    VsbMenu: TVertScrollBox;
    RctSair: TRectangle;
    ImgSair: TImage;
    LblSair: TLabel;
    RctPrincipalMenu: TRectangle;
    RctConfiguracoes: TRectangle;
    ImgConfiguracao: TImage;
    LblConfiguracoes: TLabel;
    RctServicos: TRectangle;
    ImgServicos: TImage;
    LblServicos: TLabel;
    RctMinhaConta: TRectangle;
    ImgMinhaConta: TImage;
    LblMinhaConta: TLabel;
    RctOrcamento: TRectangle;
    ImgOrcamento: TImage;
    LblOrcamento: TLabel;
    RctContratos: TRectangle;
    ImgContratos: TImage;
    LblContratos: TLabel;
    LineSeparador: TLine;
    LblNomeUsuario: TLabel;
    BDSPessoaLogada: TBindSourceDB;
    BdlPessoaLogada: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    CrlFoto: TCircle;
    LinkPropertyToFieldFillBitmapBitmap: TLinkPropertyToField;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    procedure BtnBuscarClick(Sender: TObject);
    procedure LblSairClick(Sender: TObject);
    procedure LblOrcamentoClick(Sender: TObject);
    procedure LblServicosClick(Sender: TObject);
//    procedure ContratosClick(Sender: TObject);
    procedure RctContratosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModelo: TFormModelo;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormPrincipal, UFormChat, UFormContratos, UFormServicos, UFormLogin;

procedure TFormModelo.BtnBuscarClick(Sender: TObject);
begin
  FormPrincipal.Show;
end;

procedure TFormModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FreeAndNil(FormModelo);

end;

procedure TFormModelo.LblOrcamentoClick(Sender: TObject);
begin
  if FormChat=nil then
    Application.CreateForm(TFormChat,FormChat);
  TFormChat.create(self).show;
end;

procedure TFormModelo.LblSairClick(Sender: TObject);
begin

  MessageDlg('Deseja realmente fechar o aplicativo?',
  System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
  procedure(const BotaoPressionado: TModalResult)
    begin
      case BotaoPressionado of
        mrYes:
        begin
          if FormLogin = nil then
          Begin
            application.CreateForm(TFormLogin,FormLogin);
            TFormLogin.Create(self).Show;
          End
          else
            FormLogin.Show;
          close;
        end;
        mrNo:
        begin
          ShowMessage('Você respondeu não');
        end;
      end;
    end);

end;

procedure TFormModelo.LblServicosClick(Sender: TObject);
begin
  if FormServicos = nil then
    application.CreateForm(TFormServicos,FormServicos);
  TFormServicos.Create(self).Show;
end;

procedure TFormModelo.RctContratosClick(Sender: TObject);
begin
if FormContratos = nil then
    application.CreateForm(TFormContratos,FormContratos);
  TFormContratos.create(self).show;
end;

end.
