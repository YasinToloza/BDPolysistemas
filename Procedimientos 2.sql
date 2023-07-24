--------------------------------------------------------------
 -------------------Consultas----------------------------------
 ----------------order by--------------
 select*from EGRESADO
 go

 select*
 from EGRESADO
 order by NOMEGRE
 go
 -----------------WHERE----------------
 select*from UNIVERSIDAD
 go
 select NOMUNI
 from UNIVERSIDAD
 where CODUNI < '010'
 go
 ---------------BETWEEN----------------
 select*from RESOLUCION
 go
 select*from RESOLUCION
 where FECHRESOLU between '1970-01-01' and '2000-01-01'
 order by FECHRESOLU
 go
 --------------LIKE--------------------
 select*from EGRESADO
 go

 select*from EGRESADO
 where NOMEGRE like 'M%';
 
 go