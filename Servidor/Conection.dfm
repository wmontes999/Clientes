object Coneccion: TConeccion
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 389
  Width = 700
  object Query3: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    Left = 288
    Top = 280
  end
  object Database: TDatabase
    DatabaseName = 'ALCLIENTES'
    LoginPrompt = False
    SessionName = 'Sesion_2'
    Left = 32
    Top = 96
  end
  object Sesion: TSession
    Active = True
    AutoSessionName = True
    SQLHourGlass = False
    Left = 32
    Top = 40
  end
  object Querydet1: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource2
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 296
    Top = 136
  end
  object Query4: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    Left = 336
    Top = 280
  end
  object SQLConsulta1: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    Left = 112
    Top = 96
  end
  object ProviderConsulta1: TDataSetProvider
    DataSet = SQLConsulta1
    Left = 112
    Top = 40
  end
  object Query1: TQuery
    ObjectView = True
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    Left = 104
    Top = 280
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 32
    Top = 280
  end
  object Query2: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    Left = 240
    Top = 280
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 176
    Top = 280
  end
  object Query5: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 384
    Top = 280
  end
  object Query6: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 424
    Top = 280
  end
  object Query7: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 464
    Top = 280
  end
  object Query8: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 504
    Top = 280
  end
  object Query9: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource1
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 552
    Top = 280
  end
  object Querydet2: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource2
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 344
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 240
    Top = 136
  end
  object DataSource3: TDataSource
    DataSet = Query3
    Left = 288
    Top = 192
  end
  object Querydet3: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    DataSource = DataSource3
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 336
    Top = 192
  end
  object DataSource4: TDataSource
    DataSet = Query4
    Left = 336
    Top = 240
  end
  object Querydet4: TQuery
    DatabaseName = 'AL00EVAL'
    SessionName = 'Sesion_2'
    DataSource = DataSource4
    SQL.Strings = (
      'select * from DPCentroL')
    Left = 384
    Top = 232
  end
  object QryMaster: TQuery
    DatabaseName = 'ALCLIENTES'
    SessionName = 'Sesion_2'
    Left = 112
    Top = 152
  end
end
