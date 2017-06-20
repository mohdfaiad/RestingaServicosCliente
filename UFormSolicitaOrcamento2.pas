unit UFormSolicitaOrcamento2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, FMX.ScrollBox,
  FMX.Memo, Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView, FMX.Controls.Presentation;

type
  TFormSolicitaOrcamento2 = class(TFormModelo)
    Lbl1: TLabel;
    Lbl2: TLabel;
    Lbl3: TLabel;
    Layout1: TLayout;
    MemoTexto: TMemo;
    RecOrcamento: TRectangle;
    BtnEnviaOrcamento: TCornerButton;
    procedure BtnEnviaOrcamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    cliente_id: integer;
    { Public declarations }
  end;

var
  FormSolicitaOrcamento2: TFormSolicitaOrcamento2;

implementation

{$R *.fmx}

uses UFormPrincipal, UFormFichaProfissional, UFormSplash, UDMPrincipal;

procedure TFormSolicitaOrcamento2.BtnEnviaOrcamentoClick(Sender: TObject);
begin
  inherited;
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

procedure TFormSolicitaOrcamento2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  action := TCloseAction.caFree;
//  FreeAndNil(FormSolicitaOrcamento2);

end;

end.
