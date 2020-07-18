set serveroutput on
declare
	v_registros number;
begin
	p_tabla_temporal(v_registros);
	dbms_output.put_line('El total de registros es:'||v_registros);
	commit;

end;
/
show errors