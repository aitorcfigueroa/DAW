/* NORMALIZACIÓN */

/* Realiza el diseño físico de:

Recuerdos(idFoto, idPersona, nombre, dni, títuloFoto, fecha, monumento, ciudad, antigüedadMonumento). Recuerda que tiene que estar normalizado. */

CREATE DATABASE recuerdos;

CREATE TABLE personas(dni VARCHAR(9) PRIMARY KEY, nombre VARCHAR(30) NOT NULL);

CREATE TABLE monumentos(idMonumento SERIAL PRIMARY KEY, nombre_monumento VARCHAR(30) NOT NULL, ciudad VARCHAR(30) NOT NULL, antigüedadMonumento TIMESTAMP NOT NULL)

CREATE TABLE fotos(idFoto SERIAL PRIMARY KEY, títuloFoto VARCHAR(30) NOT NULL, fecha TIMESTAMP NOT NULL, monumento INTEGER REFERENCES monumentos(idMonumento));

CREATE TABLE recuerdos(idFoto INTEGER REFERENCES fotos(idFoto), persona VARCHAR(9) REFERENCES personas(dni));