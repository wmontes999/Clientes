unit Conection;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Servidor_Lara_TLB, StdVcl, DBTables, DB, Provider;

type
  TConeccion = class(TRemoteDataModule, IConeccion)
    Query3: TQuery;
    Database: TDatabase;
    Sesion: TSession;
    Querydet1: TQuery;
    Query4: TQuery;
    SQLConsulta1: TQuery;
    ProviderConsulta1: TDataSetProvider;
    Query1: TQuery;
    DataSetProvider1: TDataSetProvider;
    Query2: TQuery;
    DataSource1: TDataSource;
    Query5: TQuery;
    Query6: TQuery;
    Query7: TQuery;
    Query8: TQuery;
    Query9: TQuery;
    Querydet2: TQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Querydet3: TQuery;
    DataSource4: TDataSource;
    Querydet4: TQuery;
    QryMaster: TQuery;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure AsignBD(const Alias, Password: WideString); safecall;
    procedure AsignSQL(const StringSql: WideString); safecall;
    procedure repCSQL(const SqlRep, Alias: WideString); safecall;
    procedure repDSQL(const SqlRep, Alias: WideString); safecall;
    procedure repD1SQL(const SqlRep, Alias: WideString); safecall;
    procedure repD2SQL(const SqlRep, Alias: WideString); safecall;
    procedure repD3SQL(const SqlRep: WideString); safecall;
    procedure repD4SQL(const SqlRep: WideString); safecall;
    procedure repD5SQL(const SqlRep: WideString); safecall;
    procedure repD6SQL(const SqlRep: WideString); safecall;
    procedure repD7SQL(const SqlRep: WideString); safecall;
    procedure repdet1SQL(const RepSql: WideString); safecall;
    procedure repdet2SQL(const RepSQL: WideString); safecall;
    procedure repdet3SQL(const RepSQL: WideString); safecall;
    procedure repdet4SQL(const RepSQL: WideString); safecall;
    procedure FijarMaster(const Alias, Password: WideString); safecall;
    procedure FijarSQL(const StringSql, Accion, StringDB: WideString);
      safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TConeccion.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TConeccion.AsignBD(const Alias, Password: WideString);
begin
 try
   Database.Close;
   Database.AliasName :=Alias;
   Query1.DatabaseName:=Alias;
   Query2.DatabaseName:=Alias;
   Query3.DatabaseName:=Alias;
   Query4.DatabaseName:=Alias;

   if Password<>'' then
    Database.Params.Values['PASSWORD']:=Password;
    Database.Open;
   except
    on E: EDBEngineError do
      if (Password = '') then
        raise Exception.Create('Password Required') else
        raise;
  end;
end;

procedure TConeccion.AsignSQL(const StringSql: WideString);
begin
 SQLConsulta1.SQL.Text:=StringSql;
end;


procedure TConeccion.repCSQL(const SqlRep, Alias: WideString);
begin
 Query1.SQL.Text:=SqlRep;
 Query1.DatabaseName:=Alias;
end;

procedure TConeccion.repDSQL(const SqlRep, Alias: WideString);
begin
 Query2.SQL.Text:=SqlRep;
 Query2.DatabaseName:=Alias;
end;

procedure TConeccion.repD1SQL(const SqlRep, Alias: WideString);
begin
 Query3.SQL.Text:=SqlRep;
 Query3.DatabaseName:=Alias;
end;

procedure TConeccion.repD2SQL(const SqlRep, Alias: WideString);
begin
 Query4.SQL.Text:=SqlRep;
 Query4.DatabaseName:=Alias;
end;

procedure TConeccion.repD3SQL(const SqlRep: WideString);
begin
 Query5.SQL.Text:=SqlRep;
end;

procedure TConeccion.repD4SQL(const SqlRep: WideString);
begin
 Query6.SQL.Text:=SqlRep;
end;

procedure TConeccion.repD5SQL(const SqlRep: WideString);
begin
 Query7.SQL.Text:=SqlRep;
end;

procedure TConeccion.repD6SQL(const SqlRep: WideString);
begin
 Query8.SQL.Text:=SqlRep;
end;

procedure TConeccion.repD7SQL(const SqlRep: WideString);
begin
 Query9.SQL.Text:=SqlRep;
end;

procedure TConeccion.repdet1SQL(const RepSql: WideString);
begin
 Querydet1.SQL.Text:=RepSql;
end;

procedure TConeccion.repdet2SQL(const RepSQL: WideString);
begin
 Querydet2.SQL.Text:=RepSql;
end;

procedure TConeccion.repdet3SQL(const RepSQL: WideString);
begin
 Querydet3.SQL.Text:=RepSql;
end;

procedure TConeccion.repdet4SQL(const RepSQL: WideString);
begin
 Querydet4.SQL.Text:=RepSql;
end;

procedure TConeccion.FijarMaster(const Alias, Password: WideString);
begin
 try
   Database.Close;
   Database.AliasName :=Alias;
   QryMaster.DatabaseName:=Alias;

   if Password<>'' then
    Database.Params.Values['PASSWORD']:=Password;
    Database.Open;
   except
    on E: EDBEngineError do
      if (Password = '') then
        raise Exception.Create('Password Required') else
        raise;
  end;
end;

procedure TConeccion.FijarSQL(const StringSql, Accion,
  StringDB: WideString);
begin
 if Accion = 'Respaldar' then
 begin
  qryMaster.Close;
  qryMaster.SQL.Clear;
  qryMaster.SQL.Add(StringSQL);
  qryMaster.ExecSQL;
 end;

 if Accion = 'Restaurar' then
 begin
  qryMaster.Close;
  qryMaster.SQL.Clear;
  qryMaster.SQL.Add('sp_who');
  qryMaster.Open;
  qryMaster.First;
  while not qryMaster.Eof do
  begin
  If (uppercase(qryMaster.FieldByName('dbname').AsString) = uppercase(StringDB)) then
   begin
    qryMaster.Close;
    qryMaster.SQL.Clear;
    qryMaster.SQL.Add('Kill '+qryMaster.FieldByName('spid').AsString);
    qryMaster.ExecSQL;
   end;
   qryMaster.Next;
  end;
  qryMaster.Close;
  qryMaster.SQL.Clear;
  qryMaster.SQL.Add(StringSql);
  qryMaster.ExecSQL;
 end;

 if Accion = 'Reindexar' then
 begin
  qryMaster.Close;
  qryMaster.SQL.Clear;
  qryMaster.SQL.Text := StringSQL;
  qryMaster.ExecSQL;
 end;

end;

initialization
  TComponentFactory.Create(ComServer, TConeccion,
    Class_Coneccion, ciMultiInstance, tmApartment);
end.
