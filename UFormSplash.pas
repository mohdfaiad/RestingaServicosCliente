unit UFormSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TFormSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Pessoa_id:Integer;
    Nome_Pessoa:String;
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.fmx}

uses UFormPrincipal, UDMPrincipal, UFormSelecaoInicial;

procedure TFormSplash.Timer1Timer(Sender: TObject);
begin

  if (Timer1.Interval = 2000) then
  begin
    DMPrincipal.UniConnPrincipal.Connected:= true;
    if FormSelecaoInicial=nil then
      Application.CreateForm(TFormSelecaoInicial,FormSelecaoInicial);
    TFormSelecaoInicial.create(self).show;
    timer1.Enabled := false;
  end;


end;

end.
