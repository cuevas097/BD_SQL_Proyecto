--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de bloque anonimo para crear sinonimos

--Se conectar a usuario administrador
connect cg_proy_admin/cg

--Creacion de bloque anonimo
declare
--declaracion del cursor para obtener el nombre de todas las
--tablas del usuario administrador
cursor cur_nombre_tablas is
select table_name from user_tables;

v_tabla_nombre varchar2(40);
v_nuevo_nombre varchar2(40);

begin
	open cur_nombre_tablas;
	loop
		fetch cur_nombre_tablas into v_tabla_nombre;
		exit when cur_nombre_tablas%notfound;

		v_nuevo_nombre:= 'xx_'||v_tabla_nombre;

		execute immediate 'create or replace synonym '
		||v_nuevo_nombre||' for cg_proy_admin';

	end loop;
	close cur_nombre_tablas;

end;
/
show errors