unit FormPresentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFrmPresentacion = class(TForm)
    TrmPresentacion: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure TrmPresentacionTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPresentacion: TFrmPresentacion;

implementation

uses FormClientes;

{$R *.dfm}

procedure TFrmPresentacion.TrmPresentacionTimer(Sender: TObject);
begin
 TrmPresentacion.Enabled := False;
 Close;
end;

end.
