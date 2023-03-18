/* NORMALIZACIÓN */

/* Realiza el diseño físico de:

Matricula (dni, nombres, apellidos, asignatura). Recuerda que tiene que estar normalizado.*/

CREATE DATABASE matriculas;

CREATE TABLE estudiantes(dni VARCHAR(9) PRIMARY KEY, nombre VARCHAR(30) NOT NULL, apellidos VARCHAR(30) NOT NULL);

CREATE TABLE asignatura(id SERIAL PRIMARY KEY, nombre_asignatura VARCHAR(30) NOT NULL);

CREATE TABLE matricula(dni_estudiante VARCHAR(9) REFERENCES estudiantes(dni), id_asignatura INTEGER REFERENCES asignatura(id));