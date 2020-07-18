set serveroutput on

begin
	update suscriptor set direccion_id = 2
		where suscriptor_id = 7;
--commit

end;
/
show errors