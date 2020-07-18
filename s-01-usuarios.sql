--@Autores:          Carlos Cuevas, Lisset Galindo 
--@Fecha creacion:   07-06-18
--@Descripcion:      Definicion de usuarios

connect sys/system as sysdba

--Creacion de usuarios
create user cg_proy_invitado identified by cg
quota unlimited on users;

create user cg_proy_admin identified by cg
quota unlimited on users;

--Creacion de roles
create role rol_admin;
create role rol_invitado;

--Definición de privilegios de roles
grant create session, create table, create view,
create synonym, create procedure, create trigger, 
create sequence, create public synonym
to rol_admin;

grant create session
to rol_invitado;

--Asignacion de roles
grant rol_admin to cg_proy_admin;
grant rol_invitado to cg_proy_invitado;


--Conectando como sys
connect sys/system as sysdba

--Se crea directorio tmp_dir que sera usado en carios scripts
create or replace directory tmp_dir as '/tmp';

--Permisos para que el usuario pueda leer el contenido del directorio
grant read, write on directory tmp_dir to cg_proy_admin;
