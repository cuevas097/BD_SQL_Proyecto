set serveroutput on
declare

--utilizar arreglo para el llenado de las tablas
type revistas_id is varray(10) of revista.revista_id%type;
type areas_interes_id is varray(10) of area_interes.area_interes_id%type;
type autores_id is varray(10) of autor.autor_id%type;
type empleados_id is varray(10) of empleado.empleado_id%type;
type status_articulos_id is varray(10) of status_articulo.status_articulo_id%type;
type articulos_id is varray(10) of articulo.articulo_id%type;
type historico_articulos_id is varray(10) of historico_articulo.historico_articulo_id%type;
type direcciones_id is varray(10) of direccion.direccion_id%type;
type suscriptores_id is varray(20) of suscriptor.suscriptor_id%type;
type articulos_autor_id is varray(20) of articulo_autor.articulo_autor_id%type;
type articulos_revisor_id is varray(20) of articulo_revisor.articulo_revisor_id%type;
type areas_interes_revisor_id is varray(10) of area_interes_revisor.area_interes_revisor_id%type;
type revistas_articulo_id is varray(10) of revista_articulo.revista_articulo_id%type;

v_revista_seq revistas_id := revistas_id(0,0,0,0,0,0,0,0,0,0);
v_area_interes_seq areas_interes_id := areas_interes_id(0,0,0,0,0,0,0,0,0,0);
v_autor_seq autores_id := autores_id(0,0,0,0,0,0,0,0,0,0);
v_empleado_seq empleados_id := empleados_id(0,0,0,0,0,0,0,0,0,0);
v_status_articulo_seq status_articulos_id :=  status_articulos_id (0,0,0,0,0,0,0,0,0,0);
v_articulo_seq articulos_id := articulos_id(0,0,0,0,0,0,0,0,0,0);
v_historico_articulo_seq historico_articulos_id := historico_articulos_id(0,0,0,0,0,0,0,0,0,0);
v_direccion_seq direcciones_id := direcciones_id(0,0,0,0,0,0,0,0,0,0);
v_suscriptor_seq suscriptores_id := suscriptores_id(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
v_articulo_autor_seq articulos_autor_id := articulos_autor_id(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
v_articulo_revisor_seq articulos_revisor_id := articulos_revisor_id(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
v_area_interes_revisor_seq areas_interes_revisor_id := areas_interes_revisor_id(0,0,0,0,0,0,0,0,0,0);
v_revista_articulo_seq revistas_articulo_id := revistas_articulo_id(0,0,0,0,0,0,0,0,0,0);

	v_contador numeric;

	v_nombre Empleado.nombre%type;
	v_ap_paterno Empleado.ap_paterno%type;
	v_ap_materno Empleado.ap_materno%type;
	v_email Empleado.email%type;
	v_es_revisor Empleado.es_revisor%type;
	v_es_editor Empleado.es_editor%type;
	v_numero_contrado revisor.numero_contrato%type;
	v_fecha_fin_contrato revisor.fecha_fin_contrato%type;
	v_num_cedula editor.numero_cedula%type;
	v_maestria editor.maestria%type;

    v_ocupacion Autor.ocupacion%type;
    v_empresa Autor.empresa%type; 

    v_calle Direccion.calle%type;
    v_numero Direccion.numero%type; 
    v_colonia Direccion.colonia%type;
    v_municipio Direccion.municipio%type;
    v_estado Direccion.estado%type;
    v_cp Direccion.cp%type;

    v_vigencia suscriptor.vigencia%type;
    v_fecha suscriptor.fecha_suscripcion%type;

begin

for i in 1 .. 10 loop

	v_revista_seq(i) := revista_seq.nextval;
	v_area_interes_seq(i) := area_interes_seq.nextval;
	v_autor_seq(i) := autor_seq.nextval;
	v_empleado_seq(i) := empleado_seq.nextval;
	v_status_articulo_seq(i) := status_articulo_seq.nextval;
	v_articulo_seq(i) := articulo_seq.nextval;
	v_historico_articulo_seq(i) := historico_articulo_seq.nextval;
	v_direccion_seq(i) := direccion_seq.nextval;
	v_area_interes_revisor_seq(i) := area_interes_revisor_seq.nextval;
	v_revista_articulo_seq(i) := revista_articulo_seq.nextval;

end loop;

for i in 1 .. 20 loop
	v_suscriptor_seq(i) := suscriptor_seq.nextval;
	v_articulo_autor_seq(i) := articulo_autor_seq.nextval;
	v_articulo_revisor_seq(i) := articulo_revisor_seq.nextval;
	
end loop;

	--Carga 1 areas de interes
	insert into area_interes(area_interes_id, clave, descripcion)
	values(v_area_interes_seq(1),'BD','Base de datos');

	insert into area_interes(area_interes_id, clave, descripcion)
		values(v_area_interes_seq(2),'PR','Programacion');
    
    insert into area_interes(area_interes_id, clave, descripcion)
		values(v_area_interes_seq(3),'AN','Analisis de sistemas de software');

	insert into area_interes(area_interes_id, clave, descripcion)
		values(v_area_interes_seq(4), 'HW','Hardware');

	insert into area_interes(area_interes_id, clave, descripcion)
		values(v_area_interes_seq(5),'RD','Redes');	

--carga 2 Empleado
   v_contador:= 1;
    while v_contador <= 10 loop
    	case  
    		when v_contador = 1 then
	    		v_nombre:= 'Erick';
	    		v_ap_paterno:= 'Gonzales';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Erick_GL@NetMagazine.com';
	    		v_es_editor:='1';
	    		v_es_revisor:='0';
	    		v_num_cedula:='3125643';
	    		v_maestria:= 'Maestria';
            
            when v_contador = 2 then 
    			v_nombre:= 'Erika';
	    		v_ap_paterno:= 'Luis';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Erika_LL@NetMagazine.com';
	    		v_es_editor:='1';
	    		v_es_revisor:='0';
	    		v_num_cedula:='3125645';
	    		v_maestria:= 'Maestria';

            when v_contador = 3 then 
    			v_nombre:= 'Jose';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Jose_HL@NetMagazine.com';
	    		v_es_editor:='1';
	    		v_es_revisor:='0';
	    		v_num_cedula:='3125646';
	    		v_maestria:= 'Doctorado';

	    	when v_contador = 4 then 
    			v_nombre:= 'Josefina';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Padilla';
	    		v_email := 'Josefina_HP@NetMagazine.com';
	    		v_es_editor:='1';
	    		v_es_revisor:='0';
	    		v_num_cedula:='3125649';
	    		v_maestria:= 'Doctorado';

            when v_contador = 5 then 
    			v_nombre:= 'Victoria';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Hernandez';
	    		v_email := 'Jose_HH@NetMagazine.com';
	    		v_es_editor:='1';
	    		v_es_revisor:='0';
	    		v_num_cedula:='3125650';
	    		v_maestria:= 'Maestria';		

            when v_contador = 6 then 
    			v_nombre:= 'America';
	    		v_ap_paterno:= 'Chavez';
	    		v_ap_materno := 'Galindo';
	    		v_email := 'America_CG@NetMagazine.com';
	    		v_es_editor:='1';
	    		v_es_revisor:='1';
	    		v_num_cedula:='3125671';
	    		v_maestria:= 'Doctorado';
	    		v_numero_contrado:=	2000;
	    		v_fecha_fin_contrato:= sysdate+1500;

	        when v_contador = 7 then 
    			v_nombre:= 'Karina';
	    		v_ap_paterno:= 'Cortes';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Karina_CL@NetMagazine.com';
	    		v_es_editor:='0';
	    		v_es_revisor:='1';
	    		v_numero_contrado:=	6709;
	    		v_fecha_fin_contrato:= sysdate+1000;

	    	when v_contador = 8 then 
    			v_nombre:= 'Romina';
	    		v_ap_paterno:= 'Cortes';
	    		v_ap_materno := 'Cortes';
	    		v_email := 'Romina_CC@NetMagazine.com';
	    		v_es_editor:='0';
	    		v_es_revisor:='1';
	    		v_numero_contrado:=	6789;
	    		v_fecha_fin_contrato:= sysdate+700;

	        when v_contador = 9 then 
    			v_nombre:= 'Jaime';
	    		v_ap_paterno:= 'Cortes';
	    		v_ap_materno := 'Ara';
	    		v_email := 'Jaime_CA@NetMagazine.com';
	    		v_es_editor:='0';
	    		v_es_revisor:='1';
	    		v_numero_contrado:=	1709;
	    		v_fecha_fin_contrato:= sysdate+100;

	        when v_contador = 10 then 
    			v_nombre:= 'Arturo';
	    		v_ap_paterno:= 'Cabello';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Arturo_CL@NetMagazine.com';
	    		v_es_editor:='0';
	    		v_es_revisor:='1';
	    		v_numero_contrado:=	2723;
	    		v_fecha_fin_contrato:= sysdate+1200;			
        end case; 

	    insert into empleado(empleado_id, nombre, ap_paterno, ap_materno,
	    	email, fecha_ingreso, es_revisor, es_editor)
	    values (v_empleado_seq(v_contador), v_nombre, v_ap_paterno, v_ap_materno,
	        v_email, sysdate, v_es_revisor, v_es_editor);

	    if v_es_editor = '1' then
	    	insert into editor(empleado_id, numero_cedula, maestria)
	    	values (v_empleado_seq(v_contador), v_num_cedula, v_maestria);
	    end if;
	    
	    if v_es_revisor = '1' then
	        insert into revisor(empleado_id, numero_contrato, fecha_fin_contrato) 
	        values(v_empleado_seq(v_contador),v_numero_contrado, v_fecha_fin_contrato);
        end if;
        v_contador:=v_contador+1;
    end loop;

--carga 3
    v_contador:=1;

	for v_contador in 1..5 loop 
		insert into area_interes_revisor(area_interes_revisor_id,
		anios_experiencia, empleado_id, area_interes_id)
		values (v_area_interes_revisor_seq(v_contador),dbms_random.value,
		v_empleado_seq(v_contador+5),v_area_interes_seq(v_contador));
    end loop;

--Carga 4
v_contador:= 1;
    while v_contador <= 10 loop
    	case  
    		when v_contador = 1 then
	    		v_nombre:= 'Erick';
	    		v_ap_paterno:= 'Gomez';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Erick_G_L@Panini.com';
	    		v_empresa:='Panini';
	    		v_ocupacion := 'Escritor';
            
            when v_contador = 2 then 
	    		v_nombre:= 'Erika Jamiz';
	    		v_ap_paterno:= 'Gomez';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'EriKa_G_L@Panini.com';
	    		v_empresa:='Panini';
	    		v_ocupacion:='Reportera';

            when v_contador = 3 then 
    			v_nombre:= 'Jose';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Hernandez';
	    		v_email := 'Jose_HH@Panini.com';
	    		v_empresa:='Panini';
	    		v_ocupacion:='Escritor';

	    	when v_contador = 4 then 
    			v_nombre:= 'Josefina';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Perez';
	    		v_email := 'Josefina_HP@Panini.com';
	    		v_empresa:='Panini';
	    		v_ocupacion:='Escritora';

            when v_contador = 5 then 
    			v_nombre:= 'Victoria';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Hernandez';
	    		v_email := 'Victoria_HH@NetMagazine.com';
	    		v_empresa:='DC';
	    		v_ocupacion:='Narrador';		

            when v_contador = 6 then 
    			v_nombre:= 'Lisset';
	    		v_ap_paterno:= 'Chavez';
	    		v_ap_materno := 'Galindo';
	    		v_email := 'Lisset_CG@DC.com';
	    		v_empresa:='DC';
	    		v_ocupacion:='Escritora';

	        when v_contador = 7 then 
    			v_nombre:= 'Karina';
	    		v_ap_paterno:= 'Cruz';
	    		v_ap_materno := 'Lagunilla';
	    		v_email := 'Karina_CL@UNAM.com';
	    		v_empresa:='UNAM';
	    		v_ocupacion:='Estudiante';

	    	when v_contador = 8 then 
    			v_nombre:= 'Roman';
	    		v_ap_paterno:= 'Cortes';
	    		v_ap_materno := 'Cortes';
	    		v_email := 'Romina_CC@SM.com';
	    		v_empresa:='SM';
	    		v_ocupacion:='Escritor';

	        when v_contador = 9 then 
    			v_nombre:= 'Ara';
	    		v_ap_paterno:= 'Makiliam';
	    		v_ap_materno := 'Cruz';
	    		v_email := 'Ara_MakiliamC@Ara.com';
	    		v_empresa:='Ara';
	    		v_ocupacion:='Periodista';

	        when v_contador = 10 then 
    			v_nombre:= 'Arturo';
	    		v_ap_paterno:= 'Caballero';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Arturo_CL@IPN.com';
	    		v_empresa:='IPN';
	    		v_ocupacion:='Estudiante';		
        end case; 

	    insert into autor(autor_id, nombre, ap_paterno, ap_materno,
	    	ocupacion,empresa,email)
	    values (v_autor_seq(v_contador), v_nombre, v_ap_paterno, v_ap_materno,
	        v_ocupacion, v_empresa, v_email);

        v_contador:=v_contador+1;
    end loop;

--Carga 5

	insert into status_articulo(status_articulo_id, clave, descripcion)
	values(v_status_articulo_seq(1),'RZ','RECHAZADO');


	insert into status_articulo(status_articulo_id, clave, descripcion)
	values(v_status_articulo_seq(2),'PG','PROGRAMADO');


	insert into status_articulo(status_articulo_id, clave, descripcion)
	values(v_status_articulo_seq(3),'PB','PUBLICADO');


	insert into status_articulo(status_articulo_id, clave, descripcion)
	values(v_status_articulo_seq(4),'RV','REVISADO');


	insert into status_articulo(status_articulo_id, clave, descripcion)
	values(v_status_articulo_seq(5),'PB','PUBLICADO');


	insert into status_articulo(status_articulo_id, clave, descripcion)
	values(v_status_articulo_seq(6),'RV','REVISADO');

--Carga 6
    insert into articulo(articulo_id, folio_art, titulo, sinopsis, fecha_status,
    area_interes_id, status_articulo_id, empleado_id)
    values (v_articulo_seq(1), folio(v_articulo_seq(1)), 'Mouse Laser', 'Reportaje sobre HW',
    sysdate, v_area_interes_seq(4), v_status_articulo_seq(1), v_empleado_seq(5));

    insert into articulo_pdf(articulo_id, clave)
    values(v_articulo_seq(1), 'A1');

    insert into historico_articulo(historico_articulo_id, fecha_status, status_articulo_id,
   	articulo_id)
    values(v_historico_articulo_seq(1), sysdate, v_status_articulo_seq(1),v_articulo_seq(1));

    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(1), v_autor_seq(2),v_articulo_seq(1));
    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(2), v_autor_seq(4),v_articulo_seq(1));    

    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(1), 5, v_empleado_seq(6), v_articulo_seq(1));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(2), 5, v_empleado_seq(7), v_articulo_seq(1));  
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(3), 5, v_empleado_seq(8), v_articulo_seq(1));
----	
	insert into articulo(articulo_id, folio_art, titulo, sinopsis, fecha_status,
    area_interes_id, status_articulo_id, empleado_id)
    values (v_articulo_seq(2), folio(v_articulo_seq(2)), 'Sistemas operativo', 'Reportaje sobre S.O.',
    sysdate, v_area_interes_seq(3), v_status_articulo_seq(2), v_empleado_seq(3));

    insert into articulo_pdf(articulo_id, clave)
    values(v_articulo_seq(2), 'A1');

    insert into historico_articulo(historico_articulo_id, fecha_status, status_articulo_id,
   	articulo_id)
    values(v_historico_articulo_seq(2), sysdate, v_status_articulo_seq(2),v_articulo_seq(2));

    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(3), v_autor_seq(6),v_articulo_seq(2));
    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(4), v_autor_seq(8),v_articulo_seq(2));    

    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(4), 9, v_empleado_seq(7), v_articulo_seq(2));  
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(5), 9, v_empleado_seq(8), v_articulo_seq(2));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(6), 7, v_empleado_seq(9), v_articulo_seq(2));

----
	insert into articulo(articulo_id, folio_art, titulo, sinopsis, fecha_status,
    area_interes_id, status_articulo_id, empleado_id)
    values (v_articulo_seq(3), folio(v_articulo_seq(3)), 'Bases de datos', 'Reportaje sobre NoSQL.',
    sysdate, v_area_interes_seq(1), v_status_articulo_seq(3), v_empleado_seq(6));

    insert into articulo_pdf(articulo_id, clave)
    values(v_articulo_seq(3), 'A1');

    insert into historico_articulo(historico_articulo_id, fecha_status, status_articulo_id,
   	articulo_id)
    values(v_historico_articulo_seq(3), sysdate, v_status_articulo_seq(3),v_articulo_seq(3));

    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(5), v_autor_seq(10),v_articulo_seq(3));
    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(6), v_autor_seq(1),v_articulo_seq(3));    

    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(7), 9, v_empleado_seq(8), v_articulo_seq(3));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(8), 8, v_empleado_seq(9), v_articulo_seq(3));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(9), 9, v_empleado_seq(10), v_articulo_seq(3));
---
	insert into articulo(articulo_id, folio_art, titulo, sinopsis, fecha_status,
    area_interes_id, status_articulo_id, empleado_id)
    values (v_articulo_seq(4), folio(v_articulo_seq(4)), 'Computador', '¿Qué es un computador?.',
    sysdate, v_area_interes_seq(4), v_status_articulo_seq(4), v_empleado_seq(3));

    insert into articulo_pdf(articulo_id, clave)
    values(v_articulo_seq(4), 'A1');

    insert into historico_articulo(historico_articulo_id, fecha_status, status_articulo_id,
   	articulo_id)
    values(v_historico_articulo_seq(4), sysdate, v_status_articulo_seq(4),v_articulo_seq(4));

    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(7), v_autor_seq(10),v_articulo_seq(4));
    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(8), v_autor_seq(1),v_articulo_seq(4));    

    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(10), 9, v_empleado_seq(6), v_articulo_seq(4));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(11), 9, v_empleado_seq(7), v_articulo_seq(4));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(12), 9, v_empleado_seq(10), v_articulo_seq(4));
---
	insert into articulo(articulo_id, folio_art, titulo, sinopsis, fecha_status,
    area_interes_id, status_articulo_id, empleado_id)
    values (v_articulo_seq(5), folio(v_articulo_seq(5)), 'POO', 'Analisis de POO',
    sysdate, v_area_interes_seq(2), v_status_articulo_seq(5), v_empleado_seq(2));

    insert into articulo_pdf(articulo_id, clave)
    values(v_articulo_seq(5), 'A1');

    insert into historico_articulo(historico_articulo_id, fecha_status, status_articulo_id,
   	articulo_id)
    values(v_historico_articulo_seq(5), sysdate, v_status_articulo_seq(5),v_articulo_seq(5));

    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(9), v_autor_seq(3),v_articulo_seq(5));
    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(10), v_autor_seq(5),v_articulo_seq(5));    

    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(13), 7, v_empleado_seq(8), v_articulo_seq(5));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(14), 7, v_empleado_seq(9), v_articulo_seq(5));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(15), 10, v_empleado_seq(10), v_articulo_seq(5));
---
    insert into articulo(articulo_id, folio_art, titulo, sinopsis, fecha_status,
    area_interes_id, status_articulo_id, empleado_id)
    values (v_articulo_seq(6), folio(v_articulo_seq(6)), 'REDES', 'Reportaje de Redes',
    sysdate, v_area_interes_seq(5), v_status_articulo_seq(6), v_empleado_seq(4));

    insert into articulo_pdf(articulo_id, clave)
    values(v_articulo_seq(6), 'A1');

    insert into historico_articulo(historico_articulo_id, fecha_status, status_articulo_id,
   	articulo_id)
    values(v_historico_articulo_seq(6), sysdate, v_status_articulo_seq(6),v_articulo_seq(6));

    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(11), v_autor_seq(7),v_articulo_seq(6));
    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(12), v_autor_seq(9),v_articulo_seq(6));    
    insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
    values(v_articulo_autor_seq(13), v_autor_seq(1),v_articulo_seq(6)); 

    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(16), 10, v_empleado_seq(6), v_articulo_seq(6));
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(17), 10, v_empleado_seq(7), v_articulo_seq(6));    
    insert into articulo_revisor(articulo_revisor_id, calificacion, empleado_id, articulo_id)
    values(v_articulo_revisor_seq(18), 10, v_empleado_seq(9), v_articulo_seq(6));

--Carga 7

v_contador:= 1;
    while v_contador <= 10 loop
    	case  
    		when v_contador = 1 then
	    		v_nombre:= 'Erick';
	    		v_ap_paterno:= 'Gomez';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Erick_G_L@gmail.com';
	    		v_vigencia:= 24;
	    		v_fecha:=sysdate-1000;

	    		v_calle:='Francia';
	    		v_numero:=5;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;
            
            when v_contador = 2 then 
	    		v_nombre:= 'Erika Jamiz';
	    		v_ap_paterno:= 'Gomez';
	    		v_ap_materno := 'Lua';
	    		v_email := 'EriKa_G_L@gmail.com';
	    		v_vigencia:= 10;
	    		v_fecha:=sysdate-70;

	    		v_calle:='Francia';
	    		v_numero:=67;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;

            when v_contador = 3 then 
    			v_nombre:= 'Jose Luis';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Herz';
	    		v_email := 'Jose_HH@gmail.com';
	    		v_vigencia:= 3;
	    		v_fecha:=sysdate-1300;

	    		v_calle:='Francia';
	    		v_numero:=34;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;

	    	when v_contador = 4 then 
    			v_nombre:= 'Jenny';
	    		v_ap_paterno:= 'Herrera';
	    		v_ap_materno := 'Perez';
	    		v_email := 'Jy_HP@gmail.com';
	    		v_vigencia:= 24;
	    		v_fecha:=sysdate-1000;

	    		v_calle:='Francia';
	    		v_numero:=50;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;

            when v_contador = 5 then 
    			v_nombre:= 'Victoria';
	    		v_ap_paterno:= 'Hernandez';
	    		v_ap_materno := 'Hernandez';
	    		v_email := 'Victoria_HH@gmail.com';
	    		v_vigencia:= 24;
	    		v_fecha:=sysdate-2000;

	    		v_calle:='Francia';
	    		v_numero:=1;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;		

            when v_contador = 6 then 
    			v_nombre:= 'Lisset America';
	    		v_ap_paterno:= 'Chavez';
	    		v_ap_materno := 'Galindo';
	    		v_email := 'Lisset_CG@gmail.com';
	    		v_vigencia:= 1;
	    		v_fecha:=sysdate-6700;

	    		v_calle:='Italia';
	    		v_numero:=58;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;

	        when v_contador = 7 then 
    			v_nombre:= 'Kevin';
	    		v_ap_paterno:= 'Cruz';
	    		v_ap_materno := 'Lagunilla';
	    		v_email := 'Karina_CL@gmail.com';
	    		v_vigencia:= 6;
	    		v_fecha:=sysdate-700;

	    		v_calle:='Italia';
	    		v_numero:=78;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;

	    	when v_contador = 8 then 
    			v_nombre:= 'Roman';
	    		v_ap_paterno:= 'Cortes';
	    		v_ap_materno := 'Cortes';
	    		v_email := 'Romina_CC@gmail.com';
	    		v_vigencia:= 9;
	    		v_fecha:=sysdate-75;

	    		v_calle:='Italia';
	    		v_numero:=77;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;

	        when v_contador = 9 then 
    			v_nombre:= 'Ara';
	    		v_ap_paterno:= 'Makiliam';
	    		v_ap_materno := 'Cruz';
	    		v_email := 'Ara_MakiliamC@gmail.com';
	    		v_vigencia:= 3;
	    		v_fecha:=sysdate-800;

	    		v_calle:='Italia';
	    		v_numero:=90;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;

	        when v_contador = 10 then 
    			v_nombre:= 'Arturo';
	    		v_ap_paterno:= 'Caballero';
	    		v_ap_materno := 'Lopez';
	    		v_email := 'Arturo_CL@gmail.com';
	    		v_vigencia:= 6;
	    		v_fecha:=sysdate-900;

	    		v_calle:='Italia';
	    		v_numero:=2;
	    		v_colonia:='Forjadores';
	    		v_municipio:='Nezahualcoyotl';
	    		v_estado:='México';
	    		v_cp:=54368;	
        end case; 

	    insert into direccion(direccion_id, calle, numero, estado, municipio, colonia,cp)
	    values(v_direccion_seq(v_contador), v_calle, v_numero, v_estado, v_municipio, v_colonia, v_cp);

	    insert into suscriptor(suscriptor_id, nombre, ap_paterno, ap_materno, email, vigencia,
	    	fecha_suscripcion, direccion_id)
	    values(v_suscriptor_seq(v_contador), v_nombre, v_ap_paterno, v_ap_materno, v_email, v_vigencia,
	    	v_fecha, v_direccion_seq(v_contador));

        v_contador:=v_contador+1;
    end loop;    
	 
	select suscriptor_seq.nextval into v_contador from dual;	
	insert into suscriptor(suscriptor_id, nombre, ap_paterno, vigencia,
		fecha_suscripcion, direccion_id)
	values(v_contador, 'Isabel', 'Rojas', 12, sysdate-365, v_direccion_seq(5));

	select suscriptor_seq.nextval into v_contador from dual;	
    insert into suscriptor(suscriptor_id, nombre, ap_paterno, ap_materno, email, vigencia,
		fecha_suscripcion, direccion_id)
	values(v_contador, 'Oscar', 'Ara', 'Cortes','OscarAC@gmail.com', 2, sysdate-200, v_direccion_seq(5)); 

-----
    insert into revista(revista_id,titulo,fecha_publicacion, num_copias, num_copias_vendidas)
    values(v_revista_seq(1), 'Tecnoligia', sysdate-365, 3400, 3400);	

    insert into revista(revista_id,titulo,fecha_publicacion, num_copias, num_copias_vendidas)
    values(v_revista_seq(2), 'TecnoCiencia', sysdate-700,4000, 3400);	

    insert into revista(revista_id,titulo,fecha_publicacion, num_copias, num_copias_vendidas)
    values(v_revista_seq(3), 'AppleDroid', sysdate-30,10000, 10000);	

    insert into revista(revista_id,titulo,fecha_publicacion, num_copias, num_copias_vendidas)
    values(v_revista_seq(4), 'Linux-Informa', sysdate-1200,500,489);
---

    insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
    values (v_suscriptor_seq(2), v_revista_seq(1),sysdate);
    
    insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(1), v_revista_seq(1), sysdate-43);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(4), v_revista_seq(2), sysdate-21);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(3), v_revista_seq(3), sysdate-100);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(6), v_revista_seq(4), sysdate-342);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(5), v_revista_seq(4), sysdate-31);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(8), v_revista_seq(4), sysdate+112);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(7), v_revista_seq(3), sysdate+12);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
	values (v_suscriptor_seq(10), v_revista_seq(2), sysdate+16);
	
	insert into revista_suscriptor(suscriptor_id, revista_id, fecha_envio)    	
    values (v_suscriptor_seq(9), v_revista_seq(1), sysdate+3);
--
    insert into revista_articulo(revista_articulo_id, num_pagina, articulo_id, revista_id)
    values (v_revista_articulo_seq(1), 60, v_articulo_seq(5), v_revista_seq(1));
    
    insert into revista_articulo(revista_articulo_id, num_pagina, articulo_id, revista_id)
    values (v_revista_articulo_seq(2), 40, v_articulo_seq(5), v_revista_seq(2));

    insert into revista_articulo(revista_articulo_id, num_pagina, articulo_id, revista_id)
    values (v_revista_articulo_seq(3), 30, v_articulo_seq(5), v_revista_seq(3));

    insert into revista_articulo(revista_articulo_id, num_pagina, articulo_id, revista_id)
    values (v_revista_articulo_seq(4), 50, v_articulo_seq(5), v_revista_seq(4));

    insert into revista_articulo(revista_articulo_id, num_pagina, articulo_id, revista_id)
    values (v_revista_articulo_seq(5), 40, v_articulo_seq(3), v_revista_seq(1));

    insert into revista_articulo(revista_articulo_id, num_pagina, articulo_id, revista_id)
    values (v_revista_articulo_seq(6), 60, v_articulo_seq(3), v_revista_seq(4));

   
end;
/
show errors