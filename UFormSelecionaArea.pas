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
    Image1: TImage;
    Label1: TLabel;
    Rectangle2: TRectangle;
    Image2: TImage;
    Label2: TLabel;
    Rectangle3: TRectangle;
    Image3: TImage;
    Label3: TLabel;
    Rectangle4: TRectangle;
    Image4: TImage;
    Label4: TLabel;
    Rectangle5: TRectangle;
    Image5: TImage;
    Label5: TLabel;
    Rectangle6: TRectangle;
    Image6: TImage;
    Label6: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelecionaArea: TFormSelecionaArea;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UFormPrincipal, UFormPesquisaSemLogin;

procedure TFormSelecionaArea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
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

procedure TFormSelecionaArea.Image1Click(Sender: TObject);
begin

  if FormPesquisaSemLogin=nil then
    Application.CreateForm(TFormPesquisaSemLogin,FormPesquisaSemLogin);
  TFormPesquisaSemLogin.create(self).show;

end;

end.
