create or alter procedure  uspdatos2
@tipo_dni varchar(11)

as
begin
if exists(select * from EGRESADO E JOIN CERTIFICADO C on E.DNIEGRE=C.DNIEGRE where C.DNIEGRE=@tipo_dni)
Select E.NOMEGRE+space(1)+E.APEEGRE as 'Nombre del Egresado',
E.DNIEGRE as 'DNI del Egresado',
C.NROCERTIFI as 'Numero de Certificado',
C.CODRESOLU as 'Codigo de Resolución'
from EGRESADO E JOIN CERTIFICADO C
ON E.DNIEGRE=C.DNIEGRE where E.DNIEGRE=@tipo_dni
else 
print 'DNI No encontrado'
end 
go

execute uspdatos2 '79567343'

execute uspdatos2 '2222222222222'


create or alter procedure uspdatos3
@tipo_codfacul char(5),
@tipo_codUni  char(5)
as
begin

SELECT TOP 1 f.CODFACUL as 'Codigo de Facultad', 
F.NOMFACUL as 'Nombre de Facultad',
DF.CODUNI as 'Codigo de Universidad',
u.NOMUNI as 'Nombre de Universidad',
c.DNIEGRE as 'Dni Egresado',
E.NOMEGRE+space(1)+e.APEEGRE as 'Nombre y Apellido del Egresado',
dm.MODAESTU as 'Modalidad de Estudio'
from FACULTAD F join DETALLEFACULTAD DF
on f.CODFACUL=df.CODFACUL join DETALLEUNI DU
on df.CODUNI=du.CODUNI join UNIVERSIDAD U
on du.CODUNI=u.CODUNI join DETALLEMODALIDAD DM
on u.CODUNI=dm.CODUNI join CERTIFICADO C
on dm.NROCERTIFI=c.NROCERTIFI join EGRESADO E
on c.DNIEGRE=e.DNIEGRE
where f.CODFACUL=@tipo_codfacul and u.CODUNI=@tipo_codUni
end
go

execute uspdatos3 '01','001'



create or alter procedure  uspdatosoficiales

@tipo_CodResolucion char(9)
as
begin
if exists(select * 
from DETALLEESCUELA DE
JOIN CERTIFICADO C on DE.NROCERTIFI=C.NROCERTIFI where C.CODRESOLU=@tipo_CodResolucion)
Select DE.CODESCU,DE.CODFACUL,C.DNIEGRE,C.NROCERTIFI
from DETALLEESCUELA DE JOIN CERTIFICADO C
ON DE.NROCERTIFI=C.NROCERTIFI WHERE c.CODRESOLU=@tipo_CodResolucion
else 
print 'Codigo de Resolución No existente'
end 
go

execute uspdatosoficiales '02-456-14'
execute uspdatosoficiales '0'