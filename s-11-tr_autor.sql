--Trigger para la regla de negocio que indica que un articulo no
--puede tener mas de tres autores

create or replace trigger tr_autor
before insert on articulo_autor
for each row
declare
v_total number;
begin
	
	select count(*)
	into v_total
	from articulo_autor aa
  	join autor a
  	on a.autor_id=aa.autor_id
  	join articulo ar
  	on aa.articulo_id=ar.articulo_id
  	where aa.articulo_id = :new.articulo_id
	group by ar.articulo_id;
	dbms_output.put_line(v_total);
	

	if v_total+1 < 4 then
		v_total := v_total+1;
		dbms_output.put_line('El numero de autor(es) es: '||v_total);
		
	else
		raise_application_error(-20001, 'numero de autores superado');
	end if;
end;
/
show errors
