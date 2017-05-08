unit UFormModelo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.MultiView;

type
  TFormModelo = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Rectangle1: TRectangle;
    BtnMenu: TButton;
    BtnBuscar: TButton;
    Layout2: TLayout;
    Image1: TImage;
    MultiView1: TMultiView;
    RctMenuTop: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Rectangle5: TRectangle;
    Image2: TImage;
    LblSair: TLabel;
    RctPrincipalMenu: TRectangle;
    Rectangle6: TRectangle;
    Image3: TImage;
    LblConfiguracoes: TLabel;
    Rectangle7: TRectangle;
    Image4: TImage;
    LblServicos: TLabel;
    Rectangle8: TRectangle;
    Image5: TImage;
    LblMinhaConta: TLabel;
    procedure BtnBuscarClick(Sender: TObject);
    procedure LblSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModelo: TFormModelo;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormPrincipal;

procedure TFormModelo.BtnBuscarClick(Sender: TObject);
begin
  FormPrincipal.Show;
end;

procedure TFormModelo.LblSairClick(Sender: TObject);
begin

  MessageDlg('Deseja realmente fechar o aplicativo?',
  System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
  procedure(const BotaoPressionado: TModalResult)
    begin
      case BotaoPressionado of
        mrYes: begin
            Application.Terminate;
          end;
        mrNo: begin
            ShowMessage('Você respondeu não');
          end;
      end;
    end);

end;

end.
