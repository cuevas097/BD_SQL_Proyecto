--Procedimiento que ingresa valores en una tabla temporal
--y regresa el numero de registros agregados
create or replace procedure p_tabla_temporal(
	p_num_registros out number
)
is
v_empleado_temp_id empleado_temp.empleado_temp_id%type;
v_nombre empleado_temp.nombre%type; 
v_ap_paterno empleado_temp.ap_paterno%type;
v_ap_materno empleado_temp.ap_materno%type;
v_email empleado_temp.email%type;
v_fecha_ingreso empleado_temp.fecha_ingreso%type;
v_es_revisor empleado_temp.es_revisor%type;
v_es_editor empleado_temp.es_editor%type;
v_numero_contrato empleado_temp.numero_contrato%type;
v_fecha_fin_contrato empleado_temp.fecha_fin_contrato%type;
v_numero_cedula empleado_temp.numero_cedula%type;
v_maestria empleado_temp.maestria%type;

cur_resultado sys_refcursor;

cursor cur_obtener_datos is
	select e.empleado_id, e.nombre, e.ap_paterno, 
		e.ap_materno, e.email, e.fecha_ingreso, 
		e.es_revisor, e.es_editor, r.numero_contrato, 
		r.fecha_fin_contrato, ed.numero_cedula, ed.maestria
	from empleado e, revisor r, editor ed
  	where e.empleado_id=r.empleado_id(+)
  	and e.empleado_id = ed.empleado_id(+);

begin
	open cur_obtener_datos;
    loop

        fetch cur_obtener_datos into v_empleado_temp_id, v_nombre,v_ap_paterno, v_ap_materno, v_email,v_fecha_ingreso, 
            v_es_revisor, v_es_editor, v_numero_contrato, v_fecha_fin_contrato, v_numero_cedula, v_maestria;
        exit when cur_obtener_datos%notfound;

        execute immediate  'insert into empleado_temp(empleado_temp_id, nombre, ap_paterno, ap_materno, email, 
        	fecha_ingreso, es_revisor, es_editor, numero_contrato, fecha_fin_contrato, numero_cedula, maestria)
            values(:ph_empleado_temp_id, :ph_nombre, :ph_ap_paterno, :ph_ap_materno, :ph_email, :ph_fecha_ingreso, 
            :ph_es_revisor, :ph_es_editor, :ph_numero_contrato, :ph_fecha_fin_contrato, :ph_numero_cedula, 
            :ph_maestria)'
            using v_empleado_temp_id, v_nombre,v_ap_paterno, v_ap_materno, v_email,v_fecha_ingreso, 
            v_es_revisor, v_es_editor, v_numero_contrato, v_fecha_fin_contrato, v_numero_cedula,
            v_maestria;
   end loop;

	open cur_resultado for 'select * from resultado_reporte'; 

	p_num_registros := cur_obtener_datos%rowcount;
end;
/
show errors
