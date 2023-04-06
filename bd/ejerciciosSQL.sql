/* Con la tabla «stations» */

/* ¿Cuánto es 25 * 8? */
SELECT 25 * 8;

/* Pero ponle el nombre al campo, que diga «Cálculo» */
SELECT 25 * 8 AS Cálculo;

/* Muestra todos los registros de la tabla stations */
SELECT * FROM stations;

/* Muestra el id y station de la tabla stations */
SELECT id, station FROM stations;

/* Muestra el registro con id = 3 */
SELECT * FROM stations WHERE id = 3;

/* Muestra los registros con un id entre 5 y 8 */
SELECT * FROM stations WHERE id > 5 AND id < 8; /* result not include 5 and 8 */
SELECT * FROM stations WHERE id BETWEEN 5 AND 8; /* result include 5 and 8 */

/* Muestra los registros con el id 8, 25, 60 y 130 */
SELECT * FROM stations WHERE id = 8 OR id = 25 OR id = 60 OR id = 130;
SELECT * FROM stations WHERE id IN (8, 25, 60, 130);

/* Muestra los registros cuyo id no esté entre 4 y 140 */
SELECT * FROM stations WHERE id < 4 OR id > 140; /* result not include 4 and 140 */
SELECT * FROM stations WHERE id NOT BETWEEN 4 AND 140; /* result not include 4 and 140 */

/* ¿Y cuales serían los id, station y municipios para las station que empiezan por L? */
SELECT id, station, municipality FROM stations WHERE station LIKE 'L%';

/* ¿Y los que empiezan por L, seguidos de cualquier caracter y luego una n? */
SELECT id, station, municipality FROM stations WHERE station LIKE 'L_n%';

/* Muestra las estaciones ordenadas por municipality, de forma descendente */
SELECT * FROM stations ORDER BY municipality DESC;

/* Y que ponga «Ayuntamiento» en vez de «municipality» en el encabezado */
SELECT station, municipality AS Ayuntamiento FROM stations ORDER BY Ayuntamiento DESC;

/* Muestra sólo 5 registros de la tabla */
SELECT station, municipality AS Ayuntamiento FROM stations ORDER BY Ayuntamiento DESC LIMIT 5;

/* ¿Cuales serían los 5 registros con el mayor valor de id? */
SELECT * FROM stations ORDER BY id DESC LIMIT 5;

/* ¿Cual es el máximo valor de id? */
SELECT MAX(id) FROM stations;

/* ¿Y el mínimo valor de lat (latitud)? */
SELECT MIN(lat) FROM stations;

/* ¿Cual es la station que está más al sur? */
SELECT * FROM stations ORDER BY lat ASC LIMIT 1;

/* ¿Cual es el valor medio de latitud? */
SELECT AVG(CAST(lat AS FLOAT)) FROM stations;

/* Muestra una tabla con municipality y el número de stations en cada una */
SELECT municipality, COUNT(station) FROM stations GROUP BY municipality;

/* Muestra la tabla anterior, pero ordenada de mayor a menor cantidad de estaciones */
SELECT municipality, COUNT(station) num_stations FROM stations GROUP BY municipality ORDER BY num_stations DESC;

/* ¿Qué municipio es el que tiene mayor número de estaciones? */
SELECT municipality, COUNT(station) num_stations FROM stations GROUP BY municipality ORDER BY num_stations DESC LIMIT 1;

/* Muestra los municipios que al menos tienen 25 estaciones */
SELECT municipality, COUNT(station) num_stations FROM stations GROUP BY municipality HAVING COUNT(station) > 24 ORDER BY num_stations DESC;

/* Muestra los municipios, y la cantidad de estaciones. Pero sólo los municipios que su nombre empieza por B */
SELECT municipality, COUNT(station) FROM stations WHERE municipality LIKE 'B%' GROUP BY municipality;

/* Muestra los municipios con la cantidad de estaciones que tienen. Pero sólo los municipio cuyo nombre empieza por B y las estaciones que empiezan por L */
SELECT municipality, COUNT(station) num_stations FROM stations WHERE municipality LIKE 'B%' AND station LIKE 'L%' GROUP BY municipality;

/* Muestrame una tabla, con un solo valor que se llame «Texto» y que diga «El municipio $municipality tiene $stations estaciones de alquiler». Sustituyendo $municipality y $stations por los valores de los campos correspondientes. */
SELECT 'El municipio ' || municipality || ' tiene ' || COUNT(station) || ' estaciones de alquiler.' AS Texto FROM stations GROUP BY municipality;

/* Con la tabla «trips» */

/* ¿Cuanto duró el viaje más largo? */
SELECT MAX(duration) FROM trips;

/* ¿Y el más corto? */
SELECT MIN(duration) FROM trips WHERE duration > 0;

/* ¿Cuantos viajes se han realizado? */
SELECT COUNT(*) FROM trips;

/* ¿Cual es la media de la duración de los viajes? */
SELECT AVG(duration) FROM trips;

/* Y si tienes en cuenta sólo los viajes reales (supongamos que son los que duran más de 1 minuto) */
SELECT AVG(duration) FROM trips WHERE duration > 60;

/* Y la media, de los viajes reales, pero en minutos, sin decimales y con encabezado «Duración» */
SELECT ROUND(AVG(duration)/60) AS Duración FROM trips WHERE duration > 60;

/* ¿Cuantos viajes ha realizado la bicicleta B00550? */
SELECT COUNT(*) FROM trips WHERE bike_number LIKE 'B00550';

/* ¿Cuántas bicicletas hay registradas? */
SELECT COUNT(DISTINCT bike_number) FROM trips;

/* ¿Puedes mostrarme una tabla con las bicicletas y el número de viajes que han realizado? */
SELECT bike_number, COUNT(*) FROM trips GROUP BY bike_number;

/* ¿Puedes mostrarme una tabla con las 10 bicicletas con más viajes nulos realizados (los de menos de 60 segundos? */
SELECT bike_number, COUNT(*) FROM trips WHERE duration < 60 GROUP BY bike_number ORDER BY COUNT(*) DESC LIMIT 10;

/* ¿Cual es la bicicleta que más se ha usado? */
SELECT bike_number, COUNT(*) FROM trips GROUP BY bike_number ORDER BY COUNT(*) DESC LIMIT 1;

/* ¿Qué bicicletas han sido usadas en más de 2.000 viajes? */
SELECT bike_number, COUNT(*) FROM trips GROUP BY bike_number HAVING COUNT(*) > 2000;

/* ¿Qué bicicletas han sido usadas en más de 2.000 viajes de al menos 3 minutos? */
SELECT bike_number, COUNT(*) FROM trips WHERE duration > 180 GROUP BY bike_number HAVING COUNT(*) > 2000;

/* ¿Quienes usan más el servicio, los hombres o las mujeres? */
SELECT gender, COUNT(*) FROM trips WHERE gender IS NOT NULL GROUP BY gender;

/* ¿Cual es la media de los viajes de hombres mayores de 30 años? */
SELECT AVG(duration) FROM trips WHERE gender = 'Male' AND birth_date IS NOT NULL AND (2023 - birth_date) > 30;