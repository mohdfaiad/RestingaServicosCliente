unit UFormSolicitaOrcamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, FMX.Layouts, FMX.MultiView, FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope;

type
  TFormSolicitaOrcamento = class(TFormModelo)
    Label2: TLabel;
    Label3: TLabel;
    MemoTexto: TMemo;
    StyleBook1: TStyleBook;
    Label4: TLabel;
    RecOrcamento: TRectangle;
    CornerButton1: TCornerButton;
    procedure CornerButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    cliente_id: integer;
    { Public declarations }
  end;

var
  FormSolicitaOrcamento: TFormSolicitaOrcamento;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormLogin, UFormSplash, UFormPrincipal, UFormFichaProfissional;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormSolicitaOrcamento.CornerButton1Click(Sender: TObject);
begin
  if MemoTexto.Text = '' then
  Begin
    ShowMessage('Informe ao profissional o que precisa!');
    MemoTexto.SetFocus;
  End
  Else
  Begin
    with DMPrincipal do
    Begin
      cliente_id :=  FormSplash.Pessoa_id;
      UniSQLAdicionaOrcamento.ParamByName('Contratante_id').Value := cliente_id;
      UniSQLAdicionaOrcamento.ParamByName('Contratado_id').Value := FormFichaProfissional.LblNome.Tag;
      UniSQLAdicionaOrcamento.ParamByName('data_orcamento').Value := now;
      UniSQLAdicionaOrcamento.ParamByName('status').Value := false;
      UniSQLAdicionaOrcamento.ParamByName('descricao').Value := MemoTexto.Text;
      UniSQLAdicionaOrcamento.Execute;

      Showmessage('Orçamento enviado com sucesso! Agora é só aguardar o profissional responder a sua solicitação.');
      FormPrincipal.Show;
      close;
    End;
  End;

end;

end.
