if exists (select * from sysobjects where id = object_id(N'[dbo].[Clientes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Clientes]
GO

CREATE TABLE [dbo].[Clientes] (
	[Codigo] [nvarchar] (10) NOT NULL ,
	[Nombre] [nvarchar] (100) NULL ,
	[TipoDoc] [nvarchar] (2) NULL ,
	[NumDoc] [nvarchar] (15) NULL ,
	[NombRepr] [nvarchar] (50) NULL ,
	[Telefono1] [nvarchar] (30) NULL ,
	[Telefono2] [nvarchar] (30) NULL ,
	[Email] [nvarchar] (50) NULL ,
	[Persona] [nvarchar] (60) NULL ,
	[ValorAct] [nvarchar] (20) NULL ,
	[ValorPas] [nvarchar] (20) NULL ,
	[ValorPatr] [nvarchar] (20) NULL 
) ON [PRIMARY]
GO

