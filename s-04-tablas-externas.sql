--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de tabla externa

--Conectando con el usuario del proyecto para crear la tabla externa
connect cg_proy_admin/cg


--Copiando el archivo a tmp
!cp /home/lissetla/Documentos/Proyecto_BD/csv/revista_ext.txt /tmp

--Se crea la tabla externa
create table revista_ext(
	revista_id          number(10,0),
	titulo              varchar2(40),  
	fecha_publicacion   varchar2(10),
	num_copias          number(10,0),
	num_copias_vendidas number(10,0),
	bimestre            char(2),
	anio_publicacion    char(4)
)
organization external (
	type oracle_loader
	default directory tmp_dir
	access parameters (
		records delimited by newline
		badfile tmp_dir:'revista_ext_bad.log'
		logfile tmp_dir:'revista_ext.log'
		fields terminated by ','
		missing field values are null
		(
			revista_id, titulo, fecha_publicacion,num_copias, 
      num_copias_vendidas, bimestre, anio_publicacion
		)
	)
	location ('revista_ext.txt')
)
reject limit unlimited;


--Se muestran los datos
set linesize 200
select * from revista_ext;

--T7_P1_P8_9
