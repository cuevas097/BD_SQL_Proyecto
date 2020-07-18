--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de sinonimos

connect cg_proy_admin/cg

--Sinonimos publicos del usuario administrador
create or replace public synonym suscriptor for cg_proy_admin;
create or replace public synonym revista for cg_proy_admin;
create or replace public synonym articulo for cg_proy_admin;

-- Permite al usuario invitado leer los sinonimos creados
grant select on articulo to cg_proy_invitado; 
grant select on revista to cg_proy_invitado; 
grant select on articulo to cg_proy_invitado; 

--Se dan privilegios para que el invitado pueda crear sinonimos
connect sys/system as sysdba
grant create public synonym to cg_proy_invitado;

connect cg_proy_invitado/cg

--Sinonimos creados por el invitado
create or replace public synonym suscriptor for cg_proy_admin.suscriptor;
create or replace public synonym revista for cg_proy_admin.revista;
create or replace public synonym articulo for cg_proy_admin.articulo;
