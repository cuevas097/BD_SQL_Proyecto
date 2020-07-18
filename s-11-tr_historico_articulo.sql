--Trigger que actualiza de forma automatica el historico del articulo
create or replace trigger tr_historico_articulo
after insert or update of status_articulo_id on articulo
for each row
declare
v_status_id articulo.status_articulo_id%type;
v_fecha_status articulo.fecha_status%type;
v_historico_id historico_articulo.historico_articulo_id%type;
v_articulo_id articulo.articulo_id%type;

begin

	select historico_articulo_seq.nextval 
	into v_historico_id from dual;

	v_status_id := :new.status_articulo_id;
	v_fecha_status := :new.fecha_status;
	v_articulo_id := :new.articulo_id;

	dbms_output.put_line('Status anterior: '|| :old.status_articulo_id);
	dbms_output.put_line('Status nuevo: '|| :new.status_articulo_id);
	dbms_output.put_line('Insertando en historico, articulo_id: '
	|| v_articulo_id ||', status_id: ' || v_status_id
	||', fecha: '|| v_fecha_status||', historico_articulo_id: '||v_historico_id);

	-- inserta en el histórico
	insert into historico_articulo(historico_articulo_id, fecha_status,
			status_articulo_id,articulo_id)
	values(v_historico_id, v_fecha_status, v_status_id, v_articulo_id);
end;
/
show errors