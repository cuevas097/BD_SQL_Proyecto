--Procedimiento que ingresa un nuevo articulo con sus respectivas tablas 
create or replace procedure p_articulo_nuevo(
	p_titulo in varchar2, p_sinopsis in varchar2,
	p_area_interes in varchar2,p_area_interes_descripcion in number, 
	p_autor_nombre in varchar2, p_articulo_id out number) is
	
	v_area_interes_id area_interes.area_interes_id%type;
	v_autor_id autor.autor_id%type;

begin
	select articulo_seq.nextval into v_articulo_id
	from dual;

	--Se obtiene el id del area de interes
	select area_interes_id
	into v_area_interes_id
	from area_interes
	where descripcion = p_area_interes_descripcion;

	--Se obtiene id del autor, sino existe se deja como null
	select autor_id
	into v_autor_id
	from autor
	where nombre = p_autor_nombre;

	--Se ingresa los datos a todas las tablas correspondientes

	insert into articulo(articulo_id, folio_art, titulo, 
		sinopsis, area_interes_id)
		values(v_articulo_id, 'emplear funcion', p_titulo, p_sinopsis,
			v_area_interes_id);

	insert into art_pdf(articulo_id, clave)
		values(v_articulo_id, 'A1');

	insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
		values(101, v_autor_id, v_articulo_id);

end;
/
show errors