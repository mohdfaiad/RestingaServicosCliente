unit UFormChat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFormModelo, FMX.Layouts, FMX.MultiView, FMX.Objects,
  FMX.Controls.Presentation, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Ani, FMX.Edit,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Effects;

type
  TFormChat = class(TFormModelo)
    EdtMensagem: TEdit;
    BtnEnviar: TButton;
    BtnContratar: TButton;
    RctPedido: TRectangle;
    VsbPedido: TVertScrollBox;
    RectAnimation1: TRectAnimation;
    RctChat: TRectangle;
    VsbChat: TVertScrollBox;
    TxtPedido: TText;
    LblPedidoOriginal: TLabel;
    RctContratar: TRectangle;
    RctEnviar: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChat: TFormChat;

implementation

{$R *.fmx}

end.
