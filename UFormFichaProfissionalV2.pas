unit UFormFichaProfissionalV2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Ani, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.MultiView;

type
  TFormFichaProfissional = class(TFormModelo)
    LytNome: TLayout;
    LytFoto: TLayout;
    Rectangle2: TRectangle;
    LblNome: TLabel;
    LblProfissao: TLabel;
    Rectangle3: TRectangle;
    ImgFoto: TImage;
    LblCidade: TLabel;
    Layout3: TLayout;
    LblServicosRealizadosview: TLabel;
    ImgAvaliacao: TImage;
    Label1: TLabel;
    LblServicosRealizados: TLabel;
    LytDescricao: TLayout;
    Rectangle4: TRectangle;
    TxtDescricao: TText;
    Label3: TLabel;
    RecOrcamento: TRectangle;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    Label4: TLabel;
    LstVwAvaliacoes: TListView;
    RecDescricao: TRectangle;
    RecAvaliacoes: TRectangle;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    BtnOrcamento: TButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FOnAfter: TProc;
  public
    { Public declarations }
    class procedure ShowEx(pBefore: TProc = nil; pAfter: TProc = nil);
  end;

var
  FormFichaProfissional: TFormFichaProfissional;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UDMPrincipal;

procedure TFormFichaProfissional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(FOnAfter) then
    FOnAfter;

  Action := TCloseAction.cafree;
end;

procedure TFormFichaProfissional.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkHardwareBack then
  begin
    key := 0;
    Close;
  end;

end;

class procedure TFormFichaProfissional.ShowEx(pBefore, pAfter: TProc);
var
  lFrm: TFormFichaProfissional;
begin
  lFrm := Self.Create(Application);
  if Assigned(pBefore) then
    pBefore;
  lFrm.FOnAfter := pAfter;
  lFrm.Show;
end;

end.
