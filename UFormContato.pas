unit UFormContato;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.ListBox, FMX.Layouts, FMX.Edit,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Effects,
  FMX.MultiView, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFormContato = class(TFormModelo)
    LblTituloContato: TLabel;
    BtnSalvar: TButton;
    RctSalvar: TRectangle;
    GplCEPNum: TGridPanelLayout;
    LblCEP: TLabel;
    LblNumero: TLabel;
    EdtCEP: TEdit;
    EdtNumero: TEdit;
    LblEndereco: TLabel;
    EdtEndereco: TEdit;
    LblComplemento: TLabel;
    EdtComplemento: TEdit;
    GplTipo: TGridPanelLayout;
    CbxTipo: TComboBox;
    EdtTipo: TEdit;
    BtnTipo: TButton;
    LvwTipo: TListView;
    VsbTipo: TVertScrollBox;
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    function validaCampoCEP:boolean;
  end;

var
  FormContato: TFormContato;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormSplash;
{$R *.LgXhdpiPh.fmx ANDROID}

//procedure TFormContato.BtnSalvarClick(Sender: TObject);
//begin
  //inherited;
 // if validaCampos then
 // begin
  //  showMessage('Dados de Contato alterados com Sucesso!');
 //   close;
 // end;
//end;


end.
