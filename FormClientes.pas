unit FormClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBClient, MConnect;

type
  TFrmRegClientes = class(TForm)
    Panel1: TPanel;
    BtnIncluir: TButton;
    BtnModificar: TButton;
    BtnGuardar: TButton;
    BtnEliminat: TButton;
    BtnCancelar: TButton;
    BtnBuscar: TButton;
    BtnRegresar: TButton;
    GrpClientes: TGroupBox;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdtNombres: TEdit;
    EdtTipDoc: TEdit;
    EdtNumIden: TEdit;
    EdtNombbrLeg: TEdit;
    EdtTel1: TEdit;
    EdtTel2: TEdit;
    EdtEmail: TEdit;
    EdtPersCon: TEdit;
    EdtAct: TEdit;
    EdtPas: TEdit;
    EdtPatr: TEdit;
    DComCli: TDCOMConnection;
    Client: TClientDataSet;
    BtnGenBusc: TButton;
    BtnTabla: TButton;
    procedure Botones(Sender: TObject;Titulo:string;Valor_1,Valor_2,Valor_3,Valor_4,Valor_5,Valor_6,Valor_7:Boolean);
    procedure Siguiente(Sender: TObject;Edt:TEdit);
    procedure Conectar(Sender: TObject;Conectado:Boolean);
    procedure FormCreate(Sender: TObject);
    function Buscar(Sender: TObject;Number:Integer):Boolean;
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnEliminatClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnRegresarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGuardarClick(Sender: TObject);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNumIdenKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTel1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtTel2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtActKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPatrKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGenBuscClick(Sender: TObject);
    procedure BtnTablaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegClientes: TFrmRegClientes;
  Texto: Text;
implementation

uses FormTabla;

{$R *.dfm}

procedure TFrmRegClientes.Conectar(Sender: TObject;Conectado:Boolean);
var
 Camino,Equipo:string;
begin
 if (Conectado = True) then
 begin
  Camino:='Equipo.txt';
  AssignFile(Texto,Camino);
  Reset(Texto);
  Read(Texto,Equipo);
  DcomCli.ComputerName := Equipo;
  CloseFile(Texto);
  DcomCli.Connected:=True;
  DcomCli.AppServer.AsignBD('ALCLIENTES','');
 end;
 if (Conectado = False) then
 begin
  Client.Close;
  DcomCli.Connected:=False;
 end;
end;

function TFrmRegClientes.Buscar(Sender: TObject;Number:Integer):Boolean;
var
 VLSql:string;
begin
 VLSql:='select * From Clientes where (Codigo = '+inttostr(Number)+')';
 DcomCli.AppServer.AsignSQL(VLSql);
 Client.IndexFieldNames:='Codigo';
 Client.Open;
 If (Not Client.Eof) then
 begin
  EdtNombres.Text := Client.FieldByName('Nombre').AsString;
  EdtTipDoc.Text := Client.FieldByName('TipoDoc').AsString;
  EdtNumIden.Text := Client.FieldByName('NumDoc').AsString;
  EdtNombbrLeg.Text := Client.FieldByName('NombRepr').AsString;
  EdtTel1.Text := Client.FieldByName('Telefono1').AsString;
  EdtTel2.Text := Client.FieldByName('Telefono2').AsString;
  EdtEmail.Text := Client.FieldByName('Email').AsString;
  EdtPersCon.Text := Client.FieldByName('Persona').AsString;
  EdtAct.Text := Client.FieldByName('ValorAct').AsString;
  EdtPas.Text := Client.FieldByName('ValorPas').AsString;
  EdtPatr.Text := Client.FieldByName('ValorPatr').AsString;
  Buscar := True;
 end else Buscar := False;
end;

procedure TFrmRegClientes.Botones(Sender: TObject;Titulo:string;Valor_1,Valor_2,Valor_3,Valor_4,Valor_5,Valor_6,Valor_7:Boolean);
begin
 BtnIncluir.Enabled:= Valor_1;
 BtnModificar.Enabled:= Valor_2;
 BtnEliminat.Enabled:= Valor_3;
 BtnGenBusc.Enabled:= False;
 BtnTabla.Enabled:= False;
 if ((Titulo = 'Modificar Clientes') or (Titulo = 'Eliminar Clientes') or (Titulo = 'Buscar Clientes')) then
 begin
  BtnGenBusc.Enabled:= (Not Valor_2) or (Not Valor_3);
  BtnTabla.Enabled:= (Not Valor_2) or (Not Valor_3);
 end;
 BtnBuscar.Enabled:= Valor_4;
 BtnGuardar.Enabled:= Valor_5;
 BtnCancelar.Enabled:= Valor_6;
 BtnRegresar.Enabled:= Valor_7;
 GrpClientes.Caption := Titulo;
 GrpClientes.Enabled := BtnRegresar.Enabled;
 EdtCodigo.Text := '';
 EdtNombres.Text := '';
 EdtTipDoc.Text := '';
 EdtNumIden.Text := '';
 EdtNombbrLeg.Text := '';
 EdtTel1.Text := '';
 EdtTel2.Text := '';
 EdtEmail.Text := '';
 EdtPersCon.Text := '';
 EdtAct.Text := '';
 EdtPas.Text := '';
 EdtPatr.Text := '';
end;

procedure TFrmRegClientes.Siguiente(Sender: TObject;Edt: TEdit);
begin
 Edt.SetFocus;
end;

procedure TFrmRegClientes.FormCreate(Sender: TObject);
var
VLSql:string;
begin
 Botones(Sender,'',True,True,True,True,False,False,False);
end;

procedure TFrmRegClientes.BtnIncluirClick(Sender: TObject);
var
 Codigo:Integer;
 VLSql: string;
begin
 Conectar(Sender,True);
 VLSql:='select * From Clientes order by Codigo';
 DcomCli.AppServer.AsignSQL(VLSql);
 Client.IndexFieldNames:='Codigo';
 Client.Open;
 Client.Last;
 if (Client.FieldByName('Codigo').AsString = '') then
 Codigo := 1 else
 Codigo := Client.FieldByName('Codigo').AsInteger + 1;
 Conectar(Sender,False);
 Botones(Sender,'Incluir Clientes',False,False,False,False,True,True,True);
 EdtCodigo.Text := inttostr(Codigo);
 EdtCodigo.ReadOnly := False;
 EdtNombres.SetFocus;
end;

procedure TFrmRegClientes.BtnModificarClick(Sender: TObject);
begin
 Botones(Sender,'Modificar Clientes',False,False,False,False,True,True,True);
 EdtCodigo.SetFocus;
 EdtCodigo.ReadOnly := False;
end;

procedure TFrmRegClientes.BtnEliminatClick(Sender: TObject);
begin
 Botones(Sender,'Eliminar Clientes',False,False,False,False,True,True,True);
 EdtCodigo.SetFocus;
 EdtCodigo.ReadOnly := False;
end;

procedure TFrmRegClientes.BtnBuscarClick(Sender: TObject);
begin
 Botones(Sender,'Buscar Clientes',False,False,False,False,False,True,True);
 EdtCodigo.SetFocus;
 EdtCodigo.ReadOnly := False;
end;

procedure TFrmRegClientes.BtnRegresarClick(Sender: TObject);
begin
 Botones(Sender,'',True,True,True,True,False,False,False);
end;

procedure TFrmRegClientes.BtnCancelarClick(Sender: TObject);
begin
 Botones(Sender,'',True,True,True,True,False,False,False);
end;

procedure TFrmRegClientes.BtnGuardarClick(Sender: TObject);
var
 Opcion, VLSql : string;
begin
 Opcion := GrpClientes.Caption;

 if (Opcion = 'Incluir Clientes') then
 begin
  Conectar(Sender,True);
  Client.Close;
  VLSql:='select * From Clientes where (Codigo = '+EdtCodigo.Text+')';
  DComCli.AppServer.AsignSQL(VLSql);
  Client.IndexFieldNames:='Codigo';
  Client.Open;
  if Client.FindKey([EdtCodigo.Text]) then
  MessageDlg('Codigo ya existe', mtError,[mbOk], 0)else
  begin
   Client.InsertRecord([EdtCodigo.Text,EdtNombres.Text,
   EdtTipDoc.Text,EdtNumIden.Text,EdtNombbrLeg.Text,EdtTel1.Text,EdtTel2.Text,
   EdtEmail.Text,EdtPersCon.Text,EdtAct.Text,EdtPas.Text,EdtPatr.Text]);
   Client.ApplyUpdates(-1);
   MessageDlg('Registro Incluido', mtInformation,[mbOk], 0);
  end;
  Conectar(Sender,False);
 end;
 if (Opcion = 'Modificar Clientes') then
 begin
  Conectar(Sender,True);
  Client.Close;
  VLSql:='select * From Clientes where (Codigo = '+EdtCodigo.Text+')';
  DComCli.AppServer.AsignSQL(VLSql);
  Client.IndexFieldNames:='Codigo';
  Client.Open;
  if (Not Client.FindKey([EdtCodigo.Text])) then
  MessageDlg('Codigo no existe', mtError,[mbOk], 0)else
  begin
   Client.Edit;
   Client.FieldByName('Codigo').AsString:=EdtCodigo.Text;
   Client.FieldByName('Nombre').AsString:=EdtNombres.Text;
   Client.FieldByName('TipoDoc').AsString:=EdtTipDoc.Text;
   Client.FieldByName('NumDoc').AsString:=EdtNumIden.Text;
   Client.FieldByName('NombRepr').AsString:=EdtNombbrLeg.Text;
   Client.FieldByName('Telefono1').AsString:=EdtTel1.Text;
   Client.FieldByName('Telefono2').AsString:=EdtTel2.Text;
   Client.FieldByName('Email').AsString:=EdtEmail.Text;
   Client.FieldByName('Persona').AsString:=EdtPersCon.Text;
   Client.FieldByName('ValorAct').AsString:=EdtAct.Text;
   Client.FieldByName('ValorPas').AsString:=EdtPas.Text;
   Client.FieldByName('ValorPatr').AsString:=EdtPatr.Text;
   Client.ApplyUpdates(-1);
   MessageDlg('Registro Modificado', mtInformation,[mbOk], 0);
  end;
  Conectar(Sender,False);
 end;
 if (Opcion = 'Eliminar Clientes') then
 begin
  Conectar(Sender,True);
  Client.Close;
  VLSql:='select * From Clientes where (Codigo = '+EdtCodigo.Text+')';
  DComCli.AppServer.AsignSQL(VLSql);
  Client.IndexFieldNames:='Codigo';
  Client.Open;
  if (Not Client.FindKey([EdtCodigo.Text])) then
  MessageDlg('Codigo no existe', mtError,[mbOk], 0)else
  begin
   Client.Delete;
   Client.ApplyUpdates(-1);
   MessageDlg('Registro Eliminado', mtInformation,[mbOk], 0);
  end;
  Conectar(Sender,False);
 end;

 Botones(Sender,'',True,True,True,True,False,False,False);
end;

procedure TFrmRegClientes.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key in ['0'..'9',#8]then
 Key:=Key else Key:=#0;
end;

procedure TFrmRegClientes.EdtNumIdenKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key in ['0'..'9',#8]then
 Key:=Key else Key:=#0;
end;

procedure TFrmRegClientes.EdtTel1KeyPress(Sender: TObject; var Key: Char);
begin
 If Key in ['0'..'9',#8]then
 Key:=Key else Key:=#0;
end;

procedure TFrmRegClientes.EdtTel2KeyPress(Sender: TObject; var Key: Char);
begin
 If Key in ['0'..'9',#8]then
 Key:=Key else Key:=#0;
end;

procedure TFrmRegClientes.EdtActKeyPress(Sender: TObject; var Key: Char);
begin
 If Key in ['0'..'9',#8]then
 Key:=Key else Key:=#0;
end;

procedure TFrmRegClientes.EdtPasKeyPress(Sender: TObject; var Key: Char);
begin
 If Key in ['0'..'9',#8]then
 Key:=Key else Key:=#0;
end;

procedure TFrmRegClientes.EdtPatrKeyPress(Sender: TObject; var Key: Char);
begin
 If Key in ['0'..'9',#8]then
 Key:=Key else Key:=#0;
end;

procedure TFrmRegClientes.BtnGenBuscClick(Sender: TObject);
begin
 if (EdtCodigo.Text <> '') then
 begin
  Conectar(Sender,True);
  if (Not Buscar(Sender,strtoint(EdtCodigo.Text))) then
  showmessage('Registro No encontrado');
  Conectar(Sender,False);
 end else showmessage('Debes llenar el codigo');
end;

procedure TFrmRegClientes.BtnTablaClick(Sender: TObject);
var
 VLSql: string;
begin
 Conectar(Sender,True);
 Client.Close;
 VLSql:='select * From Clientes';
 Client.IndexFieldNames:='Codigo';
 DComCli.AppServer.AsignSQL(VLSql);
 Client.Open;
 if not Client.Eof then
 begin
  FrmTabla :=TFrmTabla.Create(Application);
  FrmTabla.Data1.DataSet:=Client;
  FrmTabla.DBGrid.Columns.Add;
  FrmTabla.DBGrid.Columns[0].FieldName  := 'Codigo';
  FrmTabla.DBGrid.Columns[0].Title.Caption:= 'Codigo';
  FrmTabla.DBGrid.Columns[0].Width:=70;
  FrmTabla.DBGrid.Columns[0].Title.Alignment := taCenter;

  FrmTabla.DBGrid.Columns.Add;
  FrmTabla.DBGrid.Columns[1].FieldName  := 'Nombre';
  FrmTabla.DBGrid.Columns[1].Title.Caption:= 'Nombre del Cliente';
  FrmTabla.DBGrid.Columns[1].Width:=200;
  FrmTabla.DBGrid.Columns[1].Title.Alignment := taCenter;

  FrmTabla.DBGrid.Columns.Add;
  FrmTabla.DBGrid.Columns[2].FieldName  := 'NumDoc';
  FrmTabla.DBGrid.Columns[2].Title.Caption:= 'Nro. Identificacion';
  FrmTabla.DBGrid.Columns[2].Width:=150;
  FrmTabla.DBGrid.Columns[2].Title.Alignment := taCenter;

  FrmTabla.DBGrid.Columns.Add;
  FrmTabla.DBGrid.Columns[3].FieldName  := 'Email';
  FrmTabla.DBGrid.Columns[3].Title.Caption:= 'E-mail';
  FrmTabla.DBGrid.Columns[3].Width:=150;
  FrmTabla.DBGrid.Columns[3].Title.Alignment := taCenter;

  FrmTabla.ShowModal;
  FrmTabla.Release;
  Conectar(Sender,False);
 end;
 Client.Close;
end;

end.
