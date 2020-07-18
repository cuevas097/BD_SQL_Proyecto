--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de tablas

--1.- Tabla Revista
create table revista(
	revista_id          number(10,0) not null,
	titulo              varchar2(40) not  null,  
	fecha_publicacion   date not null,
	num_copias          number(10,0) not null,
	num_copias_vendidas number(10,0) not null,
	bimestre as (to_char(fecha_publicacion, 'MM')) virtual,
	anio_publicacion as (to_char(fecha_publicacion, 'YYYY')) virtual,
	constraint revista_pk primary key (revista_id)
);--Creada

--2.- Tabla Area_interes
create table area_interes(
	area_interes_id number(10,0) not null,
	clave           char(2) not null,
	descripcion     varchar2(40) not null,
	constraint area_interes_pk primary key (area_interes_id)
);--creada

--3.- Tabla autor
create table autor(
	autor_id   number(10,0) not null,
	nombre     varchar2(40) not null,
	ap_paterno varchar2(40) not null,
	ap_materno varchar2(40) not null,
	ocupacion  varchar2(40) not null,
	empresa    varchar2(40) not null,
	email      varchar2(40) not null,
	constraint autor_pk primary key(autor_id)
);--creada

--4.- Tabla Empleado
create table empleado(
	empleado_id   number(10,0) not null, 
	nombre        varchar2(40) not null,
	ap_paterno    varchar2(40) not null,
	ap_materno    varchar2(40) not null,
	email         varchar2(40),
	fecha_ingreso date not null,
	es_revisor    char(1) default 'N',   
	es_editor     char(1) default 'N',
	constraint empleado_pk primary key (empleado_id)
);--Si es_revisor o es_editor se debe ingresar S --creado

--5.- Tabla Revisor(empleado)
create table revisor(
	empleado_id        number(10,0) not null,
	numero_contrato    varchar2(40) not null,
	fecha_fin_contrato date,
	constraint revisor_pk primary key (empleado_id),
	constraint revisor_empleado_id_fk
		foreign key (empleado_id)
		references empleado(empleado_id)
);--creado

--6.- Tabla editor(empleado)
create table editor(
	empleado_id   number(10,0) not null,
	numero_cedula varchar2(40) not null,
	maestria      varchar2(40) not null,
	constraint editor_pk primary key (empleado_id),
	constraint editor_empleado_id_fk
		foreign key (empleado_id)
		references empleado(empleado_id)
);--creado

--7.- Tabla status_articulo
create table status_articulo(
	status_articulo_id number(10,0) default 1,
	clave              varchar2(10) default 'RB',
	descripcion        varchar2(100) default 'RECIBIDO',
	constraint status_articulo_pk primary key (status_articulo_id)
);--creado

--8.- Tabla Articulo
create table articulo(
	articulo_id   number(10,0) not null,
	folio_art     varchar2(40) not null 
		constraint articulo_folio_art_uk unique,
	titulo        varchar2(40) not null,
	sinopsis      varchar2(40) not null,
	fecha_status  date default sysdate,
	area_interes_id  number(10,0) not null,
	status_articulo_id number(10,0) default 1,
	empleado_id   number(10,0),
	constraint articulo_pk primary key (articulo_id),
	constraint a_i_area_interes_id_fk foreign key (area_interes_id) 
		references area_interes(area_interes_id),
	constraint s_a_status_articulo_id_fk 	foreign key (status_articulo_id) 
		references status_articulo(status_articulo_id),
	constraint e_empleado_id_fk2 	foreign key (empleado_id) 
		references editor(empleado_id)
);--creado

--9.- Tabla historico_articulo
create table historico_articulo(
	historico_articulo_id number(10,0) not null, 
	fecha_status          date default sysdate,
	status_articulo_id    number(10,0) not null,
	articulo_id           number(10,0) not null,
	constraint historico_articulo_pk primary key (historico_articulo_id),
	constraint s_a_status_articulo_id_fk2 	foreign key (status_articulo_id)
		references status_articulo(status_articulo_id),
	constraint a_articulo_id_fk foreign key (articulo_id)
		references articulo(articulo_id)
);--creado

--10.- Tabla Articulo_pdf
create table articulo_pdf(
	articulo_id number(10,0) not null,
	clave       char(2) not null,
	archivo     blob default empty_blob(), --Se agrego
	constraint articulo_pdf_pk primary key (clave, articulo_id),
	constraint a_articulo_id_fk2 foreign key (articulo_id) 
		references articulo(articulo_id),
	constraint art_pdf_clave_chk 
		check(clave in ('A1', 'A2', 'A3', 'A4', 'A5'))
);--creada

--11.- Tabla direccion para alamacenar el domicilio desglosado de cada suscriptor
create table direccion(
	direccion_id number(10,0) not null,
	calle        varchar2(40) not null,
	numero       number(5,0) not null,
	colonia      varchar2(40) not null,   
	municipio    varchar2(40) not null,
	estado       varchar2(40) not null,
	cp           number(5,0) not null,
	constraint direccion_pk primary key (direccion_id)
); --creada

--12.- Tabla suscriptor
create table suscriptor(
	suscriptor_id     number(10,0) not null,
	nombre            varchar2(40) not null,
	ap_paterno        varchar2(40) not null,
	ap_materno	      varchar2(40),
	email             varchar2(40),
	vigencia          number(4,0) not null, --Se da el numero de meses         
	fecha_suscripcion date not null,
	direccion_id      number(10,0) not null,
	constraint suscriptor_pk primary key (suscriptor_id),
	constraint suscriptor_direccion_id_fk
		foreign key (direccion_id)
		references direccion(direccion_id)
);--creada

--13.- Tabla Articulo_autor
create table articulo_autor(
	articulo_autor_id number(10,0) not null,
	autor_id          number(10,0) not null,
	articulo_id       number(10,0) not null,
	constraint articulo_autor_pk primary key (articulo_autor_id),
	constraint autor_autor_id_fk 
		foreign key (autor_id) 
		references autor(autor_id),
	constraint articulo_articulo_id_fk2 
		foreign key (articulo_id) 
		references articulo(articulo_id)
);--creada

--14.- Tabla articulo_revisor
create table articulo_revisor(
	articulo_revisor_id number(10,0) not null,
	calificacion        number(2,0) not null, 
	empleado_id         number(10,0) not null,
	articulo_id         number(10,0) not null,
	constraint articulo_revisor_pk primary key (articulo_revisor_id),
	constraint empleado_emplado_id_fk
		foreign key (empleado_id)
		references revisor(empleado_id),
	constraint art_articulo_id_fk 
		foreign key (articulo_id)
		references articulo(articulo_id),
	constraint art_rev_calificacion_chk
		check(calificacion>0 and calificacion<11)
);--creada

--15.- Tabla Revista_articulo
create table revista_articulo(
	revista_articulo_id number(10,0) not null,
	num_pagina          varchar2(40) not null,
	articulo_id         number(10,0) not null,
	revista_id          number(10,0) not null,
	constraint revista_articulo_pk primary key (revista_articulo_id),
	constraint articulo_articulo_id_fk3
		foreign key (articulo_id)
		references articulo(articulo_id),
	constraint revista_revista_id_fk
		foreign key (revista_id)
		references revista(revista_id)
);--creada

--16.- Tabla revista_suscriptor
create table revista_suscriptor(
	suscriptor_id     number(10,0) not null,
	revista_id        number(10,0) not null,
	fecha_envio       date not null,
	constraint revista_suscriptor_pk primary key (suscriptor_id, revista_id),
	constraint suscriptor_suscriptor_id_fk
		foreign key (suscriptor_id)
		references suscriptor(suscriptor_id),
	constraint revista_revista_id_fk2
		foreign key (revista_id)
		references revista(revista_id)
);--creada

--17.- Tabla area_interes_revisor
create table area_interes_revisor(
	area_interes_revisor_id number(10,0) not null,
	anios_experiencia       number(10,0) not null,
	empleado_id             number(10,0) not null,
	area_interes_id         number(10,0) not null,
	constraint  area_interes_revisor_pk primary key (area_interes_revisor_id),
	constraint r_empleado_id_fk2
		foreign key (empleado_id)
		references revisor(empleado_id),
	constraint a_i_area_interes_id_fk2
		foreign key (area_interes_id)
		references area_interes(area_interes_id)
);--creada

commit;
--select table_name from user_tables; Permite ver todas las tablas creadas
