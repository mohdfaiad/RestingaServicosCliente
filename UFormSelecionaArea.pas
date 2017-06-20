unit UFormSelecionaArea;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TFormSelecionaArea = class(TForm)
    RctPrincipal: TRectangle;
    TxtTitulo: TText;
    GridPanelLayout1: TGridPanelLayout;
    RctConstrucao: TRectangle;
    ImgConstrucao: TImage;
    LblConstrucao: TLabel;
    RctCasa: TRectangle;
    ImgCasa: TImage;
    LblCasa: TLabel;
    RctEducacao: TRectangle;
    ImgEducacao: TImage;
    LblEducacao: TLabel;
    RctFesta: TRectangle;
    ImgFesta: TImage;
    LblFesta: TLabel;
    RctTecnologia: TRectangle;
    ImgTecnologia: TImage;
    LblTecnologia: TLabel;
    RctAutomotivo: TRectangle;
    ImgAutomotivo: TImage;
    LblAutomotivo: TLabel;
    RctAssistencia: TRectangle;
    ImgAssistencia: TImage;
    LblAssistencia: TLabel;
    RctConsultoria: TRectangle;
    ImgConsultoria: TImage;
    LblConsultoria: TLabel;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RctConstrucaoClick(Sender: TObject);
    procedure RctCasaClick(Sender: TObject);
    procedure RctEducacaoClick(Sender: TObject);
    procedure RctFestaClick(Sender: TObject);
    procedure RctTecnologiaClick(Sender: TObject);
    procedure RctAutomotivoClick(Sender: TObject);
    procedure RctAssistenciaClick(Sender: TObject);
    procedure RctConsultoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure abrePesquisa(area:integer);
    { Public declarations }
  end;

var
  FormSelecionaArea: TFormSelecionaArea;

implementation

{$R *.fmx}

uses UFormPrincipal, UFormPesquisaSemLogin, UFormSplash;

procedure TFormSelecionaArea.abrePesquisa(area: integer);
begin

  if FormSplash.Pessoa_id=0 then
  Begin
    if FormPesquisaSemLogin=nil then
      Application.CreateForm(TFormPesquisaSemLogin,FormPesquisaSemLogin);
    FormPesquisaSemLogin.Area := area;
    FormPesquisaSemLogin.show;
  End
  else
  Begin
    if FormPrincipal=nil then
      Application.CreateForm(TFormPrincipal,FormPrincipal);
    FormPrincipal.Area := area;
    FormPrincipal.show;
  End;

end;

procedure TFormSelecionaArea.FormClose(Sender: TObject; var Action: TCloseAction);
begin

//  action := TCloseAction.caFree;
//  FreeAndNil(FormSelecionaArea);

end;

procedure TFormSelecionaArea.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    key := 0;
    close;
  end;
end;

procedure TFormSelecionaArea.RctAssistenciaClick(Sender: TObject);
begin

  abrePesquisa(7);

end;

procedure TFormSelecionaArea.RctAutomotivoClick(Sender: TObject);
begin

  abrePesquisa(6);

end;

procedure TFormSelecionaArea.RctCasaClick(Sender: TObject);
begin

  abrePesquisa(2);

end;

procedure TFormSelecionaArea.RctConstrucaoClick(Sender: TObject);
begin

  abrePesquisa(1);

end;

procedure TFormSelecionaArea.RctConsultoriaClick(Sender: TObject);
begin

  abrePesquisa(8);

end;

procedure TFormSelecionaArea.RctEducacaoClick(Sender: TObject);
begin

  abrePesquisa(3);

end;

procedure TFormSelecionaArea.RctFestaClick(Sender: TObject);
begin

  abrePesquisa(4);

end;

procedure TFormSelecionaArea.RctTecnologiaClick(Sender: TObject);
begin

  abrePesquisa(5);

end;

end.
