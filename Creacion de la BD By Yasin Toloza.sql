----Eliminar base de datos si ya existia-------
if db_id ('ProyectoBD_C2') is not null
Drop Database ProyectoBD_C2
go
------------------------------------------------------------
--------------Creacion de base de datos---------------------
------------------------------------------------------------
Create Database ProyectoBD_C2
On 
(name=ProyectoData1, filename='C:\Data\ProyectoData1.MDF', size=30MB, maxsize=500MB, filegrowth=10MB),

(name=ProyectoData2, filename='C:\Data\ProyectoData2.NDF', size=30MB, maxsize=400MB, filegrowth=10MB)
log on 
(name=ProyectoLog, filename='C:\Data\ProyectoLog.LDF', size=20MB, maxsize=300MB, filegrowth=10MB)
go

----informacion detallada de la BD-----
sp_helpDB ProyectoBD_C2
go

-----Usar para manipular BD---------
use ProyectoBD_C2
go

------------------------------------------------------------
-------------------Creacion de tablas-----------------------
------------------------------------------------------------
Create table INVENTARIO
(NROINVEN char(5),
NROLOTE   char(5),
CODEMP    char(5), --Foranea
FECHINVEN smalldatetime
primary key (NROINVEN))
go

Create table EMPLEADO
(CODEMP char(5),
NOMEMP  varchar(60)
primary key (CODEMP))
go

Create table DETALLEUNI
(NROINVEN char(5), --Foranea
NRORDEN   char(5),
CODUNI    char(5), --Foranea
CAJA      char(5),
AÑO       char(4),
NROFOLIO  char(5),
NRODOCU   char(5),
OBSERVACIONES  varchar(60) null
Primary key (NRORDEN))
go

Create table UNIVERSIDAD
(CODUNI char(5),
NOMUNI  varchar(50)
Primary key(CODUNI))
go

Create table DETALLEELABORADO
(NROINVEN char(5), --Foranea
CODELABO char(5)) --Foranea
go

Create table ELABORADO
(CODELABO char(5), 
NOMELABO  varchar(50), 
FIRELABO  char(2) null,
LUGARELABO varchar(20) default 'SUNEDU',
FECHELABO  smalldatetime
primary key(CODELABO))
go

Create table DETALLERECIBIDO
(NROINVEN char(5), --Foranea
CODRECIBI char(5)) --Foranea
go

Create table RECIBIDO
(CODRECIBI char(5),
NOMRECIBI  varchar(50),
FIRRECIBI  char(2) null,
LUGARRECIBI varchar(20) default 'Polysistemas.CORP',
FECHRECIBI  smalldatetime
primary key(CODRECIBI))
go

Create table CERTIFICADO
(NROCERTIFI char(5),
DNIEGRE varchar(11), --Foranea
CODRESOLU char(9) --Foranea 
primary key (NROCERTIFI))
go

Create table EGRESADO
(DNIEGRE varchar(11),
NOMEGRE  varchar(30),
APEEGRE  varchar(30)
Primary key (DNIEGRE))
go

Create table RESOLUCION
(CODRESOLU char(9),
FECHRESOLU smalldatetime,
LIBRO  varchar(10),
FOLIO  char(5),
REGISTRO varchar(9)
primary key(CODRESOLU))
go

Create table DETALLEFACULTAD
(NROCERTIFI char(5), --Foranea
CODUNI      char(5), --Foranea
CODFACUL    char(5)) --Foranea
go

Create table FACULTAD 
(CODFACUL char(5),
NOMFACUL  varchar(50)
Primary key(CODFACUL))
go

Create table DETALLEESCUELA
(NROCERTIFI char(5), --Foranea
CODUNI      char(5), --Foranea
CODFACUL    char(5), --Foranea 
CODESCU     char(5)) --Foranea
go

Create table ESCUELA 
(CODESCU char(5),
NOMESCU  varchar(50)
Primary key (CODESCU))
go

Create table DETALLETITULO
(NROCERTIFI char(5), --Foranea
CODUNI      char(5), --Foranea
CODFACUL    char(5), --Foranea
CODESCU     char(5), --Foranea
ABRETIT     char(1)) --foranea
go

Create table TITULO
(ABRETIT char(1),
TITULO   varchar(50)
Primary key (ABRETIT))
go

Create table DETALLEMODALIDAD
(NROCERTIFI char(5), --Foranea
CODUNI      char(5), --Foranea
CODFACUL    char(5), --Foranea
CODESCU     char(5), --Foranea
MODAESTU    char(1)) --Foranea
go

Create table MODALIDAD 
(MODAESTU   char(1),
MODAOBT     varchar(50)
Primary key (MODAESTU))
go

Create table DETALLEAUTORIDAD
(NROCERTIFI char(5), --Foranea
FIRMAAUT    char(5)) --Foranea
go

Create table FIRMA
(FIRMAAUT  char(5),
TIPOAUT    varchar(30),
NOMAUT     varchar(50), 
SELLOAUT   char(2) null
Primary key (FIRMAAUT))
go


--------------------------------------------------
--------------Llaves Foraneas---------------------
--------------------------------------------------

Alter table DETALLEUNI
add Foreign key (NROINVEN) references INVENTARIO,
    Foreign key (CODUNI) references UNIVERSIDAD
go

Alter table DETALLEELABORADO
add Foreign key (NROINVEN) references INVENTARIO,
    Foreign key (CODELABO) references ELABORADO
go

Alter table DETALLERECIBIDO
add Foreign key (NROINVEN) references INVENTARIO,
    Foreign key (CODRECIBI) references RECIBIDO
go

Alter table DETALLEFACULTAD
add Foreign key (NROCERTIFI) references CERTIFICADO,
    Foreign key (CODUNI) references UNIVERSIDAD,
	Foreign key (CODFACUL) references FACULTAD
go

Alter table DETALLEESCUELA
add Foreign key (NROCERTIFI) references CERTIFICADO,
    Foreign key (CODUNI) references UNIVERSIDAD,
	Foreign key (CODFACUL) references FACULTAD,
	Foreign key (CODESCU) references ESCUELA
go

Alter table DETALLETITULO
add Foreign key (NROCERTIFI) references CERTIFICADO,
    Foreign key (CODUNI) references UNIVERSIDAD,
	Foreign key (CODFACUL) references FACULTAD,
	Foreign key (CODESCU) references ESCUELA,
	Foreign key (ABRETIT) references TITULO
go

Alter table DETALLEMODALIDAD
add Foreign key (NROCERTIFI) references CERTIFICADO,
    Foreign key (CODUNI) references UNIVERSIDAD,
	Foreign key (CODFACUL) references FACULTAD,
	Foreign key (CODESCU) references ESCUELA,
	Foreign key (MODAESTU) references MODALIDAD
go
    
Alter table DETALLEAUTORIDAD
add Foreign key (NROCERTIFI) references CERTIFICADO,
    foreign key (FIRMAAUT) references FIRMA
go

Alter table INVENTARIO
add Foreign key (CODEMP) references EMPLEADO
go

Alter table CERTIFICADO
add Foreign key (DNIEGRE) references EGRESADO,
    Foreign key (CODRESOLU) references RESOLUCION
go


--------------------------------------------------
---------------Reestricciones---------------------
--------------------------------------------------

--Unique
Alter table INVENTARIO
add unique (NROINVEN)
go

Alter table EGRESADO
add Unique (DNIEGRE)
GO

Alter table CERTIFICADO
add Unique (NROCERTIFI)
go

Alter table RESOLUCION
add Unique (CODRESOLU)
go

--Check
Alter table TITULO
add Check (ABRETIT in ('B', 'T', 'M', 'D', 'S')) 
go

Alter table MODALIDAD
add Check (MODAESTU in ('P', 'S', 'D'))
go

Alter table ELABORADO
add Check (FIRELABO in ('Si', null))
go

Alter table RECIBIDO
add Check (FIRRECIBI in ('Si', null))
go

Alter table FIRMA
add Check (SELLOAUT in ('Si', null))
go