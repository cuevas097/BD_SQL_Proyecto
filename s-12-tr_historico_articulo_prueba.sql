set serveroutput on
declare v_articulo_id_seq numeric;
begin
select articulo_seq.nextval into v_articulo_id_seq
from dual;   

insert into articulo(articulo_id, folio_art, titulo, 
	sinopsis, fecha_status, area_interes_id, 
	status_articulo_id, empleado_id)
values(v_articulo_id_seq, folio(v_articulo_id_seq), 'Linux for all',
'Es un articulo principios de linux', sysdate, 3,
4, 25);

--commit

end;
/
show errors