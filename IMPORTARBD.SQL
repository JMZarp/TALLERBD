create table temporal (
	referencia INT,
	fechaalta date,
	tipo_prop varchar(50),
	tipo_op varchar(50),
	provincia varchar(50),
	superficie INT,
	construidos INT,
	precioventa INT,
	fechaventa date,
	vendedor varchar(50),
	supervisor varchar(50),
	dueno varchar(150),
	rutdueno varchar(10),
	celulardueno varchar(50),
	emaildueno varchar(150),
	comprador varchar(150),
	rutcomprador varchar(10)

)

SET DATESTYLE TO 'European';

copy temporal from 'D:\Inmuebles.csv' CSV delimiter ';' header encoding 'Latin1'


SELECT * FROM temporal;

INSERT INTO provincias (provincia) SELECT DISTINCT provincia FROM temporal;

SELECT * FROM provincias;

UPDATE temporal SET tipo_op = 'Venta' where tipo_op = 'venta';

INSERT INTO tipos_operaciones (tipo_operacion) SELECT DISTINCT tipo_op FROM temporal;

SELECT * FROM tipos_operaciones;

SELECT distinct tipo_prop FROM temporal;

INSERT INTO tipos_propiedades (tipo_propiedad) SELECT DISTINCT tipo_prop FROM temporal;

SELECT * FROM tipos_propiedades;

SELECT distinct vendedor FROM temporal;

INSERT INTO vendedores (nombre) SELECT DISTINCT vendedor FROM temporal;

SELECT * FROM vendedores;

UPDATE vendedores SET id_supervisor = 7  where nombre = 'María' OR nombre = 'Jesús';

UPDATE vendedores SET id_supervisor = 5  where nombre = 'Carmen' OR nombre = 'Pedro';

SELECT * FROM vendedores ORDER BY id_vendedor;

SELECT distinct dueno FROM temporal;

SELECT distinct rutdueno FROM temporal;

INSERT INTO personas (rut, nombre, celular, email) SELECT distinct rutdueno, dueno, celulardueno, emaildueno FROM temporal;

SELECT * FROM personas;

















