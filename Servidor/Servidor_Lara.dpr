program Servidor_Lara;

uses
  Forms,
  Contador in 'Contador.pas' {Form1},
  Servidor_Lara_TLB in 'Servidor_Lara_TLB.pas',
  Conection in 'Conection.pas' {Coneccion: TRemoteDataModule} {Coneccion: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
