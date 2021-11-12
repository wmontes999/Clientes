unit FormTabla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls;

type
  TFrmTabla = class(TForm)
    DBGrid: TDBGrid;
    Data1: TDataSource;
    BtnAceptar: TButton;
    BtnCancelar: TButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTabla: TFrmTabla;

implementation
 uses FormClientes;
{$R *.dfm}

procedure TFrmTabla.BtnCancelarClick(Sender: TObject);
begin
 FrmTabla.Data1.DataSet.Close;
 Close;
end;

procedure TFrmTabla.BtnAceptarClick(Sender: TObject);
begin
 FrmRegClientes.EdtCodigo.Text := Data1.DataSet.FieldByName('Codigo').AsString;
 FrmTabla.Data1.DataSet.Close;
 if (Not FrmRegClientes.Buscar(Sender,strtoint(FrmRegClientes.EdtCodigo.Text))) then
 Showmessage('No existe registro');
 Close;
end;

end.
