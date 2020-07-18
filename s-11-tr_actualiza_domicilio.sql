--Trigger que permite la correcta actualizacion de 
--la direccion de un suscriptor

create or replace trigger tr_actualiza_domicilio
for update of direccion_id on suscriptor
compound trigger

type direcciones_id is varray(10) of suscriptor.direccion_id%type;

v_indice number(2, 0):= 0;
v_total_suscriptor number(2, 0):= 0;
v_direccion direcciones_id := direcciones_id(0,0,0,0,0,0,0,0,0,0);

after each row is

begin 
	v_indice := v_indice +1;
	v_direccion(v_indice) := :old.direccion_id;
end after each row;

after statement is

begin
	for i in 1 .. v_indice loop
		select count(*)
		into v_total_suscriptor
		from suscriptor
		where direccion_id = v_direccion(i);
		
		if v_total_suscriptor = 0 then
			dbms_output.put_line('Se elimina direccion.');
			delete from direccion where direccion_id = v_direccion(i);
		end if;
	end loop;
end after statement;

end tr_actualiza_domicilio;
/
show errors

