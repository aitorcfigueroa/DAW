--actualiza_viaje(viaje, factor). Actualizar la duración para un viaje concreto. Es decir la nueva duración será la que tiene multiplicada por factor. Devolverá el número de viajes realizado desde la misma estación de origen
CREATE FUNCTION actualiza_viaje(viaje INTEGER, factor INTEGER) 
RETURNS INTEGER AS
$$
DECLARE
    num_viajes INTEGER;
BEGIN
    UPDATE trips
    SET duration = duration * factor
    WHERE id = viaje;

    SELECT COUNT(*)
    INTO num_viajes
    FROM trips
    WHERE start_station = (
        SELECT start_station
        FROM trips
        WHERE id = viaje
    );

    RETURN num_viajes;
END;
$$ 
LANGUAGE plpgsql;

--contar_viajes_mes(mes, referencia). Devuelve un entero con los viajes que se hicieron en un mes concreto (siendo 1 - enero y 12 - diciembre). Lanzará también un aviso en consola (RAISE NOTICE) clasificándolo en pocos / normal / muchos. El umbral de decisión será de 0,25 el valor de referencia (para pocos), 0,5 para normal y 0,75 muchos
CREATE FUNCTION contar_viajes_mes(mes INTEGER, referencia INTEGER) 
RETURNS INTEGER AS
$$
DECLARE
    num_viajes INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO num_viajes
    FROM trips
    WHERE EXTRACT(MONTH FROM start_time) = mes;

    IF num_viajes <= 0.25 * referencia THEN
        RAISE NOTICE 'Pocos viajes';        
    ELSIF num_viajes >= 0.75 * referencia THEN
        RAISE NOTICE 'Muchos viajes';
    ELSE
        RAISE NOTICE 'Número normal de viajes';
    END IF;

    RETURN num_viajes;
END;
$$ 
LANGUAGE plpgsql;

--borra_y_guarda(id). Crea una función que borre el viaje con ese id. Además guardará en un log (tabla viajes_borrados) un registro del tipo «El usuario $U borró el viaje $V», además el timestamp del borrado
CREATE FUNCTION borra_y_guarda(id INTEGER) 
RETURNS VOID AS
$$
DECLARE
    usuario TEXT;
    mensaje TEXT;
BEGIN
    SELECT current_user INTO usuario;

    DELETE FROM trips WHERE trip_id = id;

    mensaje := 'El usuario ' || usuario || ' borró el viaje ' || id;

    INSERT INTO viajes_borrados (mensaje, timestamp)
    VALUES (mensaje, current_timestamp);
END;
$$ 
LANGUAGE plpgsql;
