--suma(n1,n2,n3). Crea una función que sume los dos primeros argumentos, y lo multiplique por un tercero. Los argumentos serán enteros.
CREATE FUNCTION suma(n1 integer, n2 integer, n3 integer)
RETURNS integer AS
$$
SELECT (n1 + n2) * n3;
$$
LANGUAGE SQL;

--actualizar_bicis(codigo). Sobre la BD Hubway, quiero cambiar todos los valores de los códigos de las bicis que están a null, con un valor que yo quiero escoger. Por ejemplo actualizar_bicis('000000').
CREATE FUNCTION actualizar_bicis(codigo TEXT)
RETURNS VOID AS
$$
UPDATE trips SET bike_number = codigo WHERE bike_number IS NULL;
$$
LANGUAGE SQL

--duracion_viaje(id,tipo). Necesito saber la duración de un viaje, en minutos o en horas, según el parámetro sea M o H. Por ejemplo duracion_viaje(4300,'M')
CREATE FUNCTION duracion_viaje(trip_id INTEGER, tipo VARCHAR(1)) 
RETURNS VARCHAR AS
$$
    SELECT
        CASE
            WHEN tipo = 'M' THEN EXTRACT(EPOCH FROM (end_time - start_time)) / 60 || ' minutos'
            WHEN tipo = 'H' THEN EXTRACT(EPOCH FROM (end_time - start_time)) / 3600 || ' horas'
            ELSE 'Tipo de duración inválido. Debe ser M para minutos o H para horas.'
        END
    FROM trips
    WHERE id = trip_id;
$$ 
LANGUAGE SQL;
