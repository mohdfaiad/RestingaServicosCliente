unit UFormDadosPessoais;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Edit, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView,
  FMX.Controls.Presentation, FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.StdActns, FMX.Media;

type
  TFormDadosPessoais = class(TFormModelo)
    ImgFoto: TImage;
    LblNomeCompleto: TLabel;
    LblDataNascimento: TLabel;
    LblCPF: TLabel;
    EdtNomeCompleto: TEdit;
    EdtDatanascimento: TEdit;
    EdtCPF: TEdit;
    BtnSalvar: TButton;
    RctSalvar: TRectangle;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    CameraComponent1: TCameraComponent;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    GridPanelLayout1: TGridPanelLayout;
    Button1: TButton;
    Button2: TButton;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    RctBotoesFoto: TRectangle;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
  public
    function validaCampo:boolean;
    procedure GetImagem;


  end;

var
  FormDadosPessoais: TFormDadosPessoais;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UDMPrincipal, UFormSplash;


procedure TFormDadosPessoais.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  if validaCampo then
  begin
    DMPrincipal.QueryDadosPessoais.Post;
    showMessage('Dados salvos com sucesso');
    Close;
  end;
end;


procedure TFormDadosPessoais.FormShow(Sender: TObject);
begin
  inherited;
  with DMPRincipal do
  begin
    QueryDadosPessoais.Close;
    QueryDadosPessoais.ParamByName('pUsuario_Id').Value:= FormSplash.Pessoa_id;
    QueryDadosPessoais.Open;
    QueryDadosPessoais.Edit;
  end;
end;


procedure TFormDadosPessoais.GetImagem;
begin

  CameraComponent1.SampleBufferToBitmap(imgFoto.Bitmap, True);

end;

procedure TFormDadosPessoais.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  inherited;
  ShowShareSheetAction1.Bitmap.Assign(imgFoto.Bitmap);

end;

procedure TFormDadosPessoais.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);

begin
  inherited;
  Image.Resize(140,160);
  BindSourceDB1.DataSet.FieldByName('foto').Assign(image);

end;

procedure TFormDadosPessoais.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  inherited;
  Image.Resize(140,140);
  BindSourceDB1.DataSet.FieldByName('foto').Assign(image);
end;

function TFormDadosPessoais.validaCampo: boolean;
begin
  with DMPrincipal do
  begin
    if EdtNomeCompleto.Text<>'' then
    begin
      if EdtCPF.Text<>'' then
      begin
        if EdtDatanascimento.Text<>'' then
        begin
          result:=true;
        end
        else
        begin
          showMessage('Campo Data de Nascimento não pode estar vazio');
          result:=false;
        end;
      end
      else
      begin
        showMessage('Campo CPF não pode estar vazio');
        result:=false;
      end;
    end
    else
    begin
      showMessage('Campo Nome não pode estar vazio');
      result:=false;
    end;

  end;
end;

end.
