-----------------------------------------------------------------
----------Entrada de datos del informe INVENTARIO----------------
-----------------------------------------------------------------
------Tablas Generales (con estos se crean los detalles)---------
-----------------------------------------------------------------
insert EMPLEADO
(CODEMP, NOMEMP)
Values
('EMP01', 'Juana Mendoza'),
('EMP02', 'Ángel Fernández'),
('EMP03', 'David Vargas'),
('EMP04', 'Daniel De la Cruz'),
('EMP05', 'Julia Gomez'),
('EMP06', 'Walter Diaz'),
('EMP07', 'Carlos Cruz'),
('EMP08', 'Jhon Rojas'),
('EMP09', 'Marco Mugaburu'),
('EMP10', 'Camila Solis')
go

insert ELABORADO
(CODELABO, NOMELABO, FIRELABO, LUGARELABO, FECHELABO)
Values
('ELA01', 'Santos Garcia','Si','SUNEDU', '2012-10-14 20:30:30'),
('ELA02', 'Camilo Rodriguez','Si','SUNEDU', '2020-12-14 20:30:30'),
('ELA03', 'Juan Zapata',null,'SUNEDU', '2016-06-14 20:30:30'),
('ELA04', 'Luis diaz','Si','SUNEDU', '2017-05-14 20:30:30'),
('ELA05', 'David Ospina','Si','SUNEDU', '2019-11-14 20:30:30'),
('ELA06', 'Luis Zuñiga','Si','SUNEDU', '2012-07-14 20:30:30'),
('ELA07', 'Carlos Mondragon','Si','SUNEDU', '2014-01-14 20:30:30'),
('ELA08', 'Yasin Toloza','Si','SUNEDU', '2015-06-14 20:30:30'),
('ELA09', 'Pilar Suarez','Si','SUNEDU', '2016-08-14 20:30:30'),
('ELA10', 'Miguel Ramirez',null,'SUNEDU', '2017-07-14 20:30:30'),
('ELA11', 'Milagros Huaman','Si','SUNEDU', '2020-01-14 20:30:30'),
('ELA12', 'Jesus Silva',null,'SUNEDU', '2018-03-14 20:30:30'),
('ELA13', 'Jordi Cordova',null,'SUNEDU', '2014-06-14 20:30:30'),
('ELA14', 'Kimberly Arenas','Si','SUNEDU', '2015-10-14 20:30:30')
go

insert RECIBIDO
(CODRECIBI, NOMRECIBI, FIRRECIBI, LUGARRECIBI, FECHRECIBI)
Values
('REC01', 'Pedro Rascal',null,'Polysistemas.CORP','2012-10-16 20:30:30'),
('REC02', 'Oscar Mendoza','Si','Polysistemas.CORP','2020-12-16 20:30:30'),
('REC03', 'Julio Santos','Si','Polysistemas.CORP','2016-06-16 20:30:30'),
('REC04', 'Luis Navarro',null,'Polysistemas.CORP','2017-05-16 20:30:30'),
('REC05', 'Fernando Huertas','Si','Polysistemas.CORP','2019-11-16 20:30:30'),
('REC06', 'Jessica Cusipuma',null,'Polysistemas.CORP','2012-07-16 20:30:30'),
('REC07', 'Rodrigo Rios','Si','Polysistemas.CORP','2014-01-16 20:30:30'),
('REC08', 'Gabriel Ticona','Si','Polysistemas.CORP','2015-06-16 20:30:30'),
('REC09', 'Genezaret Morales','Si','Polysistemas.CORP','2016-08-16 20:30:30'),
('REC10', 'Adrian Villafuerte',null,'Polysistemas.CORP','2017-07-16 20:30:30'),
('REC11', 'Juan Ravenna','Si','Polysistemas.CORP','2020-01-16 20:30:30'),
('REC12', 'Maria Espinoza','Si','Polysistemas.CORP','2018-03-16 20:30:30'),
('REC13', 'Marco Ulises','Si','Polysistemas.CORP','2014-06-16 20:30:30'),
('REC14', 'Noelia Arosquipa',null,'Polysistemas.CORP','2015-10-16 20:30:30')
go

-------------------------------------------------------------------
---------Tablas con detalle (Necesita tablas especificas)----------
-------------------------------------------------------------------
insert INVENTARIO
(NROINVEN, NROLOTE, CODEMP, FECHINVEN)
Values
('IN001','L001','EMP01','2012-10-14 20:30:30'),
('IN002','L002','EMP02','2020-12-14 20:30:30'),
('IN003','L003','EMP03','2016-06-14 20:30:30'),
('IN004','L004','EMP04','2017-05-14 20:30:30'),
('IN005','L005','EMP05','2019-11-14 20:30:30'),
('IN006','L006','EMP06','2012-07-14 20:30:30'),
('IN007','L007','EMP07','2014-01-14 20:30:30'),
('IN008','L008','EMP08','2015-06-14 20:30:30'),
('IN009','L009','EMP09','2016-08-14 20:30:30'),
('IN010','L010','EMP10','2017-07-14 20:30:30'),
('IN011','L011','EMP01','2020-01-14 20:30:30'),
('IN012','L012','EMP02','2018-03-14 20:30:30'),
('IN013','L013','EMP03','2014-06-14 20:30:30'),
('IN014','L014','EMP04','2015-10-14 20:30:30')
go

insert DETALLEUNI
(NROINVEN, NRORDEN, CODUNI, CAJA, AÑO, NROFOLIO, NRODOCU, OBSERVACIONES)
Values 
('IN001', 'OR001', '001', '2', '1998','150','300', null),
('IN002', 'OR002', '002', '3', '1987','200','400', 'Incompleto'),
('IN003', 'OR003', '003', '1', '1955','100','200', null),
('IN004', 'OR004', '004', '4', '1973','250','500', null),
('IN005', 'OR005', '005', '5', '1957','300','600', 'Documentos rotos'),
('IN006', 'OR006', '006', '2', '1967','150','300', null),
('IN007', 'OR007', '007', '2', '1998','150','300', null),
('IN008', 'OR008', '008', '1', '1974','100','200', null),
('IN009', 'OR009', '009', '1', '1985','100','200', 'Incompleto'),
('IN010', 'OR010', '010', '2', '2000','150','300', null),
('IN011', 'OR011', '011', '3', '2020','200','400', null),
('IN012', 'OR012', '012', '2', '2015','150','300', null),
('IN013', 'OR013', '013', '4', '2005','250','500', null),
('IN014', 'OR014', '014', '1', '2002','100','200', 'Documentos rotos')
go

insert DETALLEELABORADO
(NROINVEN, CODELABO)
Values
('IN001','ELA01'),
('IN002','ELA02'),
('IN003','ELA03'),
('IN004','ELA04'),
('IN005','ELA05'),
('IN006','ELA06'),
('IN007','ELA07'),
('IN008','ELA08'),
('IN009','ELA09'),
('IN010','ELA10'),
('IN011','ELA11'),
('IN012','ELA12'),
('IN013','ELA13'),
('IN014','ELA14')
go

insert DETALLERECIBIDO
(NROINVEN, CODRECIBI)
Values
('IN001','REC01'),
('IN002','REC02'),
('IN003','REC03'),
('IN004','REC04'),
('IN005','REC05'),
('IN006','REC06'),
('IN007','REC07'),
('IN008','REC08'),
('IN009','REC09'),
('IN010','REC10'),
('IN011','REC11'),
('IN012','REC12'),
('IN013','REC13'),
('IN014','REC14')
go

--------------------------------------------------------------
-----------------Visualizacion de datos-----------------------
--------------------------------------------------------------
Select * from EMPLEADO
go

Select * from ELABORADO
go

 Select * from RECIBIDO
 go

 Select * from INVENTARIO
 go

 Select * from DETALLEUNI
 go

 Select * from DETALLEELABORADO
 go

 Select * from DETALLERECIBIDO
 go

