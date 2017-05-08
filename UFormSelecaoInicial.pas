unit UFormSelecaoInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormSelecaoInicial = class(TForm)
    Rectangle1: TRectangle;
    RctContratarProfissional: TRectangle;
    BtnContratarProfissional: TCornerButton;
    RctPrestador: TRectangle;
    BtnPrestadorServico: TCornerButton;
    ImgLogo: TImage;
    RctTenhoCadastro: TRectangle;
    BtnTenhoCadastro: TCornerButton;
    procedure BtnContratarProfissionalClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure BtnTenhoCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelecaoInicial: TFormSelecaoInicial;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UFormSelecionaArea, UFormLogin;

procedure TFormSelecaoInicial.BtnContratarProfissionalClick(Sender: TObject);
begin

  if FormSelecionaArea=nil then
    Application.CreateForm(TFormSelecionaArea,FormSelecionaArea);
  TFormSelecionaArea.create(self).show;

end;

procedure TFormSelecaoInicial.BtnTenhoCadastroClick(Sender: TObject);
begin
  if Formlogin=nil then
    Application.CreateForm(TFormlogin,Formlogin);
  TFormlogin.create(self).show;
end;

procedure TFormSelecaoInicial.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    key := 0;
    Application.Terminate;
  end;
end;

end.
