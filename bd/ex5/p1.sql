/* CREACIÓN DE UNA BD */

/* Crea una base de datos llamada ejemplo */
CREATE DATABASE ejemplo;

/* Crea el esquema esq1 */
CREATE SCHEMA esq1;

/* Añade la tabla1 que guardará el dni y nombre de una persona. tabla1 estará en el esquema esq1 */
CREATE TABLE esq1.tabla1(dni VARCHAR(9) NOT NULL PRIMARY KEY, nombre VARCHAR(30) NOT NULL);

/* Añade la tabla2 que guardará el id de un pedido y el dni (que será una clave ajena a tabla1(dni). */
CREATE TABLE tabla2(id SERIAL PRIMARY KEY, dni VARCHAR(9) NOT NULL);
ALTER TABLE tabla2 ADD FOREIGN KEY(dni) REFERENCES esq1.tabla1(dni);

/* Añádele el campo edad a tabla1. Y añade la restricción de que el valor sea entre 0 y 99 */
ALTER TABLE esq1.tabla1 ADD COLUMN edad INTEGER NOT NULL CHECK (edad > 0 AND edad < 99);

/* Añádele el campo precio a tabla2. Que al menos guarde 4 dígitos decimales de precisión y hasta 9999 de valor sin decima */
ALTER TABLE table2 ADD COLUMN precio NUMERIC(8,4) NOT NULL;
