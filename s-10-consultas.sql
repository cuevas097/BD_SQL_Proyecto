--Mostrar el nombre, apellido paterno, vigencia, colonia
--y codigo postal de todos los suscriptores, con el titulo y la 
--fecha de envio de la revista de todas las revistas que
--sean del bimestre 06 pero no del año 2015
select s.nombre, s.ap_paterno, s.vigencia, d.colonia, d.cp,
	rs.fecha_envio, r.titulo, r.bimestre, r.anio_publicacion
from suscriptor s
join direccion d
on s.direccion_id=d.direccion_id
join revista_suscriptor rs
on s.suscriptor_id=rs.suscriptor_id
join revista r
on r.revista_id=rs.revista_id
where r.bimestre='06'
minus(
	select s.nombre, s.ap_paterno, s.vigencia, d.colonia, d.cp,
		rs.fecha_envio, r.titulo, r.bimestre, r.anio_publicacion
	from suscriptor s
	join direccion d
	on s.direccion_id=d.direccion_id
	join revista_suscriptor rs
	on s.suscriptor_id=rs.suscriptor_id
	join revista r
	on r.revista_id=rs.revista_id
	where r.anio_publicacion='2015'
);

select * from revista;
--Seleccionar el nombre de los revisores y numero de contrato
--que han calificado mas de 3 articulos pero que no
-- son editores
select e.nombre, r.numero_contrato, count(*)
from empleado e
join revisor r
on e.empleado_id = r.empleado_id
join articulo_revisor ar
on ar.empleado_id = r.empleado_id
left join editor ed
on ed.empleado_id = e.empleado_id
where e.es_editor = '0'
group by e.nombre, r.numero_contrato
having count(*)>2;

--Obtener el id del articulo, titulo y nombre del autor  
--de todos los articulos en estado recibido
select a.articulo_id, a.titulo, au.nombre
from articulo a
join articulo_autor aa
on a.articulo_id = aa.articulo_id
join autor au
on aa.autor_id = au.autor_id
where a.status_articulo_id = (
	select status_articulo_id
	from status_articulo
	where descripcion='PROGRAMADO');

--Consulta que obtiene el numero de autores que tiene cada articulo
	select ar.articulo_id, count(*)
	from articulo_autor aa
  join autor a
  on a.autor_id=aa.autor_id
  join articulo ar
  on aa.articulo_id=ar.articulo_id
  group by ar.articulo_id;


		select count(*)
		from suscriptor
    where direccion_id=5;
    
	select e.empleado_id, e.nombre, e.ap_paterno, 
		e.ap_materno, e.email, e.fecha_ingreso, 
		e.es_revisor, e.es_editor, r.numero_contrato, 
		r.fecha_fin_contrato, ed.numero_cedula, ed.maestria
	from empleado e, revisor r, editor ed
  where e.empleado_id=r.empleado_id(+)
  and e.empleado_id = ed.empleado_id(+);

select suscriptor_id, direccion_id from suscriptor;
--Conectado al usuario invitado
connect cg_proy_invitado/cg

--Muestra los datos del sinonimo suscriptor
select * from cg_proy_admin.revista;

--Muestra los datos de la vista de v_revista
select * from cg_proy_admin.v_revista;

