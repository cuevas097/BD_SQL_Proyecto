--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de vistas

-- Vista que muestra el titulo del articulo, su sinopsis,
-- la revista en la que aparece y su pagina
create or replace view v_articulo(
	titulo_art, sinopsis, num_pagina, titulo_rev
) as select a.titulo, a.sinopsis, ra.num_pagina, r.titulo
	from articulo a, revista_articulo ra, revista r
	where a.articulo_id=ra.articulo_id
	and r.revista_id=ra.revista_id;


--Vista que no permite ver el numero de copias hechas y vendidas
create or replace view v_revista(
	titulo, fecha_publicacion, bimestre, anio_publicacion
) as select titulo, fecha_publicacion, bimestre, anio_publicacion
	from revista;

--Vista que no permite mostrar el numero de cedula de un editor
create or replace view v_empleado(
	empleado_id, nombre, ap_paterno, ap_materno, email,
	fecha_ingreso, es_revisor, es_editor, maestria_doctorado
) as select e.*, ed.maestria
	from empleado e, editor ed
	where e.empleado_id=ed.empleado_id;

--Permisos de lectura para las dos ultimas vistas
grant select on cg_proy_admin.v_revista to cg_proy_invitado; 

grant select on cg_proy_admin.v_empleado to cg_proy_invitado; 
