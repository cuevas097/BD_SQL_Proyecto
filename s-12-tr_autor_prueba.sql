set serveroutput on
declare 

v_articulo_autor_id_seq number;

begin
	select articulo_autor_seq.nextval into v_articulo_autor_id_seq
	from dual;   

	insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
	values(v_articulo_autor_id_seq, 13, 61);

	insert into articulo_autor(articulo_autor_id, autor_id, articulo_id)
	values(v_articulo_autor_id_seq, 19, 65);

--commit

end;
/
show errors