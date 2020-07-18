
create or replace function folio(v_articulo_id number) 
	return varchar2
is

v_folio varchar2(18);
begin
     v_folio:='MAT'||to_char(v_articulo_id, '000999')||to_char(sysdate,'yyyymmdd');
     return v_folio;
end;
/
show errors;
