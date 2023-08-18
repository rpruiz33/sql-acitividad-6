/*****************************************************************
Intro BD 2018 - Sintaxis básica de dialecto SQL MySQL:
Manual de consulta MySQL: https://dev.mysql.com/doc/refman/5.7/en/
Practica 1
******************************************************************/

-- Creación de esquema:
create schema if not exists farmacia;

-- Para mostrar los esquemas existentes en la BD:
show schemas;

-- Para eliminar un esquema:
drop schema farmacia;

-- Para establecer el esquema sobre el que trabajamos:
use farmacia;

-- Para consultar cual es el esquema en uso:
select schema();

-- Creamos la tabla obra_social en el esquema activo:
create table obra_social(
	codigo int primary key,
	nombre varchar(45) not null,
	descripcion varchar(100) not null
);

-- Para mostrar la definición de la tabla:
show create table obra_social;

-- para mostrar las tablas definidas en el esquema 
-- activo:
show tables;

-- para eliminar una tabla
drop table obra_social;

-- Para renombrar una tabla:
alter table obra_social rename to obra;
alter table obra rename to obra_social;

-- Para cambiar la columna descripcion a descr
-- (hay que indicar todos los datos de la columna):
alter table obra_social change column descripcion descr varchar(100);
alter table obra_social change column descr descripcion varchar(100);

-- Insertamos datos en la tabla:
insert into obra_social 
	values(1,"PAMI","Programa de Atención Médica Integral");
-- Intentamos insertar con la misma PK:
insert into obra_social 
	values(1,"IOMA","Instituto de Obra Medico Asistencial");

insert into obra_social (codigo, nombre, descripcion) 
	values(2,"IOMA","Instituto de Obra Medico Asistencial");

insert into obra_social (codigo, nombre, descripcion) 
	values(3,"OSECAC","Obra Social de Empleados de Comercio");

-- Consultamos los registos insertados
select * from obra_social;

/*****************************************************************
Práctica:
Hacer lo mismo para tablas calle, localidad y provincia. 
Agregar en provincia: (1, Buenos Aires) y (2, CABA) 
Agregar en localidad: (1, Lanús), (2, Pompeya), (3, Avellaneda)
Agregar en calles: (1, 9 de Julio) , (2, Hipólito Yrigoyen) , (3, Mitre), (4, Sáenz).
Para cada una  de ellas:
crearla, eliminarla, crearla nuevamente, 
cambiar el nombre y volver a cambiarlo al original.
cambiar el nombre de alguna columna y volver a cambiarlo al original,
agregar los datos especificados, 
consultar y verificar que los datos hayan ingresado.
******************************************************************/

-- actividad 6 ROBERTO ANDRES RUiZ PEREIRA  dni 37762826

-- creo las tablas correspondientes al ejercicio
create table calle(
id_calle int primary key,
nombre varchar(70) not null
);
CREATE TABLE localidad (
    id_localidad INT PRIMARY KEY,
    nombre VARCHAR(70) not null
);
CREATE TABLE provincia (
    id_provincia INT PRIMARY KEY,
    nombre VARCHAR(70) not null
);


-- inserto los valores en las tablas
insert into provincia values (1, "Buenos Aires"); 
insert into provincia values(2, "CABA");

insert into localidad values (1,"Lanús");
insert into localidad values(2, "Pompeya");
insert into localidad values(3, "Avellaneda");

insert into calle values(1,"9 de Julio"); 
insert into calle values(2,"Hipólito Yrigoyen");
insert into calle values(3,"Mitre");
insert into calle values(4,"Sáenz");

-- elimino las tablas
drop table provincia;
drop table localidad;
drop table calle;

-- modfifico los nombre de la talbla calle , provincia y localidad
alter table calle rename to rua;
alter table rua rename to calle;

alter table provincia rename to estado;
alter table estado rename to provincia;

alter table localidad rename to cidade;
alter table cidade rename to localidad;

-- cambio el nombre de la columna nombre
alter table calle change column nombre nombre_calle varchar(100);
alter table calle change column nombre_calle nombre varchar(100);

-- verifico que todas las tablas esten cargadas
select * from calle;
select * from localidad;
select * from provincia;
