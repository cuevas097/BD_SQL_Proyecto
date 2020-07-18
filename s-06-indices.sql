--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de indices

--Indice non unique para las llaves foraneas de la tabla articulo
creat index ar_articulo_ix
on articulo(area_interes_id, status_articulo_id, empleado_id);

--Indice para verificar la unicidad de la columna clave en la tabla de area_interes
create unique index area_interes_clave_uik
on area_interes(clave)

--Indice que valida unicidad considerando las posibles combinaciones de valores entre los campos empleado_id y num_cedula
create index editor_num_cedula
on editor(empleado_id, num_cedula);

--Indice para la columna transformando los valores a minusculas
create index autor_ap_paterno_ix on autor(lower(ap_paterno));
