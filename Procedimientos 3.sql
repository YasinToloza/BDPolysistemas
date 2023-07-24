------------consultas de dos tablas----------
 select*from EGRESADO E
 go
 ---------------------------------------------
 select E.NOMEGRE as [NOMBRE],E.APEEGRE as [APELLIDO], C.NROCERTIFI as [NUMERO DE CERTIFICADO],C.CODRESOLU as [CODIGO DE RESOLUCIÓN]
 from EGRESADO E join CERTIFICADO C
 on E.DNIEGRE=C.DNIEGRE
 go

 -------consultas de multiples tablas-------------
 select E.NOMEGRE ,E.APEEGRE ,E.DNIEGRE ,F.NOMFACUL ,R.FECHRESOLU ,R.CODRESOLU ,R.FOLIO,R.LIBRO,R.REGISTRO,Z.NOMAUT 
 from EGRESADO E inner join CERTIFICADO C on E.DNIEGRE=C.DNIEGRE inner join RESOLUCION R on C.CODRESOLU=R.CODRESOLU inner join DETALLEFACULTAD D on C.NROCERTIFI=D.NROCERTIFI
 inner join FACULTAD F on D.CODFACUL=F.CODFACUL inner join UNIVERSIDAD U on D.CODUNI=U.CODUNI inner join DETALLEUNI A on U.CODUNI=A.CODUNI inner join DETALLEAUTORIDAD B on B.NROCERTIFI=C.NROCERTIFI
 inner join FIRMA Z on Z.FIRMAAUT=B.FIRMAAUT
 where (F.CODFACUL like '03') and (R.FECHRESOLU > '2000-01-01') 
 go
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 select E.NOMEGRE as [NOMBRE],E.APEEGRE as [APELLIDO],E.DNIEGRE as [DNI],F.NOMFACUL as [FACULTAD],R.FECHRESOLU as [FECHA],R.CODRESOLU as [CODIGO DE RESOLUCIÓN],R.FOLIO as [FOLIO],R.LIBRO,R.REGISTRO,Z.NOMAUT as [DECANO]
 from EGRESADO E inner join CERTIFICADO C on E.DNIEGRE=C.DNIEGRE inner join RESOLUCION R on C.CODRESOLU=R.CODRESOLU inner join DETALLEFACULTAD D on C.NROCERTIFI=D.NROCERTIFI
 inner join FACULTAD F on D.CODFACUL=F.CODFACUL inner join UNIVERSIDAD U on D.CODUNI=U.CODUNI inner join DETALLEUNI A on U.CODUNI=A.CODUNI inner join DETALLEAUTORIDAD B on B.NROCERTIFI=C.NROCERTIFI
 inner join FIRMA Z on Z.FIRMAAUT=B.FIRMAAUT
 where (F.CODFACUL like '03') and (R.FECHRESOLU > '2000-01-01') 
 go