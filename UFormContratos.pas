unit UFormContratos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, FMX.Layouts, FMX.MultiView, FMX.Objects,
  FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope;

type
  TFormContratos = class(TFormModelo)
    ListView1: TListView;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormContratos: TFormContratos;

implementation

{$R *.fmx}

end.
