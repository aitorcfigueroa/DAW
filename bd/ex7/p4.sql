--act_duracion_t. Al actualizar un viaje, comprobará que al menos la duración es de 20 segundos. Si no lo es, lo actualizará para que sea ese valor
CREATE FUNCTION actualizar_duracion()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.duration < 20 THEN
        NEW.duration = 20;
    END IF;

    RETURN NEW;
END;
$$ 
LANGUAGE plpgsql;

CREATE TRIGGER act_duracion_t
BEFORE UPDATE ON trips
FOR EACH ROW
EXECUTE FUNCTION actualizar_duracion();

--check_municipio_t. Cuando se actualice el municipio de una estación, garantizará que sea de un municipio que esté previamente en la tabla. En el caso de que no exista ese municipio previamente no se aceptarán municipios nuevos.
CREATE FUNCTION check_municipio()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.municipality IS NOT NULL THEN
        IF NOT EXISTS (
            SELECT 1
            FROM stations
            WHERE municipality = NEW.municipality
        ) THEN
            RAISE EXCEPTION 'El municipio especificado no existe.';
        END IF;
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER check_municipio_t
BEFORE UPDATE ON stations
FOR EACH ROW
EXECUTE FUNCTION check_municipio();
