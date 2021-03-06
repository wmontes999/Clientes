unit Servidor_Lara_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 10/11/2021 01:59:26 p.m. from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Archivos de programa\Borland\Delphi7\Projects\Clientes\Servidor\Servidor_Lara.tlb (1)
// LIBID: {F94F1A82-F0D4-44D6-8689-023765440039}
// LCID: 0
// Helpfile: 
// HelpString: Servidor_Lara Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\system32\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Servidor_LaraMajorVersion = 1;
  Servidor_LaraMinorVersion = 0;

  LIBID_Servidor_Lara: TGUID = '{F94F1A82-F0D4-44D6-8689-023765440039}';

  IID_IConeccion: TGUID = '{4B73FCCE-6432-4B26-89FB-5FF3194AEE22}';
  CLASS_Coneccion: TGUID = '{CC6CD21A-4DA7-4A04-8A0A-EFE49050277D}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IConeccion = interface;
  IConeccionDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Coneccion = IConeccion;


// *********************************************************************//
// Interface: IConeccion
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4B73FCCE-6432-4B26-89FB-5FF3194AEE22}
// *********************************************************************//
  IConeccion = interface(IAppServer)
    ['{4B73FCCE-6432-4B26-89FB-5FF3194AEE22}']
    procedure AsignBD(const Alias: WideString; const Password: WideString); safecall;
    procedure AsignSQL(const StringSql: WideString); safecall;
    procedure repCSQL(const SqlRep: WideString; const Alias: WideString); safecall;
    procedure repDSQL(const SqlRep: WideString; const Alias: WideString); safecall;
    procedure repD1SQL(const SqlRep: WideString; const Alias: WideString); safecall;
    procedure repD2SQL(const SqlRep: WideString; const Alias: WideString); safecall;
    procedure repD3SQL(const SqlRep: WideString); safecall;
    procedure repD4SQL(const SqlRep: WideString); safecall;
    procedure repD5SQL(const SqlRep: WideString); safecall;
    procedure repD6SQL(const SqlRep: WideString); safecall;
    procedure repD7SQL(const SqlRep: WideString); safecall;
    procedure repdet1SQL(const RepSql: WideString); safecall;
    procedure repdet2SQL(const RepSql: WideString); safecall;
    procedure repdet3SQL(const RepSql: WideString); safecall;
    procedure repdet4SQL(const RepSql: WideString); safecall;
    procedure FijarMaster(const Alias: WideString; const Password: WideString); safecall;
    procedure FijarSQL(const StringSql: WideString; const Accion: WideString; 
                       const StringDB: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IConeccionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4B73FCCE-6432-4B26-89FB-5FF3194AEE22}
// *********************************************************************//
  IConeccionDisp = dispinterface
    ['{4B73FCCE-6432-4B26-89FB-5FF3194AEE22}']
    procedure AsignBD(const Alias: WideString; const Password: WideString); dispid 303;
    procedure AsignSQL(const StringSql: WideString); dispid 304;
    procedure repCSQL(const SqlRep: WideString; const Alias: WideString); dispid 301;
    procedure repDSQL(const SqlRep: WideString; const Alias: WideString); dispid 302;
    procedure repD1SQL(const SqlRep: WideString; const Alias: WideString); dispid 305;
    procedure repD2SQL(const SqlRep: WideString; const Alias: WideString); dispid 306;
    procedure repD3SQL(const SqlRep: WideString); dispid 307;
    procedure repD4SQL(const SqlRep: WideString); dispid 308;
    procedure repD5SQL(const SqlRep: WideString); dispid 309;
    procedure repD6SQL(const SqlRep: WideString); dispid 310;
    procedure repD7SQL(const SqlRep: WideString); dispid 311;
    procedure repdet1SQL(const RepSql: WideString); dispid 312;
    procedure repdet2SQL(const RepSql: WideString); dispid 313;
    procedure repdet3SQL(const RepSql: WideString); dispid 314;
    procedure repdet4SQL(const RepSql: WideString); dispid 315;
    procedure FijarMaster(const Alias: WideString; const Password: WideString); dispid 316;
    procedure FijarSQL(const StringSql: WideString; const Accion: WideString; 
                       const StringDB: WideString); dispid 317;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoConeccion provides a Create and CreateRemote method to          
// create instances of the default interface IConeccion exposed by              
// the CoClass Coneccion. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConeccion = class
    class function Create: IConeccion;
    class function CreateRemote(const MachineName: string): IConeccion;
  end;

implementation

uses ComObj;

class function CoConeccion.Create: IConeccion;
begin
  Result := CreateComObject(CLASS_Coneccion) as IConeccion;
end;

class function CoConeccion.CreateRemote(const MachineName: string): IConeccion;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Coneccion) as IConeccion;
end;

end.
