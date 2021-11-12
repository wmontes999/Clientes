program Clientes;

uses
  Forms,
  FormClientes in 'FormClientes.pas' {FrmRegClientes},
  FormPresentacion in 'FormPresentacion.pas' {FrmPresentacion},
  FormTabla in 'FormTabla.pas' {FrmTabla};

{$R *.res}

begin
  Application.Initialize;

  FrmPresentacion := TFrmPresentacion.Create(Application);
  FrmPresentacion.Show;
  FrmPresentacion.Update;
  while FrmPresentacion.TrmPresentacion.Enabled do
  Application.ProcessMessages;
  Application.CreateForm(TFrmRegClientes, FrmRegClientes);
  Application.CreateForm(TFrmTabla, FrmTabla);
  Application.Run;
end.
