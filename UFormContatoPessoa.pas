unit UFormContatoPessoa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, UFormModelo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.MultiView, FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.ListBox, FMX.Edit;

type
  TFormContatoPessoa = class(TFormModelo)
    EdtComplemento: TEdit;
    EdtEndereco: TEdit;
    GplCEPNum: TGridPanelLayout;
    LblCEP: TLabel;
    LblNumero: TLabel;
    EdtCEP: TEdit;
    EdtNumero: TEdit;
    GplTipo: TGridPanelLayout;
    CbxTipo: TComboBox;
    EdtTipo: TEdit;
    BtnTipo: TButton;
    LblComplemento: TLabel;
    LblEndereco: TLabel;
    LblTituloContato: TLabel;
    LvwTipo: TListView;
    VsbTipo: TVertScrollBox;
    RctSalvar: TRectangle;
    BtnSalvar: TButton;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormContatoPessoa: TFormContatoPessoa;

implementation

{$R *.fmx}

uses UDMPrincipal;

end.
