--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Tabla temporal que desnormalizada la tabla empleado

create global temporary table empleado_temp(
	empleado_temp_id    number(10,0) not null, 
	nombre             varchar2(40) not null,
	ap_paterno         varchar2(40) not null,
	ap_materno         varchar2(40) not null,
	email              varchar2(40),
	fecha_ingreso      date not null,
	es_revisor         char(1) default 'N',   
	es_editor          char(1) default 'N',
	numero_contrato    varchar2(40),
	fecha_fin_contrato date,
	numero_cedula      varchar2(40),
	maestria           varchar2(40),
	constraint empleado_temp_id_pk primary key (empleado_temp_id)
) on commit delete rows;--creada

