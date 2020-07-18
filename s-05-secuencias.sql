
--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de las sequencias necesarias para las tablas
drop sequence revista_seq;
drop sequence AREA_INTERES_SEQ;
drop sequence AUTOR_SEQ;
drop sequence EMPLEADO_SEQ;
drop sequence STATUS_ARTICULO_SEQ;
drop sequence ARTICULO_SEQ;.
drop sequence HISTORICO_ARTICULO_SEQ;
drop sequence DIRECCION_SEQ;
drop sequence SUSCRIPTOR_SEQ;
drop sequence articulo_autor_seq;
drop sequence articulo_revisor_seq;
drop sequence area_interes_revisor_seq;
drop sequence revista_articulo_seq;
--select * from area_interes;
--select * from articulo_pdf;
--1.- Tabla Revista
create sequence revista_seq
	start with 1
	increment by 1 
	minvalue 0
	maxvalue 100
	cache 20
;

--2.- Tabla Area_interes
create sequence area_interes_seq	
	start with 1
	increment by 1
	minvalue 0
	maxvalue 150
	cache 20
;

--3.- Tabla autor
create sequence autor_seq
	start with 10
	increment by 1
	minvalue 0
	maxvalue 150
	cache 20
;

--4.- Tabla Empleado
create sequence empleado_seq
	start with 20
	increment by 1
	minvalue 0
	maxvalue 150
	cache 20
;

--5.- Tabla status_articulo
create sequence status_articulo_seq
	start with 1
	increment by 1
	minvalue 0
	maxvalue 50
	cache 20
;

--6.- Tabla Articulo
create sequence articulo_seq
	start with 60
	increment by 1
	minvalue 10
	maxvalue 200
	cache 20
;

--7.- Tabla historico_articulo
create sequence historico_articulo_seq
	start with 12
	increment by 1
	minvalue 0
	maxvalue 100
	cache 20
;

--8.- Tabla direccion
create sequence direccion_seq
	start with 1
	increment by 1
	minvalue 0
	maxvalue 100
	cache 20
;

--9.- Tabla suscriptor
create sequence suscriptor_seq
	start with 5
	increment by 1
	minvalue 0
	maxvalue 250
	cache 20
;

--10.- Tabla articulo_autor
create sequence articulo_autor_seq
	start with 10
	increment by 1
	minvalue 0
	maxvalue 250
	cache 20
;

--11.- Tabla articulo_revisor
create sequence articulo_revisor_seq
	start with 15
	increment by 1
	minvalue 0
	maxvalue 100
	cache 20
;

--12.- Tabla area_interes_revisor
create sequence area_interes_revisor_seq
	start with 20
	increment by 1
	minvalue 0
	maxvalue 250
	cache 20
;

--13.- Tabla revista_articulo
create sequence revista_articulo_seq
	start with 25
	increment by 1
	minvalue 0
	maxvalue 250
	cache 20
;

commit;

--select * from empleado;
--select * from area_interes_revisor;
--select * from autor;
--select * from status_articulo;

--select * from articulo;
--select * from articulo_pdf;
--select * from historico_articulo;
--select * from articulo_autor;
--select * from articulo_revisor;

--alter table articulo_revisor
--drop constraint art_rev_calificacion_chk;

 -- alter table articulo_revisor add
	--constraint art_rev_calificacion_chk
	--	check(calificacion>0 and calificacion<11);


--alter table articulo_pdf
--drop constraint art_pdf_clave_uk;
--select * from direccion;